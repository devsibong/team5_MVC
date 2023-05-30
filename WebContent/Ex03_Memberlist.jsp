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
				<h1>회원리스트</h1>
				<form  class="innerMain" action="${pageContext.request.contextPath}/searchmember.do" method="post">
					회원명:<input type="text" name="search">
					<input type="submit" value="이름검색하기">
				</form>

				<table  class="innerMain table table-striped" style="margin-left: auto;margin-right: auto">
					<tr>
						<td colspan="1">아이디</td><td colspan="1">주소</td><td colspan="1">삭제하기</td><td colspan="1">수정하기</td>
					</tr>
					<c:forEach var="member" items="${memberList}">
					  <tr>
					    <td width="100px">
					      <form action="${pageContext.request.contextPath}/memberdetail.do" method="post">
					        <input type="hidden" name="id" value="${member.id}">
					        <button class="btn btn-link" type="submit">${member.id}</button>
					      </form>
					    </td>
					    <td width="100px">${member.ip}</td>
					    <td>
					      <form action="${pageContext.request.contextPath}/deletemember.do" method="post">
					        <input type="hidden" name="id" value="${member.id}">
					        <button class="btn btn-danger" type="submit">[삭제]</button>
					      </form>
					    </td>
					    <td>
					      <form action="${pageContext.request.contextPath}/updatemember.do" method="post">
					        <input type="hidden" name="id" value="${member.id}">
					        <button class="btn btn-primary" type="submit">[수정]</button>
					      </form>
					    </td>
					  </tr>
					</c:forEach>
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
