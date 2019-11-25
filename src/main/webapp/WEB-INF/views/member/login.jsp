<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/login.css">
</head>
<body>
	<div class="sitename">SOCCERSTAT</div>
	<div class="loginBox border">
		<form action="<%=request.getContextPath()%>/login" method="post">
			<div class="idBox">
				<input type="text" name="id" placeholder="아이디를 입력하세요">
			</div>
			<div class="pwBox">
				<input type="password" name="pw" placeholder="비밀번호를 입력하세요"> 
			</div>
			<div class="loginBtn">
				<button>로그인</button>
			</div>
		</form>
		<div class="searchBox">
			<div class="searchID"><a href="<%=request.getContextPath()%>/searchId">아이디찾기</a></div>
			<div class="searchPw"><a href="<%=request.getContextPath()%>/searchPw">비밀번호찿기</a></div>
		</div>
	</div>
</body>
</html>