<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<%@include file="../../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
   <title>CEP 샘플 화면(프로젝트 상세보기)</title>
   <style>
      .sfcnt {
         height: 91px;
      }
      .btnWrap {
         position: absolute;
         bottom: 31px;
      }
      .btnWrap.rt {
         right: 127px;
      }
      form .nav {
         width: 100%;
         height: 49px;
      }
      form .contentsWrap {
         background-color: #f6f7fc;
         box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);
         height: 802px;
      }
      form .contentsWrap .contents {
         padding: 38px 71px; 
         width: 1662px;
      }
      form .title {
         height: 50px;
      }
      form .title > label {
         font-size: 26px;
      }
      form .contents > div:first-child {
         width: 37%;
      }
      form .contents > .fxd {
         width: 60%;
      }
      form .contents .stitle {
         font-size: 18px;
         font-weight: 500;
         margin-bottom: 10px;
         margin-top: 30px;
      }
      form .contents .cg {
         color: #24a37e;
      }
      form .contents .stitle img {
         width: 27px;
         margin-left: 10px;
      }
      form .contents > div > div > div > table {
         border-collapse: collapse;
         font-size: 15px;
      } 
      form .contents > div > div > div > table tr td {
         padding: 13px 20px;
      }
			
		
		/* 기본정보 싸이즈 조정 */
		form .contents .bsc tbody {			
			height: 576px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
      form .contents .bsc tr td:first-child {
         width: 124px;
         font-weight: 400;
         padding: 13px 20px 13px 45px;
      } 
      form .contents .bsc tr td:last-child {
         width: 400px;
         font-weight: 200;
      }
      form .contents .bsc {
         border-top: 4px solid #32bc94 !important;
         background-color: #ddf0ec;
         border: 1px solid #bee2da;
          border-bottom: 2px solid #bfe3db;
      }
      form .contents .bsc tr td {
         color: #0e8a67;
      }
      form .contents .bsc tr td:first-child {
         box-shadow: inset -7px 0 9px -4px #d0e2de;
      }
      form .contents .bsc tr td label.file {
         text-decoration: underline;
      }
      form .contents .title ul li {
         float: left;
         text-align: center;
         font-size: 17px;
         cursor: pointer;
      }
      form .contents .title ul li:last-child {
         clear: both;
         float: none;
         width: 0 !important;
      }
      form .contents > .fxd .title ul {
         height: 46px;
         width: 100%;
         border-radius: 35px;
         background-color: #d3d3d3;
      }
      form .contents > .fxd .title ul li {
         width: 25%;
         line-height: 46px;
         color: #777777;
         background-color: #d3d3d3;
         border-radius: 35px;
      }
      form .contents > .fxd .title ul li > label {
         display: inline-block;
          width: 100%;
          cursor: pointer;
      }
      form .contents > .fxd .title ul li.on,
      form .contents > .fxd .title ul li:hover  {
         color: #fff  !important;
         background-color: #4c3d92;
      }
      form .contents .dtlWrap2 {
         height: 490px;
         overflow-y: auto;
         overflow-x: hidden; 
         border-bottom: 2px solid #c4c4c4;
      }
      form .contents .dtl, form .contents .dtl1 {
         width: 997px;
         font-size: 15px;
         border-collapse: collapse;
         font-weight: 300;
         overflow: hidden;
      }
      form .contents .dtl1 thead {
         background-color: #e1dff5;
         float: left;
         width: 995px;
         border-top: 4px solid #6a5baf;
      }
      form .contents .dtl thead tr, form .contents .dtl1 thead tr {
         /* display: table; */
         width: 997px;
      }
      form .contents .dtl {
     	 width: 997px;
         height: 493px;
         overflow-y: auto;
         overflow-x: hidden;
         float: left;
      }
      form .contents .dtl tbody {
         /* width: 997px;
         /*height: 532px;*/
         /* overflow-y: auto;
         overflow-x: hidden; */ 
         float: left;
         /*border-bottom: 2px solid #c4c4c4;*/
      }
      form .contents .dtl tbody tr {
         /* display: table; */
         width: 997px;
         cursor: pointer;
      }
      form .contents .dtl tbody:hover {
          background-color: #ddf0ec;
      }
      /* form .contents .dtl thead tr th:first-child, form .contents .dtl1 thead tr th:first-child {
         width: 10px;
      }
      form .contents .dtl tbody tr:first-child td:first-child {
         width: 10px;
      } */
      /* form .contents .dtl tbody tr td:nth-child(3) {
         font-weight: 400;
      } */
      form .contents .dtl1 thead th, form .contents .dtl tbody tr td {
         padding: 10px 7px;
         border: 1px solid #edebef;
         text-align: center;
         width: 100px;
         max-width: 100px
      }
      form .contents .dtl tbody tr td {
         font-weight: 200;
      }
      /* form .contents .dtl thead th:first-child,
      form .contents .dtl tbody td:first-child {
         width: 51px;
         padding: 0;
      }
      form .contents .dtl thead th:nth-child(2),
      form .contents .dtl tbody td:nth-child(2),
      form .contents .dtl thead th:nth-child(6),
      form .contents .dtl tbody td:nth-child(6) {
         width: 51px;
      }
      form .contents .dtl thead th:nth-child(3),
      form .contents .dtl tbody td:nth-child(3) {
         width: 170px;
      }
      form .contents .dtl thead th:nth-child(4),
      form .contents .dtl tbody td:nth-child(4),
      form .contents .dtl thead th:nth-child(5),
      form .contents .dtl tbody td:nth-child(5),
      form .contents .dtl thead th:nth-child(6),
      form .contents .dtl tbody td:nth-child(6),
      form .contents .dtl thead th:nth-child(7),
      form .contents .dtl tbody td:nth-child(7),
      form .contents .dtl thead th:nth-child(8),
      form .contents .dtl tbody td:nth-child(8),
      form .contents .dtl thead th:nth-child(9),
      form .contents .dtl tbody td:nth-child(9), {
         width: 90px;
      } */
      form .contents .dtl tbody tr td > span {
         display: inline-block;
         overflow:hidden; 
         text-overflow:ellipsis; 
         white-space:nowrap;
         width: 84%;
         margin: 0 auto;
      }
      form .contents .dtl tbody tr td img {
         width: 25px;
         vertical-align: top;
      }
      .detailList li {
         float: left;
         text-align: left;
         margin-left: 10px;
         line-height: 2.3;
      }
      .detailList li:nth-child(2n-1) {
         width: 82px;
         font-weight: 400;
         color: #158566;
      }
      .detailList li:nth-child(2n) {
         width: 316px;
         overflow: hidden;
         text-overflow: ellipsis;
         white-space: nowrap;
         font-weight: 200;
         color: #21a17e;
      }
      .detailList li:last-child {
         width: 734px;
            height: 56px;
            word-break: break-all;
            white-space: normal;
            overflow: auto;
            line-height: 1.5;
      }
   </style>
   <script>
      $(document).ready(function() {
         var index = $('form .contents > .fxd .title ul li.on').index() + 2;
         var length = $('form .contents > .fxd .title ul li').length;
         
         /* $('li[id^=LI_TOPBar]').click(function(event){ location.href = this.title; event.preventDefault();}); */
         $('li[id^=LI_TOPBar]').click(function(event){
				/* location.href = this.title; 
				event.preventDefault(); 				
				alert(this.title);
				*/
				document.detailForm.action = this.title;
	           	document.detailForm.submit();
				
			});
         
/*          var html = '';
 			$('#listForm table tbody tr').click(function() {
            if($(this).attr('class') != "viewOpen") {
               html = '<div style="width:997px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
                      + '<div style="margin: 5px 71px;">'
                      + '<ul class="detailList">'
                      + '<li>제품상세</li>'
                      + '<li title="제품상세 내용 표출 1P/8C, 32GB*2EA">제품상세 내용 표출 1P/8C, 32GB*2EA</li>'
                      + '<li>계약기간</li>'
                      + '<li title="2020.12.12~2021.12.12">2020.12.12~2021.12.12</li>'
                      + '<li>비고</li>'
                      + '<li title="비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출">비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출</li>'
                     + '</ul>'
                      + '</div>'
                      + '</div>';
               $(this).after(html);
               $(this).attr('class', 'viewOpen');
            } else {
               $(this).removeClass('viewOpen');
               $(this).next().remove();
            }
         }); */
         
         /* $('#listForm table tr').each(function(index, item) {
            if(index > 1) {
               $(this).children().eq(0).append('<input type="checkbox" class="tCheck" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
            }
         }); */
      });
      
      function fn_addView(link){
         /* if(link == "forecastList") {
            location.href="<c:url value='/forecastList.do'/>";
         } else { */
            var url = '/project/'+link+'.do';
            var dialogId = 'program_layer';
            var varParam = {
      
            }
            var button = new Array;
            button = [];
            showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
         /* } */
      }
   </script>
</head>
<body>
   <form id="detailForm" name="detailForm" method="post">
   <input type="hidden" id="selectKey" name="selectKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/>
      <div class="sfcnt"></div>
      <div class="nav"></div>
      <div class="contentsWrap">
         <div class="contents mgauto">
            <div class="floatL">
               <div class="title"><label class="ftw500">유지보수 상세정보</label></div>
               <div>
                  <div class="stitle cg">기본정보</div>
                  <div id="basicForm">
                     <table class="bsc">
						<tr>
							<td>프로젝트명</td>
							<td><c:out value="${basicContractInfo.mtNm}"/></td>
						</tr>
						<tr>
							<td>고객사</td>
							<td><c:out value="${basicContractInfo.mtAcNm}"/></td>
						</tr>
						<tr>
							<td>고객사담당자</td>
							<td><c:out value="${basicContractInfo.acDirectorInfo}"/></td>
						</tr>
						<tr>
							<td>계약일자</td>
							<td><c:out value="${basicContractInfo.viewCtDt}"/></td>
						</tr>
						<tr>
							<td>유지보수 기간</td>
							<td><c:out value="${basicContractInfo.viewStartDt}"/> ~ <c:out value="${basicContractInfo.viewEndDt}"/></td>
						</tr>
						<tr>
							<td>유지보수 금액</td>
							<td><c:out value="${basicContractInfo.viewAmount}"/></td>
						</tr>
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
							<td>백계약유무</td>
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
							<td><c:out value="${basicContractInfo.remark}"/></td>
						</tr>
                     </table>
                  </div>
               </div>
            </div>
            <div class="floatR dpBlock fxd">
               <div class="title">
                  <ul>
                     <li id="LI_TOPBar_PD" title="/maintenance/contract/detail/productInfo.do"><label>제품정보</label></li>
                     <li id="LI_TOPBar_SL" title="/maintenance/contract/detail/productInfo.do"><label>매출정보</label></li>
                     <li id="LI_TOPBar_BC" title="/maintenance/contract/detail/backOrderInfo.do"><label>백계약정보</label></li>
                     <li id="LI_TOPBar_PA" class="on" title="/maintenance/contract/detail/purchaseAmountInfo.do"><label>매입정보</label></li>
                     <li></li>
                  </ul>
               </div>
               <div id="listForm">
                  <div class="stitle cg colorBlack">매입정보<img class="veralignT" src="<c:url value='/images/btn_add.png'/>" /></div>
                  <div class="floatC dtlWrap">
                     <table class="dtl1">
                        <thead class="ftw400">
                           <tr>
                              <th rowspan="2" style="width: 10px">선택</th>
                              <th style="width: 130px; max-width: 130px">거래처명</th>
                              <th>연도</th>
                              <th>1월</th>
                              <th>2월</th>
                              <th>3월</th>
                              <th>4월</th>
                              <th>5월</th>
                              <th>6월</th>
                           </tr>
                           <tr>
                              <th style="width: 130px; max-width: 130px">결제조건</th>
                              <th>합계</th>
                              <th>7월</th>
                              <th>8월</th>
                              <th>9월</th>
                              <th>10월</th>
                              <th>11월</th>
                              <th>12월</th>
                           </tr>
						</thead>
					</table>
                        <div class="dtlWrap2">
                        <table class="dtl">
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check1"><label for="check1" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일12312312312</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check2"><label for="check2" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포메이션</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check3"><label for="check3" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포메이션</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check4"><label for="check4" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포메이션</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check4"><label for="check4" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포메이션</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check4"><label for="check4" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포메이션</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check4"><label for="check4" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포메이션</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check4"><label for="check4" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포메이션</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check4"><label for="check4" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포메이션</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check4"><label for="check4" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포메이션</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check4"><label for="check4" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포메이션</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check4"><label for="check4" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포메이션</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                        <tbody>
                           <tr>
                              <td rowspan="2" style="width: 10px" style="10px"><input type="checkbox" class="tCheck" id="check4"><label for="check4" class="cursorP"></label></td>
                              <td style="width: 130px; max-width: 130px">효성인포</td>
                              <td style="font-weight: 400;">2019</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                           <tr>
                              <td style="width: 130px; max-width: 130px">계산서 발행 후 10일</td>
                              <td>72,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                              <td>6,000,000</td>
                           </tr>
                        </tbody>
                       
                     </table>
                        
                        </div>
                        
                  </div>
                  <div class="btnWrap rt">
                     <div class="floatR">
                        <button value="수정"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
                        <button value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
                        <button value="Excel"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
                     </div>
                  </div>
               </div>
            </div>
            <div class="floatC"></div>
         </div>
      </div>   
   </form>
</body>
</html>