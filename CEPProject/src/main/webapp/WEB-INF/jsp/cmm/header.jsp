<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/popup.css'/>"/>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/datepicker.min.css'/>"/>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="<c:url value='/js/popup.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
	<script src="<c:url value='/js/file.js'/>"></script>
	<script src="<c:url value='/js/jquery.fileDownload.js'/>"></script>
	<style>
			header {
				position: fixed;
				width: 1800px;
				z-index: 1;
			}
			header > div {
				height: 91px;
				background: url('/images/header_gradient.png') no-repeat left, linear-gradient(to left, #7664ca, #7664ca);
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
				width: 988px;
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
			.alarmContent {
				position: absolute;
				top: 30px;
				right: -79px;
				width: 200px;
				background: #fff;
				border-radius: 5px;
				box-shadow: 3px -1px 8px 0px rgb(0,0,0,0.6);
				padding: 0 23px;
			}
			.alarmContent div {
				font-weight: 200;
				font-size: 15px;
				margin-bottom: 10px;
				padding-bottom: 5px;
				border-bottom: 1px solid #E4E8EB;
			}
			.alarmContent  div  label {
				display:block;
			}
			.alarmContent .alarmTitle {
				width: 123px;
			    display: block;
			    word-break: break-all;
			    white-space: nowrap;
			    overflow: hidden;
			    text-overflow: ellipsis;
			}
			.alarmContent .closeBtn {
				padding-top: 11px;
			}
			.alarmContent .closeBtn img {
				width: 13px;
				height: 13px;
			}
			.alarmCnt {
				width: 12px;
			    height: 12px;
			    background-color: red;
			    position: absolute;
			    top: -5px;
			    left: 9px;
			    border-radius: 50%;
			}
	</style>
	<script>
		$(document).ready(function() {
			
			$("#name").mouseover(function() {
				$(this).html('Logout');
			});
			$("#name").mouseout(function() {
				$(this).html($("#nameVal").val());
			});

			$("ul#menu > li").each(function() {
				if($(this).find("div").length) {
					for(var i = 0; i < $(this).find("div").find("a").length; i++) {
						if(window.location.pathname == $(this).find("div").find("a")[i].getAttribute("href")) {
							$(this).addClass("on");
						}
					}
				} else {
					if(window.location.pathname == $(this).find("a").attr("href")) {
						$(this).addClass("on");
					}
				}
			});
			
			var click = 1;
			
			$("#alarmContainer").click(function() {
				if(click % 2 == 1) {
					$(".alarmContent").removeClass("dpNone");
				} else {
					$(".alarmContent").addClass("dpNone");
				}
				click++;
			});
			
			$(".closeBtn").click(function() {
				$(".alarmContent").addClass("dpNone");
			});
			
			var alarmCnt = 0;
			var cnt = 0;

			$.ajax({
				url:"/alarm/viewAlarm.do",
				type:"GET",
				success:function(data) {
					appendHtml(data);
					
					function appendHtml(content) {
						var cnt = 0;
						
						if(content.length > 5) {
							cnt = 5;
						} else {
							cnt = content.length;
						}
						
						for(i = 0; i < cnt; i++) {
							var today = new Date();   
							var year = today.getFullYear(); 
							var month = (today.getMonth() + 1 >= 10) ? today.getMonth() + 1 : "0"+(today.getMonth() + 1);
							var date = (today.getDate() >= 10) ? today.getDate() : "0"+today.getDate();
							var day = String(year) + String(month) + String(date);
							var time = "";
							var className = "";
							var kind = "";
							
							if(content[i].alarmHit == 0) {
								className = "ftw500";
								alarmCnt++;
							}
							
							if(day == content[i].regDt) {
								day = "오늘";
							} else {
								day = content[i].regDt.substring(4,6) + "/" + content[i].regDt.substring(6,8); 
							}
							
							time = content[i].regTm.substring(0,2) + ":" + content[i].regTm.substring(2,4)
							
							if(content[i].pjMtKey != 'undefined' && content[i].pjMtKey != null && content[i].pjMtKey != "") {
								if(content[i].pjMtKey.length != 0 && content[i].pjMtKey.substring(0,2) == "PJ") {
									kind = "프로젝트";
								} else if(content[i].pjMtKey.length != 0 && content[i].pjMtKey.substring(0,2) == "MA") {
									kind = "유지보수";
								} 
							}
							
							$(".alarmContent").append("<div class='"+content[i].alarmKey+"' onclick='fnMovePage(&#39;"+ content[i].pjMtKey +"&#39;, &#39;"+content[i].alarmKey+"&#39;)'><p class='"+className+"'>"+content[i].alarmKind+"</p><p style='font-size: 12px; color: #919191;'><label class='alarmTitle floatL' title='"+content[i].alarmTitle+"'>"+kind+" "+content[i].alarmTitle+"</label><label class='floatR'>"+ day + " " + time + "</label><label class='floatC'></label></div>");
						}
						
						if(alarmCnt != 0) {
							$(".alarmCnt").removeClass('dpNone');
						}
					}
				} , error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
			});
		});
		
		function fnMovePage(key, idx) {
			
			$.ajax({
	        	url :"/alarm/update.do",
	        	type:"POST",  
	            data: {"idx": idx},
	            cache: false,
		        async: false,
		        dataType: "json",
	        	success:function(data){		  
	        		var form = document.listForm;
	    			if(key != 'undefined' && key != null && key != "") {
	    				if(key.substring(0,2) == "PJ") {
	    					if(document.getElementsByName('pjKey').length != 0) {
	    						form.pjKey.value = key;
	    					} else {
	    						$(form).append("<input type='hidden' name='pjKey' value='"+ key +"' />");
	    					}
	    					form.action = "<c:url value='/project/detail/main.do'/>";
	    					form.submit();  
	    				} else if(key.substring(0,2) == "MA") {
	    					if(document.getElementsByName('selectKey').length != 0) {
	    						form.selectKey.value = key;
	    					} else {
	    						$(form).append("<input type='hidden' name='selectKey' value='"+ key +"' />");
	    					}
	    					form.action = "/maintenance/contract/detail/productInfo.do";
	    					form.submit();   
	    				}
	    			} else {
	    				$("."+idx+" p").removeClass();
	    				
	    				$.ajax({
	    					url:"/alarm/viewAlarm.do",
	    					type:"GET",
	    					success:function(data) {
    							var cnt = 0;
    							var alarmCnt = 0;
    							
    							if(data.length > 5) {
    								cnt = 5;
    							} else {
    								cnt = data.length;
    							}
    							
    							for(i = 0; i < cnt; i++) {
    								if(data[i].alarmHit == 0) {
    									alarmCnt++;
    								}
    							}
    							
    							if(alarmCnt == 0) {
    								$(".alarmCnt").addClass('dpNone');
    							} 
	    					} , error: function(request, status, error) {
	    		        		if(request.status != '0') {
	    		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	    		        		}
	    		        	} 
	    				});
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
	<header>
		<div class="wdt100">
			<ul class="ftw400 mgauto hgt100 colorWhite" id="menu">
				<li class="floatL textalignC cursorP"><a href="#">Dashboard</a></li>
				<li class="floatL textalignC cursorP"><a href="/forecast/list.do">Forecast</a></li>
				<li class="floatL textalignC cursorP"><a href="/project/list.do">프로젝트</a></li>
				<li class="floatL textalignC cursorP">
					<a href="#">프로젝트관리</a>
					<div class="">
						<ul>
							<li><a href="/mngProject/order/list.do">발주목록</a></li>
							<!-- <li><a href="/mngProject/bill/list.do">계산서목록</a></li> -->
							<li><a href="/mngProject/mapping/list.do">발주·계산서 매핑</a></li>
							<li><a href="/mngProject/billSchedule/list.do">계산서 일정</a></li>
							<li><a href="/mngProject/fundSchedule/list.do">수금·지급 일정</a></li>
						</ul>
					</div>
				</li>
				<li class="floatL textalignC cursorP">
					<a href="/maintenance/contract/contractList.do">유지보수</a>
					<div class="">
						<ul>
							<li><a href="/maintenance/contract/contractList.do">유지보수목록</a></li>
							<li><a href="/maintenance/work/workList.do">작업목록</a></li>
						</ul>
					</div>
				</li>
				<li class="floatL textalignC cursorP">
					<a href="#">유지보수관리</a>
					<div class="">
						<ul>
							<li><a href="/mngMaint/order/list.do">발주목록</a></li>
							<!-- <li><a href="/mngMaint/bill/list.do">계산서목록</a></li> -->
							<li><a href="/mngMaint/mapping/list.do">발주·계산서 매핑</a></li>
							<li><a href="/mngMaint/billSchedule/list.do">계산서 일정</a></li>
							<li><a href="/mngMaint/fundSchedule/list.do">수금·지급 일정</a></li>
						</ul>
					</div>
				</li>
				<li class="floatL textalignC cursorP">
					<a href="#">공통관리</a>
					<div class="">
						<ul>
							<li><a href="/mngCommon/bill/list.do">계산서관리</a></li>
							<li><a href="/mngCommon/account/list.do">거래처관리</a></li>
							<li><a href="/mngCommon/product/list.do">제품관리</a></li>
							<li><a href="/mngCommon/employee/list.do">사용자관리</a></li>
							<!-- <li><a href="/mngProject/mapping/list.do">발주·계산서 매핑</a></li>
							<li><a href="/mngProject/billCalendar/list.do">계산서 일정</a></li>
							<li><a href="/mngProject/fundSchedule/list.do">수금·지급 일정</a></li> -->
						</ul>
					</div>
				</li>			
			</ul>
			<div id="alarmWrap">
				<div class="floatL" id="alarmContainer">
					<img class="cursorP"  src="<c:url value='/images/header_alarm.png'/>" />
					<div class="alarmCnt dpNone"></div>
				</div>
				<div class="dpNone alarmContent">
					<button class="closeBtn floatR" type="button" title="Close">
						<span><img src="/images/popup_close.png" /></span>
					</button>
					<button class="floatC"></button>
				</div>
				<div class="floatL cursorP" onclick="location.href='/logout.do'">
					<img class="floatL" src="<c:url value='/images/header_profile.png'/>"/>
					<span class="colorWhite floatL" id="name"><%= session.getAttribute("name") %></span>
					<input id="nameVal" type="hidden" value=<%=session.getAttribute("name") %> />
				</div>
			</div>
		</div>
	</header>
</body>
</html>