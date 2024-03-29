<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>CEP 샘플 화면(프로젝트 상세보기)</title>
	
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/popup.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/datepicker.min.css'/>"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value='/js/popup.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	
	
	<style>
		body {
			overflow: hidden !important;
		}
		.sfcnt {
			height: 91px;
		}
		.btnWrap {
			position: absolute;
			bottom: 31px;
		}
		.btnWrap.lt {
			left: 127px;
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
			/* box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); */
			height: 830px;
		}
		form .contentsWrap .contents {
			/* padding: 38px 71px;  */
			/* width: 1662px; */
			width: 987px;
		}
		form .title {
			height: 50px;
		}
		form .title > label {
			font-size: 26px;
		}
		form .contents > div:first-child {
			/* width: 45%; */
			width: 100%;
		}
		form .contents > .fxd {
			/* width: 55%; */
			width: 100%;
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
		form .contents > div > div > div > table {
			border-collapse: collapse;
			font-size: 15px;
		} 
		form .contents > div > div > div > table tr td {
			padding: 13px 20px;
		}
		form .contents > div > div > div > table tr td:first-child {
			width: 140px;
			font-weight: 400;
		} 
		form .contents > div > div > div > table tr td:last-child {
			width: 400px;
			font-weight: 200;
		}
		form .contents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			border: 1px solid #bee2da;
		}
		form .contents .bsc tr td {
			color: #0e8a67;
		}
		form .contents .bsc tr td:first-child {
			box-shadow: inset -7px 0 9px -4px #d0e2de;
		}
		form .contents > .fxd .stitle ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		form .contents > .fxd .stitle ul li:last-child {
			clear: both;
			float: none;
			width: 0 !important;
		}
		#detailForm .stitle ul {
			width: 915px;
		}
		#detailForm .stitle ul li {
			width: 150px;
		}
		#detailForm .stitle ul li a {
			color: #a3a3a4;
			padding-bottom: 10px;
		}
		#detailForm .stitle ul li a:hover {
			color: #000;
			border-bottom: 4px solid #6a5bae;
		}
		#detailForm .stitle ul li a.on {
			color: #000;
			border-bottom: 4px solid #6a5bae;
		}
		/*
		form .contents .dtl {
			border-top: 4px solid #c3c3c3;;
			overflow: hidden;
		}
		form .contents .dtl tbody {
			overflow-y: auto;
			overflow-x: hidden;
			height: 547px;
			float: left;
		}
		form .contents .dtl tbody tr {
			border: 1px solid #ebe9ee;
		}
		form .contents .dtl td {
			color: #000;
		}
		form .contents .dtl tr td:first-child {
			background-color: #e1dff5;
			border-right: 1px solid #ebe9ee;
		}
		form .contents .dtl tr td:last-child {
			width: 770px;
		}
		*/
		
		
		.contents .dtl {
			width: 997px;
			font-size: 14px;
			border-collapse: collapse;
			font-weight: 300;
			overflow: hidden;
			border-top: 4px solid #6a5baf;
		}
		.contents .dtl thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
		.contents .dtl thead tr {
			display: table;
			width: 997px;
		}
		.contents .dtl tbody {
			width: 997px;
			/* height: 532px; */
			height: 194px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			border-bottom: 2px solid #c4c4c4;
		}
		.contents .dtl tbody tr {
			display: table;
			width: 997px;
			cursor: pointer;
		}
		.contents .dtl tbody tr:hover {
			background-color: #ddf0ec !important;
		}
		.contents .dtl thead th
		, .contents .dtl tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
		}
		.contents .dtl tbody tr td {
			font-weight: 200;
		}
		
		.contents .tblWidth thead th:first-child,
		.contents .tblWidth tbody td:first-child {
			width: 40px;
			padding: 0;
		}
		.contents .tblWidth thead th:nth-child(2),
		.contents .tblWidth tbody td:nth-child(2){
			width: 40px;
		}
		.contents .tblWidth thead th:nth-child(3),
		.contents .tblWidth tbody td:nth-child(3) {
			width: 80px;
			max-width: 80px;
		}
		.contents .tblWidth thead th:nth-child(4),
		.contents .tblWidth tbody td:nth-child(4) {
			width: 90px;
			max-width: 90px;
		}
		.contents .tblWidth thead th:nth-child(5),
		.contents .tblWidth tbody td:nth-child(5){
			font-weight: 400;
			width: 180px;
			max-width: 180px;
		}
		.contents .tblWidth thead th:nth-child(6),
		.contents .tblWidth tbody td:nth-child(6) {
			width: 160px;
			max-width: 160px;
		}
		
		.contents .tblWidth thead th:nth-child(7),
		.contents .tblWidth tbody td:nth-child(7) {
			width: 50px;
		}
		.contents .tblWidth thead th:nth-child(8),
		.contents .tblWidth tbody td:nth-child(8) {
			width: 120px;
		}
		.contents .tblWidth thead th:last-child,
		.contents .tblWidth tbody td:last-child {
			width: 60px;
		}
		
		
		.contents .tbl2Width thead th:first-child,
		.contents .tbl2Width tbody td:first-child {
			width: 50px;
			padding: 0;
		}
		.contents .tbl2Width thead th:nth-child(2),
		.contents .tbl2Width tbody td:nth-child(2) {
			font-weight: 400;
			width: 330px;
			max-width: 330px;
		}
		.contents .tbl2Width thead th:nth-child(3),
		.contents .tbl2Width tbody td:nth-child(3) {
			width: 150px;
			max-width: 150px;
		}
		.contents .tbl2Width thead th:nth-child(4),
		.contents .tbl2Width tbody td:nth-child(4){
			width: 170px;
			max-width: 170px;
		}
		.contents .tbl2Width thead th:nth-child(5),
		.contents .tbl2Width tbody td:nth-child(5){
			width: 180px;
			max-width: 180px;
		}
		
		.contents .dtl tbody tr td > button {
			text-decoration: underline;
		}
		.contents .dtl tbody tr td > button:hover {
			color: blue;
		}
		
		.contents .dtl tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 90%;
			margin: 0 auto;
		}
		.contents .dtl tbody tr td img {
			vertical-align: middle;
		}
		input[class="tRadio"]+ label {
			line-height: 2.4 !important;
		}
	</style>
	<script>
		$(document).ready(function() {
			
			//Order Product 목록 호출
			if("${orderList[0].pjOrderKey}" != null && "${orderList[0].pjOrderKey}" != "")
				fnSearchProductList("${orderList[0].pjOrderKey}");
			
			$(".contents .dtl tbody tr").click(function() {
				$(".contents .dtl tbody tr").each(function() {
					$(this).css("background-color", "#fff");
				});
				$(this).css("background-color", "#ddf0ec");
			});
			
			$(".contents .dtl tbody tr:first-child").css("background-color", "#ddf0ec");
			
			$(parent.document).find("#modMinInfo").removeClass("dpNone");
			$(parent.document).find("#delMinInfo").removeClass("dpNone");
		});
		
		
		
		function fnSearchProductList(pstOrderKey){
		
			//alert('pstOrderKey : ' + pstOrderKey);
			var jsonData = {'orderKey' : pstOrderKey};
			
			$.ajax ({
				  url:"/project/detail/selectOrderProductList.do"
				, type:'POST'
				, data: jsonData
				, dataType:'json'
				, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
				, success:function(data){	
					fnMakeProductList(data.productList);
	            	//location.href = "/project/detail/main.do?pjKey=" + $('#iph_pjKey').val();
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
			});
		}
		
		function fnMakeProductList(pjProductList){
			
			$('#tbl_productList').remove();
			
			var html = '';
			var litListCnt = pjProductList.length;
			
			/* 
			<thead class="ftw400">
				<tr>
					<th scope="row">선택</th>
					<th scope="row">No</th>
					<th scope="row">제품</th>
					<th scope="row">수량</th>
					<th scope="row">단가</th>
					<th scope="row">합계</th>
				</tr>
			</thead>
			<tbody>
			 */
			
			html = '<table id="tbl_productList" class="dtl tbl2Width excelSheet">'
			     + '<thead class="ftw400">'
			     +     '<tr>'
			     +        '<th scope="row">No</th>'
			     +        '<th scope="row">제품</th>'
			     +        '<th scope="row">수량</th>'
			     +        '<th scope="row">단가</th>'
			     +        '<th scope="row">합계</th>'
			     +     '</tr>'
			     +  '</thead>'
			     +  '<tbody>'
			     ;
			 
			for(var i = 0; i < litListCnt; i++)
			{
				/* 
				<tr>
					<td class="textalignC" onclick="event.cancelBubble = true;">
						<input type="radio" class="tCheck" name="m_gubun2" id="check21" />
						<label for="check21" class="cursorP"/>
					</td>
					<td class="textalignC">1</td>
					<td class="textalignL"><span title="PowerEdge R640">PowerEdge R740</span></td>
					<td class="textalignC">3</td>
					<td class="textalignR">600,000,000</td>
					<td class="textalignR">1,800,000,000</td>
				</tr>
				 */
				 
				 html += '<tr>'
				      +     '<td class="textalignC">' + (i+1) + '</td>'
				      +     '<td class="textalignL"><span title="' + pjProductList[i].pmNm + '">' + pjProductList[i].pmNm + '</span></td>'
				      +     '<td class="textalignC">' + pjProductList[i].orderQuantity + '</td>'
				      +     '<td class="textalignR">' + addCommas(pjProductList[i].orderUprice) + '</td>'
				      +     '<td class="textalignR">' + addCommas(pjProductList[i].orderQuantity * pjProductList[i].orderUprice) + '</td>'
				      +  '</tr>'
				      ;
				
			}
			
			 html += '</tbody>'
			      +  '</table>';
			 
			$('#div_productList').append(html);
			
		}
		
		
		function fnViewAdd() {
			
			var dialogId = 'program_layer';
			
			var varParam = {'pjKey' : $('#ipt_pjKey').val() };
			
			var button = new Array;
			button = [];
			
			parent.showModalPop(dialogId, "/project/write/orderInfo.do", varParam, button, '', 'width:1144px;height:706px;ifram:true;iframid:ifr_ProjectInfo');
		}
		
		
		function fnViewModify() {
			
			if($('input[name="m_gubun"]:checked').val() == undefined) {
				alert('수정할 데이터를 선택해 주세요.');
			} else {
			
				var dialogId = 'program_layer';
				
				var varParam = {'pjKey' : $('#ipt_pjKey').val(), 'selectKey' : $('input[name=m_gubun]:checked').val()};
				
				var button = new Array;
				button = [];
				
				parent.showModalPop(dialogId, "/project/write/orderInfo.do", varParam, button, '', 'width:1144px;height:706px;ifram:true;iframid:ifr_ProjectInfo');
			}
		}
		
		
		function fnViewDelete() {
			if(confirm("삭제하시겠습니까?")) {
				
				var litIdx = parseInt($('input[name="m_gubun"]:checked').val()) - 1;
				
				var jsonData = {'pjKey' : $('#ipt_pjKey').val(), "pjOrderKey" :  $('input[name="m_gubun"]:checked').val()};
				
				//alert(litIdx + "\n" + $('input[name="pjOrderKey"]').eq(litIdx).val());
				
				$.ajax({
		        	url :"/project/detail/orderDelete.do",
		        	type:"POST",  
		            data: jsonData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		//alert(data.accountList[0].acNm);
		        		//선택 목록 생성
		        		if(data.successYN == 'Y') {
		        			if(data.isMapped == 'TRUE') {
			        			alert("이미 계산서와 매핑된 발주는 삭제할 수 없습니다.");	
			        		} else {
			        			alert("삭제되었습니다.");
			        			location.reload();
			        		}
		        		} else {
		        			alert("삭제를 실패하였습니다.");
		        		}
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    	}); 
			}
		}
		
		function fnRequestPurchase(pjKey, pjOrderKey) {
			window.parent.location.href='/project/request/purchase/main.do?mainKey='+pjKey+'&orderKey='+pjOrderKey+'';
		}
		
	</script>
</head>
<body>
	<form id="listForm" name="listForm" method="post">
		<input type="hidden" id="ipt_pjKey" name="pjKey" value="${projectInfo.pjKey}" />
		
		<div class="contentsWrap">
			<div class="contents">
				<div class="floatL dpBlock fxd">
					<div id="detailForm">
						<div class="stitle">
							발주목록 <button type="button" onclick="fnViewAdd();" style="vertical-align: text-bottom;"><img src="/images/btn_add-pop.png" /></button>
						</div>
						<div class="floatC">
							<table class="dtl tblWidth excelSheet" style="width: 100%;">
								<thead class="ftw400">
									<tr>
										<th scope="row">선택</th>
										<th scope="row">No</th>
										<th scope="row">발주번호</th>
										<th scope="row">발주일</th>
										<th scope="row">발주처</th>
										<th scope="row">담당자</th>
										<th scope="row">수량</th>
										<th scope="row">합계</th>
										<th scope="row">발주자</th>
										<th scope="row">매입금 지급 정보</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="orderList" items="${orderList}" varStatus="status">
										<tr onclick='javascript:fnSearchProductList("${orderList.pjOrderKey}");'>
											<td class="textalignC" onclick="event.cancelBubble = true;">
												<input type="radio" class="tRadio" name="m_gubun" id="check${status.count}" value="${orderList.pjOrderKey}"/>
												<label for="check${status.count}" class="cursorP"/>
											</td>
											<td class="textalignC"><c:out value="${status.count}"/></td>
											<td class="textalignC"><c:out value="${orderList.pjOrderKey}"/></td>
											<td class="textalignC"><c:out value="${displayUtil.displayDate(orderList.orderDt)}" /></td>
											<td class="textalignC"><span title=""><c:out value="${orderList.orderAcNm}"/></span></td>
											<td class="textalignC"><c:out value="${orderList.orderAcDirectorNm}"/></td>
											<td class="textalignR"><c:out value="${orderList.orderProductCnt}"/></td>
											<td class="textalignC"><c:out value="${displayUtil.commaStr(orderList.orderAmount)}"/></td>
											<td class="textalignC"><c:out value="${orderList.orderEmpNm}"/></td>
											<td><button type="button" onclick="javascript:fnRequestPurchase('${projectInfo.pjKey}','${orderList.pjOrderKey}' )"><img src="/images/btn_to.png" /></button></td>
										</tr>
										<input type="hidden" name="pjOrderKey" value="${orderList.pjOrderKey}" />
									</c:forEach>
									<!-- 
									<tr>
										<td class="textalignC" onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="m_gubun" id="check2" />
											<label for="check2" class="cursorP"/>
										</td>
										<td class="textalignC">1</td>
										<td class="textalignC">OD20021</td>
										<td class="textalignC">2020-12-22</td>
										<td class="textalignC"><span title="">ECS EX300</span></td>
										<td class="textalignC">Dell Technologies</td>
										<td class="textalignR">10</td>
										<td class="textalignC">340,0000,000</td>
										<td class="textalignC">권용남</td>
									</tr>
									 -->
								</tbody>
							</table>
						</div>
					</div>
					
					<div class="stitle cg colorBlack">제품정보</div>
					<div id="div_productList" class="floatC">
						<table id="tbl_productList" class="dtl tbl2Width excelSheet">
							<thead class="ftw400">
								<tr>
									<th scope="row">No</th>
									<th scope="row">제품</th>
									<th scope="row">수량</th>
									<th scope="row">단가</th>
									<th scope="row">합계</th>
								</tr>
							</thead>
							<tbody>
								<!-- 
								<tr>
									<td class="textalignC" onclick="event.cancelBubble = true;">
										<input type="radio" class="tCheck" name="m_gubun2" id="check21" />
										<label for="check21" class="cursorP"/>
									</td>
									<td class="textalignC">1</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R740</span></td>
									<td class="textalignC">3</td>
									<td class="textalignR">600,000,000</td>
									<td class="textalignR">1,800,000,000</td>
								</tr>
								<tr>
									<td class="textalignC" onclick="event.cancelBubble = true;">
										<input type="radio" class="tCheck" name="m_gubun2" id="check22" />
										<label for="check22" class="cursorP"/>
									</td>
									<td class="textalignC">2</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R740</span></td>
									<td class="textalignC">3</td>
									<td class="textalignR">600,000,000</td>
									<td class="textalignR">1,800,000,000</td>
								</tr>
								 -->
							</tbody>
						</table>
					</div>
				</div>
				<div class="floatC"></div>
			</div>
		</div>	
	</form>
</body>
</html>