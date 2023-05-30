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
		height: 87vh;		
	}
	.mainContents{
		display:flex;
		justify-content : center;
		background-color: white;
		align-items: center;
		flex-flow: row;
	}
	
	
</style>
</head>
<body>
	<div>
		<div class="nav">
			<jsp:include page="/common/Top.jsp"></jsp:include>
		</div>
		<div class="underNav">
			<div class="leftBar">
				<jsp:include page="/common/Left.jsp"></jsp:include>
			</div>
			<div class="mainContents">			
	
					<c:if test="${not empty sessionScope.userid}">
	    				<h1>반갑다, ${sessionScope.userid}!</h1>
					    <c:if test="${sessionScope.userid eq 'admin'}">
					        <h1>넌 admin이구나</h1>
					        <%-- <a href="${pageContext.request.contextPath}/managemember.do">회원관리</a> --%>
					    </c:if>
					</c:if> 
					<c:if test="${empty sessionScope.userid}">
					   <br> <h1>로그인좀 해라!</h1>
					</c:if>
	
			</div>
		</div>
		<div>
			<jsp:include page="/common/Bottom.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>



