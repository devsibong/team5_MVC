<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<table style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2">
				<jsp:include page="/common/Top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td style="width: 200px">
				<jsp:include page="/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
			<!--  
				회원 목록(리스트) 출력
				목록 (select id, ip from koreamember)
			-->	
				
					<table style="width: 400px;height: 100px;margin-left: auto;margin-right: auto">
							<tr><th colspan="4">회원리스트</th></tr>
							<c:forEach var="member" items="${memberList}">
							  <tr>
							    <td width="100px">
							      <form action="${pageContext.request.contextPath}/memberdetail.do" method="post">
							        <input type="hidden" name="id" value="${member.id}">
							        <button type="submit">${member.id}</button>
							      </form>
							    </td>
							    <td width="100px">${member.ip}</td>
							    <td>
							      <form action="${pageContext.request.contextPath}/deletemember.do" method="post">
							        <input type="hidden" name="id" value="${member.id}">
							        <button type="submit">[삭제]</button>
							      </form>
							    </td>
							    <td>
							      <form action="${pageContext.request.contextPath}/updatemember.do" method="post">
							        <input type="hidden" name="id" value="${member.id}">
							        <button type="submit">[수정]</button>
							      </form>
							    </td>
							  </tr>
							</c:forEach>
					</table>
					<hr>
						<form action="${pageContext.request.contextPath}/searchmember.do" method="post">
							회원명:<input type="text" name="search">
							<input type="submit" value="이름검색하기">
						</form>
					<hr>					
				
			
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html>