<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@include file="./cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CEP 샘플 화면(forecast list)</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/common.css'/>"/>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/reset.css'/>"/>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<style>
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
.loginWrap input {
	/* border-bottom: 1px solid #ececec; */
	border-bottom: 1px solid red;
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
.error {
	font-size : 14px; 
	color : #f8ac19; 
	display:none;
	width: 353px;
	margin-bottom: 10px;
}

</style>
<script language="JavaScript">
	function loginCheck(){

		var param = "key" + "=" + $("#key").val() + "&" +"pw" + "="+ $("#pw").val();
		
		$.ajax({
			url : "/login.do",
			type : "POST",
			data : param,
			cache : false,
			async : false,
			dataType : "text",

			success : function(response) {								

				if(response == 1){
					alert("로그인 성공");
					location.href="/forecastList.do";
				}
				else {
					$('.error').css('display', 'block');
					$('#key').focus();
					console.log($("#key").val());
					console.log($("#pw").val());
					return false;
				}	
				alert(check);
			},

			error : function(request, status, error) {
				if (request.status != '0') {
					alert("code : " + request.status + "\r\nmessage : "
							+ request.reponseText + "\r\nerror : " + error);
				}
			}
		});	
	}
	$(document).ready(function() {
		$('#key').focus();
		
		$("#key, #pw").keydown(function(event) {
			if (event.which == 13) {
				event.preventDefault();
				$('#loginBotton').trigger('click');
			}
		});
		
		 /* $("#key").keyup(function(){$(this).val($(this).val().replace(/[^a-z0-9]/gi,""));}); */
	     $("#pw").keyup(function(){
	    	 var expUrl = /[^a-z0-9!@#$%^*+=-]/gi;
	    	 if(true == expUrl.test($(this).val())){
	    		alert('허용되지않는 특수문자는 사용하실수 없습니다.');	 
	    	 }
	    	 
	    	 $(this).val( $(this).val().replace(/[^a-z0-9!@#$%^*+=-]/gi,"") );} 
	     );
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
               		<div>
	               		<label class="loginTxt"><img src="<c:url value='/images/icon_id.png'/>" />ID</label><br>
	               		<input name="key" id="key" type="text" class="login_input" />
	               	</div>
	               	<div class="pwDiv">
		               	<label class="loginTxt"><img src="<c:url value='/images/icon_pw.png'/>" />Password</label><br>
		               	<input type="password" id="pw" class="login_input" name="pw"/>
		            </div>
	               	<div class = "error textalignC ftw300">
						<label>입력한 아이디와 비밀번호가 일치하지 않습니다.</label>
					</div>
	               	<input type = "button" class = "loginbtn" value="Login" id = "loginBotton" onclick='loginCheck()'/>
               	</div>
           	</div>
		</div>
		<div class="floatC" style="width: 0;"></div>
	</div>
</body>
</html>
