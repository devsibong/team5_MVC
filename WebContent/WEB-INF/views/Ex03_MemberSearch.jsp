<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
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
		display: flex;
		justify-content : center;
		background-color: white;
		align-items: center;
		
	}
	.innerMain{
		margin: 50px;
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
				<h1>회원조회</h1>
								
					<c:if test="${not empty memberList}">
						<table class="table table-light table-striped" style="width:800px; margin-left: auto; margin-right: auto">
							<tr class="table-primary">
								<th colspan="1">아이디</th><th colspan="1">이름</th><th colspan="1">이메일</th>
							</tr>
							<c:forEach var="member" items="${memberList}">
								<tr>
									<td>${member.id}</td>
									<td>${member.name}</td>
									<td>${member.email}</td>
								</tr>
							</c:forEach>
							<tr>
								<td class="table-primary" colspan="3" ><b>조회결과 ${memberList.size()}건 조회</b></td>
							</tr>
						</table>
					</c:if> 
					<c:if test="${empty memberList}">
						<table class="table table-success table-striped" style="margin-left: auto; margin-right: auto;">
							<tr class="table-primary">
								<td colspan="3"><b>조회결과가 없습니다</b></td>
							</tr>
						</table>
					</c:if> <a href="${pageContext.request.contextPath}/managemember.do">회원 목록 페이지</a>

			</div>
		</div>
	</div>
	<div>
		<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
	</div>
</body>
</html>