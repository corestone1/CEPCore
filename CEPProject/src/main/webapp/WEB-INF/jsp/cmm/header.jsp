<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/popup.css'/>"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value='/js/popup.js'/>"></script>
	<style>
			header {
				position: fixed;
				width: 100%;
			}
			header > div {
				height: 91px;
				background: url('./images/header_gradient.png') no-repeat right, linear-gradient(to right, #7664ca, #7664ca);
				background-repeat: no-repeat, no-repeat;
				background-position: right, left;
			}
			header > div > div {
				position: absolute;
				right: 70px;
				top: 34px;
			}
			header > div > div > div {
				margin-right: 20px;
			}
			header > div > div > div > span {
				margin-left: 10px;
				line-height: 22px;
				letter-spacing: 2px;
			}
			header ul {
				width: 686px;
			}
			header ul li {
				padding: 0 26px;
				width: 85px;
				height: 36px;
				line-height: 33px;
				border-radius: 18px;
				margin-top: 29px;
			}
			header ul li:hover {
				background-color: #9284d1;
			}
	</style>
</head>
<body>
	<header>
		<div class="wdt100">
			<ul class="ftw400 mgauto hgt100 colorWhite">
				<li class="floatL textalignC cursorP"><a href="#">Dashboard</a></li>
				<li class="floatL textalignC cursorP"><a href="/forecastList.do">Forecast</a></li>
				<li class="floatL textalignC cursorP"><a href="/projectList.do">프로젝트</a></li>
				<li class="floatL textalignC cursorP"><a href="#">유지보수</a></li>
				<li class="floatL textalignC cursorP"><a href="#">공통관리</a></li>			
			</ul>
			<div>
				<div class="floatL"><img class="cursorP"  src="<c:url value='/images/header_alarm.png'/>" /></div>
				<div class="floatL"><img class="cursorP"  src="<c:url value='/images/header_setting.png'/>"/></div>
				
				<div class="floatL cursorP">
					<img class="floatL" src="<c:url value='/images/header_profile.png'/>"/>
					<span class="colorWhite floatL">박경구</span>
					<span class="material-icons colorWhite">keyboard_arrow_down</span>
				</div>
			</div>
		</div>
	</header>
</body>
</html>