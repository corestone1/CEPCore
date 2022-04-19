<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp"%>
<%@include file="../../../cmm/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수계약 상세(매입정보)</title>
	<style>
		.sfcnt {
			height: 91px;
		}
		
		.bottom>div {
			margin-top: 22px;
		}
		
		.nav {
			width: 100%;
			height: 49px;
		}
		
		.mContentsWrap {
			background-color: #f6f7fc;
			box-shadow: inset 0 7px 9px -3px rgba(0, 0, 0, 0.1);
			height: 802px;
		}
		
		.mContentsWrap .mContents {
			padding: 38px 71px;
			width: 1662px;
		}
		
		.title {
			height: 50px;
		}
		
		.title>label {
			font-size: 26px;
		}
		
		.mContents>div:first-child {
			width: 37%;
		}
		
		.mContents>.fxd {
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
		
		.mContents table {
			border-collapse: collapse;
			font-size: 15px;
			table-layout: fixed;
			width: 614px;
		}
		
		.mContents table tr td {
			padding: 13px 18px;
		}
		
		/* 기본정보 싸이즈 조정 */
		.mContents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			/* border: 1px solid #bee2da; */
			border-bottom: 2px solid #bfe3db;
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
			max-width: 430px;
			font-weight: 200;
			box-shadow: inset 7px 0 6px -4px #d0e2de;
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
		
		.mContents>.fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
			background-color: #d3d3d3;
		}
		
		.mContents > .fxd .title ul li {
			width: 16.65%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
			border-radius: 35px;
		}
		
		.mContents>.fxd .title ul li>label {
			display: inline-block;
			width: 100%;
			/* cursor: pointer; */
		}
		
		/* .mContents>.fxd .title ul li.on, .mContents>.fxd .title ul li:hover {
			color: #fff !important;
			background-color: #4c3d92;
		} */
		
		.mContents>.fxd .title ul li.on  {
			color: #fff  !important;
			background-color: #4c3d92 !important;
		}
		
		.mContents>.fxd .title ul li:hover  {
			color: #777777 ;
			background-color: #b9b9b9;
		}
		.mContents .dtlWrap2 {
			height: 445px;
			overflow-y: auto;
			overflow-x: hidden;
			/* border-bottom: 2px solid #c4c4c4; */
		}
		
		/* .mContents .dtl, .mContents .dtl1 {
			width: 992px;
			font-size: 15px;
			border-collapse: collapse;
			font-weight: 300;
			overflow: hidden;
		} */
		
		.mContents .dtl1 thead {
			background-color: #e1dff5;
			float: left;
			width: 996px;
			border-top: 4px solid #6a5baf;
		}
		
		.mContents .dtl thead tr, .mContents .dtl1 thead tr {
			/* display: table; */
			width: 997px;
		}
		
		/* .mContents .dtl {
			width: 992px;
			height: 487px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		} */
		.mContents .dtl {
			width: 996px;
			font-size: 14px;
			border-collapse: collapse;
			font-weight: 300;
			overflow: hidden;
		}
		.mContents .dtl.body {
			height : 445px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			border-bottom: 2px solid #c4c4c4;
		}
		
		.mContents .dtl tbody {
			/* width: 997px;
				   /*height: 532px;*/
			/* overflow-y: auto;
				   overflow-x: hidden; */
			float: left;
			/*border-bottom: 2px solid #c4c4c4;*/
		}
		
		.mContents .dtl tbody tr {
			/* display: table; */
			width: 997px;
			cursor: pointer;
		}
		
		.mContents .dtl tbody:hover {
			background-color: #ddf0ec;
		}
		/* .mContents .dtl thead tr th:first-child, .mContents .dtl1 thead tr th:first-child {
				   width: 10px;
				}
				.mContents .dtl tbody tr:first-child td:first-child {
				   width: 10px;
				} */
		/* .mContents .dtl tbody tr td:nth-child(3) {
				   font-weight: 400;
				} */
		.mContents .dtl1 thead th, .mContents .dtl tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
			width: 102px;
			max-width: 102px
		}
		
		.mContents .dtl tbody tr td {
			font-weight: 200;
		}
		/* .mContents .dtl thead th:first-child,
				.mContents .dtl tbody td:first-child {
				   width: 51px;
				   padding: 0;
				}
				.mContents .dtl thead th:nth-child(2),
				.mContents .dtl tbody td:nth-child(2),
				.mContents .dtl thead th:nth-child(6),
				.mContents .dtl tbody td:nth-child(6) {
				   width: 51px;
				}
				.mContents .dtl thead th:nth-child(3),
				.mContents .dtl tbody td:nth-child(3) {
				   width: 170px;
				}
				.mContents .dtl thead th:nth-child(4),
				.mContents .dtl tbody td:nth-child(4),
				.mContents .dtl thead th:nth-child(5),
				.mContents .dtl tbody td:nth-child(5),
				.mContents .dtl thead th:nth-child(6),
				.mContents .dtl tbody td:nth-child(6),
				.mContents .dtl thead th:nth-child(7),
				.mContents .dtl tbody td:nth-child(7),
				.mContents .dtl thead th:nth-child(8),
				.mContents .dtl tbody td:nth-child(8),
				.mContents .dtl thead th:nth-child(9),
				.mContents .dtl tbody td:nth-child(9), {
				   width: 90px;
				} */
		.mContents .dtl tbody tr td>span {
			display: inline-block;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			width: 84%;
			margin: 0 auto;
		}
		.mContents .bsc tbody tr td > span {
			display: list-item;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 99%;
			margin: 0 auto;
		}
		
		.mContents .dtl tbody tr td img {
			width: 25px;
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
			/* box-shadow: inset -7px 0 9px -4px #d0e2de; */
			width: 132px;
			font-weight: 400;
			padding: 11px 8px 11px 17px;
		}
		
		#modBasicTable tr td:last-child {
			padding: 5px 20px;
			width: 463px;
			box-shadow: inset 7px 0 6px -4px #d0e2de;
		}
		
		#modBasicTable input[type="text"], #modBasicTable textarea {
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
		
		#modBasicTable select, #m_listForm select{
			height: 34px;
			font-size: 14px;
			width: 97px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			-webkit-appearance: none;
			background: url(/images/arrow_down.png) no-repeat 91% 50%;
			background-color: #fff;
			/* color: #0e8a67; */
		}
		
		#modBasicTable input[class^="calendar"] {
			width: 140px !important;
		}
		
		#modBasicTable input[class="search"] {
			background-image: url('/images/search_icon.png');
			background-repeat: no-repeat;
			background-position: 95% 50%;
		}
		
		#modBasicTable input[class="pname"] {
			width: 305px;
			border: none;
			outline: none;
			background-color: #ddf0ec;
		}
		
		.bottomtr input[class="pname"] {
			font-family: "Noto Sans KR", sans-serif !important;
			width: 130px;
			height: 18px;
			border: none;
			outline: none;
			background-color: #ccf4d7;
			color: #26a07d;
			text-align: left;
			font-size: 15px;
			font-weight: 400;
			margin-bottom: 1px;
			padding: 0px 0px;
		}
		
		.bsc input[type="text"] {
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
		
		/* input[clastRadioeck"]+label {
			width: 24px !important;
			height: 24px !important;
		} */
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
		/* 파랑버튼이미지  */
		.blueBtnStyle2 {
			width: 100px;
		    height: 22px;
		    background-color: #91a6f2;
		    color: #ffffff;
		    border: 1px solid #91a6f2;
		    padding-bottom: 2px;
		    vertical-align: top;
		    border-radius: 35px
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
			//$("input:radio[name='taxYn']:radio[value='${basicContractInfo.taxYn}']").prop('checked', true);
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
         
         
         /* $('li[id^=LI_TOPBar]').click(function(event){ location.href = this.title; event.preventDefault();}); */
         $('li[id^=LI_TOPBar]').click(function(event){
				if(this.title == "productInfo"){
					if(confirm("유지보수계약 매출계약정보 상세화면으로 이동하시겠습니까?")){
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
						alert(" 유지보수계약 매출계약정보가 등록되지 않았습니다.\n 유지보수계약 매출계약정보를 먼저 등록하세요.");
					}
					
					
				} else if(this.title == "salesPlanInfo"){
					
					if("${mtContractCountInfo.mtProductCnt}" > 0){
						if(confirm("유지보수계약 계산서계획 상세화면으로 이동하시겠습니까?")){
							document.m_mtMoveForm.action = "/maintenance/contract/detail/salesPlanInfo.do";
				           	document.m_mtMoveForm.submit();
						}
					} else {
						alert(" 유지보수계약 매출계약정보가 등록되지 않았습니다.\n 유지보수계약 매출계약정보를 먼저 등록하세요.");
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
				} else if(this.title == "paymentPlanInfo"){
					
					if("${parmMtSbCtYn}" == "Y"){
						if("${mtContractCountInfo.mtBackOrderCnt}" > 0){
							if(confirm("유지보수계약 지금계획 상세화면으로 이동하시겠습니까?")){
								document.m_mtMoveForm.action = "/maintenance/contract/detail/paymentPlanInfo.do";
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
			
			
			$('#m_mtSaveOrderAcKey').change(function(){
				//console.log("=========>"+$('#m1_mtIntegrateKey').val()+" / "+$('#m_mtSaveOrderAcKey option:selected').val()+"<=====");
				//선택값을 저장한다.
				 var varParam = {
						"mtIntegrateKey": $('#m1_mtIntegrateKey').val(),
						"mtOrderKey":$('#m_mtSaveOrderAcKey option:selected').val()
				};
				
				var html = ''; 
				$.ajax({
		        	url:"/maintenance/contract/detail/selectPurchaseAmountListWithOderKey.do",
		            dataType: 'json',
		            type:"post",  
		            data: JSON.stringify(varParam),
		     	   	contentType: "application/json; charset=UTF-8",
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);
		        		//xhr.setRequestHeader(header, token);
		        	},
		            success:function(data){
		            	//console.log("data.successYN===>"+data.successYN+" / "+data.purchaseAmountList.length);		            	
		            	if("Y" == data.successYN){
		            		$('#purchaseTotalAmount').val(addCommas(data.mtPurchaseTotalAmount));
		            		if ( data.purchaseAmountList.length > 0 ) {
		            			for(i = 0; i < data.purchaseAmountList.length; i++) {
									html += '<tbody>'
										+ '<tr>'
										+ '	<td rowspan="2" style="width: 10px" style="10px">'
										+ '		<input type="radio" class="tRadio" name="m_gubun" id="check'+(i+1)+'" value="'+data.purchaseAmountList[i].mtOrderKey+':'+data.purchaseAmountList[i].mtBuyKey+':'+data.purchaseAmountList[i].mtBuyYear+'" /><label for="check'+(i+1)+'" class="cursorP"/>'
										+ '	</td>'
										+ '	<td style="width: 130px; max-width: 130px">'+data.purchaseAmountList[i].mtOrderAcNm+'</td>'
										+ '	<td style="font-weight: 400;">'+data.purchaseAmountList[i].mtBuyYear+'</td>'
										+ '	<td title="1월">'+addCommas(data.purchaseAmountList[i].mtBuyJanAmount)+'</td>'
										+ '	<td title="2월">'+addCommas(data.purchaseAmountList[i].mtBuyFebAmount)+'</td>'
										+ '	<td title="3월">'+addCommas(data.purchaseAmountList[i].mtBuyMarAmount)+'</td>'
										+ '	<td title="4월">'+addCommas(data.purchaseAmountList[i].mtBuyAprAmount)+'</td>'
										+ '	<td title="5월">'+addCommas(data.purchaseAmountList[i].mtBuyMayAmount)+'</td>'
										+ '	<td title="6월">'+addCommas(data.purchaseAmountList[i].mtBuyJunAmount)+'</td>'
										+ '</tr>'
										+ '<tr>'
										+ '	<td style="width: 130px; max-width: 130px">'+data.purchaseAmountList[i].mtOrderPayTerms+'</td>'
										+ '	<td title="년도합계">'
										+ addCommas(
										data.purchaseAmountList[i].mtBuyJanAmount
										+ data.purchaseAmountList[i].mtBuyFebAmount
										+ data.purchaseAmountList[i].mtBuyMarAmount
										+ data.purchaseAmountList[i].mtBuyAprAmount
										+ data.purchaseAmountList[i].mtBuyMayAmount
										+ data.purchaseAmountList[i].mtBuyJunAmount
										+ data.purchaseAmountList[i].mtBuyJulAmount
										+ data.purchaseAmountList[i].mtBuyAugAmount
										+ data.purchaseAmountList[i].mtBuySepAmount
										+ data.purchaseAmountList[i].mtBuyOctAmount
										+ data.purchaseAmountList[i].mtBuyNovAmount
										+ data.purchaseAmountList[i].mtBuyDecAmount
										 )
										+ '	</td>'
										+ '	<td title="7월">'+addCommas(data.purchaseAmountList[i].mtBuyJulAmount)+'</td>'
										+ '	<td title="8월">'+addCommas(data.purchaseAmountList[i].mtBuyAugAmount)+'</td>'
										+ '	<td title="9월">'+addCommas(data.purchaseAmountList[i].mtBuySepAmount)+'</td>'
										+ '	<td title="10월">'+addCommas(data.purchaseAmountList[i].mtBuyOctAmount)+'</td>'
										+ '	<td title="11월">'+addCommas(data.purchaseAmountList[i].mtBuyNovAmount)+'</td>'
										+ '	<td title="12월">'+addCommas(data.purchaseAmountList[i].mtBuyDecAmount)+'</td>'
										+ '</tr>'		
		            					+ '</tbody>'
		            							            					
		            			}
		            			$('.dtlWrap2 table').html('');
		        				$('.dtlWrap2 table').append(html);
			                } else {
			                	alert("해당 거래처의 매입정보가 없습니다.");
			                }
		            	} else {
		                	alert("해당 거래처의 매입정보 조회를 실패하였습니다.");
		                }
						
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		        }); 
				
			});		
					
			//거래처 검색
			$("#m_mtAcNm").on("keydown", function(event){
				
				if(event.keyCode == 13) {						
					fnSearchAccoutList(this, $(this).val());
				}						
			});		
         
      }); // end  $(document).ready()
		
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
		//팝업으로 호출하는 방식으로 변경 2021-08-11
		function modeBasicInfo(){
			
			var url = '/maintenance/contract/write/basicInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":'<c:out value="${basicContractInfo.mtIntegrateKey}"/>',
					"parmMtSbCtYn":'<c:out value="${basicContractInfo.mtSbCtYn}"/>'					
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}
		/* function modeBasicInfo(){
			
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
		} */
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
	    				document.m_mtMoveForm.action ="/maintenance/contract/detail/purchaseAmountInfo.do"; 
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
      
		function fn_editMtPurchaseBtn(){
			var selectVal;
			var paramOrderKey;
			if($('input[name="m_gubun"]').is(':checked')) {
				//console.log("========================>"+$('input[name="m_gubun"]:checked').val());
				selectVal = $('input[name="m_gubun"]:checked').val();
				paramOrderKey = selectVal.split(':')[0];
				//console.log("paramOrderKey========================>"+paramOrderKey+"/<c:out value="${basicContractInfo.mtIntegrateKey}"/>");
				
				var url = '/maintenance/contract/write/purchaseAmountView.do';
				var dialogId = 'program_layer';
				var varParam = {
						"mtIntegrateKey":'<c:out value="${basicContractInfo.mtIntegrateKey}"/>',
						"mtOrderKey":paramOrderKey,
						"parmMtSbCtYn":'Y'			
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			} else {
				alert("수정할 매입정보 대상을 먼저 선택하세요 !!");
			}
			
			
			/* var url = '/maintenance/contract/write/purchaseAmountView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":'<c:out value="${basicContractInfo.mtIntegrateKey}"/>',
					"selectKey":$('input[name="m_gubun"]:checked').val(),
					"parmMtSbCtYn":'Y'			
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');  */
		}

		/* function fn_deleteMtPurchaseBtn(){
			var obj = null; 
			var selectVal;
			var paramOrderKey;
			var deleteBuyKey;
			if($('input[name="m_gubun"]').is(':checked')) {
				//console.log("mtIntegrateKey.value===>"+document.m_mtMoveForm.mtIntegrateKey.value+"/"+$('input[name="m_gubun"]:checked').val());
				selectVal = $('input[name="m_gubun"]:checked').val();
				
				if(confirm(selectVal.split(':')[2]+"년도 매입정보를 삭제하시겠습니까?")){
					
					paramOrderKey = selectVal.split(':')[0];
					deleteBuyKey = selectVal.split(':')[1];
					obj = {};
					obj["mtIntegrateKey"] = '<c:out value="${basicContractInfo.mtIntegrateKey}"/>';
					obj["mtOrderKey"] = paramOrderKey;
					obj["deleteListKeys"] = deleteBuyKey;
					$.ajax({
			        	url:"/maintenance/contract/detail/deletePurchaseAmountYear.do",
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
			            		alert("유지보수계약 매입정보 삭제를 성공하였습니다.");
			            		
			            		document.m_mtMoveForm.action = "/maintenance/contract/detail/purchaseAmountInfo.do";
			    	           	document.m_mtMoveForm.submit();
			            	} else {
			            		alert("유지보수계약 매입정보 삭제를 실패하였습니다.");
			            		
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
		} */
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
		
		// 파일다운로드 관련
		function fn_downFile(fileKey, fileOrgNm) {
			var form = document.viewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#viewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}
		
		//보증증권
		function fnShowStock() {
			
			var dialogId = 'program_layer';
			
			var varParam = {'mtIntegrateKey' : $('#m1_mtIntegrateKey').val(), 'bdKey' : $('#bdKey').val()};
			
			var button = new Array;
			button = [];
			showModalPop(dialogId, "/maintenance/contract/detail/viewStockPublishCT.do", varParam, button, '', 'width:648px;height:575px');
		}
		//계산서 발생요청
		function fnMoveBillDetail() {
			
			if(confirm("유지보수계약 계산서발행요청 화면으로 이동하시겠습니까?")){
				document.m_mtMoveForm.action = "/mngMaint/bill/detail/main.do";
	           	document.m_mtMoveForm.submit();
			}
			
		}
		
		//판매품의서 오픈
		function fnViewApproval(mtIntegrateKey) {
			window.open("/maintenance/contract/viewApproval.do?mtIntegrateKey="+mtIntegrateKey);
		}

		
		function goForcast(spKey) {
			var url1 = '/forecast/write/basic.do';
			var dialogId1 = 'program_layer';
			var varParam1 = {'spKey' : spKey};
			
			var button1 = new Array;
			button1 = [];
			showModalPop(dialogId1, url1, varParam1, button1, '', 'width:1144px;height:708px');
		}
		
		function fn_addView(link){
			
			if(link == "forecastList") {
				location.href="<c:url value='/forecast/list.do'/>";
			} else {
				var url = '/forecast/write/'+link+'.do';
				var dialogId = 'program_layer';
				
				var varParam = {'spKey' : $('#m_ipt_spKey').val(), "workClass":$("#workClass").val()};
				
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			}
		}
   </script>
</head>
<body>
	<%-- <input type="hidden" id="selectKey" name="selectKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/> --%>
	<!-- <div class="sfcnt"></div>
	<div class="nav"></div> -->
	<div class="mContentsWrap">
		<div class="mContents mgauto">
			<div class="floatL">
				<div class="title">
					<label class="ftw500">유지보수 상세정보</label>
				</div>
				<div>
					<div class="stitle cg">
						기본정보
						<%-- <button type="button" value="수정" id="modBasicInfo"
							onclick="modeBasicInfo()">
							<img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" />
						</button> --%>
					</div>
					<form id="m_mtMoveForm" name="m_mtMoveForm" method="post">
						<input type="hidden" id="m1_mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>" />
					</form>
					<form id="m_mtBasicForm" name="m_mtBasicForm" method="post">
						<input type="hidden" id="m2_mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>" />
						<input type="hidden" id="m_editMode" name="editMode" value="0" />
						<input type="hidden" id="bdKey" name="bdKey" value="${mtGuarantyBondInfo.gbKey}" />
						<div id="basicForm">
							<table class="bsc" id="selectBasicTable">
								<tr>
									<td>FORECAST명</td>
									<td>
										<c:out value="${basicContractInfo.mtForcastLinkVo.mtLinkCtKeyNm}"/>										
										<%-- <button type="button" title="forecast정보" class="blueBtnStyle2" onclick="goForcast('${basicContractInfo.mtForcastLinkVo.mtLinkCtKey}')">forecast정보</button> --%>						
									</td>
								</tr>
								<tr>
									<td>PROJECT명</td>
									<td><c:out value="${basicContractInfo.mtProjectLinkVo.mtLinkCtKeyNm}"/></td>
								</tr>
								<tr>
									<td>유지보수명</td>
									<td><c:out value="${basicContractInfo.mtNm}"/></td>
								</tr>
								<tr>
									<td>고객사</td>
									<td><c:out value="${basicContractInfo.mtAcNm}" /></td>
								</tr>
								<tr>
									<td>고객사담당자</td>
									<td>
										<c:out value="${basicContractInfo.mtAcDirectorNm}" /> / <c:out value="${basicContractInfo.acDirectorInfo}" />
									</td>
								</tr>
								<tr>
									<td>계약일자</td>
									<td><c:out value="${displayUtil.displayDate(basicContractInfo.mtCtDt)}" /></td>
								</tr>
								<tr>
									<td>유지보수 기간</td>
									<td><c:out value="${displayUtil.displayDate(basicContractInfo.mtStartDt)}" />
										~ <c:out value="${displayUtil.displayDate(basicContractInfo.mtEndDt)}" /></td>
								</tr>
								<tr>
									<td>총계약금액</td>
									<td><c:out value="${displayUtil.commaStr(basicContractInfo.mtAmount)}" /></td>
								</tr>
								<%-- <tr>
									<td>부가세포함</td>
									<td><c:out value="${basicContractInfo.taxYn}" /></td>
								</tr> --%>
								<tr>
									<td>결제조건</td>
									<td><c:out value="${basicContractInfo.mtPayTerms}" /></td>
								</tr>
								<tr>
									<td>검수방법</td>
									<td><c:out value="${basicContractInfo.mtImCd}" /></td>
								</tr>
								<tr>
									<td>정기점검 횟수</td>
									<td><c:out value="${basicContractInfo.mtRgInspectCnt}" />회</td>
								</tr>
								<tr>
									<td>보증증권 유무</td>
									<td>
										<c:out value="${basicContractInfo.gbYn}"/>
										<c:if test='${basicContractInfo.gbYn eq "Y"}'>
											&nbsp;&nbsp;
											( 진행상태&nbsp;:&nbsp;
											<c:choose>
												<c:when test='${mtGuarantyBondInfo.gbIssueYn eq "N"}'>
													신청 전 ) &nbsp;&nbsp;
													<c:choose>
														<c:when test='${sessionScope.empAuthCd == "EMAU1001"}'>
															<span style="cursor: hand;display: contents;">
																<img src="/images/btn_stock_publish.png" style="vertical-align: middle;cursor:default; filter:grayscale(1);"/>
															</span>
														</c:when>
														<c:otherwise>
															<span style="cursor: hand;display: contents;">
																<img src="/images/btn_stock_publish.png" onclick="javascript:fnShowStock();"  style="vertical-align: middle;"/>
															</span>
														</c:otherwise>
													</c:choose>
													
													
												</c:when>
												<c:when test='${mtGuarantyBondInfo.gbIssueYn eq "R"}'>
													승인중 ) &nbsp;&nbsp;
													<span style="cursor: hand;display: contents;">
														<img src="/images/btn_blue_reqInfo.png" onclick="javascript:fnShowStock();" style="vertical-align: middle;"/>
													</span>
												</c:when>
												<c:when test='${mtGuarantyBondInfo.gbIssueYn eq "Y"}'>
													발행완료 ) &nbsp;&nbsp;
													<span style="cursor: hand;display: contents;">
														<img src="/images/btn_stock_detail.png"     onclick="javascript:fnShowStock();" style="vertical-align: middle;"/>
													</span>
												</c:when>
											</c:choose>											
										</c:if>
									</td>
								</tr>
								<tr>
									<td>백계약 유무</td>
									<td><c:out value="${basicContractInfo.mtSbCtYn}"/></td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td><c:out value="${basicContractInfo.supportEmpNm}" /></td>
								</tr>
								<tr>
									<td>관리담당자</td>
									<td><c:out value="${basicContractInfo.mngEmpNm}" /></td>
								</tr>
								<tr>
									<td>영업담당자</td>
									<td><c:out value="${basicContractInfo.saleEmpNm}" /></td>
								</tr>
								<tr>
									<td>비고</td>
									<td>
										<pre style="width: 390px">
											<c:out value="${basicContractInfo.remark}" />
										</pre>
									</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td >
										<c:forEach var="result" items="${fileList }" varStatus="status">
											<%-- <input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/> --%>
											<%-- <a href="javascript:fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')"><c:out value="${result.fileOrgNm}"/></a> --%>
											<button type="button" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>');" style="color: #26a07d;text-align: left;">
												<u style="font-weight: 200;font-size: 15px;"><c:out value="${result.fileOrgNm}"/></u>
											</button>
											<c:if test="${status.last eq false}"><br /></c:if>
										</c:forEach>
									</td>
								</tr>
							</table>
							<table class="bsc" id="modBasicTable" style="display: none">
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
									<td><label>*</label>유지보수명</td>
									<td><input type="text" name="mtNm" value="<c:out value="${basicContractInfo.mtNm}"/>" required /></td>
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
												<option value="<c:out value="${item.acDirectorKey}"/>"><c:out value="${item.acDirectorNm}" /></option>
											</c:forEach>
										</select> 
										<select id="m_mtAcDirectorCheck" style="display: none">
											<c:forEach var="item" items="${acDirectorList}" varStatus="status">
												<option value="<c:out value="${item.acDirectorKey}"/>"><c:out value="${item.acDirectorInfo}" /></option>
											</c:forEach>
										</select> 
										<input type="text" id="m_acDirectorInfo" class="pname" value="<c:out value="${basicContractInfo.acDirectorInfo}"/>" readonly />
									</td>
								</tr>
								<tr>
									<td><label>*</label>계약일자</td>
									<td>
										<input type="text" name="mtCtDt" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(basicContractInfo.mtCtDt)}"/>" required />
									</td>
								</tr>
								<tr>
									<td><label>*</label>유지보수 기간</td>
									<td>
										<input type="text" name="mtStartDt" placeholder="from" class="calendar fromDt" value="<c:out value="${displayUtil.displayDate(basicContractInfo.mtStartDt)}"/>" required /> 
										~ 
										<input type="text" name="mtEndDt" placeholder="to" class="calendar toDt" value="<c:out value="${displayUtil.displayDate(basicContractInfo.mtEndDt)}"/>" required />
									</td>
								</tr>
								<tr>
									<td><label>*</label>유지보수금액</td>
									<td>
										<input type="text" id="m_mtAmount" name="mtAmount" value="<c:out value="${displayUtil.commaStr(basicContractInfo.mtAmount)}"/>" amountOnly required style="width: 140px; text-align: right;" />
									</td>
								</tr>
								<!-- <tr>
									<td><label>*</label>부가세포함</td>
									<td>
										<input type="radio" class="tRadio" name="taxYn" value="Y" id="m_hasVAT1" checked="checked" /><label for="m_hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" class="tRadio" name="taxYn" value="N" id="m_hasVAT2" /><label for="m_hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
									</td>
								</tr> -->
								<tr>
									<td><label>*</label>결제조건</td>
									<td><input type="text" id="m_mtPayTerms" name="mtPayTerms" style="width: 140px" value="<c:out value="${basicContractInfo.mtPayTerms}"/>" required /></td>
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
									<td><select id="m_mtSupportEmpKey" name="mtSupportEmpKey"
										required>
											<c:forEach var="emp" items="${empList}" varStatus="status">
												<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}" /></option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td><label>*</label>관리담당자</td>
									<td><select id="m_mtMngEmpKey" name="mtMngEmpKey" required>
											<c:forEach var="emp" items="${empList}" varStatus="status">
												<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}" /></option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td><label>*</label>영업담당자</td>
									<td><select id="m_mtSaleEmpKey" name="mtSaleEmpKey" required>
											<c:forEach var="emp" items="${empList}" varStatus="status">
												<option value="<c:out value="${emp.empKey}"/>"><c:out value="${emp.empNm}" /></option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td>비고</td>
									<td><textarea name="remark"><c:out value="${basicContractInfo.remark}" /></textarea></td>
								</tr>
							</table>
						</div>
						<div class="floatL" style="margin-top: 22px">
							<c:if test='${sessionScope.userInfo.empKey == basicContractInfo.regEmpKey}'>
								<button type="button" value="수정" onclick="modeBasicInfo()"><img class="cursorP" src="<c:url value='/images/btn_basic_mod.png'/>" /></button>
							</c:if>
														
							<%-- <button type="button" value="삭제" onclick="deleteBasicInfo()"><img class="cursorP" src="<c:url value='/images/btn_basic_del.png'/>" /></button> --%>
							<button type="button" title="판매 품의서"  onclick="fnViewApproval('${basicContractInfo.mtIntegrateKey}')"><img class="cursorP" src="<c:url value='/images/btn_approval.png'/>" /></button>
						</div>
					</form>
				</div>
			</div>
			<div class="floatR dpBlock fxd">
				<div class="title">
					<ul>
						<li id="LI_TOPBar_PD" title="productInfo"><label style="cursor: pointer;">매출계약정보</label></li>
						<li id="LI_TOPBar_SL" title="salesAmountInfo"><label style="cursor: pointer;">매출정보</label></li>
						<li id="LI_TOPBar_SL" title="salesPlanInfo" ><label style="cursor: pointer;">계산서계획</label></li>
						<li id="LI_TOPBar_BC" title="backOrderInfo"><label style="cursor: pointer;">백계약정보</label></li>
						<li id="LI_TOPBar_PA" class="on" title="purchaseAmountInfo"><label style="cursor: pointer;">매입정보</label></li>						
						<li id="LI_TOPBar_PA" title="paymentPlanInfo"><label style="cursor: pointer;">지급계획</label></li>
						<li></li>
					</ul>
				</div>
				<div id="m_listForm">
					<div class="stitle cg colorBlack floatL" style="margin-top: 26px;">
						매입정보
						<%-- <img class="veralignT" src="<c:url value='/images/btn_add.png'/>" /> --%>						
						<%--<select id="m_mtSaveOrderAcKey" name="m_mtSaveOrderAcKey" style="width:150px;height: 30px;">
 						<c:choose>
						<c:when test="${null !=backOrderSelectBox && backOrderSelectBox.size()>1}">
							<option value="">전체</option>														
						<c:forEach var="order" items="${backOrderSelectBox}" varStatus="status">
							<option value="<c:out value="${order.mtOrderKey}"/>"><c:out value="${order.mtAcNm}"/></option>
						</c:forEach>
						</c:when>
						<c:otherwise>
						<c:forEach var="order" items="${backOrderSelectBox}" varStatus="status">
							<option value="<c:out value="${order.mtOrderKey}"/>"><c:out value="${order.mtAcNm}"/></option>
						</c:forEach>
						</c:otherwise>
						</c:choose>															
						</select> --%>
						
						<c:if test="${null !=backOrderSelectBox && backOrderSelectBox.size()>1}">
						<select id="m_mtSaveOrderAcKey" name="m_mtSaveOrderAcKey" style="width:200px;height: 30px;">
							<option value="">전체</option>														
						<c:forEach var="order" items="${backOrderSelectBox}" varStatus="status">
							<option value="<c:out value="${order.mtOrderKey}"/>"><c:out value="${order.mtAcNm}"/></option>
						</c:forEach>
						</select>
						</c:if>
						
					</div>
					<%-- <div class="stitle2 floatR">
						매입총 합계 : <input type="text" id="purchaseTotalAmount" class="pname"
							value="<c:out value="${displayUtil.commaStr(mtPurchaseTotalAmount)}"/>" readonly />
					</div> --%>
					<div class="floatC dtlWrap middle2">
						<table class="dtl1">
							<thead class="ftw400">
								<tr>
									<th rowspan="2" style="width: 10px">선택</th>
									<th style="width: 130px; max-width: 130px">거래처명</th>
									<th>연도</th>
									<th>1월</th>
									<th>2월</th>
									<th>3월</th>
									<th>4월</th>
									<th>5월</th>
									<th>6월</th>
								</tr>
								<tr>
									<th style="width: 130px; max-width: 130px">결제조건</th>
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
						<div class="dtlWrap2 middle2">
							<table class="dtl body">
							<c:forEach var="list" items="${purchaseAmountList}" varStatus="status">
								<tbody>
									<tr>
										<td rowspan="2" style="width: 10px;" >
											<!-- <input type="checkbox" class="tRadio" id="check1"><label for="check1" class="cursorP"></label> -->
											<input type="radio" class="tRadio" name="m_gubun" id="check<c:out value="${status.count}"/>" value="<c:out value="${list.mtOrderKey}"/>:<c:out value="${list.mtBuyKey}"/>:<c:out value="${list.mtBuyYear}"/>" /><label for="check<c:out value="${status.count}"/>" class="cursorP"/>
										</td>
										<td style="width: 130px; max-width: 130px"><c:out value="${list.mtOrderAcNm}"/></td>
										<td style="font-weight: 400;"><c:out value="${list.mtBuyYear}"/></td>
										<td title="1월"><c:out value="${displayUtil.commaStr(list.mtBuyJanAmount)}"/></td>
										<td title="2월"><c:out value="${displayUtil.commaStr(list.mtBuyFebAmount)}"/></td>
										<td title="3월"><c:out value="${displayUtil.commaStr(list.mtBuyMarAmount)}"/></td>
										<td title="4월"><c:out value="${displayUtil.commaStr(list.mtBuyAprAmount)}"/></td>
										<td title="5월"><c:out value="${displayUtil.commaStr(list.mtBuyMayAmount)}"/></td>
										<td title="6월"><c:out value="${displayUtil.commaStr(list.mtBuyJunAmount)}"/></td>
									</tr>
									<tr>
										<td style="width: 130px; max-width: 130px"><c:out value="${list.mtOrderPayTerms}"/></td>
										<td title="년도합계">
										<c:out value="${displayUtil.makeAddNumber(
										list.mtBuyJanAmount
										, list.mtBuyFebAmount
										, list.mtBuyMarAmount
										, list.mtBuyAprAmount
										, list.mtBuyMayAmount
										, list.mtBuyJunAmount
										, list.mtBuyJulAmount
										, list.mtBuyAugAmount
										, list.mtBuySepAmount
										, list.mtBuyOctAmount
										, list.mtBuyNovAmount
										, list.mtBuyDecAmount
										)}"/>
										</td>
										<td title="7월"><c:out value="${displayUtil.commaStr(list.mtBuyJulAmount)}"/></td>
										<td title="8월"><c:out value="${displayUtil.commaStr(list.mtBuyAugAmount)}"/></td>
										<td title="9월"><c:out value="${displayUtil.commaStr(list.mtBuySepAmount)}"/></td>
										<td title="10월"><c:out value="${displayUtil.commaStr(list.mtBuyOctAmount)}"/></td>
										<td title="11월"><c:out value="${displayUtil.commaStr(list.mtBuyNovAmount)}"/></td>
										<td title="12월"><c:out value="${displayUtil.commaStr(list.mtBuyDecAmount)}"/></td>
									</tr>
								</tbody>
							</c:forEach>
							<%-- <c:forEach var="list" items="${purchaseAmountList}" varStatus="status">
								<tbody>
									<tr>
										<td rowspan="2" style="width: 29px; max-width: 18px" >
											<!-- <input type="checkbox" class="tRadio" id="check1"><label for="check1" class="cursorP"></label> -->
											<input type="radio" class="tRadio" name="m_gubun" id="check<c:out value="${status.count}"/>" value="<c:out value="${list.mtOrderKey}"/>:<c:out value="${list.mtBuyKey}"/>:<c:out value="${list.mtBuyYear}"/>" /><label for="check<c:out value="${status.count}"/>" class="cursorP"/>
										</td>
										<td style="width: 130px; max-width: 130px"><c:out value="${list.mtOrderAcNm}"/></td>
										<td style="font-weight: 400;"><c:out value="${list.mtBuyYear}"/></td>
										<td title="1월"><c:out value="${displayUtil.commaStr(list.mtBuyJanAmount)}"/></td>
										<td title="2월"><c:out value="${displayUtil.commaStr(list.mtBuyFebAmount)}"/></td>
										<td title="3월"><c:out value="${displayUtil.commaStr(list.mtBuyMarAmount)}"/></td>
										<td title="4월"><c:out value="${displayUtil.commaStr(list.mtBuyAprAmount)}"/></td>
										<td title="5월"><c:out value="${displayUtil.commaStr(list.mtBuyMayAmount)}"/></td>
										<td title="6월"><c:out value="${displayUtil.commaStr(list.mtBuyJunAmount)}"/></td>
									</tr>
									<tr>
										<td style="width: 130px; max-width: 130px"><c:out value="${list.mtOrderPayTerms}"/></td>
										<td title="년도합계">
										<c:out value="${displayUtil.makeAddNumber(
										list.mtBuyJanAmount
										, list.mtBuyFebAmount
										, list.mtBuyMarAmount
										, list.mtBuyAprAmount
										, list.mtBuyMayAmount
										, list.mtBuyJunAmount
										, list.mtBuyJulAmount
										, list.mtBuyAugAmount
										, list.mtBuySepAmount
										, list.mtBuyOctAmount
										, list.mtBuyNovAmount
										, list.mtBuyDecAmount
										)}"/>
										</td>
										<td title="7월"><c:out value="${displayUtil.commaStr(list.mtBuyJulAmount)}"/></td>
										<td title="8월"><c:out value="${displayUtil.commaStr(list.mtBuyAugAmount)}"/></td>
										<td title="9월"><c:out value="${displayUtil.commaStr(list.mtBuySepAmount)}"/></td>
										<td title="10월"><c:out value="${displayUtil.commaStr(list.mtBuyOctAmount)}"/></td>
										<td title="11월"><c:out value="${displayUtil.commaStr(list.mtBuyNovAmount)}"/></td>
										<td title="12월"><c:out value="${displayUtil.commaStr(list.mtBuyDecAmount)}"/></td>
									</tr>
								</tbody>
							</c:forEach> --%>
							</table>
						</div>
						<table style="width: 997px">
							<tr class="bottomtr">
								<td class="textalignR" style="width: 230px">매입합계</td>
								<td style="width: 92px;padding-top: 12px;">
								<%-- <c:out value="${displayUtil.commaStr(mtPurchaseTotalAmount)}"/> --%>
								<input type="text" id="purchaseTotalAmount" class="pname" value="<c:out value="${displayUtil.commaStr(mtPurchaseTotalAmount)}"/>" readonly />
								</td>
							</tr>
						</table>

					</div>
					<div class="bottom">
						<div class="floatR">
							<c:if test='${sessionScope.userInfo.empKey == basicContractInfo.regEmpKey}'>
							<button value="수정" onclick="fn_editMtPurchaseBtn()">
								<img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" />
							</button>
							</c:if>
							
							<%-- <button value="삭제" onclick="fn_deleteMtPurchaseBtn()">
								<img class="cursorP" src="<c:url value='/images/btn_del.png'/>" />
							</button> --%>
							<%-- <button value="Excel">
								<img class="cursorP"
									src="<c:url value='/images/btn_excel.png'/>" />
							</button> --%>
						</div>
					</div>
				</div>
			</div>
			<div class="floatC"></div>
		</div>
	</div>
	<form:form id="viewForm" name="viewForm" method="POST">
		<input type="hidden" name="fileKey" value=""/>
		<input type="hidden" name="fileOrgNm" value=""/>
	</form:form>
</body>
</html>