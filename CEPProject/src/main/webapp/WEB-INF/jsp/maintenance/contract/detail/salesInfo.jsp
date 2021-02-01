<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<%@include file="../../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수계약 상세(매출정보)</title>
	<style>
		.sfcnt {
			height: 91px;
		}
		.bottom > div {
			margin-top: 22px;
		}
		.nav {
			width: 100%;
			height: 49px;
		}
		.mContentsWrap {
			background-color: #f6f7fc;
			box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);
			height: 802px;
		}
		.mContentsWrap .mContents {
			padding: 38px 71px; 
			width: 1662px;
		}
		.title {
			height: 50px;
		}
		.title > label {
			font-size: 26px;
		}
		.mContents > div:first-child {
			width: 37%;
		}
		.mContents > .fxd {
			width: 60%;
		}
		.mContents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 10px;
			margin-top: 30px;
		}
		.mContents .stitle2 {
			font-size: 17px;
			font-weight: 400;
			margin-bottom: 1px;
			margin-top: 26px;
		}
		.mContents .cg {
			color: #24a37e;
		}
		.mContents .stitle img {
			width: 27px;
			margin-left: 10px;
		}
		.mContents  table {
			border-collapse: collapse;
			font-size: 15px;
			table-layout: fixed;
			width: 614px;
		} 
		.mContents table tr td {
			padding: 13px 18px;
		}
		/* .mContents .bsc tr td:first-child {
			width: 124px;
			font-weight: 400;
			padding: 13px 20px 13px 45px;
		} 
		.mContents .bsc tr td:last-child {
			width: 400px;
			font-weight: 200;
		} */
		
		/* .mContents > div > div > div > table tr td:first-child {
			width: 124px;
			font-weight: 400;
			padding: 13px 20px 13px 45px;
		}  */
		/* .mContents > div > div > div > table tr td:last-child {
			width: 400px;
			font-weight: 200;
		} */
		.mContents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			border: 1px solid #bee2da;
		    border-bottom: 2px solid #bfe3db;
		}
		.mContents .bsc tbody {			
			height: 576px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.mContents .bsc tr td {
			color: #0e8a67;
		}
		.mContents .bsc tr td:first-child {
			box-shadow: inset -7px 0 9px -4px #d0e2de;			
			width: 153px;
			font-weight: 400;
			padding: 13px 13px 13px 13px;
		}
		.mContents .bsc tr td:last-child {
			width: 470px;
			font-weight: 200;
		}
		form .contents .bsc tr td label.file {
			text-decoration: underline;
		}
		.mContents .title ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		.mContents .title ul li:last-child {
			clear: both;
			float: none;
			width: 0 !important;
		}
		.mContents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
			background-color: #d3d3d3;
		}
		.mContents > .fxd .title ul li {
			width: 25%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
			border-radius: 35px;
		}
		.mContents > .fxd .title ul li > label {
			display: inline-block;
    		width: 100%;
    		/* cursor: pointer; */
		}
		.mContents > .fxd .title ul li.on,
		.mContents > .fxd .title ul li:hover  {
			color: #fff  !important;
			background-color: #4c3d92;
		}
		.mContents .dtlWrap {
			height: 493px;
			overflow-y: auto;
			overflow-x: hidden;
			border-bottom: 2px solid #c4c4c4;
		}
		.mContents .dtl {
			width: 997px;
			font-size: 14px;
			border-collapse: collapse;
			font-weight: 300;
			overflow: hidden;
		}
		.mContents .dtl.body {
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.mContents .dtl thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
			border-top: 4px solid #6a5baf;
		}
		.mContents .dtl thead tr {
			width: 997px;
			cursor: pointer;
		}
		/* .mContents .dtl tbody {
			width: 997px;
			height: 532px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			border-bottom: 2px solid #c4c4c4;
		} */
		.mContents .dtl tbody {
			float: left;
		}
		.mContents .dtl tbody tr {
			width: 997px;
			cursor: pointer;
		}
		.mContents .dtl tbody:hover {
			background-color: #ddf0ec;
		}
		.mContents .dtl thead th, .mContents .dtl tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
			width: 122px;
    		max-width: 122px;
		}
		/* .mContents .dtl tbody tr td {
			text-align: right !important;
			padding: 10px 10px !important;
		} */
		.mContents .dtl tbody tr td {
			font-weight: 200;
		}
		.mContents .dtl tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 84%;
			margin: 0 auto;
		}
		.mContents .dtl tbody tr td img {
			width: 13px;
			vertical-align: top;
		}
		.detailList li {
			float: left;
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
		}
		.detailList li:nth-child(2n-1) {
			width: 82px;
			font-weight: 400;
			color: #158566;
		}
		.detailList li:nth-child(2n) {
			width: 316px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		.detailList li:last-child {
			width: 734px;
   			height: 56px;
   			word-break: break-all;
   			white-space: normal;
   			overflow: auto;
   			line-height: 1.5;
		}
		
		#modBasicTable tr td:first-child {
			box-shadow: inset -7px 0 9px -4px #d0e2de;
			
			width: 132px;
			font-weight: 400;
			padding: 11px 8px 11px 17px;
		}
		#modBasicTable tr td:last-child {
			padding: 5px 20px;
			width: 463px;
		}
		#modBasicTable input[type="text"],
		#modBasicTable textarea {
			width: 401px; 
		    color: #0e8a67;
		}
		#modBasicTable textarea {
			color: #0e8a67;
			height: 105px;
			border: 1px solid #e6e6e6;
			padding: 0 10px;
			resize: none;
		}
		#modBasicTable select {
			height: 34px;
			font-size: 14px;
			width: 97px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    -webkit-appearance: none;
		    background: url(/images/arrow_down.png) no-repeat 91% 50%;
		    background-color: #fff;
		    color: #0e8a67;
		}
		#modBasicTable input[class^="calendar"] {
			width: 140px !important;
		}
		#modBasicTable input[class="search"] {
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		
		#modBasicTable input[class="pname"]{
			width: 305px;
			border : none;
			outline: none;
			background-color: #ddf0ec;
		}
		.stitle2 input[class="pname"]{
			width: 130px;
			border : none;
			outline: none;
			background-color: #f6f7fc;
			text-align: right;
			font-size: 17px;
			font-weight: 400;
		}
		input[type="text"] {
		 	width: 138px;
		    height: 34px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 4px;
		}
		input[class^="calendar"] {
		    background-image: url(/images/calendar_icon.png);
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		#modBasicTable tr td:first-child label {
			color: red;
			vertical-align: middle;
      	}
			
	    input[class="tCheck"]+ label {
	    	width: 24px !important;
	    	height: 24px !important;
	    }
      	.accountList li {
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
			font-size: 14px;
			color: #21a17e;
		}
	</style>
	<script>
		$(document).ready(function() {
			'<c:if test="${basicContractInfo != null }">'
				//고객사 담당자 셋팅
				$('#m_mtAcDirectorKey').val("${basicContractInfo.mtAcDirectorKey}").attr("selected", true);
				//관리담당자 셋팅
				$('#m_mtMngEmpKey').val("${basicContractInfo.mtMngEmpKey}").attr("selected", "true");
				//지원담당자 셋팅
				$('#m_mtSupportEmpKey').val("${basicContractInfo.mtSupportEmpKey}").attr("selected", "true");
				//영업담당자 셋팅
				$('#m_mtSaleEmpKey').val("${basicContractInfo.mtSaleEmpKey}").attr("selected", "true");
				//부가세 포함 셋팅
				$("input:radio[name='taxYn']:radio[value='${basicContractInfo.taxYn}']").prop('checked', true);
				//검수방법 셋팅
				$('#m_mtImCd').val("${basicContractInfo.mtImCd}").attr("selected", "true");
				//백계약유무셋팅
				$('#m_mtSbCtYn').val("${basicContractInfo.mtSbCtYn}").attr("selected", "true");
				//보증증권유무 셋팅
				$('#m_gbYn').val("${basicContractInfo.gbYn}").attr("selected", "true");
			'</c:if>'
			
			$('li[id^=LI_TOPBar]').click(function(event){
				/* location.href = this.title; 
				event.preventDefault(); 				
				alert(this.title);
				document.detailForm.action = this.title;
	           	document.detailForm.submit();
				*/
				if(this.title == "productInfo"){
					if(confirm("유지보수계약 제품정보 상세화면으로 이동하시겠습니까?")){
						document.m_mtMoveForm.action = "/maintenance/contract/detail/productInfo.do";
			           	document.m_mtMoveForm.submit();
					}
					
				} else if(this.title == "salesAmountInfo"){
					
					if("${mtContractCountInfo.mtProductCnt}" > 0){
						if(confirm("유지보수계약 매출정보 상세화면으로 이동하시겠습니까?")){
							document.m_mtMoveForm.action = "/maintenance/contract/detail/salesInfo.do";
				           	document.m_mtMoveForm.submit();
						}
					} else {
						alert(" 유지보수계약 제품정보가 등록되지 않았습니다.\n 유지보수계약 제품정보를 먼저 등록하세요.");
					}
					
					
				} else if(this.title == "backOrderInfo"){
					if("${parmMtSbCtYn}" == "Y"){
						
						if("${mtContractCountInfo.mtSalesAmountCnt}" > 0){
							if(confirm("유지보수계약 백계약정보 상세화면으로 이동하시겠습니까?")){
								document.m_mtMoveForm.action = "/maintenance/contract/detail/backOrderInfo.do";
					           	document.m_mtMoveForm.submit();
							}
						} else {
							alert(" 유지보수계약 매출정보가 등록되지 않았습니다.\n 유지보수계약 매출정보를 먼저 등록하세요.");
						}
						
					} else {
						alert(" 백계약 정보가 N으로 설정되었습니다.\n 기본정보에서 백계약정보를 Y로 변경 후 백계약정보를 등록하세요.");
					}
					
					
				} else if(this.title == "purchaseAmountInfo"){
					
					if("${parmMtSbCtYn}" == "Y"){
						if("${mtContractCountInfo.mtBackOrderCnt}" > 0){
							if(confirm("유지보수계약 매입정보 상세화면으로 이동하시겠습니까?")){
								document.m_mtMoveForm.action = "/maintenance/contract/detail/purchaseAmountInfo.do";
					           	document.m_mtMoveForm.submit();
							}
						} else {
							alert(" 유지보수계약 백계약정보가 등록되지 않았습니다.\n 유지보수계약 백계약정보를 먼저 등록하세요.");
						}
						
					} else {
						alert(" 백계약 정보가 N으로 설정되었습니다.\n 기본정보에서 백계약정보를 Y로 변경 후 백계약정보를 먼저 등록하세요.");
					}
				}
				
			});
			
			/* var html = '';
			$('#prodList table tbody').click(function() {
				if($(this).attr('class') != "viewOpen") {
					html = '<div style="width:997px; height: 100px; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>제품상세</li>'
					       + '<li title="제품상세 내용 표출 1P/8C, 32GB*2EA">제품상세 내용 표출 1P/8C, 32GB*2EA</li>'
					       + '<li>계약기간</li>'
					       + '<li title="2020.12.12~2021.12.12">2020.12.12~2021.12.12</li>'
					       + '<li>비고</li>'
					       + '<li title="비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출">비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출비고내용 표출</li>'
						   + '</ul>'
					       + '</div>'
					       + '</div>';
					$(this).after(html);
					$(this).attr('class', 'viewOpen');
				} else {
					$(this).removeClass('viewOpen');
					$(this).next().remove();
				}
			}); */
			

			/* 고객사 선택하면 고객담당자 정보 가져오기. */
			$('#m_mtAcKey').change(function(){		
		        $.ajax({
		        	url:"/maintenance/contract/selectAcDirectorList.do",
		            dataType: 'json',
		            type:"post",  
		            data: $('#m_mtAcKey').val(),
		     	   	contentType: "application/json; charset=UTF-8",
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);
		        		//xhr.setRequestHeader(header, token);
		        	},
		            success:function(data){		            	
						if ( data.acDirectorList.length > 0 ) {
							//acDirectorList = data.acDirectorList;/* 값이 있는 경우  전역변수에 넣는다. */
							//console.log("===============>"+data.acDirectorList[0].acDirectorInfo);
							$('#m_acDirectorInfo').val(data.acDirectorList[0].acDirectorInfo);/* 첫번째 값을 셋팅해준다. */
							$ ('#m_mtAcDirectorKey' ).find ( 'option' ).remove (); /* select box 의 ID 기존의  option항목을 삭제 */
							for ( var idx = 0 ; idx < data.acDirectorList.length ; idx++ ) {
	                    		$ ('#m_mtAcDirectorKey' ).append ( "<option value='"+data.acDirectorList[idx].acDirectorKey+"'>" + data.acDirectorList[idx].acDirectorNm + '</option>' );
	                  		}
							
							$ ('#m_mtAcDirectorCheck' ).find ( 'option' ).remove (); /* select box 의 ID 기존의  option항목을 삭제 */
							for ( var idx = 0 ; idx < data.acDirectorList.length ; idx++ ) {
	                    		$ ('#m_mtAcDirectorCheck' ).append ( "<option value='"+data.acDirectorList[idx].acDirectorKey+"'>" + data.acDirectorList[idx].acDirectorInfo + '</option>' );
	                  		}
		                }else{
		                	//acDirectorList = null;
							$ ( '#m_mtAcDirectorKey' ).find ( 'option' ).remove ();
		                 	$ ( '#m_mtAcDirectorKey' ).append ( "<option value=''>담당자</option>" );
		                 	//acDirectorInfo 값 지움
		                 	$('#m_acDirectorInfo').val('');
		                 	
		                 	$ ( '#m_mtAcDirectorCheck' ).find ( 'option' ).remove ();
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
			$('#m_mtAcDirectorKey').change(function(){
				var checkVal = $('#m_mtAcDirectorKey option:selected').val();
				$('#m_mtAcDirectorCheck option').each(function() { 
					if (this.value == $('#m_mtAcDirectorKey').val()) { 
						
						$('#m_acDirectorInfo').val(this.text);
						return false;
					}
				});
			});
					
			//거래처 검색
			$("#m_mtAcNm").on("keydown", function(event){
				
				if(event.keyCode == 13) {						
					fnSearchAccoutList(this, $(this).val());
				}						
			});		
			
		}); //end $(document).ready()
		
		//거래처 검색
		var fnSearchAccoutList = function(pObject, pstAccountNm) {
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
		//거래처 검색
		var fnViewAccountList = function(pObject, pjAccountList){
			var html = '<div id="m_div_accountList" style="width:179px; padding-top: 7px; margin-left: 138px; padding-bottom: 7px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); position: absolute;">'
			         + '<ul class="accountList">'
			       ;//+ '<div style="margin: 5px;">';
			       
			       for(var i=0; i < pjAccountList.length; i++) {
			    	   html += '<li id="m_li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>'
			    	        ;
			    	}			       
			       
			    html +=  '</ul>'
			          + '</div>'
			         ;//+ '</div>';
			//$('#m_td_account').after(html);
			$('#m_tr_account').after(html);
			
			
			$("[id^='m_li_account']").click(function(event) {
				
				$('#m_mtAcNm').val(this.innerText); 
				$('#m_mtAcKey').val(this.title);
				$('#m_mtAcKey').change();
				$('#m_div_accountList').remove();
			});
		};
		
		//기본정보 수정
		function modeBasicInfo(){
			
			if($('#m_editMode').val()=="0"){
				$('#modBasicTable').show();
				$('#selectBasicTable').hide();
				
				$('#m_editMode').val(1);
			} else {
				//필수값 체크를 완료하면 저장 프로세스 시작.
				if ($("#m_mtBasicForm")[0].checkValidity()){
					if(confirm("유지보수계약 기본정보를 수정하시겠습니까?")) {
						saveBasicInfo();
					}
					
				}  else {
					 //Validate Form
			        $("#m_mtBasicForm")[0].reportValidity();	
				}
			}
		}
		/*
		* 기본정보 내용을 저장한다.
		*/
		function saveBasicInfo(){
			//$('#mtAmount').val(removeCommas($('#mtAmount').val()))
           	var object = {};
           	var formData = $("#m_mtBasicForm").serializeArray();
           	for (var i = 0; i<formData.length; i++){
                
           		if("mtCtDt" == formData[i]['name'] || "mtStartDt" == formData[i]['name'] || "mtEndDt" == formData[i]['name']) {
                	//날짜 - 제거
                	object[formData[i]['name']] = removeData(formData[i]['value'],"-");
                } else if("mtAmount" == formData[i]['name']){
                	//컴마제거
                	object[formData[i]['name']] = removeData(formData[i]['value'], ",");
                } else {
                	object[formData[i]['name']] = formData[i]['value'];
                }      
             }
           	var sendData = JSON.stringify(object);
           	
           	 $.ajax({
	        	url:"/maintenance/contract/write/basicInfo.do",
	            dataType: 'text', 
	            type:"post",  
	            data: sendData,
	            
	     	   	contentType: "application/json; charset=UTF-8", 
	     	  	beforeSend: function(xhr) {
	        		xhr.setRequestHeader("AJAX", true);
	        		
	        	},
	            success:function(data){	

	            	var paramData = JSON.parse(data);
	            	
	            	if("Y" == paramData.successYN){
	            		alert("유지보수계약 기본정보 수정을 성공하였습니다.");
	            		

	    				//location.href= "/maintenance/contract/detail/productInfo.do"; 
	    				document.m_mtMoveForm.action ="/maintenance/contract/detail/salesInfo.do"; 
	    	           	document.m_mtMoveForm.submit(); 
	            	} else {
	            		alert("유지보수계약 기본정보 수정을 실패하였습니다.");
	            		
	            	}
	            	 
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });  
		}
		
		function fn_addView(){
			
			var url = '/maintenance/contract/write/salesInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":'<c:out value="${basicContractInfo.mtIntegrateKey}"/>',
					"parmMtSbCtYn":'<c:out value="${basicContractInfo.mtSbCtYn}"/>'			
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			
		}

		function fn_deleteMtSalesBtn(){
			var obj = null; 
			if($('input[name="m_gubun"]').is(':checked')) {
				//console.log("mtIntegrateKey.value===>"+document.m_mtMoveForm.mtIntegrateKey.value+"/"+$('input[name="m_gubun"]:checked').val());
				if(confirm("선택한 매출정보를 삭제하시겠습니까?")){
					obj = {};
					obj["mtIntegrateKey"] = document.m_mtMoveForm.mtIntegrateKey.value;
					obj["mtSalesKey"] = $('input[name="m_gubun"]:checked').val();
					$.ajax({
			        	url:"/maintenance/contract/detail/deleteSalesAmountYear.do",
			            dataType: 'text', 
			            type:"post",  
			            data: JSON.stringify(obj),
			            
			     	   	contentType: "application/json; charset=UTF-8", 
			     	  	beforeSend: function(xhr) {
			        		xhr.setRequestHeader("AJAX", true);
			        		
			        	},
			            success:function(data){	

			            	var paramData = JSON.parse(data);
			            	
			            	if("Y" == paramData.successYN){
			            		alert("유지보수계약 매출정보 삭제를 성공하였습니다.");
			            		
			            		document.m_mtMoveForm.action = "/maintenance/contract/detail/salesInfo.do";
			    	           	document.m_mtMoveForm.submit();
			            	} else {
			            		alert("유지보수계약 매출정보 삭제를 실패하였습니다.");
			            		
			            	}
			            	 
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
			        });
				}
			} else {
				alert("삭제할 대상을 선택하세요 !!");
			}
		}
	</script>
</head>
<body>
	<div class="sfcnt"></div>
	<div class="nav"></div>
	<div class="mContentsWrap">
		<div class="mContents mgauto">
			<div class="floatL">
				<div class="title"><label class="ftw500">유지보수 상세정보</label></div>
				<div>
					<div class="stitle cg">기본정보
						<%-- <button type="button" value="수정" id="modBasicInfo" onclick="modeBasicInfo()"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button> --%>
					</div>
					<form id="m_mtMoveForm" name="m_mtMoveForm" method="post">
						<input type="hidden" id="m1_mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/>
					</form>
					<form id="m_mtBasicForm" name="m_mtBasicForm" method="post">
						<input type="hidden" id="m2_mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/>
						<input type="hidden" id="m_editMode" name="editMode"  value="0"/>
						<div id="basicForm">
							<table class="bsc" id="selectBasicTable">
								<tr>
									<td>프로젝트명</td>
									<td><c:out value="${basicContractInfo.mtNm}"/></td>
								</tr>
								<tr>
									<td>고객사</td>
									<td><c:out value="${basicContractInfo.mtAcNm}"/></td>
								</tr>
								<tr>
									<td>고객사담당자</td>
									<td><c:out value="${basicContractInfo.mtAcDirectorNm}"/> / <c:out value="${basicContractInfo.acDirectorInfo}"/></td>
								</tr>
								<tr>
									<td>계약일자</td>
									<td><c:out value="${displayUtil.displayDate(basicContractInfo.mtCtDt)}"/></td>
								</tr>
								<tr>
									<td>유지보수 기간</td>
									<td><c:out value="${displayUtil.displayDate(basicContractInfo.mtStartDt)}"/> ~ <c:out value="${displayUtil.displayDate(basicContractInfo.mtEndDt)}"/></td>
								</tr>
								<tr>
									<td>유지보수 금액</td>
									<td><c:out value="${displayUtil.commaStr(basicContractInfo.mtAmount)}"/></td>
								</tr>
								<tr>
									<td>부가세포함</td>
									<td><c:out value="${basicContractInfo.taxYn}"/></td>
								</tr>
								<tr>
									<td>결제조건</td>
									<td><c:out value="${basicContractInfo.mtPayTerms}"/></td>
								</tr>
								<tr>
									<td>검수방법</td>
									<td><c:out value="${basicContractInfo.mtImCd}"/></td>
								</tr>
								<tr>
									<td>정기점검 횟수</td>
									<td><c:out value="${basicContractInfo.mtRgInspectCnt}"/> 회</td>
								</tr>
								<tr>
									<td>백계약유무</td>
									<td><c:out value="${basicContractInfo.mtSbCtYn}"/></td>
								</tr>
								<tr>
									<td>보증증권 유무</td>
									<td><c:out value="${basicContractInfo.gbYn}"/></td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td><c:out value="${basicContractInfo.supportEmpNm}"/></td>
								</tr>
								<tr>
									<td>관리담당자</td>
									<td><c:out value="${basicContractInfo.mngEmpNm}"/></td>
								</tr>
								<tr>
									<td>영업담당자</td>
									<td><c:out value="${basicContractInfo.saleEmpNm}"/></td>
								</tr>
								<tr>
									<td>비고</td>
									<td ><pre style="width: 435px"><c:out value="${basicContractInfo.remark}"/></pre></td>
								</tr>
							</table>
							<table class="bsc" id="modBasicTable" style="display:none">
								<tr>
									<td><label>*</label>프로젝트명</td>
									<td><input type="text" name="mtNm" value="<c:out value="${basicContractInfo.mtNm}"/>" required/></td>
								</tr>
								<tr id="m_tr_account">
									<td><label>*</label>고객사</td>
									<td>
										<%-- <input type="text" name="mtAcKey" id="m_mtAcKey" class="search" style="width :165px" value="<c:out value="${basicContractInfo.mtAcKey}"/>" required/>	
										<input type="hidden" name="mtAcNm" id="m_mtAcNm" value="<c:out value="${basicContractInfo.mtAcNm}"/>"/> --%>
										<input type="text" name="mtAcNm" id="m_mtAcNm" class="search" style="width :165px" value="<c:out value="${basicContractInfo.mtAcNm}"/>" autocomplete="off" required/>
										<input type="hidden" name="mtAcKey" id="m_mtAcKey" value="<c:out value="${basicContractInfo.mtAcKey}"/>" />	
									</td>
								</tr>
								<tr>
									<td><label>*</label>고객사담당자</td>
									<td>
										<select id="m_mtAcDirectorKey" name="mtAcDirectorKey" required>									
											<c:forEach var="item" items="${acDirectorList}" varStatus="status">										
											<option value="<c:out value="${item.acDirectorKey}"/>"><c:out value="${item.acDirectorNm}"/></option>
											</c:forEach>									
										</select>
										<select id="m_mtAcDirectorCheck"  style="display:none">															
											<c:forEach var="item" items="${acDirectorList}" varStatus="status">
												<option value="<c:out value="${item.acDirectorKey}"/>"><c:out value="${item.acDirectorInfo}"/></option>
											</c:forEach>							
										</select>		
										<input type="text" id="m_acDirectorInfo" class="pname" value="<c:out value="${basicContractInfo.acDirectorInfo}"/>" readonly/>
									</td>
								</tr>
								<tr>
									<td><label>*</label>계약일자</td>
									<td><input type="text" name="mtCtDt" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(basicContractInfo.mtCtDt)}"/>" required/></td>
								</tr>
								<tr>
									<td><label>*</label>유지보수 기간</td>
									<td>
										<input type="text" name="mtStartDt" placeholder="from" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(basicContractInfo.mtStartDt)}"/>" required/> ~ 
										<input type="text" name="mtEndDt" placeholder="to" class="calendar toDt" value="<c:out value="${displayUtil.displayDate(basicContractInfo.mtEndDt)}"/>" required/>
									</td>
								</tr>
								<tr>
									<td><label>*</label>유지보수금액</td>
									<td>
										<input type="text"  id="m_mtAmount" name="mtAmount" value="<c:out value="${displayUtil.commaStr(basicContractInfo.mtAmount)}"/>" amountOnly required style="width: 140px; text-align: right;"/>
									</td>
								</tr>
								<tr>
									<td><label>*</label>부가세포함</td>
									<td>
										<input type="radio" class="tCheck" name="taxYn" value="Y" id="m_hasVAT1" checked="checked"/><label for="m_hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y&nbsp;&nbsp;
										<input type="radio" class="tCheck" name="taxYn" value="N" id="m_hasVAT2" /><label for="m_hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
									</td>
								</tr>
								<tr>
									<td><label>*</label>결제조건</td>
									<td>
										<input type="text"  id="m_mtPayTerms" name="mtPayTerms" style="width: 140px" value="<c:out value="${basicContractInfo.mtPayTerms}"/>" required/>
									</td>
								</tr>
								<tr>
									<td><label>*</label>검수방법</td>
									<td>										
										<select id="m_mtImCd" name="mtImCd" style="width: 162px" required>
											<option value="온라인">온라인</option>
											<option value="오프라인">오프라인</option>
										</select>
									</td>
								</tr>
								<tr>
									<td><label>*</label>정기점검횟수</td>
									<td>
										<input type="text"  id="m_mtRgInspectCnt" name="mtRgInspectCnt" numberOnly style="width: 76px" value="<c:out value="${basicContractInfo.mtRgInspectCnt}"/>" required/>회
									</td>
								</tr>
								<tr>
									<td><label>*</label>백계약유무</td>
									<td>
										<select id="m_mtSbCtYn" name="mtSbCtYn" required>
											<option value="N">N</option>
											<option value="Y">Y</option>
										</select>
									</td>
								</tr>
								<tr>
									<td><label>*</label>보증증권 유무</td>
									<td>
										<select name="gbYn" id="m_gbYn"  required>
											<option value="N">N</option>
											<option value="Y">Y</option>
										</select>
										<button type="button" class="veralignM"><img class="cursorP" src="<c:url value='/images/btn_file_upload.png'/>" /></button>
										<label class="file">보증증권.pdf</label>
									</td>
								</tr>
								<tr>
									<td><label>*</label>지원담당자</td>
									<td>
										<select id="m_mtSupportEmpKey" name="mtSupportEmpKey" required>
											<c:forEach var="emp" items="${empList}" varStatus="status">										
											<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
											</c:forEach>	
										</select>
									</td>
								</tr>
								<tr>
									<td><label>*</label>관리담당자</td>
									<td>
										<select id="m_mtMngEmpKey" name="mtMngEmpKey" required>
											<c:forEach var="emp" items="${empList}" varStatus="status">										
											<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
											</c:forEach>	
										</select>
									</td>
								</tr>
								<tr>
									<td><label>*</label>영업담당자</td>
									<td>
										<select id="m_mtSaleEmpKey" name="mtSaleEmpKey" required>
											<c:forEach var="emp" items="${empList}" varStatus="status">										
											<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
											</c:forEach>	
										</select>
									</td>
								</tr>
								<tr>
									<td>비고</td>
									<td>
										<textarea name="remark"><c:out value="${basicContractInfo.remark}"/></textarea>
									</td>
								</tr>
							</table>
						</div>
						<div class="floatL" style="margin-top: 22px">
							<button type="button" value="수정" id="modBasicInfo" onclick="modeBasicInfo()"><img class="cursorP" src="<c:url value='/images/btn_basic_mod.png'/>" /></button>
						</div>
					</form>
				</div>
			</div>
			<div class="floatR dpBlock fxd">
				<div class="title">
					<ul>
						<li id="LI_TOPBar_PD" title="productInfo"><label style="cursor: pointer;">제품정보</label></li>
						<li id="LI_TOPBar_SL" class="on" title="salesAmountInfo"><label style="cursor: pointer;">매출정보</label></li>
						<c:choose>
							<c:when test="${parmMtSbCtYn == 'Y'}">
								<li id="LI_TOPBar_BC" title="backOrderInfo"><label style="cursor: pointer;">백계약정보</label></li>
								<li id="LI_TOPBar_PA" title="purchaseAmountInfo"><label style="cursor: pointer;">매입정보</label></li>
							</c:when>
							<c:otherwise>
								<li id="LI_TOPBar_BC" title="backOrderInfo"><label>백계약정보</label></li>
								<li id="LI_TOPBar_PA" title="purchaseAmountInfo"><label>매입정보</label></li>
							</c:otherwise>
						</c:choose>
						<li></li>
					</ul>
				</div>
				<div id="prodList">
					<div class="stitle cg colorBlack floatL">
						매출정보
						<img class="veralignT" src="<c:url value='/images/btn_add.png'/>" style="cursor: pointer;" onclick="fn_addView()"/>
					</div>
					<div class="stitle2 floatR">
						매출총 합계 : <input type="text" id="salesTotalAmout" class="pname" value="<c:out value="${displayUtil.commaStr(mtSalesTotalAmount)}"/>" readonly/>
					</div>
					<div class="floatC">
						<table class="dtl">
							<thead class="ftw400">
								<tr>
									<th rowspan="2" style="width: 10px">선택</th>
									<th>연도</th>
									<th>1월</th>
									<th>2월</th>
									<th>3월</th>
									<th>4월</th>
									<th>5월</th>
									<th>6월</th>
								</tr>
								<tr>
									<th>합계</th>
									<th>7월</th>
									<th>8월</th>
									<th>9월</th>
									<th>10월</th>
									<th>11월</th>
									<th>12월</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="dtlWrap">
						<table class="dtl body">
						<c:forEach var="list" items="${mtSalesAmountList}" varStatus="status">
						
							<tbody>
								<tr>
									<td rowspan="2" style="width: 10px" style="10px">
										<!-- <input type="checkbox" class="tCheck" id="check1"/><label for="check1" class="cursorP"></label> -->
										<input type="radio" class="tCheck" name="m_gubun" id="check<c:out value="${status.count}"/>" value="<c:out value="${list.mtSalesKey}"/>" /><label for="check<c:out value="${status.count}"/>" class="cursorP"/>
									</td>
									<td style="font-weight:400"><c:out value="${list.mtSalesYear}"/> 년</td>
									<td title="1월"><c:out value="${displayUtil.commaStr(list.mtSalesJanAmount)}"/></td>
									<td title="2월"><c:out value="${displayUtil.commaStr(list.mtSalesFebAmount)}"/></td>
									<td title="3월"><c:out value="${displayUtil.commaStr(list.mtSalesMarAmount)}"/></td>
									<td title="4월"><c:out value="${displayUtil.commaStr(list.mtSalesAprAmount)}"/></td>
									<td title="5월"><c:out value="${displayUtil.commaStr(list.mtSalesMayAmount)}"/></td>
									<td title="6월"><c:out value="${displayUtil.commaStr(list.mtSalesJunAmount)}"/></td>
								</tr>
								<tr>
									<td title="년도합계">
									<c:out value="${displayUtil.makeAddNumber(
									list.mtSalesJanAmount
									, list.mtSalesFebAmount
									, list.mtSalesMarAmount
									, list.mtSalesAprAmount
									, list.mtSalesMayAmount
									, list.mtSalesJunAmount
									, list.mtSalesJulAmount
									, list.mtSalesAugAmount
									, list.mtSalesSepAmount
									, list.mtSalesOctAmount
									, list.mtSalesNovAmount
									, list.mtSalesDecAmount
									)}"/>
									</td>
									<td title="7월"><c:out value="${displayUtil.commaStr(list.mtSalesJulAmount)}"/></td>
									<td title="8월"><c:out value="${displayUtil.commaStr(list.mtSalesAugAmount)}"/></td>
									<td title="9월"><c:out value="${displayUtil.commaStr(list.mtSalesSepAmount)}"/></td>
									<td title="10월"><c:out value="${displayUtil.commaStr(list.mtSalesOctAmount)}"/></td>
									<td title="11월"><c:out value="${displayUtil.commaStr(list.mtSalesNovAmount)}"/></td>
									<td title="12월"><c:out value="${displayUtil.commaStr(list.mtSalesDecAmount)}"/></td>
								</tr>
							</tbody>
						</c:forEach>	
							
							<!-- <tbody>
								<tr>
									<td rowspan="2" style="width: 10px" style="10px">
										<input type="radio" class="tCheck" name="m_gubun" id="check11"/><label for="check11" class="cursorP"></label>
									</td>
									<td>2019</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
								</tr>
								<tr>
									<td>123,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td rowspan="2" style="width: 10px" style="10px">
										<input type="radio" class="tCheck" name="m_gubun" id="check12"/><label for="check12" class="cursorP"></label>
									</td>
									<td>2020</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
								</tr>
								<tr>
									<td>123,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td rowspan="2" style="width: 10px" style="10px">
										<input type="radio" class="tCheck" name="m_gubun" id="check13"/><label for="check13" class="cursorP"></label>
									</td>
									<td>2021</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
								</tr>
								<tr>
									<td>123,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<td rowspan="2" style="width: 10px" style="10px">
										<input type="radio" class="tCheck" name="m_gubun" id="check14"/><label for="check14" class="cursorP"></label>
									</td>
									<td>2021</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
								</tr>
								<tr>
									<td>123,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
								</tr>
							</tbody> 
							<tbody>
								<tr>
									<td rowspan="2" style="width: 10px" style="10px">
										<input type="radio" class="tCheck" name="m_gubun" id="check15"/><label for="check15" class="cursorP"></label>
									</td>
									<td>2021</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
								</tr>
								<tr>
									<td>123,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
									<td>6,000,000</td>
								</tr>
							</tbody> -->
						</table>
					</div>
					<div class="bottom">
						<div class="floatR">
							<button type="button" value="수정" onclick="fn_addView()"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
							<button type="button" value="삭제" onclick="fn_deleteMtSalesBtn()"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
							<button type="button" value="Excel"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button>
						</div>
					</div>
				</div>
			</div>
			<div class="floatC"></div>
		</div>
	</div>
</body>
</html>