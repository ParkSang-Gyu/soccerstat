<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/retouch.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/retouch.js"></script>
</head>
<body>
	<div class="top">회원가입</div>
	<div class="bottom">
		<form action="" method="post" id="retouch">
			<div class="row">
				<label class="name">이름</label>
				<input name="name" value="${user.name}" readonly="true">
			</div>
			<div class="row">
				<label class="writer">필명</label>
				<input name="writer" value="${user.writer}">
			</div>
			<div class="row">
				<label class="identity1">아이디</label>
				<input value="${user.id}" name="id" readonly="true">
			</div>
			<div class="row">
				<label class="password1">기존 비밀번호</label>
				<input type="password" placeholder="기존 비밀번호를 입력하세요" name="oldPw">
			</div>
			<div class="row">
				<label class="password3">새 비밀번호</label>
				<input type="password" placeholder="새 비밀번호를 입력하세요" name="pw">
				<div class="condition">영문, 숫자 조합 8~12자 (특수문자, 기호, 띄어쓰기 불가능)</div>
			</div>
			<div class="row">
				<label class="password5">비밀번호 확인</label>
				<input type="password" placeholder="새 비밀번호를 다시 입력하세요" name="pw2">
				<button type="button" id="pwConfirm">확인</button>
			</div>
			<div class="row">
				<label class="gender1">성별</label>
				<div class="gender2">
			      	<label class="gender3">남성</label>
			      	<input type="radio" name="gender" value="M">
			      	<label class="gender3">여성</label>
			      	<input type="radio" name="gender" value="F">
			    </div>
			</div>
			<div class="row">
				<label class="phone">휴대전화</label>
				<input value="${user.hp}" name="hp">
			</div>
			<div class="row">
				<label class="mail1">이메일</label>
				<input type="email" value="${user.email}" name="email">
			</div>
			<div class="row none">
				<label class="auth">권한</label>
				<input value="${user.authority}" name="authority">
			</div>
			<div class="row sign">
				<button>수정</button>
			</div>
		</form>
	</div>
</body>
</html>