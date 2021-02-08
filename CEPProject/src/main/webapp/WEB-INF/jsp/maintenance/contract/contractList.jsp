<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수 목록</title>
	<style>
		.sfcnt {
			height: 91px;
		}
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
		form .title > label {
			font-size: 26px;
		}
		.contentsWrap .contents .top div:nth-child(2) > * {
			vertical-align: top;
		}
		.contentsWrap .contents .top select {
			height: 40px;
			width: 130px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.contentsWrap .contents .top input[type="text"] {
			width: 260px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			background-repeat: no-repeat;
			background-position: 95% 50%;
			font-size: 15px;
			margin-bottom: 3px;
		}
		.contentsWrap .contents .top input[class^="calendar"] {
			width: 120px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}		
		.middle table {
			width: 1662px;
			font-size: 15px;
			margin-top: 16px;
			border-collapse: collapse;
			overflow: hidden;
			border-bottom: 2px solid #6a5bae;
		}
		.middle table thead {
			background-color: #e1dff5;
			float: left;
			width: 1662px;
			border-bottom: 3.5px solid #6a5bae;
		}
		.middle table thead tr {
			display: table;
			width: 1662px;
		}
		.middle table tbody {
			width: 1662px;
			height: 550px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.middle table tbody tr {
			display: table;
			width: 1662px;
			cursor: pointer;
		}
		.middle table tbody tr td span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			margin-left: 15px;
			vertical-align: middle;
		}
		/* 리스트에 마우스 올려 놓았을 경우 해당 라인 색깔 변하게 하는것 */
		.middle table tbody tr:hover {
			background-color: #ddf0ec;
		}
		
		.middle table tbody tr td:nth-child(5) {
			font-weight: 400;
		}
		.middle table thead th, .middle table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child {
			width: 50px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 48px;
			max-width: 48px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 115px;
			max-width: 145px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 160px;
			max-width: 160px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 380px;
			max-width: 380px;
		}
		.middle table thead th:nth-child(6),
		.middle table thead th:nth-child(7),
		.middle table thead th:nth-child(8),
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(6),
		.middle table tbody td:nth-child(7),
		.middle table tbody td:nth-child(8),
		.middle table tbody td:nth-child(9) {
			width: 100px;
		}
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10) {
			width: 90px;
		}
		.middle table thead th:nth-child(11),
		.middle table tbody td:nth-child(11) {
			width: 80px;
		}
		.middle table thead th:nth-child(12),
		.middle table thead th:nth-child(13),
		.middle table thead th:nth-child(14),
		.middle table tbody td:nth-child(12),
		.middle table tbody td:nth-child(13),
		.middle table tbody td:nth-child(14) {
			width: 100px;
		}
		.middle table tbody tr td > img {
			width: 25px;
			vertical-align: middle;
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
			width: 275px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		.detailList li:last-child {
			width: 1409px;
   			height: 56px;
   			word-break: break-all;
   			white-space: normal;
   			overflow: auto;
   			line-height: 1.5;
		}
		.bottom > div {
			margin-top: 22px;
		}
	</style>
	<script>
		$(document).ready(function() {

			$('#pl tr').click(function() {
				 var tdArr = new Array();    // 배열 선언
		            
			        // 현재 클릭된 Row(<tr>)
			       /*  var tr = $(this);
			        var td = tr.children();

			        console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		            
			        console.log("클릭한 select 값 : "+td.eq(1).text());
			        console.log("클릭한 select 값 : "+$('#check'+$(this).children().eq(1).text()).val());
			        
			        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
			        td.each(function(i){
			            tdArr.push(td.eq(i).text());
			        });
			                
			        console.log("배열에 담긴 값 : "+tdArr); */

				//$("input[name=selectKey]").val($('#check'+$(this).children().eq(1).text()).val());			
				document.listForm.selectKey.value=$('#check'+$(this).children().eq(1).text()).val();
				/* location.href = "/maintenance/detail/prodInfo.do"; */
				document.listForm.action = "/maintenance/contract/detail/productInfo.do";
	           	document.listForm.submit(); 
				
			});
			
/* 			$('input[name="m_gubun"]').click(function() {
				 $("#tbm tr").removeClass("trcheckcolor");
				  //선택된 tr의 배경색을 cyan
				 $(this).parent().parent().addClass("trcheckcolor");
			}); */
/* 			$('.middle table tbody tr').children().click(function() {
				//alert(111);
				//$(this).css("background", "red");
				 $("#tbm tr").removeClass("trcheckcolor");
				  //선택된 tr의 배경색을 cyan
				 $(this).parent().addClass("trcheckcolor");
			}); */
		});

		function fn_addView(){
			var url = '/maintenance/contract/write/basicInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_addView1(){
			var url = '/maintenance/contract/write/backOrderInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_addView2(){
			var url = '/maintenance/contract/write/purchaseAmountView.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_addView3(){
			var url = '/maintenance/contract/write/productInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_searchList(){
			
			document.listForm.action = "/maintenance/contract/contractList.do";
           	document.listForm.submit(); 
		}
		
		/* function fn_deleteBtn(){
			if($('input[name="m_gubun"]').is(':checked')){
				if(confirm("선택한 내용을 삭제하시겠습니까?")){
					document.listForm.btnOption.value='delete';
					document.listForm.selectKey.value=$('input[name="m_gubun"]:checked').val();
					document.listForm.action = "/maintenance/contract/deleteContract.do";
		           	document.listForm.submit(); 
				} else {
					return false;
				}				
			} else {
				alert("삭제할 대상을 선택하세요 !!");				
				return false;
			}           	
		} */
	function fn_deleteBtn(){			
			if($('input[name="m_gubun"]').is(':checked')){
				if(confirm("선택한 유지보수계약 내용을 삭제하시겠습니까?")){
					var sendData = {
		           			"selectKey":$('input[name="m_gubun"]:checked').val()
		           	}
					$.ajax({
		           		url: "/maintenance/contract/deleteContract.do",
		           		dataType: 'text', 
		           		type:"post",  
		           		//data: JSON.parse(sendData),
		           		data: JSON.stringify(sendData),
		           		//data: sendData,
		           		contentType: "application/json; charset=UTF-8", 
		           		beforeSend: function(xhr) {
		           			xhr.setRequestHeader("AJAX", true);	        		
		           		},
		           		success:function(data){	
		           			var paramData = JSON.parse(data);
		           		
		           			if("Y" == paramData.successYN){
		           				alert("유지보수계약 삭제를 성공하였습니다.");
		           				
		           				document.listForm.action = "/maintenance/contract/contractList.do";
		        	           	document.listForm.submit();
		           				
		           			} else {
		           				alert("유지보수계약 삭제를 실패하였습니다.");
		           				
		           			}
		           		},
		           		error: function(request, status, error) {
		           			if(request.status != '0') {
		           				alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		           			}
		           		} 
		           	});    
				} else {
					return false;
				}
			} else {
				alert("삭제할 대상을 선택하세요 !!");
				
				return false;
			}
		} // end fn_deleteBtn()
		
		function fn_modifyBtn() {
			if($('input[name="m_gubun"]').is(':checked')){
				var url = '/maintenance/contract/write/basicInfoView.do';
				var dialogId = 'program_layer';
				var varParam = {
						"mtIntegrateKey":$('input[name="m_gubun"]:checked').val()					
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			} else {
				alert("수정할 대상을 선택하세요 !!");
				
				return false;
			}			
		} // end fn_modifyBtn()
	</script>
</head>
<body>
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<input type="hidden" name="btnOption" />
		<!-- <input type="hidden" id="selectKey" name="selectKey"/> -->
		<input type="hidden" id="selectKey" name="selectKey"/>
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500" style="color:#000000">유지보수 목록</label></div>
						<div class="addBtn floatL cursorP" onclick="fn_addView();"><img src="<c:url value='/images/btn_add.png'/>" /></div>
						<%-- <div class="addBtn floatL cursorP" onclick="fn_addView3();"><img src="<c:url value='/images/btn_add.png'/>" /></div>
						<div class="addBtn floatL cursorP" onclick="fn_addView1();"><img src="<c:url value='/images/btn_add.png'/>" /></div>	
						<div class="addBtn floatL cursorP" onclick="fn_addView2();"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>	
					</div>
					<div class="floatR">
						<!-- <input type="text" name="fromDate" placeholder="from" class="calendar" /> ~ <input type="text" name="toDate" placeholder="to" class="calendar" /> -->
						<form:input path="fromDate" type="text" placeholder="계약일자(from)" class="calendar fromDt" value="${searchParam.fromDate}"/> ~ <form:input path="toDate" type="text" placeholder="계약일자(to)" class="calendar toDt" value="${searchParam.toDate}"/>
						<!-- <select name="searchSaleEmpKey"> -->
						<form:input path="searchSaleEmpNm" type="text" placeholder="영업담당" style="width: 100px"/>
						<form:select path="searchGubun">
							<form:option value="PJ" label="프로젝트명" />
							<form:option value="CU" label="고객사" />
						</form:select>
						<%-- <form:select path="searchSaleEmpKey">
							<form:option value="" label="영업담당" />
							<c:forEach var="emp" items="${empList}" varStatus="status">
								<form:option value="${emp.empKey}" label="${emp.empNm}" />
							</c:forEach>							
						</form:select> --%>
						<form:input path="searchWord" type="text" placeholder="검색어"/>
						<!-- <input type="text" name="searchMtName" placeholder="프로젝트 명"/> -->
						<span><button><img src="<c:url value='/images/icon_search.png'/>" onclick="fn_searchList();"/></button></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200" id="pl">
						<thead class="ftw400">
							<tr>
								<th scope="row">선택</th>
								<th scope="row">No</th>
								<th scope="row">계약번호</th>
								<th scope="row">고객사</th>
								<th scope="row">프로젝트명</th>
								<th scope="row">계약일자</th>
								<th scope="row">시작일</th>
								<th scope="row">종료일</th>
								<th scope="row">정기점검횟수</th>
								<th scope="row">검수방법</th>
								<th scope="row">백계약유무</th>
								<th scope="row">영업담당자</th>
								<th scope="row">관리담당자</th>
								<th scope="row">지원담당자</th>
							</tr>
						</thead>
						<tbody id="tbm">
						<c:forEach var="result" items="${resultList}" varStatus="status">
							<tr>
								<td onclick="event.cancelBubble = true;">
									<input type="radio" class="tCheck" name="m_gubun" id="check<c:out value="${result.rowNum}"/>" value="<c:out value="${result.mtIntegrateKey}"/>" /><label for="check<c:out value="${result.rowNum}"/>" class="cursorP"/>
								</td>
								<td><c:out value="${result.rowNum}"/></td>
								<td><c:out value="${result.mtCtKey}"/></td>
								<td align="left"><span title="${result.mtAcNm}"><c:out value="${result.mtAcNm}"/></span></td>
								<td align="left" class="listtd"><span title="${result.mtNm}"><c:out value="${result.mtNm}"/></span></td>
								<td><c:out value="${displayUtil.displayDate(result.mtCtDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.mtStartDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.mtEndDt)}"/></td>
								<td><c:out value="${result.mtRgInspectCnt}"/>회</td>
								<td><c:out value="${result.mtImCd}"/></td>
								<td><c:out value="${result.mtSbCtYn}"/></td>
								<td><c:out value="${result.saleEmpNm}"/></td>
								<td><c:out value="${result.mngEmpNm}"/></td>
								<td><c:out value="${result.supportEmpNm}"/></td>
							</tr>						
						</c:forEach>
							
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button type="button" value="수정" onclick="fn_modifyBtn();"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
						<button type="button" value="삭제" onclick="fn_deleteBtn();"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button type="button" value="엑셀 다운로드" onclick="fn_excelBtn();"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>"/></button>
					</div>
				</div>
			</div>
		</div>	
    </form:form>
</body>
</html>