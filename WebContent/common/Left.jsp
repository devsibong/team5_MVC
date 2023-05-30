<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!--Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- Propeller CSS -->  
<link rel="stylesheet" href="css/propeller.min.css">

    <!-- Left sidebar --> 
     <aside id="basicSidebar" class="pmd-sidebar pmd-sidebar-dark  pmd-z-depth" role="navigation">
        <ul class="nav flex-column pmd-sidebar-nav ">
             
            <li class="nav-item">
                <a class="nav-link active text-white" href="Ex02_JDBC_Main.jsp">
                    <i class="material-icons pmd-list-icon pmd-sm">star</i>
                    <span class="media-body">Main</span>
                </a>
            </li>
        	
        	<c:if test="${empty sessionScope.userid}">
	            <li class="nav-item">
	                <a class="nav-link text-white" href="${pageContext.request.contextPath}/login.do">
	                    <i class="material-icons pmd-list-icon pmd-sm">send</i>
	                    <span class="media-body">Login</span>
	                </a>
	            </li>           
			
	            <li class="nav-item">
	                <a class="nav-link text-white" href="${pageContext.request.contextPath}/join.do">
	                    <i class="material-icons pmd-list-icon pmd-sm">drafts</i>
	                    <span class="media-body">Register</span>
	                </a>
	            </li>
            </c:if>
            <c:if test="${sessionScope.userid eq 'admin' }">
            	<li class="nav-item">
	                <a class="nav-link text-white" href="${pageContext.request.contextPath}/managemember.do">
	                    <i class="material-icons pmd-list-icon pmd-sm">drafts</i>
	                    <span class="media-body">회원관리</span>
	                </a>
	            </li>
            </c:if>
            
        </ul>
    </aside>
    <div class="pmd-sidebar-overlay"></div>
   