<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<%@include file="../../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수계약 상세(백계약)</title>
	
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
		/* 상세화면 전체크기 */
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
		/* 화면타이틀(유지보수작업 상세정보) 글자크기 */
		.title > label {
			font-size: 26px;
		}
		/* 왼쪽기본정보 싸이즈 */
		.mContents > div:first-child {
        	width: 37%;
      	}
		/* 오른쪽 내용(상세정보) 싸이즈 */
		.mContents > .fxd {
			width: 60%;
		}
		/* 소타이틀(기본정보, 발주정보, 제품정보) 관련 css*/
		.mContents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 10px;
			margin-top: 30px;
		}
		/* 기본정보 색상  */
		.mContents .cg {
			color: #24a37e;
		}
		/* 발주추카 이미지 크기 및 위치조정 */
		.mContents .stitle img {
			width: 27px;
			margin-left: 10px;
		}
		.mContents table {
			border-collapse: collapse;
			font-size: 15px;
			table-layout: fixed;
			width: 614px;
		} 
		/* 기본정보 테이블 padding */
		.mContents > div > div > div > table tr td {
			padding: 13px 20px;
		}
		/* 기본정보 타이틀 크기 및 글자크기 */
		.mContents .bsc tr td:first-child {
			width: 153px;
			font-weight: 400;
         	padding: 13px;
		} 
		/* 기본정보 내용 글자 굵기 */
		.mContents .bsc tr td:last-child {
			width: 470px;
			font-weight: 200;
			box-shadow: inset 7px 0 6px -4px #d0e2de;
		}
		/* 기본정보 틀 */
		.mContents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			/* border: 1px solid #bee2da; */
          border-bottom: 2px solid #bfe3db;
		}
		
		.mContents .dtl, .mContents .dtl2 {
		    width: 997px;
		    font-size: 15px;
		    border-collapse: collapse;
		    font-weight: 300;
		    overflow: hidden;
		    border-top: 4px solid #6a5baf;
		}

		.mContents .dtl tbody, .mContents .dtl2 tbody {
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			width: 997px;		
		}
		
		.mContents .dtl thead, .mContents .dtl2 thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
		/* 커서포인터 */
		.mContents .dtl tbody tr, .mContents .dtl2 tbody tr {
		    display: table;
		    width: 997px;
		    /* cursor: pointer; */
		}	
		.mContents .dtl tbody tr {
		    cursor: pointer;
		}		
		
		
		
		/* 발주정보 테이블 틀 나오게 하는 부분 */
		.mContents .dtl thead th, .mContents .dtl tbody tr td ,.mContents .dtl2 thead th, .mContents .dtl2 tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}
			
		
		/* 기본정보 싸이즈 조정 */
		.mContents .bsc tbody {			
			height: 576px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		
		/* 기본정보 글자색 */
		.mContents .bsc tr td {
			color: #26a07d;
			padding : 13px 18px;
		}
		/* 기본정보 세로줄 나오는것 */
		.mContents .bsc tr td:first-child {
			/* box-shadow: inset -7px 0 9px -4px #d0e2de; */		
			width: 153px;
			font-weight: 400;
			padding: 13px 13px 13px 20px;
		}
		.mContents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
			background-color: #d3d3d3;
		}
		/* 제품정보>매출정보>백계약정보>매입정보 버튼 크기및 모양    */
		.mContents > .fxd .title ul li {
			width: 25%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
			border-radius: 35px;
		}
		.mContents .title ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
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
		
		.mContents .dtl tbody tr:hover, .mContents .dtl2 tbody tr:hover {
			background-color: #ddf0ec
		}
		
		/* 발주정보 세로싸이즈 */
		.mContents .dtl tbody {
			height: 176px;
		}
		
		/* 백계약정보 테이블 크기조정 */
		.mContents .dtl thead th:first-child,
		.mContents .dtl tbody td:first-child {
			width: 51px;
			padding: 0;
		}
		.mContents .dtl thead th:nth-child(2),
		.mContents .dtl tbody td:nth-child(2) {
			width: 51px;
		}
		.mContents .dtl thead th:nth-child(3),
		.mContents .dtl tbody td:nth-child(3) {
			width: 190px;
		}
		.mContents .dtl thead th:nth-child(4),
		.mContents .dtl tbody td:nth-child(4) {
			width: 100px;
		}
		.mContents .dtl thead th:nth-child(5) {
			width: 100px;
		}
		.mContents .dtl tbody td:nth-child(5) {
			width: 100px;
			text-align: right;
		}
		.mContents .dtl thead th:nth-child(6),
		.mContents .dtl tbody td:nth-child(6) {
			width: 80px;
		}
		.mContents .dtl thead th:nth-child(7),
		.mContents .dtl tbody td:nth-child(7){
			width: 100px;
		}
		.mContents .dtl thead th:nth-child(8),
		.mContents .dtl tbody td:nth-child(8) {
			width: 220px;
		}	
		/* 발주정보, 제품정보 글짜크기 */
		.dtl tbody tr td, .dtl2 tbody tr td {
			font-weight: 200;
		}
		
		/* 제품정보 세로싸이즈 */
		.mContents .dtl2 tbody {
			height: 241px;
		}
		/* 제품정보 테이블 크기조정 */
		.dtl2 thead th:first-child,
		.dtl2 tbody td:first-child {
			width: 51px;
		}
		.dtl2 thead th:nth-child(2),
		.dtl2 tbody td:nth-child(2) {
			width: 200px;
		}
		.dtl2 thead th:nth-child(3),
		.dtl2 tbody td:nth-child(3) {
			width: 60px;
		}
		.dtl2 thead th:nth-child(4),
		.dtl2 tbody td:nth-child(4) {
			width: 100px;
		}
		.dtl2 thead th:nth-child(5),
		.dtl2 tbody td:nth-child(5) {
			width: 110px;
		}
		.dtl2 thead th:nth-child(6),
		.dtl2 tbody td:nth-child(6) {
			width: 170px;
		}
		.dtl2 thead th:nth-child(7),
		.dtl2 tbody td:nth-child(7) {
			width: 200px;		
		}
		/* 백계약정보에서 제품과 제품상세  ... 으로 표시. */
		
		.mContents .dtl tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 90%;
			margin: 0 auto;
		}
		/* 제품정보>제품에서 V 크기 및 위치  */
		.dtl tbody tr td img {
			width: 13px;
			vertical-align: middle;
			margin-bottom: 5px;
		}
		
		/* 백계약정보 클릭했을때 나타나는 내용에서 제목(비고) */
		.detailList li:nth-child(2n-1) {
		    width: 82px;
		    font-weight: 400;
		    color: #158566;
		}
		/* 백계약정보 클릭했을대 나타나는 내용 */
		.detailList li:nth-child(2n) {
			width: 910px; 
			height: auto;
			overflow: hidden;
			/* text-overflow: ellipsis; */
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
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
			
			'<c:if test="${backOrderList.size() >0 }">'
				//백계약 목록 라이오 버튼값 셋팅
				$("input:radio[name='m_gubun']:radio[value='${selectKey}']").prop('checked', true);
			'</c:if>'
			
			

			$('li[id^=LI_TOPBar]').click(function(event){
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
				
			}); //메뉴바를 이용한 화면이동
			
			//화면 펼치기
			var html = '';
			$('#listForm .dtl tbody tr').click(function() {
				if($(this).attr('class') != "viewOpen trcheckcolor") {
					html = '<div style="width:982px; height: auto; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
					       + '<div style="margin: 5px 71px;">'
					       + '<ul class="detailList">'
					       + '<li>비고</li>'
					       + '<li><pre>'+$(this).children().eq(8).text().trim()+'</pre></li>'
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
			

			/* 기본정보 수정에서 고객사 선택하면 고객담당자 정보 가져오기. */
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
			
			/* 기본정보 수정에서 고객담당자 선택하면 고객담당자 정보 변경하기  */			
			$('#m_mtAcDirectorKey').change(function(){
				var checkVal = $('#m_mtAcDirectorKey option:selected').val();
				$('#m_mtAcDirectorCheck option').each(function() { 
					if (this.value == $('#m_mtAcDirectorKey').val()) { 
						
						$('#m_acDirectorInfo').val(this.text);
						return false;
					}
				});
			});
			
			
			if("Y"==$('#mtWorkOrderYn').val()){
				$("#orderLabel").css('cursor','pointer');
				/* $("#LI_TOPBar_WO"). */
				
			}
			
			/* $('#listForm .dtl tr').each(function(index, item) {
				if(index != 0) {
					$(this).children().eq(0).append('<input type="radio" name="orderGubun" class="tRadio" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				}
			}); */
					
			//거래처 검색
			$("#m_mtAcNm").on("keydown", function(event){
				
				if(event.keyCode == 13) {						
					fnSearchAccoutList(this, $(this).val());
				}						
			});		
			
		}); // end $(document).ready()
		
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
	    				document.m_mtMoveForm.action ="/maintenance/contract/detail/backOrderInfo.do"; 
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

		
		function fn_addView(btnOption){
			var url = '/maintenance/contract/write/backOrderInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":'<c:out value="${basicContractInfo.mtIntegrateKey}"/>',
					"selectKey":$('#selectKey').val(),
					"parmMtSbCtYn":'Y',
					"btnOption" : btnOption
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		
		
		function fn_mdeleteBackOrderBtn(){
			var obj = null; 
			if($('input[name="m_gubun"]').is(':checked')) {
				//console.log("mtIntegrateKey.value===>"+document.m_mtMoveForm.mtIntegrateKey.value+"/"+$('input[name="m_gubun"]:checked').val());
				if(confirm($('#selectMtOrderAcKeyNm').val()+" 의 백계약 정보를 삭제하시겠습니까?")){
					obj = {};
					obj["mtIntegrateKey"] = document.m_mtMoveForm.mtIntegrateKey.value;
					obj["selectKey"] = $('input[name="m_gubun"]:checked').val();
					$.ajax({
			        	url:"/maintenance/contract/delete/backOrder.do",
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
			            		alert("유지보수계약 백계약정보 삭제를 성공하였습니다.");
			            		
			            		document.m_mtMoveForm.action = "/maintenance/contract/detail/backOrderInfo.do";
			    	           	document.m_mtMoveForm.submit();
			            	} else {
			            		alert("유지보수계약 백계약정보 삭제를 실패하였습니다.");
			            		
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
		
		function selectProductList(mtOrderKey,mtOrderAcKeyNm) {
			//alert(mtOrderKey+'/'+$('#selectKey').val());
			if(mtOrderKey !=$('#selectKey').val()) {
				//선택값을 저장한다.
				$('#selectKey').val(mtOrderKey);
				$('#selectMtOrderAcKeyNm').val(mtOrderAcKeyNm);
				var html = '';
				$.ajax({
		        	url:"/maintenance/contract/detail/selectBackOrderProductList.do",
		            dataType: 'json',
		            type:"post",  
		            data: mtOrderKey,
		     	   	contentType: "application/json; charset=UTF-8",
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);
		        		//xhr.setRequestHeader(header, token);
		        	},
		            success:function(data){
		            	//console.log("data.successYN===>"+data.successYN+" / "+data.productList.length);		            	
		            	if("Y" == data.successYN){
		            		if ( data.productList.length > 0 ) {
		            			for(i = 0; i < data.productList.length; i++) {
									html += '<tr>'
				        				+ '<td>'+(i+1)+'</td>'
				        				+ '<td class="textalignL"><span title="'+data.productList[i].mtPmKeyNm+'">'+data.productList[i].mtPmKeyNm+'</span></td>'		
				        				+ '<td class="textalignR">'+addCommas(data.productList[i].mtOrderPmQuantity)+'</td>'
			        					+ '<td class="textalignR">'+addCommas(data.productList[i].mtOrderPmUprice)+'</td>'
			        					+ '<td class="textalignR">'+addCommas(data.productList[i].mtOrderPmQuantity*data.productList[i].mtOrderPmUprice)+'</td>'
			        					+ '<td>'+data.productList[i].mtPmSerialNum+'</td>'
			        					+ '<td>'+addDateMinus(data.productList[i].mtStartDt)+' ~ '+addDateMinus(data.productList[i].mtEndDt)+'</td>'
		            				+ '</tr>'	
		            			}
		            			$('.dtl2 tbody').html('');
		        				$('.dtl2 tbody').append(html);
			                } else {
			                	alert("해당 거래처의 백계약 제품정보가 없습니다.");
			                }
		            	} else {
		                	alert("해당 거래처의 백계약 제품정보 조회를 실패하였습니다.");
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
						<input type="hidden" id="selectKey" name="selectKey" value="<c:out value="${selectKey}"/>"/>
						<input type="hidden" id="selectMtOrderAcKeyNm"  value="<c:out value="${selectMtOrderAcKeyNm}"/>"/>
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
						<li id="LI_TOPBar_PD" title="productInfo"><label style="cursor: pointer;">제품정보</label></li>
						<li id="LI_TOPBar_SL" title="salesAmountInfo"><label style="cursor: pointer;">매출정보</label></li>
						<li id="LI_TOPBar_BC" class="on" title="backOrderInfo"><label style="cursor: pointer;">백계약정보</label></li>
						<li id="LI_TOPBar_PA" title="purchaseAmountInfo"><label style="cursor: pointer;">매입정보</label></li>
						<li></li>
					</ul>
				</div>
				<div id="listForm">
					<div class="stitle cg colorBlack">
						백계약정보&nbsp;<img class="veralignT" src="<c:url value='/images/btn_add.png'/>" style="cursor: pointer;" onclick="fn_addView('newOrder')"/>
					</div>
					<div class="floatC middle" style="border-bottom: 2px solid #c4c4c4;">
						<table class="dtl">
							<thead class="ftw400">
								<tr>
									<th scope="row">선택</th>
									<th scope="row">No</th>
									<th scope="row">매입처</th>
									<th scope="row">매입처담당자</th>
									<th scope="row">합계금액</th>
									<th scope="row">부가세포함</th>
									<th scope="row">발주일자</th>
									<th scope="row">결재조건</th>
									<th style="max-width: 0px; display: none;"></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="list" items="${backOrderList}" varStatus="status">
							<c:choose>
								<c:when test="${status.count==1}">
								<tr class="trcheckcolor">
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check<c:out value="${status.count}"/>" value="<c:out value="${list.mtOrderKey}"/>" onclick="selectProductList('<c:out value="${list.mtOrderKey}"/>','${list.mtOrderAcKeyNm}');"/><label for="check<c:out value="${status.count}"/>" class="cursorP" />										
									</td>
									<td><c:out value="${status.count}"/></td>
									<td class="textalignL"><span><c:out value="${list.mtOrderAcKeyNm}"/></span><img class="down" src="<c:url value='/images/arrow_down.png'/>"  /></td>
									<td><c:out value="${list.mtOrderAcDirectorNm}"/></td>
									<td class="textalignR"><c:out value="${displayUtil.commaStr(list.mtOrderAmount)}"/></td>
									<td><c:out value="${list.taxYn}"/></td>
									<td><c:out value="${displayUtil.displayDate(list.mtOrderDt)}"/></td>
									<td><c:out value="${list.mtOrderPayTerms}"/></td>
									<td style="max-width: 0px; display: none;">
										<c:out value="${list.remark}"/>
									</td>
								</tr>
								</c:when>
								<c:otherwise>
								<tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check<c:out value="${status.count}"/>" value="<c:out value="${list.mtOrderKey}"/>" onclick="selectProductList('<c:out value="${list.mtOrderKey}"/>','${list.mtOrderAcKeyNm}');"/><label for="check<c:out value="${status.count}"/>" class="cursorP" />										
									</td>
									<td><c:out value="${status.count}"/></td>
									<td class="textalignL"><span><c:out value="${list.mtOrderAcKeyNm}"/></span><img class="down" src="<c:url value='/images/arrow_down.png'/>"  /></td>
									<td><c:out value="${list.mtOrderAcDirectorNm}"/></td>
									<td class="textalignR"><c:out value="${displayUtil.commaStr(list.mtOrderAmount)}"/></td>
									<td><c:out value="${list.taxYn}"/></td>
									<td><c:out value="${displayUtil.displayDate(list.mtOrderDt)}"/></td>
									<td><c:out value="${list.mtOrderPayTerms}"/></td>
									<td style="max-width: 0px; display: none;">
										<c:out value="${list.remark}"/>
									</td>
								</tr>
								
								</c:otherwise>
							</c:choose>
								<%-- <tr>
									<td onclick="event.cancelBubble = true;">
										<input type="radio" class="tRadio" name="m_gubun" id="check<c:out value="${status.count}"/>" value="<c:out value="${list.mtOrderKey}"/>" onclick="selectProductList('<c:out value="${list.mtOrderKey}"/>','${list.mtOrderAcKeyNm}');"/><label for="check<c:out value="${status.count}"/>" class="cursorP" />										
									</td>
									<td><c:out value="${status.count}"/></td>
									<td class="textalignL"><span><c:out value="${list.mtOrderAcKeyNm}"/></span><img class="down" src="<c:url value='/images/arrow_down.png'/>"  /></td>
									<td><c:out value="${list.mtOrderAcDirectorNm}"/></td>
									<td class="textalignR"><c:out value="${displayUtil.commaStr(list.mtOrderAmount)}"/></td>
									<td><c:out value="${list.taxYn}"/></td>
									<td><c:out value="${displayUtil.displayDate(list.mtOrderDt)}"/></td>
									<td><c:out value="${list.mtOrderPayTerms}"/></td>
									<td style="max-width: 0px; display: none;">
										<c:out value="${list.remark}"/>
									</td>
								</tr> --%>
							</c:forEach>
								<!-- <tr>
									<td></td>
									<td>1</td>
									<td>대원CTS </td>
									<td>홍길동</td>
									<td>6,160,000</td>
									<td>Y</td>
									<td>2020-11-15</td>
									<td>계산서 발행 후 90일</td>
								</tr>
								<tr>
									<td></td>
									<td>2</td>
									<td>케이디아이에스</td>
									<td>김길동</td>
									<td>24,160,000</td>
									<td>Y</td>
									<td>2020-11-01</td>
									<td>프로젝트 원청 수금 조건</td>
								</tr>
								<tr>
									<td></td>
									<td>3</td>
									<td>대원CTS </td>
									<td>홍길동</td>
									<td>7,160,000</td>
									<td>Y</td>
									<td>2020-11-15</td>
									<td>계산서 발행 후 30일</td>
								</tr>
								<tr>
									<td></td>
									<td>4</td>
									<td>케이디아이에스</td>
									<td>김길동</td>
									<td>24,160,000</td>
									<td>N</td>
									<td>2020-11-01</td>
									<td>프로젝트 원청 수금 조건</td>
								</tr>
								<tr>
									<td></td>
									<td>5</td>
									<td>케이디아이에스</td>
									<td>김길동</td>
									<td>24,160,000</td>
									<td>Y</td>
									<td>2020-11-01</td> 
									<td>계산서 발행 후 30일5</td>
								</tr> -->
							</tbody>
						</table>
					</div>
					
					<div class="stitle cg colorBlack">제품정보</div>
					<div class="floatC" style="border-bottom: 2px solid #c4c4c4;">
						<table class="dtl2">
							<thead class="ftw400">
								<tr>
									<th scope="row">No</th>
									<th scope="row">제품</th>
									<th scope="row">수량</th>
									<th scope="row">단가</th>
									<th scope="row">합계</th>
									<th scope="row">시리얼번호</th>
									<th scope="row">계약기간</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="list" items="${backOrderProductList}" varStatus="status">		
								<tr>							
									<td><c:out value="${status.count}"/></td>
									<td class="textalignL"><span title="<c:out value="${list.mtPmKeyNm}"/>"><c:out value="${list.mtPmKeyNm}"/></span></td>
									<td class="textalignR"><c:out value="${displayUtil.commaStr(list.mtOrderPmQuantity)}"/></td>
									<td class="textalignR"><c:out value="${displayUtil.commaStr(list.mtOrderPmUprice)}"/></td>
									<td class="textalignR"><c:out value="${displayUtil.makeMultiNumber(list.mtOrderPmQuantity, list.mtOrderPmUprice)}"/></td>
									<td><c:out value="${list.mtPmSerialNum}"/></td>
									<td><c:out value="${displayUtil.displayDate(list.mtStartDt)}"/> ~ <c:out value="${displayUtil.displayDate(list.mtEndDt)}"/></td>
								</tr>
							</c:forEach>
								<!-- <tr>
									<td>1</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span></td>
									<td class="textalignR">3</td>
									<td class="textalignR">600,000,000</td>
									<td class="textalignR">1,800,000,000</td>
									<td>CKM0014450026112323</td>
									<td>2020-01-01 ~ 2020-12-31</td>
								</tr>
								<tr>
									<td>2</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span></td>
									<td class="textalignR">3</td>
									<td class="textalignR">600,000,000</td>
									<td class="textalignR">1,800,000,000</td>
									<td>CKM0014450026112323</td>
									<td>2020-01-01 ~ 2020-12-31</td>
								</tr>
								<tr>
									<td>3</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span></td>
									<td class="textalignR">3</td>
									<td class="textalignR">600,000,000</td>
									<td class="textalignR">1,800,000,000</td>
									<td>CKM0014450026112323</td>
									<td>2020-01-01 ~ 2020-12-31</td>
								</tr>
								<tr>
									<td>4</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span></td>
									<td class="textalignR">3</td>
									<td class="textalignR">600,000,000</td>
									<td class="textalignR">1,800,000,000</td>
									<td>CKM0014450026112323</td>
									<td>2020-01-01 ~ 2020-12-31</td>
								</tr>
								<tr>
									<td>5</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span></td>
									<td class="textalignR">3</td>
									<td class="textalignR">600,000,000</td>
									<td class="textalignR">1,800,000,000</td>
									<td>CKM0014450026112323</td>
									<td>2020-01-01 ~ 2020-12-31</td>
								</tr>
								<tr>
									<td>6</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span></td>
									<td class="textalignR">3</td>
									<td class="textalignR">600,000,000</td>
									<td class="textalignR">1,800,000,000</td>
									<td>CKM0014450026112323</td>
									<td>2020-01-01 ~ 2020-12-31</td>
								</tr>
								<tr>
									<td>7</td>
									<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span></td>
									<td class="textalignR">3</td>
									<td class="textalignR">600,000,000</td>
									<td class="textalignR">1,800,000,000</td>
									<td>CKM0014450026112323</td>
									<td>2020-01-01 ~ 2020-12-31</td>
								</tr> -->
							</tbody>
						</table>
					</div>
					<div class="bottom">
						<div class="floatR">
							<button type="button" value="수정" onclick="fn_addView('')"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
							<button type="button" value="삭제" onclick="fn_mdeleteBackOrderBtn();"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
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