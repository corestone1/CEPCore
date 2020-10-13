<<<<<<< HEAD
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
			border-bottom: 4px solid #6a5bae;
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
			width: 250px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			width: 250px;
			height: 38px;
			background-image: url('./images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class="portInfo"] {
			width: calc(100% - 20px);
		}
		.popContainer .contents input[class="calendar"] {
			width: 250px;
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
	</style>
	<script>
		function fn_addBuildView(){
			var url = '/writeBuildInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_preBiddingView(){
			var url = '/writeBiddingInfo.do';
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
			<ul class="ftw400">
				<li class="colorWhite cursorP on">설치 및 구축</li>
				<li class="colorWhite cursorP">수행일지</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr>
						<td class="tdTitle">설치 장소</td>
						<td class="tdContents"><input type="text"/></td>
					</tr>
					<tr>
						<td class="tdTitle">구&nbsp;&nbsp;분</td>
						<td class="tdContents">
							<input type="radio" class="tCheck" name="gubun" id="gubun1" /><label for="gubun1" class="cursorP"></label>
							&nbsp;&nbsp;&nbsp;신규&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" class="tCheck" name="gubun" id="gubun2" /><label for="gubun2" class="cursorP"></label> 
							&nbsp;&nbsp;&nbsp;증설&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" class="tCheck" name="gubun" id="gubun3" /><label for="gubun3" class="cursorP"></label> 
							&nbsp;&nbsp;&nbsp;기타
						</td>
					</tr>
					<tr>
						<td class="tdTitle">모델명</td>
						<td class="tdContents">
							<input type="text" class="search" />
						</td>
					</tr>
					<tr>
						<td class="tdTitle">시리얼번호</td>
						<td class="tdContents">
							<input type="text"/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle">납품일</td>
						<td class="tdContents">
							<input type="text" class="calendar" />
						</td>
					</tr>
					<tr>
						<td class="tdTitle">버전</td>
						<td class="tdContents">
							<input type="text"/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle veralignT">주요 스펙</td>
						<td class="tdContents"><textarea></textarea></td>
					</tr>
					<tr>
						<td class="tdTitle">캐쉬메모리</td>
						<td class="tdContents">
							<input type="text"/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle wdt100">포트 정보</td>
						<td class="tdContents">
							<input type="text" class="portInfo"/>
						</td>
					</tr>
					<%-- <tr>
						<td>							
							<button><img src="<c:url value='/images/btn_file.png'/>" /></button>
							<button><img src="<c:url value='/images/btn_prev.png'/>" /></button>
							<button><img src="<c:url value='/images/btn_next.png'/>" /></button>							
						</td>
					</tr> --%>
					<%-- <tr>
						<td class="tdBtnWrap1"><button><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
						<td class="tdBtnWrap2">
							<button><img src="<c:url value='/images/btn_prev.png'/>" /></button><button><img src="<c:url value='/images/btn_next.png'/>" /></button>
						</td>
					</tr> --%>
					<%-- <tr>
						<div class="btnWrap">
							<table width="788px">
								<tr width="788px">
									<td width="30%" align="left" border="1px" border-color="#7ccbe8">
										<button><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
									<td width="70%" align="right"border="1px" >
										<button><img src="<c:url value='/images/btn_next.png'/>" /></button>
									</td>
								</tr>
							</table>
						</div>					
					</tr> --%>					
				</table>
				<%-- <table>
					<tr width="788px" class="btnWrap">
						<td  width="200">
							<button><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
						<td width="610"align="right">
							<button><img src="<c:url value='/images/btn_next.png'/>" /></button>
						</td>
					</tr>
				</table> --%>	
			</div>
			<div class="btnWrap">
				<div class="floatR">
					<button onclick="fn_preBiddingView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					<button onclick="fn_addBuildView();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
				</div>
			</div>
<%-- 			<div class="btnWrap">
				<table width="788px">
					<tr width="788px">
						<td width="30%" align="left" border="1px" border-color="#7ccbe8"><button><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
						<td width="70%" align="right"border="1px" border-color="solid #dcdcdc">
							<button><img src="<c:url value='/images/btn_prev.png'/>" /></button>
							<button><img src="<c:url value='/images/btn_next.png'/>" /></button>
						</td>
					</tr>
				</table>
			</div> --%>
		</div>
	</div>
</body>
=======
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
			border-bottom: 4px solid #6a5bae;
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
		}
		.popContainer .left ul li.on,
		.popContainer .left ul li:hover {
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
	  		border-spacing: 0 3px;
		}
		.popContainer .contents input {
			width: 250px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			width: 250px;
			height: 38px;
			background-image: url('./images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class="portInfo"] {
			width: 691px;
			height: 38px;
		}
		.popContainer .contents input[class="calendar"] {
			width: 250px;
			height: 40px;
			background-image: url('./images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: 691px;
			height: 93px;
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
			width: 96px;
			font-size: 15px;
			padding-left: 23px;
		}				
		.popContainer .contents td.tdContents {
			width: 691px;
			font-size: 15px;
			font-weight: 150;
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
			padding-top: 35px;
		}
	</style>
	<script>
		function fn_addBuildView(){
			var url = '/writeWorkInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_preBiddingView(){
			var url = '/writeBiddingInfo.do';
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
				<li class="colorWhite cursorP on">설치 및 구축(Install Base)</li>
				<li class="colorWhite cursorP">수행일지</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr>
						<td class="tdTitle">설치장소</td>
						<td class="tdContents"><input type="text"/></td>
					</tr>
					<tr>
						<td class="tdTitle">구분</td>
						<td class="tdContents">
							<input type="radio" class="tCheck" name="gubun" id="gubun1" /><label for="gubun1" class="cursorP"></label>
							&nbsp;&nbsp;&nbsp;신규&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" class="tCheck" name="gubun" id="gubun2" /><label for="gubun2" class="cursorP"></label> 
							&nbsp;&nbsp;&nbsp;증설&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" class="tCheck" name="gubun" id="gubun3" /><label for="gubun3" class="cursorP"></label> 
							&nbsp;&nbsp;&nbsp;기타
						</td>
					</tr>
					<tr>
						<td class="tdTitle">모델명</td>
						<td class="tdContents">
							<input type="text" class="search" />
						</td>
					</tr>
					<tr>
						<td class="tdTitle">시리얼번호</td>
						<td class="tdContents">
							<input type="text"/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle">납품일</td>
						<td class="tdContents">
							<input type="text" class="calendar" />
						</td>
					</tr>
					<tr>
						<td class="tdTitle">버전</td>
						<td class="tdContents">
							<input type="text"/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle veralignT">주요스펙</td>
						<td class="tdContents"><textarea></textarea></td>
					</tr>
					<tr>
						<td class="tdTitle">캐쉬메모리</td>
						<td class="tdContents">
							<input type="text"/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle">포트정보</td>
						<td class="tdContents">
							<input type="text" class="portInfo"/>
						</td>
					</tr>
					<%-- <tr>
						<td>							
							<button><img src="<c:url value='/images/btn_file.png'/>" /></button>
							<button><img src="<c:url value='/images/btn_prev.png'/>" /></button>
							<button><img src="<c:url value='/images/btn_next.png'/>" /></button>							
						</td>
					</tr> --%>
					<%-- <tr>
						<td class="tdBtnWrap1"><button><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
						<td class="tdBtnWrap2">
							<button><img src="<c:url value='/images/btn_prev.png'/>" /></button><button><img src="<c:url value='/images/btn_next.png'/>" /></button>
						</td>
					</tr> --%>
					<%-- <tr>
						<div class="btnWrap">
							<table width="788px">
								<tr width="788px">
									<td width="30%" align="left" border="1px" border-color="#7ccbe8">
										<button><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
									<td width="70%" align="right"border="1px" >
										<button><img src="<c:url value='/images/btn_next.png'/>" /></button>
									</td>
								</tr>
							</table>
						</div>					
					</tr> --%>					
				</table>
				<%-- <table>
					<tr width="788px" class="btnWrap">
						<td  width="200">
							<button><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
						<td width="610"align="right">
							<button><img src="<c:url value='/images/btn_next.png'/>" /></button>
						</td>
					</tr>
				</table> --%>	
			</div>
			<div class="btnWrap">
				<div class="floatR btnDiv">
					<button onclick="fn_preBiddingView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					<button onclick="fn_addBuildView();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
				</div>
				
			</div>
<%-- 			<div class="btnWrap">
				<table width="788px">
					<tr width="788px">
						<td width="30%" align="left" border="1px" border-color="#7ccbe8"><button><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
						<td width="70%" align="right"border="1px" border-color="solid #dcdcdc">
							<button><img src="<c:url value='/images/btn_prev.png'/>" /></button>
							<button><img src="<c:url value='/images/btn_next.png'/>" /></button>
						</td>
					</tr>
				</table>
			</div> --%>
		</div>
	</div>
</body>
>>>>>>> branch 'master' of https://github.com/corestone1/CEPCore.git
</html>