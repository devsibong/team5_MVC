<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 

<style type="text/css">
	.nav {
		display: grid;
	}
	.underNav {
		display: grid;
		grid-template-columns: 1fr 5fr;
		background-color: black;
		height: 100vh;
	}
	.mainContents{
		display:flex;
		justify-content : center;
		background-color: white;
		align-items: center;
	}

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
	<div class="nav">
		<jsp:include page="/common/Top.jsp"></jsp:include>
	</div>
	<div class="underNav">
		<div class="leftBar">
			<jsp:include page="/common/Left.jsp"></jsp:include>
		</div>
		<div class="mainContents">
			<table style="width: 400px; height: 100px; margin-left: auto; margin-right: auto;">
						<tr>
							<td style="width: 100px">아이디</td>
							<td style="width: 100px">${member.id}</td>
						</tr>
						<tr>
							<td style="width: 100px">비번</td>
							<td style="width: 100px">${member.pwd}</td>
						</tr>
						<tr>
							<td style="width: 100px">이름</td>
							<td style="width: 100px">${member.name}</td>
						</tr>
						<tr>
							<td style="width: 100px">나이</td>
							<td style="width: 100px">${member.age}</td>
						</tr>
						<tr>
							<td style="width: 100px">성별</td>
							<td style="width: 100px">${member.gender}</td>
						</tr>
						<tr>
							<td style="width: 100px">이메일</td>
							<td style="width: 100px">${member.email}</td>
						</tr>
						<tr>
							<td colspan="2"><a href="${pageContext.request.contextPath}/managemember.do">목록가기</a></td>
						</tr>
				</table>

		</div>
	</div>
	<div>
		<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
	</div>
</body>
</html>
<script type="text/javascript">

</script>
