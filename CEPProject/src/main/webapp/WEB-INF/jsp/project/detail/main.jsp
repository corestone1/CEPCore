<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/cmm/inc.jsp" %>
<%@include file="/WEB-INF/jsp/cmm/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>프로젝트 상세</title>
	<style>
		.sfcnt {
			height: 91px;
		}
		#fileUploader {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin: -1px;
			overflow: hidden;
			clip: rect(0,0,0,0);
			border: 0;
		}
		.btnWrap {
			margin-top: 50px;
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
		form .title {
			height: 50px;
		}
		form .title > label {
			font-size: 26px;
		}
		form .contents > div:first-child {
			width: 37%;
		}
		form .contents > .fxd {
			width: 60%;
		}
		form .contents .stitle {
			font-size: 18px;
			font-weight: 500;
			margin-bottom: 10px;
			margin-top: 30px;
		}
		form .contents .cg {
			color: #24a37e;
		}
		form .contents > div > div > div > table {
			border-collapse: collapse;
			font-size: 15px;
		} 
		form .contents > div > div > div > table tr td {
			padding: 13px 20px;
		}
		form .contents > div > div > div > table tr td:first-child {
			width: 130px;
			font-weight: 400;
		} 
		form .contents > div > div > div > table tr td:last-child {
			width: 400px;
			font-weight: 200;
		}
		form .contents .bsc {
			border-top: 4px solid #32bc94 !important;
			background-color: #ddf0ec;
			border: 1px solid #bee2da;
		}
		form .contents .bsc tr td {
			color: #0e8a67;
		    word-break: break-all;
		}
		form .contents .bsc tr td:first-child {
			box-shadow: inset -7px 0 9px -4px #d0e2de;
		}
		form .contents .bsc tr td .span {
		    width: 400px;
		    overflow: hidden;
		    height: 44px;
		    text-overflow: ellipsis;
		    white-space: normal;
		    line-height: 1.4;
		    text-align: left;
		    word-wrap: break-word;
		    display: -webkit-box;
		    -webkit-line-clamp: 2;
		    -webkit-box-orient: vertical;
		}
		form .contents > .fxd .title ul li,
		form .contents > .fxd .stitle ul li {
			float: left;
			text-align: center;
			font-size: 17px;
			cursor: pointer;
		}
		form .contents > .fxd .title ul li:last-child,
		form .contents > .fxd .stitle ul li:last-child {
			clear: both;
			float: none;
			width: 0 !important;
		}
		form .contents > .fxd .title ul {
			height: 46px;
			width: 100%;
			border-radius: 35px;
		}
		form .contents > .fxd .title ul li {
			width: 20%;
			line-height: 46px;
			color: #777777;
			background-color: #d3d3d3;
		}
		form .contents > .fxd .title ul li > label {
			display: inline-block;
    		width: 100%;
    		cursor: pointer;
		}
		form .contents > .fxd .title ul li:after {
		    border-color: #d3d3d3 #d3d3d3 #d3d3d3 #d3d3d3;
		    border-style: solid;
		    border-width: 23px 14px;
		    width: 0;
		    height: 0;
		    display: inline-block;
		    content: "";
		    position: absolute;
		    z-index: 0;
		}
		form .contents > .fxd .title ul li:nth-child(5):after,
		form .contents > .fxd .title ul li:last-child:after {
			display: none;
		}
		form .contents > .fxd .title ul li.on:after {
			display: none;
		}
		form .contents > .fxd .title ul li:hover:after {
			border-color: #d3d3d3 #d3d3d3 #d3d3d3 #b9b9b9;
		}
		.liAfter:after {
			border-color: #b9b9b9 #b9b9b9 #b9b9b9 #b9b9b9 !important;
		}
		.liAfterNone:after {
			display: none !important;
		}
		.liArrow {
			background-image: url('/images/step_arrow.png');
			background-repeat: no-repeat;
		}
		form .contents > .fxd .title ul li:first-child {
			border-radius: 35px 0 0 35px;
		}
		form .contents > .fxd .title ul li:nth-last-child(2)  {
			border-radius: 0 35px 35px 0;
		}
		form .contents > .fxd .title ul li.on  {
			color: #fff  !important;
			background-color: #4c3d92 !important;
		}
		#detailForm .stitle ul {
			width: 915px;
		}
		#detailForm .stitle ul li {
			width: 150px;
		}
		#detailForm .stitle ul li a {
			color: #a3a3a4;
			padding-bottom: 10px;
		}
		#detailForm .stitle ul li a:hover {
			color: #000;
			border-bottom: 4px solid #6a5bae;
		}
		#detailForm .stitle ul li a.on {
			color: #000;
			border-bottom: 4px solid #6a5bae;
		}
		form .contents .dtl {
			border-top: 4px solid #c3c3c3;;
			overflow: hidden;
		}
		form .contents .dtl tbody {
			overflow-y: auto;
			overflow-x: hidden;
			height: 547px;
			float: left;
		}
		form .contents .dtl tbody tr {
			border: 1px solid #ebe9ee;
		}
		form .contents .dtl td {
			color: #000;
		}
		form .contents .dtl tr td:first-child {
			background-color: #e1dff5;
			border-right: 1px solid #ebe9ee;
		}
		form .contents .dtl tr td:last-child {
			width: 784px;
		}
		input[type="text"] {
		 	width: 177px;
		    height: 34px;
			border: 1px solid #e9e9e9;
			padding: 0 10px;
			background-color: #fff;
			font-size: 14px;
			margin-bottom: 4px;
		}
		input[class="calendar"] {
		    background-image: url(/images/calendar_icon.png);
		    background-repeat: no-repeat;
		    background-position: 95% 50%;
		}
		select {
			height: 37px;
		    width: 130px;
		    border: 1px solid #e9e9e9;
		    padding: 0 10px;
		    -webkit-appearance: none;
		    background: url(/images/arrow_down.png) no-repeat 91% 50%;
		    background-color: #fff;
		    color: #535353;
		    font-size: 15px;
		}
		textarea {
			border: 1px solid #e6e6e6;
			padding: 10px;
		}
		select.nrslct {
			width: 100px !important;
		}
		form .contents .dtl label.title {
			margin: 0 8px 0 20px;
		}
		form .contents .dtl span.cbspan {
			display: inline-block;
			vertical-align: top;
			line-height: 1.8;
			margin-left: 5px;
		}
		label.radio {
		   overflow: hidden;
		   position: relative;
		   height: 26px;
		   box-sizing: border-box;
		   cursor: pointer;
		   margin-right: 17px;
		}
		label.radio input[type='radio'] {
			-webkit-appearance: none;
			width: 26px;
			height: 26px;
			border: 1px solid #e6e6e6;
			border-radius: 50%;
			outline: none;
			background: #e6e6e6;
			margin: 0 15px 0 0;
		}
		label.radio input[type='radio']:before {
			content:'';
			display: block;
			width: 60%;
			height: 60%;
			margin: 20% auto;  
			border-radius: 50%;  
		}
		label.radio input[type='radio']:checked {
			background: #7764cb;
		}
		label.radio input[type='radio']:checked:before {
		  	content: "\2713";
			color: #fff;
			line-height: 1.2;
			text-align: center;
		}
		form .contents .dtl#modTable ul li {
			float: left;
			width: 261px;		
			line-height: 2;
		}
		form .contents .dtl#modTable ul li:last-child {
			width: 465px;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(1) {
			width: 152px;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) {
			display: inline-block;
			font-size: 0;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) a {
			background-color: #e4e6f0;
			padding: 0px 10px;
			border: 1px solid #dcdde3;
			font-size: 16px;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) label {
			font-size: 16px;
			display: inline-block;
			width: 30px;
			text-align: center;
			border-top: 1px solid #dcdde3;
			border-bottom: 1px solid #dcdde3;
			line-height: 1.5;
		}
		form .contents .dtl#modTable ul li  > div:nth-child(2) input[type="text"] {
			margin-right: 7px;
		}
		form .contents .dtl#modTable .fileName {
			display: inline-block;
			background-image:url('/images/btn_file_upload.png');
			background-repeat: no-repeat;
			width: 130px;
			height: 34px;
			line-height: 32px;
			vertical-align: middle;
			cursor: pointer;
		}
		form .contents .dtl#modTable .upload-name { 
			height: 29px;
			vertical-align: top; 
			border: none; 
			font-size: 16px;
			-webkit-appearance: none; 
			-moz-appearance: none; 
			appearance: none; 
			cursor: pointer;
		}
		form .contents .dtl#modTable .upload-name:hover {
			text-decoration: underline;
		}
		#modBasicTable tr td:last-child {
			padding: 5px 20px;
		}
		#modBasicTable input[type="text"],
		#modBasicTable textarea {
			width: 380px; 
		    color: #0e8a67;
		}
		#modBasicTable textarea {
			color: #0e8a67;
			resize: none;
    		height: 214px;
    		font-size: 15px;
		}
		#modBasicTable select {
			font-size: 14px;
			width: 190px;
		   color: #0e8a67;
		}
		#modBasicTable label {
			margin-left: 15px;
		}
		#modBasicTable input[class="calendar"] {
			width: 168px;
		}
		#ipt_fileWrap {
			height: 31px;
			overflow-y: auto;
			max-width: 323px;
		}
		#ipt_fileWrap::-webkit-scrollbar-button {
		    width: 0;
		    height: 0;
		}
		#ipt_fileWrap::-webkit-scrollbar-thumb {
		    border-radius: 3px;
		    background-color: #7F7F7F;
		    height: 3px;
		}
		#ipt_fileWrap::-webkit-scrollbar-track {
		    background-color: transparent;
		}
		#ipt_fileWrap::-webkit-scrollbar {
		    width: 6px;
		    height: 31px;
		}
		#ipt_fileWrap .upload-name {
		    border: none;
		    font-weight: 300;
		    background-color: transparent;
		    color: #0e8a67;
		    width: 305px;
		    text-overflow: ellipsis;
		}
		#ipt_fileWrap .upload-name:hover {
		    color: #13B487;
		    text-decoration: underline;
		}
	</style>
	<script>
		function getParameterByName(name) { 
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]"); 
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
			results = regex.exec(location.search); 
			return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " ")); 
		}

		$(document).ready(function() {
			
			$('#ipt_remarkCnt').html("("+$("#ipt_remark").val().length+" / 500)");
			
			$('#ipt_remark').on('keyup', function() {
				$('#ipt_remarkCnt').html("("+$(this).val().length+" / 500)");
				
				if($(this).val().length > 500) {
					$(this).val($(this).val().substring(0, 500));
					$('#ipt_remarkCnt').html("(500 / 500)");
				}
			});
			
			var index = $('form .contents > .fxd .title ul li.on').index() + 2;
			var length = $('form .contents > .fxd .title ul li').length;
			$('form .contents > .fxd .title ul li:nth-child(' + index + ')').toggleClass("liArrow");
		
			for(var i = 0; i < length; i++) {
				if(i < index) {
					$('form .contents > .fxd .title ul li:nth-child(' + i + ')').css("background-color","#4c3d92");
					$('form .contents > .fxd .title ul li:nth-child(' + i + ')').css("color","#b1a5ec");
					$('form .contents > .fxd .title ul li:nth-child(' + i + ')').addClass('liAfterNone');
				} else {
					$('form .contents > .fxd .title ul li:nth-child(' + i + ')').removeClass('liAfterNone');
					$('form .contents > .fxd .title ul li:nth-child(' + i + ')').css("color","#777");
				}
			}
			
			$('li[id^=LI_TOPBar]').click(function(event){
				
				fnMoveMenu($(this).attr('id'));
				
			});
			
			 $('form .contents > .fxd .title ul li').mouseover(function(){ 
			
				var index2  = $('form .contents > .fxd .title ul li').index(this);
				var indexOn = $('form .contents > .fxd .title ul li').index($('form .contents > .fxd .title ul .on'));
				
				for(var i = indexOn + 1; i <= index2; i++) {
					$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').css('background-color','#b9b9b9');
					if(i != index2) {
						$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').addClass('liAfterNone');
					}
				}
			});
			
			$('form .contents > .fxd .title ul li').mouseout(function(){ 
				
				var index2  = $('form .contents > .fxd .title ul li').index(this);
				var indexOn = $('form .contents > .fxd .title ul li').index($('form .contents > .fxd .title ul .on'));
				
				for(var i = (indexOn + 1); i <= index2; i++) {
					/* if(index2 > indexOn){
						if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on') {
							$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').css('background-color','#d3d3d3');
						}
						if($('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').attr('class') != 'on' && (i + 1) <= index2) {
						 	$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').removeClass('liAfter'); 
						}
					} */
					$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').css('background-color','#d3d3d3');
					if(i != index2) {
						$('form .contents > .fxd .title ul li:nth-child('+ (i + 1) + ')').removeClass('liAfterNone');
					}
				} 
			});
			
			$('#modMinInfo').click(function() {
				
				//수정/저장 분기 필요				
			
				//iframe의 수정화면 View 호출
				$('#ifr_ProjectInfo').get(0).contentWindow.fnViewModify();
				
				//$("#modMinInfo img").attr('src',"/images/btn_save.png");
			});
			
			
			$('#delMinInfo').click(function() {
				$('#ifr_ProjectInfo').get(0).contentWindow.fnViewDelete();
			});
			
			
			var modCh = 1;
			$('#modBasicInfo').click(function() {
				/* if(modCh % 2 == 1) {
					$("#selectTable").css('display','none'); 
					$("#modTable").removeClass('dpNone');
					$("#selectBasicTable").css('display','none'); 
					$("#modBasicTable").removeClass('dpNone');
					$("#modBasicInfo img").attr('src',"/images/btn_save.png");
					
					$('#ipt_pjStartDt').css("calendar");
					$('#ipt_pjEndDt').css("calendar");
					
				} else {
					var formData = $("#listForm").serializeArray();
					
					$.ajax ({
						url:"/project/detail/updateBasicInfo.do",
						type:'POST',
						data: formData,
						dataType:'json',
						contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
						success:function(data){	
			            	alert('프로젝트 기본 정보가 저장되었습니다.');
			            	location.href = "/project/detail/main.do?pjKey=" + $('#iph_pjKey').val();
			            },
			        	error: function(request, status, error) {
			        		if(request.status != '0') {
			        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
			        		}
			        	} 
					});
				}
				modCh++; */
				
				
				var url = '/project/write/basicInfo.do';
				var dialogId = 'program_layer';
				var varParam = {
					"pjKey":$("input[name='pjKey']").val(),
					"workClass":"프로젝트"
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
			});
		
			$('.decreaseQuantity').click(function(e){
				e.preventDefault();
				var stat = $(this).next().text();
				var num = parseInt(stat,10);
				num--;
				if(num<=0){
					$(this).parent().parent().children().eq(0).children().eq(0).prop('checked', false);
				}
				if(num<=-1) {
					alert('더 이상 줄일 수 없습니다.');
					num =0;
				}
				$(this).next().text(num);
			});
			$('.increaseQuantity').click(function(e){
				e.preventDefault();
				var stat = $(this).prev().text();
				var num = parseInt(stat,10);
				num++;
	
				$(this).prev().text(num);
				$(this).parent().parent().children().eq(0).children().eq(0).prop('checked', true);
				
			});
			
			/* $('input[type="radio"]').click(function() {
				var classNm = $(this).attr('name');
				if($(this).val() == 'Y') {
					$('.'+classNm).css('display','inline-block');
				} else {
					$('.'+classNm).css('display','none');
				}	 
			}); */
			
			var fileTarget = $('#fileUploader'); 
			
			fileTarget.on('change', function() { 
				if(window.FileReader){
					var filename = $(this)[0].files[0].name; 
				} else { 
					var filename = $(this).val().split('/').pop().split('\\').pop(); 
				} 
				
				$(this).siblings('.upload-name').val(filename); 
				$(this).siblings('.upload-name').attr('onclick',''); 
				$(this).siblings('.upload-name').css('cursor','default');
				$(this).siblings('.upload-name').css('pointer-events','none');
			});
			
			$("#ipt_acNm").on("keyup", function(event){
				fnSearchAccoutList(this, $(this).val());				
			}); 
			
			//select Box 선택
			$('#slt_pjSaleEmpKey').val('${projectVO.pjSaleEmpKey}');
			$('#slt_pjSupportEmpKey').val('${projectVO.pjSupportEmpKey}');
			
			var isOrderDetail = getParameterByName('isOrderDetail');
			
			//현재 프로젝트 상태로 이동
			var lstPjStatusCd = '${projectVO.pjStatusCd}';
			//alert(lstPjStatusCd);
			if(isOrderDetail == "true") {
				fnMoveMenu('LI_TOPBar_OD');
			} else if(lstPjStatusCd == 'PJST1000') {  
				//입찰 - /project/detail/biddingMin.do
				fnMoveMenu('LI_TOPBar_BD');
			} else if(lstPjStatusCd == 'PJST2000') {
				//계약 - /project/detail/contractMin.do
				fnMoveMenu('LI_TOPBar_CT');
			} else if(lstPjStatusCd == 'PJST3000') {
				//발주 - /project/detail/orderMin.do
				fnMoveMenu('LI_TOPBar_OD');
			} else if(lstPjStatusCd == 'PJST4000') {
				//수행 - /project/detail/workingMin.do
				fnMoveMenu('LI_TOPBar_WK');
			} else if(lstPjStatusCd == 'PJST5000') {
				//완료 - /project/detail/endMin.do
				fnMoveMenu('LI_TOPBar_ED');
			} else if(lstPjStatusCd == 'PJST6000') {
				//실주
				
			} 
			
		});
		
		
		function fnMoveMenu(pstId) {
			var lstPjStatusCd = '${projectVO.pjStatusCd}';
			var statusCd = 'BD';
			var pstNm = '';
			var url = '';
			
			if(lstPjStatusCd == 'PJST1000') {
				statusCd += '';
			} else if(lstPjStatusCd == 'PJST2000') {
				statusCd += 'CT';
			} else if(lstPjStatusCd == 'PJST3000') {
				statusCd += 'CTOD';
			} else if(lstPjStatusCd == 'PJST4000') {
				statusCd += 'CTODWK';
			} else if(lstPjStatusCd == 'PJST5000') {
				statusCd += 'CTODWKED';
			}
			
			if(pstId.includes("BD")) {
				pstNm = "입찰";
			} else if(pstId.includes("CT")) {
				pstNm = "계약";
				url = "contract";
			} else if(pstId.includes("OD")) {
				pstNm = "발주";
				url = "order";
			} else if(pstId.includes("WK")) {
				pstNm = "수행";
			} else if(pstId.includes("ED")) {
				pstNm = "완료";
				url = "finish";
			}
			
			if(!(statusCd).includes(pstId.substr(pstId.length-2,2)) && pstId.substr(pstId.length-2,2) != 'WK') {
					//&& pstId.substr(pstId.length-2,2) != 'CT') {
				if(confirm(pstNm + " 정보가 없습니다. 프로젝트 정보 등록 화면으로 이동하시겠습니까?")) {
					var url = '/project/write/'+url+'Info.do';
					var dialogId = 'program_layer';
					var varParam = {
						"pjKey": $('#iph_pjKey').val()
					}
					var button = new Array;
					button = [];
					showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
				} else {
					
				}
			} else {
				var lobj = $('#' + pstId);
				
				//alert(pstId);
				
				$('li[id^=LI_TOPBar]').removeClass("on");
				$('li[id^=LI_TOPBar]').removeClass("liArrow");
				
				
				lobj.addClass("on");
				lobj.addClass("liArrow");
				
				$('form .contents > .fxd .title ul li:nth-child(' +  ($('form .contents > .fxd .title ul li.on').index()+2) + ')').addClass("liArrow");
				
				//alert(lobj.attr('title'));
				
				
				//요기다가 설정
				var index = $('form .contents > .fxd .title ul li.on').index() + 2;
				var length = $('form .contents > .fxd .title ul li').length;
				
				//alert("index : " + index + "\n length : " + length);
				
				for(var i = 0; i < length; i++) {
				//	debugger;
					if(i < index) {
						$('form .contents > .fxd .title ul li:nth-child(' + i + ')').css("background-color","#4c3d92");
						$('form .contents > .fxd .title ul li:nth-child(' + i + ')').css("color","#b1a5ec");
						$('form .contents > .fxd .title ul li:nth-child(' + i + ')').addClass('liAfterNone');
					}
					else
					{
						$('form .contents > .fxd .title ul li:nth-child(' + i + ')').css("background-color","#d3d3d3");
						$('form .contents > .fxd .title ul li:nth-child(' + i + ')').css("color","#777");
						$('form .contents > .fxd .title ul li:nth-child(' + i + ')').removeClass('liAfterNone');
					}
				}
				
				var lstUrl = lobj.attr('title') + "?pjKey=" + $('#iph_pjKey').val() + "&workClass="+pstNm+"_첨부파일";
				
				//alert(lstUrl);
				
				$('#ifr_ProjectInfo').attr('src', lstUrl);
			}
		
		}
		
		
		
		function fnSearchAccoutList(pObject, pstAccountNm)
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
		}
		
		function fnViewAccountList(pObject, pjAccountList){
			var html = '<div id="m_div_accountList" style="width:380px; margin-left: 190px; padding-top: 15px; padding-bottom: 15px; overflow-y: auto; position: absolute;">'
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
				
				$('#ipt_acNm').val(this.innerText); 
				$('#ipt_acKey').val(this.title);
				
				$('#m_div_accountList').remove();
				
				//고객사 담당자 selectBox 새로고침
				fnSearchAcDirector(this.title);
			});
		};
		
		function fnSearchAcDirector(pstAcKey){
			
			var jsonData = {'acKey' : pstAcKey};
			
			$.ajax({
	        	url :"/mngCommon/account/searchDirectorList.do",
	        	type:"POST",  
	            data: jsonData,
	     	    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	     	    dataType: 'json',
	            async : false,
	        	success:function(data){		  
	        		//선택 목록 생성
	        		fnMakeDirectorSBox(data.directorList);
	            },
	        	error: function(request, status, error) {
	        		if(request.status != '0') {
	        			alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
	        		}
	        	} 
	    	});
			
		}
		
		
		function fnMakeDirectorSBox(poDirectorList) {
			
			var litLeng = poDirectorList.length;
			
			$('#slt_acDirectorKey').html("");
			
			$('#slt_acDirectorKey').append("<option value=''>선 택</option>");
			
			for(var i=0; i < litLeng; i++) {
				$('#slt_acDirectorKey').append("<option value='" + poDirectorList[i].acDirectorKey + "'>" + poDirectorList[i].acDirectorNm + "</option>");
			}
		}
		
		
		
		function fn_addView(link){
			/* if(link == "forecastList") {
				location.href="<c:url value='/forecastList.do'/>";
			} else { */
				var url = '/project/'+link+'.do';
				var dialogId = 'program_layer';
				var varParam = {
		
				}
				var button = new Array;
				button = [];
				showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px'); 
			/* } */
		}
		
		function fn_check_file(flag) {
	       if (flag=="Y") {
	           $('#file_upload_posbl').show();
	           $('#file_upload_imposbl').hide();          
	       } else {
	           $('#file_upload_posbl').hide();
	           $('#file_upload_imposbl').show();
	       }
		}
		
		function fn_downFile(fileKey, fileOrgNm) {
			var form = document.ipt_viewForm;
			form.fileKey.value = fileKey;
			form.fileOrgNm.value = fileOrgNm;
			var data = $('#ipt_viewForm').serialize();
			fileDownload("<c:url value='/file/download.do'/>", data); 
		}
		
		function fnMoveBillDetail() {
			
			// /mngProject/bill/detail/main.do
				
			form = document.listForm;
			form.action = "<c:url value='/mngProject/bill/detail/main.do'/>";
			form.submit(); 
			
		}
		
		function fnWorkInfoPopup() {
			var url = '/project/write/workInfo.do';
			var dialogId = 'program_layer';
			var varParam = {
				"pjKey": $('#iph_pjKey').val()
			}
			var button = new Array;
			button = [];
			showModalPop(dialogId, url, varParam, button, '', 'width:1144px;height:708px');
		}
		
		function fnViewApproval() {
			form = document.listForm;
			form.action = "<c:url value='/project/viewApproval.do'/>";
			form.submit();
		}
		
	</script>
</head>
<body>
	<form:form commandName="projectVO" id="listForm" name="listForm" method="POST">
		<input type="hidden" name="atchFileCnt" id="atchFileCnt" title="첨부된갯수" value="<c:out value=''/>" />
		<input type="hidden" name="maxFileCnt" id="maxFileCnt" title="첨부가능최대갯수" value="<c:out value='${maxFileCnt}'/>" />
		<input type="hidden" name="maxFileSize" id="maxFileSize" title="파일사이즈" value="<c:out value='${maxFileSize}'/>" />
		<input type="hidden" value="<c:out value='${resultList}'/>" />
		<input type="hidden" id="iph_pjKey" name="pjKey" value="${pjKey}" />
		<!-- <div class="sfcnt"></div>
		<div class="nav"></div> -->
		<div class="contentsWrap">
			<div class="contents mgauto">
				<div class="floatL">
					<div class="title"><label class="ftw500">프로젝트 상세정보</label></div>
					<div>
						<!-- 기본정보 시작 -->
						<div class="stitle cg">기본정보</div>
						<div id="basicWrap">
							<!-- 기본정보 표기 시작 -->
							<table class="bsc" id="selectBasicTable">
								<tr>
									<td>프로젝트명</td>
									<td><span class="span"><c:out value="${projectVO.pjNm}"/></span></td>
								</tr>
								<tr>
									<td>프로젝트 번호</td>
									<td><c:out value="${projectVO.pjKey}"/></td>
								</tr>
								<tr>
									<td>고객사</td>
									<td><c:out value="${projectVO.acNm}"/> / 담당자: <c:out value="${projectVO.acDiretorNm}"/> / <c:out value="${projectVO.acDirectorPositionNm}"/></td>
								</tr>
								<tr>
									<td>영업담당자</td>
									<td><c:out value="${projectVO.pjSaleEmpNm}"/></td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td><c:out value="${projectVO.pjSupportEmpNm}"/></td>
								</tr>
								<tr>
									<td>사업기간</td>
									<td><c:out value="${displayUtil.displayDate(projectVO.pjStartDt)}"/> ~ <c:out value="${displayUtil.displayDate(projectVO.pjEndDt)}"/></td>
								</tr>
								<tr>
									<td>비고</td>
									<td>
										<pre style="width:390px; height:147px; overflow-y: auto;"><c:out value="${projectVO.remark}"/></pre>
									</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td>
										<div style="clear:both;" id="ipt_fileWrap">
											<c:forEach var="result" items="${fileList }" varStatus="status">
												<input class="upload-name cursorP veralignT ftw200" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/>
												<c:if test="${status.last eq false}"><br /></c:if>
											</c:forEach>
										</div>
									</td>
								</tr>
							</table>
							<!-- 기본정보 표기 시작 -->
													
							<!-- 기본정보 수정 시작  -->
						
							<table class="bsc dpNone" id="modBasicTable">
								<tr>
									<td>프로젝트명</td>
									<td>
										<input type="text" name="pjNm"  value="${projectVO.pjNm}" />
									</td>
								</tr>
								<tr id="m_tr_account">
									<td>고객사</td>
									<td>
										<input type="text"   id="ipt_acNm"  value="${projectVO.acNm}" autoComplete="off"/>
										<input type="hidden" id="iph_acKey" name="acKey" value="${projectVO.acKey}" />
									</td>
								</tr>
								<tr>
									<td>고객사담당자</td>
									<td>
										<select id="slt_acDirectorKey" name="acDirectorKey" class="nrslct">
											<option value="${projectVO.acDirectorKey}"><c:out value="${projectVO.acDirectorNm}"/></option>
										</select>
										<label><c:out value="${projectVO.acDirectorPositionNm}"/> / <c:out value="${projectVO.acDirectorMbNum}"/> / <c:out value="${projectVO.acDirectorEmail}"/></label>
									</td>
								</tr>
								<tr>
									<td>영업담당자</td>
									<td>
										<select id="slt_pjSaleEmpKey" name="pjSaleEmpKey">
											<c:forEach var="result" items="${employeeList}" varStatus="status">
												<option value="${result.empKey }"><c:out value="${result.empNm}"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>지원담당자</td>
									<td>
										<select id="slt_pjSupportEmpKey" name="pjSupportEmpKey">
											<c:forEach var="result" items="${employeeList}" varStatus="status">
												<option value="${result.empKey }"><c:out value="${result.empNm}"/></option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>사업기간</td>
									<td>
										<input id="ipt_pjStartDt" name="pjStartDt" class="calendar" type="text" value="${displayUtil.displayDate(projectVO.pjStartDt)}" style="width: 100px;" />&nbsp;&nbsp;~&nbsp;&nbsp;<input id="ipt_pjEndDt" name="pjEndDt" class="calendar" type="text" value="${displayUtil.displayDate(projectVO.pjEndDt)}" style="width: 100px;"/>
									</td>
								</tr>
								<tr>
									<td>비고</td>
									<td>
										<textarea id="ipt_remark" name="remark" cols="40"><c:out value="${projectVO.remark}"/></textarea>
										<div id="ipt_remarkCnt">(0 / 500)</div>
									</td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td></td>
								</tr>
							</table>
						
							<!-- 기본정보 수정 끝  -->
						</div>
						<!-- 기본정보 끝 -->
						
						<!-- 기본정보 버튼 시작 -->
						<div class="btnWrap lt">
							<div class="floatL">
								<button type="button" value="수정" id="modBasicInfo"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
								<c:if test="${projectVO.pjStatusCd > 'PJST1000' }">
									<a title="계산서 발행 요청" onclick="javasript:fnMoveBillDetail();"><img class="cursorP" src="<c:url value='/images/btn_req_bill.png'/>" /></a>
								</c:if>
								<a title="판매 품의서" onclick="javasript:fnViewApproval();"><img class="cursorP" src="<c:url value='/images/btn_approval.png'/>" /></a>
							</div>
							<div class="floatC"></div>
						</div>
						<!-- 기본정보 버튼 끝 -->
					</div>
				</div>
				
				<!-- 입찰정보 시작 -->
				<div class="floatR dpBlock fxd">
				
					<!-- 진행상태 바 시작 -->
					<div class="title">
						<ul>
							<li id="LI_TOPBar_BD" class="on" title="/project/detail/biddingMin.do"><label>입찰</label></li>
							<li id="LI_TOPBar_CT" title="/project/detail/contractMin.do"><label>계약</label></li>
							<li id="LI_TOPBar_OD" title="/project/detail/orderMin.do"><label>발주</label></li>
							<li id="LI_TOPBar_WK" title="/project/detail/workingMin.do"><label>수행</label></li>
							<li id="LI_TOPBar_ED" title="/project/detail/endMin.do"><label>완료</label></li>
							<li></li>
						</ul>
					</div>
					<!-- 진행상태 바 끝 -->
					
					<!-- 입찰정보 시작 -->
					<div id="detailForm">
						<iframe id="ifr_ProjectInfo" name="ifr_ProjectInfo" height="639px" width="1027px;" style="border:0;"src="/project/detail/biddingMin.do?pjKey=${pjKey}&workClass=입찰_첨부파일"></iframe>
						<!-- 입찰정보 버튼 시작 -->
						<div class="btnWrap rt">
							<div class="floatR">
								<%-- <button type="button" value="수행일지" onclick="javascript:fnWorkInfoPopup();"><img class="cursorP" src="<c:url value='/images/btn_perform_record.png'/>" /></button> --%>
								<%-- <button type="button" value="첨부파일"><img class="cursorP" src="<c:url value='/images/btn_file.png'/>" /></button> --%>
								<button type="button" value="수정" id="modMinInfo"><img class="cursorP" src="<c:url value='/images/btn_mod.png'/>" /></button>
								<button type="button" value="삭제" id="delMinInfo"><img class="cursorP" src="<c:url value='/images/btn_del.png'/>" /></button>
								<%-- <button type="button" value="실주등록"  onclick="javascript:fn_addView('writeLoseInfo')"><img class="cursorP" src="<c:url value='/images/btn_loss.png'/>" /></button> --%>
								<%-- <button type="button" value="엑셀 다운로드" id="excelExport"><img class="cursorP" src="<c:url value='/images/btn_excel.png'/>" /></button> --%>
							</div>
							<div class="floatC"></div>
						</div>
						<!-- 입찰정보 버튼 끝 -->
					</div>
					<!-- 입찰정보 끝 -->
					<div class="floatC"></div>
				<!-- 입찰정보 끝 -->
				
				</div>
			</div>
		</div>	
	</form:form>
	<script type="text/javascript">
		var existFileNum = $('#atchFileCnt').val();        
		var maxFileNum = $('#maxFileCnt').val();
		// 첨부한 파일 갯수
		if (existFileNum ==null || existFileNum=="") {
			existFileNum = 0;
		}
		// 최대 첨부가능 갯수
		if(maxFileNum==null || maxFileNum==""){
			maxFileNum = 3;
		} 
		// 남은 첨부가능 갯수
		var uploadableFileNum = maxFileNum - existFileNum;
		
		if (uploadableFileNum<0) {
			uploadableFileNum = 0;
		}               
	    
	    if (uploadableFileNum != 0) {
	        fn_check_file('Y');
	        /* var multi_selector = new MultiSelector(document.getElementById('egovComFileList'), maxFileNum );
	        multi_selector.addElement(document.getElementById('fileUploader')); */   
	    } else{
	    	fn_check_file('N');
	    }
	             
	</script>
	<form:form id="ipt_viewForm" name="ipt_viewForm" method="POST">
		<input type="hidden" name="fileKey" value=""/>
		<input type="hidden" name="fileOrgNm" value=""/>
	</form:form>
	<%-- <form id="fileForm" method="post" enctype="multipart/form-data"> 
    	<!-- <button type="button" id="add" style="border: 1px solid #000; padding: 5px 10px; ">추가</button><br /> -->
		<input type="hidden" name="docTypeNm" value="프로젝트" />
		<input type="hidden" name="fileCtKey" id="fileCtKey" value="${projectVO.pjKey}" />
		<input type="hidden" name="pjNm" id="filePjNm" value="<c:out value="${resultList[0].pjNm}"/>"/> 
		<input type="hidden" name="atchFileCnt" id="atchFileCnt" title="첨부된갯수" value="${fn:length(fileList)}" />
		<input type="hidden" name="maxFileCnt" id="maxFileCnt" title="첨부가능최대갯수" value="<c:out value='${maxFileCnt}'/>" />
		<input type="hidden" name="maxFileSize" id="maxFileSize" title="파일사이즈" value="<c:out value='${maxFileSize}'/>" />
		<div class="floatL uploadContainer">
			<input class="uploadName" placeholder="파일선택" disabled="disabled" />
			<label for="exFile" class="exFileLabel"></label>
			<input type="file" id="exFile" class="exFile" multiple="multiple" name="file"/>
		</div>
		<div style="width: 307px; clear:both;" id="fileWrap">
			<c:forEach var="result" items="${fileList }" varStatus="status">
				<input class="upload-name cursorP" id="file${result.fileKey }" value="<c:out value="${result.fileOrgNm}"/>" onclick="fn_downFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm}"/>')" readonly/>
				<a class="close cursorP" onclick="fn_deleteFile('<c:out value="${result.fileKey}"/>', '<c:out value="${result.fileOrgNm }" />')"><img src="/images/btn_close.png" /></a>
				<c:if test="${status.last eq false}"><br /></c:if>
			</c:forEach>
		</div>
		<!-- <button type="button" id="save" style="border: 1px solid #000; padding: 5px 10px;">저장</button> -->
	</form> --%>
</body>
</html>