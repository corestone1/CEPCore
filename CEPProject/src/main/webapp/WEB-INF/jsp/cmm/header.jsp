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
	<script src="<c:url value='/js/common.js'/>"></script>
	<style>
			header {
				position: fixed;
				width: 1800px;
				z-index: 1;
			}
			header > div {
				height: 91px;
				background: url('http://172.10.122.10:8888/images/header_gradient.png') no-repeat left, linear-gradient(to left, #7664ca, #7664ca);
				background-repeat: no-repeat, no-repeat;
				background-position: left, left;
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
				width: 847px;
			}
			header ul li {
				padding: 0 26px;
				width: 89px;
				height: 36px;
				line-height: 33px;
				border-radius: 18px;
				margin-top: 29px;
			}
			header ul li:hover,
			header ul li.on {
				background-color: #9284d1;
			}
			header ul li:hover > div {
				opacity: 1;
				visibility: visible;
				transform: translateY(0);
			}
			header ul > li > div {
				background-color: #7764cb;
				width: 159px;
				padding-top: 20px;
				margin-top: 3px;
				opacity: 0;
				visibility: hidden;
				transition: .3s linear;
				transform: translateY(-10%);
			}
			header ul > li > div > ul {
				width: 100%;
			}
			header ul > li > div > ul > li {
				width: 100%;
				padding: 0;
				font-weight: 300;
				height: 36px;
				line-height: 36px;
				margin: 0;
				font-size: 14px;
				border-radius: 0;
			}
			header ul > li > div > ul > li:hover {
				background-color: #533db3
			}
	</style>
</head>
<body>
	<header>
		<div class="wdt100">
			<ul class="ftw400 mgauto hgt100 colorWhite">
				<li class="floatL textalignC cursorP"><a href="#">Dashboard</a></li>
				<li class="floatL textalignC cursorP"><a href="/forecastList.do">Forecast</a></li>
				<li class="floatL textalignC cursorP"><a href="/project/list.do">프로젝트</a></li>
				<li class="floatL textalignC cursorP">
					<a href="/maintenance/mtContractList.do">유지보수</a>
					<div class="">
						<ul>
							<li><a href="/maintenance/mtContractList.do">유지보수목록</a></li>
							<li><a href="/maintenance/mtWorkList.do">작업목록</a></li>
						</ul>
					</div>
				</li>
				<li class="floatL textalignC cursorP">
					<a href="#">프로젝트관리</a>
					<div class="">
						<ul>
							<li><a href="/mngProject/order/list.do">발주목록</a></li>
							<li><a href="/mngProject/bill/list.do">계산서목록</a></li>
							<li><a href="/mngProject/mapping/list.do">발주·계산서 매핑</a></li>
							<li><a href="/mngProject/billSchedule/list.do">계산서 일정</a></li>
							<li><a href="/mngProject/fundSchedule/list.do">수금·지급 일정</a></li>
						</ul>
					</div>
				</li>
				<li class="floatL textalignC cursorP">
					<a href="#">공통관리</a>
					<div class="">
						<ul>
							<li><a href="/mngProject/order/list.do">발주목록</a></li>
							<li><a href="/mngProject/bill/list.do">계산서목록</a></li>
							<li><a href="/mngProject/mapping/list.do">발주·계산서 매핑</a></li>
							<li><a href="/mngProject/billCalendar/list.do">계산서 일정</a></li>
							<li><a href="/mngProject/fundSchedule/list.do">수금·지급 일정</a></li>
						</ul>
					</div>
				</li>			
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