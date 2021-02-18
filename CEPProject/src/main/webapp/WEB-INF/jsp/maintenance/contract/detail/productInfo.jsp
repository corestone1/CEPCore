<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<%@include file="../../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수계약 상세(제품정보)</title>
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
			width: 614px;
			table-layout: fixed;
		} 
		.mContents table tr td {
			padding: 13px 18px;
		}
		/* .mContents > div > div > div > table tr td:first-child {
			width: 124px;
			font-weight: 400;
			padding: 13px 20px 13px 45px;
		} 
		.mContents > div > div > div > table tr td:last-child {
			width: 400px;
			font-weight: 200;
		} */
		.mContents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			/* border: 1px solid #bee2da; */
		    border-bottom: 2px solid #bfe3db;
		}
		.mContents .bsc tr td:first-child {
			width: 124px;
			font-weight: 400;
			padding: 13px 20px 13px 45px;
		} 
		.mContents .bsc tr td:last-child {
			width: 400px;
			font-weight: 200;
			box-shadow: inset 7px 0 6px -4px #d0e2de;
		}
		
		.mContents .bsc tbody {			
			height: 576px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		
		.mContents .bsc tr td {
			color: #26a07d;
		}
		.mContents .bsc tr td:first-child {
			/* box-shadow: inset -7px 0 9px -4px #d0e2de; */			
			width: 153px;
			font-weight: 400;
			padding: 13px 13px 13px 20px;
		}
		.mContents .bsc tr td:last-child {
			width: 470px;
			font-weight: 200;
		}
		.mContents .bsc tr td label.file {
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
		.mContents .dtl {
			width: 997px;
			font-size: 14px;
			border-collapse: collapse;
			font-weight: 300;
			overflow: hidden;
			border-top: 4px solid #6a5baf;
		}
		.mContents .dtl thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
		.mContents .dtl thead tr {
			display: table;
			width: 997px;
		}
		.mContents .dtl tbody {
			width: 997px;
			/* height: 534px; */
			height: 487px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			border-bottom: 2px solid #c4c4c4;
		}
		.mContents .dtl tbody tr {
			display: table;
			width: 997px;
			cursor: pointer;
		}
		.mContents .dtl tbody tr:hover {
			background-color: #ddf0ec
		}
		.mContents .dtl tbody tr td:nth-child(3) {
			font-weight: 400;
		}
		.mContents .dtl thead th, .mContents .dtl tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}
		.mContents .dtl tbody tr td {
			font-weight: 200;
		}
		.mContents .dtl thead th:first-child,
		.mContents .dtl tbody td:first-child {
			width: 45px;
			padding: 0;
		}
		.mContents .dtl thead th:nth-child(2),
		.mContents .dtl tbody td:nth-child(2){
			width: 40px;
		}
		.mContents .dtl thead th:nth-child(3),
		.mContents .dtl tbody td:nth-child(3) {
			width: 190px;
			max-width: 190px;
		}
		.mContents .dtl thead th:nth-child(4),
		.mContents .dtl tbody td:nth-child(4) {
			width: 160px;
			max-width: 160px;
		}
		.mContents .dtl thead th:nth-child(5),
		.mContents .dtl tbody td:nth-child(5){
			width: 85px;
		}
		.mContents .dtl thead th:nth-child(6),
		.mContents .dtl tbody td:nth-child(6) {
			width: 60px;
		}
		.mContents .dtl thead th:nth-child(7),
		.mContents .dtl tbody td:nth-child(7) {
			width: 90px;
		}
		.mContents .dtl thead th:nth-child(8),
		.mContents .dtl tbody td:nth-child(8) {
			width: 180px;
		}
		.mContents .dtl tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 90%;
			margin: 0 auto;
		}
		.mContents .dtl tbody tr td img {
			width: 13px;
			vertical-align: middle;
			margin-bottom: 5px;
		}
		/* .detailList li {
			float: left;
			text-align: left;
			margin-left: 0px;
			line-height: 2.3;
		} */
		.detailList li:nth-child(2n-1) {
			width: 82px;
			font-weight: 400;
			color: #158566;
		}
		.detailList li:nth-child(2n) {
			width: 910px; 
   			height: auto;
			overflow: hidden;
			/* text-overflow: ellipsis; */
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		.detailList li:last-child {
			/* width: 734px; */
   			height: auto;
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
      	.accountList li {
			text-align: left;
			margin-left: 10px;
			line-height: 2.3;
			font-size: 14px;
			color: #21a17e;
		}
		.bottomtr {
			color: #26a07d;
    		background-color: #ccf4d7;
    		box-shadow: inset 0px 6px 7px -2px #c1e6cb;
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
				//$('#m_mtImCd').val("${basicContractInfo.mtImCd}").attr("selected", "true");
				$("input:radio[name='mtImCd']:radio[value='${basicContractInfo.mtImCd}']").prop('checked', true);
				//백계약유무셋팅
				//$('#m_mtSbCtYn').val("${basicContractInfo.mtSbCtYn}").attr("selected", "true");
				$("input:radio[name='mtSbCtYn']:radio[value='${basicContractInfo.mtSbCtYn}']").prop('checked', true);
				//보증증권유무 셋팅
				//$('#m_gbYn').val("${basicContractInfo.gbYn}").attr("selected", "true");
				$("input:radio[name='gbYn']:radio[value='${basicContractInfo.gbYn}']").prop('checked', true);
			'</c:if>'
			
			'<c:if test="${basicContractInfo.mtForcastLinkVo.mtLinkKey != null }">'
				$('#m_delete_forecast').show();
			'</c:if>'
			
			$('li[id^=LI_TOPBar]').click(function(event){
				//location.href = this.title; event.preventDefault();
				/* var formData = $("#mtBasicForm").serializeArray();
				alert(JSON.stringify(formData)); */
				//location.href= "/maintenance/contract/detail/productInfo.do"; 
				//document.mtMoveForm.action = this.title; 
	           	//document.mtMoveForm.submit(); 
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

			
			
			
			var html = '';
			$('#prodList .dtl tbody tr').click(function() {
				/* alert("=====>"+$(this).attr('class')); */
				if($(this).attr('class') != "viewOpen trcheckcolor") {
					html = '<div style="width:997px; height: auto; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>제품상세</li>'
					       + '<li><pre>'+$(this).children().eq(8).text().trim()+'</pre></li>'
					       + '<li>비고</li>'
					       + '<li><pre>'+$(this).children().eq(9).text().trim()+'</pre></li>'
						   + '</ul>'
					       + '</div>'
					       + '</div>';
					$(this).after(html);
					$(this).attr('class', 'viewOpen trcheckcolor');
					var className = $(this).children().children().eq(3).attr('class');
					//console.log("className====>"+className);
					if(className === "down") {
						$(this).children().children().eq(3).attr('src','<c:url value='/images/arrow_up.png'/>');
						$(this).children().children().eq(3).attr('class', "up");
					} else {

						$(this).children().children().eq(3).attr('src','<c:url value='/images/arrow_down.png'/>');
						$(this).children().children().eq(3).attr('class', "down");
					}
					
				} else {
					$(this).children().children().eq(3).attr('src','<c:url value='/images/arrow_down.png'/>');
					$(this).children().children().eq(3).attr('class', "down");
					$(this).removeClass('viewOpen');
					$(this).next().remove();
				}
			});
			
			/* $('#modProductInfo').click(function() {
				if($('.detailList').length === 0) {
					alert('수정할 정보를 선택해 주세요.');
				} else if($('.detailList').length > 1) {
					alert('최대로 수정할 수 있는 개수는 1개 입니다.');
				} else {
					$("#selectTable").css('display','none');
					$('#modTable').css('display','block');
					$("#selectBasicTable").css('display','none');
					$("#modBasicTable").css('display','block');
					$("#modInfo img").attr('src',"/images/btn_save.png");
					$("#modInfo").attr('id','saveInfo');
					
					
					$('#saveInfo').click(function() {
						alert('수정되었습니다.');
						location.reload();
					});
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
			
		});//end document.ready
		
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
		

		//기본정보 수정버튼 클릭
		/* $('#modBasicInfo').click(function() {
			console.log('aaadbdfdf');
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

		}); */
		
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
			var linkObject = {};
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
           	
           	if($('#m_mtLinkCtKey').val() !='' || $('#m_linkDeleteKey').val() !='') {
           		linkObject['mtLinkKey'] = $('#m_mtLinkKey').val();
           		linkObject['mtLinkCtKey'] = $('#m_mtLinkCtKey').val();
           		linkObject['linkDeleteKey'] = $('#m_linkDeleteKey').val();
           		
           		object["mtForcastLinkVo"]=linkObject;     
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
	    				document.m_mtMoveForm.action ="/maintenance/contract/detail/productInfo.do"; 
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
			
			var url = '/maintenance/contract/write/productInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":'<c:out value="${basicContractInfo.mtIntegrateKey}"/>',
					"parmMtSbCtYn":'<c:out value="${basicContractInfo.mtSbCtYn}"/>'					
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			
		}

		function fn_deleteMtPmBtn(){
			var obj = null; 
			if($('input[name="m_gubun"]').is(':checked')) {
				//console.log("mtIntegrateKey.value===>"+document.m_mtMoveForm.mtIntegrateKey.value+"/"+$('input[name="m_gubun"]:checked').val());
				if(confirm("선택한 제품을 삭제하시겠습니까?")){
					obj = {};
					obj["mtIntegrateKey"] = document.m_mtMoveForm.mtIntegrateKey.value;
					obj["mtPmKey"] = $('input[name="m_gubun"]:checked').val();
					$.ajax({
			        	url:"/maintenance/contract/detail/deleteMtProduct.do",
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
			            		alert("유지보수계약 제품정보 삭제를 성공하였습니다.");
			            		
			            		document.m_mtMoveForm.action = "/maintenance/contract/detail/productInfo.do";
			    	           	document.m_mtMoveForm.submit();
			            	} else {
			            		alert("유지보수계약 제품정보 삭제를 실패하였습니다.");
			            		
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
		//기본정보 삭제
		function deleteBasicInfo(){			
			if(confirm("유지보수계약 내용을 삭제하시겠습니까?")){
				var sendData = {
	           			"selectKey":$('#m1_mtIntegrateKey').val()
	           	}
				$.ajax({
	           		url: "/maintenance/contract/deleteContract.do",
	           		dataType: 'text', 
	           		type:"post",  
	           		//data: JSON.parse(sendData),
	           		data: JSON.stringify(sendData),
	           		//data: sendData,
	           		contentType: "application/json; charset=UTF-8", 
	           		beforeSend: function(xhr) {
	           			xhr.setRequestHeader("AJAX", true);	        		
	           		},
	           		success:function(data){	
	           			var paramData = JSON.parse(data);
	           		
	           			if("Y" == paramData.successYN){
	           				alert("유지보수계약 삭제를 성공하였습니다.");
	           				
	           				document.m_mtMoveForm.action = "/maintenance/contract/contractList.do";
	        	           	document.m_mtMoveForm.submit();
	           				
	           			} else {
	           				alert("유지보수계약 삭제를 실패하였습니다.");
	           				
	           			}
	           		},
	           		error: function(request, status, error) {
	           			if(request.status != '0') {
	           				alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	           			}
	           		} 
	           	});    
			} else {
				return false;
			}
		} // end deleteBasicInfo()
		
	    /*
	      hidden값 변경하면 이벤트 발생
	    */
/* 		survey('#m_mtLinkCtKey', function(){
			//console.log('changed');
			//mtLinkCtKey값이 존재하면 삭제 이미지 활성화 시킴.
			if($('#m_mtLinkCtKey').val() !='') {
				$('#m_delete_forecast').show();
			}
		}); */

		function fn_mforecastPop() {
			window.open('/forecast/popup/searchList.do?returnType=F&returnFunctionNm=main_forecastCall&pjFlag=M','FORECAST_LIST','width=1000px,height=713px,left=600');
		}
		
		function main_forecastCall(returnKey,returnNm) {
			
			$('#m_mtLinkCtKey').val(returnKey);
			$('#m_mtLinkCtKeyNm').val(returnNm);
			if($('#m_mtLinkCtKey').val() !='') {
				$('#m_delete_forecast').show();
			}
		}
		
		function fn_mdeleteForecast() {
			if(confirm("FORECAST 연계정보를 삭제하시겠습니까?")) {
				
				if($('#m_mtLinkKey').val() !='') {
					$('#m_linkDeleteKey').val($('#m_mtLinkKey').val());
					$('#m_mtLinkKey').val('');
				}
				$('#m_mtLinkCtKey').val('');
				$('#m_mtLinkCtKeyNm').val('');
				$('#m_delete_forecast').hide();
			} else {
				return false;
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
						
					</div> 
					<form id="m_mtMoveForm" name="m_mtMoveForm" method="post">
						<input type="hidden" id="m1_mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/>
					</form>
					<form id="m_mtBasicForm" name="m_mtBasicForm" method="post">
						<input type="hidden" id="m2_mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/>
						<input type="hidden" id="m_editMode" name="editMode"  value="0"/>
						<input type="hidden" id="m_linkDeleteKey" name="linkDeleteKey"/>
						<div id="basicForm">
							<table class="bsc" id="selectBasicTable">
								<tr>
									<td>FORECAST명</td>
									<td><c:out value="${basicContractInfo.mtForcastLinkVo.mtLinkCtKeyNm}"/></td>
								</tr>
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
									<td>백계약 유무</td>
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
									<td ><pre style="width: 390px"><c:out value="${basicContractInfo.remark}"/></pre></td>
								</tr>
							</table>
							<table class="bsc" id="modBasicTable" style="display:none">
								<tr>
									<td>FORECAST명</td>
									<td>
										<button type="button" onclick="javascript:fn_mforecastPop()" style="vertical-align: middle;">
											<img src="<c:url value='/images/forecast_icon.png'/>" style="width: 180px"/>
										</button>
										<input type="text" name="mtLinkCtKeyNm" id="m_mtLinkCtKeyNm" class="pname"  value="<c:out value="${basicContractInfo.mtForcastLinkVo.mtLinkCtKeyNm}"/>" style="width: 215px" readonly="readonly"/>
										<input type="hidden" name="mtLinkCtKey" id="m_mtLinkCtKey"  value="<c:out value="${basicContractInfo.mtForcastLinkVo.mtLinkCtKey}"/>" />
										<input type="hidden" name="mtLinkKey" id="m_mtLinkKey"  value="<c:out value="${basicContractInfo.mtForcastLinkVo.mtLinkKey}"/>" />
										<img id="m_delete_forecast" src="<c:url value='/images/popup_close.png'/>" onclick="fn_mdeleteForecast();" style="width: 11px;display:none"/>
									</td>
								</tr>
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
										<input type="radio" class="tRadio" name="taxYn" value="Y" id="m_hasVAT1" checked="checked"/><label for="m_hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" class="tRadio" name="taxYn" value="N" id="m_hasVAT2" /><label for="m_hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
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
										<!-- <select id="m_mtImCd" name="mtImCd" style="width: 162px" required>
											<option value="온라인">온라인</option>
											<option value="오프라인">오프라인</option>
										</select> -->
										<input type="radio" class="tRadio" name="mtImCd" value="온라인" id="m_hasImCd1" /><label for="m_hasImCd1" class="cursorP"></label>&nbsp;&nbsp;온라인
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" class="tRadio" name="mtImCd" value="오프라인" id="m_hasImCd2" checked="checked"/><label for="m_hasImCd2" class="cursorP"></label>&nbsp;&nbsp;오프라인
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
										<!-- <select id="m_mtSbCtYn" name="mtSbCtYn" required>
											<option value="N">N</option>
											<option value="Y">Y</option>
										</select> -->
										<input type="radio" class="tRadio" name="mtSbCtYn" value="Y" id="m_hasSbCt1"/><label for="hasSbCt1" class="cursorP"></label>&nbsp;&nbsp;Y
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" class="tRadio" name="mtSbCtYn" value="N" id="m_hasSbCt2" checked="checked"/><label for="hasSbCt2" class="cursorP"></label>&nbsp;&nbsp;N
									</td>
								</tr>
								<tr>
									<td><label>*</label>보증증권 유무</td>
									<td>
										<!-- <select name="gbYn" id="m_gbYn"  required>
											<option value="N">N</option>
											<option value="Y">Y</option>
										</select> -->
										<input type="radio" class="tRadio" name="gbYn" value="Y" id="m_hasGbYn1" /><label for="m_hasGbYn1" class="cursorP"></label>&nbsp;&nbsp;Y
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" class="tRadio" name="gbYn" value="N" id="m_hasGbYn2" checked="checked"/><label for="m_hasGbYn2" class="cursorP"></label>&nbsp;&nbsp;N
										
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
							<button type="button" value="수정" onclick="modeBasicInfo()"><img class="cursorP" src="<c:url value='/images/btn_basic_mod.png'/>" /></button>
							<button type="button" value="삭제" onclick="deleteBasicInfo()"><img class="cursorP" src="<c:url value='/images/btn_basic_del.png'/>" /></button>
						</div>
					</form>
				</div>
			</div>
			<div class="floatR dpBlock fxd">
				<div class="title">
					<ul>
						<li id="LI_TOPBar_PD" class="on" title="productInfo" ><label style="cursor: pointer;">제품정보</label></li>
						<li id="LI_TOPBar_SL" title="salesAmountInfo" ><label style="cursor: pointer;">매출정보</label></li>
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
						제품정보
						<img class="veralignT" src="<c:url value='/images/btn_add.png'/>" style="cursor: pointer;" onclick="fn_addView()"/>
					</div>
					<%-- <div class="stitle2 floatR">
						제품총 합계 : <input type="text" id="productTotalAmout" class="pname" value="<c:out value="${displayUtil.commaStr(mtPmTotalAmount)}"/>" readonly/>
					</div> --%>
					<div class="floatC middle">
						<table class="dtl">
							<thead class="ftw400">
								<tr>
									<th scope="row">선택</th>
									<th scope="row">No</th>
									<th scope="row">제품</th>
									<th scope="row">시리얼번호</th>
									<th scope="row">단가</th>
									<th scope="row">수량</th>
									<th scope="row">합계</th>
									<th scope="row">계약기간</th>
									<th style="max-width: 0px; display: none;"></th>
									<th style="max-width: 0px; display: none;"></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="list" items="${productList}" varStatus="status">
								<tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check<c:out value="${status.count}"/>" value="<c:out value="${list.mtPmKey}"/>" /><label for="check<c:out value="${status.count}"/>" class="cursorP"/>
									</td>
									<td><c:out value="${status.count}"/></td>
									<td class="textalignL"><span title="<c:out value="${list.pmNmCd}"/>"><c:out value="${list.pmNmCd}"/></span> <img class="down" src="<c:url value='/images/arrow_down.png'/>"  /></td>
									<td><span title="<c:out value="${list.mtPmSerialNum}"/>"><c:out value="${list.mtPmSerialNum}"/></span></td>
									<td class="textalignR"><span title="<c:out value="${displayUtil.commaStr(list.mtPmUprice)}"/>"><c:out value="${displayUtil.commaStr(list.mtPmUprice)}"/></span></td>
									<td><c:out value="${displayUtil.commaStr(list.mtPmQuantity)}"/></td>
									<td class="textalignR"><span title="<c:out value="${displayUtil.makeMultiNumber(list.mtPmQuantity, list.mtPmUprice)}"/>"><c:out value="${displayUtil.makeMultiNumber(list.mtPmQuantity, list.mtPmUprice)}"/></span></td>
									<td><c:out value="${displayUtil.displayDate(list.mtPmStartDt)}"/> ~ <c:out value="${displayUtil.displayDate(list.mtPmEndDt)}"/></td>
									<td style="max-width: 0px; display: none;">
										<c:out value="${list.mtPmDetail}"/>
									</td>
									<td style="max-width: 0px; display: none;">
										<c:out value="${list.remark}"/>
									</td>
								</tr>
							</c:forEach>
								 <%-- <tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check7" /><label for="check7" class="cursorP"/>
									</td>
									<td>11</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" class="down" /></td>
									<td><span title="2020010341000026zzz0h1sj">TX112380SERAL3</span></td>
									<td class="textalignR"><span title="600,000,000">60,000,000</span></td>
									<td>5</td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>2021-02-29 ~ 2021-12-32</td>
									<td style="max-width: 0px; display: none;">
										상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세세상세상세상세상세상세상세상세
									</td>
									<td style="max-width: 0px; display: none;">
										비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고
									</td>
								</tr>
								<tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check8" /><label for="check8" class="cursorP"/>
									</td>
									<td>12</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
									<td><span title="2020010341000026zzz0h1sj">TX112380SERAL3</span></td>
									<td class="textalignR"><span title="600,000,000">60,000,000</span></td>
									<td>5</td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>2021-02-29 ~ 2021-12-32</td>
									<td style="max-width: 0px; display: none;">
										상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세
									</td>
									<td style="max-width: 0px; display: none;">
										비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고
									</td>
								</tr>
								<tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check9" /><label for="check9" class="cursorP"/>
									</td>
									<td>13</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
									<td><span title="2020010341000026zzz0h1sj">TX112380SERAL3</span></td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>5</td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>2021-02-29 ~ 2021-12-32</td>
									<td style="max-width: 0px; display: none;">
										상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세
									</td>
									<td style="max-width: 0px; display: none;">
										비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고
									</td>
								</tr>
								<tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check10" /><label for="check10" class="cursorP"/>
									</td>
									<td>15</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
									<td><span title="2020010341000026zzz0h1sj">TX112380SERAL3</span></td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>5</td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>2021-02-29 ~ 2021-12-32</td>
									<td style="max-width: 0px; display: none;">
										상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세
									</td>
									<td style="max-width: 0px; display: none;">
										비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고
									</td>
								</tr>
								<tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check11" /><label for="check11" class="cursorP"/>
									</td>
									<td>16</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
									<td><span title="2020010341000026zzz0h1sj">TX112380SERAL3</span></td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>5</td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>2021-02-29 ~ 2021-12-32</td>
									<td style="max-width: 0px; display: none;">
										상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세
									</td>
									<td style="max-width: 0px; display: none;">
										비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고
									</td>
								</tr>
								<tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check12" /><label for="check12" class="cursorP"/>
									</td>
									<td>17</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
									<td><span title="2020010341000026zzz0h1sj">TX112380SERAL3</span></td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>5</td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>2021-02-29 ~ 2021-12-32</td>
									<td style="max-width: 0px; display: none;">
										상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세
									</td>
									<td style="max-width: 0px; display: none;">
										비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고
									</td>
								</tr>
								<tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check13" /><label for="check13" class="cursorP"/>
									</td>
									<td>18</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
									<td><span title="2020010341000026zzz0h1sj">TX112380SERAL3</span></td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>5</td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>2021-02-29 ~ 2021-12-32</td>
									<td style="max-width: 0px; display: none;">
										상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세
									</td>
									<td style="max-width: 0px; display: none;">
										비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고
									</td>
								</tr>
								<tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check15" /><label for="check15" class="cursorP"/>
									</td>
									<td>19</td>
									<td class="textalignL"><span title="PowerEdge R640PowerEdge R640">PowerEdge R640PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
									<td><span title="2020010341000026zzz0h1sj">2020010341000026zzz0h1sj</span></td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>5</td>
									<td class="textalignR"><span title="600,000,000">600,000,000</span></td>
									<td>2021-02-29 ~ 2021-12-32</td>
									<td style="max-width: 0px; display: none;">
										상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세상세세상세상세상세상세상세상세상세
									</td>
									<td style="max-width: 0px; display: none;">
										비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고비고
									</td>
								</tr> --%>
							</tbody>
						</table>
						<table style="width: 997px">
							<tr class="bottomtr">
								<td class="textalignR" style="width: 230px">제품합계</td>
								<td style="width: 92px"><c:out value="${displayUtil.commaStr(mtPmTotalAmount)}"/></td>
							</tr>
						</table>
					</div>
					<div class="bottom">
						
						<div class="floatR">
							<button type="button" value="수정" onclick="fn_addView()"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
							<button type="button" value="삭제" onclick="fn_deleteMtPmBtn()"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
							<%-- <button type="button" value="Excel"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button> --%>
						</div>
					</div>
				</div>
			</div>
			<div class="floatC"></div>
		</div>
	</div>	
</body>
</html>