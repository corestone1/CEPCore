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
			width: 162px;
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
			width: 140px;
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
			width: 140px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: calc(100% - 20px);
			height: 117px;
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
		/**
		*  화면을 이동시킨다.
		*  @param {string} varUrl 이동해야할 url
		*/
		function fn_addView(varUrl) {
		/* 	document.mtBasicForm.action = "/maintenance/writeMtBasicInfo.do";
			document.mtBasicForm.method="post";
			alert(1111);
           	document.mtBasicForm.submit();  */
           	
           	var object = {};
            var fromData = $("#mtBasicForm").serializeArray();
            for (var i = 0; fromData < fromData.length; i++){
              
              object[fromData[i]['name']] = fromData[i]['value'];
           }
            var sendData = JSON.stringify(object);
            
           	$.ajax({
	        	url:"/maintenance/writeMtBasicInfo.do",
	            /* dataType: 'json', */
	            type:"post",  
	            data: sendData,
	     	   	contentType: "application/json; charset=UTF-8",
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		//xhr.setRequestHeader(header, token);
	        	},
	            success:function(data){		        
	            	var url = '/maintenance/'+varUrl+'.do';
	    			var dialogId = 'program_layer';
	    			var varParam = {

	    			}
	    			var button = new Array;
	    			button = [];
	    			// /* showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  */
	    			showModalPop(dialogId, url, data, button, '', 'width:1144px;height:708px');
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        }); 
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
			
			$('#sbCtYn').change(function(){
				
				if("Y" == $('#sbCtYn option:selected').val()){
					$('#back_order').show();
					$('#back_buy').show();
				} else {
					$('#back_order').hide();
					$('#back_buy').hide();
				}
				
			});
			
			var acDirectorList; // 고객 담당자 정보 리스트

			/* 고객사 선택하면 고객담당자 정보 가져오기. */
			$('#mtAcKey').change(function(){				
		        $.ajax({
		        	url:"/maintenance/selectAcDirectorList.do",
		            dataType: 'json',
		            type:"post",  
		            data: $('#mtAcKey').val(),
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
                        		$ ('#acDirectorKey' ).append ( "<option value='"+data.result[idx].acDirectorKey+"'>" + data.result[idx].acDirectorNm + '</option>' );
                      		}
		                }else{
		                	acDirectorList = null;
							$ ( '#acDirectorKey' ).find ( 'option' ).remove ();
		                 	$ ( '#acDirectorKey' ).append ( "<option value=''>담당자</option>" );
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
					<div class="floatL ftw500">유지보수 등록</div>
				</div>
			</div>
			<div class="left">
				<ul class="ftw400">
					<li class="colorWhite cursorP on">기본정보</li>
					<li class="colorWhite cursorP" onclick="fn_addView('writeMtProductInfo');">제품정보</li>
					<li class="colorWhite cursorP" onclick="fn_addView('writeMtSalesInfo');">매출정보</li>
					<li id="back_order" class="colorWhite cursorP" style="display:none">발주정보</li>
					<li id="back_buy" class="colorWhite cursorP" style="display:none">매입정보</li>
				</ul>
			</div>
			<div class="contents">
				<div>
					<table>
						<tr>
							<td class="btnFc" colspan="6"><button><img src="<c:url value='/images/forecast_icon.png'/>" /></button></td>
						</tr>
						<tr>
							<td class="tdTitle">프로젝트명</td>
							<td class="tdContents" colspan="5">
								<input type="text" name="mtNm"/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">고객사</td>
							<td class="tdContents" colspan="5">
								<input type="text" name="mtAcKey" id="mtAcKey" class="search" />	
							</td>
						</tr>
						<tr>
							<td class="tdTitle">고객사담당자</td>
							<td class="tdContents" colspan="5">
								<select id="acDirectorKey" name="acDirectorKey" >
									<option value="">선택</option>
									<%-- <c:forEach var="director" items="${acDirectorList}" varStatus="status">										
									<option value="<c:out value="${director.directorKey}"/>"><c:out value="${director.directorNm}"/></option>
									</c:forEach> --%>									
								</select>			
								<input type="text" id="acDirectorInfo" class="pname" readonly/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">관리담당자</td>
							<td class="tdContents">
								<select name="mngEmpKey">
									<c:forEach var="emp" items="${empList}" varStatus="status">										
									<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
									</c:forEach>	
								</select>
							</td>
							<td class="tdSubTitle">지원담당</td>
							<td class="tdContents">
								<select name="supportEmpKey">
									<c:forEach var="emp" items="${empList}" varStatus="status">										
									<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
									</c:forEach>	
								</select>
							</td>
							<td class="tdSubTitle">영업담당</td>
							<td class="tdContents">
								<select name="saleEmpKey">
									<c:forEach var="emp" items="${empList}" varStatus="status">										
									<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
									</c:forEach>	
								</select>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">계약일자</td>
							<td class="tdContents">
								<input type="text" name="ctDt" class="calendar fromDt" />
							</td>
							<td class="tdSubTitle">유지보수기간</td>
							<td class="tdContents" colspan="3">
								<input type="text" name="startDt" placeholder="from" class="calendar fromDt" /> ~ 
								<input type="text" name="endDt" placeholder="to" class="calendar toDt" />
							</td>
						</tr>
						<tr>
							<td class="tdTitle">유지보수금액</td>
							<td class="tdContents">
								<input type="text"  name="amount" style="width: 140px"/>
							</td>
							<td class="tdSubTitle">검수방법</td>
							<td class="tdContents">
								<select name="imCd">
									<option value="온라인">온라인</option>
									<option value="오프라인">오프라인</option>
								</select>
							</td>
							<td class="tdSubTitle">백계약유무</td>
							<td class="tdContents">
								<select id="sbCtYn" name="sbCtYn">
									<option value="N">N</option>
									<option value="Y">Y</option>
								</select>
							</td>
						</tr>	
						<tr>
							<td class="tdTitle">결제조건</td>
							<td class="tdContents">
								<input type="text"  name="payTerms" style="width: 140px"/>
							</td>
							<td class="tdSubTitle">보증증권유무</td>
							<td class="tdContents">
								<select name="gbYn" id="gbYn">
									<option value="N">N</option>
									<option value="Y">Y</option>
								</select>
								
							</td>
							<td colspan="3">
								<button type="button" id="file_upload" style="display:none"><img src="<c:url value='/images/btn_file_upload.png'/>" /></button>
							</td>
						</tr>
						<tr>
							<td class="tdTitle veralignT">비고</td>
							<td class="tdContents" colspan="5"><textarea name="remark"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="btnWrap floatR">
					<div class="floatL">
						<button ><img src="<c:url value='/images/btn_file.png'/>" /></button>
					</div>
					<div class="floatR" onclick="fn_addView('writeMtProductInfo');">
						<button type="button"><img src="<c:url value='/images/btn_next.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>	
	</form:form> 
</body>
</html>