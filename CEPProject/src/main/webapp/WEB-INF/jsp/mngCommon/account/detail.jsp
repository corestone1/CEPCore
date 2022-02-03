<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>거래처 정보 상세</title>
	
	<style>
		.sfcnt {
			height: 91px;
		}
		.bottom > div {
			margin-top: 22px;
		}
		.nav {
			width: 100%;
			height: 49px;
		}
		/* 상세화면 전체크기 */
		.mContentsWrap {
			background-color: #f6f7fc;
			box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);
			height: 802px;
		}
		.mContentsWrap .mContents {
			padding: 38px 71px; 
			width: 1662px;
		}
		.title {
			height: 50px;
		}
		
		.title > label {
			font-size: 26px;
		}
		
		.mContents .back {
			margin-top: 10px;
		}
		
		/* 왼쪽기본정보 싸이즈 */
		.mContents > div:first-child {
        	width: 37%;
      	}
      	
		/* 오른쪽 내용(상세정보) 싸이즈 */
		.mContents > .fxd {
			width: 60%;
		}
		/* 소타이틀(기본정보, 발주정보, 제품정보) 관련 css*/
		.mContents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 10px;
			margin-top: 30px;
		}
		/* 기본정보 색상  */
		.mContents .cg {
			color: #24a37e;
		}
		.mContents table {
			border-collapse: collapse;
			font-size: 15px;
			table-layout: fixed;
			width: 614px;
		} 
		/* 기본정보 테이블 padding */
		.mContents > div > div > div > table tr td {
			padding: 13px 20px;
		}
		/* 기본정보 내용 글자 굵기 */
		.mContents .bsc tr td:last-child {
			width: 470px;
			font-weight: 200;
			box-shadow: inset 7px 0 6px -4px #d0e2de;
		}
		/* 기본정보 틀 */
		.mContents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			/* border: 1px solid #bee2da; */
          border-bottom: 2px solid #bfe3db;
		}
		
		.mContents .dtl, .mContents .dtl2 {
		    width: 997px;
		    font-size: 15px;
		    border-collapse: collapse;
		    font-weight: 300;
		    overflow: hidden;
		    border-top: 4px solid #6a5baf;
		}

		.mContents .dtl tbody, .mContents .dtl2 tbody {
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			width: 997px;		
		}
		
		.mContents .dtl thead, .mContents .dtl2 thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
		/* 커서포인터 */
		.mContents .dtl tbody tr, .mContents .dtl2 tbody tr {
		    display: table;
		    width: 997px;
		    /* cursor: pointer; */
		}	
		.mContents .dtl tbody tr {
		    cursor: pointer;
		}		
		
		
		.mContents .dtl thead th, .mContents .dtl tbody tr td 
		,.mContents .dtl2 thead th, .mContents .dtl2 tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}
			
		
		/* 기본정보 싸이즈 조정 */
		.mContents .bsc tbody {			
			height: 385px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		
		/* 기본정보 글자색 */
		.mContents .bsc tr td {
			color: #26a07d;
			padding : 13px 18px;
		}
		/* 기본정보 세로줄 나오는것 */
		.mContents .bsc tr td:first-child {				
			width: 107px;
			font-weight: 400;
			padding: 13px 13px 13px 20px;
		}
		.mContents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
			background-color: #d3d3d3;
		}

		
		.mContents .dtl tbody tr:hover, .mContents .dtl2 tbody tr:hover {
			background-color: #ddf0ec
		}
		
		/* 담당자정보 세로싸이즈 */
		.mContents .dtl tbody {
			/* height: 176px; */
			height: 220px;
		}
		
		/* 백계약정보 테이블 크기조정 */
		.mContents .dtl thead th:first-child,
		.mContents .dtl tbody td:first-child {
			width: 45px;
		}
		.mContents .dtl thead th:nth-child(2),
		.mContents .dtl tbody td:nth-child(2) {
			width: 75px;
		}
		.mContents .dtl thead th:nth-child(3),
		.mContents .dtl tbody td:nth-child(3) {
			width: 94px;
		}
		.mContents .dtl thead th:nth-child(4),
		.mContents .dtl tbody td:nth-child(4) {
			width: 76px;
		}
		.mContents .dtl thead th:nth-child(5),
		.mContents .dtl tbody td:nth-child(5) {
			width: 136px;
		}
		.mContents .dtl thead th:nth-child(6),
		.mContents .dtl tbody td:nth-child(6) {
			width: 204px;
		}
		.mContents .dtl tbody td:nth-child(6) {
			text-align: left;
		}
		.mContents .dtl thead th:nth-child(7),
		.mContents .dtl tbody td:nth-child(7) {
			width: 260px;
			max-width: 260px;
		}
		.mContents .dtl tbody td:nth-child(7) {
			text-align: left;
		}
		/* 담당자, 계좌정보 글짜크기 */
		.dtl tbody tr td, .dtl2 tbody tr td {
			font-weight: 200;
		}
		
		/*계좌정보 세로싸이즈 */
		.mContents .dtl2 tbody {
			/* height: 241px; */
			height: 197px;
		}
		/* 계좌정보 테이블 크기조정 */
		.dtl2 thead th:first-child,
		.dtl2 tbody td:first-child {
			width: 51px;
		}
		.dtl2 thead th:nth-child(2),
		.dtl2 tbody td:nth-child(2) {
			width: 255px;
		}
		.dtl2 thead th:nth-child(3),
		.dtl2 tbody td:nth-child(3) {
			width: 323px;
		}
		.dtl2 thead th:nth-child(4),
		.dtl2 tbody td:nth-child(4) {
			width: 210px;
		}
		.dtl2 thead th:nth-child(5),
		.dtl2 tbody td:nth-child(5) {
			width: 90px;
		}	
		/* 담당자 정보 비고부분 ... 으로 표시. */
		
		.mContents .dtl tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 90%;
			margin: 0 auto;
		}
		
		#modBasicTable tr td:first-child {
			width: 132px;
			font-weight: 400;
			padding: 11px 8px 11px 17px;
		}
		#modBasicTable tr td:last-child {
			padding: 5px 20px;
			width: 463px;
		}
		#modBasicTable input[type="text"],
		#modBasicTable textarea {
			width: 230px; 
		    color: #0e8a67;
		}
		#modBasicTable textarea {
			color: #0e8a67;
			height: 105px;
			border: 1px solid #e6e6e6;
			padding: 0 10px;
			resize: none;
		}
		#modBasicTable select {
			height: 34px;
			font-size: 14px;
			width: 72px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    -webkit-appearance: none;
		    background: url(/images/arrow_down.png) no-repeat 91% 50%;
		    background-color: #fff;
		    color: #0e8a67;
		}
		#modBasicTable input[class^="calendar"] {
			width: 140px !important;
		}
		#modBasicTable input[class="search"] {
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		
		#modBasicTable input[class="pname"]{
			width: 305px;
			border : none;
			outline: none;
			background-color: #ddf0ec;
		}
		.stitle2 input[class="pname"]{
			width: 130px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
			text-align: right;
			font-size: 17px;
			font-weight: 400;
		}
		input[type="text"] {
		 	width: 138px;
		    height: 32px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 4px;
		}
		#modDetailTable input[type="text"] {
			width: calc(97% - 20px);
		}
		#modBasicTable tr td:first-child label {
			color: red;
			vertical-align: middle;
      	}
      	#listForm {
      		padding-top: 50px;
      	}
	</style>
	<script>
		
	
		$(document).ready(function() {
			
			
			//화면 펼치기
			/* var html = '';
			$('#listForm .dtl tbody tr').click(function() {
				if($(this).attr('class') != "viewOpen trcheckcolor") {
					html = '<div style="width:982px; height: auto; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>비고</li>'
					       + '<li><pre>'+$(this).children().eq(8).text().trim()+'</pre></li>'
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
			}); */


		}); // end $(document).ready()
		
		
		//기본정보 수정
		function modBasicInfo(){
			
			if($('#m_editMode').val()=="0"){
				$('#modBasicTable').show();
				$('#selectBasicTable').hide();
				
				$('#m_editMode').val(1);
			} else {
				//필수값 체크를 완료하면 저장 프로세스 시작.
				if ($("#m_basicForm")[0].checkValidity()){
					if(confirm("거래처 기본정보를 수정하시겠습니까?")) {
						saveBasicInfo();
					}
					
				}  else {
					 //Validate Form
			        $("#m_basicForm")[0].reportValidity();	
				}
			}
		}
		/*
		* 기본정보 내용을 저장한다.
		*/
		function saveBasicInfo() {
			
			$("input[name='acRepTel']").val($("#m_acRepTel1").val() + "-" + $("#m_acRepTel2").val() + "-" + $("#m_acRepTel3").val());
			if($("#m_acRepFax2").val().length != 0 && $("#m_acRepFax3").val().length != 0) {
				$("input[name='acRepFax']").val($("#m_acRepFax1").val() + "-" + $("#m_acRepFax2").val() + "-" + $("#m_acRepFax3").val());
			}
			
			var object = {};
			var formData = $("#m_basicForm").serializeArray();
			
			for(var i = 0; i < formData.length; i++) {
				object[formData[i]['name']] = formData[i]['value'];
			}
			
			var sendData = JSON.stringify(object);
			$.ajax({
				url: "/mngCommon/account/insert/accountInfo.do",
			    dataType: 'json', 
			    type:"POST",  
			    data: sendData,
			 	contentType: "application/json; charset=UTF-8", 
				beforeSend: function(xhr) {
					xhr.setRequestHeader("AJAX", true);
					//xhr.setRequestHeader(header, token);
					
				},
			    success:function(response){	
			    	if(response!= null && response.successYN == 'Y') {
		    			alert("거래처 정보가 수정되었습니다.");
			    	} else {
		    			alert("거래처 정보 수정이 실패하였습니다.");
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

		
		// 삭제
		function deleteInfo(){			
			if(confirm("선택한 내용을 삭제하시겠습니까?")) {
				
				var jsonData = {'AC_KEY' : $('input[name="spKey"]').eq(litIdx).val()};
				
	           $.ajax({
		        	url :"/forecast/delete.do",
		        	type:"POST",  
		            data: jsonData,
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	   	dataType: 'json',
		           	async : false,
		        	success:function(data){		  
		            	alert("삭제되었습니다.");
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
		} // end deleteBasicInfo()

		
		function fn_addView(type){

			var url = '/mngCommon/account/write.do';
			var dialogId = 'program_layer';
			var varParam = { acKey: $("#acKey").val() }; 
			var button = new Array;
			button = [];
			
			showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:615px'); 
		}
		
	</script>
</head>
<body>
	<!-- <div class="sfcnt"></div>
	<div class="nav"></div> -->
	<div class="mContentsWrap">
		<div class="mContents mgauto">
			<div class="floatL">
				<div class="title"><label class="ftw500">거래처 상세정보</label></div>
				<div>
					<div class="stitle cg">
						기본정보
					</div>
					<form id="m_basicForm" name="m_basicForm" method="post">
						<input type="hidden" id="m_editMode" name="editMode"  value="0"/>
						<div id="m_basicWrap">
							<table class="bsc" id="selectBasicTable">
								<tr>
									<td>사업자 번호</td>
									<td>${accountList.acKey }</td>
								</tr>
								<tr>
									<td>거래처명</td>
									<td>${accountList.acNm }</td>
								</tr>
								<tr>
									<td>대표자명</td>
									<td>${accountList.acCeoNm }</td>
								</tr>
								<tr>
									<td>거래처구분</td>
									<td>
										<c:choose>
											<c:when test="${accountList.acSalesYn eq 'N' and  accountList.acBuyYn eq 'N'}">
											</c:when>
											<c:when test="${accountList.acSalesYn eq 'Y'}">
												<c:choose>
													<c:when test="${accountList.acBuyYn eq 'Y' }">
														매출거래처, 매입거래처
													</c:when>
													<c:otherwise>
														매출 거래처
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												매입거래처
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td>연락처</td>
									<td>${accountList.acRepTel }</td>
								</tr>
								<tr>
									<td>FAX</td>
									<td>${accountList.acRepFax }</td>
								</tr>
								<tr>
									<td>주소</td>
									<td>${accountList.acAddr }</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<c:choose>
											<c:when test="${accountList.acAddrDetail eq null or accountList.acAddrDetail eq '' }">
												<br />
											</c:when>
											<c:otherwise>
												${accountList.acAddrDetail } 
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</table>
							<table class="bsc" id="modBasicTable" style="display:none;">
								<tr>
									<td><label>*</label> 사업자번호</td>
									<td>
										<input type="text" id="acKey" name="acKey" value="${accountList.acKey }" readonly style="background-color: transparent;"/>
									</td>
								</tr>
								<tr>
									<td><label>*</label> 거래처명</td>
									<td><input type="text" id="acNm" name="acNm" value="${accountList.acNm }" required/></td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;대표자명</td>
									<td>
										<input type="text" id="acCeoNm" name="acCeoNm" value="${accountList.acCeoNm }" required/>
									</td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;거래처구분</td>
									<td>
										<input type="checkbox" class="tCheck" name="acSalesYn" value="Y" id="hasVAT1" <c:if test="${accountList.acSalesYn eq 'Y'}">checked</c:if>/>
										<label for="hasVAT1" class="cursorP"></label>&nbsp;&nbsp;매출거래처
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="checkbox" class="tCheck" name="acBuyYn" value="Y" id="hasVAT2" <c:if test="${accountList.acBuyYn eq 'Y'}">checked</c:if>/>
										<label for="hasVAT2" class="cursorP"></label>&nbsp;&nbsp;매입거래처
									</td>
								</tr>
								<tr>
									<td><label>*</label> 연락처</td>
									<td>
										<!-- <select id="acRepTel1" name="acRepTel1" required>
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="010">010</option>
										</select> - -->
										<input type="text" id="m_acRepTel1" name="acRepTel1" style="width: 53px" value="${fn:split(accountList.acRepTel,'-')[0]}" required/> -
										<input type="text" id="m_acRepTel2" name="acRepTel2" style="width: 53px" value="${fn:split(accountList.acRepTel,'-')[1]}" required/> -
										<input type="text" id="m_acRepTel3" name="acRepTel3" style="width: 53px" value="${fn:split(accountList.acRepTel,'-')[2]}" required/>
										<input type="hidden" name="acRepTel" />
									</td>
								</tr>
								<tr>
									<td>&nbsp;&nbsp;FAX</td>
									<td>
										<!-- <select id="acRepFax1" name="acRepFax1">
											<option value="02">02</option>
											<option value="031">031</option>
										</select> - -->
										<input type="text" id="m_acRepFax1" name="acRepFax1" style="width: 53px" value="${fn:split(accountList.acRepFax,'-')[0]}"/> -
										<input type="text" id="m_acRepFax2" name="acRepFax2" style="width: 53px" value="${fn:split(accountList.acRepFax,'-')[1]}"/> -
										<input type="text" id="m_acRepFax3" name="acRepFax3" style="width: 53px" value="${fn:split(accountList.acRepFax,'-')[2]}"/>
										<input type="hidden" name="acRepFax" />
									</td>
								</tr>
								<tr>
									<td><label>*</label> 주소</td>
									<td>
										<input type="text" id="acAddr" name="acAddr" style="width: 375px" value="${accountList.acAddr }" required/>
									</td>
								</tr>
								<tr>
									<td></td>
									<td>
										<input type="text" id="acAddrDetail" name="acAddrDetail" style="width: 375px" value="${accountList.acAddrDetail }"/>
									</td>
								</tr>
							</table>
						</div>
						<div class="floatL" style="margin-top: 211px">
							<button type="button" value="수정" onclick="modBasicInfo()"><img class="cursorP" src="<c:url value='/images/btn_basic_mod.png'/>" /></button>
							<%-- <button type="button" value="삭제" onclick="deleteBasicInfo()"><img class="cursorP" src="<c:url value='/images/btn_basic_del.png'/>" /></button> --%>
						</div>
					</form>
				</div>
			</div>
			<div class="floatR dpBlock fxd">
				<div class="back floatR ftw300 cursorP">
					<a href="/mngCommon/account/list.do"><img src="/images/btn_tolist.png" /></a>
				</div>
				<div id="listForm">
					<div class="stitle cg colorBlack">
						담당자정보
					</div>
					<div class="floatC middle" style="border-bottom: 2px solid #c4c4c4;">
						<form id="directorForm" name="directorForm" method="post">
							<table class="dtl" id="selectDetailTable">
								<thead class="ftw400">
									<tr>
										<th scope="row">번호</th>
										<th scope="row">이름</th>
										<th scope="row">부서</th>
										<th scope="row">직급</th>
										<th scope="row">연락처</th>
										<th scope="row">이메일</th>
										<th scope="row">비고</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="result" items="${acDirectorList }" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td>${result.acDirectorNm }</td>
											<td>${result.acDirectorDeptNm }</td>
											<td>${result.acDirectorPositionNm }</td>
											<td>${result.acDirectorMbNum }</td>
											<td><span title="${result.acDirectorEmail }">${result.acDirectorEmail }</span></td>
											<td><span>${result.acDirectorDesc }</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
					
					<div class="stitle cg colorBlack">계좌정보</div>
					<div class="floatC" style="border-bottom: 2px solid #c4c4c4;">
						<table class="dtl2">
							<thead class="ftw400">
								<tr>
									<th scope="row">No</th>
									<th scope="row">은행명</th>
									<th scope="row">계좌번호</th>
									<th scope="row">예금주</th>
									<th scope="row">주거래계좌</th>
								</tr>
							</thead>
							<tbody>			
								<c:forEach var="result" items="${acDepositList}" varStatus="status">
									<tr>
										<td>${status.count }</td>
										<td>${result.acBankNm }</td>
										<td class="textalignC">${result.acBkno }</td>
										<td class="textalignC">${result.acAcholder }</td>
										<td class="textalignC">${result.acRepBknoYn }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="bottom">
						<div class="floatR">
							<button type="button" value="수정" onclick="fn_addView()"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
							<button type="button" value="삭제" onclick="fn_mdeleteBackOrderBtn();"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
							<%-- <button type="button" value="Excel"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button> --%>
						</div>
					</div> 
				</div>
			</div>
			<div class="floatC"></div>
		</div>
	</div>	
</body>
</html>