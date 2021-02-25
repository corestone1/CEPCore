<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style>
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
			width: calc(100% - 60px);
			margin: 10px 40px 15px 40px;
		}
		.popContainer .contents > div:first-child {
			min-height: 519px;
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
			width: 110px;
			height: 40px;
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
			width: 110px;
			height: 40px;
			background-image: url('/images/icon_calendar.png');
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
		.popContainer .contents td:last-child  {
			padding-right: 0px !important;
		} 		
		.popContainer .contents tr.first td { 
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
		    padding-top: 5px;
		}
		.popContainer .contents tr > td:nth-child(2) {
		    min-width: 145px;
		}
		.popContainer .contents input[class="amount"] {
			text-align: right;
		} 
		/* .popContainer tr:nth-child(1) {
			border-collapse: collapse;
			border-bottom-color: #e5e5e5;			
		} */
		.popContainer table {
			width: 100%;
		}
	</style>
	<script>
		function check_click(num1, num2) {
			var check1 = document.getElementById("check"+num1+"-"+num2).checked;			
			
			if(num2==1){
				if(check1){
					document.getElementById("step"+num1+"-1").style.visibility = 'visible';
					document.getElementById("step"+num1+"-2").style.visibility = 'visible';
					document.getElementById("step"+num1+"-3").style.visibility = 'visible';
					$("#step"+num1+"-1").children().each(function() {
						$(this).prop('required', true);
					});
				} else {
					document.getElementById("check"+num1+"-2").checked = false;
					document.getElementById("from"+num1).value="";
					document.getElementById("to"+num1).value="";
					document.getElementById("amount"+num1).value="";
					document.getElementById("step"+num1+"-1").style.visibility = 'hidden';
					document.getElementById("step"+num1+"-2").style.visibility = 'hidden';
					document.getElementById("step"+num1+"-3").style.visibility = 'hidden';	
					document.getElementById("step"+num1+"-4").style.visibility = 'hidden';	
					$("#step"+num1+"-1").children().each(function() {
						$(this).prop('required', false);
					});
					$("#step"+num1+"-4").children().each(function() {
						$(this).prop('required', false);
					});
				}
			} else if(num2==2){
				if(check1){
					document.getElementById("step"+num1+"-4").style.visibility = 'visible';
					$("#step"+num1+"-4").children().each(function() {
						$(this).prop('required', true);
					});
				} else {
					document.getElementById("amount"+num1).value="";
					document.getElementById("step"+num1+"-4").style.visibility = 'hidden';
					$("#step"+num1+"-4").children().each(function() {
						$(this).prop('required', false);
					});
				}				
			}			
		}
		
		jQuery.fn.serializeObject = function() { 
			var obj = null; 
			var objArry = null;
				try { 
					if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
						var arr = this.serializeArray(); 
						if(arr){ 
							obj = {};
							objArry = new Array();
							jQuery.each(arr, function() {
								
							if(this.name=="ctGuarantyAmount" || this.name=="dfGuarantyAmount" || this.name=="ppGuarantyAmount") {
								//숫자에서 컴마를 제거한다.
								obj[this.name] = removeCommas(this.value); 
							} else if(this.name=="salesBillFcDt" || this.name=="salesCollectFcDt" || this.name=="ctGuarantyStartDt" || this.name=="ctGuarantyEndDt"
								|| this.name=="dfGuarantyStartDt" || this.name=="dfGuarantyEndDt" || this.name=="ppGuarantyStartDt" || this.name=="ppGuarantyEndDt"
								|| this.name=="ctGbPublishDt" || this.name=="dfGbPublishDt" || this.name=="ppGbPublishDt" ) {
								//날짜에서 -를 제거한다.
								obj[this.name] =  removeData(this.value,"-"); 
							} else {
								obj[this.name] = this.value; 
							}

							/*
							* 반복되는 배열을 담기위해 마지막 값이 나오면 obj객체를 Array에 담고 obj객체를 초기화 시킴
							* 반복되는 필드값에서 아래부분만 변경사항 있음.
							*/
							if('ppGuarantyAmount' == this.name){
								
								objArry.push(obj);
								obj = {};
							}
						}); 	              
					} 
				} 
			}catch(e) { 
				alert(e.message); 
			}finally {} 
			return objArry; 
		}
		
		function fn_chkVali() {
			if ($("#gbListForm")[0].checkValidity()){
	            if ($("#gbListForm")[0].checkValidity()){
	               //필수값 모두 통과하여 저장 프로세스 호출.
	               fn_save();
	            } else {
	                $("#gbListForm")[0].reportValidity();   
	            }            
	            
	         }  else {
	             //Validate Form
	              $("#gbListForm")[0].reportValidity();   
	         }
		}
		
		var countSave = 0;
		var turnNo = $("#turnNo").val();
		
		function fn_save() {
			var object = {};
			var formData = $("#infoForm").serializeArray();
			var listData = $("#gbListForm").serializeObject();
			
			for (var i = 0; i<formData.length; i++){
            	object[formData[i]['name']] = formData[i]['value'];
            }
			
			object["guarantyList"] = listData;
			
			var sendData = JSON.stringify(object);
			console.log(sendData);
			$.ajax({
				url: "/project/insert/guarantyInfo.do",
			    dataType: 'json', 
			    type:"POST",  
			    data: sendData,
			 	contentType: "application/json; charset=UTF-8", 
				beforeSend: function(xhr) {
					xhr.setRequestHeader("AJAX", true);
					//xhr.setRequestHeader(header, token);
					
				},
			    success:function(response){	
			    	if(response!= null && response.successYN == 'Y') {
			    		if($("#selectKey").val() == null || $("#selectKey").val() == "" || $("#selectKey").val().length == 0) {
				    		alert("프로젝트 계약 정보가 등록되었습니다.");
				    		countSave++;
			    		} else {
			    			alert("프로젝트 계약 정보가 수정되었습니다.");
			    		}
			    		
			    		var url='/project/write/guarantyInfo.do';
		    			var dialogId = 'program_layer';
		    			var varParam = {
							"pjKey":$("#pjKey").val(),
							"turnNo":$("#turnNo").val(),
							"ctKey":ctKeyList,
							"salesKey": salesKeyList
		    			}
		    			var button = new Array;
		    			button = [];
		    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			    	} else {
			    		if($("#selectKey").val() == null || $("#selectKey").val() == "" || $("#selectKey").val().length == 0) {
			    			alert("프로젝트 계약 정보 등록이 실패하였습니다.");
			    		} else {
			    			alert("프로젝트 계약 정보 수정이 실패하였습니다.");
			    		}
			    	}
			    },
				error: function(request, status, error) {
					if(request.status != '0') {
						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
					}
				} 
			});   
		}
		
		var ctKeyList = new Array();
		var salesKeyList = new Array();
		var salesList = new Array();
		
		<c:forEach items="${ctKey}" var="item">
			ctKeyList.push("${item}");
		</c:forEach>
		
		<c:forEach items="${salesKey}" var="item">
			salesKeyList.push("${item}");
		</c:forEach>
		
		function fn_next(link) {
			if(countSave > 0) {
				var url = '/project/write/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
						"pjKey": $("#pjKey").val(),
						"turnNo":$("#turnNo").val(),
						"ctKey":ctKeyList,
						"salesKey": salesKeyList
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px');
			}
			else {
				if($('#selectKey').val() != "" || $('#selectKey').val().length != 0) {
					var url = '/project/write/'+link+'.do';
					var dialogId = 'program_layer';
					var varParam = {
							"pjKey": $("#pjKey").val(),
							"turnNo":$("#turnNo").val(),
							"ctKey":ctKeyList,
							"salesKey": salesKeyList
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px');
				} else {
					alert('저장을 해주세요.');
				}
			}
		}
		
		function fn_prevView(){
			var url = '/project/write/contractInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey" : $('#pjKey').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		var temp = 0;
		
		function fn_addView(data) {
			for(var i = 0; i < turnNo; i++) {
				
				var salesBillFcDt = addDateMinus(data[i].salesBillFcDt)==null?"":addDateMinus(data[i].salesBillFcDt);
				var salesCollectFcDt = addDateMinus(data[i].salesCollectFcDt)==null?"":addDateMinus(data[i].salesCollectFcDt);
				
				var html = "<table name='table"+i+"'><tr class='first'>";
				html += "<input type='hidden' name='pjKey' value='"+$('#pjKey').val() +"' />";
				html += "<td colspan='2' style='min-width: 96px;'>"+(i+1)+"회차 일정</td>";
				html += "<td>";
				html += "<input type='text' placeholder='계산서 예정 일정' title='계산서 예정 일정' class='calendar' name='salesBillFcDt' value='"+ salesBillFcDt +"' required/> &nbsp;";
				html += "<input type='text' placeholder='수금 예상 일정' title='수금 예상 일정' class='calendar' name='salesCollectFcDt' value='"+ salesCollectFcDt +"' required/>";
				html += "<input type='hidden' name='ctKey' id='ctKey' value='"+ctKeyList[i]+"' />";
				html += "<input type='hidden' name='salesKey' value='"+salesKeyList[i]+"' />";
				html += "<input type='hidden' value='"+(i+1)+"' name='salesTurn' />"
				html += "</td>";
				html += "<td colspan='3'></td>";
				html += "</tr>";
				
				
				html += "<tr class='ftw200'>";
				html += "<td>";
				html += "<input type='hidden' name='ctKey' id='ctKey' value='"+ctKeyList[i]+"' />";
				html += "<input type='hidden' name='salesKeyList' id='salesKeyList' value='"+salesKeyList[i]+"' />";
				html += "<input type='hidden' name='ctGbKey' id='ctGbKey"+ i +"' value='' />";
				html += "<input type='checkbox' name='ctGuarantyCheck' class='tCheck' id='check"+(temp+1)+"-"+1+"' onclick='check_click("+(temp+1)+","+1+")'/><label for='check"+(temp+1)+"-"+1+"' class='cursorP'></label>";
				html += "<input type='hidden' name='ctGuarantyYN' value='N' />";
				html += "</td>";						
				html += "<td>계약 보증 증권 정보</td>";
				html += "<td id='step"+(temp+1)+"-"+1+"' style='visibility:hidden'>";
				html += "<input type='text' id='from"+(temp+1)+"' title='시작 일자' placeholder='from' class='calendar' name='ctGuarantyStartDt' /> ~ ";
				html += "<input type='text' id='to"+(temp+1)+"' title='종료 일자' placeholder='to' class='calendar' name='ctGuarantyEndDt' />";
				html += "</td>";
				html += "<td id='step"+(temp+1)+"-"+2+"' style='visibility:hidden'>";
				html += "<input type='checkbox' class='tCheck' name='ctGbIssueCheck' id='check"+(temp+1)+"-"+2+"' onclick='check_click("+(temp+1)+","+2+")' /><label for='check"+(temp+1)+"-"+2+"' class='cursorP'></label>";
				html += "<input type='hidden' name='ctGbIssueYn' value='N'/>";
				html += "</td>";
				html += "<td id='step"+(temp+1)+"-"+3+"' style='visibility:hidden'>완료</td>";
				html += "<td id='step"+(temp+1)+"-"+4+"' style='visibility:hidden'>";
				html += "<input type='text' id='publishDt"+(temp+1)+"' title='발행 일자' placeholder='발행 일자' class='calendar' name='ctGbPublishDt' />&nbsp;&nbsp;";
				html += "<input type='text' id='amount"+(temp+1)+"' placeholder='금액' amountOnly class='amount' name='ctGuarantyAmount'/>";
				html += "</td>";
				html += "</tr>";

				
				html += "<tr class='ftw200'>";
				html += "<td>";
				html += "<input type='hidden' name='ctKey' id='ctKey' value='"+ctKeyList[i]+"' />";
				html += "<input type='hidden' name='salesKeyList' id='salesKeyList' value='"+salesKeyList[i]+"' />";
				html += "<input type='hidden' name='dfGbKey' id='dfGbKey"+ i +"' value='' />";
				html += "<input type='checkbox' class='tCheck' name='dfGuarantyCheck' id='check"+(temp+2)+"-"+1+"' onclick='check_click("+(temp+2)+","+1+")' /><label for='check"+(temp+2)+"-"+1+"' class='cursorP'></label>";
				html += "<input type='hidden' name='dfGuarantyYN' value='N' />";
				html += "</td>";
				html += "<td>하자 보증 증권 정보</td>";
				html += "<td id='step"+(temp+2)+"-"+1+"' style='visibility:hidden'>";
				html += "<input type='text' id='from"+(temp+2)+"' title='시작 일자' placeholder='from' class='calendar' name='dfGuarantyStartDt' /> ~ "; 
				html += "<input type='text' id='to"+(temp+2)+"' title='종료 일자' placeholder='to' class='calendar' name='dfGuarantyEndDt' />";
				html += "</td>";
				html += "<td id='step"+(temp+2)+"-"+2+"' style='visibility:hidden'>";
				html += "<input type='checkbox' class='tCheck' name='dfGbIssueCheck' id='check"+(temp+2)+"-"+2+"' onclick='check_click("+(temp+2)+","+2+")' /><label for='check"+(temp+2)+"-"+2+"' class='cursorP'></label>"; 
				html += "<input type='hidden' name='dfGbIssueYn' value='N'/>";
				html += "</td>";
				html += "<td id='step"+(temp+2)+"-"+3+"' style='visibility:hidden'>완료</td>";
				html += "<td id='step"+(temp+2)+"-"+4+"' style='visibility:hidden'>";
				html += "<input type='text' id='publishDt"+(temp+2)+"' title='발행 일자' placeholder='발행 일자' class='calendar' name='dfGbPublishDt' />&nbsp;&nbsp;";
				html += "<input type='text' id='amount"+(temp+2)+"' placeholder='금액' amountOnly class='amount' width='177px' name='dfGuarantyAmount' />";
				html += "</td>";
				html += "</tr>";
				
				
				html += "<tr class='ftw200'>";
				html += "<td>";
				html += "<input type='hidden' name='ctKey' id='ctKey' value='"+ctKeyList[i]+"' />";
				html += "<input type='hidden' name='salesKeyList' id='salesKeyList' value='"+salesKeyList[i]+"' />";
				html += "<input type='hidden' name='ppGbKey' id='ppGbKey"+ i +"' value='' />";
				html += "<input type='checkbox' class='tCheck' name='ppGuarantyCheck' id='check"+(temp+3)+"-"+1+"' onclick='check_click("+(temp+3)+","+1+")' /><label for='check"+(temp+3)+"-"+1+"' class='cursorP'></label>";
				html += "<input type='hidden' name='ppGuarantyYN' value='N' />";
				html += "</td>";
				html += "<td>선급금 보증 증권 정보</td>";
				html += "<td id='step"+(temp+3)+"-"+1+"' style='visibility:hidden'>";
				html += "<input type='text' id='from"+(temp+3)+"' title='시작 일자' placeholder='from' class='calendar' name='ppGuarantyStartDt' /> ~ ";
				html += "<input type='text' id='to"+(temp+3)+"' title='종료 일자' placeholder='to' class='calendar' name='ppGuarantyEndDt' />";
				html += "</td>";
				html += "<td id='step"+(temp+3)+"-"+2+"' style='visibility:hidden'>";
				html += "<input type='checkbox' class='tCheck' name='ppGbIssueCheck' id='check"+(temp+3)+"-"+2+"' onclick='check_click("+(temp+3)+","+2+")' /><label for='check"+(temp+3)+"-"+2+"' class='cursorP'></label>";
				html += "<input type='hidden' name='ppGbIssueYn' value='N'/>";
				html += "</td>";
				html += "<td id='step"+(temp+3)+"-"+3+"' style='visibility:hidden'>완료</td>";
				html += "<td id='step"+(temp+3)+"-"+4+"' style='visibility:hidden'>";
				html += "<input type='text' id='publishDt"+(temp+3)+"' title='발행 일자' placeholder='발행 일자' class='calendar' name='ppGbPublishDt' />&nbsp;&nbsp;";
				html += "<input type='text' id='amount"+(temp+3)+"' placeholder='금액' amountOnly class='amount' width='177px' name='ppGuarantyAmount'/>";
				html += "</td>";
				html += "</tr></table>";
				/* </form>"; */
				
				$('#infoTable').append(html);
				
				for(var j = 0; j < data[i].guarantyList.length; j++) {
					if(data[i].guarantyList[j].gbKindCd == "계약") {
						fn_fillView(data, i,j,'ct');
						$("#ctGbKey"+i).val(data[i].guarantyList[j].gbKey);
					} else if(data[i].guarantyList[j].gbKindCd == "하자") {
						fn_fillView(data, i,j,'df');
						$("#dfGbKey"+i).val(data[i].guarantyList[j].gbKey);
					} else if(data[i].guarantyList[j].gbKindCd == "선급금") {
						fn_fillView(data, i,j,'pp');
						$("#ppGbKey"+i).val(data[i].guarantyList[j].gbKey);
					}
					
					$("#selectKey").val(data[i].guarantyList[j].gbKey);
				}
			
				temp = temp+3; 
			}
			
			$('input[class=tCheck]').on('click', function() { 
				 if($(this).is(":checked") == true) {
					 $(this).next().next().val('Y');
				 } else {
					 $(this).next().next().val('N');
				 }
		 	}); 
			
			if($('input[id=selectKey]').val() != "" || $('input[id=selectKey]').val().length != 0) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />'); 
			}
		}
		
		function fn_fillView(data, index, jindex, kind) {
			$('table[name=table'+index+'] input[name='+kind+'GuarantyCheck]').prop('checked', true);
			$('table[name=table'+index+'] input[name='+kind+'GuarantyYN]').val('Y');
			var valueId = $('table[name=table'+index+'] input[name='+kind+'GuarantyCheck]').attr('id').split('-');
			var value1 = valueId[0].replace(/[^0-9]/g,'');
			var value2 = valueId[1].replace(/[^0-9]/g,''); 
			check_click(value1, value2);
			$('table[name=table'+index+'] input[name='+kind+'GuarantyStartDt]').val(addDateMinus(data[index].guarantyList[jindex].gbStartDt));
			$('table[name=table'+index+'] input[name='+kind+'GuarantyEndDt]').val(addDateMinus(data[index].guarantyList[jindex].gbEndDt));
			if(data[index].guarantyList[jindex].gbIssueYn == 'Y') {
				$('table[name=table'+index+'] input[name='+kind+'GbIssueCheck]').prop('checked', true);
				$('table[name=table'+index+'] input[name='+kind+'GbIssueYn]').val('Y');
				$('table[name=table'+index+'] input[name='+kind+'GbIssueCheck]').attr('onclick', 'return false;');
				var valueId = $('table[name=table'+index+'] input[name='+kind+'GbIssueCheck]').attr('id').split('-');
				var value1 = valueId[0].replace(/[^0-9]/g,'');
				var value2 = valueId[1].replace(/[^0-9]/g,''); 
				check_click(value1, value2);
				$('table[name=table'+index+'] input[name='+kind+'GbPublishDt]').val(addDateMinus(data[index].guarantyList[jindex].gbPublishDt));
				$('table[name=table'+index+'] input[name='+kind+'GuarantyAmount]').val(addCommas(data[index].guarantyList[jindex].gbAmount));
			}
		} 
		
		$(document).ready(function() {
			console.log(salesKeyList);
			var objParams = {
				"salesKeyList" : salesKeyList
			};
			
			$.ajax({
	        	url:"/project/select/guarantyInfo.do",
	        	dataType:"json",
                contentType:"application/x-www-form-urlencoded; charset=UTF-8",
	            type:"post",
	            data: objParams,
	            success:function(response){	
	            	fn_addView(response)
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });
		});
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
		<form:form commandName="gbListForm" id="gbListForm" name="gbListForm" method="post">
 			<div class="contents">
				<div>
					<div id="infoTable">
					<%-- <c:set var="temp" value="0" />
					<c:forEach var="result" items="${ctKey }" varStatus="status">
						<table>
							<tr class='first'>
								<td colspan='2' style='min-width: 96px;'><c:out value="${status.count }" />회차 일정</td>
								<td>
									<input type='text' placeholder='계산서 예정일정' class='calendar' name='salesBillFcDt' value='${displayUtil.displayDate(salesList[status.index].salesBillFcDt) }' required/> &nbsp;
									<input type='text' placeholder='수금 예상 일정' class='calendar' name='salesCollectFcDt' value='${displayUtil.displayDate(salesList[status.index].salesCollectFcDt) }' required/>
									<input type='hidden' name='ctKey' id='ctKey' value='${result }' />
									<input type='hidden' name='salesKey' value='${salesKey[status.index]}' />
									<input type='hidden' value='${status.count }' name='salesTurn' />
								</td>
								<td colspan='3'></td>
						 	</tr>
							 <tr class='ftw200'>
								 <td>
									 <input type='hidden' name='ctKey' id='ctKey' value='${result }' />
									 <input type='hidden' name='salesKey' value='${salesKey[status.index]}' />
									 <input type='checkbox' name='ctGuarantyCheck' class='tCheck' id='check${ temp + 1}-1' onclick='check_click(${temp+1},1)'/>
									 <label for='check${ temp + 1}-1' class='cursorP'></label>
									 <input type='hidden' name='ctGuarantyYN' value='N' />
								 </td>						
								 <td>계약 보증 증권 정보</td>
								 <td id='step${ temp + 1}-1' style='visibility:hidden'>
									 <input type='text' id='from${ temp + 1}' placeholder='from' class='calendar' name='ctGuarantyStartDt' /> ~ 
									 <input type='text' id='to${ temp + 1}' placeholder='to' class='calendar' name='ctGuarantyEndDt' />
								 </td>
								 <td id='step${ temp + 1}-2' style='visibility:hidden'>
									 <input type='checkbox' class='tCheck' name='ctGbIssueCheck' id='check${ temp + 1}-2' onclick='check_click(${temp+1},2)' /><label for='check${ temp + 1}-2' class='cursorP'></label>
									 <input type='hidden' name='ctGbIssueYn' value='N'/>
								 </td>
								 <td id='step${ temp + 1}-3' style='visibility:hidden'>완료</td>
								 <td id='step${ temp + 1}-4' style='visibility:hidden'>
								 	<input type='text' id='amount${ temp + 1}' placeholder='금액' amountOnly class='amount' width='177px' name='ctGuarantyAmount'/>
								 </td>
							 </tr>
							 <tr class='ftw200'>
								 <td>
									 <input type='hidden' name='ctKey' id='ctKey' value='${result }' />
									 <input type='hidden' name='salesKey' value='${salesKey[status.index]}' />
									 <input type='checkbox' class='tCheck' name='dfGuarantyCheck' id='check${ temp + 2}-1' onclick='check_click(${ temp + 2},1)' /><label for='check${ temp + 2}-1' class='cursorP'></label>
									 <input type='hidden' name='dfGuarantyYN' value='N' />
								 </td>
								 <td>하자 보증 증권 정보</td>
								 <td id='step${ temp + 2}-1' style='visibility:hidden'>
									 <input type='text' id='from${ temp + 2}' placeholder='from' class='calendar' name='dfGuarantyStartDt' /> ~  
									 <input type='text' id='to${ temp + 2}' placeholder='to' class='calendar' name='dfGuarantyEndDt' />
								 </td>
								 <td id='step${ temp + 2}-2' style='visibility:hidden'>
									 <input type='checkbox' class='tCheck' name='dfGbIssueCheck' id='check${ temp + 2}-2' onclick='check_click(${ temp + 2},2)' /><label for='check${ temp + 2}-2' class='cursorP'></label> 
									 <input type='hidden' name='dfGbIssueYn' value='N'/>
								 </td>
								 <td id='step${ temp + 2}-3' style='visibility:hidden'>완료</td>
								 <td id='step${ temp + 2}-4' style='visibility:hidden'>
								 	<input type='text' id='amount${ temp + 2}' placeholder='금액' numberOnly class='amount' width='177px' name='dfGuarantyAmount'/>
								 </td>
							 </tr>
							 <tr class='ftw200'>
								 <td>
									  <input type='hidden' name='ctKey' id='ctKey' value='${result }' />
									 <input type='hidden' name='salesKey' value='${salesKey[status.index]}' />
									 <input type='checkbox' class='tCheck' name='ppGuarantyCheck' id='check${ temp + 3}-1' onclick='check_click(${ temp + 3},1)' /><label for='check${ temp + 3}-1' class='cursorP'></label>
									 <input type='hidden' name='ppGuarantyYN' value='N' />
								 </td>
								 <td>선급금 보증 증권 정보</td>
								 <td id='step${ temp + 3}-1' style='visibility:hidden'>
									 <input type='text' id='from${ temp + 3}' placeholder='from' class='calendar' name='ppGuarantyStartDt'/> ~ 
									 <input type='text' id='to${ temp + 3}' placeholder='to' class='calendar' name='ppGuarantyEndDt'/>
								 </td>
								 <td id='step${ temp + 3}-2' style='visibility:hidden'>
									 <input type='checkbox' class='tCheck' name='ppGbIssueCheck' id='check${ temp + 3}-2' onclick='check_click(${ temp + 3},2)' /><label for='check${ temp + 3}-2' class='cursorP'></label>
									 <input type='hidden' name='ppGbIssueYn' value='N'/>
								 </td>
								 <td id='step${ temp + 3}-3' style='visibility:hidden'>완료</td>
								 <td id='step${ temp + 3}-4' style='visibility:hidden'>
								 	<input type='text' id='amount${ temp + 3}' placeholder='금액' numberOnly class='amount' width='177px' name='ppGuarantyAmount'/>
								 </td>
							 </tr>
							</table> 
							<c:set var="temp" value="${temp + 3}"/>
						</c:forEach> --%>
					</div>
				</div>
				<div class="btnWrap floatR">
					<div class="floatL btnPrev">
						<button type="button" onclick="fn_prevView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					</div>
					<div class="floatL btnSave">
						<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<div class="floatR">
						<button type="button" onclick="javascript:fn_next('orderInfo')"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</form:form>
		<form id="infoForm" name="infoForm">
			<input type="hidden" name="pjKey" id="pjKey" value="<c:out value="${pjKey[0]}"/>" />
			<input type="hidden" name="salesCtFkKey" value="<c:out value="${pjKey[0]}"/>" />
			<input type="hidden" id="turnNo" value="<c:out value="${turnNo[0]}"/>"/>
			<input type="hidden" name="selectKey" id="selectKey" value=""/>
			<input type="hidden" name="statusCd" value="PJST2000" />
		</form>
	</div>
</body>
</html>