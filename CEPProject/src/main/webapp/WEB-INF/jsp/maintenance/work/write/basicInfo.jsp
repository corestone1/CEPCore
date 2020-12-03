<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
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
			width: calc(100% - 80px);
			margin: 10px 40px 15px 40px;
		}
		.popContainer .contents > div:first-child {
			min-height: 519px;
		}
		.popContainer .contents > div > table {
			border-collapse: separate;
	  		border-spacing: 0 3px;
		}
		/* .popContainer .contents > div > table tr:first-child td {
			margin-bottom: 100px;
		} */
		.popContainer .contents select {
			width: 178px;
			height: 38px;
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
			width: calc(100% - 20px);
			height: 38px;
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents input[class="pname"] {
			width: 300px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
		}
		.popContainer .contents input[class^="calendar"] {
			width: 155px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 109px;
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
			width: 99px;
		}					
		.popContainer .contents td.tdSubTitle {
		    margin-top: 11px;
		    font-size: 14px;
		    color: #525252;
		    padding-right: 9px;
		    padding-left: 19px;
		    width: 75px;
		}	
		.popContainer .contents td.tdContents {
			width: 178px;
			font-size: 14px;
		} 
	</style>
	<script>
		function fn_saveBtn(){
			document.mtBasicForm.action = "/maintenance/work/workList.do";
			document.mtBasicForm.method="get";
           	document.mtBasicForm.submit(); 
           	
		}
		function fn_saveNextBtn(param){
/* 			var url = '/maintenance/writeMtWorkOrderInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {

			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');   */
			
			
			var object = {};
           	var formData = $("#mtBasicForm").serializeArray();
           	console.log("formData===>"+formData);
           	for (var i = 0; i<formData.length; i++){
                
                object[formData[i]['name']] = formData[i]['value'];
             }
           	var sendData = JSON.stringify(object);
           	
           	 $.ajax({
	        	url:"/maintenance/work/write/basicInfo.do",
	            dataType: 'text', 
	            type:"post",  
	            data: sendData,
	            
	     	   	contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);	        		
	        	},
	            success:function(data){	
	            	var paramData = JSON.parse(data);
	            	
	            	console.log("paramData===>"+paramData);
	            	console.log("data.mtWorkKey==>"+paramData.mtWorkKey);
	            	if("Y" == paramData.successYN){
	            		alert("유지보수기본정보 등록을 성공하였습니다.")
		            	if('sn'==param){
		            		var url;
		            		if("Y" == $('#mtWorkPmYn option:selected').val()){
		            			//유지보수작업 제품등록화면으로 이동
		            			url = '/maintenance/work/write/productInfoView.do';
		            		} else {
		            			//유지보수작업 발주 등록화면으로 이동
		            			url = '/maintenance/work/write/orderInfoView.do';
		            		}
		            		console.log("url===>"+url);
			    			var dialogId = 'program_layer';
			    			var varParam = paramData
			    			var button = new Array;
			    			button = [];
			    			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		            	} else {
		            		document.listForm.action = "/maintenance/work/workList.do";
		        			document.listForm.method="get";
		                   	document.listForm.submit(); 
		            	}
	            	} else {
	            		alert("유지보수기본정보 등록이 실패하였습니다.");
	            	}
	            	
	            	
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        }
           	 
           	);
           	
		}
		
		$(function(){
			$('#gbYn').change(function(){
				/* alert($('#gbYn option:selected').val()); */
				
				if("Y" == $('#gbYn option:selected').val()){
					$('#file_upload').show();
				} else {
					$('#file_upload').hide();
				}
				
			});
			
			//추가발주유무에 의한 버튼 및 메뉴 display조정
			$('#mtWorkOrderYn').change(function(){				
				//왼쪽 발주 정보 보이고 안보이고
				if("Y" == $('#mtWorkOrderYn option:selected').val()){
					$('#work_order').show();
				} else {
					$('#work_order').hide();
				}
				
				//버튼 저장 또는 저장&계속 입력
				if("N" == $('#mtWorkPmYn option:selected').val() && "N" == $('#mtWorkOrderYn option:selected').val()){
					$('#saveNextBtn').hide();
					$('#saveBtn').show();
				} else {
					$('#saveNextBtn').show();
					$('#saveBtn').hide();					
				}				
			});
			
			//제품등록유무에 의한 버튼 및 메뉴 display조정
			$('#mtWorkPmYn').change(function(){			
				console.log("mtIntegrateKey====>"+$('#mtWorkPmYn').val());
				//왼쪽 발주 정보 보이고 안보이고
				if("Y" == $('#mtWorkPmYn option:selected').val()){
					$('#work_product').show();
				} else {
					$('#work_product').hide();
				}
				
				//버튼 저장 또는 저장&계속 입력
				if("N" == $('#mtWorkPmYn option:selected').val() && "N" == $('#mtWorkOrderYn option:selected').val()){
					$('#saveNextBtn').hide();
					$('#saveBtn').show();
				} else {
					$('#saveNextBtn').show();
					$('#saveBtn').hide();					
				}				
			});
			
			var acDirectorList; // 고객 담당자 정보 리스트

			/* 프로젝트 key를 이용하여  고객사명, 담당자 리스트 가져오기.. */
			$('#mtIntegrateKey').change(function(){	
		        $.ajax({
		        	url:"/maintenance/work/selectMtCustomerInfo.do",
		            dataType: 'json',
		            type:"post",  
		            data: $('#mtIntegrateKey').val(),
		     	   	contentType: "application/json; charset=UTF-8",
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);
		        		//xhr.setRequestHeader(header, token);
		        	},
		            success:function(data){		            
		            	acDirectorList = null;
						$('#mtAcNm').val(data.basicContractInfo.mtAcNm);
						if ( data.acDirectorList.length > 0 ) {
							acDirectorList = data.acDirectorList;/* 값이 있는 경우  전역변수에 넣는다. */
							
							$('#acDirectorInfo').val(data.acDirectorList[0].acDirectorInfo);/* 첫번째 값을 셋팅해준다. */
							$ ('#mtWorkAcDirectorKey' ).find ( 'option' ).remove (); /* select box 의 ID 기존의  option항목을 삭제 */
							for ( var idx = 0 ; idx < data.acDirectorList.length ; idx++ ) {
                        		$ ('#mtWorkAcDirectorKey' ).append ( "<option value='"+data.acDirectorList[idx].acDirectorKey+"'>" + data.acDirectorList[idx].acDirectorNm + '</option>' );
                      		}
		                }else{
		                	acDirectorList = null;
							$ ( '#mtWorkAcDirectorKey' ).find ( 'option' ).remove ();
		                 	$ ( '#mtWorkAcDirectorKey' ).append ( "<option value=''>담당자</option>" );
		                }
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		        });
				
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
		
		
	</script>
</head>
<body>
	<form:form commandName="mtContractVO" id="mtBasicForm" name="mtBasicForm" method="post">		
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">유지보수작업 등록</div>
				</div>
			</div>
			<div class="left">
				<ul class="ftw400">
					<li class="colorWhite cursorP on">기본정보</li>
					<li id="work_product" class="colorWhite cursorP" style="display:none">제품정보</li>
					<li id="work_order" class="colorWhite cursorP" style="display:none">발주정보</li>
				</ul>
			</div>
			<div class="contents">
				<div>
					<table>
						<tr>
							<td class="tdTitle">프로젝트명</td>
							<td class="tdContents" colspan="5">
								<!-- <input type="text" id="mtNm" name="mtNm" class="search"/>
								<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" /> -->
								<input type="text" id="mtIntegrateKey" name="mtIntegrateKey" class="search"/>
								<input type="hidden" id="mtNm" name="mtNm" />
							</td>
						</tr>
						<tr>
							<td class="tdTitle">고객사</td>
							<td class="tdContents" colspan="5">
								<input type="text" id="mtAcNm" class="pname"  readonly/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">고객사담당자</td>
							<td class="tdContents" colspan="5">
								<select id="mtWorkAcDirectorKey" name="mtWorkAcDirectorKey" >
									<option value="">선택</option>
									<%-- <c:forEach var="director" items="${acDirectorList}" varStatus="status">										
									<option value="<c:out value="${director.directorKey}"/>"><c:out value="${director.directorNm}"/></option>
									</c:forEach> --%>									
								</select>			
								<input type="text" id="acDirectorInfo" class="pname" readonly/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">지원담당</td>
							<td class="tdContents" >
								<select name="mtWorkEmpKey">
									<c:forEach var="emp" items="${empList}" varStatus="status">										
									<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
									</c:forEach>	
								</select>
							</td>
							<td class="tdSubTitle">작업유형</td>
							<td class="tdContents" colspan="3">
								<select name="mtWorkTypeCd">
									<option value="정기점검">정기점검</option>
									<option value="장애처리">장애처리</option>
									<option value="기술지원">기술지원</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">작업기간</td>
							<td class="tdContents" colspan="5">
								<input type="text" name="mtWorkStartDt" placeholder="from" class="calendar fromDt" />&nbsp;<input type="text" name="mtWorkStartTm" style="width: 50px" />&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; 
								<input type="text" name="mtWorkEndDt" placeholder="to" class="calendar toDt" />&nbsp;<input type="text" name="mtWorkEndTm" style="width: 50px" />
							</td>
						</tr>
						<tr>
							<td class="tdTitle">조치결과</td>
							<td class="tdContents">
								<select name="mtWorkResultCd">
									<option value="준비">준비</option>
									<option value="진행">진행</option>
									<option value="완료">완료</option>
								</select>
							</td>
							<td class="tdSubTitle">제품등록유무</td>
							<td class="tdContents">
								<select id="mtWorkPmYn"  name="mtWorkPmYn">
									<option value="N">N</option>
									<option value="Y">Y</option>
								</select>
							</td>
							<td class="tdSubTitle">추가발주유무</td>
							<td class="tdContents">
								<select id="mtWorkOrderYn" name="mtWorkOrderYn">
									<option value="N">N</option>
									<option value="Y">Y</option>
								</select>
							</td>
						</tr>	
						<tr>
							<td class="tdTitle veralignT">지원내용</td>
							<td class="tdContents" colspan="5"><textarea name="mtWorkCont"></textarea></td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">비고</td>
							<td class="tdContents" colspan="5"><textarea name="remark"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="btnWrap floatR">
					<div id="saveBtn" class="floatR" onclick="fn_saveNextBtn('ss');">
						<button type="button"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<div id="saveNextBtn" class="floatR" onclick="fn_saveNextBtn('sn');" style="display:none">
						<button type="button"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>	
	</form:form>
	
</body>
</html>