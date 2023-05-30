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
			<div>
				<h1>회원 상세 조회</h1>
				<table class="table table-light table-striped" style=" margin-left: auto; margin-right: auto;">
						<tr>
							<th style="width: 100px">아이디</th>
							<td style="width: 100px">${member.id}</td>
						</tr>
						<tr>
							<th style="width: 100px">비번</th>
							<td style="width: 100px">${member.pwd}</td>
						</tr>
						<tr>
							<th style="width: 100px">이름</th>
							<td style="width: 100px">${member.name}</td>
						</tr>
						<tr>
							<th style="width: 100px">나이</th>
							<td style="width: 100px">${member.age}</td>
						</tr>
						<tr>
							<th style="width: 100px">성별</th>
							<td style="width: 100px">${member.gender}</td>
						</tr>
						<tr>
							<th style="width: 100px">이메일</th>
							<td style="width: 100px">${member.email}</td>
						</tr>
						<tr class="table-primary">
							<th colspan="2"><a href="${pageContext.request.contextPath}/managemember.do">목록가기</a></th>
						</tr>
				</table>
			</div>
		</div>
	</div>
	<div>
		<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
	</div>
</body>
</html>
<script type="text/javascript">

</script>
