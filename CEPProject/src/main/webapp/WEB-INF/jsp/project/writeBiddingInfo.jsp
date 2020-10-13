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
	  		width: 100%;
		}
		/* .popContainer .contents > div > table tr:first-child td {
			margin-bottom: 100px;
		} */
		.popContainer .contents input {
			width: 140px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
			padding-right: 18px;
		}
		.popContainer .contents input[class="pname"] {
			width: 400px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
		}
		.popContainer .contents input[class="calendar"] {
			width: 130px;
			height: 40px;
			background-image: url('./images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			width: 96px;
		}				
		.popContainer .contents td.tdContents {
			width: 691px;
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
		.popContainer .contents tr:nth-child(2) td {			
			padding-top: 20px !important;
		} 		
		.popContainer .contents td:last-child  {
			padding-right: 0px !important;
		} 		
		.popContainer .contents tr:first-child td { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  		
			border-bottom:2px solid #e5e5e5;				
			padding-bottom: 7px;
			font-size: 18px;
			vertical-align: inherit;		
			padding-right: 18px;
		}		
		.popContainer .contents tr > td {
			font-size: 14px;						
			padding-right: 10px;
		} 
		/* .popContainer tr:nth-child(1) {
			border-collapse: collapse;
			border-bottom-color: #e5e5e5;			
		} */
	</style>
	<script>
		function check_click(num1, num2) {
			
			var check1 = document.getElementById("check"+num1+"-"+num2).checked;			
			
			if(num2==1){
				if(check1){
					document.getElementById("step"+num1+"-1").style.visibility = 'visible';
					document.getElementById("step"+num1+"-2").style.visibility = 'visible';
					document.getElementById("step"+num1+"-3").style.visibility = 'visible';
				} else {
					document.getElementById("check"+num1+"-2").checked = false;
					document.getElementById("from"+num1).value="";
					document.getElementById("to"+num1).value="";
					document.getElementById("amount"+num1).value="";
					document.getElementById("step"+num1+"-1").style.visibility = 'hidden';
					document.getElementById("step"+num1+"-2").style.visibility = 'hidden';
					document.getElementById("step"+num1+"-3").style.visibility = 'hidden';	
					document.getElementById("step"+num1+"-4").style.visibility = 'hidden';					
				}
			} else if(num2==2){
				if(check1){
					document.getElementById("step"+num1+"-4").style.visibility = 'visible';
				} else {
					document.getElementById("amount"+num1).value="";
					document.getElementById("step"+num1+"-4").style.visibility = 'hidden';
				}				
			}			
		}
		
		function fn_addBuildView(){
			var url = '/writeBuildInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_preBaicView(){
			var url = '/writeAmountInfo.do';
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
				<div class="subTitle">계약</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw400">
				<li class="colorWhite cursorP">금액</li>
				<li class="colorWhite cursorP on">예상일정</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr>
						<td colspan="2" >1회차 일정</td>
						<td  >
							<input type="text" placeholder="계산서 예정일정" class="calendar" /> &nbsp;
							<input type="text" placeholder="수금 예상 일정" class="calendar" />
						</td>
						<td colspan="3"></td>
					</tr>
					<tr class="ftw200">
						<td>
							<input type="checkbox" class="tCheck" id="check1-1" onclick="check_click(1,1)"/><label for="check1-1" class="cursorP"></label>
						</td>						
						<td>계약 보증 증권 정보</td>
						<td id="step1-1" style="visibility:hidden">
							<input type="text" id="from1" placeholder="from" class="calendar" /> ~ 
							<input type="text" id="to1" placeholder="to" class="calendar" />
						</td>
						<td id="step1-2" style="visibility:hidden">
							<input type="checkbox" class="tCheck" id="check1-2" onclick="check_click(1,2)"/><label for="check1-2" class="cursorP"></label> 
						</td>
						<td id="step1-3" style="visibility:hidden">완료</td>
						<td id="step1-4" style="visibility:hidden">
							<input type="text" id="amount1" placeholder="금액" width="177px"/>
						</td>
					</tr>
					<tr class="ftw200">
						<td>
							<input type="checkbox" class="tCheck" id="check2-1" onclick="check_click(2,1)"/><label for="check2-1" class="cursorP"></label>
						</td>
						<td>하자 보증 증권 정보</td>
						<td id="step2-1" style="visibility:hidden">
							<input type="text" id="from2" placeholder="from" class="calendar" /> ~ 
							<input type="text" id="to2" placeholder="to" class="calendar" />
						</td>
						<td id="step2-2" style="visibility:hidden">
							<input type="checkbox" class="tCheck" id="check2-2" onclick="check_click(2,2)"/><label for="check2-2" class="cursorP"></label> 
						</td>
						<td id="step2-3" style="visibility:hidden">완료</td>
						<td id="step2-4" style="visibility:hidden">
							<input type="text" id="amount2" placeholder="금액" width="177px"/>
						</td>
					</tr>
					<tr class="ftw200">
						<td>
							<input type="checkbox" class="tCheck" id="check3-1" onclick="check_click(3,1)"/><label for="check3-1" class="cursorP"></label>
						</td>
						<td>선급금 보증 증권 정보</td>
						<td id="step3-1" style="visibility:hidden">
							<input type="text" id="from3" placeholder="from" class="calendar" /> ~ 
							<input type="text" id="to3" placeholder="to" class="calendar" />
						</td>
						<td id="step3-2" style="visibility:hidden">
							<input type="checkbox" class="tCheck" id="check3-2" onclick="check_click(3,2)"/><label for="check3-2" class="cursorP"></label>
						</td>
						<td id="step3-3" style="visibility:hidden">완료</td>
						<td id="step3-4" style="visibility:hidden">
							<input type="text" id="amount3" placeholder="금액" width="177px"/>
						</td>
					</tr>			
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
			<div class="btnWrap floatR">
				<div class="floatR">
					<button onclick="fn_preBaicView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					<button onclick="fn_addBuildView();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
				</div>
				<div class="floatN floatC"></div>
			</div>
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
			width: 98%;
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
	  		width: 807px;
		}
		/* .popContainer .contents > div > table tr:first-child td {
			margin-bottom: 100px;
		} */
		.popContainer .contents input {
			width: 140px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			margin-bottom: 3px;
			padding-right: 18px;
		}
		.popContainer .contents input[class="pname"] {
			width: 400px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
		}
		.popContainer .contents input[class="calendar"] {
			width: 130px;
			height: 40px;
			background-image: url('./images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
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
		}				
		.popContainer .contents td.tdContents {
			width: 691px;
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
		.popContainer .contents tr:nth-child(2) td {			
			padding-top: 10px !important;
		} 		
		.popContainer .contents td:LAST-CHILD  {
			padding-right: 0px !important;
		} 		
		.popContainer .contents tr:first-child td { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  		
			border-bottom:2px solid #e5e5e5;				
			padding-top: 30px;
			padding-bottom: 7px;
			font-size: 18px;
			vertical-align: inherit;		
			padding-right: 18px;
		}		
		.popContainer .contents tr > td {
			font-size: 14px;						
			padding-right: 10px;
		} 
		.popContainer .contents .btnDiv {
	  		margin-right: 110px;
	  		margin-top: 10px;
	  		margin-right: 63px;
		}			
		.popContainer .contents input[class="amount"] {
			text-align: right;
		}
		/* .popContainer tr:nth-child(1) {
			border-collapse: collapse;
			border-bottom-color: #e5e5e5;			
		} */
	</style>
	<script>
		function check_click(num1, num2) {
			
			var check1 = document.getElementById("check"+num1+"-"+num2).checked;			
			
			if(num2==1){
				if(check1){
					document.getElementById("step"+num1+"-1").style.visibility = 'visible';
					document.getElementById("step"+num1+"-2").style.visibility = 'visible';
					document.getElementById("step"+num1+"-3").style.visibility = 'visible';
				} else {
					document.getElementById("check"+num1+"-2").checked = false;
					document.getElementById("from"+num1).value="";
					document.getElementById("to"+num1).value="";
					document.getElementById("amount"+num1).value="";
					document.getElementById("step"+num1+"-1").style.visibility = 'hidden';
					document.getElementById("step"+num1+"-2").style.visibility = 'hidden';
					document.getElementById("step"+num1+"-3").style.visibility = 'hidden';	
					document.getElementById("step"+num1+"-4").style.visibility = 'hidden';					
				}
			} else if(num2==2){
				if(check1){
					document.getElementById("step"+num1+"-4").style.visibility = 'visible';
				} else {
					document.getElementById("amount"+num1).value="";
					document.getElementById("step"+num1+"-4").style.visibility = 'hidden';
				}				
			}			
		}
		
		function fn_addBuildView(){
			var url = '/writeBuildInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_preBaicView(){
			var url = '/writeAmountInfo.do';
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
				<div class="subTitle">계약</div>
			</div>
		</div>
		<div class="left">
			<ul class="ftw300">
				<li class="colorWhite cursorP">금액</li>
				<li class="colorWhite cursorP on">예상일정</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr>
						<td colspan="2" >1회차 일정</td>
						<td  >
							<input type="text" placeholder="계산서 예정일정" class="calendar" />&nbsp;&nbsp;&nbsp;
							<input type="text" placeholder="수금 예상 일정" class="calendar" />
						</td>
						<td colspan="3"></td>
					</tr>
					<tr class="ftw100">
						<td>
							<input type="checkbox" class="tCheck" id="check1-1" onclick="check_click(1,1)"/><label for="check1-1" class="cursorP"></label>
						</td>						
						<td>계약 보증 증권 정보</td>
						<td id="step1-1" style="visibility:hidden">
							<input type="text" id="from1" placeholder="from" class="calendar" /> ~ 
							<input type="text" id="to1" placeholder="to" class="calendar" />
						</td>
						<td id="step1-2" style="visibility:hidden">
							<input type="checkbox" class="tCheck" id="check1-2" onclick="check_click(1,2)"/><label for="check1-2" class="cursorP"></label> 
						</td>
						<td id="step1-3" style="visibility:hidden">완료</td>
						<td id="step1-4" style="visibility:hidden">
							<input type="text" id="amount1" placeholder="금액" width="177px" numberOnly class="amount"/>
						</td>
					</tr>
					<tr class="ftw100">
						<td>
							<input type="checkbox" class="tCheck" id="check2-1" onclick="check_click(2,1)"/><label for="check2-1" class="cursorP"></label>
						</td>
						<td>하자 보증 증권 정보</td>
						<td id="step2-1" style="visibility:hidden">
							<input type="text" id="from2" placeholder="from" class="calendar" /> ~ 
							<input type="text" id="to2" placeholder="to" class="calendar" />
						</td>
						<td id="step2-2" style="visibility:hidden">
							<input type="checkbox" class="tCheck" id="check2-2" onclick="check_click(2,2)"/><label for="check2-2" class="cursorP"></label> 
						</td>
						<td id="step2-3" style="visibility:hidden">완료</td>
						<td id="step2-4" style="visibility:hidden">
							<input type="text" id="amount2" placeholder="금액" width="177px" numberOnly class="amount"/>
						</td>
					</tr>
					<tr class="ftw100">
						<td>
							<input type="checkbox" class="tCheck" id="check3-1" onclick="check_click(3,1)"/><label for="check3-1" class="cursorP"></label>
						</td>
						<td>선급금 보증 증권 정보</td>
						<td id="step3-1" style="visibility:hidden">
							<input type="text" id="from3" placeholder="from" class="calendar" /> ~ 
							<input type="text" id="to3" placeholder="to" class="calendar" />
						</td>
						<td id="step3-2" style="visibility:hidden">
							<input type="checkbox" class="tCheck" id="check3-2" onclick="check_click(3,2)"/><label for="check3-2" class="cursorP"></label>
						</td>
						<td id="step3-3" style="visibility:hidden">완료</td>
						<td id="step3-4" style="visibility:hidden">
							<input type="text" id="amount3" placeholder="금액" width="177px" numberOnly class="amount"/>
						</td>
					</tr>			
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
				
			<div class="btnWrap">
				<div class="floatR btnDiv">
					<button onclick="fn_preBaicView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					<button onclick="fn_addBuildView();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
				</div>
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