<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
		height: 100vh;
	}
	.mainContents{
		display:flex;
		justify-content : center;
		background-color: white;
		align-items: center;
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
 //jquery 로 간단하게 유효성 check 하기
 $(function() {
  	$('#joinForm').submit(function() {
	   //alert("가입");
	if ($('#id').val() == "") { // 아이디 검사
    	alert('ID를 입력해 주세요.');
    	$('#id').focus();
    return false;
   } else if ($('#pwd').val() == "") { // 비밀번호 검사
    alert('PWD를 입력해 주세요.');
    $('#pwd').focus();
    return false;
   }else if ($('#mname').val() == "") { // 이름 검사
    alert('mname를 입력해 주세요.');
    $('#mname').focus();
    return false;
   }else if ($('#age').val() == "") { // 나이 검사
    alert('age를 입력해 주세요.');
    $('#age').focus();
    return false;
   }else if ($('#email').val() == "") { // 우편번호
    alert('email를 입력해 주세요.');
    $('#email').focus();
    return false;
   }
   
  });
 });
</script>
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
			<form action="${pageContext.request.contextPath}/joinok.do" method="post" name="joinForm" id="joinForm">

			<h3 style="text-align: center;">Join Page</h3>
			
			  <div class="form-outline mb-4">
			    <label class="form-label" for="form1Example1">ID:</label>
			    <input type="text" name="id" id="id" class="form-control" />
			  </div>			
			  <div class="form-outline mb-4">
			    <label class="form-label" for="form1Example2">PWD:</label>
			    <input type="password" name="pwd" id="pwd" class="form-control" />
			  </div>
			  <div class="form-outline mb-4">
			    <label class="form-label" for="form1Example2">Name:</label>
			    <input type="text" name="mname" id="mname" class="form-control" />
			  </div>
			  <div class="form-outline mb-4">
			    <label class="form-label" for="form1Example2">age:</label>
			    <input type="text" name="age" id="age" class="form-control" />
			  </div>
			  <div class="form-outline mb-4">
			    <label class="form-label" for="form1Example2">Gender:</label>
			    <input type="radio" name="gender" id="gender" value="여"
									checked/>여자 <input type="radio" name="gender"
									id="gender" value="남" />남자
			  </div>
			  <div class="form-outline mb-4">
			    <label class="form-label" for="form1Example2">Email:</label>
			    <input type="text" name="email" id="email" class="form-control" />
			  </div>
			
			  <!-- Submit button -->
			  <button type="submit" value="회원가입" class="btn btn-primary btn-block">회원가입</button>
			  <button type="reset" value="취소" class="btn btn-primary btn-block">취소</button>
			


					
				</form>

		</div>
	</div>
	<div>
		<td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td>
	</div>
</body>
</html>
<script type="text/javascript">

</script>
