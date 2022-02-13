<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../cmm/inc.jsp" %>
<%@include file="../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>매출계획목록</title>
	<style>
		.sfcnt {
			height: 91px;
		}
		form .nav {
			width: 100%;
			height: 49px;
		}
		form .contentsWrap {
			background-color: #f6f7fc;
			box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);
			height: 830px;
		}
		form .contentsWrap .contents {
			padding: 38px 71px; 
			width: 1662px;
		}
		form .title > label {
			font-size: 26px;
		}
		.contentsWrap .contents .top div:nth-child(2) > * {
			vertical-align: top;
		}
		.contentsWrap .contents .top div:nth-child(2) > label {
			line-height: 34px;
			margin: 5px;
			font-weight: 300;
		}
		.middle table {
			width: 1662px;
			font-size: 14px;
			margin-top: 16px;
			border-collapse: collapse;
			overflow: hidden;
			border-bottom: 2px solid #6a5bae;
		}
		.middle table thead {
			background-color: #e1dff5;
			font-size: 15px;
			float: left;
			width: 1662px;
			border-bottom: 3.5px solid #6a5bae;
		}
		.middle table thead tr {
			display: table;
			width: 1662px;
		}
		.middle table tbody {
			width: 1662px;
			height: 545px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		.middle table tbody tr {
			display: table;
			width: 1662px;
			/* cursor: pointer; */
		}
		.middle table tbody tr td > span,
		.bottom table tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 95%;
			margin: 0 auto;
		}
		.middle table tbody tr:hover {
			background-color: #ddf0ec
		}
		.middle table thead th {
			padding: 10px 0;
			border: 1px solid #edebef;
			color: #535353;
		}
		.middle table tbody tr td {
			padding: 8px 0;
			border: 1px solid #edebef;
			color: #535353;
		}
		.middle table tbody tr td > img {
			width: 25px;
			vertical-align: middle;
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
			width: 1396px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		.bottom table {
			width: 100%;
		}
		.bottom table tr td {
			padding: 10px;
			color: #26a07d;
			background-color: #ecf6f4;
			text-align: right;
			width: 121px;
		}
		.bottom table tr td:nth-child(2) {
			width: 141px;
			max-width: 141px;
		}
		.bottom table tr td:nth-child(3) {
			width: 134px;
			max-width: 134px;
		}
		input[type="text"] {
		    height: 36px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 15px;
			color: #000;
		}
		input[type="text"]::placeholder {
			color: #535353;
		}
		input[class="calendar"] {
			width: 150px;
		    background-image: url('/images/calendar_icon.png');
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		input[class="search"] {
			width: 135px;
			height: 47.5px;
			/* background-image: url('/images/search_icon.png'); */
			background-repeat: no-repeat;
			background-position: 95% 50%;
			border : none;
			
		}
		
		.contentsWrap .contents input[class^="calendar"] {
			width: 120px;
			height: 38px;
			background-image: url('/images/calendar_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		.contentsWrap .contents select {
			height: 40px;
			width: 126px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url('/images/arrow_down.png') no-repeat 91% 50%;
			background-color: #fff;
			color: #535353;
			font-size: 15px;
		}
		
		.middle table  thead th:first-child,
		.middle table tbody td:first-child {
			width: 30px;
			max-width: 30px;
		}
		.middle table thead th:nth-child(2),
		.middle table tbody td:nth-child(2) {
			width: 80px;
			max-width: 80px;
		}
		.middle table thead th:nth-child(3),
		.middle table tbody td:nth-child(3) {
			width: 145px;
			max-width: 145px;
		}
		.middle table thead th:nth-child(4),
		.middle table tbody td:nth-child(4) {
			width: 25px;
			max-width: 25px;
		}	
		.middle table thead th:nth-child(5),
		.middle table tbody td:nth-child(5) {
			width: 40px;
			max-width: 40px;
		}	
		.middle table thead th:nth-child(6),
		.middle table tbody td:nth-child(6) {
			width: 58px;
			max-width: 58px;
		}		
		/* 날짜.*/
		.middle table thead th:nth-child(7),
		.middle table tbody td:nth-child(7){
			width: 53px;
			max-width: 53px;
		}
		.middle table thead th:nth-child(8),
		.middle table tbody td:nth-child(8) {
			width: 48px;
			max-width: 48px;
		}		
		.middle table thead th:nth-child(9),
		.middle table tbody td:nth-child(9) {
			width: 43px;
			max-width: 43px;
		}		
		
		.middle table thead th:nth-child(10),
		.middle table tbody td:nth-child(10) {
			width: 91px;
			max-width: 91px;
		}
		.middle table thead th:nth-child(11),
		.middle table tbody td:nth-child(11){
			width: 65px;
			max-width: 65px;
		}
		.middle table thead th:nth-child(12),
		.middle table tbody td:nth-child(12){
			width: 65px;
			max-width: 65px;
		}
		.middle table thead th:nth-child(13),
		.middle table tbody td:nth-child(13) {
			width: 45px;
			max-width: 45px;
		}
		
		
		.middle table thead th:nth-child(14),
		.middle table tbody td:nth-child(14),
		.middle table thead th:nth-child(16),
		.middle table tbody td:nth-child(16) {
			width: 80px;
			max-width: 80px;
		}
		.middle table thead th:nth-child(15),
		.middle table tbody td:nth-child(15) {
			width: 45px;
			max-width: 45px;
		}
		
		.middle table thead th:nth-child(17),
		.middle table tbody td:nth-child(17) {
			width: 58px;
			max-width: 58px;
		}
		
		/* 거래처 스크롤 위치지정 */
		#m_div_accountList {
			width: 240px;
			left: 1265px;
    		margin-top: 0px;
    		text-align: left;
    		
		}
		/* 파랑버튼이미지  */
		.blueBtnStyle {
			width: 60px;
		    height: 26px;
		    background-color: #91a6f2;
		    color: #ffffff;
		    font-weight: bold;
		    border: 1px solid #91a6f2;
		    padding-bottom: 2px;
		    vertical-align: top;
		}
		/* 보라버튼이미지  */
		.purpleBtnStyle {
			width: 60px;
		    height: 26px;
		    background-color: #eb8282;
		    color: #ffffff;
		    font-weight: bold;
		    border: 1px solid #a392f2;
		    padding-bottom: 2px;
		    vertical-align: top;
		}		
		/* 보라버튼이미지  */
		.grayBtnStyle {
			width: 60px;
		    height: 26px;
		    background-color: #bec3c9;
		    color: #ffffff;
		    font-weight: bold;
		    border: 1px solid #a392f2;
		    padding-bottom: 2px;
		    vertical-align: top;
		    cursor: default;
		}
	</style>
	<script>
		$(document).ready(function() {
			/* 
				해당 줄을 클릭했을때 해당 화면으로 이동. 
				billType : 매입(PC), 매출(SD) 구분
			
			$('.middle table tbody tr').click(function() {
				/* console.log("==========");
				console.log("mtIntegrateKey=========="+$(this).children().eq(12).text());
				console.log("mtOrderType=========="+$(this).children().eq(13).text());
				console.log("mtWorkKey=========="+$(this).children().eq(14).text());
				console.log("mtOrderKey=========="+$(this).children().eq(15).text());
				console.log("billType=========="+$(this).children().eq(16).text()); */
				
				/* $('#mtIntegrateKey').val($(this).children().eq(12).text());
				$('#pjKey').val($(this).children().eq(12).text());
				$('#mtOrderType').val($(this).children().eq(13).text());
				$('#mtWorkKey').val($(this).children().eq(14).text());
				$('#mtOrderKey').val($(this).children().eq(15).text()); 
				
				if('SD' == $(this).children().eq(16).text()){
					//제품등록 ==> 매출 ==> 수금요청화면으로 이동
					if(confirm('"'+$(this).children().eq(3).text()+'" 유지보수계약 계산서발행요청 화면으로 이동하시겠습니까?')){
						document.listForm.action = "/mngMaint/bill/detail/main.do";
			           	document.listForm.submit();
					} else {
						return false;
					}
				} else if('PC' == $(this).children().eq(16).text()){
					//발주 ==> 매입  ==> 지급요청화면으로 이동
					
					
					if(confirm('"'+$(this).children().eq(4).text()+' 매입금 지급요청 화면으로 이동하시겠습니까?')){
						document.listForm.action = "/mngMaint/payment/detail/main.do";
			           	document.listForm.submit();
					} else {
						return false;
					}
				}
			});
		*/
			/* $('#fl tr').each(function(index, item) {
				if(index != 0) {
					$(this).children().eq(0).append('<input type="checkbox" class="tCheck" id="check'+ index +'"/><label for="check'+index+'" class="cursorP"/>');
				}
			}); */
			
			//거래처 검색
			//$("#0-billAcNm").on("keydown", function(event){
			$("input[name^='billAcNm']").on("keydown", function(event){
				/* var rowNum = $(this).parent().parent().parent().children().eq(19).text();
				console.log("posiion1===>"+event.key);
				console.log("posiion2===>"+$(this).scrollTop());
				console.log("====>"+'#'+rowNum+'-billAcNm');
				var target = document.getElementById(rowNum+'-billAcNm');
				var targetTop = target.getBoundingClientRect().top;
				var abTop = window.pageYOffset + target.getBoundingClientRect().top;  				
				console.log("posiion3===>"+target+"::"+targetTop+"::"+abTop); */
				
				if(event.keyCode == 13) {		
					fnSearchAccoutList(this, $(this).val(), $(this).parent().parent().parent().children().eq(20).text());
				}						
			});
			
			//검색어 검색
			$("input[name^='searchWord']").on("keydown", function(event){
				if(event.keyCode == 13) {		
					fn_searchList();
				}						
			});
			
			//영업담당 검색
			$("input[name^='searchSaleEmpNm']").on("keydown", function(event){
				if(event.keyCode == 13) {		
					fn_searchList();
				}						
			});
		});	

		//거래처 검색
		function fnSearchAccoutList(pObject, pstAccountNm, rowNum) {
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
		        		fnViewAccountList(pObject, data.accountList, rowNum);
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    }); 
		};
		//거래처 검색
		function fnViewAccountList(pObject, pjAccountList, rowNum){
			//var target = document.getElementById(rowNum+'-billAcNm');
			//클릭한 매출처의 위치 값을 찾는다.
			var targetTop = document.getElementById(rowNum+'-billAcNm').getBoundingClientRect().top;
			//var abTop = window.pageYOffset + target.getBoundingClientRect().top;  
			
			/* var html = '<div id="div_accountList" style="width:179px; padding-top: 7px; margin-left: 112px; padding-bottom: 7px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1); position: absolute;">' */
			// textbox위치값에 textbox크기를 47.5만큼 보정하여 내려준다.
			var html = '<div id="m_div_accountList" style="top:'+(targetTop+47.5)+'px !important;">'         
				+ '<ul class="m_accountList">'
			       ;//+ '<div style="margin: 5px;">';
			       
			       for(var i=0; i < pjAccountList.length; i++) {			    	  
			    	   //console.log("=====>"+pjAccountList[i].acKey+" / "+pjAccountList[i].acNm)
			    	   html += '<li id="m_li_account" title="'+ pjAccountList[i].acKey +'">' + pjAccountList[i].acNm + '</li>';
			    	}
			       
			       
			    html +=  '</ul>'
			          + '</div>'
			         ;//+ '</div>';
			//$('#td_account').after(html);
			//$('#'+rowNum+'-tr_account').after(html);
			
			$('#'+rowNum+'-billAcKey').after(html);
			
			$("[id^='m_li_account']").click(function(event) {
				
				$('#'+rowNum+'-billAcNm').val(this.innerText); 
				$('#'+rowNum+'-billAcKey').val(this.title);
				$('#'+rowNum+'-billAcKey').change();
				$('#m_div_accountList').remove();
			});
		};
		
		/* 세금계산서 발행완료  */ 
		function fnBillIssue(rowNum) {
			var confirmTitle;
			confirmTitle ="'"+ $('#'+rowNum+'-mtNm').val()+"' 유지보수 "+$('#'+rowNum+'-salesTurn').val()
			+"회차("+addDateMinus($('#'+rowNum+'-salesYearMonth').val())+")에 대한 계산서 발급완료 처리하시겠습니까?";
			/* console.log("mtNm====>"+$('#'+rowNum+'-mtNm').val());
			console.log("salesTurn====>"+$('#'+rowNum+'-salesTurn').val());
			console.log("salesCtFkKey====>"+$('#'+rowNum+'-salesCtFkKey').val());
			console.log("salesKey====>"+$('#'+rowNum+'-salesKey').val());
			console.log("salesTurn====>"+$('#'+rowNum+'-salesTurn').val());
			console.log("billIssueType====>"+$('#'+rowNum+'-billIssueType').val());
			console.log("salesTurnAmount====>"+$('#'+rowNum+'-salesTurnAmount').val());
			console.log("billAcKey====>"+$('#'+rowNum+'-billAcKey').val());
			console.log("billSalesCd====>"+$('#'+rowNum+'-billSalesCd').val());
			console.log("billMfCd====>"+$('#'+rowNum+'-billMfCd').val());
			console.log("billIssueDt====>"+$('#'+rowNum+'-billIssueDt').val()); */

			$('#ipt_pjKey').val($('#'+rowNum+'-salesCtFkKey').val()); //유지보수 관리키(mtIntegrateKey)
			$('#ipt_mtSalesOrderKey').val($('#'+rowNum+'-mtSalesOrderKey').val()); //매출계약관리키(MT_SALES_ORDER_TB.MT_SALES_ORDER_KEY)
			$('#ipt_billIssueStatus').val('I'); //계산서 상태
			$('#ipt_billCtFkKey').val($('#'+rowNum+'-salesKey').val()); //수금계획 관리키(MT_SALES_DETAIL_TB.SALES_KEY)
			$('#ipt_billCallKey').val($('#'+rowNum+'-billCallKey').val()); //매출계산서 요청관리키(MT_SD_BILLING_OP_TB.BILL_CALL_KEY)
			$('#ipt_billTurnNo').val($('#'+rowNum+'-salesTurn').val()); //회차정보
			//$('#ipt_billIssueType').val($('#'+rowNum+'-billIssueType').val()); //발행구분(정발행:Y,역발행:N)

			$('#ipt_billAmount').val($('#'+rowNum+'-salesTurnAmount').val()); //수금금액
			$('#ipt_billAcKey').val($('#'+rowNum+'-billAcKey').val()); //매출업체관리키
			//$('#ipt_billSalesCd').val($('#'+rowNum+'-billSalesCd').val()); //매출구분
			//$('#ipt_billMfCd').val($('#'+rowNum+'-billMfCd').val()); //제조사
			$('#ipt_billRequestDt').val($('#'+rowNum+'-billIssueDt').val()); //발행일
			$('#ipt_billIssueDt').val($('#'+rowNum+'-billIssueDt').val()); //발행일
			
			
						
			if($('#'+rowNum+'-billIssueDt').val()==null || $('#'+rowNum+'-billIssueDt').val()=='' || $('#'+rowNum+'-billIssueDt').val().length!=10){
				alert("발급완료일이 입력되지  않았습니다. 발급완료일을 입력하세요!!");
				$('#'+rowNum+'-billIssueDt').focus();
			} else {
				if(confirm(confirmTitle)) {
					fn_saveBtn();				
					
				}
			}
		 }
		 
		 function fn_saveBtn() {
			 var confirmTitle;
			 var billInfo = $("#mtWriteForm").serializeArray();			 
			 //console.log("========= billInfo =======\n" + billInfo);			 
			 for(var i = 0; i < billInfo.length; i++) {
				 
				 //발행예정일
				 if('billRequestDt' == billInfo[i]['name'] || 'billIssueDt' == billInfo[i]['name']) {
					 billInfo[i]['value'] = removeData(billInfo[i]['value'], '-');
				 }
				 
				 //금액
				 if('billAmount' == billInfo[i]['name']) {
					 billInfo[i]['value'] = removeCommas(billInfo[i]['value']);
				 }
				 
				
				 console.log(i+" : " + billInfo[i]['name'] + " : " + billInfo[i]['value']);
			 }
			 
			
			 
			 $.ajax({
		        	url :"/mngMaint/bill/detail/writeBillIssue.do",
		        	type:"POST",  
		        	data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		            //data: JSON.stringify(object),
		     	    //contentType: "application/json; charset=UTF-8",
		     	    
		     	    dataType: 'text',
		            async : false,
		        	success:function(data){		  
		        		var paramData = JSON.parse(data);
		        		if(paramData.successYN=='Y') {
		        			
		        			$("#ipt_billCallKey").val(paramData.billCallKey);
		        			$("#ipt_billIssueStatus").val(paramData.billIssueStatus);
		        					
		        			alert("계산서 발행 완료처리 되었습니다.!")
		        			
		        			form = document.listForm;
		    				form.action = "/mngMaint/billSchedule/salesBillPlanList.do";
		    				form.submit(); 
		        		} else {
       						alert("계산서 발행 완료처리를 실패하였습니다.")
       					}
		        		
		        		//fnReload();
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		    });  
		 }
		 
		 /* 발급매핑(==발급완료)취소.==> 요청상태로 바꾼다. */
		function fnBillIssueCancel(rowNum) {
			//alert("====>"+$('#slt_billTurnNo').val());
			var confirmTitle;
			confirmTitle ="'"+ $('#'+rowNum+'-mtNm').val()+"' 유지보수 "+$('#'+rowNum+'-salesTurn').val()
			+"회차("+addDateMinus($('#'+rowNum+'-salesYearMonth').val())+")에";
			var varParam = {};
			if(confirm(confirmTitle+" 대한 계산서 발급을 취소하시겠습니까?")) {
				/* 매핑취소시  billIssueStatus 상태값을  M 에서 R으로 변경한다. */
				var billInfo = {
						'pjKey' : $('#'+rowNum+'-salesCtFkKey').val()
						, 'mtSalesOrderKey' :$('#'+rowNum+'-mtSalesOrderKey').val()
						, 'billCallKey' : $('#'+rowNum+'-billCallKey').val()
						, 'billCtFkKey' : $('#'+rowNum+'-salesKey').val()
	 					, 'billIssueStatus' : 'R'
	 	 				, 'billMappingYn' : 'N'
				}
					
				$.ajax({
		        	url :"/mngMaint/bill/detail/deleteBillReqeust.do",
		        	type:"POST",  
		            data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){	  
		        		//console.log("step1.====>"+data.successYN);
		        		if(data.successYN=='Y') {
		        			alert(confirmTitle+" 대한 세금계산서발급 취소처리를 성공했습니다.");
		        			
		        			form = document.listForm;
		    				form.action = "/mngMaint/billSchedule/salesBillPlanList.do";
		    				form.submit();
		        		} else {
		        			alert(confirmTitle+" 대한 세금계산서발급(매핑) 취소처리를 실패했습니다.");
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
			
		/* 수금완료 */
		function fnCollectionComplete(rowNum){
			var confirmTitle;
			var tempCollectFinishDt;
			confirmTitle ="'"+ $('#'+rowNum+'-mtNm').val()+"' 유지보수 "+$('#'+rowNum+'-salesTurn').val()
			+"회차("+addDateMinus($('#'+rowNum+'-salesYearMonth').val())+")에";
			var varParam = {};
			
			
			if($('#'+rowNum+'-salesCollectFinishDt').val() !='' && $('#'+rowNum+'-salesCollectFinishDt').val().length ==10) {
				console.log("length========>"+$('#'+rowNum+'-salesCollectFinishDt').val().length);
				tempCollectFinishDt = removeData($('#'+rowNum+'-salesCollectFinishDt').val(),'-');
			} else {
				tempCollectFinishDt = $('#ipt_today').val();
			}
			console.log("tempCollectFinishDt========>"+tempCollectFinishDt);
			if(confirm(confirmTitle+" 대한 수금완료처리를 하시겠습니까?")) {
					/* 수금완료시 시  billIssueStatus 상태값을  E 로 변경한다. */
					var billInfo = {
							'pjKey' : $('#'+rowNum+'-salesCtFkKey').val()
							, 'billCallKey' :$('#'+rowNum+'-billCallKey').val()
							, 'mtSalesOrderKey' :$('#'+rowNum+'-mtSalesOrderKey').val()
							, 'salesKey' : $('#'+rowNum+'-salesKey').val()
							, 'billIssueStatus' : 'E'
							, 'salesCollectFinishDt' :removeData($('#'+rowNum+'-salesCollectFinishDt').val(),'-')
					}
					//console.log("salesCollectFinishDt====>"+$('#'+rowNum+'-salesCollectFinishDt').val()+"/"+removeData($('#'+rowNum+'-salesCollectFinishDt').val(),'-'));
					$.ajax({
				        	url :"/mngMaint/bill/detail/updateSdCollectStatus.do",
				        	type:"POST",  
				            data: billInfo,
				     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				     	    dataType: 'json',
				            async : false,
				        	success:function(data){	
				        		if(data.successYN=='Y') {
				        			alert(confirmTitle+" 대한 수금완료처리를 성공했습니다.");
				        			
				        			form = document.listForm;
				    				form.action = "/mngMaint/billSchedule/salesBillPlanList.do";
				    				form.submit();
				        		} else {
				        			alert(confirmTitle+" 대한 수금완료처리를 실패했습니다.");
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
		/* 수금완료취소  */
		function fnCollectionCompleteCancel(rowNum) {
			//alert("====>"+$('#slt_billTurnNo').val());
			var confirmTitle;
			confirmTitle ="'"+ $('#'+rowNum+'-mtNm').val()+"' 유지보수 "+$('#'+rowNum+'-salesTurn').val()
			+"회차("+addDateMinus($('#'+rowNum+'-salesYearMonth').val())+")에";
			var varParam = {};
			if(confirm(confirmTitle+" 대한 수금완료처리를 취소 하시겠습니까?")) {
				/* 수금취소시  billIssueStatus 상태값을  E 에서 M으로 변경한다. */
				var billInfo = {
						'pjKey' : $('#'+rowNum+'-salesCtFkKey').val()
						, 'billCallKey' : $('#'+rowNum+'-billCallKey').val()
						, 'salesKey' : $('#'+rowNum+'-salesKey').val()
 						, 'billIssueStatus' : 'I'
				}
				
				$.ajax({
		        	url :"/mngMaint/bill/detail/updateSdCollectStatus.do",
		        	type:"POST",  
		            data: billInfo,
		     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		     	    dataType: 'json',
		            async : false,
		        	success:function(data){	  
		        		//console.log("step1.====>"+data.successYN);
		        		if(data.successYN=='Y') {
		        			alert(confirmTitle+" 대한 수금취소처리를 성공했습니다.");
		        			
		        			form = document.listForm;
		    				form.action = "/mngMaint/billSchedule/salesBillPlanList.do";
		    				form.submit();
		        		} else {
		        			alert(confirmTitle+" 대한 수금취소처리를 실패했습니다.");
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
		

		
		function fn_searchList(){
			
			document.listForm.action = "/mngMaint/billSchedule/salesBillPlanList.do";
           	document.listForm.submit(); 
		}
		
		
		function moveSalesPlan(mtIntegrateKey,  mtSalesOrderKey) {
			window.open("/maintenance/contract/detail/salesPlanInfo.do?mtIntegrateKey="+mtIntegrateKey+"&mtSalesOrderKey="+mtSalesOrderKey);
		}
	</script>
</head>
<body>
	<form action="/" id="mtWriteForm" name="mtWriteForm" method="post">
		<input type="hidden" id="ipt_pjKey" name="pjKey"/><!--mtIntegrateKey == pjKey  -->
		<input type="hidden" id="ipt_mtSalesOrderKey" name="mtSalesOrderKey"/><!--매출계약관리키(MT_SALES_ORDER_TB.MT_SALES_ORDER_KEY) -->
		<input type="hidden" id="ipt_billIssueStatus" name="billIssueStatus" />
		<input type="hidden" id="ipt_billCtFkKey" name="billCtFkKey" />	<!-- 수금계획 관리키(MT_SALES_DETAIL_TB.SALES_KEY) -->
		<input type="hidden" id="ipt_billCallKey" name="billCallKey" />	<!-- 매출계산서 요청관리키(MT_SD_BILLING_OP_TB.BILL_CALL_KEY) -->
		<input type="hidden" id="ipt_billTurnNo" name="billTurnNo" />	<!-- 회차정보 -->
		<input type="hidden" id="ipt_billIssueType" name="billIssueType" />	<!-- 발행구분(정발행:Y,역발행:N) -->
		<input type="hidden" id="ipt_billAmount" name="billAmount" /> <!-- 수금금액  -->		
		<input type="hidden" id="ipt_billAcKey" name="billAcKey" /> <!-- 매출업체관리키  -->	
		<input type="hidden" id="ipt_billSalesCd" name="billSalesCd" /> <!-- 매출구분  -->	
		<input type="hidden" id="ipt_billMfCd" name="billMfCd" /> <!-- 제조사  -->	
		<input type="hidden" id="ipt_billRequestDt" name="billRequestDt" /> <!-- 발행예정일  -->
		<input type="hidden" id="ipt_billIssueDt" name="billIssueDt" /> <!-- 계산서발행일자  -->
		<input type="hidden" id="ipt_today"  value="<c:out value="${searchParam.toDay}"/>"/> <!-- 오늘날짜  -->
	</form>
	<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="top">
					<div class="floatL">
						<div class="title floatL"><label class="ftw500">매출계획정보목록</label></div>
						<%-- <div class="addBtn floatL cursorP" onclick="javascript:fn_addView('writeBasic')"><img src="<c:url value='/images/btn_add.png'/>" /></div> --%>
					</div>
					<div class="floatR">
						<form:input path="searchSaleEmpNm" type="text" placeholder="영업담당" style="width: 100px"/>
						<form:input path="fromDate" type="text" class="calendar fromDt" placeholder="계산서일정" value="${searchParam.fromDate}"/> ~ <form:input path="toDate" type="text" class="calendar toDt" placeholder="계산서일정" value="${searchParam.toDate}"/>
						<form:select path="searchGubun">
							<form:option value="PJ" label="프로젝트명" />
							<form:option value="CU" label="고객사" />
							<form:option value="BA" label="매출처" />
						</form:select>
						<form:input path="searchWord" type="text" placeholder="검색어"/>
						<span><button type="button" onclick="fn_searchList();"><img src="<c:url value='/images/icon_search.png'/>" /></button></span>
					</div>
					<div class="floatC"></div>
				</div>
				<div class="middle">
					<table class="textalignC ftw200" id="fl">
						<thead class="ftw400">
							<tr>
								<th scope="row">No</th>
								<th scope="row">고객사</th>
								<th scope="row">유지보수명</th>
								<th scope="row">회차</th>
								<th scope="row">매출년월</th>
								<th scope="row">회차금액</th>
								<th scope="row">계산서예정일</th>
								<th scope="row">상태</th>
								<th scope="row">영업담당</th>
								<th scope="row">매출처</th>
								<th scope="row">매출구분</th>
								<th scope="row">제조사</th>
								<th scope="row">발행구분</th>
								<th scope="row">발급완료일</th>
								<th scope="row">발급버튼</th>
								<th scope="row">수금완료일</th>
								<th scope="row">수금버튼</th>
								<th style="max-width: 0px; display: none;">mtIntegrateKey</th>
								<th style="max-width: 0px; display: none;">billCtFkKey</th>
								<th style="max-width: 0px; display: none;">billAcKey</th>
								<th style="max-width: 0px; display: none;">rowNum</th>
								<th style="max-width: 0px; display: none;">billCallKey</th>
							</tr>
						</thead>
						<tbody>
						<c:set var = "totalAmount" value="0" />
						<c:forEach var="list" items="${mtSalesBillPlanList}" varStatus="status">
							<c:set var = "totalAmount" value="${totalAmount + list.salesTurnAmount}" />
							<tr>
								<td><c:out value="${status.count}"/></td>
								<td class="textalignL" style="cursor:pointer;" onclick="javascript:moveSalesPlan('<c:out value="${list.salesCtFkKey}"/>','<c:out value="${list.mtSalesOrderKey}"/>')"><span title="${list.mtAcNm}">&nbsp;<c:out value="${list.mtAcNm}"/></span></td>
								<td class="textalignL" style="cursor:pointer;" onclick="javascript:moveSalesPlan('<c:out value="${list.salesCtFkKey}"/>','<c:out value="${list.mtSalesOrderKey}"/>')">&nbsp;
									<span title="${list.mtNm}"><c:out value="${list.mtNm}"/></span>
									<input type="hidden" id="<c:out value="${status.index}"/>-mtNm"  value="<c:out value="${list.mtNm}"/>" />
								</td>
								<td>
									<span title="${list.salesTurn}"><c:out value="${list.salesTurn}"/></span>
									<input type="hidden" id="<c:out value="${status.index}"/>-salesTurn"  value="<c:out value="${list.salesTurn}"/>" />
								</td>
								<td>
									<span title="${displayUtil.displayDate(list.salesYearMonth)}"><c:out value="${displayUtil.displayDate(list.salesYearMonth)}"/></span>
									<input type="hidden" id="<c:out value="${status.index}"/>-salesYearMonth"  value="<c:out value="${list.salesYearMonth}"/>" />
								</td>								
								<td class="textalignR">
									<span title="${displayUtil.commaStr(list.salesTurnAmount)}"><c:out value="${displayUtil.commaStr(list.salesTurnAmount)}"/>&nbsp;</span>
									<input type="hidden" id="<c:out value="${status.index}"/>-salesTurnAmount"  value="<c:out value="${list.salesTurnAmount}"/>" />
								</td>
								<td><c:out value="${displayUtil.displayDate(list.salesBillFcDt)}"/></td>
								<%-- <td><c:out value="${displayUtil.displayDate(list.salesCollectFcDt)}"/></td> --%>
								
								<td>
									<c:choose>
										<c:when test="${list.salesStatusCd eq 'R'}">
											<span>발행요청</span>
										</c:when>
										<c:when test="${list.salesStatusCd eq 'I'}">
											<span>계산서발급</span>
										</c:when>
										<c:when test="${list.salesStatusCd eq 'M'}">
											<span>계산서맵핑</span>
										</c:when>
										<c:when test="${list.salesStatusCd eq 'E'}">
											<span>수금완료</span>
										</c:when>
										<c:when test="${list.salesStatusCd == null }">
											<span>발행전</span>
										</c:when>
										<c:otherwise>
											<span>${list.salesStatusCd}</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td><c:out value="${list.saleEmpNm}"/></td>
								<%-- <td><span title="${list.billAcNm}"><c:out value="${list.billAcNm}"/></span></td> --%>
								<td class="textalignL">&nbsp;
									<span title="${list.billAcNm}" ><c:out value="${list.billAcNm}" /></span>
									<input type="hidden" name="billAcKey" id="<c:out value="${status.index}"/>-billAcKey"  value="<c:out value="${list.billAcKey}"/>" />	
								</td>
								<td><span title="${list.billSalesCd}"><c:out value="${list.billSalesCd}"/></span></td>
								<td><span title="${list.billMfCd}"><c:out value="${list.billMfCd}"/></span></td>
								<td>
								<c:choose>
										<c:when test="${list.billIssueType eq 'Y'}">
											<span>정발행</span>
										</c:when>
										<c:when test="${list.billIssueType eq 'N'}">
											<span style="color:red;">역발행</span>
										</c:when>
										<c:otherwise>
											<span>${list.billIssueType}</span>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<input type="text" id="<c:out value="${status.index}"/>-billIssueDt" name="billIssueDt" class="calendar" value="<c:out value="${displayUtil.displayDate(list.billIssueDt)}"/>" style="width:95px; height:27px;font-size: 14px;"/>
								</td>
								<td>									
									<c:choose>
										<c:when test="${list.salesStatusCd eq 'R'}">
											<button type="button" title="발급완료" class="blueBtnStyle" onclick="javascript:fnBillIssue(<c:out value="${status.index}"/>)">발급완료</button>
										</c:when>
										<c:when test="${list.salesStatusCd eq 'I'}">
											<button type="button" title="발급취소" class="purpleBtnStyle" onclick="javascript:fnBillIssueCancel(<c:out value="${status.index}"/>)">발급취소</button>
										</c:when>
										<c:when test="${list.salesStatusCd eq 'M'}">
											<button type="button" title="발급취소" class="purpleBtnStyle" onclick="javascript:fnBillIssueCancel(<c:out value="${status.index}"/>)">발급취소</button>
										</c:when>
										<c:when test="${list.salesStatusCd eq 'E'}">
											<button type="button" title="발급완료" class="grayBtnStyle">발급완료</button>
										</c:when>
										<c:when test="${list.salesStatusCd == null }">
											<button type="button" title="발급완료" class="blueBtnStyle" onclick="javascript:fnBillIssue(<c:out value="${status.index}"/>)">발급완료</button>
										</c:when>
										<c:otherwise>
											<span>${list.salesStatusCd}</span>
										</c:otherwise>
									</c:choose>
									<!-- <button type="button" title="수금완료" class="blueBtnStyle" onclick="javascript:fnCollectionComplete()">발급완료</button> -->
								</td>
								
								<td>
									<input type="text" id="<c:out value="${status.index}"/>-salesCollectFinishDt" name="salesCollectFinishDt" class="calendar" value="<c:out value="${displayUtil.displayDate(list.salesCollectFinishDt)}"/>" style="width:95px; height:27px;font-size: 14px;"/>
								</td>
								<td>									
									<c:choose>
										<c:when test="${list.salesStatusCd eq 'R'}">
											<button type="button" title="수금대기" class="grayBtnStyle">수금대기</button>
										</c:when>
										<c:when test="${list.salesStatusCd eq 'I'}">
											<button type="button" title="수금완료" class="blueBtnStyle" onclick="javascript:fnCollectionComplete(<c:out value="${status.index}"/>)">수금완료</button>
										</c:when>
										<c:when test="${list.salesStatusCd eq 'M'}">
											<button type="button" title="수금완료" class="blueBtnStyle" onclick="javascript:fnCollectionComplete(<c:out value="${status.index}"/>)">수금완료</button>
										</c:when>
										<c:when test="${list.salesStatusCd eq 'E'}">
											<%-- <button type="button" title="수금취소" class="purpleBtnStyle" onclick="javascript:fnCollectionCompleteCancel(<c:out value="${status.index}"/>)">수금취소</button> --%>
											<button type="button" title="수금완료" class="grayBtnStyle">수금완료</button>
										</c:when>
										<c:when test="${list.salesStatusCd == null }">
											<button type="button" title="수금대기" class="grayBtnStyle">수금대기</button>
										</c:when>
										<c:otherwise>
											<span>${list.salesStatusCd}</span>
										</c:otherwise>
									</c:choose>
									
								</td>
								<td style="max-width: 0px; display: none;">
									<input type="hidden" id="<c:out value="${status.index}"/>-salesCtFkKey" value='<c:out value="${list.salesCtFkKey}"/>'/>
								</td>
								<td style="max-width: 0px; display: none;"><input type="hidden" id="<c:out value="${status.index}"/>-salesKey" value="<c:out value="${list.salesKey}"/>"/></td>
								<td style="max-width: 0px; display: none;"><input type="hidden" id="<c:out value="${status.index}"/>-billAcKey" value="<c:out value="${list.billAcKey}"/>"/></td>
								<td style="max-width: 0px; display: none;"><c:out value="${status.index}"/></td>
								<td style="max-width: 0px; display: none;">
									<input type="hidden" id="<c:out value="${status.index}"/>-billCallKey" value="<c:out value="${list.billCallKey}"/>"/>
									<input type="hidden" id="<c:out value="${status.index}"/>-mtSalesOrderKey" value="<c:out value="${list.mtSalesOrderKey}"/>"/>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="bottom">
					<table>
						<tbody class="ftw400">
							<tr>								
								<td style="width:50px;">합계 :</td>
								
								<td style="text-align: left;"><span><c:out value="${displayUtil.commaStr(totalAmount)}"/> 원</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>