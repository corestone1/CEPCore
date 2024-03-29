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
			width: 997px;
		}
		#detailForm .stitle ul li {
			width: 150px;
		}
		#detailForm .stitle ul li a {
			color: #a3a3a4;
			padding-bottom: 10px;
			display: block;
		    width: 498.5px;
		    border-bottom: 4px solid #c3c3c3;
		}
		#detailForm .stitle ul li a:hover {
			color: #000;
			border-bottom: 4px solid #6a5bae;
		}
		#detailForm .stitle ul li a.on {
			color: #000;
			border-bottom: 4px solid #6a5bae;
		}
		.contents .dtl {
			overflow: hidden;
			margin-top: -10px;
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
			height: 524px;
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
			background-color: #ddf0ec
		}
		.contents .dtl tbody tr td:nth-child(4) {
			font-weight: 400;
		}
		.contents .dtl thead th
		, .contents .dtl tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}
		.contents .dtl tbody tr td {
			font-weight: 200;
		}
		
		.contents .dtl thead th:first-child,
		.contents .dtl tbody td:first-child {
			width: 40px;
			padding: 0;
		}
		.contents .dtl thead th:nth-child(2),
		.contents .dtl tbody td:nth-child(2){
			width: 40px;
		}
		.contents .dtl thead th:nth-child(3),
		.contents .dtl tbody td:nth-child(3) {
			width: 100px;
			max-width: 100px;
		}
		.contents .dtl thead th:nth-child(4),
		.contents .dtl tbody td:nth-child(4) {
			width: 250px;
			max-width: 250px;
		}
		.contents .dtl thead th:nth-child(5),
		.contents .dtl tbody td:nth-child(5){
			width: 90px;
		}
		.contents .dtl thead th:nth-child(6),
		.contents .dtl tbody td:nth-child(6) {
			width: 105px;
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
		input[class="tRadio"]:checked+label:before {
			line-height: 23px;
		}
	</style>
	<script>
		$(document).ready(function() {
			$(parent.document).find("#modMinInfo").removeClass("dpNone");
			$(parent.document).find("#delMinInfo").removeClass("dpNone");
		});
		
		function fn_addView(link){
			var litIdx = parseInt($('input[name="m_gubun"]:checked').val()) - 1;
			
			var dialogId = 'program_layer';
			
			var varParam = {'pjKey' : $('#ipt_pjKey').val(), "inbSeq" :  $('input[name="inbSeq"]').eq(litIdx).val()};
			
			var button = new Array;
			button = [];
			
			parent.showModalPop(dialogId, "/project/write/workInfo.do", varParam, button, '', 'width:1144px;height:708px;ifram:true;iframid:ifr_ProjectInfo');
		}
		
		function fnCallContrect()
		{
			location.href = "/project/detail/workingMin.do?pjKey=${projectInfo.pjKey}";
		}
		
		
		function fnViewModify() {
			
			//설치구축 key 구하기
			
			var litIdx = parseInt($('input[name="m_gubun"]:checked').val()) - 1;
			
			//alert(litIdx + "\n" + $('input[name="pjWorkSeq"]').eq(litIdx).val());
			
			var dialogId = 'program_layer';
			
			var varParam = {'pjKey' : $('#ipt_pjKey').val(), "pjWorkSeq" :  $('input[name="pjWorkSeq"]').eq(litIdx).val()};
			
			var button = new Array;
			button = [];
			
			parent.showModalPop(dialogId, "/project/write/workInfo.do", varParam, button, '', 'width:1144px;height:708px');
		}
		
		function fnViewDelete() {
			if(confirm("삭제하시겠습니까?")) {
				
				var litIdx = parseInt($('input[name="m_gubun"]:checked').val()) - 1;
				
				var jsonData = {'pjKey' : $('#ipt_pjKey').val(), "pjWorkSeq" :  $('input[name="pjWorkSeq"]').eq(litIdx).val()};
				
				
				$.ajax({
		        	url :"/project/detail/workDelete.do",
		        	type:"POST",  
		            data: jsonData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		//alert(data.accountList[0].acNm);
		        		//선택 목록 생성
		        		if(data.successYN == 'Y') {
		        			alert("삭제 되었습니다.");
		        		} else {
		        			alert("삭제를 실패하였습니다.");
		        		}
		        		location.reload();
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    	});
			}
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
							<ul>
								<li style="width: 50%;"><a onclick="javascript:fnCallContrect();">설치/구축(Install Base)</a></li> <!--  height: 35px; border-bottom: 4px solid #6a5bae" -->
								<li style="width: 50%;"><a class="on">수행 일지</a></li>
								<li></li>
							</ul>
						</div>
						<div class="floatC">
							<table class="dtl">
								<thead class="ftw400">
									<tr>
										<th scope="row">선택</th>
										<th scope="row">No</th>
										<th scope="row">일시</th>
										<th scope="row">작업명</th>
										<th scope="row">작업자</th>
										<th scope="row">소요시간</th>
									</tr>
								</thead>
								<tbody>
									<!-- <tr onclick="fn_addView('workInfo');"><td colspan="9" style="padding: 10px 7px;"><span>등록 <img src="/images/btn_add-pop-small.png" /></span></td></tr> -->
									<c:forEach var="workList" items="${workList}" varStatus="status">
										<tr>
											<td class="textalignC" onclick="event.cancelBubble = true;">
												<input type="radio" class="tRadio" name="m_gubun" id="check1${status.count}" value="${status.count}"/>
												<label for="check1${status.count}" class="cursorP"/>
											</td>
											<td class="textalignC"><c:out value="${status.count}"/></td>
											<td class="textalignC"><c:out value="${displayUtil.displayDate(workList.pjWorkDt)}"/>&nbsp<c:out value="${displayUtil.displayTime(workList.pjWorkTakeTm)}"/></td>
											<td class="textalignL"><span title=""><c:out value="${workList.pjWorkNm}"/></span></td>
											<td class="textalignC"><c:out value="${workList.pjWorkEmpNm}"/></td>
											<td class="textalignC"><c:out value="${displayUtil.displayTime(workList.pjWorkTm)}"/></td>
										</tr>
										<input type="hidden" name="pjWorkSeq" value="${workList.pjWorkSeq}" />
									</c:forEach>
									<!-- 
									<tr>
										<td class="textalignC" onclick="event.cancelBubble = true;">
											<input type="radio" class="tCheck" name="m_gubun" id="check4" />
											<label for="check4" class="cursorP"/>
										</td>
										<td class="textalignC">4</td>
										<td class="textalignC"><span title="">2020-01-03 16:00</span></td>
										<td class="textalignL"><span title="">HDD Disk 교체</span></td>
										<td class="textalignC">김규민</td>
										<td class="textalignC">1시간</td>
									</tr>
									 -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="floatC"></div>
			</div>
		</div>	
	</form>
</body>
</html>