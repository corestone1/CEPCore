<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../cmm/inc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	fieldset {
		border: none;
	}
	table th, table td {
		border: 1px solid #000;
		padding: 5px;
		text-align: center;
	}
</style>
</head>
<body>
	<h1>게시판 리스트</h1>
	<form:form id="form" name="form" method="post">
	<fieldset>
		<div class="content">
			<div class="tbl_wrap">
				<table>
					<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">내용</th>
						<th scope="col">사용자이름</th>
						<th scope="col">사용자ID</th>
						<th scope="col">생성일자</th>
					</tr>
					</thead>
					<tbody>
					<c:choose>
						<c:when test="${ !empty exampleList}">
						<c:forEach var="result" items="${exampleList}" varStatus="status">
						<tr>
							<td><c:out value="${result.seq}"/></td>
							<td><c:out value="${result.title}"/></td>
							<td><c:out value="${result.content}"/></td>
							<td><c:out value="${result.userName}"/></td>
							<td><c:out value="${result.userId}"/></td>
							<td><c:out value="${result.createDt}"/></td>
						</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="9">데이터가 없습니다.</tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<div>
				<a href="/example.viewAdd.do">추가</a>
			</div>
		</div>
	</fieldset>
</form:form>
</body>
</html>