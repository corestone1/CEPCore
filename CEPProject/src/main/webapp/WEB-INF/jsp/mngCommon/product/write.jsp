<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		.popContainer .contents {
			position: absolute;
			width: 698px;
			height: 561px;
			top: 107px;
			z-index: 3;
			background-color: #f6f7fc;
			/* overflow-y: auto; */
		}
		.popContainer .contents > div {
			width: 100%;
		}
		.popContainer .contents > div:first-child {
			width: 711px;
			min-height: 408px;
			margin: 10px 40px 15px 40px;
		}
		
		.popContainer .contents > div:last-child {
			width: 433px;
			margin-right: 50px;
		}
		.popContainer .contents > div > table {
			border-collapse: separate; 
	  		border-spacing: 0 3px;
		}
		.popContainer .contents select {
			width: 247px;
			height: 38px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
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
			width: 225px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.popContainer .contents textarea {
			width: 487px;
			height: 83px;
			border: 1px solid #e9e9e9;
			padding: 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 0px;
			resize: none;
		}
		
		.popContainer .contents td.tdTitle {
		    margin-top: 11px;
		    font-size: 14px;
		    color: #000;
		    padding-right: 20px;
		    width: 16%;
		    font-weight: 200;
    	}
    	
    	.popContainer .contents td.tdTitle label {
			color: red;
			vertical-align: middle;
		}
    	
		.popContainer .contents td.tdContents {
			font-size: 14px;
			width: 508px;
		} 
		
		#m_div_accountList {
			left: 137px;
    		margin-top: -7px;
		}
		
	</style>
	
	
	<script>
				
		$(document).ready(function() {
			
			var fnChangePmDetailClass = function(pstPmClassCd){
				//alert("pstPmClassCd : " + pstPmClassCd);
				
				var jsonData = {'cdUpCd' : pstPmClassCd};
				
				 $.ajax({
			        	url :"/mngCommon/code/list.do",
			        	type:"POST",  
			            data: jsonData,
			     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			     	    dataType: 'json',
			            async : false,
			        	success:function(data){		  
			        		//alert(data.codeList[0].cdNm);
			        		//select box 변경 function 
			        		fnChangeOption(data.codeList)
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
			    }); 
				
			};
			
			var fnChangeOption = function(pjPmDetailClass){
				var objectSlt = $('#m_slt_pmDetailClassCd');
				//제품상세구분 조회 후 Select Option 변경
				objectSlt.html("");
				
				//alert('pjPmDetailClass[0].cdNm : ' + pjPmDetailClass[0].cdNm);
				var pmDetailClassCd = "${productVO.pmDetailClassCd}";
				
				for(var i=0; i < pjPmDetailClass.length; i++)
				{
					var selected = "";					
					if(pmDetailClassCd == pjPmDetailClass[i].cdKey) {
						selected = "selected";
					}
					objectSlt.append("<option value='" + pjPmDetailClass[i].cdKey + "' "+selected+">" + pjPmDetailClass[i].cdNm + "</option>");	
				}
				
			};
			
			if($('#m_slt_pmClassCd').val().replace(" ","").length != 0) {
				//fnCHangePmDetailClass(this.value);
				fnChangePmDetailClass($("#m_slt_pmClassCd option:selected").val());
			}
			
			$('#m_slt_pmClassCd').change(function(){
				//fnCHangePmDetailClass(this.value);
				fnChangePmDetailClass($(this).val());
				
			});
			
			
			$('#m_btn_save').click(function(event){
				fn_chkVali();
			});
			
			
			//$("#m_ipt_mfAcKey").on("keyup", function(event){
			$("#m_ipt_acNm").on("keyup", function(event){
				//if(event.keyCode == 13) {
					//alert("검색 : " + this.value);
					fnSearchAccoutList(this, $(this).val());
				//}
					
			});
			
		});	
		
		
		var fnSearchAccoutList = function(pObject, pstAccountNm)
		{
			$('#m_div_accountList').remove();
		
			var jsonData = {'acNm' : pstAccountNm, 'acBuyYN' : 'Y'};
			
			 $.ajax({
		        	url :"/mngCommon/account/searchList.do",
		        	type:"POST",  
		            data: jsonData,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){		  
		        		//alert(data.accountList[0].acNm);
		        		//선택 목록 생성
		        		fnViewAccountList(pObject, data.accountList);
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    }); 
		};
		
		var fnViewAccountList = function(pObject, pjAccountList){
			var html = '<div id="m_div_accountList">'
			         + '<ul class="accountList">'
			       ;//+ '<div style="margin: 5px;">';
			       
			       for(var i=0; i < pjAccountList.length; i++)
			    	{
			    	   html += '<li id="m_li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>'
			    	        ;
			    	}
			       
			       
			    html +=  '</ul>'
			          + '</div>'
			         ;//+ '</div>';
			//$('#m_td_account').after(html);
			$('#m_tr_account').after(html);
			
			
			$("[id^='m_li_account']").click(function(event)
			{
				//alert(this.innerText);
				
				//$('#m_ipt_acNm').val(this.title); 
				//$('#m_ipt_mfAcKey').val(this.innerText);
				
				$('#m_ipt_acNm').val(this.innerText); 
				$('#m_ipt_mfAcKey').val(this.title);
				
				$('#m_div_accountList').remove();
			});
		};
		
		
		var fn_chkVali = function() {
			if ($("#m_frm_product")[0].checkValidity()){
	           //필수값 모두 통과하여 저장 프로세스 호출.
      		   fnSave();
	         }  else {
	             //Validate Form
	              $("#m_frm_product")[0].reportValidity();   
	         }
		}
		
		var fnSave = function(){
			
			var formData = $("#m_frm_product").serializeArray();
			
			$.ajax({
	        	url :"/mngCommon/product/write.do",
	        	type:"POST",  
	            data: formData,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		fnSaveEnd();
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	    	});  
			
		};
		
		var fnSaveEnd = function(){
			//완료 처리
		};
		
		
	</script>
</head>
<body>
	<form:form commandName="productVO" id="m_frm_product" name="productForm" method="post">		
		<div class="popContainer">
			<div class="top">
				<div>
					<div class="floatL ftw500">제품등록</div>
				</div>
			</div>
			<div class="contents">
				<div>
					<table>
						<tr>
							<td class="tdTitle"><label>*</label>구분</td>
							<td class="tdContents">
								<select name="pmClassCd" id="m_slt_pmClassCd" required>
									<option value="">구분</option>
									<c:forEach var="result" items="${PM_CLASS}" varStatus="status">
										<option <c:if test="${productVO.pmClassCd eq result.cdKey }" >selected </c:if>value='<c:out value="${result.cdKey}"/>'><c:out value="${result.cdNm}"/></option>
									</c:forEach>
								</select>
							</td>
						</tr>	
						
						<tr>
							<td class="tdTitle"><label>*</label>상세구분</td>
							<td class="tdContents">
								<select name="pmDetailClassCd" id="m_slt_pmDetailClassCd" required>
									<option value="">상세구분</option>
								</select>
							</td>
						</tr>
						
						<tr id="m_tr_account" >
							<td class="tdTitle"><label>*</label>제조사</td>
							<td id="m_td_account" class="tdContents">
								<!--
								<input type="text" id="m_ipt_mfAcKey" name="mfAcKey" class="search" placeholder="제조사" />
								 -->
								<input type="text"   id="m_ipt_acNm"    name="acNm" class="search" placeholder="제조사"  value="" required/> 
								<input type="hidden" id="m_ipt_mfAcKey" name="mfAcKey"/>
								
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>모델명</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_pmLineCd" name="pmLineCd" placeholder="모델명" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle"><label>*</label>세부모델명</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_pmNmCd" name="pmNmCd" placeholder="세부모델명" required/>
							</td>
						</tr>
						<tr>
							<td class="tdTitle">출시일</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_pmReleaseDt" name="pmReleaseDt" placeholder="출시일" class="calendar fromDt" />
							</td>
						</tr>
						<tr>
							<td class="tdTitle">EOL</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_eolDt" name="eolDt" placeholder="EOL" class="calendar fromDt" />
							</td>
						</tr>
						<tr>
							<td class="tdTitle">EOSS</td>
							<td class="tdContents">
								<input type="text" id="m_ipt_eossDt" name="eossDt" placeholder="EOSS" class="calendar fromDt" />
							</td>
						</tr>
						<tr>
							<td class="tdTitle">비고</td>
							<td class="tdContents"><textarea id="m_txa_pmRemark" name="pmRemark" placeholder="비고"></textarea></td>
						</tr>
					</table>
				</div>
				<div class="btnWrap floatR">
					<div id="m_btn_save" class="floatR" style="">
						<button type="button"><img src="<c:url value='/images/btn_save.png'/>" /></button>
					</div>
					<div class="floatN floatC"></div>
				</div>
			</div>
		</div>	
	</form:form>
	
</body>
</html>