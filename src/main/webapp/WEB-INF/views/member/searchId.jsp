<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.top{
	font-size: 50px;
	text-align: center;
	margin-top: 50px;
}
.center{
	height: 270px;
}
.left,.right{
	display: inline-block;
	text-align: center;
	width: 552px;
	font-weight: 30px;
	padding: 10px;
	float: left;
	margin: 40px 0;
}
.phone,.mail{
	font-size: 20px;
	margin-bottom: 20px;
}
.left div:nth-child(2){
	margin-bottom: 27px;
}
.left button{
	padding: 10 10px;
	font-size: 15px;
	color: white;
}
.right div:nth-child(2){
	margin-bottom: 14px;
}
.bottom button{
	padding: 10 10px;
	font-size: 30px;
	margin-bottom: 50px;
	background-color: #343a40;
	margin-left: calc((100% - 105px) - 50%);
	border: 1px solid;
	color: white;
}
</style>
</head>
<body>
	<p class="top">아이디 찾기</p>
	<div class="center">
		<div class="left border">
			<div class="phone">휴대폰 인증</div>
			<div>본인 명의 휴대전화로 인증</div>
			<button>인증하기</button>
		</div>
		<div class="right border">
			<div class="mail">메일 인증</div>
			<div>
				admin@soccerstat.co.kr으로<br> 
				이름, 이메일, 전화번호 끝 4자리를<br>
				알려주시면 확인 후 등록하신 이메일로<br>
				보내드리겠습니다.
			</div>
		</div>
	</div>
	<div class="bottom">
		<a href="<%=request.getContextPath()%>/searchPw?"><button>비밀번호 찾기</button></a>
	</div>
</body>
</html>