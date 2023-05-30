<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

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
			<form action="${pageContext.request.contextPath}/loginok.do" method="post" name="loginForm"
					id="joinForm">

					<h3 style="text-align: center;">Login Page</h3>
					
					  <!-- id input -->
					  <div class="form-outline mb-4">
					    <label class="form-label" for="form1Example1">아이디</label>
					    <input type="text" name="id" id="id" class="form-control" />
					  </div>
					
					  <!-- Password input -->
					  <div class="form-outline mb-4">
					    <label class="form-label" for="form1Example2">비밀번호</label>
					    <input type="password" name="pwd" id="pwd" class="form-control" />
					  </div>
					
					  <!-- Submit button -->
					  <button type="submit" value="로그인" class="btn btn-primary btn-block">로그인</button>
					  <button type="submit" value="취소" class="btn btn-primary btn-block">취소</button>
					

				</form>
		</div>
	</div>
	<div>
		<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
	</div>
</body>
</html>
<script type="text/javascript">
<%

/* 
	if(session.getAttribute("userid") == null){
	out.print("<p><a href='Ex02_JDBC_Login.jsp'>Login</a></p>");
	out.print("<p><a href='Ex02_JDBC_JoinForm.jsp'>Register</a></p>");
} */
%>
</script>