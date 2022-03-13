package com.cep.forecast.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cep.forecast.service.ForecastService;
import com.cep.forecast.vo.ForecastBiddingFileVO;
import com.cep.forecast.vo.ForecastBiddingVO;
import com.cep.forecast.vo.ForecastSearchVO;
import com.cep.forecast.vo.ForecastVO;
import com.cmm.config.AuthInfo;
import com.cmm.service.AlarmService;
import com.cmm.service.ComService;
import com.cmm.service.FileMngService;
import com.cmm.util.CepDateUtil;
import com.cmm.util.CepDisplayUtil;
import com.cmm.util.CepStringUtil;
import com.cmm.vo.DepartmentVO;
import com.cmm.vo.FileVO;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping(value="/forecast")
public class ForecastController {
	private static final Logger logger = LoggerFactory.getLogger(ForecastController.class);
	
	@Resource(name="forecastService")
	private ForecastService service;
	
	@Resource(name="comService")
	private ComService  comService;
	
	@Resource(name="fileMngService")
	private FileMngService fileMngService;
	
	@Resource(name="alarmService")
	private AlarmService alarmService;
	
	@Value("#{comProps['maxFileCnt']}")
	private String maxFileCnt;	// 허용 파일 개수
	
	@Value("#{comProps['maxFileSize']}")
	private String maxFileSize;	// 허용 파일 사이즈
	
	@Value("#{comProps['fileExtn']}")
	private String fileExtn;			// 허용 파일 확장자
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/list.do")
	public String selectForecast(@ModelAttribute("searchVO") ForecastSearchVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("searchVO.spState()        :: {}", searchVO.getPjFlag());
		logger.debug("searchVO.getSpState()     :: {}", searchVO.getSpState());
		logger.debug("searchVO.getSearchFlag()  :: {}", searchVO.getSearchFlag());
		logger.debug("searchVO.getSearchValue() :: {}", searchVO.getSearchValue());
		
		try{
		
			if(searchVO.getSearchFlag() == null 
			|| searchVO.getSearchFlag().equals("")
			|| !searchVO.getSearchFlag().equals("SE"))
			{
				HashMap<String, String> sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
				String empAuthCd = request.getSession().getAttribute("empAuthCd").toString();
				
				searchVO.setDeptLevel(2);
				
				// 최초 조회 시 자신의 건만 보이게...
				if(!"".equals(CepStringUtil.getDefaultValue(empAuthCd, "")) && 
						!empAuthCd.equals(AuthInfo.AUTH_ADMIN.getValue()) && 
						"".equals(CepStringUtil.getDefaultValue(searchVO.getDeptKey(), ""))) {
					searchVO.setSalesEmpKey(sessionMap.get("empKey"));
					model.put("empKey", sessionMap.get("empKey"));
				}
			}
			
			model.put("employeeList", comService.selectEmployeeList());
			
			model.put("departmentList", comService.selectDepartmentList(searchVO));
			
			model.put("forecastList", service.selectForecastList(searchVO));
			
			model.put("displayUtil", new CepDisplayUtil());
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "forecast/list";
	}
	
	@RequestMapping(value="/select/fundInfo.do")
	@ResponseBody
	public Map<String, Object> selectFundInfo(@ModelAttribute("forecastVO") ForecastVO forecastVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			returnMap.put("salesInfo", service.selectSalesInfo(forecastVO));
			returnMap.put("pcInfo", service.selectPcInfo(forecastVO));
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/delete.do")
	@ResponseBody
	public Map<String, Object> delete(@ModelAttribute("forecastVO") ForecastVO forecastVO, HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		logger.debug(":::::: SP_KEY ======= {}", forecastVO.getSpKey());
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			
			service.delete(request, forecastVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap; 
	}
	
	// 임시(수주 등록, 1차 오픈 시에만 사용)
	@RequestMapping(value="/changeStatus.do")
	@ResponseBody
	public Map<String, Object> toProject(@ModelAttribute("forecastVO") ForecastVO forecastVO, HttpServletRequest request) throws Exception {
		
		logger.debug(":::::: SP_KEY ======= {}", forecastVO.getSpKey());
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			
			service.changeStatus(request, forecastVO);
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap; 
	}
	
	
	//Forecast 기본정보 등록
	@RequestMapping(value="/write/basic.do")
	public String addBasic(@ModelAttribute("forecastVO") ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		try {
			
			logger.debug("spKey : {}", forecastVO.getSpKey() );
			
	//		forecastVO.setSpKey("SP210013");
			
			model.put("spKey", forecastVO.getSpKey());
			
			if(forecastVO != null && forecastVO.getSpKey() != null && !forecastVO.getSpKey().equals(""))
			{
				logger.debug("111 spKey : {}", forecastVO.getSpKey() );
				//수정으로 판단하고 기존 등록된 내용을 조회하여 화면에 전달
				ForecastVO lvoForecast = service.selectForecast(forecastVO);
				
				//logger.debug("111 acKey : {}", lvoForecast.getAcKey() );
				
				/*if(!CepStringUtil.getDefaultValue(lvoForecast.getAcKey(), "").equals(""))
				{*/
					model.addAttribute("forecast", lvoForecast);
					model.addAttribute("salesList", service.selectSalesInfo(forecastVO));
					model.addAttribute("pcList", service.selectSalesInfo(forecastVO));
				/*}*/
			}
			
			model.put("displayUtil", new CepDisplayUtil());
		}
		catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "forecast/write/basic";
	}
	
	@RequestMapping(value="/write/fundInfo.do")
	public String addFundInfo(@ModelAttribute("forecastVO") ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		logger.debug("spKey : {}", forecastVO.getSpKey() );
		
		try {
			model.put("displayUtil", new CepDisplayUtil());
			model.put("spKey", forecastVO.getSpKey());
			
			if(forecastVO.getSpKey() != null || !forecastVO.getSpKey().equals(""))
			{
				//수정으로 판단하고 기존 등록된 내용을 조회하여 화면에 전달
				// ForecastVO lvoForecast = service.selectForecast(forecastVO);
				List<EgovMap> salesList = service.selectSalesInfo(forecastVO);
				List<EgovMap> pcList = service.selectPcInfo(forecastVO);
				
				/*if(lvoForecast != null)
				{
					if( lvoForecast.getAcKey() != null || !lvoForecast.getAcKey().equals(""))
					{
						logger.debug("lvoForecast.getAcKey() : {}", lvoForecast.getAcKey());*/
				model.addAttribute("salesList", salesList);
				model.addAttribute("pcList", pcList);
				model.addAttribute("forecast", service.selectForecast(forecastVO));
					/*}
				}*/
			}
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "forecast/write/fundInfo";
	}
	
	/**
	  * @Method Name : writeFundInfo
	  * @Cdate       : 2021. 1. 20.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description : Forecast - 매출/입 정보 저장
	  * @param forecastVO
	  * @param model
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value="/write/writeFundInfo.do")
	@ResponseBody
	public Map<String, Object> writeFundInfo(HttpServletRequest request, @RequestBody ForecastVO forecastVO, ModelMap model) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("forecastVO.getFcBuyAmount()     :: {}", forecastVO.getFcBuyAmount());
		logger.debug("forecastVO.getFcSalesAmount()   :: {}", forecastVO.getFcSalesAmount());
		logger.debug("forecastVO.getFcSalesDtYr()     :: {}", forecastVO.getFcSalesDtYr());
		logger.debug("forecastVO.getFcSalesDtMt()     :: {}", forecastVO.getFcSalesDtMt());
		
		try
		{
			service.writeFundInfo(request, forecastVO);
			
		}
		catch(Exception e)
		{
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
	}
	
	@RequestMapping(value="/write/progress.do")
	public String addProgress(@ModelAttribute("forecastVO") ForecastVO forecastVO, ModelMap model) throws Exception {
		
		/*model.addAttribute("forecastList", service.selectList(exampleVO));*/
		
		try{
			
			logger.debug("spKey : {}", forecastVO.getSpKey() );
			model.put("spKey", forecastVO.getSpKey());
			
			try
			{
				model.put("spKey", forecastVO.getSpKey());
				if(forecastVO != null && forecastVO.getSpKey() != null && !forecastVO.getSpKey().equals(""))
				{
					//수정으로 판단하고 기존 등록된 내용을 조회하여 화면에 전달
					ForecastVO lvoForecast = service.selectForecast(forecastVO);
					
					if(lvoForecast != null)
					{
						logger.debug("lvoForecast.getAcKey() : {}", lvoForecast.getAcKey());
						logger.debug("lvoForecast.getRemark() : {}", lvoForecast.getRemark());
						
						model.addAttribute("forecast", lvoForecast);
					}
				}

			}
			catch(Exception e)
			{
				logger.error("{}", e);
				throw e;
			}
			
		
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "forecast/write/progress";
	}
	
	@RequestMapping(value="/write/biddingInfo.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewAddBiddingInfo(HttpServletRequest request, ForecastBiddingFileVO forecastBiddingFileVO, ModelMap model) throws Exception {
		
		List<?> biddingFileList = null;
		List<?> fileResult = null;
		FileVO fileVO = new FileVO();
		
		String spKey = forecastBiddingFileVO.getSpKey();
		model.addAttribute("spKey", spKey);
		
		ForecastBiddingVO biddingVO = service.selectBiddingDetail(forecastBiddingFileVO);
		model.addAttribute("biddingVO", biddingVO);
		
		if(biddingVO != null) {
			forecastBiddingFileVO.setBdKey(biddingVO.getBdKey());
			biddingFileList = service.selectBiddingFileList(forecastBiddingFileVO);
		}
		model.addAttribute("biddingFileList", biddingFileList);
		
		fileVO.setFileCtKey(spKey);
		fileVO.setFileWorkClass(forecastBiddingFileVO.getWorkClass());
		
		fileResult = fileMngService.selectFileList(fileVO);
		
		model.addAttribute("forecast", service.selectForecast(forecastBiddingFileVO));
		
		model.put("displayUtil", new CepDisplayUtil());
		model.addAttribute("fileList", fileResult);
		model.addAttribute("maxFileCnt", maxFileCnt);
		model.addAttribute("fileExtn", fileExtn);
		model.addAttribute("maxFileSize", maxFileSize);
		
		return "forecast/write/biddingInfo";
	}
	
	@RequestMapping(value="/write/writeBiddingInfo.do")
	public @ResponseBody Map<String, Object> addBiddingInfo(HttpServletRequest request, @RequestBody ForecastBiddingVO forecastBiddingVO) throws Exception {
		Map<String, Object> returnMap = null;
		returnMap = service.writeBiddingInfo(request, forecastBiddingVO);
		
	   	return returnMap;
	}
	
	@RequestMapping(value="/requestBiddingDoc.do")
	public @ResponseBody Map<String, Object> requestBiddingDoc(HttpServletRequest request, @RequestBody ForecastBiddingVO forecastBiddingVO) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap = service.requestBiddingDoc(request, forecastBiddingVO);
		
		return returnMap;
	}
	
	
	/**
	  * @Method Name : writeProgress
	  * @Cdate       : 2021. 1. 20.
	  * @Author      : ynk
	  * @Modification: 
	  * @Method Description : Forecast 진행사항 등록
	  * @param forecastVO
	  * @param model
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value="/write/writeProgress.do")
	@ResponseBody
	public Map<String, Object> writeProgress(HttpServletRequest request, @RequestBody ForecastVO forecastVO, ModelMap model) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("forecastVO.getPmDetail2()  :: \n{}", forecastVO.getPmDetail2());
		logger.debug("forecastVO.getRemark()     :: \n{}", forecastVO.getRemark());
		
		try
		{
			service.updateProgress(request, forecastVO);
			
		}
		catch(Exception e)
		{
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
	}
	
	@RequestMapping(value="/viewStockPublishBD.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewStockPublishBD(HttpServletRequest request, ForecastBiddingVO forecastBiddingVO, ModelMap model) throws Exception {
		
		List<?> fileResult = null;
		FileVO fileVO = new FileVO();
		
		try{
			//보증증권 정보 조회 - 고객사 명, 프로젝트 명, 계약금액
			model.addAttribute("displayUtil", new CepDisplayUtil());
			model.addAttribute("gbInfo",  service.selectBdGbInfo(forecastBiddingVO));
			
			fileVO.setFileCtKey(forecastBiddingVO.getSpKey());
			fileVO.setFileWorkClass(forecastBiddingVO.getWorkClass());
			
			fileResult = fileMngService.selectFileList(fileVO);
			model.addAttribute("fileList", fileResult);
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "forecast/popup/stockPublishBD";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/requestBiddingGb.do")
	@ResponseBody
	public Map<String, Object> requestBiddingGb(@ModelAttribute("forecastBiddingVO") ForecastBiddingVO forecastBiddingVO, HttpServletRequest request) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("============= requestBiddingGb =============");
		logger.debug("== forecastBiddingVO.getBdKey()          : {}", forecastBiddingVO.getBdKey());
		logger.debug("== forecastBiddingVO.getBdGbBdAmount()          : {}", forecastBiddingVO.getBdGbBdAmount());
		logger.debug("== forecastBiddingVO.getBdGbDay()        : {}", forecastBiddingVO.getBdGbDay());
		logger.debug("== forecastBiddingVO.getBdGbRate()       : {}", forecastBiddingVO.getBdGbRate());
		logger.debug("== forecastBiddingVO.getBdGbAmount()     : {}", forecastBiddingVO.getBdGbAmount());
	
		HashMap<String, String> sessionMap = null;
		
		try {
			sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			forecastBiddingVO.setRegEmpKey(sessionMap.get("empKey"));
			
			returnMap = service.requestBiddingGb(request, forecastBiddingVO);
			
		} catch(Exception e) {
			logger.error("{}", e);
		}
		
		return returnMap;
	}
	
	@RequestMapping(value="/modifyBiddingGb.do")
	@ResponseBody
	public Map<String, Object> modifyBiddingGb(@ModelAttribute("forecastBiddingVO") ForecastBiddingVO forecastBiddingVO, HttpServletRequest request) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== modifyBiddingGb ===============");
		logger.debug("== forecastBiddingVO.getBdKey()        : {}", forecastBiddingVO.getBdKey());
		logger.debug("== forecastBiddingVO.getBdGbBdAmount        : {}", forecastBiddingVO.getBdGbBdAmount());
		logger.debug("== forecastBiddingVO.getBdGbDay()        : {}", forecastBiddingVO.getBdGbDay());
		logger.debug("== forecastBiddingVO.getBdGbRate()        : {}", forecastBiddingVO.getBdGbRate());
		
		logger.debug("== forecastBiddingVO.getBdGbFinishDt()        : {}", forecastBiddingVO.getBdGbFinishDt());
		logger.debug("== forecastBiddingVO.getBdGbAmount()        : {}", forecastBiddingVO.getBdGbAmount());
		
		try {
			returnMap = service.modifyBiddingGb(request, forecastBiddingVO);
		} catch(Exception e) {
			logger.error("{}", e);
		}
		
		return returnMap;
	}
	
	@RequestMapping(value="/endBiddingGb.do")
	@ResponseBody
	public Map<String, Object> endBiddingGb(@ModelAttribute("forecastBiddingVO") ForecastBiddingVO forecastBiddingVO, HttpServletRequest request) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		logger.debug("=============== endBiddingGb ===============");
		logger.debug("== forecastBiddingVO.getBdKey()        : {}", forecastBiddingVO.getBdKey());
		logger.debug("== forecastBiddingVO.getBdGbBdAmount()        : {}", forecastBiddingVO.getBdGbBdAmount());
		logger.debug("== forecastBiddingVO.getBdGbDay()        : {}", forecastBiddingVO.getBdGbDay());
		logger.debug("== forecastBiddingVO.getBdGbRate()        : {}", forecastBiddingVO.getBdGbRate());
	
		logger.debug("== forecastBiddingVO.getBdGbFinishDt()        : {}", forecastBiddingVO.getBdGbFinishDt());
		logger.debug("== forecastBiddingVO.getBdGbAmount()        : {}", forecastBiddingVO.getBdGbAmount());
		
		try {
			returnMap = service.endBiddingGb(request, forecastBiddingVO);
		} catch(Exception e) {
			logger.error("{}", e);
		}
		
		return returnMap;
	}
	
	@RequestMapping(value="/popup/searchList.do")
	@SuppressWarnings("unchecked")
	public String searchListPopup(@ModelAttribute("searchVO") ForecastSearchVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		logger.debug("searchVO.spState()        :: {}", searchVO.getPjFlag());
		logger.debug("searchVO.getSpState()     :: {}", searchVO.getSpState());
		logger.debug("searchVO.getSearchFlag()  :: {}", searchVO.getSearchFlag());
		logger.debug("searchVO.getSearchValue() :: {}", searchVO.getSearchValue());
		
		try{	
			if(searchVO.getSearchFlag() == null 
			|| searchVO.getSearchFlag().equals("")
			|| !searchVO.getSearchFlag().equals("SE"))
			{
				HashMap<String, String> sessionMap = (HashMap<String, String>)request.getSession().getAttribute("userInfo");
				searchVO.setSalesEmpKey(sessionMap.get("empKey"));
				// 최초 조회 시 자신의 건만 보이게...
				model.put("empKey", sessionMap.get("empKey"));
			}
			model.put("forecastList", service.selectForecastList(searchVO));
			model.put("displayUtil", new CepDisplayUtil());
	//		model.put("spKeyDomId", searchVO.getSpKeyDomId());
	//		model.put("spBusiNmDomId", searchVO.getSpBusiNmDomId());
			model.put("returnType", searchVO.getReturnType());
			model.put("returnKey", searchVO.getReturnKey());
			model.put("returnNm", searchVO.getReturnNm());
			model.put("returnFunctionNm", searchVO.getReturnFunctionNm());
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return "forecast/popup/searchList"; 
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/write/writeBasic.do")
	@ResponseBody
	public Map<String, Object> basicWrite(@RequestBody ForecastVO forecastVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		HashMap<String, String> sessionMap = null;
		
		try {
			
			//spKey값이 null이면 insert, null이 아니면 update
			logger.debug("spKey    : {}", forecastVO.getSpKey());
			logger.debug("acKey    : {}", forecastVO.getAcKey());
			logger.debug("spBusiNm : {}", forecastVO.getSpBusiNm());
			logger.debug("pmKey    : {}", forecastVO.getPmKey());
			logger.debug("pmDetail : {}", forecastVO.getPmDetail());
			
			sessionMap =(HashMap<String, String>)request.getSession().getAttribute("userInfo");
			
			forecastVO.setRegEmpKey(sessionMap.get("empKey"));
			
			// 임시 (참고용)
			/*AlarmVO alarmVO = new AlarmVO();
			alarmVO.setAlarmTitle(forecastVO.getSpBusiNm());
			alarmVO.setAlarmKind("Forecast");
			alarmService.insertAlarm(alarmVO, request);*/
			
			returnMap.put("spKey", service.insertBasic(forecastVO));
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
	}
	
	
	//고객 목록 조회(임시 - 임수영 고객 관리 코딩 후 이관예정)
	@RequestMapping(value="/popup/searchListCurstorm.do")
	@ResponseBody
	public Map<String, Object> searchListCurstom(HttpServletRequest request, HttpServletResponse respone) throws Exception {
		
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			
		}catch(Exception e){
			logger.error("{}", e);
			throw e;
		}
		
		return returnMap;
	}
	
	
	@RequestMapping(value="/salesMeetingList.do")
	public String viewSalesMeetingList(@ModelAttribute("searchVO") ForecastSearchVO searchVO, ModelMap model) throws Exception {
		String toDay = null;
		Map<String, String> searchParam = null;
		
		try {
			
			logger.debug("=================== viewSalesMeetingList ==============================");
			logger.debug("searchVO.spState()        :: {}", searchVO.getPjFlag());
			logger.debug("searchVO.getSpState()     :: {}", searchVO.getSpState());
			logger.debug("searchVO.getSearchFlag()  :: {}", searchVO.getSearchFlag());
			logger.debug("searchVO.getSearchValue() :: {}", searchVO.getSearchValue());
			
			
			/*searchVO.setSearchFromDt("20210101");
			searchVO.setSearchToDt("20210331");*/
			
			toDay = CepDateUtil.getToday(null);		
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getSearchFromDt(), ""))){
				searchVO.setSearchFromDt(searchVO.getSearchFromDt().replace("-", ""));
			} else {
				searchVO.setSearchFromDt(CepDateUtil.calculatorDate(toDay, "yyyyMMdd",  CepDateUtil.MONTH_GUBUN,-6));
			}
			
			if(!"".equals(CepStringUtil.getDefaultValue(searchVO.getSearchToDt(), ""))){
				searchVO.setSearchToDt(searchVO.getSearchToDt().replace("-", ""));
			} else {
				searchVO.setSearchToDt(toDay);
			}
			
			EgovMap leMapSales =  service.selectSalesMeeingInfo(searchVO);
			
			model.put("displayUtil", new CepDisplayUtil());
			
			model.put("forecastList",      leMapSales.get("forecastList"));
			model.put("forecastAmount",    leMapSales.get("forecastAmount"));
			
//			model.put("forecastSalesAmount",    leMapSales.get("forecastSalesAmount"));
//			model.put("forecastPurchaseAmount", leMapSales.get("forecastPurchaseAmount"));
//			model.put("forecastProfitAmount",   leMapSales.get("forecastProfitAmount"));
			
			model.put("biddingList",      leMapSales.get("biddingList"));
			model.put("biddingAmount",    leMapSales.get("biddingAmount"));
			
//			model.put("biddingSalesAmount",    leMapSales.get("biddingSalesAmount"));
//			model.put("biddingPurchaseAmount", leMapSales.get("biddingPurchaseAmount"));
//			model.put("biddingProfitAmount",   leMapSales.get("biddingProfitAmount"));
			
			model.put("projectList",      leMapSales.get("projectList"));
			model.put("projectAmount",    leMapSales.get("projectAmount"));
			
//			model.put("projectSalesAmount",    leMapSales.get("projectSalesAmount"));
//			model.put("projectPurchaseAmount", leMapSales.get("projectPurchaseAmount"));
//			model.put("projectProfitAmount",   leMapSales.get("projectProfitAmount"));
			
			model.put("empolyeeList", comService.selectEmployeeList());
			
			searchParam = new HashMap<>();
			searchParam.put("searchFromDt", CepDateUtil.convertDisplayFormat(searchVO.getSearchFromDt(), null, null));
			searchParam.put("searchToDt", CepDateUtil.convertDisplayFormat(searchVO.getSearchToDt(), null, null));
			
			model.put("searchParam", searchParam);
			
		} catch(Exception e) {
			logger.error("{}",e);
			throw e;
		}
		
		return "forecast/salesMeetingList";
	}
}
