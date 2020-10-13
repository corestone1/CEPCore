<<<<<<< HEAD
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
	  		width: 789px;
		}
		/* .popContainer .contents > div > table tr:first-child td {
			margin-bottom: 100px;
		} */
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
		.popContainer .contents td:last-child {
			padding-right: 0px !important;
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
		.popContainer .contents td.firstRow { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  			
			font-size: 14px;				
		}
		.popContainer .contents select {
			width: 200px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 36px;
			-webkit-appearance: none;
			background: url('./images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;	
			text-align-last: right;
		}
		.popContainer .contents select option:first-child{
		 	color: #a4a4a4;
		}
		.popContainer .contents input {
			width: 179px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			text-align: right;
		}
		.popContainer .contents input[class="rateInfo"] {
			width: 90px;
			height: 38px;
		}
	</style>
	<script>
	
		/* function fn_turnChange(){
			
			var turnVal = document.getElementById("turnInfo");
			//alert(turnVal.value+"/"+turnVal.text);
			var addTable = document.getElementById("addRow");
			var addTbody = addTable.childNodes[0];
			var addTr = document.createElement("TR"); 
			addTable.appendChild(addTr);
			var addTd = document.createElement("TD");			
			addTr.appendChild(addTd);
			addTd.innerHTML =turnVal.value+ "회차<input type=\"text\" placeholder=\""+turnVal.value+"회차 비율\" class=\"rateInfo\"/>&nbsp;%&nbsp;&nbsp; <input type=\"text\" placeholder=\""+turnVal.value+"회차 금액\" />&nbsp;원";
			//addTd.innerHTML =turnVal.value+ "회차";
		} */
		
	function fn_turnChange(){
			
			
			var turnVal = document.getElementById("turnInfo");
			var beforeTurn = parseInt(document.getElementById("beforeTurn").value);
			
			var calcuTurn = turnVal.value - beforeTurn;
			
			//alert(calcuTurn);
			if(calcuTurn>0) {
				for(i=0; i<calcuTurn; i++){
					var rowItem = "<tr class='ftw200'>";
					rowItem += "	<td>"+(beforeTurn+i+1)+ "회차 :&nbsp;";
					rowItem += "<input type='text' id='rate"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 비율' class='rateInfo'/>";
					rowItem += "&nbsp;%&nbsp;&nbsp;&nbsp;";
					rowItem += "<input type='text' id='amount"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 금액' />&nbsp;원 </td>";
					rowItem += "</tr>"
					
					$('#addRow').append(rowItem);
				}
			} else {
				//alert("===>"+calcuTurn*-1)
				var deleteRow = document.getElementById("addRow").rows.length -turnVal.value;
				for(i=0; i<deleteRow; i++){
					document.getElementById("addRow").deleteRow(document.getElementById("addRow").rows.length-1);
				}
			}
			
			
			
			document.getElementById("beforeTurn").value= turnVal.value;
		}
		
		function fn_addBiddingView(){
			var url = '/writeBiddingInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_preBaicView(){
			var url = '/writeBasicInfo.do';
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
				<li class="colorWhite cursorP on">금액</li>
				<li class="colorWhite cursorP">예상일정</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr class="ftw200">
						<td class="firstRow">
							<input type="text" placeholder="계약금액"  /> &nbsp;원
						</td>
					</tr>
					<tr class="ftw200">
						<td>
							<input type="text" placeholder="청구일로 부터" /> &nbsp;이내
						</td>
					</tr>
					<tr class="ftw200">
						<td>
							<input type="hidden" id="beforeTurn" value="0">
							<select id="turnInfo" onchange="fn_turnChange()" placeholder="계약금액">
								<option value="0">지급회차</option>
								<option value="1">1회차</option>
								<option value="2">2회차</option>
								<option value="3">3회차</option>
								<option value="4">4회차</option>
								<option value="5">5회차</option>
								<option value="6">6회차</option>
								<option value="7">7회차</option>
								<option value="8">8회차</option>
								<option value="9">9회차</option>
							</select>
						</td>
					</tr>
					<tr>						 
						<table id="addRow">
							<!-- <tr>
								<td>1회차 <input type="text" id="rate0" placeholder="1회차 비율" class="rateInfo" />&nbsp;%&nbsp;&nbsp; <input type="text" id="amount0" placeholder="1회차 금액" />&nbsp;원</td>
							</tr> -->
						</table>
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
					<button onclick="fn_addBiddingView();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
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
			width: 100%;
			height: 601px;
			top: 107px;
			right: 0;
			z-index: 3;
			background-color: #f6f7fc;
			overflow-y: auto;
		}
		.popContainer .contents > div {
			margin: 9px 0 0 244px;
			width: calc(100% - 244px);
		}
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
	  		width: 789px;
		}
		/* .popContainer .contents > div > table tr:first-child td {
			margin-bottom: 100px;
		} */
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
		.popContainer .contents td:LAST-CHILD  {
			padding-right: 0px !important;		
			padding-left: 24px;
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
		.popContainer .contents td.firstRow { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  			
			padding-top: 34px;
			font-size: 14px;				
		}
		.popContainer .contents .btnDiv {
	  		margin-right: 61px;
	  		margin-top: 10px;
		}
		.popContainer .contents select {
			width: 200px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('./images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;	
		}
		.popContainer .contents select option:first-child{
		 	color: #A4A4A4;
		}
		.popContainer .contents input {
			width: 179px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
		}
		.popContainer .contents input[class="amount"] {
			text-align: right;
		}
		.popContainer .contents input[class="rateInfo"] {
			width: 90px;
			height: 38px;
		}
	</style>
	<script>
	
	function fn_turnChange(){
			
			
			var turnVal = document.getElementById("turnInfo");
			var beforeTurn = parseInt(document.getElementById("beforeTurn").value);
			
			var calcuTurn = turnVal.value - beforeTurn;
			
			//alert(calcuTurn);
			if(calcuTurn>0) {
				for(i=0; i<calcuTurn; i++){
					var rowItem = "<tr class='ftw100'>";
					rowItem += "	<td>"+(beforeTurn+i+1)+ "회차 :&nbsp;";
					rowItem += "<input type='text' id='rate"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 비율' numberOnly class='rateInfo'/>";
					rowItem += "&nbsp;%&nbsp;&nbsp;&nbsp;";
					rowItem += "<input type='text' id='amount"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 금액' numberOnly class='amount' />&nbsp;원 </td>";
					rowItem += "</tr>"
					
					$('#addRow').append(rowItem);
				}
			} else {
				//alert("===>"+calcuTurn*-1)
				var deleteRow = document.getElementById("addRow").rows.length -turnVal.value;
				for(i=0; i<deleteRow; i++){
					document.getElementById("addRow").deleteRow(document.getElementById("addRow").rows.length-1);
				}
			}
			
			
			
			document.getElementById("beforeTurn").value= turnVal.value;
		}
		
		function fn_addBiddingView(){
			var url = '/writeBiddingInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_preBaicView(){
			var url = '/writeBasicInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		/* $(document).on("focus", "input:text[numberOnly]", function() {
			
		    var x = $(this).val();
		    x = removeCommas(x);
		    $(this).val(x);
		}).on("focusout", "input:text[numberOnly]",function() {
			
		    var x = $(this).val();
		    if(x && x.length > 0) {
		        if(!$.isNumeric(x)) {
		            x = x.replace(/[^0-9]/g,"");
		        }
		        x = addCommas(x);
		        $(this).val(x);
		    }
		}).on("keyup", "input:text[numberOnly]",function() {
			
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});		

		function addCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		 
		//모든 콤마 제거
		function removeCommas(x) {
		    if(!x || x.length == 0) return "";
		    else return x.split(",").join("");
		} */
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
				<li class="colorWhite cursorP on">금액</li>
				<li class="colorWhite cursorP">예상일정</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr class="ftw100">
						<td class="firstRow">
							<input type="text" numberOnly placeholder="계약금액"  class="amount" /> &nbsp;원
						</td>
					</tr>
					<tr class="ftw100">
						<td>
							<input type="text" numberOnly placeholder="청구일로 부터" /> &nbsp;일 이내
						</td>
					</tr>
					<tr class="ftw100">
						<td>
							<input type="hidden" id="beforeTurn" value="0">
							<select id="turnInfo" onchange="fn_turnChange()" placeholder="계약금액">
								<option value="0">지급회차</option>
								<option value="1">1회차</option>
								<option value="2">2회차</option>
								<option value="3">3회차</option>
								<option value="4">4회차</option>
								<option value="5">5회차</option>
								<option value="6">6회차</option>
								<option value="7">7회차</option>
								<option value="8">8회차</option>
								<option value="9">9회차</option>
							</select>
						</td>
					</tr>
					<tr>						 
						<table id="addRow">
							<!-- <tr>
								<td>1회차 <input type="text" id="rate0" placeholder="1회차 비율" class="rateInfo" />&nbsp;%&nbsp;&nbsp; <input type="text" id="amount0" placeholder="1회차 금액" />&nbsp;원</td>
							</tr> -->
						</table>
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
					<button onclick="fn_addBiddingView();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
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
	  		width: 789px;
		}
		/* .popContainer .contents > div > table tr:first-child td {
			margin-bottom: 100px;
		} */
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
		.popContainer .contents td:last-child {
			padding-right: 0px !important;
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
		.popContainer .contents td.firstRow { 
			border-collapse: collapse;
	  		border-spacing: 0 3px;	  			
			font-size: 14px;				
		}
		.popContainer .contents select {
			width: 200px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 36px;
			-webkit-appearance: none;
			background: url('./images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;	
			text-align-last: right;
		}
		.popContainer .contents select option:first-child{
		 	color: #a4a4a4;
		}
		.popContainer .contents input {
			width: 179px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			text-align: right;
		}
		.popContainer .contents input[class="rateInfo"] {
			width: 90px;
			height: 38px;
		}
	</style>
	<script>
	
		/* function fn_turnChange(){
			
			var turnVal = document.getElementById("turnInfo");
			//alert(turnVal.value+"/"+turnVal.text);
			var addTable = document.getElementById("addRow");
			var addTbody = addTable.childNodes[0];
			var addTr = document.createElement("TR"); 
			addTable.appendChild(addTr);
			var addTd = document.createElement("TD");			
			addTr.appendChild(addTd);
			addTd.innerHTML =turnVal.value+ "회차<input type=\"text\" placeholder=\""+turnVal.value+"회차 비율\" class=\"rateInfo\"/>&nbsp;%&nbsp;&nbsp; <input type=\"text\" placeholder=\""+turnVal.value+"회차 금액\" />&nbsp;원";
			//addTd.innerHTML =turnVal.value+ "회차";
		} */
		
	function fn_turnChange(){
			
			
			var turnVal = document.getElementById("turnInfo");
			var beforeTurn = parseInt(document.getElementById("beforeTurn").value);
			
			var calcuTurn = turnVal.value - beforeTurn;
			
			//alert(calcuTurn);
			if(calcuTurn>0) {
				for(i=0; i<calcuTurn; i++){
					var rowItem = "<tr class='ftw200'>";
					rowItem += "	<td>"+(beforeTurn+i+1)+ "회차 :&nbsp;";
					rowItem += "<input type='text' id='rate"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 비율' class='rateInfo'/>";
					rowItem += "&nbsp;%&nbsp;&nbsp;&nbsp;";
					rowItem += "<input type='text' id='amount"+(beforeTurn+i+1)+"' placeholder='"+(beforeTurn+i+1)+"회차 금액' />&nbsp;원 </td>";
					rowItem += "</tr>"
					
					$('#addRow').append(rowItem);
				}
			} else {
				//alert("===>"+calcuTurn*-1)
				var deleteRow = document.getElementById("addRow").rows.length -turnVal.value;
				for(i=0; i<deleteRow; i++){
					document.getElementById("addRow").deleteRow(document.getElementById("addRow").rows.length-1);
				}
			}
			
			
			
			document.getElementById("beforeTurn").value= turnVal.value;
		}
		
		function fn_addBiddingView(){
			var url = '/writeBiddingInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
	
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		function fn_preBaicView(){
			var url = '/writeBasicInfo.do';
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
				<li class="colorWhite cursorP on">금액</li>
				<li class="colorWhite cursorP">예상일정</li>
			</ul>
		</div>
		<div class="contents">
			<div>
				<table>
					<tr class="ftw200">
						<td class="firstRow">
							<input type="text" placeholder="계약금액"  /> &nbsp;원
						</td>
					</tr>
					<tr class="ftw200">
						<td>
							<input type="text" placeholder="청구일로 부터" /> &nbsp;이내
						</td>
					</tr>
					<tr class="ftw200">
						<td>
							<input type="hidden" id="beforeTurn" value="0">
							<select id="turnInfo" onchange="fn_turnChange()" placeholder="계약금액">
								<option value="0">지급회차</option>
								<option value="1">1회차</option>
								<option value="2">2회차</option>
								<option value="3">3회차</option>
								<option value="4">4회차</option>
								<option value="5">5회차</option>
								<option value="6">6회차</option>
								<option value="7">7회차</option>
								<option value="8">8회차</option>
								<option value="9">9회차</option>
							</select>
						</td>
					</tr>
					<tr>						 
						<table id="addRow">
							<!-- <tr>
								<td>1회차 <input type="text" id="rate0" placeholder="1회차 비율" class="rateInfo" />&nbsp;%&nbsp;&nbsp; <input type="text" id="amount0" placeholder="1회차 금액" />&nbsp;원</td>
							</tr> -->
						</table>
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
					<button onclick="fn_addBiddingView();"><img src="<c:url value='/images/btn_next.png'/>" /></button>
				</div>
				<div class="floatN floatC"></div>
			</div>
		</div>
	</div>
>>>>>>> branch 'master' of https://github.com/corestone1/CEPCore.git
</body>
</html>