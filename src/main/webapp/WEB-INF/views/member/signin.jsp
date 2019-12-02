<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/signin.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/signin.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/additional-methods.js"></script>	
</head>
<body>
	<div class="top">회원가입</div>
	<div class="bottom">
		<form action="" method="post" id="signin">
			<div class="row">
				<label class="identity1">아이디</label>
				<input class="identity2" placeholder="아이디를 입력하세요" name="id">
				<button type="button" id="confirm">아이디 중복확인</button>
				<div class="condition">특수문자, 기호, 띄어쓰기 불가능 (최대 12자)</div>
			</div>
			<div class="row">
				<label class="password1">비밀번호</label>
				<input class="password2" placeholder="비밀번호를 입력하세요" name="pw" id="pw">
				<div class="condition">영문, 숫자 조합 8~12자 (특수문자, 기호, 띄어쓰기 불가능)</div>
			</div>
			<div class="row">
				<label class="password3">비밀번호 확인</label>
				<input class="password4" placeholder="비밀번호를 입력하세요" name="pw2">
				<button type="button" id="pwConfirm">확인</button>
			</div>
			<div class="row">
				<label class="writer1">필명</label>
				<input placeholder="필명을 입력하세요" name="writer" id="writer">
				<button type="button" id="writerConfirm">필명 중복확인</button>
				<div class="condition">특수문자, 기호, 띄어쓰기 불가능 (최대 12자)</div>
			</div>
			<div class="row">
				<label class="name">이름</label>
				<input placeholder="이름을 입력하세요" name="name">
			</div>
			<!-- <div class="row">
				<label class="birth1">생년월일</label>
				<input class="birth2" placeholder="년도" name="year">
				<label class="line">년</label>
				<input class="birth3" placeholder="월" name="month">
				<label class="line">월</label>
				<input class="birth3" placeholder="일" name="day">
				<label class="line">일</label>
			</div> -->
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
				<input placeholder="휴대전화번호를 입력하세요" name="hp">
			</div>
			<div class="row">
				<label class="mail1">이메일</label>
				<input class="mail2" placeholder="이메일을 입력하세요" name="email">
				<!-- <label class="mail3">@</label>
				<select>
					<option>직접입력
					<option>naver.com
					<option>hanmail.net
					<option>gmail.com
					<option>nate.com
				</select> -->
			</div>
			<div class="row sign">
				<button>가입</button>
			</div>
		</form>
	</div>
</body>
</html>