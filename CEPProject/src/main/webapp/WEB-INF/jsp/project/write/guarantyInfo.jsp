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
			width: calc(100% - 80px) !important;
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
			width: 102px;
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
		.popContainer .contents input[class^="calendar"] {
			width: 102px;
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
		.popContainer .contents tr.first td span {
		    font-size: 14px;
    		margin-right: 10px;: 
		}
		.popContainer .contents tr.first td:nth-child(2) {
			padding-left: 134px;
    		padding-right: 0;
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
		.popContainer .contents .gtlabel {
			font-size: 13px;
			display: block;
			margin-bottom: 4px;
			color: #f59348;
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
		/* function check_click(num1, num2) {
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
					document.getElementById("publishDt" + num1).value = "";
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
					document.getElementById("publishDt" + num1).value = "";
					document.getElementById("step"+num1+"-4").style.visibility = 'hidden';
					$("#step"+num1+"-4").children().each(function() {
						$(this).prop('required', false);
					});
				}				
			}			
		} */
		
		jQuery.fn.serializeObject = function() { 
			var obj = null; 
			var objArry = null;
			try { 
				if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) { 
					var arr = this.serializeArray(); 
					if(arr){ 
						obj = {};
						objArry = new Array();
						$.each(arr, function() {
							if(this.name=="salesBillFcDt" || this.name=="salesCollectFcDt" || this.name=="ctGuarantyStartDt" || this.name=="ctGuarantyEndDt"
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
							if('dfGuarantyYN' == this.name){
								objArry.push(obj);
								obj = {};
							}
						}); 	        

					} 
				} 
			} catch(e) { 
				alert(e.message); 
			}finally {} 
			return objArry; 
		}
		
		function fn_chkVali() {
			var returnVal = true;
			if ($("#gbListForm")[0].checkValidity()){
	            if ($("#gbListForm")[0].checkValidity()){
	            	
	            	/* $(".calendar").each(function () {
	    				if($(this).val().length < 11) {
	    					alert("올바른 날짜 형식을 입력해주세요.");
	    					returnVal = false;
	    					
	    					var e = jQuery.Event("keypress");
	    					$(this).trigger(e);
	    					
	    					return false;
	    				} 
	    			});
	            	
	            	if(returnVal == true) { */
            		 	//필수값 모두 통과하여 저장 프로세스 호출.
	 	               fn_save();
	            /* 	}  */
	            	
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
			
			$("input[type='checkbox'][name*='GuarantyCheck']").each(function() {
				if($(this).is(":checked") == true) {
					$(this).next().next().val('Y');
				} else {
					$(this).next().next().val('N');
				}
			})
			
			$("input[type='checkbox'][name*='GbIssueCheck']").each(function() {
				if($(this).is(":checked") == true) {
					$(this).next().next().val('Y');
				} else {
					$(this).next().next().val('N');
				}
			})
			
			var object = {};
			var formData = $("#infoForm").serializeArray();
			var listData = $("#gbListForm").serializeObject();
			
			for (var i = 0; i<formData.length; i++){
            	object[formData[i]['name']] = formData[i]['value'];
            }
			
			object["guarantyList"] = listData;
			
			var sendData = JSON.stringify(object);
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
			    	if(response.successYN == 'Y') {
			    		if($("input[name='ctGbKey']").val().length == 0 && $("input[name='dfGbKey']").val().length == 0 && $("input[name='ppGbKey']").val().length == 0) {
				    		alert("프로젝트 계약 정보가 저장되었습니다.");
				    		countSave++;
			    		} else {
			    			alert("프로젝트 계약 정보가 수정되었습니다.");
			    		}
			    	} else {
			    		if($("input[name='ctGbKey']").val().length == 0 && $("input[name='dfGbKey']").val().length == 0 && $("input[name='ppGbKey']").val().length == 0) {
			    			alert("프로젝트 계약 정보 저장이 실패하였습니다.");
			    		} else {
			    			alert("프로젝트 계약 정보 수정이 실패하였습니다.");
			    		}
			    	}
			    	
			    	var url='/project/write/guarantyInfo.do';
	    			var dialogId = 'program_layer';
	    			var varParam = {
						"pjKey":$("#pjKey").val()
	    			}
	    			var button = new Array;
	    			button = [];
	    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			    },
				error: function(request, status, error) {
					if(request.status != '0') {
						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
					}
				} 
			});     
		}
		
		function fn_next(link) {
			if(countSave > 0) {
				var url = '/project/write/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
						"pjKey": $("#pjKey").val()
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			}
			else {
				var isUpdate = false;
				<c:forEach items="${salesList}" var="result">
					if("${result.salesBillFcDt}" != "" && "${result.salesBillFcDt}" != null 
							&& "${result.salesCollectFcDt}" != "" && "${result.salesCollectFcDt}" != null) {
						isUpdate = true;
					}
				</c:forEach>
				
				/* if(isUpdate) { */
					var url = '/project/write/'+link+'.do';
					var dialogId = 'program_layer';
					var varParam = {
							"pjKey": $("#pjKey").val()
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				/* } else {
					alert('저장을 해주세요.');
				} */
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
		
		function fn_remove(obj) {
			$('.'+obj).remove();
			fn_view();
		}
		
		function fn_view() {
			$("input[id*=from]").each(function() {
				if($(this).val() != null && $(this).val().length != 0) {
					var num = $(this).parent().attr('id').split('-')[0].charAt($(this).parent().attr('id').split('-')[0].length - 1);
					document.getElementById("step"+num+"-1").style.visibility = 'visible';
					document.getElementById("step"+num+"-2").style.visibility = 'visible';
					document.getElementById("step"+num+"-3").style.visibility = 'visible';
					$("#step"+num+"-1").children().each(function() {
						$(this).prop('required', true);
					});
				}
			});
			$("input[name*='GbIssueCheck']").each(function() {
				if($(this).is(':checked') == true) {
					var num = $(this).parent().attr('id').split('-')[0].charAt($(this).parent().attr('id').split('-')[0].length - 1);
					document.getElementById("step"+num+"-4").style.visibility = 'visible';
					$("#step"+num+"-4").children().each(function() {
						$(this).prop('required', true);
					});
				}
			}); 
		}
		
		$(document).ready(function() {
			var isUpdate = false;
			<c:forEach items="${salesList}" var="result">
				if("${result.salesBillFcDt}" != "" && "${result.salesBillFcDt}" != null 
						&& "${result.salesCollectFcDt}" != "" && "${result.salesCollectFcDt}" != null) {
					isUpdate = true;
				}
			</c:forEach>
			
			
			if(isUpdate) {
				$('.btnSave').children().eq(0).html('');
				$('.btnSave').children().eq(0).html('<img src="<c:url value='/images/btn_mod.png'/>" />');
			}
			
			
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
				<li class="colorWhite cursorP" onclick="fn_prevView();">매출정보</li>
				<li class="colorWhite cursorP on">보증증권</li>
			</ul>
		</div>
		<form:form commandName="gbListForm" id="gbListForm" name="gbListForm" method="post">
			<input type="hidden" id="spKey" value="${forecastVO.spKey }" />
			<input type="hidden" id="salesBillFcDt" value="${result.salesBillFcDt eq null }" />
 			<div class="contents">
				<div>
					<div id="infoTable">
					<c:set var="temp" value="0" />
					<c:set var="length" value="0" />
					<c:choose>
						<c:when test="${guarantyList eq null || fn:length(guarantyList) eq 0}">
							<%-- <c:forEach var="result" items="${salesList }" varStatus="status"> --%>
								<table>
									<tr class='first'>
										<td colspan='2' style='min-width: 96px;'><%-- <c:out value="${result.salesTurn}" /> --%>증권정보</td>
										<td>
											<%-- <span>계산서 예정</span>
											<input type='text' title='계산서 예정' placeholder='계산서 예정' class='calendar' name='salesBillFcDt' 
												value='<c:choose><c:when test="${result.salesBillFcDt eq null }"><c:if test="${forecastVO.fcSalesDt ne null }">${ displayUtil.displayDate(forecastVO.fcSalesDt) }-01</c:if></c:when><c:otherwise>${ displayUtil.displayDate(result.salesBillFcDt) }</c:otherwise></c:choose>' required/> &nbsp;
											<span style="margin-left: 13px;">수금 예상</span>
											<input type='text' title='수금 예상' placeholder='수금 예상' class='calendar' name='salesCollectFcDt' 
												value='<c:choose><c:when test="${result.salesCollectFcDt eq null }"><c:if test="${forecastVO.fcCollectDt ne null }">${ displayUtil.displayDate(forecastVO.fcCollectDt) }-01</c:if></c:when><c:otherwise>${ displayUtil.displayDate(result.salesCollectFcDt) }</c:otherwise></c:choose>' required/> --%>
											<input type='hidden' name='ctKey' id='ctKey' value='${ctVO.ctKey }' />
											<input type='hidden' name='salesKey' value='${result.salesKey}' />
											<input type='hidden' value='${status.count }' name='salesTurn' />
										</td>
										<td colspan='3'></td>
								 	</tr>
								 	<tr><td colspan='5'><label class="gtlabel ftw200">※ 프로젝트 수정 화면에서 보증 증권 발행을 신청할 수 있습니다.</label></td></tr>
									<tr class='ftw200'>
									 	<td>
										 	 <input type="hidden" name="ctGbKey" id="ctGbKey${status.count }" value="" />
											 <input type='checkbox' name='ctGuarantyCheck'  class='tCheck' id='check${ temp + 1}-1' />
											 <%-- class='tCheck' id='check${ temp + 1}-1' onclick='check_click(${temp+1},1)'/> --%>
											 <label for='check${ temp + 1}-1' class='cursorP'></label>
											 <input type='hidden' name='ctGuarantyYN' value='N' />
										</td>						
										<td>계약 보증 증권 정보</td>
										 <%-- <td id='step${ temp + 1}-1' style='visibility:hidden'>
											 <input type='text' id='from${ temp + 1}' placeholder='from' class='calendar' name='ctGuarantyStartDt' /> ~ 
											 <input type='text' id='to${ temp + 1}' placeholder='to' class='calendar' name='ctGuarantyEndDt' />
										 </td>
										 <td id='step${ temp + 1}-2' style='visibility:hidden'>
											 <input type='checkbox' class='tCheck' name='ctGbIssueCheck' id='check${ temp + 1}-2' onclick='check_click(${temp+1},2)' />
											 <label for='check${ temp + 1}-2' class='cursorP'></label>
											 <input type='hidden' name='ctGbIssueYn' value='N'/>
										 </td>
										 <td id='step${ temp + 1}-3' style='visibility:hidden'>완료</td>
										 <td id='step${ temp + 1}-4' style='visibility:hidden'>
											<input type='text' id='publishDt${ temp + 1}' title='발행 일자' placeholder='발행 일자' class='calendar' name='ctGbPublishDt' />&nbsp;&nbsp;
										 	<input type='text' id='amount${ temp + 1}' placeholder='금액' amountOnly class='amount' width='177px' name='ctGuarantyAmount'/>
										 </td> --%>
									 </tr>
									 <tr class='ftw200'>
										 <td>
										 	 <input type="hidden" name="ppGbKey" id="ppGbKey${status.count }" value="" />
											 <input type="checkbox" class="tCheck" name="ppGuarantyCheck" id="check${ temp + 3}-1"<%-- onclick='check_click(${ temp + 3},1)'  --%>/>
											 <label for='check${ temp + 3}-1' class='cursorP'></label>
											 <input type='hidden' name='ppGuarantyYN' value='N' />
										 </td>
											 <td>선급금 보증 증권 정보</td>
											<%--  <td id='step${ temp + 3}-1' style='visibility:hidden'>
											 <input type='text' id='from${ temp + 3}' placeholder='from' class='calendar' name='ppGuarantyStartDt'/> ~ 
											 <input type='text' id='to${ temp + 3}' placeholder='to' class='calendar' name='ppGuarantyEndDt'/>
										 </td>
										 <td id='step${ temp + 3}-2' style='visibility:hidden'>
											 <input type='checkbox' class='tCheck' name='ppGbIssueCheck' id='check${ temp + 3}-2' onclick='check_click(${ temp + 3},2)' /><label for='check${ temp + 3}-2' class='cursorP'></label>
											 <input type='hidden' name='ppGbIssueYn' value='N'/>
										 </td>
										 <td id='step${ temp + 3}-3' style='visibility:hidden'>완료</td>
										 <td id='step${ temp + 3}-4' style='visibility:hidden'>
										 	<input type='text' id='publishDt${ temp + 3}' title='발행 일자' placeholder='발행 일자' class='calendar' name='ppGbPublishDt' />&nbsp;&nbsp;
										 	<input type='text' id='amount${ temp + 3}' placeholder='금액' amountOnly class='amount' width='177px' name='ppGuarantyAmount'/>
										 </td> --%>
									 </tr>
									 <tr class='ftw200'>
										 <td>
										 	 <input type="hidden" name="dfGbKey" id="dfGbKey${status.count }" value="" />
											 <input type='checkbox' class='tCheck' name='dfGuarantyCheck' id='check${ temp + 2}-1' <%-- onclick='check_click(${ temp + 2},1)' --%> />
											 <label for='check${ temp + 2}-1' class='cursorP'></label>
											 <input type='hidden' name='dfGuarantyYN' value='N' />
										 </td>
										 <td>하자 보증 증권 정보</td>
										 <%-- <td id='step${ temp + 2}-1' style='visibility:hidden'>
											 <input type='text' id='from${ temp + 2}' placeholder='from' class='calendar' name='dfGuarantyStartDt' /> ~  
											 <input type='text' id='to${ temp + 2}' placeholder='to' class='calendar' name='dfGuarantyEndDt' />
										 </td>
										 <td id='step${ temp + 2}-2' style='visibility:hidden'>
											 <input type='checkbox' class='tCheck' name='dfGbIssueCheck' id='check${ temp + 2}-2' onclick='check_click(${ temp + 2},2)' /><label for='check${ temp + 2}-2' class='cursorP'></label> 
											 <input type='hidden' name='dfGbIssueYn' value='N'/>
										 </td>
										 <td id='step${ temp + 2}-3' style='visibility:hidden'>완료</td>
										 <td id='step${ temp + 2}-4' style='visibility:hidden'>
										 	<input type='text' id='publishDt${ temp + 2}' title='발행 일자' placeholder='발행 일자' class='calendar' name='dfGbPublishDt' />&nbsp;&nbsp;
										 	<input type='text' id='amount${ temp + 2}' placeholder='금액' amountOnly class='amount' width='177px' name='dfGuarantyAmount'/>
										 </td> --%>
									 </tr>
									</table> 
									<c:set var="temp" value="${temp + 3}"/>
									<c:set var="length" value="${length + 1 }" />
								<%-- </c:forEach>  --%>
							</c:when>
							<c:otherwise>
								<%-- <c:forEach var="entry" items="${salesList }" varStatus="status"> --%>
									<table>
										<tr class='first'>
											<td colspan='2' style='min-width: 96px;'><%-- <c:out value="${entry.salesTurn }" />회차 --%>증권정보</td>
											<td>
												<%-- <span>계산서 예정</span>
												<input type='text' title='계산서 예정' placeholder='계산서 예정' class='calendar' name='salesBillFcDt' 
													value='<c:choose><c:when test="${result.salesBillFcDt eq null }"><c:if test="${forecastVO.fcSalesDt ne null }">${ displayUtil.displayDate(forecastVO.fcSalesDt) }-01</c:if></c:when><c:otherwise>${ displayUtil.displayDate(result.salesBillFcDt) }</c:otherwise></c:choose>' required/> &nbsp;
												<span style="margin-left: 13px;">수금 예상</span>
												<input type='text' title='수금 예상' placeholder='수금 예상' class='calendar' name='salesCollectFcDt' 
													value='<c:choose><c:when test="${result.salesCollectFcDt eq null }"><c:if test="${forecastVO.fcCollectDt ne null }">${ displayUtil.displayDate(forecastVO.fcCollectDt) }-01</c:if></c:when><c:otherwise>${ displayUtil.displayDate(result.salesCollectFcDt) }</c:otherwise></c:choose>' required/> --%>
												<input type='hidden' name='salesKey' value='${entry.salesKey}' />
												<input type='hidden' name='ctKey' id='ctKey' value='${ctVO.ctKey }' />
												<input type='hidden' value='${entry.salesTurn }' name='salesTurn' />
											</td>
											<td colspan='3'></td>
										</tr>
										<tr><td colspan='5'><label class="gtlabel ftw200">※ 프로젝트 수정 화면에서 보증 증권 발행을 신청할 수 있습니다.</label></td></tr>
										<c:forEach var="result" items="${guarantyList }" varStatus="status">
											<c:if test="${entry.salesKey eq result.salesKey && result.gbKindCd eq '계약'}">
												<script>fn_remove('nData${temp+1}');</script>
												<tr class='ftw200'>
													<td>
														<input type='hidden' name='ctGbKey' id='ctGbKey${status.count }' <c:if test="${result.gbKindCd eq  '계약'}">value='${result.gbKey }'</c:if>/>
														<input type='checkbox' name='ctGuarantyCheck' class='tCheck' id='check${ temp + 1}-1' <%-- onclick='check_click(${temp+1},1)' --%> <c:if test="${result.gbKindCd eq  '계약'}">checked</c:if>/>
														<label for='check${ temp + 1}-1' class='cursorP'></label>
														<input type='hidden' name='ctGuarantyYN' <c:choose><c:when test="${result.gbKindCd eq '계약'}">value="Y"</c:when><c:otherwise>value="N"</c:otherwise></c:choose>/>
													</td>						
													<td>계약 보증 증권 정보</td>
													<%-- <td id='step${ temp + 1}-1' style='visibility:hidden'>
														<input type='text' id='from${ temp + 1}' placeholder='from' class='calendar' <c:if test="${result.gbKindCd eq '계약'}">value="${displayUtil.displayDate(result.gbStartDt) }"</c:if>name='ctGuarantyStartDt' /> ~ 
														<input type='text' id='to${ temp + 1}' placeholder='to' class='calendar' name='ctGuarantyEndDt' <c:if test="${result.gbKindCd eq '계약'}">value="${displayUtil.displayDate(result.gbEndDt) }"</c:if>/>
													</td>
													<td id='step${ temp + 1}-2' style='visibility:hidden'>
														<input type='checkbox' class='tCheck' name='ctGbIssueCheck' id='check${ temp + 1}-2' onclick='check_click(${temp+1},2)' <c:if test="${result.gbKindCd eq '계약' && result.gbIssueYn eq 'Y'}">checked</c:if>/>
														<label for='check${ temp + 1}-2' class='cursorP'></label>
														<input type='hidden' name='ctGbIssueYn' <c:choose><c:when test="${result.gbKindCd eq '계약' && result.gbIssueYn eq 'Y'}">value="Y"</c:when><c:otherwise>value="N"</c:otherwise></c:choose>/>
													</td>
													<td id='step${ temp + 1}-3' style='visibility:hidden'>완료</td>
													<td id='step${ temp + 1}-4' style='visibility:hidden'>
														<input type='text' id='publishDt${ temp + 1}' title='발행 일자' placeholder='발행 일자' class='calendar' name='ctGbPublishDt' <c:if test="${result.gbKindCd eq '계약' && result.gbIssueYn eq 'Y'}">value="${displayUtil.displayDate(result.gbPublishDt) }"</c:if>/>&nbsp;&nbsp;
														<input type='text' id='amount${ temp + 1}' placeholder='금액' amountOnly class='amount' width='177px' name='ctGuarantyAmount' <c:if test="${result.gbKindCd eq '계약' && result.gbIssueYn eq 'Y'}">value="${displayUtil.commaStr(result.gbAmount) }"</c:if>/>
													</td> --%>
												</tr>
											</c:if>
										</c:forEach>
										<tr class='ftw200 nData${temp+1 }'>
											<td>
												<input type='hidden' name='ctGbKey' id='ctGbKey${status.count }' />
												<input type='checkbox' name='ctGuarantyCheck' class='tCheck' id='check${ temp + 1}-1' <%-- onclick='check_click(${temp+1},1)' --%> />
												<label for='check${ temp + 1}-1' class='cursorP'></label>
												<input type='hidden' name='ctGuarantyYN' />
											</td>						
											<td>계약 보증 증권 정보</td>
											<%-- <td id='step${ temp + 1}-1' style='visibility:hidden'>
												<input type='text' id='from${ temp + 1}' placeholder='from' class='calendar' name='ctGuarantyStartDt' /> ~ 
												<input type='text' id='to${ temp + 1}' placeholder='to' class='calendar' name='ctGuarantyEndDt' />
											</td>
											<td id='step${ temp + 1}-2' style='visibility:hidden'>
												<input type='checkbox' class='tCheck' name='ctGbIssueCheck' id='check${ temp + 1}-2' onclick='check_click(${temp+1},2)' />
												<label for='check${ temp + 1}-2' class='cursorP'></label>
												<input type='hidden' name='ctGbIssueYn' />
											</td>
											<td id='step${ temp + 1}-3' style='visibility:hidden'>완료</td>
											<td id='step${ temp + 1}-4' style='visibility:hidden'>
												<input type='text' id='publishDt${ temp + 1}' title='발행 일자' placeholder='발행 일자' class='calendar' name='ctGbPublishDt' />&nbsp;&nbsp;
												<input type='text' id='amount${ temp + 1}' placeholder='금액' amountOnly class='amount' width='177px' name='ctGuarantyAmount' />
											</td> --%>
										</tr>
										<c:forEach var="result" items="${guarantyList }" varStatus="status">
											<c:if test="${entry.salesKey eq result.salesKey && result.gbKindCd eq '선급금'}">
												<script>fn_remove('nData${temp+3}');</script>
												<tr class='ftw200'>
													<td>
														<input type='hidden' name='ppGbKey' id='ppGbKey${status.count }' <c:if test="${result.gbKindCd eq  '선급금'}">value='${result.gbKey }'</c:if> />
														<input type='checkbox' class='tCheck' name='ppGuarantyCheck' id='check${ temp + 3}-1' <%-- onclick='check_click(${ temp + 3},1)'  --%><c:if test="${result.gbKindCd eq  '선급금'}">checked</c:if>/>
														<label for='check${ temp + 3}-1' class='cursorP'></label>
														<input type='hidden' name='ppGuarantyYN' <c:choose><c:when test="${result.gbKindCd eq '선급금'}">value="Y"</c:when><c:otherwise>value="N"</c:otherwise></c:choose>/>
													</td>
													<td>선급금 보증 증권 정보</td>
													<%-- <td id='step${ temp + 3}-1' style='visibility:hidden'>
														<input type='text' id='from${ temp + 3}' placeholder='from' class='calendar' name='ppGuarantyStartDt' <c:if test="${result.gbKindCd eq  '선급금'}">value="${displayUtil.displayDate(result.gbStartDt) }"</c:if>/> ~ 
														<input type='text' id='to${ temp + 3}' placeholder='to' class='calendar' name='ppGuarantyEndDt' <c:if test="${result.gbKindCd eq  '선급금'}">value="${displayUtil.displayDate(result.gbEndDt) }"</c:if>/>
													</td>
													<td id='step${ temp + 3}-2' style='visibility:hidden'>
														<input type='checkbox' class='tCheck' name='ppGbIssueCheck' id='check${ temp + 3}-2' onclick='check_click(${ temp + 3},2)' <c:if test="${result.gbKindCd eq  '선급금' && result.gbIssueYn eq 'Y'}">checked</c:if>/>
														<label for='check${ temp + 3}-2' class='cursorP'></label>
														<input type='hidden' name='ppGbIssueYn' value='N' <c:choose><c:when test="${result.gbKindCd eq '선급금' && result.gbIssueYn eq 'Y'}">value="Y"</c:when><c:otherwise>value="N"</c:otherwise></c:choose>/>
													</td>
													<td id='step${ temp + 3}-3' style='visibility:hidden'>완료</td>
													<td id='step${ temp + 3}-4' style='visibility:hidden'>
														<input type='text' id='publishDt${ temp + 3}' title='발행 일자' placeholder='발행 일자' class='calendar' name='ppGbPublishDt' <c:if test="${result.gbKindCd eq  '선급금' && result.gbIssueYn eq 'Y'}">value="${displayUtil.displayDate(result.gbPublishDt) }"</c:if>/>&nbsp;&nbsp;
														<input type='text' id='amount${ temp + 3}' placeholder='금액' amountOnly class='amount' width='177px' name='ppGuarantyAmount' <c:if test="${result.gbKindCd eq  '선급금' && result.gbIssueYn eq 'Y'}">value="${displayUtil.commaStr(result.gbAmount) }"</c:if>/>
													</td> --%>
												</tr>
											</c:if>
										</c:forEach>
										<tr class='ftw200 nData${temp+3 }'>
											<td>
												<input type='hidden' name='ppGbKey' id='ppGbKey${status.count }' />
												<input type='checkbox' class='tCheck' name='ppGuarantyCheck' id='check${ temp + 3}-1' <%-- onclick='check_click(${ temp + 3},1)'  --%>/>
												<label for='check${ temp + 3}-1' class='cursorP'></label>
												<input type='hidden' name='ppGuarantyYN' />
											</td>
											<td>선급금 보증 증권 정보</td>
											<%-- <td id='step${ temp + 3}-1' style='visibility:hidden'>
												<input type='text' id='from${ temp + 3}' placeholder='from' class='calendar' name='ppGuarantyStartDt' /> ~ 
												<input type='text' id='to${ temp + 3}' placeholder='to' class='calendar' name='ppGuarantyEndDt' />
											</td>
											<td id='step${ temp + 3}-2' style='visibility:hidden'>
												<input type='checkbox' class='tCheck' name='ppGbIssueCheck' id='check${ temp + 3}-2' onclick='check_click(${ temp + 3},2)' />
												<label for='check${ temp + 3}-2' class='cursorP'></label>
												<input type='hidden' name='ppGbIssueYn' value='N' />
											</td>
											<td id='step${ temp + 3}-3' style='visibility:hidden'>완료</td>
												<td id='step${ temp + 3}-4' style='visibility:hidden'>
												<input type='text' id='publishDt${ temp + 3}' title='발행 일자' placeholder='발행 일자' class='calendar' name='ppGbPublishDt' />&nbsp;&nbsp;
												<input type='text' id='amount${ temp + 3}' placeholder='금액' amountOnly class='amount' width='177px' name='ppGuarantyAmount' />
											</td> --%>
										</tr>
										<c:forEach var="result" items="${guarantyList }" varStatus="status">
											<c:if test="${entry.salesKey eq result.salesKey && result.gbKindCd eq '하자'}">
												<script>fn_remove('nData${temp+2}');</script>
												<tr class='ftw200'>
													<td>
														<input type='hidden' name='dfGbKey' id='dfGbKey${status.count }' <c:if test="${result.gbKindCd eq  '하자'}">value='${result.gbKey }'</c:if> />
														<input type='checkbox' class='tCheck' name='dfGuarantyCheck' id='check${ temp + 2}-1' <%-- onclick='check_click(${ temp + 2},1)'  --%><c:if test="${result.gbKindCd eq  '하자'}">checked</c:if>/>
														<label for='check${ temp + 2}-1' class='cursorP'></label>
														<input type='hidden' name='dfGuarantyYN' <c:choose><c:when test="${result.gbKindCd eq '하자'}">value="Y"</c:when><c:otherwise>value="N"</c:otherwise></c:choose> />
													</td>
													<td>하자 보증 증권 정보</td>
													<%-- <td id='step${ temp + 2}-1' style='visibility:hidden'>
														<input type='text' id='from${ temp + 2}' placeholder='from' class='calendar' name='dfGuarantyStartDt' <c:if test="${result.gbKindCd eq  '하자'}">value="${displayUtil.displayDate(result.gbStartDt) }"</c:if>/> ~  
														<input type='text' id='to${ temp + 2}' placeholder='to' class='calendar' name='dfGuarantyEndDt' <c:if test="${result.gbKindCd eq  '하자'}">value="${displayUtil.displayDate(result.gbEndDt) }"</c:if>/>
													</td>
													<td id='step${ temp + 2}-2' style='visibility:hidden'>
														<input type='checkbox' class='tCheck' name='dfGbIssueCheck' id='check${ temp + 2}-2' onclick='check_click(${ temp + 2},2)' <c:if test="${result.gbKindCd eq  '하자' && result.gbIssueYn eq 'Y'}">checked</c:if>/>
														<label for='check${ temp + 2}-2' class='cursorP'></label> 
														<input type='hidden' name='dfGbIssueYn' <c:choose><c:when test="${result.gbKindCd eq '하자' && result.gbIssueYn eq 'Y'}">value="Y"</c:when><c:otherwise>value="N"</c:otherwise></c:choose>/>
													</td>
													<td id='step${ temp + 2}-3' style='visibility:hidden'>완료</td>
													<td id='step${ temp + 2}-4' style='visibility:hidden'>
														<input type='text' id='publishDt${ temp + 2}' title='발행 일자' placeholder='발행 일자' class='calendar' name='dfGbPublishDt' <c:if test="${result.gbKindCd eq  '하자' && result.gbIssueYn eq 'Y'}">value="${displayUtil.displayDate(result.gbPublishDt) }"</c:if> />&nbsp;&nbsp;
														<input type='text' id='amount${ temp + 2}' placeholder='금액' amountOnly class='amount' width='177px' name='dfGuarantyAmount' <c:if test="${result.gbKindCd eq  '하자' && result.gbIssueYn eq 'Y'}">value="${displayUtil.commaStr(result.gbAmount) }"</c:if>/>
													</td> --%>
												</tr>
											</c:if>
										</c:forEach>
										<tr class='ftw200 nData${temp+2 }'>
											<td>
												<input type='hidden' name='dfGbKey' id='dfGbKey${status.count }'  />
												<input type='checkbox' class='tCheck' name='dfGuarantyCheck' id='check${ temp + 2}-1' <%-- onclick='check_click(${ temp + 2},1)' --%> />
												<label for='check${ temp + 2}-1' class='cursorP'></label>
												<input type='hidden' name='dfGuarantyYN'  />
											</td>
											<td>하자 보증 증권 정보</td>
											<%-- <td id='step${ temp + 2}-1' style='visibility:hidden'>
												<input type='text' id='from${ temp + 2}' placeholder='from' class='calendar' name='dfGuarantyStartDt' /> ~  
												<input type='text' id='to${ temp + 2}' placeholder='to' class='calendar' name='dfGuarantyEndDt' />
											</td>
											<td id='step${ temp + 2}-2' style='visibility:hidden'>
												<input type='checkbox' class='tCheck' name='dfGbIssueCheck' id='check${ temp + 2}-2' onclick='check_click(${ temp + 2},2)' />
												<label for='check${ temp + 2}-2' class='cursorP'></label> 
												<input type='hidden' name='dfGbIssueYn' />
											</td>
											<td id='step${ temp + 2}-3' style='visibility:hidden'>완료</td>
											<td id='step${ temp + 2}-4' style='visibility:hidden'>
												<input type='text' id='publishDt${ temp + 2}' title='발행 일자' placeholder='발행 일자' class='calendar' name='dfGbPublishDt'  />&nbsp;&nbsp;
												<input type='text' id='amount${ temp + 2}' placeholder='금액' amountOnly class='amount' width='177px' name='dfGuarantyAmount' />
											</td> --%>
										</tr>
									</table> 
									<c:set var="temp" value="${temp + 3}"/>
									<c:set var="length" value="${length + 1 }" />
								<%-- </c:forEach>   --%>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="btnWrap floatR">
					<div class="floatL btnPrev">
						<button type="button" onclick="fn_prevView();"><img src="<c:url value='/images/btn_prev.png'/>" /></button>
					</div>
					<div class="floatL btnSave">
						<button type="button" id="altMail" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<div class="floatR">
						<button type="button" onclick="javascript:fn_next('orderInfo')"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</form:form>
		<form id="infoForm" name="infoForm">
			<input type="hidden" name="pjKey" id="pjKey" value="<c:out value="${pjKey}"/>" />
			<input type="hidden" name="salesCtFkKey" value="<c:out value="${pjKey}"/>" />
			<input type="hidden" id="turnNo" value="<c:out value="${length}"/>"/>
			<input type="hidden" name="statusCd" value="PJST2000" />
		</form>
	</div>
</body>
</html>