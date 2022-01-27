<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.ui-dialog {
			top: -473px !important;
		}
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
			width: 100%;
			height: 440px;
			top: 107px;
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
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
	  		width: 100%;
	  		border-bottom: none;
		}
		.popContainer .contents > div > table tr td {
			padding: 10px 20px;
		}
		.popContainer .contents select {
			width: 326px;
			height: 40px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 95% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.popContainer .contents select.wdts {
			width: 135px;
		}
		.popContainer .contents input {
			border: none;
			background-color: transparent;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 113px;
			padding: 0 10px;
			background-color: transparent;
			border: 1px solid #e9e9e9;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			font-size: 14px;
			color: #525252;
			padding-right: 20px;
			width: 17%;
		}
		.popContainer .contents td.tdContents {
			width: 87%;
			font-size: 14px;
		} 
		.ui-datepicker.ui-widget-content {
			z-index: 102 !important;
		 }
	</style>
	<script>
		$(document).ready(function() {
			
		});
	
			
	</script>
</head>
<body>
	<form:form commandName="infoForm" id="infoForm" name="infoForm" method="post">
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">계산서 정보</div>
				</div>
			</div>
			<div class="contents">
				<!-- <input type="text" id="id" style="border: 1px solid #000; width: 200px;"/>
				<input type="text" id="no" style="border: 1px solid #000; width: 200px;"/> -->
				<input type="hidden" id="dialogId" />
				<div>  
					<table>
						<tr>
							<td class="tdTitle">계산서번호</td>
							<td class="tdContents">
								<input type="text" name="billNo" id="billNo" value="${billList[0].billNo }" readOnly/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">발행일자</td>
							<td class="tdContents">
								<input type="text"  name="billIssueDt" id="billIssueDt" value="${displayUtil.displayDate(billList[0].billIssueDt) }"readOnly/>	
							</td>
						</tr>
						<tr>
							<td class="tdTitle">계산서 금액</td>
							<td class="tdContents">
								<input type="text"  name="billAmount" id="billAmount" value="${displayUtil.commaStr(billList[0].billAmount) }"readOnly/>	
							</td>
						</tr>
						<tr>
							<td class="tdTitle">비고</td>
							<td class="tdContents">
								<textarea name="remark" id="remark" readOnly><c:out value="${billList[0].remark }" /></textarea>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>