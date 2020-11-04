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
.wrap-loading{ 
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background: rgba(0,0,0,0.2); /*not in ie */
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
}
.wrap-loading div { /*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	margin-left: -21px;
	margin-top: -21px;
}
.wrap-loading div img {
	width: 50px;
}
</style>
<script language="JavaScript">
	function loginCheck(){
		var expText = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(false == expText.test($('#key').val())){
			alert("메일형식이 올바르지 않습니다.");
			$('#key').focus();
		} else {
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
						location.href="/forecastList.do";
					}
					else {
						$('.error').css('display', 'block');
						$('#key').focus();
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
	}
	
	function mailPw() {
		if($("#key").val() == null || $("#key").val() == "" || $("#key").val().length == 0) {
			alert('이메일 계정을 입력해주세요.');
			$("#key").focus();
		} else {
			$.ajax({
				url : "/resetPw.do",
				type : "POST",
				data : "email" + "=" + $("#key").val()+"&" +"pw" + "="+ $("#pw").val(),
				dataType : "json",
	
				beforeSend:function(){
			        $('.wrap-loading').removeClass('dpNone');
			    }

			    ,complete:function(){
			        $('.wrap-loading').addClass('dpNone');
			    }
			    
			    ,success : function(response) {								
					if(response == 1){
						alert("이메일로 임시 비밀번호가 발송되었습니다.");
						history.back();
					}
					else {
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
	               	<input type="button" class="loginbtn" value="Login" id="loginButton" onclick='loginCheck()'/>
	               	<div class="textalignR findPw"><a class="cursorP ftw300" onclick='mailPw()'>비밀번호 찾기</a></div>
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
