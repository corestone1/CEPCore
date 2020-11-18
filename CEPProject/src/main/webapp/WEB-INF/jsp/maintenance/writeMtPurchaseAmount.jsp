<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>거래처별 매입정보</title>
	<style>
		.lastTd {			
			border-bottom: 2px solid #e5e5e5;	
			padding-bottom: 6px;
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
			margin: 10px 43px 0 40px;
		}
		.popContainer .contents > div > table {
			
			border-collapse: separate;
	  		border-spacing: 0 3px;
		}
		.popContainer .contents select {
			width: 148px;
			height: 40px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		.popContainer .contents select.wdts {
			width: 135px;
		}
		.popContainer input {
			width: 127px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer input[class="search"] {
			height: 38px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		
		.popContainer .contents input[class="pname"] {
			width: 92px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
			color: #32bc94;
		}
		.popContainer .contents input[class="numberTy"] {
			width: 27px;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 130px;
			height: 40px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer td.tdTitle {
			margin-top: 11px;
			font-size: 15px;
			color: #525252;
			padding-left: 5px;
			padding-right: 5px;
			width: 96px;
		}				
		.popContainer td.tdContents {
			width: 1174px;
			font-size: 14px;
			padding-right: 15px;
		} 				
		

				
		.popContainer .contents tr:nth-child(1) td {			
			padding-bottom: 13px;
			
		} 
		/* .popContainer .contents tr:nth-child(2) td {
			padding-top: 20px;
			padding-bottom: 5px;
		}  */
		.popContainer .contents td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			width: 56px;
			
		}	
		.popContainer .bottomBtn {
			position: absolute;
			width: 1083px;
			height: 52px;
			top: 638px;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: hidden;
			overflow-x: hidden;
			padding-top: 18px;
			padding-right: 52px;
		}	
	</style>
	<script>
		function fn_addBiddingView(){
			var url = '/project/writeAmountInfo.do';
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
				<div class="floatL ftw500">유지보수 등록</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
					<li class="colorWhite cursorP">기본정보</li>
					<li class="colorWhite cursorP">제품정보</li>
					<li class="colorWhite cursorP">매출정보</li>
					
					<li class="colorWhite cursorP">발주정보</li>
					<li class="colorWhite cursorP on">매입정보</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr>		
						<td class="subTitle" colspan="8" style="border-top: none;">
							<label class="ftw500">거래처별 매입정보</label> &nbsp;&nbsp;
							<img src="<c:url value='/images/btn_add.png'/>" style="vertical-align: middle"/>
						</td>						
					</tr>
					<tr>
						<td class="tdTitle lastTd">거래처</td>
						<td class="tdContents lastTd">
							<input type="text" class="search" />		
						</td>
						<td class="tdTitle lastTd">결재조건</td>
						<td class="tdContents lastTd">
							<input type="text"  />	
						</td>
						<td class="tdTitle lastTd">비고</td>
						<td class="tdContents lastTd" colspan="3">
							<input type="text" style="width: 331px"/>	
						</td>
					</tr>
					<tr>
						<td class="tdTitle">년도</td>
						<td class="tdContents" colspan="7">
							<select id="sbCtYn" name="sbCtYn">
								<option value="2020">2020</option>
								<option value="2021">2021</option>
							</select>	
						</td>
					</tr>
					<tr>
						<td class="tdTitle">1월</td>
						<td class="tdContents">
							<input type="text"/>
						</td>
						<td class="tdTitle">2월</td>
						<td class="tdContents">
							<input type="text" />
						</td>
						<td class="tdTitle">3월</td>
						<td class="tdContents">
							<input type="text" />
						</td>
						<td class="tdTitle">4월</td>
						<td class="tdContents">
							<input type="text" />
						</td>
					</tr>
					<tr>
						<td class="tdTitle">5월</td>
						<td class="tdContents">
							<input type="text" />
						</td>
						<td class="tdTitle">6월</td>
						<td class="tdContents">
							<input type="text" />
						</td>
						<td class="tdTitle">7월</td>
						<td class="tdContents">
							<input type="text" />
						</td>
						<td class="tdTitle">8월</td>
						<td class="tdContents">
							<input type="text" />
						</td>
					</tr>
					<tr>
						<td class="tdTitle lastTd">9월</td>
						<td class="tdContents lastTd">
							<input type="text" />
						</td>
						<td class="tdTitle lastTd">10월</td>
						<td class="tdContents lastTd">
							<input type="text" />
						</td>
						<td class="tdTitle lastTd">11월</td>
						<td class="tdContents lastTd">
							<input type="text" />
						</td>
						<td class="tdTitle lastTd">12월</td>
						<td class="tdContents lastTd">
							<input type="text" />
						</td>
					</tr>
					<tr>
						<td  colspan="2" style="text-align:left; ;color: #7664ca;">
							연도추가 +
							
						</td>
						<td  colspan="6" style="text-align: end;color: #32bc94;">
							합계  <input type="text" id="sumAmount" class="pname" value="123,456,789" readonly/>							
						</td>
					
					</tr>
					
				</table>
			</div>
			<div class="btnWrap floatR">
				<div class="floatR" onclick="fn_preBiddingView();">
					<button ><img src="<c:url value='/images/btn_save.png'/>" /></button>
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>	
	</div>
</body>
</html>