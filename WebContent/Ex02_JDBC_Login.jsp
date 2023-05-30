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
			<form action="${pageContext.request.contextPath}/loginok.do" method="post" name="loginForm"
					id="joinForm">

					<h3 style="text-align: center;">Login Page</h3>
					<div>
						<table
							style="width: 400px; height: 100px; margin-left: auto; margin-right: auto;">
							<tr>
								<th>아이디:</th>
								<td><input type="text" name="id" id="id"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="pwd" id="pwd"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="로그인"> <input
									type="reset" value="취소"></td>
							</tr>
						</table>

					</div>
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