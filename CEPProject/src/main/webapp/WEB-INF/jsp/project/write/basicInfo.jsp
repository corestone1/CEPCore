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
		.popContainer .contents select {
			width: 200px;
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
		.popContainer .contents input {
			width: calc(100% - 20px);
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 3px;
		}
		.popContainer .contents input[class="search"] {
			width: 177px;
			height: 38px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class="pname"] {
			width: 400px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 177px;
			height: 40px;
			background-image: url('/images/icon_calendar.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 160px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		.popContainer .contents td.btnFc {			
			padding-bottom: 12px;
		}		
		.popContainer .contents td.tdTitle {
			margin-top: 11px;
			font-size: 14px;
			color: #525252;
			padding-right: 20px;
			width: 13%;
		}
		.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
		}
		.popContainer .contents td.tdContents {
			width: 87%;
			font-size: 14px;
		} 
		.ui-datepicker.ui-widget-content {
			z-index: 102 !important;
		 }
	</style>
	<script>
		function fn_chkVali() {
			if ($("#infoForm")[0].checkValidity()){
	            if ($("#infoForm")[0].checkValidity()){
	               //필수값 모두 통과하여 저장 프로세스 호출.
	               fn_saveNext('contractInfo');
	            } else {
	                $("#infoForm")[0].reportValidity();   
	            }            
	            
	         }  else {
	             //Validate Form
	              $("#infoForm")[0].reportValidity();   
	         }
		}
		
		function fn_saveNext(link) {
			var object = {};
			var formData = $("#infoForm").serializeArray();
			var form = document.infoForm;
			
			for (var i = 0; i<formData.length; i++){
			    object[formData[i]['name']] = formData[i]['value'];
			    if("pjStartDt" == formData[i]['name'] || "pjEndDt" == formData[i]['name']) {
                	//날짜 - 제거
                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }     
			 }
			
			var sendData = JSON.stringify(object);
			
			if($('#pjKey').val() != "" || $('#pjKey').val().length != 0) {
				var url = '/project/write/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
						"pjKey" : $('#pjKey').val()
				};
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
			} else {
				$.ajax({
					url:"/project/insert/basicInfo.do",
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
				    		var url = '/project/write/'+link+'.do';
							var dialogId = 'program_layer';
							var varParam = JSON.parse(JSON.stringify(response));
							var button = new Array;
							button = [];
							showModalPop(dialogId, url, varParam, button, '', 'width:1125px;height:673px'); 
				    	}
				    },
					error: function(request, status, error) {
						if(request.status != '0') {
							alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
						}
					} 
				});  
			}
		}
	
		function fn_viewPopup(){
			window.open('/project/popup/list.do','project_list','width=1000px,height=400,left=600'); 
		}
		
		var acDirectorList;
		
		$(document).ready(function() {
			
			if(!($('#acKey').val() == "")) {
				fn_selectAc();
			}
			
			/* 고객사 선택하면 고객담당자 정보 가져오기. */
			$('#acKey').change(function(){				
				fn_selectAc();
			}); 
			
			/* 고객담당자 선택하면 고객담당자 정보 변경하기  */			
			$('#acDirectorKey').change(function(){
				var checkVal = $('#acDirectorKey option:selected').val();
				
				if(acDirectorList.length>0){
					for ( var idx = 0 ; idx < acDirectorList.length ; idx++ ) {
						if(checkVal == acDirectorList[idx].acDirectorKey ){
							$('#acDirectorInfo').val(acDirectorList[idx].acDirectorInfo);
							break;
						}
					}					
				}				
			});
		});
		
		function fn_selectAc() {
			 $.ajax({
	        	url:"/cmm/selectAcDirectorList.do",
	            dataType: 'json',
	            type:"post",  
	            data: $('#acKey').val(),
	     	   	contentType: "application/json; charset=UTF-8",
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		//xhr.setRequestHeader(header, token);
	        	},
	            success:function(data){		            	
					if ( data.result.length > 0 ) {
						acDirectorList = data.result;/* 값이 있는 경우  전역변수에 넣는다. */
						$('#acDirectorInfo').val(data.result[0].acDirectorInfo);/* 첫번째 값을 셋팅해준다. */
						$ ('#acDirectorKey' ).find ( 'option' ).remove (); /* select box 의 ID 기존의  option항목을 삭제 */
						for ( var idx = 0 ; idx < data.result.length ; idx++ ) {
							if(data.result[idx].acDirectorKey == "${resultList[0].acDirectorKey}") {
								$('#acDirectorKey').append("<option value='"+data.result[idx].acDirectorKey+"' selected>" + data.result[idx].acDirectorNm + '</option>');
							} else {
								$('#acDirectorKey').append("<option value='"+data.result[idx].acDirectorKey+"'>" + data.result[idx].acDirectorNm + '</option>');
							}
						}
	                } else{
	                	acDirectorList = null;
						$ ( '#acDirectorKey' ).find('option').remove();
	                 	$ ( '#acDirectorKey' ).append ( "<option value=''>담당자</option>" );
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
	<form:form commandName="infoForm" id="infoForm" name="infoForm" method="post">
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">프로젝트 등록</div>
				</div>
			</div>
			<div class="left">
				<ul class="ftw400">
					<li >기본정보</li>
				</ul>
			</div>
			<div class="contents">
				<input type="text" id="id" style="border: 1px solid #000; width: 200px;"/>
				<input type="text" id="no" style="border: 1px solid #000; width: 200px;"/>
				<input type="hidden" id="dialogId" />
				<input type="hidden" id="spKey" name="spKey" />
				<input type="hidden" id="pjKey" name="pjKey" value="<c:out value="${pjKey}"/>"/>
				<div>  
					<table>
						<tr>
							<td class="btnFc" colspan="2"><button type="button" onclick="fn_viewPopup();"><img src="<c:url value='/images/forecast_icon.png'/>" /></button></td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>프로젝트명</td>
							<td class="tdContents"><input type="text" name="pjNm" value="<c:out value="${resultList[0].pjNm}"/>" required/></td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>고객사</td>
							<td class="tdContents">
								<input type="text" class="search" name="acKey" id="acKey" value="<c:out value="${resultList[0].acKey}"/>" required/>	
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>고객사담당자</td>
							<td class="tdContents">
								<select name="acDirectorKey" id="acDirectorKey">
									<%-- <c:forEach var="emp" items="${empList}" varStatus="status">
										<option <c:if test="${resultList[0].acDirectorKey == emp.empKey }">selected</c:if> value="${emp.empKey}">${emp.empNm}</option>
									</c:forEach> --%>
								</select>				
								<input type="text" class="pname"  id="acDirectorInfo" value="차장/ 010-1234-5678 / hong@naver.com" readonly/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>영업담당자</td>
							<td class="tdContents">
								<select name="pjSaleEmpKey">
									<c:forEach var="emp" items="${empList}" varStatus="status">										
										<option <c:if test="${resultList[0].pjSaleEmpKey == emp.empKey }">selected</c:if> value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
									</c:forEach>	
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>지원담당자</td>
							<td class="tdContents">
								<select name="pjSupportEmpKey">
									<c:forEach var="emp" items="${empList}" varStatus="status">										
										<option <c:if test="${resultList[0].pjSupportEmpKey == emp.empKey }">selected</c:if> value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
									</c:forEach>	
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>사업기간</td>
							<td class="tdContents">
								<input type="text" placeholder="from" class="calendar fromDt" name="pjStartDt" value="<c:out value="${resultList[0].pjStartDt}"/>" required /> ~ 
								<input type="text" placeholder="to" class="calendar toDt" name="pjEndDt" value="<c:out value="${resultList[0].pjEndDt}"/>" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">비고</td>
							<td class="tdContents"><textarea name="remark"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="btnWrap floatR">
					<div class="floatL">
						<button ><img src="<c:url value='/images/btn_file.png'/>" /></button>
					</div>
					<div class="floatR">
						<button type="button" onclick="javascript:fn_chkVali()"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>