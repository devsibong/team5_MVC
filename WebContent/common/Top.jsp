<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<a href="Ex02_JDBC_Main.jsp">Main</a>&nbsp;&nbsp;&nbsp;||
<a href="Ex02_JDBC_Login.jsp">Login</a>&nbsp;&nbsp;&nbsp;||
<a href="Ex02_JDBC_JoinForm.jsp">Register</a>&nbsp;&nbsp;&nbsp;||
<a href="#">Intro</a>&nbsp;&nbsp;&nbsp;||
<a href="#">Intro</a>&nbsp;&nbsp;&nbsp;

<c:if test="${not empty sessionScope.userid}">
    <b>[ ${sessionScope.userid} ]</b> 로그인 상태
    <a href="${pageContext.request.contextPath}/logout.do">[ 로그아웃 ]</a>
</c:if>
<c:if test="${empty sessionScope.userid}">
    <b>[로그인 하지 않으셨네요]</b>
    <a href="${pageContext.request.contextPath}/login.do">[ 로그인 ]</a>
</c:if>
