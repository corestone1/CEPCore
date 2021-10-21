<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../../cmm/inc.jsp" %>
<%@include file="../../../cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>유지보수작업 상세(발주정보)</title>
	
	<style>
		.sfcnt {
			height: 91px;
		}
		.bottom > div {
			margin-top: 22px;
		}
		
		form .nav {
			width: 100%;
			height: 49px;
		}
		form .mContentsWrap {
			background-color: #f6f7fc;
			box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);
			height: 830px;
		}
		form .mContentsWrap .mContents {
			padding: 38px 71px; 
			width: 1662px;
		}
		form .title {
			height: 50px;
		}
		/* 화면타이틀(유지보수작업 상세정보) 글자크기 */
		form .title > label {
			font-size: 26px;
		}
		/* 오른쪽 내용(상세정보) 싸이즈 */
		form .mContents > .fxd {
			width: 60%;
		}
		/* 소타이틀(기본정보, 발주정보, 제품정보) 관련 css*/
		form .mContents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 12px;
			margin-top: 26px;
		}
		/* 기본정보 색상  */
		form .mContents .cg {
			color: #24a37e;
		}
		/* 발주추카 이미지 크기 및 위치조정 */
		form .mContents .stitle img {
			width: 27px;
			margin-left: 10px;
		}
		form .mContents > div > div > div > table {
			border-collapse: collapse;
			font-size: 15px;
		} 
		/* 기본정보 테이블 padding */
		form .mContents > div > div > div > table tr td {
			padding: 13px 20px;
		}
		/* 기본정보 타이틀 크기 및 글자크기 */
		form .bsc tr td:first-child {
			width: 130px;
			font-weight: 400;
		} 
		/* 기본정보 내용 글자 굵기 */
		form .bsc tr td:last-child {
			width: 400px;
			font-weight: 200;
			box-shadow: inset 7px 0 6px -4px #d0e2de;
		}
		/* 기본정보 틀 */
		form .mContents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			/* border: 1px solid #bee2da; */
		    border-bottom: 2px solid #bfe3db;
		    width: 614px;
		}
		
		form .mContents .bsc tbody {			
			height: 576px;
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
		}
		
		form .mContents .dtl, form .mContents .dtl2 {
		    width: 997px;
		    font-size: 15px;
		    border-collapse: collapse;
		    font-weight: 300;
		    overflow: hidden;
		    border-top: 4px solid #6a5baf;
		}
		
		form .mContents .dtl thead, form .mContents .dtl2 thead {
			background-color: #e1dff5;
			float: left;
			width: 997px;
		}
			
		form .mContents .dtl tbody, form .mContents .dtl2 tbody {
			overflow-y: auto;
			overflow-x: hidden;
			float: left;
			width: 997px;		
		}
		/* 커서포인터 */
		form .mContents .dtl tbody tr, form .mContents .dtl2 tbody tr {
		    display: table;
		    width: 997px;
		    cursor: pointer;
		}		
		
		/* 발주정보 테이블 틀 나오게 하는 부분 */
		form .mContents .dtl thead th, form .mContents .dtl tbody tr td ,form .mContents .dtl2 thead th, form .mContents .dtl2 tbody tr td {
			padding: 10px 7px;
			border: 1px solid #edebef;
			text-align: center;
		}
			
		
		/* 기본정보 글자색 */
		form .mContents .bsc tr td {
			color: #26a07d;
		}
		/* 기본정보 세로줄 나오는것 */
		form .mContents .bsc tr td:first-child {
			/* box-shadow: inset -7px 0 9px -4px #d0e2de; */
			padding: 13px 13px 13px 20px;
		}
		form .mContents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
			background-color: #d3d3d3;
		}
		/* 작업정보 >발주정보 메뉴버튼 모양 및 크기   */
		form .mContents > .fxd .title ul li {
			width: 33.3%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
			border-radius: 35px;
		}
		form .mContents .title ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		form .mContents > .fxd .title ul li > label {
			display: inline-block;
    		width: 100%;
    		/* cursor: pointer; */
		}
		form .mContents > .fxd .title ul li.on,
		form .mContents > .fxd .title ul li:hover  {
			color: #fff  !important;
			background-color: #4c3d92;
		}	
		
				
		/* 리스트 위에 마우스 올리면 색변경 */
		form .mContents .dtl tbody tr:hover, form .mContents .dtl2 tbody tr:hover {
			background-color: #ddf0ec
		}
		
		/* 발주정보 세로싸이즈 */
		form .mContents .dtl tbody {
			height: 133px;
		}
		
		/* 발주정보 테이블 크기조정 */
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
			width: 200px;
		}
		.mContents .dtl thead th:nth-child(4),
		.mContents .dtl tbody td:nth-child(4) {
			width: 100px;
		}
		.mContents .dtl thead th:nth-child(5),
		.mContents .dtl thead th:nth-child(6) {
			width: 100px;
		}
		.mContents .dtl tbody td:nth-child(5),
		.mContents .dtl tbody td:nth-child(6) {
			width: 100px;
			text-align: right;
		}
		/* .mContents .dtl thead th:nth-child(6),
		.mContents .dtl tbody td:nth-child(6) {
			width: 80px;
		} */
		.mContents .dtl thead th:nth-child(7),
		.mContents .dtl tbody td:nth-child(7){
			width: 100px;
		}
		.mContents .dtl thead th:nth-child(8),
		.mContents .dtl tbody td:nth-child(8) {
			width: 265px;
		}	
		/* 발주정보, 제품정보 글짜크기 */
		.dtl tbody tr td, .dtl2 tbody tr td {
			font-weight: 200;
		}
		
		/* 제품정보 세로싸이즈 */
		.mContents .dtl2 tbody {
			height: 294px;
		}
		/* 제품정보 테이블 크기조정 */
		.dtl2 thead th:first-child,
		.dtl2 tbody td:first-child {
			width: 51px;
		}
		.dtl2 thead th:nth-child(2),
		.dtl2 tbody td:nth-child(2) {
			width: 190px;
		}
		.dtl2 thead th:nth-child(3),
		.dtl2 tbody td:nth-child(3) {
			width: 40px;
		}
		.dtl2 thead th:nth-child(4),
		.dtl2 tbody td:nth-child(4) {
			width: 90px;
		}
		.dtl2 thead th:nth-child(5),
		.dtl2 tbody td:nth-child(5) {
			width: 100px;
		}
		.dtl2 thead th:nth-child(6),
		.dtl2 tbody td:nth-child(6) {
			width: 80px;
		}		
		.dtl2 thead th:nth-child(7),
		.dtl2 tbody td:nth-child(7) {
			width: 80px;
		}
		.dtl2 thead th:nth-child(8),
		.dtl2 tbody td:nth-child(8) {
			width: 250px;			
    		max-width: 250px;
		}
		/* 제품정보에서 제품과 제품상세  ... 으로 표시. */
		.dtl2 tbody tr td > span {
			display: inline-block;
			overflow:hidden; 
			text-overflow:ellipsis; 
			white-space:nowrap;
			width: 84%;
			margin: 0 auto;
		}
		/* 제품정보>제품에서 V 크기 및 위치  */
		.dtl2 tbody tr td img {
			width: 13px;
			vertical-align: middle;
			margin-bottom: 5px;
		}
		
		/* 제품정보 클릭했을때 나타나는 내용에서 제목(제품상세) */
		.detailList li:nth-child(2n-1) {
		    width: 82px;
		    font-weight: 400;
		    color: #158566;
		}
		/* 제품정보 클릭했을대 나타나는 내용 */
		.detailList li:nth-child(2n) {
			/* width: 316px; */
			overflow: hidden;
			/* text-overflow: ellipsis; */
			white-space: nowrap;
			font-weight: 200;
			color: #21a17e;
		}
		/* 버튼이미지  */
		.blueBtnStyle {
			width: 115px;
		    height: 27px;
		    background-color: #91a6f2;
		    color: #ffffff;
		    font-weight: bold;
		    border: 1px solid #91a6f2;
		    padding-bottom: 2px;
		    vertical-align: top;
		}
	</style>
	<script>
		$(document).ready(function() {
			
			'<c:if test="${mtOrderList.size() >0 }">'
				//백계약 목록 라이오 버튼값 셋팅
				$("input:radio[name='m_gubun']:radio[value='${selectKey}']").prop('checked', true);
			'</c:if>'
			
			$('li[id^=LI_TOPBar]').click(function(event){ 
				if(this.title == "basicInfo"){
					document.m_listForm.action = "/maintenance/work/detail/basicInfo.do";
		           	document.m_listForm.submit();
				} else if(this.title == "productInfo"){
					//console.log("productInfo===>${basicWorkInfo.mtWorkPmYn}")
					if("${basicWorkInfo.mtWorkPmYn}" == "Y"){
						document.m_listForm.action = "/maintenance/work/detail/productInfo.do";
			           	document.m_listForm.submit();
					} else {
						alert("제품정보가 없습니다.\n 제품등록여부를 Y로 변경 후 제품정보를 등록하세요.")
					}
				} else if(this.title == "orderInfo"){
					//console.log("orderInfo===>${basicWorkInfo.mtWorkOrderYn}")
					if("${basicWorkInfo.mtWorkOrderYn}" == "Y"){
						document.m_listForm.action = "/maintenance/work/detail/orderInfo.do";
			           	document.m_listForm.submit();
					} else {
						alert("발주정보가 없습니다.\n 추가발주유무를 Y로 변경 후 발주정보를 등록하세요.")
					}
				}
			});
			
			
			
			//alert("${basicWorkInfo.mtWorkPmYn}");
			//발주정보 커서 생성.
			if("Y"=="${basicWorkInfo.mtWorkPmYn}"){
				
				$("#productLabel").css('cursor','pointer');				
			}			
			
		}); //$(document).ready();
		
		function showDetail(obj) {
			var html = '';			
			var objectClass =$(obj).children().children().eq(1);
			var className = objectClass.attr('class');
			//console.log("className======>"+className);
			
			if($(obj).attr('class') != "viewOpen trcheckcolor" && $(obj).attr('class') != "viewOpen" ) {
				//console.log("obj.attr(class111)======>"+$(obj).attr('class')+"<====");
				html = '<div style="width:997px; height: auto; padding-top: 15px; overflow-y: auto; background-color:#bee2da; box-shadow: inset 0 7px 9px -3px rgba(0,0,0,0.1);" class="view">'
				       + '<div style="margin: 5px 71px;">'
				       + '<ul class="detailList">'
				       + '<li>제품상세</li>'
				       + '<li><pre>'+$(obj).children().eq(7).text().trim()+'</pre></li>'
					   + '</ul>'
				       + '</div>'
				       + '</div>';
				       $(obj).after(html);
				       $(obj).attr('class', 'viewOpen trcheckcolor');				
				
				
		       if(className === "down") {
					objectClass.attr('src','<c:url value='/images/arrow_up.png'/>');
					objectClass.attr('class', "up");
					
					$(".submiddle table tbody tr").removeClass("trcheckcolor");
					
					$(obj).attr('class', 'viewOpen trcheckcolor');
				} else {
					objectClass.attr('src','<c:url value='/images/arrow_down.png'/>');
					objectClass.attr('class', "down");
					$(obj).removeClass('viewOpen');
					$(obj).next().remove();
				}
			} else {
				//console.log("obj.attr(class22)======>"+$(obj).attr('class')+"<====");
				if(className === "down") {
					objectClass.attr('src','<c:url value='/images/arrow_up.png'/>');
					objectClass.attr('class', "up");
					
					$(".submiddle table tbody tr").removeClass("trcheckcolor");
					
					$(obj).attr('class', 'viewOpen trcheckcolor');
				} else {
					objectClass.attr('src','<c:url value='/images/arrow_down.png'/>');
					objectClass.attr('class', "down");
					$(obj).removeClass('viewOpen');
					$(".submiddle table tbody tr").removeClass("trcheckcolor");
					$(obj).attr('class', 'trcheckcolor');
					$(obj).next().remove();
				}
			}
			
		}
		
		function fn_addView(btnOption){
			var url = '/maintenance/work/write/orderInfoView.do';
			var dialogId = 'program_layer';
			var varParam = {
					"mtIntegrateKey":'${basicContractInfo.mtIntegrateKey}',
					"selectKey":$('#selectKey').val(),
					"orderCtFkKey":'${basicWorkInfo.mtWorkKey}',
					"btnOption" : btnOption		
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
		}

		function fn_mdeleteWorkOrderBtn(){
			var obj = null; 
			if($('input[name="m_gubun"]').is(':checked')) {
				//console.log("mtIntegrateKey.value===>"+document.m_mtMoveForm.mtIntegrateKey.value+"/"+$('input[name="m_gubun"]:checked').val());
				if(confirm($('#selectMtOrderAcKeyNm').val()+" 의 발주정보를 삭제하시겠습니까?")){
					obj = {};
					obj["mtIntegrateKey"] = $('#mtIntegrateKey').val();
					obj["selectKey"] = $('input[name="m_gubun"]:checked').val();
					$.ajax({
			        	url:"/maintenance/work/delete/workOrder.do",
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
			            		alert("유지보수작업 발주정보 삭제를 성공하였습니다.");
			            		$('#selectKey').val('');
			            		document.m_listForm.action = "/maintenance/work/detail/orderInfo.do";
			    	           	document.m_listForm.submit();
			            	} else {
			            		alert("유지보수작업 발주정보 삭제를 실패하였습니다.");
			            		
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
		        	url:"/maintenance/work/detail/selectWorkOrderProductList.do",
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
		            				html += '<tr onclick="showDetail(this);">'
		            					+ '<td>'+(i+1)+'</td>'
		            					+ '<td class="textalignL">'
		            					+ '	<span title="'+data.productList[i].orderPmFkNm+'">'+data.productList[i].orderPmFkNm+'</span>'
		            					+ '	<img class="down" src="/images/arrow_down.png" />'		
		            					+ '</td>'		
		            					+ '<td class="textalignR">'+addCommas(data.productList[i].orderQuantity)+'</td>'
		            					+ '<td class="textalignR">'+addCommas(data.productList[i].orderUprice)+'</td>'
		            					+ '<td class="textalignR">'+addCommas(data.productList[i].orderQuantity*data.productList[i].orderUprice)+'</td>'
		            					+ '<td>'+addDateMinus(data.productList[i].orderReceiptDt)+'</td>'
		            					+ '<td>'+data.productList[i].orderKindNm+'</td>'
		            					+ '<td>'
		            					+ '	<span title="'+data.productList[i].orderPmDetail+'">'+data.productList[i].orderPmDetail+'</span>'
		            					+ '</td>'
		            				+ '</tr>'	
		            					
		            			}
		            			$('.dtl2 tbody').html('');
		        				$('.dtl2 tbody').append(html);
			                } else {
			                	alert("해당 거래처의 발주 제품정보가 없습니다.");
			                }
		            	} else {
		                	alert("해당 거래처의 발주 제품정보 조회를 실패하였습니다.");
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
		
		// 파일다운로드 관련
		function fn_downFile(fileKey, fileOrgNm) {
			var form = document.viewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm; 
			var data = $('#viewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data);  
		}
		

		

		//발주 매입금 지금요청 버튼 클릭
		function fnMovePaymentDetail() {			
			if(confirm($('#selectMtOrderAcKeyNm').val()+" 매입금지급요청 화면으로 이동하시겠습니까?")){
				document.m_mtMovePayment.action = "/mngMaint/payment/detail/main.do";
	           	document.m_mtMovePayment.submit();
			}
			
		}
	</script>
</head>
<body>

	<form id="m_mtMovePayment" name="m_mtMovePayment" method="post">
		<input type="hidden" id="m0_mtOrderType" name="mtOrderType" value="PO"/><!-- 백계약:BO, 작업발주:PO -->
		<input type="hidden" id="m0_mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/>
		<input type="hidden" id="m0_mtWorkKey" name="mtWorkKey" value="<c:out value="${basicWorkInfo.mtWorkKey}"/>"/>	
		<input type="hidden" id="m0_mtOrderKey" name="mtOrderKey" value="<c:out value="${selectKey}"/>"/>	
		<input type="hidden" id="m0_iframGubun" name="iframGubun" value="list"/>	
	</form>
	<form id="m_listForm" name="m_listForm" method="post">
		<input type="hidden" id="mtIntegrateKey" name="mtIntegrateKey" value="<c:out value="${basicContractInfo.mtIntegrateKey}"/>"/>
		<input type="hidden" id="mtWorkKey" name="mtWorkKey" value="<c:out value="${basicWorkInfo.mtWorkKey}"/>"/>	
		<input type="hidden" id="orderCtFkKey" name="orderCtFkKey" value="<c:out value="${basicWorkInfo.mtWorkKey}"/>"/>		
		<input type="hidden" id="selectMtOrderAcKeyNm"  value="<c:out value="${selectMtOrderAcKeyNm}"/>"/>
		<input type="hidden" id="selectKey" name="selectKey" value="<c:out value="${selectKey}"/>"/>
		<div class="sfcnt"></div>
		<div class="nav"></div>
		<div class="mContentsWrap">
			<div class="mContents mgauto">
				<div class="floatL">
					<div class="title"><label class="ftw500">유지보수작업 상세정보</label></div>
					<div>
						<div class="stitle cg">기본정보</div>
						<div id="basicForm">
							<table class="bsc" id="selectBasicTable">
								<tr>
									<td>FORECAST명</td>
									<td><c:out value="${basicContractInfo.mtForcastLinkVo.mtLinkCtKeyNm}"/></td>
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
									<td>유지보수 금액</td>
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
								<tr>
									<td>첨부파일</td>
									<td >
										<c:forEach var="result" items="${fileList }" varStatus="status">
											<%-- <input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/> --%>
											<%-- <a href="javascript:fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')"><c:out value="${result.fileOrgNm}"/></a> --%>
											<button type="button" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>');" style="color: #26a07d;">
												<B><I><u><c:out value="${result.fileOrgNm}"/></u></I></B>
											</button>
											<c:if test="${status.last eq false}"><br /></c:if>
										</c:forEach>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="floatR dpBlock fxd">
					<div class="title">
						<ul>
							<li id="LI_TOPBar_WB" title="basicInfo"><label style="cursor: pointer;">작업정보</label></li>
							<li id="LI_TOPBar_WB" title="productInfo"><label id="productLabel">제품정보</label></li>
							<li id="LI_TOPBar_WO" class="on" title="orderInfo"><label>발주정보</label></li>
							<li></li>
						</ul>
					</div>
					<div id="detailForm">
						<div class="stitle cg colorBlack">발주정보&nbsp;<img class="veralignT" src="<c:url value='/images/btn_add.png'/>" style="cursor: pointer;" onclick="fn_addView('newOrder')"/></div>
						<div class="floatC middle" style="border-bottom: 2px solid #c4c4c4	">
							<table class="dtl">
								<thead class="ftw400">
									<tr>
										<th scope="row">선택</th>
										<th scope="row">No</th>
										<th scope="row">매입처</th>
										<th scope="row">매입처담당자</th>
										<th scope="row">합계금액</th>
										<th scope="row">미지급금</th>
										<!-- <th scope="row">부가세포함</th> -->
										<th scope="row">발주일자</th>
										<th scope="row">결재조건</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="list" items="${mtOrderList}" varStatus="status">
								<c:choose>
									<c:when test="${status.count==1}">
									<tr class="trcheckcolor">
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tRadio" name="m_gubun" id="check<c:out value="${status.count}"/>" value="<c:out value="${list.mtOrderKey}"/>" onclick="selectProductList('<c:out value="${list.mtOrderKey}"/>','${list.orderAcKeyNm}');"/><label for="check<c:out value="${status.count}"/>" class="cursorP" />										
										</td>
										<td><c:out value="${status.count}"/></td>
										<td class="textalignL"><span><c:out value="${list.orderAcKeyNm}"/></span></td>
										<td><c:out value="${list.orderAcDirectorNm}"/></td>
										<td class="textalignR"><c:out value="${displayUtil.commaStr(list.orderAmount)}"/></td>
										<td class="textalignR"><c:out value="${displayUtil.commaStr(list.yetPaymentAmount)}"/></td>
										<%-- <td><c:out value="${list.taxYn}"/></td> --%>
										<td><c:out value="${displayUtil.displayDate(list.orderDt)}"/></td>
										<td><c:out value="${list.orderPayTerms}"/></td>
									</tr>
									</c:when>
									<c:otherwise>
									<tr>
										<td onclick="event.cancelBubble = true;">
											<input type="radio" class="tRadio" name="m_gubun" id="check<c:out value="${status.count}"/>" value="<c:out value="${list.mtOrderKey}"/>" onclick="selectProductList('<c:out value="${list.mtOrderKey}"/>','${list.orderAcKeyNm}');"/><label for="check<c:out value="${status.count}"/>" class="cursorP" />										
										</td>
										<td><c:out value="${status.count}"/></td>
										<td class="textalignL"><span><c:out value="${list.orderAcKeyNm}"/></span></td>
										<td><c:out value="${list.orderAcDirectorNm}"/></td>
										<td class="textalignR"><c:out value="${displayUtil.commaStr(list.orderAmount)}"/></td>
										<td class="textalignR"><c:out value="${displayUtil.commaStr(list.yetPaymentAmount)}"/></td>
										<%-- <td><c:out value="${list.taxYn}"/></td> --%>
										<td><c:out value="${displayUtil.displayDate(list.orderDt)}"/></td>
										<td><c:out value="${list.orderPayTerms}"/></td>
									</tr>									
									</c:otherwise>
								</c:choose>
								</c:forEach>
								</tbody>
							</table>
						</div>
						
						<div class="stitle cg colorBlack" style="margin-top: 18px;">제품정보</div>
						<div class="floatC submiddle" style="border-bottom: 2px solid #c4c4c4	">
							<table class="dtl2">
								<thead class="ftw400">
									<tr>
										<th scope="row">No</th>
										<th scope="row">제품</th>
										<th scope="row">수량</th>
										<th scope="row">단가</th>
										<th scope="row">합계</th>
										<th scope="row">입고일자</th>
										<th scope="row">매입구분</th>
										<th scope="row">제품상세</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="list" items="${mtOrderProductList}" varStatus="status">		
									<tr onclick="showDetail(this);">							
										<td><c:out value="${status.count}"/></td>
										<td class="textalignL">
											<span title="<c:out value="${list.orderPmFkNm}"/>"><c:out value="${list.orderPmFkNm}"/></span>
											<img class="down" src="<c:url value='/images/arrow_down.png'/>" />
										</td>
										<td class="textalignR"><c:out value="${displayUtil.commaStr(list.orderQuantity)}"/></td>
										<td class="textalignR"><c:out value="${displayUtil.commaStr(list.orderUprice)}"/></td>
										<td class="textalignR"><c:out value="${displayUtil.makeMultiNumber(list.orderQuantity, list.orderUprice)}"/></td>
										<td><c:out value="${displayUtil.displayDate(list.orderReceiptDt)}"/></td>
										<td><c:out value="${list.orderKindNm}"/></td>
										<td>
											<span title="<c:out value="${list.orderPmDetail}"/>"><c:out value="${list.orderPmDetail}"/></span>										
										</td>
									</tr>
								</c:forEach>
									<%-- <tr>
										<td>1</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>2021-03-30</td>
										<td>하드웨어</td>
										<td>
											<span>상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용</span>										
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>2021-03-30</td>
										<td>소프트웨어</td>
										<td>
											<span>상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용</span>										
										</td>
									</tr>
									<tr>
										<td>3</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>2021-03-30</td>
										<td>하드웨어</td>
										<td>
											<span>상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용</span>										
										</td>
									</tr>
									<tr>
										<td>4</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>2021-03-30</td>
										<td>하드웨어</td>
										<td>
											<span>상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용</span>										
										</td>
									</tr>
									<tr>
										<td>5</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>2021-03-30</td>
										<td>하드웨어</td>
										<td>
											<span>상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용</span>										
										</td>
									</tr>
									<tr>
										<td>6</td>
										<td class="textalignL"><span title="PowerEdge R640">PowerEdge R640</span> <img class="down" src="<c:url value='/images/arrow_down_18dp.png'/>" /></td>
										<td class="textalignR">3</td>
										<td class="textalignR">600,000,000</td>
										<td class="textalignR">1,800,000,000</td>
										<td>2021-03-30</td>
										<td>하드웨어</td>
										<td>
											<span>상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용 상세내용 상세내용상세내용</span>										
										</td>
									</tr> --%>
								</tbody>
							</table>
						</div>
						<div class="bottom">
							<div class="floatR">
								<button type="button" title="매입금 지급요청" class="blueBtnStyle" onclick="fnMovePaymentDetail();">매입금 지급요청</button>
								<button type="button" value="수정" onclick="fn_addView('');"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
								<button type="button" value="삭제" onclick="fn_mdeleteWorkOrderBtn();"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
								<%-- <button type="button" value="Excel"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button> --%>
							</div>
						</div>
					</div>
				</div>
				<div class="floatC"></div>
			</div>
		</div>	
	</form>
	<form:form id="viewForm" name="viewForm" method="POST">
		<input type="hidden" name="fileKey" value=""/>
		<input type="hidden" name="fileOrgNm" value=""/>
	</form:form>
</body>
</html>