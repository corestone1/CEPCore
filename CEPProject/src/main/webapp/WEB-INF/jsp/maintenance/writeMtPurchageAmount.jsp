<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>거래처별 매입정보</title>
	<style>
		.firstTd {			
			border-top: 2px solid #e5e5e5;	
			padding-top: 6px;
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
			margin: 10px 54px 0 45px;
		}
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
		}
		.popContainer .contents select {
			width: 153px;
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
			width: 130px;
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
		.popContainer .contents2 input[class="numberTy"] {
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
		} 				
		
				
		.popContainer .contents tr:nth-child(1) td {
			padding-top: 10px;
			padding-bottom: 5px;
			
		} 
		.popContainer .contents tr:nth-child(4) td {
			padding-top: 20px;
			padding-bottom: 5px;
		} 
		.popContainer .contents td.subTitle {
			font-size: 18px;
			padding-right: 20px;
			width: 56px;
			
		}	
		.popContainer .contents textarea {
			width: calc(100% - 22px);
			height: 55px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
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
						<td class="subTitle" colspan="6" style="border-top: none;">
							<label class="ftw500">거래처별 매입정보</label>
							<img src="<c:url value='/images/btn_add.png'/>" />
						</td>
						
					</tr>
					<%-- <tr>		
						<td class="subTitle" style="border-top: none;">
							<label class="ftw400" >발주등록</label>
						</td>
						<td class="subBtn" colspan="5"  style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" /></td>
					</tr> --%>
					<tr>
						<td class="tdTitle">거래처</td>
						<td class="tdContents">
							<input type="text"  />		
						</td>
						<td class="tdTitle">결재조건</td>
						<td class="tdContents">
							<input type="text"  />	
						</td>
						<td class="tdTitle">비고</td>
						<td class="tdContents">
							<input type="text" colspan="3" />	
						</td>
					</tr>
					<tr>
						<td class="tdTitle">년도</td>
						<td class="tdContents">
							<select id="sbCtYn" name="sbCtYn">
								<option value="2020">2020</option>
								<option value="2021">2021</option>
							</select>	
						</td>
						<td class="tdTitle">거래처담당자</td>
						<td class="tdContents">
							<select id="sbCtYn" name="sbCtYn">
								<option value="홍길동">홍길동</option>
								<option value="홍길동1">홍길동1</option>
							</select>
						</td>
						<td class="tdTitle">등록자</td>
						<td class="tdContents">
							<select id="sbCtYn" name="sbCtYn">
								<option value="홍길동">홍길동</option>
								<option value="홍길동1">홍길동1</option>
							</select>
						</td>
					</tr>
					<tr>		
						<td class="subTitle" style="border-top: none;">
							<label class="ftw500">제품정보</label>
						</td>
						<td class="subBtn" colspan="5"  style="border-top: none;"><img src="<c:url value='/images/btn_add.png'/>" /></td>
					</tr>
					<tr>
						<td class="tdTitle firstTd">제품</td>
						<td class="tdContents firstTd">
							<input type="text" class="search" />	
						</td>
						<td class="tdTitle firstTd">합계</td>
						<td class="tdContents firstTd">
							<input type="text" />	
						</td>
						<td class="tdTitle firstTd">수량</td>
						<td class="tdContents firstTd">
							<input type="text" style="width: 75px;"/>	
						</td>
					</tr>
					<tr>
						<td class="tdTitle">단가</td>
						<td class="tdContents">
							<input type="text" />
						</td>	
						<td class="tdTitle">부가세 포함</td>
						<td class="tdContents">
							<input type="radio" class="tCheck" name="hasVAT" id="hasVAT1" /><label for="hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
							<input type="radio" class="tCheck" name="hasVAT" id="hasVAT2" /><label for="hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
						</td>	
						<td class="tdTitle">시리얼번호</td>
						<td class="tdContents">
							<input type="text" />	
						</td>
					</tr>
					<tr>
						<td class="tdTitle">계약기간</td>
						<td class="tdContents" colspan="5">
							<input type="text" name="startDt" placeholder="from" class="calendar fromDt" /> ~ 
							<input type="text" name="endDt" placeholder="to" class="calendar toDt" />
						</td>
					</tr>
					<tr>
						<td class="tdTitle">제품상세</td>
						<td class="tdContents" colspan="5"><textarea></textarea></td>
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