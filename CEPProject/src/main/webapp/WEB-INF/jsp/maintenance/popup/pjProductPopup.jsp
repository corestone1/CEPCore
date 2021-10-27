<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/popup.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/datepicker.min.css'/>"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script src="<c:url value='/js/popup.js'/>"></script>
<script src="<c:url value='/js/common.js'/>"></script>
<style>
	fieldset {
		border: none;
		marign: 0;
		padding: 0;
	}
	.btn_gray {
		border: 1px solid #d2d2d2;
		border-radius: 5px;
		background-color: #d2d2d2;
		padding: 2px 8px;
		font-size: 13px;
	}
	.popContainer .top {
		width: 100%;
		height: 103px;
		border-bottom: 4px solid #4b3a93;
		position: absolute;
		top: 0;
		left: 0;
	}
	.popContainer .top > div {
		font-size: 24px;
		padding-left: 34px;
		padding-top: 43px;
	}
	.popContainer .contents {
		position: absolute;
		width: 100%;
		height: 601px;
		top: 107px;
		left: 0;			
		z-index: 3;
		background-color: #f6f7fc;
		overflow-y: auto;
	}
	.popContainer .contents > div {
		width: calc(100% - 80px);
		margin: 10px 40px 15px 40px;
	}
	.popContainer .contents > div:first-child {
		min-height: 519px;
	}
	.ui-datepicker.ui-widget-content {
		z-index: 102 !important;
	 }
	.popContainer .middle table,
	.popContainer .middle table thead,
	.popContainer .middle table thead tr,
	.popContainer .middle table tbody,
	.popContainer .middle table tbody tr {
		width: 100%;
	}
	.popContainer .middle table {
		border: none;
		font-size: 15px;
		margin-top: 25px;
		border-collapse: collapse;
		overflow: hidden;
		border-bottom: 2px solid #6a5bae;
	}
	.popContainer .middle table thead {
		background-color: #e1dff5;
		float: left;
		border-top: 3.5px solid #6a5bae;
	}
	.popContainer .middle table thead tr {
		display: table;
	}
	.popContainer .middle table tbody {
		height: 506px;
		overflow-y: auto;
		overflow-x: hidden;
		float: left;
	}
	.middle table tbody tr {
		display: table;
	}
	.popContainer .middle table thead th, .middle table tbody td {
		width: 100px;
		padding: 10px 0;
    	border: 1px solid #edebef;
	}
	.popContainer .middle table thead th:first-child, 
	.popContainer .middle table tbody td:first-child {
		width: 30px;
		max-width: 30px;
	}
	.popContainer .middle table thead th:nth-child(2), 
	.popContainer .middle table tbody td:nth-child(2) {
		width: 110px;
		max-width: 110px;
	}
	
	.popContainer .middle table thead th:nth-child(3), 
	.popContainer .middle table tbody td:nth-child(3) {
		width: 30px;
		max-width: 30px;
	}
	
	.popContainer .middle table thead th:nth-child(4), 
	.popContainer .middle table tbody td:nth-child(4) {
		width: 70px;
		max-width: 70px;
	}
	
	.popContainer .middle table thead th:nth-child(5), 
	.popContainer .middle table tbody td:nth-child(5) {
		width: 80px;
		max-width: 80px;
	}
	.popContainer .middle table thead th:nth-child(6),
	.popContainer .middle table tbody td:nth-child(6) {
		width: 45px;
		max-width: 45px;
	}
	.popContainer .middle table thead th:nth-child(7),
	.popContainer .middle table tbody td:nth-child(7) {
		width: 130px;
		max-width: 130px;
	}
	
	.popContainer .top input[type="text"] {
		width: 210px;
		height: 34px;
		border: 1px solid #e9e9e9;
		padding: 0 10px;
		background-color: #fff;
		background-repeat: no-repeat;
		background-position: 95% 50%;
		font-size: 15px;
		margin-bottom: 3px;
	}
	.popContainer .middle table tbody tr:hover {
		background-color: #ddf0ec;
	}	
	/* .popContainer .middle table thead th:nth-child(8),
	.popContainer .middle table tbody td:nth-child(8) {
		max-width: 105px;
	} */
	tbody tr td > span {
		display: inline-block;
		overflow:hidden; 
		text-overflow:ellipsis; 
		white-space:nowrap;
		width: 87%;
		margin: 0px 5px 0px 5px;
	}	
	tbody tr td img {
		width: 13px;
		vertical-align: middle;
		margin-bottom: 5px;
	}
	/* 제품정보 클릭했을때 나타나는 내용에서 제목(제품상세) */
		.detailList li:nth-child(2n-1) {
		    width: 82px;
		    font-weight: 400;
		    color: #158566;
		    text-align: left;
		}
		/* 제품정보 클릭했을대 나타나는 내용 */
		.detailList li:nth-child(2n) {
			overflow: hidden;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
			text-align: left;
		}
</style>
<script type="text/javaScript">
	$(document).ready(function(){
		var html = '';
		$('#detailForm #pl tbody tr').click(function() {
			if($(this).attr('class') != "viewOpen trcheckcolor") {
				//console.log($(this).children().eq(5).text());
				html = '<div style="width:919px; height: auto; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
				       + '<div style="margin: 5px 71px;">'
				       + '<ul class="detailList">'
				       + '<li>제품상세</li>'
				       + '<li><pre>'+$(this).children().eq(6).text().trim()+'</pre></li>'
					   + '</ul>'
				       + '</div>'
				       + '</div>';
				$(this).after(html);
				$(this).attr('class', 'viewOpen trcheckcolor');
				var className = $(this).children().children().eq(2).attr('class');
				//console.log("className====>"+className);
				if(className === "down") {
					$(this).children().children().eq(2).attr('src','<c:url value='/images/arrow_up.png'/>');
					$(this).children().children().eq(2).attr('class', "up");
				} else {

					$(this).children().children().eq(2).attr('src','<c:url value='/images/arrow_down.png'/>');
					$(this).children().children().eq(2).attr('class', "down");
				}
			} else {
				$(this).children().children().eq(2).attr('src','<c:url value='/images/arrow_down.png'/>');
				$(this).children().children().eq(2).attr('class', "down");
				$(this).removeClass('viewOpen');
				$(this).next().remove();
			}
		});
	});
	
	/*
	상세정보에 ", ' 등 특수기호 때문에 parameter를 이용하여 넘길 수 없기때문에
	해당 정보를 base64인코딩으로 변환한 후 받은쪽에서 base64디코딩하여 정보를 표시한다.
	*/
	function fn_productSelect(mtPmKey,pmNmCd,mtPmQuantity,mtPmUprice, mtRate,obj){
		var num = $('#whereNum').val();
		
		
		//선택한 라인의 상세 정보를 가져온다.
		var mtPmDetail =$(obj).parent().parent().children().eq(6).text();
		//utf8로 파싱한다.
		var wordArray = CryptoJS.enc.Utf8.parse(mtPmDetail);
		//Base64로 인코딩
		var encoded = CryptoJS.enc.Base64.stringify(wordArray);
		/* console.log("encoded======>"+encoded);
		
		//Base64 디코딩
		var parsedWordArray = CryptoJS.enc.Base64.parse(encoded);
		var decoded = parsedWordArray.toString(CryptoJS.enc.Utf8);
		
		console.log("decoded======>"+decoded); */
		opener.addProjectProduct(
				mtPmKey
				,pmNmCd
				,mtPmQuantity
				,mtPmUprice
				,mtRate
				,encoded);
		//console.log("=====2==>"+bas);
		
		close();
	   /*  var dialogLayer = $('#dialogId').val();
	    $("#" +dialogLayer).dialog('close'); */
	}
	function fn_searchList(){
		
		document.listForm.action = "/maintenance/contract/popup/pjProductList.do";
       	document.listForm.submit(); 
	}
</script>	
<form:form id="listForm" name="listForm" modelAttribute="searchVO" method="post" onsubmit="return false" >
<input type="hidden" id="whereNum" name="whereNum" value="<c:out value="${whereNum}"/>" />
<input type="hidden" id="selectIntegrateKey" name="selectIntegrateKey" value="<c:out value="${selectIntegrateKey}"/>" />

<fieldset>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">PROJECT 제품 목록</div>
				<div class="floatR" style="margin-right: 40px;">				
					<span><form:input path="searchPmNmCd" type="text" placeholder="제품명"/></span>
					<span id="span_search" style="vertical-align:top;" >
					
					<img src="<c:url value='/images/icon_search.png'/>" onclick="fn_searchList();"/>
					</span>
					
				</div>
				<%-- <div class="floatR">
					<span><form:input path="searchMtName" type="text" placeholder="제품명"/></span>					
					<span><form:input path="searchMtName" type="text" placeholder="제품시리얼"/></span>
					<span id="span_search" class="veralignT" onclick="javascript:fn_searchList();">
					<img src="<c:url value='/images/icon_search.png'/>" onclick="fn_searchList();"/>
					</span>
				</div> --%>
			</div>
			
		</div>
				
		<div id="detailForm" class="contents">
<!-- <input type="text" id="textid" /> -->
			<div class="middle">
				
				<table class="textalignC ftw200" id="pl">
					<thead class="ftw400">
						<tr>
							<th scope="row">선택</th>
							<th scope="row">제품명</th>
							<th scope="row">수량</th>
							<th scope="row">단가</th>
							<th scope="row">금액</th>
							<th scope="row">유지보수요율</th>
							<th scope="row">상세</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${mtProductList}" varStatus="status">
	            			<tr>
	            				<td>
									<a href="#" onclick='javascript:fn_productSelect("${item.mtPmKey}", "${item.pmNmCd}", "${item.mtPmQuantity}", "${item.mtPmUprice}", "${item.mtRate}", this );' class="btn btn_gray">선택</a>
	            				</td>
	            				<td class="textalignL">
	            					<span title="<c:out value="${list.pmNmCd}"/>"><c:out value="${item.pmNmCd}"/></span><img class="down" src="<c:url value='/images/arrow_down.png'/>"  />
	            				</td>
	            				<td class="textalignR"><span title="<c:out value="${displayUtil.commaStr(item.mtPmQuantity)}"/>"><c:out value="${displayUtil.commaStr(item.mtPmQuantity)}"/></span></td>
	            				<td class="textalignR"><span title="<c:out value="${displayUtil.commaStr(item.mtPmUprice)}"/>"><c:out value="${displayUtil.commaStr(item.mtPmUprice)}"/></span></td>
	            				<td class="textalignR"><span title="<c:out value="${displayUtil.makeMultiNumber(item.mtPmQuantity,item.mtPmUprice)}"/>"><c:out value="${displayUtil.makeMultiNumber(item.mtPmQuantity,item.mtPmUprice)}"/></span></td>
	            				<td class="textalignR"><span title="<c:out value="${list.mtRate}"/>"><c:out value="${item.mtRate}"/>%</span></td> 
	            				<td class="textalignL"><span title="<c:out value="${list.pmNmCd}"/>"><c:out value="${item.mtPmDetail}"/></span></td> 
	            			</tr>
	        			</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</fieldset>
</form:form>
            