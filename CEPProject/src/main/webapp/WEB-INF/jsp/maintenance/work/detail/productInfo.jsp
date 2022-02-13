<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<%@include file="../../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수작업 상세</title>
	
	<style>
		.sfcnt {
			height: 91px;
		}
		.bottom > div {
			margin-top: 22px;
		}
		/* .btnWrap {
			position: absolute;
			bottom: 31px;
		}
		.btnWrap.lt {
			left: 127px;
		}
		.btnWrap.rt {
			right: 127px;
		} */
		form .nav {
			width: 100%;
			height: 49px;
		}
		form .contentsWrap {
			background-color: #f6f7fc;
			box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);
			height: 830px;
		}
		form .contentsWrap .contents {
			padding: 38px 71px; 
			width: 1662px;
		}
		form .title {
			height: 50px;
		}
		/* 화면타이틀(유지보수작업 상세정보) 글자크기 */
		form .title > label {
			font-size: 26px;
		}
		/* 오른쪽 내용(상세정보) 싸이즈 */
		form .contents > .fxd {
			width: 60%;
		}
		/* 소타이틀(기본정보, 발주정보, 장비별작업정보) 관련 css*/
		form .contents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 12px;
			margin-top: 26px;
		}
		/* 기본정보 색상  */
		form .contents .cg {
			color: #24a37e;
		}
		/* 발주추카 이미지 크기 및 위치조정 */
		form .contents .stitle img {
			width: 27px;
			margin-left: 10px;
		}
		form .contents > div > div > div > table {
			border-collapse: collapse;
			font-size: 15px;
		} 
		/* 기본정보 테이블 padding */
		form .contents > div > div > div > table tr td {
			padding: 13px 20px;
		}
		/* 기본정보 타이틀 크기 및 글자크기 */
		form .bsc tr td:first-child {
			width: 130px;
			font-weight: 400;
		} 
		/* 기본정보 내용 글자 굵기 */
		form .bsc tr td:last-child {
			width: 400px;
			font-weight: 200;
			box-shadow: inset 7px 0 6px -4px #d0e2de;
		}
		/* 기본정보 틀 */
		form .contents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			/* border: 1px solid #bee2da; */
		    border-bottom: 2px solid #bfe3db;
		    width: 614px;
		}
		
		form .contents .bsc tbody {			
			height: 576px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		/* 기본정보 글자색 */
		form .contents .bsc tr td {
			color: #26a07d;
		}
		/* 기본정보 세로줄 나오는것 */
		form .contents .bsc tr td:first-child {
			/* box-shadow: inset -7px 0 9px -4px #d0e2de; */
			padding: 13px 13px 13px 20px;
		}
		
		form .contents .dtl {
		    width: 997px;
		    font-size: 15px;
		    border-collapse: collapse;
		    font-weight: 300;
		    overflow: hidden;
		    border-top: 4px solid #6a5baf;
		}
		
		form .contents .dtl thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
			
		form .contents .dtl tbody {
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			width: 997px;		
			border-bottom: 2px solid #c4c4c4;
		}
		/* 커서포인터 */
		form .contents .dtl tbody tr {
		    display: table;
		    width: 997px;
		    cursor: pointer;
		}		
		
		/* 장비별작업정보 테이블 틀 나오게 하는 부분 */
		form .contents .dtl thead th, form .contents .dtl tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}
			
		form .contents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
			background-color: #d3d3d3;
		}
		/* 작업정보 >발주정보 메뉴버튼 모양 및 크기   */
		form .contents > .fxd .title ul li {
			width: 33.3%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
			border-radius: 35px;
		}
		form .contents .title ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		form .contents > .fxd .title ul li > label {
			display: inline-block;
    		width: 100%;
    		/* cursor: pointer; */
		}
		form .contents > .fxd .title ul li.on,
		form .contents > .fxd .title ul li:hover  {
			color: #fff  !important;
			background-color: #4c3d92;
		}	
		
				
		/* 리스트 위에 마우스 올리면 색변경 */
		form .contents .dtl tbody tr:hover {
			background-color: #ddf0ec
		}

		/* 장비별작업정보 글짜크기 */
		.dtl tbody tr td {
			font-weight: 200;
		}
		
		/* 장비별작업정보 세로싸이즈 */
		form .contents .dtl tbody {
			height: 534px;
		}
		/* 장비별작업정보 테이블 크기조정 */
		form .contents .dtl thead th:first-child,
		form .contents .dtl tbody td:first-child {
			width: 40px;
			padding: 0;
		}
		form .contents .dtl thead th:nth-child(2),
		form .contents .dtl tbody td:nth-child(2) {
			width: 40px;
		}
		form .contents .dtl thead th:nth-child(3),
		form .contents .dtl tbody td:nth-child(3) {
			width: 175px;
			max-width: 175px;
		}
		form .contents .dtl thead th:nth-child(4),
		form .contents .dtl tbody td:nth-child(4) {
			width: 150px;
			max-width: 150px;
		}
		form .contents .dtl thead th:nth-child(5),
		form .contents .dtl tbody td:nth-child(5) {
			width: 530px;
			max-width: 530px;
		}
		form .contents .dtl tbody td:nth-child(5){
			padding-right: 9px;
		}
		/* 장비별작업정보에서 제품과 제품상세  ... 으로 표시. */
 		form .contents .dtl tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 90%;
			margin: 0 auto;
		}
		/* 장비별작업정보>제품에서 V 크기 및 위치  */
		form .contents .dtl tbody tr td img {
			width: 13px;
			vertical-align: middle;
			margin-bottom: 5px;
		}
		
		/* 장비별작업정보 클릭했을때 나타나는 내용에서 제목(제품상세) */
		.detailList li:nth-child(2n-1) {
		    width: 82px;
		    font-weight: 400;
		    color: #158566;
		}
		/* 장비별작업정보 클릭했을대 나타나는 내용 */
		.detailList li:nth-child(2n) {
			/* width: 316px; */
			overflow: hidden;
			/* text-overflow: ellipsis; */
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
	</style>
	<script>
		$(document).ready(function() {
			
			$('li[id^=LI_TOPBar]').click(function(event){ 

				//location.href = this.title; event.preventDefault();
				if(this.title == "basicInfo"){
					document.m_listForm.action = "/maintenance/work/detail/basicInfo.do";
		           	document.m_listForm.submit();
				} else if(this.title == "productInfo"){
					//console.log("productInfo===>${basicWorkInfo.mtWorkPmYn}")
					if("${basicWorkInfo.mtWorkPmYn}" == "Y"){
						document.m_listForm.action = "/maintenance/work/detail/productInfo.do";
			           	document.m_listForm.submit();
					} else {
						alert("장비별작업정보가 없습니다.\n 제품등록여부를 Y로 변경 후 장비별작업정보를 등록하세요.")
					}
				} else if(this.title == "orderInfo"){
					//console.log("orderInfo===>${basicWorkInfo.mtWorkOrderYn}")
					if("${basicWorkInfo.mtWorkOrderYn}" == "Y"){
						document.m_listForm.action = "/maintenance/work/detail/orderInfo.do";
			           	document.m_listForm.submit();
					} else {
						alert("발주정보가 없습니다.\n 추가발주유무를 Y로 변경 후 발주정보를 등록하세요.")
					}
				}
			});
			
			
			//발주정보 커서 생성.
			if("Y"=="${basicWorkInfo.mtWorkOrderYn}"){
				$("#orderLabel").css('cursor','pointer');				
			}
			
			var html = '';
			$('#detailForm .dtl tbody tr').click(function() {
				if($(this).attr('class') != "viewOpen trcheckcolor") {
					//console.log($(this).children().eq(5).text());
					html = '<div style="width:997px; height: auto; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>제품상세</li>'
					       + '<li><pre>'+$(this).children().eq(5).text().trim()+'</pre></li>'
						   + '</ul>'
					       + '</div>'
					       + '</div>';
					$(this).after(html);
					$(this).attr('class', 'viewOpen trcheckcolor');
					var className = $(this).children().children().eq(3).attr('class');
					//console.log("className====>"+className);
					if(className === "down") {
						$(this).children().children().eq(3).attr('src','<c:url value='/images/arrow_up.png'/>');
						$(this).children().children().eq(3).attr('class', "up");
					} else {

						$(this).children().children().eq(3).attr('src','<c:url value='/images/arrow_down.png'/>');
						$(this).children().children().eq(3).attr('class', "down");
					}
				} else {
					$(this).children().children().eq(3).attr('src','<c:url value='/images/arrow_down.png'/>');
					$(this).children().children().eq(3).attr('class', "down");
					$(this).removeClass('viewOpen');
					$(this).next().remove();
				}
			});
			
			
			
			/* $('#detailForm .dtl tr').each(function(index, item) {
				if(index != 0) {
					$(this).children().eq(0).append('<input type="radio" name="orderGubun" class="tRadio" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				}
			}); */
			
		}); // end $(document).ready()

		
				
		function fn_addView(){
			
			var url = '/maintenance/work/write/productInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtWorkKey":'<c:out value="${mtWorkKey}"/>'				
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			
		}
		
		function fn_deleteWorkPmBtn() {
			var obj = null; 
			if($('input[name="m_gubun"]').is(':checked')) {
				//console.log("mtIntegrateKey.value===>"+document.m_mtMoveForm.mtIntegrateKey.value+"/"+$('input[name="m_gubun"]:checked').val());
				if(confirm("선택한 제품을 삭제하시겠습니까?")){
					obj = {};
					obj["mtIntegrateKey"] = $('#mtIntegrateKey').val();
					obj["mtWorkKey"] = $('#mtWorkKey').val();
					obj["mtWorkSeq"] = $('input[name="m_gubun"]:checked').val();
					$.ajax({
			        	url:"/maintenance/work/detail/deleteWorkProduct.do",
			            dataType: 'text', 
			            type:"post",  
			            data: JSON.stringify(obj),
			            
			     	   	contentType: "application/json; charset=UTF-8", 
			     	  	beforeSend: function(xhr) {
			        		xhr.setRequestHeader("AJAX", true);
			        		
			        	},
			            success:function(data){	

			            	var paramData = JSON.parse(data);
			            	
			            	if("Y" == paramData.successYN){
			            		alert("유지보수계약 장비별작업정보 삭제를 성공하였습니다.");
			            		
			            		document.m_listForm.action = "/maintenance/work/detail/productInfo.do";
			    	           	document.m_listForm.submit();
			            	} else {
			            		alert("유지보수계약 장비별작업정보 삭제를 실패하였습니다.");
			            		
			            	}
			            	 
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
			        });
				}
			} else {
				alert("삭제할 대상을 선택하세요 !!");
			}			
		}
		
		// 파일다운로드 관련
		function fn_downFile(fileKey, fileOrgNm) {
			var form = document.viewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#viewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}
		
	</script>
</head>
<body>
	<form id="m_listForm" name="m_listForm" method="post">
		<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/>
		<input type="hidden" id="mtWorkKey" name="mtWorkKey" value="<c:out value="${mtWorkKey}"/>"/>
		<input type="hidden" id="orderCtFkKey" name="orderCtFkKey" value="<c:out value="${mtWorkKey}"/>"/>		
		<input type="hidden" id="mtWorkSeq" name="mtWorkSeq" />		
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="floatL">
					<div class="title"><label class="ftw500">유지보수작업 상세정보</label></div>
					<div>
						<div class="stitle cg">기본정보</div>
						<div id="basicForm">
							<table class="bsc" id="selectBasicTable">
								<tr>
									<td>FORECAST명</td>
									<td><c:out value="${basicContractInfo.mtForcastLinkVo.mtLinkCtKeyNm}"/></td>
								</tr>
								<tr>
									<td>PROJECT명</td>
									<td><c:out value="${basicContractInfo.mtProjectLinkVo.mtLinkCtKeyNm}"/></td>
								</tr>
								<tr>
									<td>유지보수명</td>
									<td><c:out value="${basicContractInfo.mtNm}"/></td>
								</tr>
								<tr>
									<td>고객사</td>
									<td><c:out value="${basicContractInfo.mtAcNm}"/></td>
								</tr>
								<tr>
									<td>고객사담당자</td>
									<td><c:out value="${basicContractInfo.mtAcDirectorNm}"/> / <c:out value="${basicContractInfo.acDirectorInfo}"/></td>
								</tr>
								<tr>
									<td>계약일자</td>
									<td><c:out value="${displayUtil.displayDate(basicContractInfo.mtCtDt)}"/></td>
								</tr>
								<tr>
									<td>유지보수 기간</td>
									<td><c:out value="${displayUtil.displayDate(basicContractInfo.mtStartDt)}"/> ~ <c:out value="${displayUtil.displayDate(basicContractInfo.mtEndDt)}"/></td>
								</tr>
								<tr>
									<td>총계약금액</td>
									<td><c:out value="${displayUtil.commaStr(basicContractInfo.mtAmount)}"/></td>
								</tr>
								<%-- <tr>
									<td>부가세포함</td>
									<td><c:out value="${basicContractInfo.taxYn}"/></td>
								</tr> --%>
								<tr>
									<td>결제조건</td>
									<td><c:out value="${basicContractInfo.mtPayTerms}"/></td>
								</tr>
								<tr>
									<td>검수방법</td>
									<td><c:out value="${basicContractInfo.mtImCd}"/></td>
								</tr>
								<tr>
									<td>정기점검 횟수</td>
									<td><c:out value="${basicContractInfo.mtRgInspectCnt}"/> 회</td>
								</tr>
								<tr>
									<td>백계약 유무</td>
									<td><c:out value="${basicContractInfo.mtSbCtYn}"/></td>
								</tr>
								<tr>
									<td>보증증권 유무</td>
									<td><c:out value="${basicContractInfo.gbYn}"/></td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td><c:out value="${basicContractInfo.supportEmpNm}"/></td>
								</tr>
								<tr>
									<td>관리담당자</td>
									<td><c:out value="${basicContractInfo.mngEmpNm}"/></td>
								</tr>
								<tr>
									<td>영업담당자</td>
									<td><c:out value="${basicContractInfo.saleEmpNm}"/></td>
								</tr>
								<tr>
									<td>비고</td>
									<td ><pre style="width: 390px"><c:out value="${basicContractInfo.remark}"/></pre></td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td >
										<c:forEach var="result" items="${fileList }" varStatus="status">
											<%-- <input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/> --%>
											<%-- <a href="javascript:fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')"><c:out value="${result.fileOrgNm}"/></a> --%>
											<button type="button" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>');" style="color: #26a07d;">
												<B><I><u><c:out value="${result.fileOrgNm}"/></u></I></B>
											</button>
											<c:if test="${status.last eq false}"><br /></c:if>
										</c:forEach>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="floatR dpBlock fxd">
					<div class="title">
						<ul>
							<li id="LI_TOPBar_WB" title="basicInfo"><label style="cursor: pointer;">작업정보</label></li>
							<li id="LI_TOPBar_WB" class="on"><label style="cursor: pointer;">장비별작업정보</label></li>
							<li id="LI_TOPBar_WO" title="orderInfo"><label id="orderLabel">발주정보</label></li>
							<li></li>
						</ul>
					</div>
					<div id="detailForm">
						<div class="stitle cg colorBlack">장비별작업정보&nbsp;<img class="veralignT" src="<c:url value='/images/btn_add.png'/>" style="cursor: pointer;" onclick="fn_addView()"/></div>
						<div class="floatC middle">
							<table class="dtl">
								<thead class="ftw400">
									<tr>
										<th scope="row">선택</th>
										<th scope="row">No</th>
										<th scope="row">제품</th>
										<th scope="row">시리얼번호</th>
										<th scope="row">작업내용</th>
										<th style="max-width: 0px; display: none;"></th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="list" items="${mtWorkProductList}" varStatus="status">
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tRadio" name="m_gubun" id="check<c:out value="${status.count}"/>" value="<c:out value="${list.mtWorkSeq}"/>" /><label for="check<c:out value="${status.count}"/>" class="cursorP"/>
										</td>
										<td><c:out value="${status.count}"/></td>
										<td class="textalignL"><span title="<c:out value="${list.mtPmKeyNm}"/>"><c:out value="${list.mtPmKeyNm}"/></span> <img class="down" src="<c:url value='/images/arrow_down.png'/>"/></td>
										<td class="textalignC"><c:out value="${list.mtPmSerialNum}"/></td>
										<td class="textalignL">
											<span title="<c:out value="${list.mtPmWorkCont}"/>"><c:out value="${list.mtPmWorkCont}"/></span>																			
										</td>
										<td style="max-width: 0px; display: none;">
											<c:out value="${list.mtPmDetail}"/>
										</td>
										
									</tr>
								</c:forEach>
									
									<!-- <tr>
										<td><input type="radio" class="tRadio" name="m_gubun" id="check21" value="MW90098" /><label for="check21" class="cursorP"/></td>
										<td>21</td>
										<td class="textalignL">PowerEdge R640</td>
										<td class="textalignR">TX203-23AS-12-3033</td>
										<td class="textalignL">
											<span>작업내용작업내용작업내용작업내용작업내용작업내용작업내용작업내용</span>										
										</td>
									</tr>
									<tr>
										<td><input type="radio" class="tRadio" name="gubun" id="check22" value="MW90098" /><label for="check22" class="cursorP"/></td>
										<td>22</td>
										<td class="textalignL">PowerEdge R640</td>
										<td class="textalignR">TX203-23AS-12-3033</td>
										<td class="textalignL">
											<span>작업내용작업내용작업내용작업내용작업내용작업내용작업내용작업내용</span>										
										</td>
									</tr>
									<tr>
										<td><input type="radio" class="tRadio" name="m_gubun" id="check23" value="MW90098" /><label for="check23" class="cursorP"/></td>
										<td>23</td>
										<td class="textalignL">PowerEdge R640</td>
										<td class="textalignR">TX203-23AS-12-3033</td>
										<td class="textalignL">
											<span>작업내용작업내용작업내용작업내용작업내용작업내용작업내용작업내용</span>										
										</td>
									</tr>
									<tr>
										<td><input type="radio" class="tRadio" name="m_gubun" id="check24" value="MW90098" /><label for="check24" class="cursorP"/></td>
										<td>24</td>
										<td class="textalignL">PowerEdge R640</td>
										<td class="textalignR">TX203-23AS-12-3033</td>
										<td class="textalignL">
											<span>작업내용작업내용작업내용작업내용작업내용작업내용작업내용작업내용</span>										
										</td>
									</tr>
									<tr>
										<td><input type="radio" class="tRadio" name="m_gubun" id="check25" value="MW90098" /><label for="check25" class="cursorP"/></td>
										<td>25</td>
										<td class="textalignL">PowerEdge R640</td>
										<td class="textalignR">TX203-23AS-12-3033</td>
										<td class="textalignL">
											<span>작업내용작업내용작업내용작업내용작업내용작업내용작업내용작업내용</span>										
										</td>
									</tr>
									<tr>
										<td><input type="radio" class="tRadio" name="m_gubun" id="check26" value="MW90098" /><label for="check26" class="cursorP"/></td>
										<td>26</td>
										<td class="textalignL">PowerEdge R640</td>
										<td class="textalignR">TX203-23AS-12-3033</td>
										<td class="textalignL">
											<span>작업내용작업내용작업내용작업내용작업내용작업내용작업내용작업내용</span>										
										</td>
									</tr>
									<tr>
										<td><input type="radio" class="tRadio" name="m_gubun" id="check27" value="MW90098" /><label for="check27" class="cursorP"/></td>
										<td>27</td>
										<td class="textalignL">PowerEdge R640</td>
										<td class="textalignR">TX203-23AS-12-3033</td>
										<td class="textalignL">
											<span>작업내용작업내용작업내용작업내용작업내용작업내용작업내용작업내용</span>										
										</td>
									</tr>
									<tr>
										<td><input type="radio" class="tRadio" name="m_gubun" id="check28" value="MW90098" /><label for="check28" class="cursorP"/></td>
										<td>28</td>
										<td class="textalignL">PowerEdge R640</td>
										<td class="textalignR">TX203-23AS-12-3033</td>
										<td class="textalignL">
											<span>작업내용작업내용작업내용작업내용작업내용작업내용작업내용작업내용</span>										
										</td>
									</tr>
									<tr>
										<td><input type="radio" class="tRadio" name="m_gubun" id="check21" value="MW90098" /><label for="check29" class="cursorP"/></td>
										<td>29</td>
										<td class="textalignL">PowerEdge R640</td>
										<td class="textalignR">TX203-23AS-12-3033</td>
										<td class="textalignL">
											<span>작업내용작업내용작업내용작업내용작업내용작업내용작업내용작업내용</span>										
										</td>
									</tr>
									<tr>
										<td><input type="radio" class="tRadio" name="m_gubun" id="check30" value="MW90098" /><label for="check30" class="cursorP"/></td>
										<td>30</td>
										<td class="textalignL">PowerEdge R640</td>
										<td class="textalignR">TX203-23AS-12-3033</td>
										<td class="textalignL">
											<span>작업내용작업내용작업내용작업내용작업내용작업내용작업내용작업내용</span>										
										</td>
									</tr> -->
								</tbody>
							</table>
						</div>
						<div class="bottom">
							<div class="floatR">
							<c:if test='${loginID eq basicWorkInfo.mtWorkEmpKey or loginID eq basicWorkInfo.regEmpKey}'>
								<button type="button" value="수정" onclick="fn_addView();"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
							</c:if>
								
								<%-- <button type="button" value="삭제" onclick="fn_deleteWorkPmBtn();"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button> --%>
								<button type="button" value="Excel"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
								
								<input type="hidden" id="mtWorkEmpKey"  name="mtWorkEmpKey" value="${basicWorkInfo.mtWorkEmpKey}" />
								<input type="hidden" id="regEmpKey"  name="regEmpKey" value="${basicWorkInfo.regEmpKey}" />
							</div>
						</div>
					</div>
				</div>
				<div class="floatC"></div>
			</div>
		</div>	
	</form>
	<form:form id="viewForm" name="viewForm" method="POST">
		<input type="hidden" name="fileKey" value=""/>
		<input type="hidden" name="fileOrgNm" value=""/>
	</form:form>
</body>
</html>