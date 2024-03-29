<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<%@include file="/WEB-INF/jsp/cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>제품목록</title>
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
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.contentsWrap .contents .top input[type="text"] {
			width: 170px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
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
			padding: 10px;
			border: 1px solid #edebef;
		}
		.middle table thead th:first-child,
		.middle table tbody td:first-child {
			width: 31px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 50px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 96px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 96px;
		}
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 204px;
		} 
		
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6),
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7) {
			width: 311px;
		}
		
		.middle table tbody td:nth-child(8),
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(9), 
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(10), 
		.middle table thead th:nth-child(10) {
			width: 118px;
		}
		
		.middle table tbody tr td span {
			display: block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			vertical-align: middle;
			width: 100%;
		}
		
		.middle table tbody tr td img {
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
			
			$('#btn_delete').click(function() {
				if($('input[name="gubun"]').is(':checked')){
					if(confirm("선택한 내용을 삭제하시겠습니까?")){
						//document.listForm.btnOption.value='delete';
						alert($('input[name="gubun"]:checked').val());
						
						var litIdx = parseInt($('input[name="gubun"]:checked').val());
						
						alert($('input[name="pmKey"]').eq(litIdx).val());
						
						var pmKey = {'PM_KEY' : $('input[name="pmKey"]').eq(litIdx).val()};
						
			           	alert(pmKey.PM_KEY);
			           	
			           $.ajax({
				        	url :"/mngCommon/product/delete.do",
				        	type:"POST",  
				            data: pmKey,
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
					alert("삭제할 대상을 선택하세요.");
					
					return false;
				}				
			});
  			
			var html = '';
			/* $('.middle table tbody tr').click(function() {
				
				if($(this).attr('class') != "viewOpen") {
					html = '<div style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>비고</li>'
					       + '<li title="">' + this.getAttribute("title") + '</li>' 
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
			
			
			$('.middle table tbody').on('click', 'tr td:not(:first-child)', function () {
				if(!$(this).parent().attr('class').includes("viewOpen")) {
					html = '<div style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>비고</li>'
					       + '<li title="">' + this.parentNode.getAttribute("title") + '</li>' 
					       + '</ul>'
					       + '</div>'
					       + '</div>';
					$(this).find("img").attr("style","transform:rotateX(180deg)");
					$(this).parent().after(html);
					$(this).parent().attr('class', 'viewOpen');
				} else {
					$(this).find("img").attr("style","transform:rotateX(360deg)");
					$(this).parent().removeClass('viewOpen');
					$(this).parent().next().remove();
				}
			});
			
			$('#fl tr.kkoser').each(function(index, item) {
				//if(index != 0) {
					$(this).children().eq(0).append('<input type="radio" class="tRadio" name="gubun" value="'+ $(this).children().children().eq(0).val() +'" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				//}
			});
		});
		
		function fn_search() {
			document.listForm.action = "/mngCommon/product/list.do";
           	document.listForm.submit(); 
		}

		function fn_addView(){
			var url = '/mngCommon/product/writePopup.do';
			var dialogId = 'program_layer';
			
			var varParam = {};
			
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:698px;height:670px'); 
		}
		
		
		//제품목록 조회 팝업용 임시 코드
		function fn_searchList()
		{                
			window.open('/mngCommon/product/popup/searchListPopup.do?pmKeyDomId=docIdPmkey&pmNmDomId=docIdPmNm','PRODUCT_LIST','width=1000px,height=713px,left=600');
		}
		
		function fn_modDetail() {
			var url = '/mngCommon/product/writePopup.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pmKey":$('input[name=gubun]:checked').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:698px;height:670px'); 
		}

	</script>
</head>
<body>
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">제품 목록</label></div>
						<div class="addBtn floatL cursorP" onclick="javascript:fn_addView()"><img src="/images/btn_add.png" /></div>
						<!-- <div class="addBtn floatL cursorP" onclick="javascript:fn_searchList()"><img src="/images/btn_add.png" /></div> -->
					</div>
					<div class="floatR">
						<form:select path="productDivision">
							<form:option value="">구분</form:option>
							<form:option value="PROD1000">H/W</form:option>
							<form:option value="PROD2000">S/W</form:option>
							<form:option value="PROD3000">용역</form:option>
							<form:option value="PROD4000">기타</form:option>
						</form:select>
						<form:select path="productFlag">
							<form:option value="">상태</form:option>
							<form:option value="SALE">판매중</form:option>
							<form:option value="EOL">EOL</form:option>
							<form:option value="EOSL">EOSL</form:option>
						</form:select>
						<form:input path="productMake" type="text" placeholder="제조사" onKeyPress="if(event.keyCode==13){fn_search();}"/>
						<form:input path="productName" type="text" placeholder="모델명" onKeyPress="if(event.keyCode==13){fn_search();}"/>
						<span id="span_search" class="veralignT" onclick="javascript:fn_search()"><img src="/images/icon_search.png" /></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200 excelSheet" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">선택</th>
								<th scope="row">No</th>
								<th scope="row">구분</th>
								<th scope="row">상세구분</th>
								<th scope="row">제조사</th>
								<th scope="row">모델명</th>
								<th scope="row">세부모델명</th>
								<th scope="row">출시일</th>
								<th scope="row">EOL</th>
								<th scope="row">EOSL</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="result" items="${productList}" varStatus="status">
							<tr title='<c:out value="${result.pmRemark}"/>' class='kkoser'>
								<td><input type="hidden" value="${result.pmKey }" /></td>
								<td><c:out value="${status.count}"/></td>
								<td>
									<c:choose>
										<c:when test="${result.pmClassCd eq 'PROD1000'}">H/W</c:when>
										<c:when test="${result.pmClassCd eq 'PROD2000'}">S/W</c:when>
										<c:when test="${result.pmClassCd eq 'PROD3000'}">용역</c:when>
										<c:when test="${result.pmClassCd eq 'PROD4000'}">기타</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${result.pmDetailClassCd eq 'PROD1001'}">스토리지</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD1002'}">서버</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD1003'}">네트워크</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD1099'}">기타</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD2001'}">FCore 제품</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD2099'}">기타</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD3001'}">기술지원</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD3002'}">인력파견</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD3099'}">기타</c:when>
										<c:when test="${result.pmDetailClassCd eq 'PROD4099'}">기타</c:when>
									</c:choose>
								</td>
								<td align="center" ><span style="max-width: 187px;" title="${result.acNm }"><c:out value="${result.acNm}"/></span></td>
								<td align="left" ><span style="max-width: 311px;" title="${result.pmLineCd }"><c:out value="${result.pmLineCd}"/></span></td>
								<td align="left"><span class="floatL" style="max-width: 282px;" title="${result.pmNmCd }"><c:out value="${result.pmNmCd}"/></span><img class="cursorP" src="/images/arrow_down_18dp.png" /></td>
								<td><c:out value="${displayUtil.displayDate(result.pmReleaseDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.eolDt)}"/></td>
								<td><c:out value="${displayUtil.displayDate(result.eoslDt)}"/></td>
								<input type='hidden' name='pmKey' value='<c:out value="${result.pmKey}"/>' />
							</tr>
							<tr class="dpNone" style="width:1662px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);">
								<td colspan=10>
					       			<ul class="detailList">
					       				<li>비고</li>
					       				<li title=""><c:out value="${result.pmRemark}" /></li> 
					       			</ul>
					       		</td>
					       </tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<div class="floatR">
						<button value="수정" type="button" onclick="fn_modDetail();"><img class="cursorP" src="/images/btn_mod.png" /></button>
						<button id="btn_delete" value="삭제" type="button"><img class="cursorP" src="/images/btn_del.png" /></button>
						<button value="엑셀 다운로드" id="excelExport" type="button"><img class="cursorP" src="/images/btn_excel.png" /></button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>