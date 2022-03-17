<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<%@include file="/WEB-INF/jsp/cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Forecast</title>
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
			/* box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); */
			height: 830px;
		}
		form .contentsWrap .contents {
			padding: 38px 71px; 
			width: 1662px;
		}
		form .title > label {
			font-size: 26px;
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
			background-image: url('./images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
			font-size: 15px;
			margin-bottom: 3px;
		}
		.middle table {
			width: 1662px;
			font-size: 15px;
			margin-top: 16px;
			border-collapse: collapse;
			overflow: hidden;
			text-overflow: ellipsis;
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
			height: 545px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.middle table tbody tr {
			display: table;
			width: 1662px;
			cursor: pointer;
		}
		.middle table tbody tr td:nth-child(3) > span {
			max-width: 142px;
		}
		.middle table tbody tr td > span {
			display: inline-block;
	        overflow:hidden; 
	        text-overflow:ellipsis; 
	        white-space:nowrap;
	        width: 84%;
	        max-width: 203px;
	        margin: 0 auto;
		}
		.middle table tbody tr:hover {
			background-color: #ddf0ec;
		}
		.middle table thead th, .middle table tbody tr td {
			padding: 10px 15px;
			border: 1px solid #edebef;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child {
			width: 22px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 88px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 142px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 282px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 71px;
		}
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 236px;
		}
		/* .middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 55px;
		} */
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7),
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(8),
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9) {
			width: 100px;
		}
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10) {
			width: 63px;
		}
		.middle table thead th:nth-child(11),
		.middle table tbody td:nth-child(11) {
			width: 50px;
		}
		.middle table tbody tr td > img {
			width: 25px;
			vertical-align: middle;
		}
		.detailList {
			width: 90%;
			margin: 0 auto;
			min-width: 1495px;
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
			width: 637px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		.detailList li:last-child {
			width: 1059px;
   			height: 56px;
   			word-break: break-all;
   			white-space: normal;
   			overflow: auto;
   			line-height: 1.5;
		}
		.sum table {
		    width: 100%;
		    margin: 0;
		    border: none;
		}
		.sum table tbody {
		    height: auto;
		}
		.sum table tr td {
		    padding: 10px !important;
		    color: #26a07d !important;
		    background-color: #ccf4d7;
		    text-align: right;
		    border: none !important;
		    font-size: 16px !important;
		}
		.sum table tbody tr td label {
		    margin-left: 57px;
		}
		.bottom > div {
			margin-top: 22px;
		}
		.help {
			vertical-align: middle;
		    line-height: 1;
		    cursor: pointer;
		}
      	.help[data-tooltip-text]:hover {
			position: relative;
		}
		.help[data-tooltip-text]:hover:after {
			background-color: #000000;
			background-color: rgba(0, 0, 0, 0.8);
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			color: #FFFFFF;
			font-size: 13px;
			font-weight: 200;
			content: attr(data-tooltip-text);
		  	margin-bottom: 10px;
			top: 91%;
			left: -156px;    
			padding: 7px 12px;
			position: absolute;
			width: auto;
			min-width: 150px;
			max-width: 300px;
			word-wrap: break-word;
			z-index: 9999;
		}
		.yearspan {
		    visibility: hidden;
		    width: 230px;
		    height: 25px;
		    background-color: #404040;
		    color: #ffffff;
		    text-align: center;
		    border-radius: 6px;
		    padding: 5px 0;
		    position: absolute;
		    z-index: 9999;
		    font-size: 14px;
		    font-weight: 200;
		    top: 88px;
		    margin-left: -131px;
		}
		.yearspan::after {
			content: "";
		    position: absolute;
		    top: 100%;
		    left: 15%;
		    margin-left: -5px;
		    border-width: 5px;
		    border-style: solid;
		    border-color: #404040 transparent transparent transparent;
		}
	</style>
	<script>
		$(document).ready(function() {
			// 메일에서 바로 로드되는 화면
			if(getParameter("spKey") != null && getParameter("spKey") != "" && getParameter("spKey").length != 0
					&& getParameter("step") != null && getParameter("step") != "" && getParameter("step").length != 0) {
				var url = '/forecast/write/'+ getParameter("step") +'.do';
				var dialogId = 'program_layer';
				var varParam = {'spKey' : getParameter("spKey")};
				
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			}
			
			// 메일에서 로드되는 화면에서 종료 눌렀을 시
			$("#program_layer").dialog({
				resizable: "no",
				modal: true,
				title: '',
				open: function() {
					$('.ui-widget-overlay').addClass('custom-overlay');
				},
				close: function(event) {
					if(confirm('나가시겠습니까? 변경사항이 저장되지 않을 수 있습니다.')) {
						$('.ui-widget-overlay').removeClass('custom-overlay');
						$('#program_layer').remove();
						history.replaceState({}, null, location.pathname);
					} else {
						$(this).dialog("open");
					}
				},
				buttons: button
			}); 
			
			
			
			$('#fl tbody tr > td:not(:nth-child(1))').click(function() {
				
				var litIdx   = parseInt($(this).parent().children().eq(0).children().eq(0).val());
				var spKey = $('input[name="spKey"]').eq(litIdx).val()
				
				var url = '/forecast/write/basic.do';
				var dialogId = 'program_layer';
				var varParam = {'spKey' : spKey};
				
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  
				
				/* var obj = this;
				var salesAcNmList = new Array();
				var pcAcNmList = new Array(); */
				
				/*$.ajax({
					url :"/forecast/select/fundInfo.do",
		        	type:"POST",  
		            data: {"spKey":spKey},
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					dataType: 'json',
					async : false,
		        	success:function(data){		  
		        		for(var i = 0; i < data.salesInfo.length; i++) {
		        			salesAcNmList.push(data.salesInfo[i].salesAcNm + " / 매출 일정: " + data.salesInfo[i].fcSalesDt.substring(0,4)+"-"+data.salesInfo[i].fcSalesDt.substring(4,6) +" / 수금 일정: " + data.salesInfo[i].fcCollectDt + " / 매출액: " + addCommas(data.salesInfo[i].fcSalesAmount));
		        		}
		        		for(var i = 0; i < data.pcInfo.length; i++) {
		        			pcAcNmList.push(data.pcInfo[i].buyAcNm);
		        		}
		        		if(!$(obj).hasClass("viewOpen")) {
							html = '<div style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
							       + '<div style="margin: 5px 71px;">'
							       + '<ul class="detailList">'
							       + '<li>매출정보</li>'
							       + '<li title="'+salesAcNmList.join("<br>")+'">'+salesAcNmList.join("<br>")+'</li>'
							       + '<li>매입처</li>'
							       + '<li title="'+pcAcNmList+'">'+pcAcNmList+'</li>'
							       + '<li>수주확률</li>'
							       + '<li title="80%">80%</li>'
							       + '<li>제품상세</li>'
							       + '<li title="Avamar, Data Domain 외, 디스크, DP4400">Avamar, Data Domain 외, 디스크, DP4400</li>' 
							       + '<li>진행사항</li>'
							       + '<li>RFP 작업중</li>'
							       + '</ul>'
							       + '</div>'
							       + '</div>';
							$(obj).after(html);
							$(obj).attr('class', 'viewOpen');
						} else {
							$(obj).removeClass('viewOpen');
							$(obj).next().remove();
						}  
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		        }); */
		        
		        
				/* if($(this).next().hasClass("dpNone")) {
					$(this).next().removeClass("dpNone");
				}
				else {
					$(this).next().addClass("dpNone");
				} */
			});
			 
			$('#fl tr.mchkbox').each(function(index, item) {
				
				$(this).children().eq(0).append('<input type="radio" name="gubun" value="'+ index +'" class="tRadio" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				
			});
			
			
			
			$('#btn_delete').click(function() {
				
				if($('input[name="gubun"]').is(':checked') && $('input[name="gubun"]:checked').parent().parent().find("input[id='resultSpState']").val() != 'S') {
					if(confirm($('input[name="gubun"]:checked').parent().next().next().next().children().eq(0).html() + "(을)를 삭제하시겠습니까?")) {
						
						var litIdx = parseInt($('input[name="gubun"]:checked').val());
						
						var jsonData = {'spKey' : $('input[name="spKey"]').eq(litIdx).val()};
						
			           $.ajax({
				        	url :"/forecast/delete.do",
				        	type:"POST",  
				            data: jsonData,
				     	   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				     	   dataType: 'json',
				           async : false,
				        	success:function(data){		  
				            	alert("삭제되었습니다.");
				            	location.reload();
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
					
				} else if(!$('input[name="gubun"]').is(':checked')) {
					alert("삭제할 대상을 선택하세요.");
					
					return false;
				} else {
					alert("계약 완료된 Forecast는 삭제가 불가합니다.");
					
					return false;
				}
			});
			
			$('#btn_windeal').click(function() {
				
				
				if($('input[name="gubun"]').is(':checked') && 
						$('input[name="gubun"]:checked').parent().parent().find("input[id='resultSpState']").val() != 'S' &&
						$('input[name="gubun"]:checked').parent().parent().find("input[id='resultSpState']").val() != 'F') {
					if($('input[name="gubun"]:checked').parent().parent().children().find("label#salesAmount").html().length == 0) {
						alert($('input[name="gubun"]:checked').parent().next().next().next().children().eq(0).html() + "의 매출/매입 정보를 입력해주세요.");
						
						var litIdx   = parseInt($('input[name="gubun"]:checked').val());
						var spKey = $('input[name="spKey"]').eq(litIdx).val()
						
						var url = '/forecast/write/fundInfo.do';
						var dialogId = 'program_layer';
						var varParam = {'spKey' : spKey};
						
						var button = new Array;
						button = [];
						showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');   
					} else {
						if(confirm($('input[name="gubun"]:checked').parent().next().next().next().children().eq(0).html() + "(을)를 계약완료 처리하시겠습니까?")) {
							
							var litIdx = parseInt($('input[name="gubun"]:checked').val());
							
							var jsonData = {'spKey' : $('input[name="spKey"]').eq(litIdx).val(), 'spState':'S'};
							
				           $.ajax({
					        	url :"/forecast/changeStatus.do",
					        	type:"POST",  
					            data: jsonData,
					     	   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					     	   dataType: 'json',
					           async : false,
					        	success:function(data){		  
					            	alert("계약 완료 되었습니다.");
					            	location.reload();
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
					}
					
				} else if(!$('input[name="gubun"]').is(':checked')){
					alert("계약완료 처리할 대상을 선택하세요.");
					
					return false;
				} else if($('input[name="gubun"]:checked').parent().parent().find("input[id='resultSpState']").val() == 'S') {
					alert("이미 계약이 완료된 Forecast입니다.");
					
					return false;
				} else {
					alert("실주 상태로 등록된 Forecast입니다.");
					
					return false;
				}
			});
			
		
			$('#btn_loss').click(function() {
				if($('input[name="gubun"]').is(':checked') && 
						$('input[name="gubun"]:checked').parent().parent().find("input[id='resultSpState']").val() != 'S' &&
						$('input[name="gubun"]:checked').parent().parent().find("input[id='resultSpState']").val() != 'F') {
					if(confirm($('input[name="gubun"]:checked').parent().next().next().next().children().eq(0).html() + "을(를) 실주 등록 하시겠습니까?")) {
						var litIdx = parseInt($('input[name="gubun"]:checked').val());
						
						var jsonData = {'spKey' : $('input[name="spKey"]').eq(litIdx).val(), 'spState':'F'};
						
						$.ajax({
				        	url :"/forecast/changeStatus.do",
				        	type:"POST",  
				            data: jsonData,
				     	   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				     	   dataType: 'json',
				           async : false,
				        	success:function(data){		  
				            	alert("실주 등록 되었습니다.");
				            	location.reload();
				            },
				        	error: function(request, status, error) {
				        		if(request.status != '0') {
				        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				        		}
				        	} 
				        }); 
					}
				} else if(!$('input[name="gubun"]').is(':checked')){
					alert("실주 등록할 대상을 선택하세요.");
					
					return false;
				} else if($('input[name="gubun"]:checked').parent().parent().find("input[id='resultSpState']").val() == 'S') {
					alert("이미 계약이 완료된 Forecast입니다.");
					
					return false;
				} else {
					alert("이미 실주로 등록된 Forecast입니다.");
					
					return false;
				} 
			});
		
			$(".selectFromDt").mouseover(function() {
				$(".yearspan").css("visibility", "visible");
			});
			
			$(".selectFromDt").mouseout(function() {
				$(".yearspan").css("visibility", "hidden");
			});
		});
		
		
		function getParameter(name) {
			var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
		    
			if (results==null){
		       return null;
		    }
		    else{
		       return results[1] || 0;
		    }
		}

		function fn_addView(link){
			
			if(link == "forecastList") {
				location.href="<c:url value='/forecast/list.do'/>";
			} else {
				var url = '/forecast/write/'+link+'.do';
				var dialogId = 'program_layer';
				
				var varParam = {'spKey' : $('#m_ipt_spKey').val(), "workClass":$("#workClass").val()};
				
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			}
		}

		//Forecast 목록 조회 팝업
		function fn_searchListPop()
		{
			window.open('/forecast/popup/searchList.do?spKeyDomId=domIdSpKey&spBusiNm=domIdSpBusiNm','FORECAST_LIST','width=1000px,height=713px,left=600');
		}
		
		
		function fn_searchList()
		{                
			document.listForm.action = "/forecast/list.do";
           	document.listForm.submit(); 
		}
		
		
		//영업회의
		function fn_moveSalesMeeting() {
			document.listForm.action = "/forecast/salesMeetingList.do";
			document.listForm.submit();	
		}
		
	</script>
</head>
<body>
	<!-- <form id="listForm" name="listForm" method="post"> -->
	<c:set var="salesSum" value=""></c:set>
	<c:set var="pcSum" value=""></c:set>
	<form:form modelAttribute="searchVO" id="listForm" name="listForm" method="post">
		<!-- <div class="sfcnt"></div> -->
		<!-- <div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">Forecast list</label></div>
						<div class="addBtn floatL cursorP" onclick="javascript:fn_addView('basic')"><img src="<c:url value='/images/btn_add.png'/>" /></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_searchListPop()"><img src="<c:url value='/images/btn_add.png'/>" /></div>
						<div class="addBtn floatL cursorP" onclick="javascript:fn_moveSalesMeeting()"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<form:select path="pjFlag">
							<form:option value="">구분</form:option>
							<form:option value="P">상품/서비스</form:option>
							<form:option value="M">유지보수</form:option>
						</form:select>
						<form:select path="spState">
							<form:option value="">진행상태</form:option>
							<form:option value="A">A</form:option>
							<form:option value="B">B</form:option>
							<form:option value="C">C</form:option>
							<form:option value="D">D</form:option>
							<form:option value="S">계약</form:option>
							<form:option value="F">실주</form:option>
							<%-- <form:option value="S">S</form:option> --%>
						</form:select>
						<form:select path="searchFromDt" class="selectFromDt">
							<c:set var="now" value="<%=new java.util.Date() %>" />
							<c:set var="sysYear"><fmt:formatDate value="${now }" pattern="yyyy" /></c:set>
							<form:option value="">연도</form:option>
							<form:option value="${sysYear - 5}"><c:out value="${sysYear - 5 }" />년</form:option>
							<form:option value="${sysYear - 4}"><c:out value="${sysYear - 4 }" />년</form:option>
							<form:option value="${sysYear - 3}"><c:out value="${sysYear - 3 }" />년</form:option>
							<form:option value="${sysYear - 2}"><c:out value="${sysYear - 2 }" />년</form:option>
							<form:option value="${sysYear - 1}"><c:out value="${sysYear - 1 }" />년</form:option>
							<form:option value="${sysYear}"><c:out value="${sysYear}" />년</form:option>
							<form:option value="${sysYear + 1}"><c:out value="${sysYear + 1}" />년</form:option>
						</form:select>
						<span class="yearspan">상품/서비스: 매출연도, 유지보수: 기간</span>
						<%-- <form:select path="fcSjConfQt">
							<form:option value="0">분기</form:option>
							<form:option value="1"><c:out value="1" /> Q</form:option>
							<form:option value="2"><c:out value="2" /> Q</form:option>
							<form:option value="3"><c:out value="3" /> Q</form:option>
							<form:option value="4"><c:out value="4" /> Q</form:option>
						</form:select> --%>
						<form:select path="deptKey" style="width: 160px;">
							<form:option value="">부서</form:option>
							<c:forEach var="result" items="${departmentList}" varStatus="status">
								<c:choose>
									<c:when test="${fn:contains(result.deptKey, 'OPER')  }">
									</c:when>
									<c:otherwise>
										<form:option value="${result.deptKey }"><c:out value="${result.deptNm }" /> </form:option>
									</c:otherwise>
								</c:choose> test="${fn:contains(result.deptKey, 'OPER')  }">
							</c:forEach>
						</form:select>
						<form:select path="searchFlag">
							<form:option value="">검색조건</form:option>
							<form:option value="AC">고객명</form:option>
							<form:option value="BN">사업명</form:option>
						</form:select>
						<form:input type="text" path="searchValue" placeholder="검색어" onKeyPress="if(event.keyCode==13){fn_searchList();}"/>
						<span id="span_search" class="veralignT" onclick="javascript:fn_searchList()"><img src="/images/icon_search.png" /></span>
					</div>
					<div class="floatC"></div>
					<!-- <div>계약 상태 표시 <input type="checkbox" /></div> -->
				</div>
				<div class="middle">
					<table class="textalignC ftw200 excelSheet" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">선택</th>
								<th scope="row">구분</th>
								<th scope="row">고객사</th>
								<th scope="row">사업명</th>
								<th scope="row">제품구분</th>
								<th scope="row">제품설명</th>
								<!-- <th scope="row">수주확정</th> -->
								<th scope="row">매출액</th>
								<th scope="row">매입액</th>
								<th scope="row">매출총이익</th>
								<th scope="row">담당자</th>
								<th scope="row">
									상태
									<span class="help" data-tooltip-text="A: 수주 이후 계약 미체결 or 미발주 / B: 80%~ 100% 미만 / C: 30%~80%미만 / D: 30% 미만"><img src="/images/icon_help.png" /></span>
								</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="result" items="${forecastList}" varStatus="status">
							<tr class="mchkbox" <c:if test="${result.spState eq 'S' }">style="background-color:#ccf4d7;"</c:if>>
								<td></td>
								<td>
									<c:choose>
										<c:when test="${result.salesCtClass eq 'P' }">
											<span title="상품/서비스">상품/서비스</span>
										</c:when>
										<c:otherwise>
											<span title="유지보수">유지보수</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="textalignL"><span title="${result.mfAcNm}"><c:out value="${result.mfAcNm}"/></span></td>
								<td class="textalignL"><span class="spBusiNm ftw400" title="${result.spKey }"><c:out value="${result.spBusiNm}"/></span></td>
								<td>
									<c:choose>
										<c:when test="${result.pmKey eq  'ST'}">
											<span title="Storage">Storage</span>
										</c:when>
										<c:when test="${result.pmKey eq  'SV'}">
											<span title="Server">Server</span>
										</c:when>
										<c:when test="${result.pmKey eq  'BK'}">
											<span title="Backup">Backup</span>
										</c:when>
										<c:when test="${result.pmKey eq  'SW'}">
											<span title="S/W">S/W</span>
										</c:when>
										<c:when test="${result.pmKey eq  'ET'}">
											<span title="기타">기타</span>
										</c:when>
									</c:choose>
								</td>
								<td class="textalignL"><span title="${result.pmDetail}"><c:out value="${result.pmDetail}"/></span></td>
								<%-- <td><c:out value="${result.fcSjConfQt}"/> Q</td> --%>
								<td class="textalignR">
									<label id="salesAmount">
										<c:if test="${result.fcSalesAmount eq null }">0</c:if>
										<c:if test="${result.fcSalesAmount ne null }"><c:out value="${displayUtil.commaStr(result.fcSalesAmount)}"/></c:if>
									</label>
								</td>
								<td class="textalignR">
									<label id="buyAmount">
										<c:if test="${result.fcBuyAmount eq null }">0</c:if>
										<c:if test="${result.fcBuyAmount ne null }"><c:out value="${displayUtil.commaStr(result.fcBuyAmount)}"/></c:if>
									</label>
								</td>
								<td class="textalignR">
									<label id="profitAmount">
										<c:if test="${result.fcSalesProfit eq null }">0</c:if>
										<c:if test="${result.fcSalesProfit ne null }"><c:out value="${displayUtil.commaStr(result.fcSalesProfit)}"/></c:if>
									</label>
								</td>
								<td><span title="${result.empNm}"><label id="empNm"><c:out value="${result.empNm}"/></label></span></td>
								<td>
									<c:choose>
										<c:when test="${result.spState eq 'S' }">
											계약
										</c:when>		
										<c:when test="${result.spState eq 'F' }">
											실주
										</c:when>	
										<c:otherwise>								
											<c:out value="${result.spState}"/>
										</c:otherwise>
									</c:choose>
									<input type="hidden" value="${result.spState }" id="resultSpState" />
								</td>
							</tr>
							<input type='hidden' name='spKey' value='<c:out value="${result.spKey}"/>' />
							<c:set var="salesSum" value="${salesSum + result.fcSalesAmount }" />
							<c:set var="pcSum" value="${pcSum + result.fcBuyAmount }" />
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="sum">
					<table>
						<tbody class="ftw400">
							<tr>
								<td colspan="10">
									합계
									<label class="colSum">매출: <c:out value="${displayUtil.commaStr(salesSum) }"/> 원</label>
									<label class="colSum">매입: <c:out value="${displayUtil.commaStr(pcSum) }"/> 원</label>
									<label class="colSum">매출이익: <c:out value="${displayUtil.commaStr(salesSum - pcSum) }"/> 원</label>
									<label>(부가세별도)</label>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<%-- <button type="button" id='btn_windeal' value="계약완료"><img class="cursorP" src="<c:url value='/images/toProject.png'/>" /></button> --%>
						<button type="button" id='btn_delete' value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button type="button" id='btn_loss' value="실주등록"><img class="cursorP" src="<c:url value='/images/btn_loss.png'/>" /></button>
						<button type="button" value="엑셀 다운로드" id="excelExport"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
		<%-- <tr class="dpNone" style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">
			<td colspan="12" style="margin: 5px 71px;">
				<ul class="detailList">
					<li>고객사</li>
					<li>
						<c:choose>
							<c:when test="${result.mfAcNm eq null}">&nbsp;</c:when>
							<c:otherwise><c:out value="${result.mfAcNm}"/></c:otherwise>
						</c:choose>
					</li>
					<li>매입처</li>
					<li>
						<c:choose>
							<c:when test="${result.buyAcNm eq null}">&nbsp;</c:when>
							<c:otherwise><c:out value="${result.buyAcNm}"/></c:otherwise>
						</c:choose>
					</li>
					<li>수주확률</li>
					<li>
						<c:choose>
							<c:when test="${result.spState eq null}">&nbsp;</c:when>
							<c:otherwise><c:out value="${result.spState}"/></c:otherwise>
						</c:choose>
					</li>
					<li>제품상세</li>
					<li>
						<c:choose>
							<c:when test="${result.pmDetail2 eq null}">&nbsp;</c:when>
							<c:otherwise><c:out value="${result.pmDetail2}"/></c:otherwise>
						</c:choose>
					</li>
					<li>진행사항</li>
					<li><c:out value="${result.remark}"/></li>
				</ul>
			</td>
		</tr> --%>
	</form:form>
</body>
</html>