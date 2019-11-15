<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a{
	color: black;
}
.sitename{
	font-size: 50px;
	margin-top: 72px;
}
.sitename,.loginBox{
	width: 300px;
	text-align: center;
	margin-left: calc((100% - 150px) - 50%);
}
.loginBox{
	margin-bottom: 92px;
}
.loginBox div{
	margin: 15px 0;
}
input{
	width: 280px;
	height: 50px;
}
button{
	width: 280px;
	height: 60px;
	background-color: #343a40;
	border: 1px solid;
	color: white;
}
.searchBox div{
	display: inline-block;
}
.searchID{
	border-right: 1px solid #e4e4e5;
	padding-right: 4px;
}
</style>
</head>
<body>
	<div class="sitename">SOCCERSTAT</div>
	<div class="loginBox border">
		<form action="">
			<div class="idBox">
				<input type="text" name="id" placeholder="아이디를 입력하세요">
			</div>
			<div class="pwBox">
				<input type="password" placeholder="비밀번호를 입력하세요"> 
			</div>
			<div class="loginBtn">
				<button>로그인</button>
			</div>
		</form>
		<div class="searchBox">
			<div class="searchID"><a href="<%=request.getContextPath()%>/searchId?">아이디찾기</a></div>
			<div class="searchPw"><a href="<%=request.getContextPath()%>/searchPw?">비밀번호찿기</a></div>
		</div>
	</div>
</body>
</html>