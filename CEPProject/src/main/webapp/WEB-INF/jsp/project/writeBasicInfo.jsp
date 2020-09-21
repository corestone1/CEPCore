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
			width: 178px;
			height: 566px;
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
		}
		.popContainer .contents > div {
			margin: 30px 0 0 244px;
			width: calc(100% - 244px);
		}
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
		}
		.popContainer .contents select {
			width: 200px;
			height: 40px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('./images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.popContainer .contents select.wdts {
			width: 135px;
		}
		.popContainer .contents input {
			width: 788px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			width: 350px;
			height: 38px;
			background-image: url('./images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class="pname"] {
			width: 70px;
			border : none;
			outline: none;
		}
		.popContainer .contents input[class="calendar"] {
			width: 177px;
			height: 40px;
			background-image: url('./images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: 788px;
			height: 170px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			margin-bottom: 0px;
			resize: none;
		}
		.popContainer .contents .btnWrap {
			margin-top: 19px;
			margin-bottom: 27px;
		}		
		.popContainer .contents td.tdBtnWrap1 {
			margin-top: 19px;
			margin-bottom: 27px;
			width: 150px;
			border: 1px solid #e9e9e9;
			background-color: #C4B73B;
		}		
		.popContainer .contents > div > table > tr >td[class="tdBtnWrap2"] {
			margin-top: 19px;
			margin-bottom: 27px;
			width: 350px;
			border: 1px solid #e9e9e9;
			background-color: #D9418C;
		}
	</style>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">프로젝트 등록3</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw300">
				<li >기본정보</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr>
						<td><button><img src="<c:url value='/images/forecast_icon.png'/>" /></button></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="사업명" /></td>
					</tr>
					<tr>
						<td>
							<input type="text" placeholder="고객사" class="search" />							
							<input type="text" placeholder="담당자1" class="pname" readonly/>
						</td>
					</tr>
					<tr>
						<td>
							<select>
								<option value="">영업담당자</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<select>
								<option value="">지원담당자</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" placeholder="from" class="calendar" />
							<input type="text" placeholder="to" class="calendar" />
						</td>
					</tr>
					<tr>
						<td><textarea placeholder="비고"></textarea></td>
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
									<td width="30%" align="left" border="1px" border-color="#7ccbe8"><button><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
									<td width="70%" align="right"border="1px" border-color="solid #dcdcdc">
										<button><img src="<c:url value='/images/btn_prev.png'/>" /></button>
										<button><img src="<c:url value='/images/btn_next.png'/>" /></button>
									</td>
								</tr>
							</table>
						</div>					
					</tr> --%>
				</table>
			</div>
			<div class="btnWrap">
				<button><img src="<c:url value='/images/btn_file.png'/>" /></button>
				<button><img src="<c:url value='/images/btn_prev.png'/>" /></button>
				<button><img src="<c:url value='/images/btn_next.png'/>" /></button>
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
</html>