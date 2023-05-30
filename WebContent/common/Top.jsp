<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light bg-info bg-gradient flex-fill">
    <div class="container-fluid">
	    <a class="navbar-brand text-white" href="#"> <i class="bi bi-dice-5  text-white"></i> 5조 </a>
      <div class="collapse navbar-collapse" id="navbarExample01">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0"> 
          <li class="nav-item active">
            <a class="nav-link text-white" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="Ex02_JDBC_Main.jsp">Main</a>
          </li>
          <c:if test="${empty sessionScope.userid}">
	          <li class="nav-item">
	            <a class="nav-link text-white" href="${pageContext.request.contextPath}/login.do">Login</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link text-white" href="${pageContext.request.contextPath}/join.do">Register</a>
	          </li>
          </c:if>     
        </ul>   
          
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <c:if test="${not empty sessionScope.userid}">
          	<li class="nav-item">
			    <b class="nav-link text-white"> 로그인 상태 </b> 
		    </li>
          	<li class="nav-item">
			   <a class="btn btn-success" href="${pageContext.request.contextPath}/logout.do" role="button"> 로그아웃 </a>
		    </li>
	      </c:if>
			
		  <c:if test="${empty sessionScope.userid}">
	          <li class="nav-item">
				 <b class="nav-link text-white"> 🤷‍♂️로그인 하지 않으셨네요!🤷‍♂</b>
		      </li>
	          <li class="nav-item ">
				 <a class="btn btn-danger" href="${pageContext.request.contextPath}/login.do" role="button"> 로그인 </a>
		      </li>
		  </c:if>
        </ul>
      </div>
    </div>
  </nav>







