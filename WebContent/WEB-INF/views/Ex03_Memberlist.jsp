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
					회원명 : <input type="text" name="search"> 
					<input type="submit" value="이름검색하기">
				</form>

				<table  class="innerMain table-light table-striped" style="width:800px; margin: auto">
					<tr class="table-primary">
						<th colspan="2">아이디</th><th colspan="2">주소</th><th colspan="1">삭제하기</th><th colspan="1">수정하기</th>
					</tr>
					<c:forEach var="member" items="${memberList}">
					  <tr>
					    <td width="100px" colspan="2">
					      <form action="${pageContext.request.contextPath}/memberdetail.do" method="post">
					        <input type="hidden" name="id" value="${member.id}">
					        <button class="btn btn-link" type="submit">${member.id}</button>
					      </form>
					    </td>
					    <td width="100px" colspan="2">${member.ip}</td>
					    <td colspan="1">
					      <form action="${pageContext.request.contextPath}/deletemember.do" method="post">
					        <input type="hidden" name="id" value="${member.id}">
					        <button class="btn btn-danger" type="submit">[삭제]</button>
					      </form>
					    </td>
					    <td colspan="1">
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
		<jsp:include page="/common/Bottom.jsp"></jsp:include>
	</div>
</body>
</html>
<script type="text/javascript">

</script>
