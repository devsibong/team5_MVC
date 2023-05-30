<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: solid 2px black;
	border-collapse: collapse;
}

tr {
	border: solid 1px blue;
	background-color: white;
	color: black;
}

td {
	border: solid 1px red;
}
</style>
</head>
<body>
	<table
		style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2"><jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px"><jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
				<c:if test="${not empty sessionScope.userid}">
    			<h1>반갑다, ${sessionScope.userid}!</h1>
				    <c:if test="${sessionScope.userid eq 'admin'}">
				        <a href="${pageContext.request.contextPath}/managemember.do">회원관리</a>
				        <h1>넌 admin이구나</h1>
				    </c:if>
				</c:if> 
				<c:if test="${empty sessionScope.userid}">
				    <h1>로그인좀 해라!</h1>
				</c:if>

			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html>


