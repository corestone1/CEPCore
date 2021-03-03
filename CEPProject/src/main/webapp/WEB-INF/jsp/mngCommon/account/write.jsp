<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.popContainer .top {
			width: 100%;
			height: 103px;
			border-bottom: 4px solid #4b3a93;
			position: absolute;
			top: 0;
		}
		.popContainer .top > div {
			font-size: 24px;
			padding-left: 34px;
			padding-top: 43px;
		}
		.popContainer .contents {
			position: absolute;
			width: 1122px;
			height: 508px;
			top: 107px;
			z-index: 3;
			background-color: #f6f7fc;
			z-index: 3;
			overflow-y: auto;
		}		
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			font-size: 14px;
			color: #525252;
			padding: 2px 20px 2px 34px;
			width: 99px;
		}					
		.popContainer .contents td.tdSubTitle {
		    margin-top: 11px;
		    font-size: 14px;
		    color: #525252;
		    padding-right: 9px;
		    padding-left: 19px;
		    width: 87px;
		}	
		.popContainer .contents td.tdContents {
			width: 720px;
			font-size: 14px;
    		color: #525252;
    		padding: 2px 0px 2px 0px
		} 
		.popContainer .contents > div {
			width: 100%;
		}
		.popContainer .contents > div:first-child {
			width: 433px;
			min-height: 408px;
			margin: 10px 40px 15px 40px;
		}
		
		/* .popContainer .contents > div:last-child {
			width: 433px;
			margin-right: 50px;
		} */
		.popContainer .contents > div > table {
			border-collapse: separate; 
	  		border-spacing: 0 3px;
		}
		.popContainer .contents input {
			width: 220px;
			height: 35px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		
		.popContainer .contents td label , .director_middle thead th label, .deposit_middle thead th label{
			color: red;
			vertical-align: middle;
      	}
		.popContainer .contents select {
			width: 70px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		#pop_listForm {
			padding-left: 34px;
		}
		
		.popContainer .contents tbody img {
			width: 57px;
    		margin-left: 10px;
		}
		
		/* 소타이틀(기본정보, 발주정보, 제품정보) 관련 css*/
		.contents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 10px;
			margin-top: 30px;
		}
		.director_middle table, .deposit_middle table {
			width: 900px;
			font-size: 15px;
			margin-top: 16px;
			border-collapse: collapse;
			overflow: hidden;
			border-top: 4px solid #6a5bae;
		}
		.director_middle table thead , .deposit_middle table thead{
			background-color: #e1dff5;
			float: left;
			width: 1040px;
		}
		.director_middle table thead tr , .deposit_middle table thead tr {
			display: table;
			width: 1040px;
		}
		.director_middle table tbody , .deposit_middle table tbody{
			width: 1040px;
			height: 92px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.director_middle table tbody tr , .deposit_middle table tbody tr{
			display: table;
			width: 1040px;
			cursor: pointer;
		}
		.director_middle table tbody tr:hover , .deposit_middle tbody tr:hover{
			background-color: #ddf0ec
		}
		.director_middle table thead th, .director_middle table tbody tr td , .deposit_middle table thead th, .deposit_middle table tbody tr td{
			padding: 10px 0;
			border: 1px solid #edebef;
		}	
		
		.director_middle table tbody tr td , .deposit_middle table tbody tr td{
			padding: 2px 2px 2px 2px;
		}
		
		.director_middle table thead th:first-child,
		.director_middle table tbody td:first-child {
			width: 85px; 
		}
		.director_middle table thead th:nth-child(2),
		.director_middle table tbody td:nth-child(2) {
			width: 121px;
		}
		.director_middle table thead th:nth-child(3),
		.director_middle table tbody td:nth-child(3) {
			width: 82px;
		}
		.director_middle table thead th:nth-child(4),
		.director_middle table tbody td:nth-child(4) {
			width: 143px;
		}
		.director_middle table thead th:nth-child(5),
		.director_middle table tbody td:nth-child(5) {
			width: 215px;
		}
		.director_middle table thead th:nth-child(6),
		.director_middle table tbody td:nth-child(6) {
			width: 280px;
		}
		.director_middle table thead th:nth-child(7),
		.director_middle table tbody td:nth-child(7) {
			width: 80px;
		}
		
		
		.deposit_middle table thead th:first-child,
		.deposit_middle table tbody td:first-child {
			width: 255px; 
		}
		.deposit_middle table thead th:nth-child(2),
		.deposit_middle table tbody td:nth-child(2) {
			width: 323px;
		}
		.deposit_middle table thead th:nth-child(3),
		.deposit_middle table tbody td:nth-child(3) {
			width: 235px;
		}
		.deposit_middle table thead th:nth-child(4),
		.deposit_middle table tbody td:nth-child(4) {
			width: 119px;
			max-width: 119px;
			text-align: center;
		}
		.deposit_middle table thead th:nth-child(5),
		.deposit_middle table tbody td:nth-child(5) {
			width: 90px;
		}
		.popContainer .contents .btnWrap {
			margin : 20px 30px 15px 48px;
		}
	</style>
	
	
	<script>
				
		$(document).ready(function() {		

		});
		
		// 담당자 정보 추가
		function fn_addDirector() {
			var directorRow = document.getElementById("director_tbody").insertRow();
			
			var acDirectorNmCell = directorRow.insertCell(0);
			acDirectorNmCell.innerHTML='<input type="text" id="acDirectorNm" name="acDirectorNm" style="width: 60px" autocomplete="off" required/>';
			
			var acDirectorDeptNm = directorRow.insertCell(1);
			acDirectorDeptNm.innerHTML ='<input type="text" id="acDirectorDeptNm" name="acDirectorDeptNm" style="width: 96px" autocomplete="off"/>';
			
			var acDirectorPositionNm = directorRow.insertCell(2);
			acDirectorPositionNm.innerHTML ='<input type="text" id="acDirectorPositionNm" name="acDirectorPositionNm" style="width: 55px" autocomplete="off"/>';
			
			var acDirectorMbNum = directorRow.insertCell(3);
			acDirectorMbNum.innerHTML ='<input type="text" id="acDirectorMbNum" name="acDirectorMbNum" style="width: 117px" autocomplete="off" required/>';
			
			var acDirectorEmail = directorRow.insertCell(4);
			acDirectorEmail.innerHTML ='<input type="text" id="acDirectorEmail" name="acDirectorEmail" style="width: 193px" autocomplete="off"/>';
			
			var acDirectorDesc = directorRow.insertCell(5);
			acDirectorDesc.innerHTML ='<input type="text" id="acDirectorDesc" name="acDirectorDesc" style="width: 264px" autocomplete="off"/>';
			
			var deleteBtn = directorRow.insertCell(6);
			deleteBtn.innerHTML ='<img src="/images/btn_del_gray.png" onclick="fn_deleteDirector(this);"/>';
		}
		
		//담당자 정보 삭제
		function fn_deleteDirector(obj) {
			if($('#director_tbody tr').length>1) {
				$(obj).closest('tr').remove();
			} else {
				alert("담당자 정보는 한개 이상 존재해야 합니다.");
			}
		}
		
		//계좌정보 추가
		function fn_addDeposit() {
			var acRepBknoYnCnt = $("#acRepBknoYnCnt").val()*1+1;
			$("#acRepBknoYnCnt").val(acRepBknoYnCnt);
			var depositRow = document.getElementById("deposit_tbody").insertRow();
			
			var acBankNm = depositRow.insertCell(0);
			acBankNm.innerHTML='<input type="text" id="acBankNm" name="acBankNm" style="width: 230px" autocomplete="off" required/><input type="hidden" id="acAdSeq" name="acAdSeq"/>';
			
			var acBkno = depositRow.insertCell(1);
			acBkno.innerHTML ='<input type="text" id="acBkno" name="acBkno" style="width: 299px" autocomplete="off" required/>';
			
			var acAcholder = depositRow.insertCell(2);
			acAcholder.innerHTML ='<input type="text" id="acAcholder" name="acAcholder" style="width: 212px" autocomplete="off" required/>';
			
			var acRepBknoYn = depositRow.insertCell(3);
			acRepBknoYn.innerHTML ='<input type="radio" class="tRadio" name="acRepBknoYn" value="Y" id="acRepBknoYn'+acRepBknoYnCnt+'" /><label for="acRepBknoYn'+acRepBknoYnCnt+'" class="cursorP"></label>';
			
			var deleteBtn = depositRow.insertCell(4);
			deleteBtn.innerHTML ='<img src="/images/btn_del_gray.png" onclick="fn_deleteDeposit(this);"/>';
		}
		
		function fn_deleteDeposit(obj) {
			/* if($('#deposit_tbody tr').length>1) {
				$(obj).closest('tr').remove();
			} else {
				alert("계좌 정보는 한개 이상 존재해야 합니다.");
			} */
			$(obj).closest('tr').remove();
		}
				
		function fn_chkVali() {
            if ($("#basicForm")[0].checkValidity()){
               //필수값 모두 통과하여 저장 프로세스 호출.
            	fn_save();
            } else {
                $("#bdInfoForm")[0].reportValidity();   
            }            
		}
		
		function fn_save() {
			$.ajax({
				url: "/mngCommon/insert/accountInfo.do",
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
			    		if($("#bdKey").val() == null || $("#bdKey").val() == "" || $("#bdKey").val().length == 0) {
				    		alert("프로젝트 입찰 정보가 등록되었습니다.");
				    		countSave++;
			    		} else {
			    			alert("프로젝트 입찰 정보가 수정되었습니다.");
			    		}
			    		
			    		var url='/project/write/biddingInfo.do';
		    			var dialogId = 'program_layer';
		    			var varParam = {
							"pjKey":$("#pjKey").val()/* ,
							"turnNo":$("#turnNo").val(),
							"ctKey":ctKeyList,
							"salesKey": salesKeyList */
		    			}
			   			var button = new Array;
		    			button = [];
		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			    	} else {
			    		if($("#bdKey").val() == null || $("#bdKey").val() == "" || $("#bdKey").val().length == 0) {
			    			alert("프로젝트 계약 정보 등록이 실패하였습니다.");
			    		} else {
			    			alert("프로젝트 계약 정보 수정이 실패하였습니다.");
			    		}
			    	}
			    },
				error: function(request, status, error) {
					if(request.status != '0') {
						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
					}
				} 
			});     
		}
	</script>
</head>
<body>
	
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">거래처 정보</div>
			</div>
		</div>
		<div class="contents">
			<form action="/" id="basicForm" name="basicForm"  method="post">
				<div id="basicForm" style="padding-top: 20px;">			
					<table>
						<tr>
							<td class="tdTitle"><label>*</label> 사업자번호</td>
							<td class="tdContents">
								<input type="text" id="acBusiNum" name="acBusiNum" value="${accountVO.acKey }" required/>
								<img src="<c:url value='/images/dup_check.png'/>" style="cursor: pointer;vertical-align: middle;width: 114px;"/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label> 거래처명</td>
							<td class="tdContents">
								<input type="text" id="acNm" name="acNm" value="${accountVO.acNm }" required/>
							</td>
						</tr>	
						<tr>
							<td class="tdTitle">&nbsp;&nbsp;대표자명</td>
							<td class="tdContents">
								<input type="text" id="acCeoNm" name="acCeoNm" value="${accountVO.acCeoNm }" required/>
							</td>
						</tr>							
						<tr>
							<td class="tdTitle">&nbsp;&nbsp;거래처구분</td>
							<td class="tdContents">
								<input type="checkbox" class="tCheck" name="acSalesYn" value="Y" <c:if test="${accountVO.acSalesYn eq 'Y'}">checked</c:if> id="hasVAT1" /><label for="hasVAT1" class="cursorP"></label>&nbsp;&nbsp;매출거래처
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" class="tCheck" name="acBuyYn" value="Y" <c:if test="${accountVO.acBuyYn eq 'Y'}">checked</c:if> id="hasVAT2" /><label for="hasVAT2" class="cursorP"></label>&nbsp;&nbsp;매입거래처
							</td>
						</tr>							
						<tr>
							<td class="tdTitle"><label>*</label> 연락처</td>
							<td class="tdContents">
								<c:set var="tel" value="${fn:split(accountVO.acRepTel, '-')}" />
								<select id="acRepTel1" name="acRepTel1" required>
									<option value="02" <c:if test="${tel[0] eq '02'}">selected</c:if>>02</option>
									<option value="031" <c:if test="${tel[0] eq '031'}">selected</c:if>>031</option>
									<option value="010" <c:if test="${tel[0] eq '010'}">selected</c:if>>010</option>
								</select> -
								<input type="text" id="acRepTel2" name="acRepTel2" style="width: 53px" value="${tel[1] }" required/> -
								<input type="text" id="acRepTel3" name="acRepTel3" style="width: 53px" value="${tel[2] }" required/>
							</td>
						</tr>							
						<tr>
							<td class="tdTitle">&nbsp;&nbsp;FAX</td>
							<td class="tdContents">
								<c:set var="fax" value="${fn:split(accountVO.acRepFax, '-')}" />
								<select id="acRepFax1" name="acRepFax1">
									<option value="02" <c:if test="${fax[0] eq '02'}">selected</c:if>>02</option>
									<option value="031" <c:if test="${fax[0] eq '031'}">selected</c:if>>031</option>
								</select> -
								<input type="text" id="acRepFax2" name="acRepFax2" value="${fax[1] }" style="width: 53px"/> -
								<input type="text" id="acRepFax3" name="acRepFax3" value="${fax[2] }"style="width: 53px"/>
							</td>
						</tr>													
						<tr>
							<td class="tdTitle"><label>*</label> 주소</td>
							<td class="tdContents">
								<input type="text" id="acAddr" name="acAddr" value="${accountVO.acAddr }" style="width: 897px" required/>
							</td>
						</tr>																				
						<tr>
							<td class="tdTitle"></td>
							<td class="tdContents">
								<input type="text" id="acAddrDetail" name="acAddrDetail" value="${accountVO.acAddrDetail }" style="width: 897px"/>
							</td>
						</tr>	
					</table>			
				</div>
			</form>
			<form action="/" id="accountDirectorForm" name="accountDirectorForm"  method="post">
				<div id="pop_listForm">
					<div class="stitle">
						담당자정보&nbsp;<img class="veralignT" src="<c:url value='/images/btn_add.png'/>" style="cursor: pointer;vertical-align: middle;" onclick="fn_addDirector()"/>
					</div>
					<div class="floatC director_middle" style="border-bottom: 2px solid #c4c4c4; width:1040px;">
						<table class="dtl">
							<thead class="ftw400">
								<tr>
									<th scope="row"><label>*</label> 이름</th>
									<th scope="row">부서</th>
									<th scope="row">직급</th>
									<th scope="row"><label>*</label> 연락처</th>
									<th scope="row">이메일</th>
									<th scope="row">비고</th>
									<th scope="row">삭제</th>
								</tr>
							</thead>
							<tbody id="director_tbody">							
								<c:forEach var="result" items="${acDirectorList }" varStatus="status">
									<tr>
										<td>
											<input type="text" id="acDirectorNm" name="acDirectorNm" value="${result.acDirectorNm }" style="width: 60px" autocomplete="off" required/>
										</td>
										<td>
											<input type="text" id="acDirectorDeptNm" name="acDirectorDeptNm" value="${result.acDirectorDeptNm }" style="width: 96px" autocomplete="off"/>
										</td>
										<td>
											<input type="text" id="acDirectorPositionNm" name="acDirectorPositionNm"  value="${result.acDirectorPositionNm }" style="width: 55px" autocomplete="off"/>
										</td>
										<td>
											<input type="text" id="acDirectorMbNum" name="acDirectorMbNum" value="${result.acDirectorMbNum }" style="width: 117px" autocomplete="off" required/>
										</td>
										<td>
											<input type="text" id="acDirectorEmail" name="acDirectorEmail" value="${result.acDirectorEmail }" style="width: 193px" autocomplete="off"/>
										</td>
										<td>
											<input type="text" id="acDirectorDesc" name="acDirectorDesc" value="${result.acDirectorDesc }" style="width: 264px" autocomplete="off"/>
										</td>
										<td>
											<img src="<c:url value='/images/btn_del_gray.png'/>" onclick="fn_deleteDirector(this);"/>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</form>
			<form action="/" id="accountDepositForm" name="accountDepositForm"  method="post">
			<input type="hidden" id="acRepBknoYnCnt" name="acRepBknoYnCnt" value="1"/>
				<div id="pop_listForm">
					<div class="stitle">
						계좌 정보&nbsp;<img class="veralignT" src="<c:url value='/images/btn_add.png'/>" style="cursor: pointer;vertical-align: middle;" onclick="fn_addDeposit()"/>
					</div>
					<div class="floatC deposit_middle" style="border-bottom: 2px solid #c4c4c4; width:1040px;">
						<table class="dtl">
							<thead class="ftw400">
								<tr>
									<th scope="row"><label>*</label> 은행명</th>
									<th scope="row"><label>*</label> 계좌번호</th>
									<th scope="row"><label>*</label> 에금주</th>
									<th scope="row"><label>*</label> 주거래 계좌</th>
									<th scope="row">삭제</th>
								</tr>
							</thead>
							<tbody id="deposit_tbody">	
								<c:forEach var="result" items="${acDepositList }" varStatus="status">						
									<tr>
										<td>
											<input type="text" id="acBankNm" name="acBankNm" value="${result.acBankNm }" style="width: 230px" autocomplete="off" required/>
											<input type="hidden" id="acAdSeq" name="acAdSeq"/>
										</td>
										<td>
											<input type="text" id="acBkno" name="acBkno" value="${result.acBkno }" style="width: 299px" autocomplete="off" required/>
										</td>
										<td>
											<input type="text" id="acAcholder" name="acAcholder" value="${result.acAcholder }" style="width: 212px" autocomplete="off" required/>
										</td>
										<td>
											<input type="checkbox" class="tCheck" name="acRepBknoYn" <c:if test="${result.acRepBknoYn eq 'Y' }"> value="Y" checked</c:if> id="acRepBknoYn${status.count }" />
											<label for="acRepBknoYn${status.count } class="cursorP"></label>
										<td>
											<img src="/images/btn_del_gray.png" onclick="fn_deleteDeposit(this);"/>
										</td>
									</tr> 
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</form>
			<div class="btnWrap floatR">
				<div id="m_btn_save" class="floatR" onclick="fn_chkVali();">
					<button type="button"><img src="<c:url value='/images/btn_save.png'/>" /></button>
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>
	</div>	
	
</body>
</html>