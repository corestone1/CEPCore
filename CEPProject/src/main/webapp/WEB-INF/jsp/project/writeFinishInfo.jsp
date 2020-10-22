<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
		.popContainer .top {
			width: 100%;
			height: 102px;
			border-bottom: 4px solid #4b3a93;
			position: absolute;
			top: 0;
		}
		.popContainer .top > div {
			font-size: 24px;
			padding-left: 34px;
			padding-top: 43px;
		}
		.popContainer .left {
			width: 201px;
			height: 601px;
			position: absolute;
			top: 107px;
			box-shadow: 3px -1px 8px 0px rgb(0,0,0,0.3);
			background-color: #32bc94;
			z-index: 4;
			font-size: 15px;
		}
		.popContainer .left ul li {
			height: 47px;
			padding-left: 28px;
			line-height: 47px;
			background-color: #fff;
			color: #32bc94;
		}
		.popContainer .contents {
			position: absolute;
			width: 100%;
			height: 601px;
			top: 107px;
			right: 0;
			z-index: 3;
			background-color: #f6f7fc;
		}
		.popContainer .contents > div {
			margin: 9px 0 0 244px;
			width: calc(100% - 244px);
		}
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 5px;
		}
		.popContainer .contents input {
			width: 700px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="timeInfo"] {
			width: 30px;
			height: 38px;
		}
		.popContainer .contents input[class="calendar"] {
			width: 130px;
			height: 40px;
			background-image: url('./images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: 694px;
			height: 277px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		.popContainer .contents .btnWrap {
			margin-top: 19px;
			margin-bottom: 27px;
		}		
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			width: 80px;
			font-size: 15px;			
			padding-left: 23px;
		}				
		.popContainer .contents td.tdContents {
			width: 135px;
			font-size: 15px;
			font-weight: 200;
			padding-left: 15px;
		} 
		.popContainer .contents .btnDiv {
	  		margin-right: 60px;
		} 	 				
		.popContainer .top div[class="subTitle"] {
			height: 36px;
			width: 124px;
			border-radius: 35px;
			color: #fff;
			background-color: #9284d1;
			margin-left: 150px;
			text-align: center;
			font-weight: 200;
			
		}  		
		.popContainer .contents tr:first-child td { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  			
			padding-top: 20px;
		}
		.popContainer .contents input[class="pname"] {
			width: 400px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
			padding-left: 0px;
		}
	</style>
	<script>		
		function fn_finish(){
			var url = '/writeFinishInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
	</script>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">프로젝트 등록</div>
				<div class="subTitle">완료</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw300">
				<li >완료정보</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr>
						<td class="tdTitle">고객사</td>
						<td class="tdContents" colspan="2">
							<input type="text" class="pname"  value="KB손해보험" readonly/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle">프로젝트명</td>
						<td class="tdContents" colspan="2">
							<input type="text" class="pname"  value="EDMS이미지 암호화" readonly/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle">검수일</td>
						<td class="tdContents" colspan="2">
							<input type="text" class="calendar" value="2020-12-25"/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle">검수확인서</td>
						<td class="tdContents">
							<button><img src="<c:url value='/images/btn_file_upload.png'/>" /></button>
						</td>
						<td>
							<input type="text" class="pname"  value="EDMS이미지 암호화 검수확인서.pdf" readonly/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle veralignT">비고</td>
						<td class="tdContents"  colspan="2"><textarea></textarea></td>
					</tr>
				</table>
			</div>
			<div class="btnWrap">
				<div class="floatR btnDiv">
					<button onclick="fn_finish();"><img src="<c:url value='/images/btn_finish.png'/>" /></button>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>