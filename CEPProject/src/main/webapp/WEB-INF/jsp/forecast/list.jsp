<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<%@include file="/WEB-INF/jsp/cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>CEP 샘플 화면(forecast list)</title>
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
		.contentsWrap .contents .top select {
			height: 40px;
			width: 130px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('./images/arrow_down.png') no-repeat 91% 50%;
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
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle table tbody tr td:nth-child(3) {
			font-weight: 400;
		}
		.middle table thead th, .middle table tbody tr td {
			padding: 10px 0;
			border: 1px solid #edebef;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child {
			width: 51px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 125px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 316px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 162px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 102px;
		}
		.middle table thead th:nth-child(6),
		.middle table thead th:nth-child(7),
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(6),
		.middle table tbody td:nth-child(7),
		.middle table tbody td:nth-child(8) {
			width: 146px;
		}
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9) {
			width: 100px;
		}
		.middle table thead th:nth-child(10),
		.middle table thead th:nth-child(11),
		.middle table thead th:nth-child(12),
		.middle table tbody td:nth-child(10),
		.middle table tbody td:nth-child(11),
		.middle table tbody td:nth-child(12) {
			width: 101px;
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
			width: 305px;
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
			/* 
			var html = '';
			$('.middle table tbody tr').click(function() {
				if($(this).attr('class') != "viewOpen") {
					html = '<div style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>매출처</li>'
					       + '<li title="키스채권평가">키스채권평가</li>'
					       + '<li>매입처</li>'
					       + '<li title="코오롱베니트">코오롱베니트</li>'
					       + '<li>수주확률</li>'
					       + '<li title="80%">80%</li>'
					       + '<li>제품상세</li>'
					       + '<li title="Avamar, Data Domain 외, 디스크, DP4400">Avamar, Data Domain 외, 디스크, DP4400</li>' 
					       + '<li>진행사항</li>'
					       + '<li>RFP 작업중</li>'
					       + '</ul>'
					       + '</div>'
					       + '</div>';
					$(this).after(html);
					$(this).attr('class', 'viewOpen');
				} else {
					$(this).removeClass('viewOpen');
					$(this).next().remove();
				}
			});
			 */
			 
			$('.middle table tbody tr').click(function() {
				
				if($(this).next().hasClass("dpNone")) {
					$(this).next().removeClass("dpNone");
				}
				else {
					$(this).next().addClass("dpNone");
				}
				
				
			});
			 
			$('#fl tr.mchkbox').each(function(index, item) {
				
				$(this).children().eq(0).append('<input type="checkbox" name="gubun" value="'+ index +'" class="tCheck" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				
			});
			
			
			
			$('#btn_delete').click(function() {
				
				alert('btn_delete');
				
				if($('input[name="gubun"]').is(':checked')) {
					if(confirm("선택한 내용을 삭제하시겠습니까?")) {
						
						var litIdx = parseInt($('input[name="gubun"]:checked').val());
						
						var jsonData = {'SP_KEY' : $('input[name="spKey"]').eq(litIdx).val()};
						
			           $.ajax({
				        	url :"/forecast/delete.do",
				        	type:"POST",  
				            data: jsonData,
				     	   contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				     	   dataType: 'json',
				           async : false,
				        	success:function(data){		  
				            	alert("삭제되었습니다.!");
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
			});
		});

		function fn_addView(link){
			
			
			alert('fn_addView : ' + link);
			
			if(link == "forecastList") {
				location.href="<c:url value='/forecast/list.do'/>";
			} else {
				var url = '/forecast/write/'+link+'.do';
				var dialogId = 'program_layer';
				
				alert("fn_addView : spKey [" + $('#m_ipt_spKey').val() + "]")
				var varParam = {'spKey' : $('#m_ipt_spKey').val()};
				
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:726px;height:495px'); 
			}
		}

		//Forecast 목록 조회 팝업
		function fn_searchListPop()
		{
			window.open('/forecast/popup/searchList.do?spKeyDomId=domIdSpKey&spBusiNm=domIdSpBusiNm','FORECAST_LIST','width=1000px,height=713px,left=600');
		}
		
	</script>
</head>
<body>
	<form id="listForm" name="listForm" method="post">
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">Forecast list</label></div>
						<div class="addBtn floatL cursorP" onclick="javascript:fn_addView('basic')"><img src="<c:url value='/images/btn_add.png'/>" /></div>
						<div class="addBtn floatL cursorP" onclick="javascript:fn_searchListPop()"><img src="<c:url value='/images/btn_add.png'/>" /></div>
					</div>
					<div class="floatR">
						<select>
							<option value="">구분</option>
						</select>
						<select>
							<option value="">진행상태</option>
						</select>
						<select>
							<option value="">검색조건</option>
						</select>
						<input type="text" />
						<span id="span_search" class="veralignT" onclick="javascript:fn_searchList()"><img src="/images/icon_search.png" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">선택</th>
								<th scope="row">고객사</th>
								<th scope="row">사업명</th>
								<th scope="row">제품</th>
								<th scope="row">수주확정</th>
								<th scope="row">매출액</th>
								<th scope="row">매입액</th>
								<th scope="row">매출총이익</th>
								<th scope="row">매출일정</th>
								<th scope="row">수금일정</th>
								<th scope="row">매입일정</th>
								<th scope="row">매입결제일</th>
								<th scope="row">상태</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="result" items="${forecastList}" varStatus="status">
							<tr class="mchkbox">
								<td></td>
								<td><c:out value="${result.mfAcNm}"/></td>
								<td><c:out value="${result.spBusiNm}"/> <img class="cursorP" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
								<td><c:out value="${result.pmNm}"/></td>
								<td><c:out value="${result.fcSjConfQt}"/> Q</td>
								<td><c:out value="${result.fcSalesAmount}"/></td>
								<td><c:out value="${result.fcBuyAmount}"/></td>
								<td><c:out value="${result.fcSalesProfit}"/></td>
								<td><c:out value="${result.fcSalesDt}"/></td>
								<td><c:out value="${result.fcCollectDt}"/></td>
								<td><c:out value="${result.fcBuyPayDt}"/></td>
								<td><c:out value="${result.fcBuyPayDt}"/></td>
								<td><c:out value="${result.spState}"/></td>
							</tr>
							<tr class="dpNone" style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">
								<td colspan="12" style="margin: 5px 71px;">
									<ul class="detailList">
										<li>매출처</li>
										<li title='<c:out value="${result.salesAcNm}"/>'><c:out value="${result.salesAcNm}"/></li>
										<li>매입처</li>
										<li title='<c:out value="${result.buyAcNm}"/>'><c:out value="${result.buyAcNm}"/></li>
										<li>수주확률</li>
										<li title='<c:out value="${result.spState}"/>'><c:out value="${result.spState}"/></li>
										<li>제품상세</li>
										<li title='<c:out value="${result.remark}"/>'><c:out value="${result.remark}"/></li>
										<li>진행사항</li>
										<li>RFP 작업중</li>
									</ul>
								</td>
							</tr>
							<input type='hidden' name='spKey' value='<c:out value="${result.spKey}"/>' />
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button type="button" value="수정"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
						<button type="button" id='btn_delete' value="삭제"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
						<button type="button" value="엑셀 다운로드"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>