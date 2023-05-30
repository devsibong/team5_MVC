<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
				<form action="${pageContext.request.contextPath}/updatememberok.do" method="post">

					<h3 style="text-align: center;">회원정보수정</h3>
					<div>
						<table
							style="width: 400px; height: 200px; margin-left: auto; margin-right: auto;">
							<tr>
								<td>아이디</td>
								<td><input type="text" name="id" value="${member.id}"
									readonly></td>
							</tr>
							<tr>
								<td>비번</td>
								<td>${member.pwd}</td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" value="${member.name}"
									style="background-color: yellow"></td>
							</tr>
							<tr>
								<td>나이</td>
								<td><input type="text" name="age" value="${member.age}"
									style="background-color: yellow"></td>
							</tr>
							<tr>
								<td>성별</td>
								<td>
								  <input type="radio" name="gender" id="gender" value="여" ${member.gender eq '여' ? 'checked' : ''}>여자
								  <input type="radio" name="gender" id="gender" value="남" ${member.gender eq '여' ? '' : 'checked'}>남자
								</td>

							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email" value="${member.email}"
									style="background-color: yellow"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="수정하기">
									<a href='${pageContext.request.contextPath}/managemember.do'>리스트 이동</a></td>
							</tr>
						</table>


					</div>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>

