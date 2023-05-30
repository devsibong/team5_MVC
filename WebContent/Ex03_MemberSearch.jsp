<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
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
	<table style="width: 900px; height: 500px ;margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2"><jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px"><jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
				<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">
							<tr><th colspan="4">회원리스트</th></tr>
				</table>
				<c:if test="${not empty memberList}">
					<table
						style="width: 400px; height: 100px; margin-left: auto; margin-right: auto;">
						<c:forEach var="member" items="${memberList}">
							<tr>
								<td>${member.id}</td>
								<td>${member.name}</td>
								<td>${member.email}</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="3"><b>조회결과 ${memberList.size()}건 조회</b></td>
						</tr>
					</table>
				</c:if> <c:if test="${empty memberList}">
					<table
						style="width: 400px; height: 100px; margin-left: auto; margin-right: auto;">
						<tr>
							<td colspan="3"><b>조회결과가 없습니다</b></td>
						</tr>
					</table>
				</c:if> <a href="${pageContext.request.contextPath}/managemember.do">회원 목록 페이지</a>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>