<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/retouch.css">
</head>
<body>
	<div class="top">회원정보수정</div>
	<div class="bottom">
		<form action="">
			<div class="row">
				<label class="id1">아이디</label>
				<input class="id2" readonly>
			</div>
			<div class="row">
				<label class="pw1">비밀번호</label>
				<input class="pw2" placeholder="새로운 비밀번호를 입력하세요">
				<div class="condition">영문, 숫자 조합 8~12자 (특수문자, 기호, 띄어쓰기 불가능)</div>
			</div>
			<div class="row">
				<label class="pw3">비밀번호 확인</label>
				<input class="pw4" placeholder="다시 한 번 비밀번호를 입력하세요">
				<button>확인</button>
			</div>
			<div class="row">
				<label class="name">이름</label>
				<input readonly>
			</div>
			<div class="row">
				<label class="birth1">생년월일</label>
				<input class="birth2" placeholder="년도">
				<label class="line">년</label>
				<input class="birth3" placeholder="월">
				<label class="line">월</label>
				<input class="birth3" placeholder="일">
				<label class="line">일</label>
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
				<input placeholder="휴대전화번호를 입력하세요">
			</div>
			<div class="row">
				<label class="mail1">이메일</label>
				<input class="mail2" placeholder="이메일을 입력하세요">
				<label class="mail3">@</label>
				<select>
					<option>직접입력
					<option>naver.com
					<option>hanmail.net
					<option>gmail.com
					<option>nate.com
				</select>
			</div>
			<div class="row sign">
				<button>수정</button>
			</div>
		</form>
	</div>
</body>
</html>