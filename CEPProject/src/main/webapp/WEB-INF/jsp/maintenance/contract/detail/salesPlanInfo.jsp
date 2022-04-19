<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<%@include file="../../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수계약 상세(수금계획)</title>
	
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
			max-width: 430px;
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
		
		.mContents .dtl2 {
		    width: 997px;
		    font-size: 15px;
		    border-collapse: collapse;
		    font-weight: 300;
		    overflow: hidden;
		    border-top: 4px solid #6a5baf;
		}

		.mContents .dtl2 tbody {
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			width: 997px;		
			height: 484px;
		}
		
		.mContents .dtl2 thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
		/* 커서포인터 */
		.mContents .dtl2 tbody tr {
		    display: table;
		    width: 996px;
		    /* cursor: pointer; */
		}
		
		
		/* 발주정보 테이블 틀 나오게 하는 부분 */
		.mContents .dtl2 thead th, .mContents .dtl2 tbody tr td {
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
			width: 16.65%;
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
		
		/* .mContents > .fxd .title ul li.on,
		.mContents > .fxd .title ul li:hover  {
			color: #fff  !important;
			background-color: #4c3d92;
		} */
		
		
		.mContents > .fxd .title ul li.on  {
			color: #fff  !important;
			background-color: #4c3d92 !important;
		}
		
		.mContents > .fxd .title ul li:hover  {
			color: #777777 ;
			background-color: #b9b9b9;
		}
		
		.mContents .dtl2 tbody tr:hover {
			background-color: #ddf0ec
		}
		

		/* 발주정보, 제품정보 글짜크기 */
		.dtl2 tbody tr td {
			font-weight: 200;
		}
		
		
		/* 제품정보 테이블 크기조정 */
		.dtl2 thead th:first-child,
		.dtl2 tbody td:first-child {
			width: 51px;
		}
		.dtl2 thead th:nth-child(2),
		.dtl2 tbody td:nth-child(2) {
			width: 100px;
		}
		.dtl2 thead th:nth-child(3),
		.dtl2 tbody td:nth-child(3) {
			width: 100px;
		}
		.dtl2 thead th:nth-child(4),
		.dtl2 tbody td:nth-child(4) {
			width: 90px;
		}
		.dtl2 thead th:nth-child(5),
		.dtl2 tbody td:nth-child(5) {
			width: 120px;
		}
		.dtl2 thead th:nth-child(6),
		.dtl2 tbody td:nth-child(6) {
			width: 140px;
		}
		.dtl2 thead th:nth-child(7),
		.dtl2 tbody td:nth-child(7) {
			width: 140px;		
		}
		.dtl2 thead th:nth-child(8),
		.dtl2 tbody td:nth-child(8) {
			width: 140px;		
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
			/* box-shadow: inset -7px 0 9px -4px #d0e2de; */			
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
		 	width: 143px;
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
		input[class="pname2"] {
			font-family: "Noto Sans KR", sans-serif !important;
			/* width: 130px; */
			height: 18px;
			border: none;
			outline: none;
			background-color: #f6f7fc;
			color: #26a07d;
			text-align: left;
			font-size: 15px;
			font-weight: 200;
			margin-bottom: 5px;			
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
			padding-left:60px;
		}
		.stitle select{
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
		.mContents .bsc tbody tr td > span {	
			display: list-item;		
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 99%;
			margin: 0 auto;
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
			
			
			
			'<c:if test="${salesOrderSelectBox.size() >0 }">'
				//매출처 값 셋팅
				$('#m_mtSaveOrderAcKey').val("${selectSlaeOrderKey}").attr("selected", "true");
			'</c:if>'

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
						if(confirm("유지보수계약 수금계획 상세화면으로 이동하시겠습니까?")){
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
				
			}); //메뉴바를 이용한 화면이동
			
			
			

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

					
			//거래처 검색
			$("#m_mtAcNm").on("keydown", function(event){
				
				if(event.keyCode == 13) {						
					fnSearchAccoutList(this, $(this).val());
				}						
			});			
			
			//매출거래처 selectbox선택
			$('#m_mtSaveOrderAcKey').change(function(){
				//console.log("=========>"+$('#m1_mtIntegrateKey').val()+" / "+$('#m_mtSaveOrderAcKey option:selected').val()+"<=====");
				//선택값을 저장한다.
				 var varParam = {
						"mtIntegrateKey": $('#m1_mtIntegrateKey').val(),
						"mtSalesOrderKey":$('#m_mtSaveOrderAcKey option:selected').val()
				};
				console.log("mtIntegrateKey===>"+$('#m1_mtIntegrateKey').val());
				console.log("mtSalesOrderKey===>"+$('#m_mtSaveOrderAcKey option:selected').val());
				var html = ''; 
				var mtBillTotalAmount=0;
				var salesStatusCdNm = '';
				var billIssueRuleNm = '';
				$.ajax({
		        	url:"/maintenance/contract/detail/salesPlanInfoWithSalesOderKey.do",
		            dataType: 'json',
		            type:"post",  
		            data: JSON.stringify(varParam),
		     	   	contentType: "application/json; charset=UTF-8",
		     	  	beforeSend: function(xhr) {
		        		xhr.setRequestHeader("AJAX", true);
		        		//xhr.setRequestHeader(header, token);
		        	},
		            success:function(data){
		            	console.log("data.successYN===>"+JSON.stringify(data)+data.successYN+" / "+data.billIssueRule);		            	
		            	if("Y" == data.successYN){
		            		if(data.billIssueRule== 'BF') {
		            			billIssueRuleNm = '발행요청 이전평일';
            				} else if(data.billIssueRule == 'BD') {
            					billIssueRuleNm = '발행요청일';
            				} else if(data.billIssueRule == 'AF') {
            					billIssueRuleNm = '발행요청 이후평일';
            				} else {
            					billIssueRuleNm =data.billIssueRule;
            				}
		            		if ( data.salesPlanList.length > 0 ) {
		            			for(i = 0; i < data.salesPlanList.length; i++) {
		            				mtBillTotalAmount = mtBillTotalAmount+data.salesPlanList[i].salesTurnAmount;
		            				if(data.salesPlanList[i].salesStatusCd == 'R') {
		            					salesStatusCdNm = '계산서발행요청';
		            				} else if(data.salesPlanList[i].salesStatusCd == 'I') {
		            					salesStatusCdNm = '계산서발급';
		            				} else if(data.salesPlanList[i].salesStatusCd == 'M') {
		            					salesStatusCdNm = '계산서매핑';
		            				} else if(data.salesPlanList[i].salesStatusCd == 'E') {
		            					salesStatusCdNm = '수금완료';
		            				} else if(data.salesPlanList[i].salesStatusCd == null) {
		            					salesStatusCdNm = '계산서발행전';
		            				} else {
		            					salesStatusCdNm =data.salesPlanList[i].salesStatusCd;
		            				}
									html += ''
										+ '<tr>'
										+ '	<td>'+(i+1)+'</td>'
										+ '	<td class="textalignC">'+data.salesPlanList[i].salesTurn+' 회차</td>'
										+ '	<td class="textalignC">'+makeDateForm(data.salesPlanList[i].salesYearMonth)+'</td>'
										+ '	<td class="textalignR">'+addCommas(data.salesPlanList[i].salesCollectRate)+' %</td>'
										+ '	<td class="textalignR">'+addCommas(data.salesPlanList[i].salesTurnAmount)+'</td>'
										+ '	<td>'+addDateMinus(data.salesPlanList[i].salesBillFcDt)+'</td>'
										+ '	<td>'+addDateMinus(data.salesPlanList[i].salesCollectFcDt)+'</td>'
										+ '	<td class="textalignC"><span>'+salesStatusCdNm+'</span></td>'
										+ '</tr>'		
		            					+ ''
		            							            					
		            			}
		            			$('.dtl2 tbody').html('');
		        				$('.dtl2 tbody').append(html);
		        				
		        				$('#mtSalesTotalAmount').val(addCommas(mtBillTotalAmount));
		        				$('#mtbillIssueRule').val(billIssueRuleNm);
			                } else {
			                	$('.dtl2 tbody').html('');
			                	$('#mtbillIssueRule').val('');
			                	$('#mtSalesTotalAmount').val('0');
			                	alert("해당 거래처의 계산서 계획정보가 없습니다.");
			                }
		            	} else {
		                	alert("해당 거래처의 계산서 계획정보 조회를 실패하였습니다.");
		                }
						
		            },
		        	error: function(request, status, error) {
		        		if(request.status != '0') {
		        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
		        		}
		        	} 
		        }); 
				
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

		
		function fn_editMtSalesPlanBtn(){
			var url = '/maintenance/contract/write/writeSalesPlanView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":'<c:out value="${basicContractInfo.mtIntegrateKey}"/>',
					"mtSalesOrderKey":$('#m_mtSaveOrderAcKey option:selected').val(),
					"parmMtSbCtYn":'<c:out value="${basicContractInfo.mtSbCtYn}"/>'		
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
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
		
		function makeDateForm(x) {	
			var returnValue;
			if(!x || x.length == 0) {
				returnValue =  x;
			} else {
				returnValue = x.toString().replace(/(\d{4})(\d{2})/g, '$1-$2');
			}
			return returnValue;
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
	<!-- <div class="sfcnt"></div>
	<div class="nav"></div> -->
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
									<td>총계약금액</td>
									<td><c:out value="${displayUtil.commaStr(basicContractInfo.mtAmount)}"/></td>
								</tr>
								<%-- <tr>
									<td>부가세포함</td>
									<td><c:out value="${basicContractInfo.taxYn}"/></td>
								</tr> --%>
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
									<td><label>*</label>유지보수명</td>
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
								<!-- <tr>
									<td><label>*</label>부가세포함</td>
									<td>
										<input type="radio" class="tRadio" name="taxYn" value="Y" id="m_hasVAT1" checked="checked"/><label for="m_hasVAT1" class="cursorP"></label>&nbsp;&nbsp;Y
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" class="tRadio" name="taxYn" value="N" id="m_hasVAT2" /><label for="m_hasVAT2" class="cursorP"></label>&nbsp;&nbsp;N&nbsp;&nbsp;
									</td>
								</tr> -->
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
						<li id="LI_TOPBar_SL" class="on" title="salesPlanInfo" ><label style="cursor: pointer;">계산서계획</label></li>
						<c:choose>
							<c:when test="${parmMtSbCtYn == 'Y'}">
								<li id="LI_TOPBar_BC" title="backOrderInfo"><label style="cursor: pointer;">백계약정보</label></li>
								<li id="LI_TOPBar_PA" title="purchaseAmountInfo"><label style="cursor: pointer;">매입정보</label></li>
								<li id="LI_TOPBar_PA" title="paymentPlanInfo"><label style="cursor: pointer;">지급계획</label></li> 
							</c:when>
							<c:otherwise>
								<li id="LI_TOPBar_BC" title="backOrderInfo"><label>백계약정보</label></li>
								<li id="LI_TOPBar_PA" title="purchaseAmountInfo"><label>매입정보</label></li>
								<li id="LI_TOPBar_PA" title="paymentPlanInfo"><label>지급계획</label></li>
							</c:otherwise>
						</c:choose>
						<li></li>
					</ul>
				</div>
				<div id="listForm">
<%-- 					<div class="stitle cg colorBlack">
						계산서계획정보
						<c:choose>
							<c:when test="${billIssueRule eq 'BF'}">
								(계산서발행구분 : 계산서발행요청  이전평일)
							</c:when>
							<c:when test="${billIssueRule eq 'BD'}">
								(계산서발행구분 : 계산서발행요청일)
							</c:when>
							<c:when test="${billIssueRule eq 'AF'}">
								(계산서발행구분 : 계산서발행요청 이후평일)
							</c:when>
							<c:otherwise>
								(계산서발행구분 : ${billIssueRule})
							</c:otherwise>
						</c:choose>
					</div> --%>
					<div class="stitle cg colorBlack">
						<div class="floatL" style="height:37px">
							계산서계획정보
							<c:if test="${null !=salesOrderSelectBox && salesOrderSelectBox.size()>1}">
							<select id="m_mtSaveOrderAcKey" name="m_mtSaveOrderAcKey" style="width:200px;height: 30px;">																					
								<c:forEach var="order" items="${salesOrderSelectBox}" varStatus="status">
									<option value="<c:out value="${order.mtSalesOrderKey}"/>"><c:out value="${order.mtAcNm}"/></option>
								</c:forEach>
							</select>
							</c:if>
						</div>
						<div class="floatR" style="height:37px">
							<label style="color: #26a07d;font-size: 15px;"> 계산서발행구분  </label> 
							<c:choose>
								<c:when test="${billIssueRule eq 'BF'}">
								<input type="text" id="mtbillIssueRule" class="pname2"  value="발행요청  이전평일" readonly />
									
								</c:when>
								<c:when test="${billIssueRule eq 'BD'}">
								<input type="text" id="mtbillIssueRule" class="pname2"  value="발행요청일" readonly />
									<!-- (계산서발행구분 : 계산서발행요청일) -->
								</c:when>
								<c:when test="${billIssueRule eq 'AF'}">
								<input type="text" id="mtbillIssueRule" class="pname2"  value="발행요청  이후평일" readonly />
									
								</c:when>
								<c:otherwise>
								<input type="text" id="mtbillIssueRule" class="pname2"  value="${billIssueRule}" readonly />
									
								</c:otherwise>
							</c:choose>
							
						</div>
						
						
					</div>					
					
					<div class="floatC submiddle" style="border-bottom: 2px solid #c4c4c4;">
						<table class="dtl2">
							<thead class="ftw400">
								<tr>
									<th scope="row">No</th>
									<th scope="row">매출회차</th>
									<th scope="row">매출년월</th>
									<th scope="row">회차비율</th>
									<th scope="row">회차금액</th>
									<th scope="row">계산서발행요청일</th>
									<th scope="row">수금예정일</th>
									<th scope="row">상태</th>
								</tr>
							</thead>
							<tbody>
							<c:set var = "mtBillTotalAmount" value="0" />
							<c:forEach var="list" items="${mtSalesPlanList}" varStatus="status">	
								<c:set var = "mtBillTotalAmount" value="${mtBillTotalAmount + list.salesTurnAmount}" />	
								<tr>							
									<td><c:out value="${status.count}"/></td>
									<td class="textalignC"><c:out value="${list.salesTurn}"/>&nbsp;회차</td>
									<td class="textalignC"><c:out value="${displayUtil.displayDate(list.salesYearMonth)}"/></td>
									<td class="textalignR"><c:out value="${displayUtil.commaStr(list.salesCollectRate)}"/>&nbsp;%</td>
									<td class="textalignR"><c:out value="${displayUtil.commaStr(list.salesTurnAmount)}"/></td>
									<td><c:out value="${displayUtil.displayDate(list.salesBillFcDt)}"/></td>
									<td><c:out value="${displayUtil.displayDate(list.salesCollectFcDt)}"/></td>
									<td class="textalignC">
										<c:choose>
											<c:when test="${list.salesStatusCd eq 'R'}">
												<span>계산서발행요청</span>
											</c:when>
											<c:when test="${list.salesStatusCd eq 'I'}">
												<span>계산서발급</span>
											</c:when>
											<c:when test="${list.salesStatusCd eq 'M'}">
												<span>계산서매핑</span>
											</c:when>
											<c:when test="${list.salesStatusCd eq 'E'}">
												<span>수금완료</span>
											</c:when>
											<c:when test="${list.salesStatusCd == null }">
												<span>계산서발행전</span>
											</c:when>
											<c:otherwise>
												<span>${list.salesStatusCd}</span>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<table style="width: 997px; height: 48px;">
						<tr class="bottomtr">
							<td class="textalignR" style="width: 71px">계산서 합계</td>
							<td style="width: 109px">
								<%-- <c:out value="${displayUtil.commaStr(mtSalesTotalAmount)}"/> --%>
								<input type="text" id="mtSalesTotalAmount" class="pname"  value="<c:out value="${displayUtil.commaStr(mtBillTotalAmount)}"/>" readonly />
							</td>
						</tr>
					</table>
					<div class="bottom">
						<div class="floatR">
							<c:if test='${sessionScope.userInfo.empKey == basicContractInfo.regEmpKey}'>
							<button type="button" value="수정" onclick="fn_editMtSalesPlanBtn()"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
							</c:if>
							
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