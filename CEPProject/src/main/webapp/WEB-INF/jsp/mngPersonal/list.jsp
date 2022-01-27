<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<%@include file="/WEB-INF/jsp/cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Alarm 목록</title>
	<style>
		.sfcnt {
			height: 91px;
		}
		.nav {
			width: 100%;
			height: 49px;
		}
		.contentsWrap {
			background-color: #f6f7fc;
			height: 830px;
			overflow-y: auto;
		}
		.contentsWrap .contents {
			padding: 38px 71px; 
			width: 1662px;
		}
		.title > label {
			font-size: 26px;
		}
		.middle {
			position: relative;
		    width: 750px;
		    min-height: 768px;
		}
		.frst_contents {
		    min-height: 760px;
    		padding-bottom: 20px;
		}
		.time_line {
		    padding: 25px 25px 25px 20px;
		}
		.time_line .daily_obj {
			background: url(https://ssl.pstatic.net/static/me/new/timeLine_bg.gif) repeat-y 15px 0;
    		padding-top: 20px;
		}
		.time_line .daily_obj h4 {
		    height: 33px;
		    background: url(https://ssl.pstatic.net/static/me/new/ico_time.png) no-repeat;
		    padding-left: 40px;
		    margin-bottom: 12px;
		    font-size: 14px;
		    color: #333;
		    font-family: dotum;
		    line-height: 33px;
		}
		.tx_box_obj {
		    padding-left: 39px;
		    margin-top: 9px;
		}
		.tx_tooltip {
		    position: relative;
		    min-height: 72px;
		    border: 1px solid #e0e0e0;
		    background: #fff;
		    border-top-color: #ececec;
		    border-radius: 8px;
		}
		.tx_tooltip .tx_bubble {
		    float: none;
		    padding: 15px 22px 7px 17px;
		    *zoom: 1;
		}
		.tx_tooltip .thumb {
		    float: left;
		    width: 40px;
		    height: 40px;
		    margin-right: 13px;
		    background: url(https://ssl.pstatic.net/static/me/new/sp_me_high20171115.png) no-repeat -410px -400px;
		}
		.tx_tooltip .thumb a, .lst_obj .thumb a {
		    background-position: -9999px -9999px;
		}
		.tx_tooltip .thumb .alarm, .tx_tooltip .thumb a, .lst_obj .thumb a {
		    background-image: url(https://ssl.pstatic.net/static/me/new/sp_me_icon_210326.png);
		    background-repeat: no-repeat;
		}
		.tx_tooltip .thumb a {
		    display: inline-block;
		    position: relative;
		    width: 100%;
		    height: 40px;
		}
		.tx_tooltip .bubble_content {
		    float: left;
		}
		.tx_tooltip .bubble_content .tx_width {
		    width: 540px;
		    padding-top: 1px;
		    margin-bottom: 9px;
		    word-break: break-all;
		    position: relative;
		}
		.tx_tooltip .bubble_content .tx_width span.linkTx a {
		    color: #999;
		}
		.tx_tooltip .bubble_content .tx_width .ans_type {
		    color: #3aa4b7;
		}
		.tx_tooltip .bubble_content .tx_width .alarm_tx {
		    line-height: 18px;
		    color: #373737;
		}
		.tx_tooltip .bubble_content .tx_width span.etc_obj {
		    display: inline-block;
		    margin-left: 5px;
		    color: #999;
		}
		.tx_tooltip .bubble_content .from_obj {
		    overflow: hidden;
		    margin-top: 6px;
		}
		.tx_tooltip .bubble_content .from_obj dt {
		    display: block;
		    float: left;
		    clear: left;
		    font-size: 11px;
		    color: #555;
		}
		.tx_tooltip .bubble_content .from_obj dd a, .tx_tooltip .bubble_content .from_obj dd {
		    font-size: 11px;
		    color: #999;
		}
		.tx_tooltip .bubble_content .from_obj dd span:first-child {
		    border-left: 0;
		    padding-left: 0;
		}
		.tx_tooltip .bubble_content .from_obj .alarm_time {
		    border-left: 1px solid #e2e2e2 !important;
		    padding-left: 8px !important;
		    font-size: 11px;
		    color: #999;
		}
		.tx_tooltip .bubble_content .from_obj dd span {
		    display: inline-block;
		    height: 10px;
		    line-height: 10px;
		    border-left: 1px solid #e2e2e2;
		    padding-left: 7px;
		    margin-left: 4px;
		    *line-height: 11px;
		}
		.bx_bg span.ico_timeDot {
		    left: -29px;
		    top: 30px;
		    width: 12px;
		    height: 12px;
		    background: url(https://ssl.pstatic.net/static/me/new/sp_me_high20171115.png) no-repeat -320px -270px;
		}
		.bx_bg span {
		    display: inline-block;
		    position: absolute;
		    width: 15px;
		    height: 15px;
		    background: url(https://ssl.pstatic.net/static/me/new/sp_me_new20160113.png) no-repeat;
		}
		.ftw200.gray {
			color: 
		}
	</style>
	<script>
		$(document).ready(function() {
			var alarmCnt = 0;
			
			$.ajax({
				url:"/alarm/viewAlarm.do",
				type:"GET",
				success:function(data) {
					if(data.length == 0) {
						$(".alarmContent").append("<div><label class='alarmTitle floatL' title='' style='font-size: 12px;'>새로운 알림이 없습니다.</label><label class='floatC'></label></div>");
					} else {
						appendHtml(data);
					}
					
					function appendHtml(content) {
						var cnt = content.length;
						
						for(i = 0; i < cnt; i++) {
							var today = new Date();   
							var year = today.getFullYear(); 
							var month = (today.getMonth() + 1 >= 10) ? today.getMonth() + 1 : "0"+(today.getMonth() + 1);
							var date = (today.getDate() >= 10) ? today.getDate() : "0"+today.getDate();
							var day = String(year) + String(month) + String(date);
							var time = "";
							var className = "ftw200 gray";
							var kind = "";
							
							if(content[i].alarmHit == 0) {
								className = "ftw500";
								alarmCnt++;
							}
							
							if(day == content[i].regDt) {
								day = "오늘";
							} else if((day-1) == content[i].regDt) {
								day = "어제";
							} else {
								day = content[i].regDt.substring(4,6) + "/" + content[i].regDt.substring(6,8); 
							}
							
							time = content[i].regTm.substring(0,2) + ":" + content[i].regTm.substring(2,4)
							
							if(content[i].pjMtKey != 'undefined' && content[i].pjMtKey != null && content[i].pjMtKey != "") {
								if(content[i].pjMtKey.length != 0 && content[i].pjMtKey.substring(0,2) == "PJ") {
									kind = "프로젝트";
								} else if(content[i].pjMtKey.length != 0 && content[i].pjMtKey.substring(0,2) == "MA") {
									kind = "유지보수";
								} else if(content[i].pjMtKey.length != 0 && content[i].pjMtKey.substring(0,2) == "SP") {
									kind = "Forecast";
								} 
							} 
							
							$(".time_line").append(
									"<div class='daily_obj _ccast_list_group'>"
									+"<h4 class='ico_time'>"+day+"</h4>"
									+"<ul day='"+content[i].regDt+"'>"
									+"<li class='_ccast_list_item _ccast_item nlst nlst_first  ' readcheck='true' serviceid='shopwdw' catgroupid='1' catid='2' timekey='1473878037333303863' style='display:inline'>"
									+"<div class='tx_box_obj'>"
									+"<div class='tx_tooltip'>"
									+"<div class='tx_bubble'>"
									+"<div class='bubble_content'>"
									+"<div class='tx_width'>"
									+"<span class='linkTx'>"
									+"<a href='' target='_blank' class='_ccast_item_url  N=a:amx*H.content'>"
									+"<strong class='ans_type _ccast_item_url  N=a:amx*H.content "+className+"' onclick='fnMovePage(&#39;"+ content[i].pjMtKey +"&#39;, &#39;"+content[i].alarmKey+"&#39;)'>"+content[i].alarmKind+"</strong>"
									+"</a>"
									+"</span>"
									+"<dl class='from_obj'>"
									+"<dt>"+kind+"  "+content[i].alarmTitle+"</dt>"            
									+"<dd>"
									+"<span class='alarm_time'>"+ day + " " + time + "</span>"            
									+"</dd>"
									+"</dl>"
									+"</div>"
									+"</div>"							
									+"</div>"
									+"<span class='bx_bg'>"
									+"<span class='ico_timeDot'></span>"
									+"</span>"
									+"</div>"
									+"</div>"
									+"</li>"
									+"</ul>"
									+"</div>"
							);
						}
						
						if(alarmCnt != 0) {
							$(".alarmCnt").removeClass('dpNone');
						}
					}
					
					fn_groupbyday();
					
				} , error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
			}); 
			
			function fn_groupbyday() {
				var post = "";
				$(".ico_time").each(function() {
				    if(post == $(this).html()) {
				        $(this).remove();
				    }
				    post = $(this).html();
				    console.log(post);
				});
			}
		});
		
	</script>
</head>
<body>
	<div class="contentsWrap">
		<div class="contents mgauto">
			<div class="top">
				<div class="floatL">
					<div class="title floatL"><label class="ftw500">알람 list</label></div>
				</div>
				<div class="floatC"></div>
			</div>
			<div class="middle">
				<div class="frst_contents _noti_box">
					<div class="time_line _noti_list type_alrm">
						<!-- <div class="daily_obj _ccast_list_group">
							<h4 class="ico_time">오늘</h4>
							<ul day="20211223">
								<li class="_ccast_list_item _ccast_item nlst nlst_first  " readcheck="true" serviceid="shopwdw" catgroupid="1" catid="2" timekey="1473878037333303863" style="display:inline">
									<div class="tx_box_obj">
										<div class="tx_tooltip">
											<div class="tx_bubble">
												<div class="bubble_content">
										    		<div class="tx_width">
														<span class="linkTx">
															<a href="" target="_blank" class="_ccast_item_url  N=a:amx*H.content">
																<strong class="ans_type _ccast_item_url  N=a:amx*H.content">제목</strong>
															</a>
														</span>
										        		<dl class="from_obj">
															<dt>내용</dt>            
															<dd>
																<span class="alarm_time">4시간전</span>            
															</dd>
										        		</dl>
										    		</div>
												</div>							
											</div>
											<span class="bx_bg">
												<span class="ico_timeDot"></span>
											</span>
										</div>
									</div>
								</li>
							</ul>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>