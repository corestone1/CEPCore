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
			width: 178px;
			height: 388px;
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
		.popContainer .left ul li.active,
		.popContainer .left ul li:hover {
			background-color: #fff;
			color: #32bc94;
		}
		.popContainer .contents {
			position: absolute;
			width: 100%;
			height: 388px;
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
			width: 420px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			width: 200px;
			height: 40px;			
			background-image: url('./images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents .btnWrap {
			margin-top: 25px;
		}
	</style>
</head>
<body>
	<div class="popContainer">
		<div class="top">
			<div>
				<div class="floatL ftw500">프로젝트 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw300">
				<li class="colorWhite cursorP">금액</li>
				<li class="colorWhite cursorP">예상일정</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr>
						<td>
							<select>
								<option value="">구분</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><input type="text" placeholder="고객사" class="search" /></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="사업명" /></td>
					</tr>
					<tr>
						<td>
							<select>
								<option value="">제품구분</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<select>
								<option value="">수주확정Q</option>
							</select>
							<select class="wdts">
								<option value="1분기">1분기</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<select>
								<option value="">사업진행단계</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div class="btnWrap">
				<button><img src="<c:url value='/images/btn_prev.png'/>" /></button>
				<button><img src="<c:url value='/images/btn_next.png'/>" /></button>
			</div>
		</div>
	</div>
</body>
</html>