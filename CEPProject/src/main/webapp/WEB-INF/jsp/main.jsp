<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./cmm/inc.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<style>
body {
	background: linear-gradient(90deg, #7664ca 50%, #f6f7fc 50%);
    width: 1800px !important;
}
.loginWrap {
	height: 100%;
}
.loginWrap > div {
	width: 50%;
	height: 100%;
}
.loginWrap > div:first-child {
	background: url('./images/bg_login.png') no-repeat; 
}
.loginWrap > div:nth-child(2) {
	background-color: #f6f7fc;
}
.loginWrap > div:nth-child(2) > div {
	background-color: #fff;
}
.loginWrap > div > div {
	width: 586px;
	height: 513px;
	margin-top: 193px;
}
.loginWrap > div > div > div {
	width: 354px;
	margin: 100px auto;
	padding-top: 124px;
}
.loginWrap .loginTxt {
	color: #959a9e;
	font-size: 17px;
}
.loginWrap .loginTxt img {
	margin-right: 20px;
}
.loginWrap input {
	border-bottom: 1px solid #ececec !important; 
	border: none;
	width: 333px;
	padding: 10px;
}
.loginWrap input[class="loginbtn"] {
	width: 353px;
	height: 61px;
	background-color: #4bbe94;
	border: none;
	font-size: 20px;
	color: #fff;
} 
.loginWrap .pwDiv {
	margin-top: 32px;
	margin-bottom: 30px;
}
.loginWrap .findPw {
	margin-top: 15px;
}
.loginWrap .findPw a {
	color: #959a9e;
	font-size: 14px;
}
.error {
	font-size : 14px; 
	color : #f8ac19; 
	display:none;
	width: 353px;
	margin-bottom: 10px;
}
</style>
<script>
	function fn_chkVali() {
	    if ($("#loginForm")[0].checkValidity()){
	       //필수값 모두 통과하여 저장 프로세스 호출.
	       fn_loginCheck();
	    } else {
	        $("#loginForm")[0].reportValidity();   
	    }            
	}

	function fn_loginCheck(){
		var expText = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(false == expText.test($('#key').val())){
			alert("메일형식이 올바르지 않습니다.");
			$('#key').focus();
		} else {
			/* var param = "key" + "=" + $("#key").val() + "&" +"pw" + "="+ $("#pw").val(); */
			var object = {};
			var formData = $("#loginForm").serializeArray();
			
			for (var i = 0; i<formData.length; i++){
				object[formData[i]['name']] = formData[i]['value'];
			}
			var sendData = JSON.stringify(object);
			
			$.ajax({
				url : "/login.do",
				dataType : "json",
				type : "POST",
				data : sendData,
				async: false, 
			 	contentType: "application/json; charset=UTF-8", 
	
				success : function(response) {								
					if(response.successYN == "N"){
						$('.error').css('display', 'block');
						$('#key').focus();
						return false;
					} else {
						if(response.prevUrl != null && response.prevUrl.length != 0 && response.prevUrl != "/logout.do") {
							location.href = response.prevUrl;	
						} else {
							location.href = "/forecast/list.do";
						}
						
					}
				},
	
				error : function(request, status, error) {
					if (request.status != '0') {
						alert("code : " + request.status + "\r\nmessage : "
								+ request.reponseText + "\r\nerror : " + error);
					}
				}
			});	
		}
	}
	
	function fn_mailPw() {
		if($("#key").val() == null || $("#key").val() == "" || $("#key").val().length == 0) {
			alert('이메일 계정을 입력해주세요.');
			$("#key").focus();
		} else {
			$("#link").val(window.location.href);
			
			var object = {};
			var formData = $("#loginForm").serializeArray();
			
			for (var i = 0; i<formData.length; i++){
				object[formData[i]['name']] = formData[i]['value'];
			}
			var sendData = JSON.stringify(object);
			
			$.ajax({
				url : "/resetPw.do",
				dataType : "json",
				type : "POST",
				data : sendData,
				async: true, 
				cache : false,
			 	contentType: "application/json; charset=UTF-8", 
	
				beforeSend:function(){
			        $('.wrap-loading').removeClass('dpNone');
			    }

			   	,complete:function(){
			        $('.wrap-loading').addClass('dpNone');
			    } 
			    
			    ,success : function(response) {								
					if(response == 1){
						alert("이메일로 임시 비밀번호가 발송되었습니다.");
						location.reload();
					}
					else {
						var result = confirm("이메일 발송이 실패했습니다. 재전송 하시겠습니까?");
						if(result) {
							fn_mailPw();
						} else {
							location.reload();
						}
						return false;
					}	
				}
				
				,error : function(request, status, error) {
					if (request.status != '0') {
						alert("code : " + request.status + "\r\nmessage : "
								+ request.reponseText + "\r\nerror : " + error);
					}  
				}
			});	
		}
	}
	
	$(document).ready(function() {
		$('#key').focus();
		
		$("#key, #pw").keydown(function(event) {
			if (event.which == 13) {
				event.preventDefault();
				$('#loginButton').trigger('click');
			}
		});
		
		/* $("#key").keyup(function(){$(this).val($(this).val().replace(/[^a-z0-9]/gi,""));}); */
		
		$("#pw").keyup(function(){
			var expText = /[^a-z0-9!@#$%^*+=-]/gi;
			if(true == expText.test($(this).val())){
				alert('허용되지않는 특수문자는 사용하실수 없습니다.');	 
			}
		 
			$(this).val( $(this).val().replace(/[^a-z0-9!@#$%^*+=-]/gi,"") );
		});
		
		$("#key").bind("keyup", function() {
		    $(this).val($(this).val().toLowerCase());
		});
		$("#pw").bind("keyup", function() {
		    $(this).val($(this).val().toLowerCase());
		});
	});
</script>
</head>
<body>
	<div class="loginWrap">
   		<div class="floatL"><div></div></div>
       	<div class="floatR">
           	<div>
           		<div>
           			<form id="loginForm" name="loginForm">
	               		<div>
		               		<label class="loginTxt"><img src="<c:url value='/images/icon_id.png'/>" />ID</label><br>
		               		<input name="empKey" id="key" type="text" class="login_input" required/>
		               	</div>
		               	<div class="pwDiv">
			               	<label class="loginTxt"><img src="<c:url value='/images/icon_pw.png'/>" />Password</label><br>
			               	<input type="password" id="pw" class="login_input" name="empPw" required/>
			            </div>
		               	<div class = "error textalignC ftw300">
							<label>입력한 아이디와 비밀번호가 일치하지 않습니다.</label>
						</div>
		               	<input type="button" class="loginbtn" value="Login" id="loginButton" onclick='fn_chkVali();'/>
		               	<input type="hidden" name="link" id="link" />
		               	<div class="textalignR findPw"><a class="cursorP ftw300" onclick='fn_mailPw()'>비밀번호 찾기</a></div>
	               	</form>
               	</div>
           	</div>
		</div>
		<div class="floatC" style="width: 0; height: 0;"></div>
	</div>
	<div class="wrap-loading dpNone">
    	<div><img src="<c:url value='/images/ajax_loader.gif'/>" /></div>
	</div> 
</body>
</html>
