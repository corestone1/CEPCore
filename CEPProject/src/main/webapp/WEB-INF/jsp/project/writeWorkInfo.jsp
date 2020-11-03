<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
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
		.popContainer .left {
			width: 201px;
			height: 601px;
			position: absolute;
			top: 107px;
			box-shadow: 3px -1px 8px 0px rgb(0,0,0,0.3);
			background-color: #32bc94;
			z-index: 4;
		}
		.popContainer .left ul li {
			height: 47px;
			padding-left: 28px;
			line-height: 47px;
		}
		.popContainer .left ul li.on,
		.popContainer .left ul li:hover {
			background-color: #fff;
			color: #32bc94;
		}
		.popContainer .contents {
			position: absolute;
			width: calc(100% - 201px);
			height: 601px;
			top: 107px;
			left: 201px;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
		}
		.popContainer .contents > div {
			width: calc(100% - 80px);
			margin: 10px 40px 0 40px;
		}
		.popContainer .contents > div:first-child {
			min-height: 529px;
		}
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
		}
		.popContainer .contents input {
			width: calc(100% - 20px);
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
			width: 150px;
			height: 40px;
			background-image: url('./images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 100px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}	
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			font-size: 14px;
			color: #535353;
			padding-right: 20px;
			width: 99px;
			
		}				
		.popContainer .contents td.tdContents {
			width: 100%;
			font-size: 14px;
			font-weight: 200;
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
			padding-top: 8px;
		}		
	</style>
	<script>
		function fn_addBuildView(){
			var url = '/project/writeFinishInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_preBiddingView(){
			var url = '/project/writeBuildInfo.do';
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
				<div class="subTitle">수행</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw300">
				<li class="colorWhite cursorP">설치 및 구축</li>
				<li class="colorWhite cursorP on">수행일지</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr>
						<td class="tdTitle">구분</td>
						<td class="tdContents">
							<input type="radio" class="tCheck" name="gubun" id="gubun1" /><label for="gubun1" class="cursorP"></label>
							&nbsp;&nbsp;작업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" class="tCheck" name="gubun" id="gubun2" /><label for="gubun2" class="cursorP"></label> 
							&nbsp;&nbsp;이슈&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" class="tCheck" name="gubun" id="gubun3" /><label for="gubun3" class="cursorP"></label> 
							&nbsp;&nbsp;장애&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" class="tCheck" name="gubun" id="gubun4" /><label for="gubun4" class="cursorP"></label> 
							&nbsp;&nbsp;기타
						</td>
					</tr>
					<tr>
						<td class="tdTitle">일시</td>
						<td class="tdContents">
							<input type="text" class="calendar" />&nbsp;&nbsp;
							<input type="text" numberOnly class="timeInfo"/> :00&nbsp;&nbsp;&nbsp;
							소요시간 <input type="text" numberOnly class="timeInfo"/> : <input type="text" placeholder="소요시간" numberOnly class="timeInfo" value="00"/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle">제목</td>
						<td class="tdContents"><input type="text"/></td>
					</tr>
					<tr>
						<td class="tdTitle veralignT">내용</td>
						<td class="tdContents"><textarea></textarea></td>
					</tr>
					<tr>
						<td class="tdTitle veralignT">처리결과</td>
						<td class="tdContents"><textarea></textarea></td>
					</tr>
					<tr>
						<td class="tdTitle veralignT">기타</td>
						<td class="tdContents"><textarea></textarea></td>
					</tr>
					<tr>
						<td class="tdTitle">첨부파일</td>
						<td class="tdContents">
							<button><img src="<c:url value='/images/btn_file_upload.png'/>" /></button>
						</td>
					</tr>			
				</table>
			</div>
			<div class="btnWrap">
				<div class="floatR">
					<button onclick="fn_preBiddingView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					<button onclick="fn_addBuildView();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>