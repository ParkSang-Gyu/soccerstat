<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상세 페이지</title>
<style type="text/css">
.top{
	position: relative;
	height: 40px;
	margin: 20px 0;
}
.soccerBoard{
	position: absolute;
	font-size: 20px;
	text-align: center;
	line-height: 35px;
}
.middle{
	border: 1px solid #343a40;
}
.mid-top{
	margin: 10 10 0 10px;
}
.title{
	font-size: 20px;
	border-bottom: 1px solid #343a40;
	padding-bottom: 5px;
}
.info{
	border-bottom: 1px solid #343a40;
	margin-top: 5px;
}
.userinfo{
	list-style: none;
	margin-bottom: 5px;
}
.mid-center{
	margin: 10 10 0 10px;
}
.text{
	margin-bottom: 10px;
}
.mid-bottom{
	height: 46px;
}
.mid-bottom a{
	margin-top: 10px;
}
.userinfo li{
	font-weight: bold;
	display: inline-block;
}
.float-r{
	float: right;
}
.a-margin{
	margin-right: 5px;
}
</style>
</head>
<body>
	<div class="top">
		<div class="soccerBoard">글쓰기</div>
	</div>
	<div class="middle">
		<form action="">
			<div class="mid-top">
				<div class="title">제목</div>
				<div class="info">
					<ul class="userinfo">
						<li>필명</li>
						<li>아이디</li>
						<li>작성일</li>
						<li class="float-r">추천</li>
						<li class="float-r">조회수</li>
					</ul>
				</div>
			</div>
			<div class="mid-center">
				<div class="text">
					동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세
					무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세
					남산 위에 저 소나무 철갑을 두른 듯 바람 서리 불변함은 우리 기상일세
					무궁화 삼천리 화려강산 대한으로 대한으로 길이 보전하세
				</div>
			</div>
		</form>
	</div>
	<div class="mid-bottom">
		<a class="float-r a-margin"><button>수정</button></a>
		<a class="float-r a-margin" href="<%=request.getContextPath()%>/list"><button>목록</button></a>
	</div>
</body>
</html>