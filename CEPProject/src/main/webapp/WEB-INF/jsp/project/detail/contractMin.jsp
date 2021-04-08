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
			width: 997px;
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
		
		input[type="text"] {
		 	width: 177px;
		    height: 34px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 4px;
		}
		input[class="calendar"] {
		    background-image: url(./images/calendar_icon.png);
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		select {
			height: 37px;
		    width: 130px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    -webkit-appearance: none;
		    background: url(./images/arrow_down.png) no-repeat 91% 50%;
		    background-color: #fff;
		    color: #535353;
		    font-size: 15px;
		}
		textarea {
			border: 1px solid #e6e6e6;
			padding: 0 10px;
		}
		
	</style>
	<script>
		$(document).ready(function() {
			var index = $('form .contents > .fxd .title ul li.on').index() + 2;
			var length = $('form .contents > .fxd .title ul li').length;
			$('form .contents > .fxd .title ul li:nth-child(' + index + ')').toggleClass("liArrow");
		
			for(var i = 0; i < length; i++) {
				if(i < index) {
					$('form .contents > .fxd .title ul li:nth-child(' + i + ')').css("background-color","#4c3d92");
					$('form .contents > .fxd .title ul li:nth-child(' + i + ')').addClass('liAfterNone');
				}
			}
			
			$('li[id^=LI_TOPBar]').click(function(event){ location.href = this.title; event.preventDefault();});
			
			$('form .contents > .fxd .title ul li').mouseover(function(){ 
				var index2 = $('form .contents > .fxd .title ul li').index(this);
				for(var i = (index - 1); i <= index2; i++) {
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on') {
						$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').css('background-color','#b9b9b9');
					} 
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on' && (i + 1) <= index2) {
						$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').addClass('liAfter');
					}
				}
			});
			
			$('form .contents > .fxd .title ul li').mouseout(function(){ 
				var index2 = $('form .contents > .fxd .title ul li').index(this);
				for(var i = (index - 1); i <= index2; i++) {
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on') {
						$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').css('background-color','#d3d3d3');
					}
					if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on' && (i + 1) <= index2) {
					 	$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').removeClass('liAfter'); 
					}
				}
			});
		});
		
		function fnCallContrect()
		{
			location.href = "/project/detail/contractMin2.do?pjKey=${projectInfo.pjKey}";
		}
		
		
		function fnViewDelete() {
			if(confirm("삭제하시겠습니까?")) {
				
				var jsonData = {'pjKey' : $('#ipt_pjKey').val(), 'ctKey' :  $('#ipt_CtKey').val()};
			
				$.ajax({
		        	url :"/project/detail/contractDelete.do",
		        	type:"POST",  
		            data: jsonData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		//alert(data.accountList[0].acNm);
		        		//선택 목록 생성
		        		alert("삭제 되었습니다.!");
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
		
		
		function fnViewModify() {
			
			var dialogId = 'program_layer';
			
			var varParam = {'pjKey' : $('#ipt_pjKey').val(), 'ctKey' : $('#ipt_CtKey').val()};
			
			var button = new Array;
			button = [];
			
			parent.showModalPop(dialogId, "/project/write/contractInfo.do", varParam, button, '', 'width:1144px;height:708px');
			
		}
		/* 
		function fnViewModify(){
			
			alert('viewModify()');
			
			var modCh = 1;
			if(modCh % 2 == 1) {
				$("#selectTable").css('display','none'); 
				$("#modTable").removeClass('dpNone');
				$("#modInfo img").attr('src',"/images/btn_save.png");
			} else {
				// alert('수정되었습니다.'); 
				 var object = {};
	           	var formData = $("#viewForm").serializeArray();
	           	for (var i = 0; i<formData.length; i++){
	                
	                object[formData[i]['name']] = formData[i]['value'];
	             }
	           	var data = JSON.stringify(object);
	           
				$.ajax ({
					url:"/project/update/biddingInfo.do",
					type:'post',
					data: data,
					dataType:'json',
					contentType: "application/json; charset=UTF-8", 
					success:function(data){	
		            	alert('첨부파일 저장');
		            	 
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
				}); 
				// location.reload(); 
			}
			modCh++;
			
		}
		 */
	</script>
</head>
<body>
	<form id="listForm" name="listForm" method="post">
		
		<input type="hidden" id="ipt_pjKey" name="pjKey" value="${contractInfo.pjKey}" />
		<input type="hidden" id="ipt_CtKey" name="ctKey" value="${contractInfo.ctKey}" />
		
		<div class="contentsWrap">
			<div class="contents">
				<div class="floatL dpBlock fxd">
					<div id="detailForm">
						<div class="stitle">
							<ul>
								<li style="width: 50%;"><a class="on">계약정보</a></li> <!--  height: 35px; border-bottom: 4px solid #6a5bae" -->
								<li style="width: 50%;"><a onclick="javascript:fnCallContrect();">수금계획</a></li>
								<li></li>
							</ul>
						</div>
						<div class="floatC">
							<c:choose>
								<c:when test='${contractInfo.taxYn eq "Y"}'>
									<c:set var="taxYnText" value="부가세 포함" />
								</c:when>
								<c:otherwise>
									<c:set var="taxYnText" value="부가세 별도" />
								</c:otherwise>
							</c:choose>
							
							<!-- 계약정보 표기 시작 -->
							<table class="dtl" style="width: 100%;" id="selectTable">
								<tr style="width: 100%;">
									<td>계약금액</td>
									<td><c:out value="${displayUtil.commaStr(contractInfo.ctAmount)}" /> 원 (<c:out value="${taxYnText}" />)</td>
								</tr>
								<tr>
									<td>결재조건</td>
									<td><c:out value="${contractInfo.ctPayTerms}" /></td>
								</tr>
								<tr>
									<td>지급 회차</td>
									<td><c:out value="${contractInfo.collectTurn}" />회</td>
								</tr>
								<tr>
									<td>계약일</td>
									<td><c:out value="${displayUtil.displayDate(contractInfo.ctDt)}" /></td>
								</tr>
							</table>
							<!-- 계약정보 표기 끝 -->
							
							<!-- 계약정보 수정 시작 -->
							<table class="dtl dpNone" id="modTable">
								<tr style="width: 100%;">
									<td>계약금액</td>
									<td>
										<input type="text" name="ctAmount" value='<c:out value="${displayUtil.commaStr(contractInfo.ctAmount)}" />' />
										<c:out value="${taxYnText}" />
									</td>
								</tr>
								<tr>
									<td>결재조건</td>
									<td>
										<input type="text" name="ctPayTerms" value='<c:out value="${contractInfo.ctPayTerms}" />' />
									</td>
								</tr>
								<tr>
									<td>지급 회차</td>
									<td>
										<input type="text" name="collectTurn" value='<c:out value="${contractInfo.collectTurn}" />' />회
									</td>
								</tr>
								<tr>
									<td>계약일</td>
									<td>
										<input type="text" name="ctDt" value='<c:out value="${displayUtil.displayDate(contractInfo.ctDt)}" />' class="calendar"/>
									</td>
								</tr>
							
							</table>
							<!-- 계약정보 수기 끝 -->
						</div>
					</div>
				</div>
				<div class="floatC"></div>
			</div>
		</div>	
	</form>
</body>
</html>