<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.logo{
	display: inline-block;
}
.logo a{
	font-size: 60px;
	margin: 0;
	padding: 0;
}
.logo a:hover,.nav-menu a:hover{
	color: white;
	text-decoration: none;
}
.nav-menu{
	display: inline-flex;
	flex-flow: row wrap;
	width: 800px;
}
.menulist{
	list-style: none;
	display: inline-flex;
	margin: 0;
	width: 360px;
	font-size: 25px;
}
.member{
	list-style: none;
	display: inline-flex;
	margin: 0;
	
	font-size: 25px;
	margin-left: auto;
}
.menulist a,.member a{
	color: white;
	font-size: 20px;
}
.container-bottom{
	background-color: white;
}
.container-bottom a:hover{
	text-decoration: none;
}
.leaguelist{
	display: inline-flex;
	margin: 0;
	margin-left: 485px;
	list-style: none;
	font-size: 13px;
	font-weight: bold;
	background-color: white;
}
.tournamentlist{
	display: inline-flex;
	margin: 0;
	list-style: none;
	font-size: 13px;
	font-weight: bold;
	background-color: white;
}
.leaguelist a,.tournamentlist a{
	color: black;
}
.logout{
	float: right;
}
.retouch{
	float: right;
}
li{
	padding: 5px 10px;
}
.dis-none{
	display: none;
}
</style>
</head>
<body>
	<nav class=" navbar-expand-sm bg-dark navbar-dark">
	  	<div class="container">
	  		<div class="logo">
		  		<a class="navbar-brand" href="<%=request.getContextPath()%>/">SoccerStat</a>
		  	</div>
		  	<div class="nav-menu">
			  	<ul class="menulist">
			  		<c:if test="${user.authority ne 'ADMIN'}">
				    	<li class="league">
				      		<a href="#">리그</a>
				    	</li>
				    	<li class="tournament">
				      		<a href="#">토너먼트</a>
				    	</li>
				    	<li class="stat">
				      		<a href="#">스탯</a>
				    	</li>
				    	<li class="comparison">
				      		<a href="<%=request.getContextPath()%>/comparison">비교</a>
				    	</li>
			    	</c:if>
			    	<li class="board">
			      		<a href="<%=request.getContextPath()%>/list">게시판</a>
			    	</li>
			    	<c:if test="${user.authority eq 'ADMIN' }">
					    <li class="memberManage">
					      <a href="<%=request.getContextPath()%>/admin/user/list">회원관리</a>
					    </li>
					    <li class="boardManage">
					      <a href="<%=request.getContextPath()%>/admin/board/list">게시판 관리</a>
					    </li>
				    </c:if>
			  	</ul>
			  	<ul class="member">
			  		<c:if test="${user eq null}">
				    	<li class="login">
				      		<a href="<%=request.getContextPath()%>/login">로그인</a>
				    	</li>
				    	<li class="signin">
				      		<a href="<%=request.getContextPath()%>/signin">회원가입</a>
				    	</li>
			    	</c:if>
			    	<c:if test="${user ne null}">
				    	<li class="logout">
					      <a href="<%=request.getContextPath()%>/logout">로그아웃</a>
					    </li>
				    </c:if>
				    <c:if test="${user ne null and user.authority ne 'ADMIN'}">
				    	<li class="retouch">
					      <a href="<%=request.getContextPath()%>/retouch">회원정보수정</a>
					    </li>
				    </c:if>
			  	</ul>
		  	</div>
	  	</div>
	</nav>
</body>
</html>