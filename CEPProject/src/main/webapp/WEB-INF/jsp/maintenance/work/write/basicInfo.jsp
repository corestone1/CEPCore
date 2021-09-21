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
			height: 102px;
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
		.popContainer .contents td label {
			color: red;
			vertical-align: middle;
      	} 
		.popContainer .contents .btnWrap {
			margin : 10px 48px 15px 48px;
		}
		.btnCenter {
			width : calc(100% - 30px);
			text-align: center;
		}

	/* 파일업로드 관련 */
		#fileForm {
			position: absolute;
			bottom: 56px;;
			left: 41px;
			z-index: 99;
		}
		#fileForm .exFileLabel {
			background-image: url('/images/btn_file.png');
			background-repeat: no-repeat;
			width: 110px;
			height: 26px;
			cursor: pointer;
			float: left;
			margin-top: 1px;
			margin-right: 7px;
		}
		#fileForm .uploadName {
			font-size: 12px; 
			font-weight: 200;
			font-family: inherit; 
			line-height: normal; 
			vertical-align: middle; 
			border: 1px solid #ebebeb; 
			width: 184px;
			height: 26px;
		}
		#fileForm .exFile {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0,0,0,0);
			border: 0;
		}
		#fileForm .upload-name {
		    background: transparent;
		    border: none;
		    font-size: 13px;
		    width: 160px;
		    height: 17px;
		    text-overflow: ellipsis;
		}
		#fileForm .close {
			vertical-align: middle;
		} 
	</style>
	<script>
		$(document).ready(function() {
			'<c:if test="${basicWorkInfo != null }">'
				//고객사 담당자 셋팅
				$('#mtWorkAcDirectorKey').val("${basicWorkInfo.mtWorkAcDirectorKey}").attr("selected", "true");
			
				//지원담당자정보 셋팅
				$('#mtWorkEmpKey').val("${basicWorkInfo.mtWorkEmpKey}").attr("selected", "true");
				
				//작업유형 셋팅
				$('#mtWorkTypeCd').val("${basicWorkInfo.mtWorkTypeCd}").attr("selected", "true");
				
				//조치결과
				$('#mtWorkResultCd').val("${basicWorkInfo.mtWorkResultCd}").attr("selected", "true");
				
				//제품등록여부
				//$('#mtWorkPmYn').val("${basicWorkInfo.mtWorkPmYn}").attr("selected", "true");
				$("input:radio[name='mtWorkPmYn']:radio[value='${basicWorkInfo.mtWorkPmYn}']").prop('checked', true);
				
				//추가발주여부
				//$('#mtWorkOrderYn').val("${basicWorkInfo.mtWorkOrderYn}").attr("selected", "true");
				$("input:radio[name='mtWorkOrderYn']:radio[value='${basicWorkInfo.mtWorkOrderYn}']").prop('checked', true);
			
				//왼쪽 메뉴바 보이고 안보이는 설정
				/* if("Y" == $('#mtWorkPmYn option:selected').val()){
					$('#work_product').show();
				} else {
					$('#work_product').hide();
				} */
				if("Y" == "${basicWorkInfo.mtWorkPmYn}"){
					$('#work_product').show();
				} else {
					$('#work_product').hide();
				}
				/* if("Y" == $('#mtWorkOrderYn option:selected').val()){
					$('#work_order').show();
				} else {
					$('#work_order').hide();
				} */
				if("Y" == "${basicWorkInfo.mtWorkOrderYn}"){
					$('#work_order').show();
				} else {
					$('#work_order').hide();
				}
				
				//Next버튼 활성
				/* if("Y" == $('#mtWorkPmYn option:selected').val() || "Y" == $('#mtWorkOrderYn option:selected').val()){
					$('#showNextBtn').show();
					$('#nonNextBtn').hide();
				} else {
					$('#showNextBtn').hide();
					$('#nonNextBtn').hide();
				} */
				if("Y" == "${basicWorkInfo.mtWorkPmYn}" || "Y" == "${basicWorkInfo.mtWorkOrderYn}"){
					$('#showNextBtn').show();
					$('#nonNextBtn').hide();
				} else {
					$('#showNextBtn').hide();
					$('#nonNextBtn').hide();
				}
			'</c:if>'
				
			//파일 업로드
			var fileTarget = $(".exFile");
			
			fileTarget.on('change', function() {
				var filename = $(this)[0].files[0].name;
				$(this).siblings('.uploadName').val(filename)
			});
			
		});//end $(document).ready()
		
		
		function fn_saveBtn(){
			
			//필수값 체크를 완료하면 저장 프로세스 시작.
			if ($("#mtBasicForm")[0].checkValidity()){
				if($('#mtWorkKey').val() !=''){
					if(confirm("유지보수작업 기본정보를 수정하시겠습니까?")) {
						fn_basicInfo();
					}
				} else {
					if(confirm("유지보수작업 기본정보를 저장하시겠습니까?")) {
						fn_basicInfo();
					}
				}
				
			}  else {
				 //Validate Form
		        $("#mtBasicForm")[0].reportValidity();	
			}
           	
		}
		function fn_basicInfo(){
			var sendUrl;
			var object = {};
			var fileFormData;
			
           	var formData = $("#mtBasicForm").serializeArray();
           	//console.log("formData===>"+formData);
           	for (var i = 0; i<formData.length; i++){
                
                object[formData[i]['name']] = formData[i]['value'];
             }
           	var sendData = JSON.stringify(object);
           	
           	if($('#mtWorkKey').val() !=''){
           		sendUrl = "/maintenance/work/edit/basicInfo.do";
           	} else {
           		sendUrl = "/maintenance/work/write/basicInfo.do";
           	}
           	$.ajax({
           		url:sendUrl,
           		dataType: 'text', 
           		type:"post",  
           		data: sendData,
           		contentType: "application/json; charset=UTF-8", 
           		beforeSend: function(xhr) {
           			xhr.setRequestHeader("AJAX", true);	        		
           		},
           		success:function(data){	
           			var paramData = JSON.parse(data);
           			
           			//console.log("paramData===>"+paramData);
           			//console.log("data.mtWorkKey==>"+paramData.mtWorkKey);
           			if("Y" == paramData.successYN){
           				var varParam = JSON.parse(data);
           				
           				if($("#upFileName").val() == null || $("#upFileName").val() == "" || $("#upFileName").val().length == 0) {
               				//첨부파일이 없는 경우
           					if($('#mtWorkKey').val() !=''){
               					alert("유지보수작업 기본정보 수정을 성공하였습니다.");
               				} else {
               					alert("유지보수작업 기본정보 등록을 성공하였습니다.");
               				}
           					var url2 = '/maintenance/work/write/basicInfoView.do';
			    			var dialogId2 = 'program_layer';
			    			
			    			var button2 = new Array;
			    			button2 = [];
			    			showModalPop(dialogId2, url2, varParam, button, '', 'width:1144px;height:708px');
               			} else {
               				//첨부파일이 존재하지 않는경우.
               				//업로프 파일을 선택한 경우 파일 업로드 프로세스 수행
               				
               				$("#fileCtKey").val(paramData.mtWorkKey);
               				
	            			fileFormData = new FormData($('#fileForm')[0]); 
			       			$.ajax({ 
			       				type: "POST", 
			       				enctype: 'multipart/form-data',  
			       				url: '/file/upload.do', 
			       				data: fileFormData, // 필수 
			       				processData: false, // 필수 
			       				contentType: false, // 필수 
			       				cache: false, 
			       				success: function (data) {
			       					if(data.successYN=='Y') {
			       						if($('#mtWorkKey').val() !=''){
			               					alert("유지보수작업 기본정보 수정을 성공하였습니다.");
			               				} else {
			               					alert("유지보수작업 기본정보 등록을 성공하였습니다.");
			               				}		    			    		
			       						
			       					} else {
			       						alert("첨부파일 저장이 실패하였습니다.")
			       					}
			       					//현재는 파일저장이 실패해도 기본정보는 저장되도록 화면 이동시킴.
			       					var url2 = '/maintenance/work/write/basicInfoView.do';
		    		    			var dialogId2 = 'program_layer';
		    		    			//첨부파일 workClass정보 추가.
		    		    			varParam['workClass'] = $('#workClass').val();			    		    			
		    		    			var button2 = new Array;
		    		    			button2 = [];
		    		    			showModalPop(dialogId2, url2, varParam, button2, '', 'width:1144px;height:708px');
			       				}, 
			       				error: function(request, status, error) {
			       					if(request.status != '0') {
			       						alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			       					}
			       				}
			       			});
               			}
           				
           				/* if($('#mtWorkKey').val() !=''){
           					alert("유지보수작업 기본정보 수정을 성공하였습니다.");
           				} else {
           					alert("유지보수작업 기본정보 등록을 성공하였습니다.");
           				}
           			
           				//if("N" == $('#mtWorkPmYn option:selected').val() && "N" == $('#mtWorkOrderYn option:selected').val()){
           				if("N" == document.mtBasicForm.mtWorkPmYn.value && "N" == document.mtBasicForm.mtWorkOrderYn.value){
           					//document.listForm.action = "/maintenance/work/workList.do";
           					//document.listForm.method="get";
           		        	//document.listForm.submit(); 
           				} else {
           					$('#mtWorkKey').val(paramData.mtWorkKey);
           					$('#sv_mtWorkPmYn').val(paramData.mtWorkPmYn);
           					$('#sv_mtWorkOrderYn').val(paramData.mtWorkOrderYn);
           					$('#showNextBtn').show();
           					$('#nonNextBtn').hide();
           				} */
           			} else {
           				if($('#mtWorkKey').val() !=''){
           					alert("유지보수기본정보 수정을 실패하였습니다.");
           				} else {
           					alert("유지보수기본정보 등록을 실패하였습니다.");
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
		/**
		*  화면을 이동시킨다.
		*  @param {string} varUrl 이동해야할 url
		*/
		function fn_changeView(varUrl) {
			var url;
			if($('#mtWorkKey').val() !="") {
				if(varUrl == "productInfoView"){
					if(confirm("유지보수작업 제품정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/work/write/'+varUrl+'.do';
					} else {
						return false;
					}
				} else if(varUrl == "orderInfoView"){
					if(confirm("유지보수작업 발주정보 화면으로 이동하시겠습니까?")){
						url = '/maintenance/work/write/'+varUrl+'.do';
					} else {
						return false;
					}
				}
			} else {
				alert("유지보수작업 기본정보가 등록되지 않아 화면을 이동할 수 없습니다.");
				return false;				
			}
			
			if(url != "") {
				
				var dialogId = 'program_layer';
				var varParam = {
					"mtIntegrateKey": $('#mtIntegrateKey').val(),
					"mtWorkKey":$('#mtWorkKey').val(),
					"orderCtFkKey":$('#mtWorkKey').val()
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			} else {

				return false;
			}	
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
			
			/* //추가발주유무에 의한 버튼 및 메뉴 display조정
			$('#mtWorkOrderYn').change(function(){				
				//왼쪽 발주 정보 보이고 안보이고
				if("Y" == $('#mtWorkOrderYn option:selected').val()){
					$('#work_order').show();
				} else {
					$('#work_order').hide();
				}
				
				//버튼 저장 또는 저장&계속 입력
				if("N" == $('#mtWorkPmYn option:selected').val() && "N" == $('#mtWorkOrderYn option:selected').val()){
					$('#nonNextBtn').hide();
					$('#showNextBtn').hide();
				} else {
					if("" != $('#mtWorkKey').val()) {
						$('#nonNextBtn').hide();
						$('#showNextBtn').show();	
					} else {
						$('#nonNextBtn').show();
						$('#showNextBtn').hide();	
						
					}		
				}			
			});
			
			//제품등록유무에 의한 버튼 및 메뉴 display조정
			$('#mtWorkPmYn').change(function(){	
				//console.log("mtIntegrateKey====>"+$('#mtWorkPmYn').val());
				//왼쪽 발주 정보 보이고 안보이고
				if("Y" == $('#mtWorkPmYn option:selected').val()){
					
					$('#work_product').show();
				} else {
					$('#work_product').hide();
				}
				
				//버튼 저장 또는 저장&계속 입력
				if("N" == $('#mtWorkPmYn option:selected').val() && "N" == $('#mtWorkOrderYn option:selected').val()){
					$('#nonNextBtn').hide();
					$('#showNextBtn').hide();
				} else {
					if("" != $('#mtWorkKey').val()) {
						$('#nonNextBtn').hide();
						$('#showNextBtn').show();	
					} else {
						$('#nonNextBtn').show();
						$('#showNextBtn').hide();	
						
					}	
				}				
			}); */
			
			//var acDirectorList; // 고객 담당자 정보 리스트

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
							
							$ ('#mtWorkAcDirectorCheck' ).find ( 'option' ).remove (); /* select box 의 ID 기존의  option항목을 삭제 */
							for ( var idx = 0 ; idx < data.acDirectorList.length ; idx++ ) {
                        		$ ('#mtWorkAcDirectorCheck' ).append ( "<option value='"+data.acDirectorList[idx].acDirectorKey+"'>" + data.acDirectorList[idx].acDirectorInfo + '</option>' );
                      		}
		                }else{
		                	//acDirectorList = null;
							$ ( '#mtWorkAcDirectorKey' ).find ( 'option' ).remove ();
		                 	$ ( '#mtWorkAcDirectorKey' ).append ( "<option value=''>담당자</option>" );
		                 	//acDirectorInfo 값 지움
		                 	$('#acDirectorInfo').val('');
		                 	
		                 	$ ( '#mtWorkAcDirectorCheck' ).find ( 'option' ).remove ();
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
			$('#mtWorkAcDirectorKey').change(function(){
				var checkVal = $('#mtWorkAcDirectorKey option:selected').val();
				$('#mtWorkAcDirectorCheck option').each(function() { 
					if (this.value == $('#mtWorkAcDirectorKey').val()) { 
						
						$('#acDirectorInfo').val(this.text);
						return false;
					}
				});
				/* if(acDirectorList.length>0){
					for ( var idx = 0 ; idx < acDirectorList.length ; idx++ ) {
						if(checkVal == acDirectorList[idx].acDirectorKey ){
							$('#acDirectorInfo').val(acDirectorList[idx].acDirectorInfo);
							break;
						}
					}					
				} */				
			});			
		});
		

		/* 팝업에서 호출 :프로젝트 key를 이용하여  고객사명, 담당자 리스트 가져오기.. */
		function fn_selectAcInfo() {
			
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
						
						$ ('#mtWorkAcDirectorCheck' ).find ( 'option' ).remove (); /* select box 의 ID 기존의  option항목을 삭제 */
						for ( var idx = 0 ; idx < data.acDirectorList.length ; idx++ ) {
                    		$ ('#mtWorkAcDirectorCheck' ).append ( "<option value='"+data.acDirectorList[idx].acDirectorKey+"'>" + data.acDirectorList[idx].acDirectorInfo + '</option>' );
                  		}
	                }else{
	                	//acDirectorList = null;
						$ ( '#mtWorkAcDirectorKey' ).find ( 'option' ).remove ();
	                 	$ ( '#mtWorkAcDirectorKey' ).append ( "<option value=''>담당자</option>" );

	                 	//acDirectorInfo 값 지움
	                 	$('#acDirectorInfo').val('');
	                 	
	                 	$( '#mtWorkAcDirectorCheck' ).find ( 'option' ).remove ();
	                }
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	        });
		}
		
		
		function fn_nextBtn(){
			var whereMsg;
			var whereUrl;
			if($('#mtWorkKey').val() !=''){
				if("Y" == $('#sv_mtWorkPmYn').val()){
					whereMsg = "제품정보";
					whereUrl = "/maintenance/work/write/productInfoView.do";
				}else if( "Y" == $('#sv_mtWorkOrderYn').val()){
					whereMsg = "발주정보";
					whereUrl = "/maintenance/work/write/orderInfoView.do";
				}
				if(confirm("수정된 내용이 있으면 먼저 저장 버튼을 클릭한 후 이동하세요!! \n유지보수작업 "+whereMsg+" 등록화면으로 이동하시겠습니까?")) {
					//saveBasicInfo();
					var url = whereUrl;
					var dialogId = 'program_layer';
					var varParam = {
							"mtIntegrateKey":$('#mtIntegrateKey').val(),
							"mtWorkKey":$('#mtWorkKey').val(),
							"mtWorkPmYn":$('#sv_mtWorkPmYn').val(),
							"mtWorkOrderYn":$('#sv_mtWorkOrderYn').val(),
							"orderCtFkKey":$('#mtWorkKey').val()
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
				} else {
					return false;
				}
			} else {
				alert(" 유지보수작업 기본정보가 등록되지 않았습니다.\n 유지보수작업 기본정보를 먼저 등록하세요.");
			}
		}
		//유지보수 목록 조회 팝업
		function fn_searchListPop() {
			var parentWindow;
			parentWindow = window.open('/maintenance/contract/popup/contractList.do?codeId=mtIntegrateKey&nameId=mtNm','MT_CONTRACT_LIST','width=1000px,height=713px,left=600,resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0');		   
		}
		
		//추가발주유무에 의한 버튼 및 메뉴 display조정
		function workOrderYnClick(param) {
			if("Y" == param){
				$('#work_order').show();
			} else {
				$('#work_order').hide();
			}
			
			//버튼 저장 또는 저장&계속 입력
			if("N" == document.mtBasicForm.mtWorkPmYn.value && "N" == document.mtBasicForm.mtWorkOrderYn.value){
				$('#nonNextBtn').hide();
				$('#showNextBtn').hide();
			} else {
				if("" != $('#mtWorkKey').val()) {
					$('#nonNextBtn').hide();
					$('#showNextBtn').show();	
				} else {
					$('#nonNextBtn').show();
					$('#showNextBtn').hide();					
				}		
			}	
		} // end WorkOrderYnClick()
		
		//제품등록유무에 의한 버튼 및 메뉴 display조정
		function workPmYnClick(param) {
			if("Y" == param){
				$('#work_product').show();
			} else {
				$('#work_product').hide();
			}
			
			//버튼 저장 또는 저장&계속 입력
			if("N" == document.mtBasicForm.mtWorkPmYn.value && "N" == document.mtBasicForm.mtWorkOrderYn.value){
				$('#nonNextBtn').hide();
				$('#showNextBtn').hide();
			} else {
				if("" != $('#mtWorkKey').val()) {
					$('#nonNextBtn').hide();
					$('#showNextBtn').show();	
				} else {
					$('#nonNextBtn').show();
					$('#showNextBtn').hide();					
				}		
			}	
		} // end woorkPmYnClick()
		

		
		// 파일업로드 관련
		function fn_downFilePopUp(fileKey, fileOrgNm) {
			var form = document.viewPopUpForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#viewPopUpForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}
		
		function fn_deleteFile(fileKey, fileNm) {
			var result = confirm("첨부파일 " + fileNm + " 을 삭제하시겠습니까?");
			if(result) {
				var form = document.viewPopUpForm;
				form.fileKey.value = fileKey;
				var data = JSON.stringify({"fileKey":fileKey});
				$.ajax({ 
	   				url: '/file/delete.do', 
	   				dataType:'json',
	   				type: "POST", 
	   				data: data, // 필수 
	   				contentType: "application/json; charset=UTF-8", 
	   				success: function (response) { 
		   				if(response.successYN=='Y') {
							alert('첨부파일이 삭제되었습니다.');
							$("#file"+fileKey).next().remove();
							$("#file"+fileKey).remove();
						} else {
							alert('첨부파일 삭제가 실패되었습니다.');
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
		
	</script>
</head>
<body>
	
<div class="popContainer">
	<div class="top">
		<div>
			<div class="floatL ftw500">유지보수작업 등록</div>
		</div>
	</div>
	<div class="left">
		<ul class="ftw400">
			<li class="colorWhite cursorP on">기본정보</li>
			<li id="work_product" class="colorWhite cursorP" onclick="fn_changeView('productInfoView');" style="display:none">제품정보</li>
			<li id="work_order" class="colorWhite cursorP" onclick="fn_changeView('orderInfoView');" style="display:none">발주정보</li>
		</ul>
	</div>
	<div class="contents">
		<div>
			<form action="/" id="mtBasicForm" name="mtBasicForm"  method="post">	
				<%-- <input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicWorkInfo.mtIntegrateKey}"/>"/> --%>
				<input type="hidden" id="mtWorkKey" name="mtWorkKey" value="<c:out value="${basicWorkInfo.mtWorkKey}"/>"/>
				<input type="hidden" id="sv_mtWorkPmYn" name="sv_mtWorkPmYn" value="<c:out value="${basicWorkInfo.mtWorkPmYn}"/>"/>
				<input type="hidden" id="sv_mtWorkOrderYn" name="sv_mtWorkOrderYn" value="<c:out value="${basicWorkInfo.mtWorkOrderYn}"/>"/>		
				<input type="hidden" id="workClass" name="workClass" value="mtWork"/>		
				<table>
					<tr>
						<td class="tdTitle"><label>*</label>프로젝트명</td>
						<td class="tdContents" colspan="5">
							<input type="text" id="mtNm" name="mtNm" value="<c:out value="${basicWorkInfo.mtNm}"/>" class="search" onclick="fn_searchListPop()" onkeypress="return false;" autocomplete="off" required/>
							<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicWorkInfo.mtIntegrateKey}"/>"/>
							<!-- <input type="text" id="mtIntegrateKey" name="mtIntegrateKey"/>
							<input type="hidden" id="mtNm" name="mtNm" /> -->
						</td>
					</tr>
					<tr>
						<td class="tdTitle">고객사</td>
						<td class="tdContents" colspan="5">
							<input type="text" id="mtAcNm" value="<c:out value="${basicWorkInfo.mtAcNm}"/>" class="pname"  readonly/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle"><label>*</label>고객사담당자</td>
						<td class="tdContents" colspan="5">
							<select id="mtWorkAcDirectorKey" name="mtWorkAcDirectorKey" required>
								<c:forEach var="item" items="${acDirectorList}" varStatus="status">										
								<option value="<c:out value="${item.acDirectorKey}"/>"><c:out value="${item.acDirectorNm}"/></option>
								</c:forEach>
								<!-- <option value="">선택</option> -->
								<%-- <c:forEach var="director" items="${acDirectorList}" varStatus="status">										
								<option value="<c:out value="${director.directorKey}"/>"><c:out value="${director.directorNm}"/></option>
								</c:forEach> --%>									
							</select>
							<select id="mtWorkAcDirectorCheck"  style="display:none">															
								<c:forEach var="item" items="${acDirectorList}" varStatus="status">
									<option value="<c:out value="${item.acDirectorKey}"/>"><c:out value="${item.acDirectorInfo}"/></option>
								</c:forEach>							
							</select>	
							<input type="text" id="acDirectorInfo" value="<c:out value="${basicWorkInfo.acDirectorInfo}"/>" class="pname" readonly/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle"><label>*</label>지원담당</td>
						<td class="tdContents" >
							<select id="mtWorkEmpKey" name="mtWorkEmpKey" required>
								<c:forEach var="emp" items="${empList}" varStatus="status">										
								<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}"/></option>
								</c:forEach>	
							</select>
						</td>
						<td class="tdSubTitle"><label>*</label>작업유형</td>
						<td class="tdContents" colspan="3">
							<select id="mtWorkTypeCd" name="mtWorkTypeCd" required>
								<option value="정기점검">정기점검</option>
								<option value="장애처리">장애처리</option>
								<option value="기술지원">기술지원</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="tdTitle"><label>*</label>작업기간</td>
						<td class="tdContents" colspan="5">
							<input type="text" id="mtWorkStartDt" name="mtWorkStartDt" value="<c:out value="${displayUtil.displayDate(basicWorkInfo.mtWorkStartDt)}"/>" placeholder="from" class="calendar fromDt" autocomplete="off" required/>&nbsp;<input type="text" id="mtWorkStartTm" name="mtWorkStartTm" value="<c:out value="${displayUtil.displayTime(basicWorkInfo.mtWorkStartTm)}"/>" timeOnly style="width: 50px" autocomplete="off" required/>&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; 
							<input type="text" id="mtWorkEndDt" name="mtWorkEndDt" value="<c:out value="${displayUtil.displayDate(basicWorkInfo.mtWorkEndDt)}"/>" placeholder="to" class="calendar toDt" autocomplete="off" required/>&nbsp;<input type="text" id="mtWorkEndTm" name="mtWorkEndTm" value="<c:out value="${displayUtil.displayTime(basicWorkInfo.mtWorkEndTm)}"/>" timeOnly style="width: 50px" autocomplete="off" required/>
						</td>
					</tr>
					<tr>
						<td class="tdTitle"><label>*</label>조치결과</td>
						<td class="tdContents">
							<select id="mtWorkResultCd" name="mtWorkResultCd" required>
								<option value="준비">준비</option>
								<option value="진행">진행</option>
								<option value="완료">완료</option>
							</select>
						</td>
						<td class="tdSubTitle">제품등록유무</td>
						<td class="tdContents">
							<!-- <select id="mtWorkPmYn"  name="mtWorkPmYn">
								<option value="N">N</option>
								<option value="Y">Y</option>
							</select> -->
							<input type="radio" class="tRadio" name="mtWorkPmYn" value="Y" id="workPmYn1" onclick="workPmYnClick('Y');"/><label for="workPmYn1" class="cursorP"></label>&nbsp;&nbsp;Y
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" class="tRadio" name="mtWorkPmYn" value="N" id="workPmYn2" checked="checked" onclick="workPmYnClick('N');"/><label for="workPmYn2" class="cursorP"></label>&nbsp;&nbsp;N
						</td>
						<td class="tdSubTitle">추가발주유무</td>
						<td class="tdContents">
							<!-- <select id="mtWorkOrderYn" name="mtWorkOrderYn">
								<option value="N">N</option>
								<option value="Y">Y</option>
							</select> -->
							<input type="radio" class="tRadio" name="mtWorkOrderYn" value="Y" id="workOrderYn1" onclick="workOrderYnClick('Y');"/><label for="workOrderYn1" class="cursorP"></label>&nbsp;&nbsp;Y
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" class="tRadio" name="mtWorkOrderYn" value="N" id="workOrderYn2" checked="checked" onclick="workOrderYnClick('N');"/><label for="workOrderYn2" class="cursorP"></label>&nbsp;&nbsp;N	
						</td>
					</tr>	
					<tr>
						<td class="tdTitle veralignT"><label>*</label>지원내용</td>
						<td class="tdContents" colspan="5"><textarea id="mtWorkCont" name="mtWorkCont" required><c:out value="${basicWorkInfo.mtWorkCont}"/></textarea></td>
					</tr>
					<tr>
						<td class="tdTitle veralignT">비고</td>
						<td class="tdContents" colspan="5"><textarea id="remark" name="remark"><c:out value="${basicWorkInfo.remark}"/></textarea></td>
					</tr>
				</table>			
			</form>
			<form id="fileForm" method="post" enctype="multipart/form-data"> 
				<input type="hidden" name="docTypeNm" value="mtWork" />
				<input type="hidden" name="fileCtKey" id="fileCtKey" value="${basicWorkInfo.mtWorkKey}" />
				<input type="hidden" name="pjNm" id="filePjNm" value="<c:out value="${resultList[0].pjNm}"/>"/> 
				<input type="hidden" name="atchFileCnt" id="atchFileCnt" title="첨부된갯수" value="${fn:length(fileList)}" />
				<input type="hidden" name="maxFileCnt" id="maxFileCnt" title="첨부가능최대갯수" value="<c:out value='${maxFileCnt}'/>" />
				<input type="hidden" name="maxFileSize" id="maxFileSize" title="파일사이즈" value="<c:out value='${maxFileSize}'/>" />
				<table>					
					<tr>		
						<td class="tdTitle veralignT">첨부파일</td>		
						<td>			
							<div class="uploadContainer">
								<input class="uploadName" id="upFileName" placeholder="파일선택" disabled="disabled" />
								<label for="exFile" class="exFileLabel"></label>
								<input type="file" id="exFile" class="exFile" multiple="multiple" name="file"/>
							</div>
							<div style="width: 235px; height: 25px; clear:both;">
								<c:forEach var="result" items="${fileList }" varStatus="status">
									<input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFilePopUp('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/>
									<a class="close cursorP" onclick="fn_deleteFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm }" />')"><img src="/images/btn_close.png" /></a>
									<c:if test="${status.last eq false}"><br /></c:if>
								</c:forEach>
							</div>
							
						
						<%-- <form:form id="viewForm" name="viewForm" method="POST">
							<input type="hidden" name="fileKey" value=""/>
							<input type="hidden" name="fileOrgNm" value=""/>
						</form:form> --%>
						</td>
					</tr>
				
				<%-- tr>
							<td class="tdTitle veralignT">첨부파일</td>
							<td class="tdContents"><button type="button"><img src="<c:url value='/images/btn_file.png'/>" /></button></td>
						</tr> --%>
				</table>
			</form>
			<form:form id="viewPopUpForm" name="viewPopUpForm" method="POST">
				<input type="hidden" name="fileKey" value=""/>
				<input type="hidden" name="fileOrgNm" value=""/>
			</form:form>
		</div>
		<div class="btnWrap floatL">
			<div class="floatL btnCenter">
				<button type="button" onclick="fn_saveBtn();"><img src="<c:url value='/images/btn_save.png'/>" /></button>
			</div>
			<div id="nonNextBtn"class="floatR"  style="margin-right: 7px;display:none;" >
				<img src="<c:url value='/images/btn_non_next.png'/>"/>
			</div>
			<div id="showNextBtn"class="floatR"  style="margin-right: 7px;display:none;" >
				<button type="button" onclick="fn_nextBtn();"><img src="<c:url value='/images/btn_next.png'/>"/></button>
			</div>
			<%-- <div id="saveBtn" class="floatR" onclick="fn_saveNextBtn('ss');">
				<button type="button"><img src="<c:url value='/images/btn_save.png'/>" /></button>
			</div>
			<div id="saveNextBtn" class="floatR" onclick="fn_saveNextBtn('sn');" style="display:none">
				<button type="button"><img src="<c:url value='/images/btn_next.png'/>" /></button>
			</div> --%>
			<div class="floatN floatC"></div>
		</div>
	</div>
</div>	
	
</body>
</html>