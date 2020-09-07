<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
<script>
	function add() {
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";
		
		var data = $('#form').serialize();
		var _data = JSON.parse(data);
		
		console.log(_data);
		debugger;
		$.ajax({
		
			url: "<c:url value='/example.add.do'/>",
			type: 'POST',
			data: _data,
			contentType : "application/json; charset=UTF-8",
			cache: false,
			async: false,
			dataType: "json",
			
			beforeSend : function(xhr)
			{
				xhr.setRequestHeader("AJAX", true);
				/*xhr.setRequestHeader(header, token);  */
			},
			
			success: function(response) {
				if(response != null) {
					alert('저장되었습니다.');
				}
			},
			
			error: function(request, status, error) {
				if(request.status != '0') {
					alert("code: " + request.status + "\r\nmessage: " + request.responseText + "\r\nerror: " + error);
				}
			}
		})  
	}
</script>
</head>
<body>
	<form:form id="form" method="post" action="/example.add.do">
		제목 : <input type="text" name="title"/>
		내용 : <input type="text" name="content"/>
		사용자ID : <input type="text" name="userId"/>
		사용자이름: <input type="text" name="userName" />
		<input type="button" onclick="add();" value="추가" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<sec:csrfInput />
	</form:form>
</body>
</html>