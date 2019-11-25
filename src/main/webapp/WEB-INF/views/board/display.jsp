<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상세 페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/display.css">
</head>
<body>
	<div class="top">
		<div class="soccerBoard">축구 게시판</div>
		<a class="float-r" href="<%=request.getContextPath()%>/register"><button>글쓰기</button></a>
		<a class="float-r a-margin" href="<%=request.getContextPath()%>/list"><button>목록</button></a>
	</div>
	<div class="middle">
		<div class="mid-top">
			<div class="title">제목</div>
			<div class="info">
				<ul class="userinfo">
					<li>${board.writer}</li>
					<li></li>
					<li>${board.registered}</li>
					<li class="float-r">조회 : ${board.views}</li>
					<li class="float-r">추천 : </li>
				</ul>
			</div>
		</div>
		<div class="mid-center">
			<div class="text">${board.contents}</div>
			<button class="recommend">추천</button>
		</div>
	</div>
	<div class="mid-bottom">
		<a class="float-r a-margin" href="<%=request.getContextPath()%>/register"><button>글쓰기</button></a>
		<a class="float-r a-margin" href="<%=request.getContextPath()%>/list"><button>목록</button></a>
		<c:if test="${user.writer eq board.writer }">
			<a class="float-r a-margin" href="<%=request.getContextPath()%>/modify?num=${board.num}"><button>수정</button></a>
		</c:if>
		<c:if test="${user.writer eq board.writer }">
			<a class="float-r" href="<%=request.getContextPath()%>/delete?num=${board.num}"><button>삭제</button></a>
		</c:if>
	</div>
	<div class="bottom">
		<div class="comment">
			<div class="comment-top">
				<ul class="userinfo">
					<li></li>
					<li></li>
					<li class="float-r"></li>
				</ul>
			</div>
			<div class="comment-mid">
				<div class="comment-txt"></div>
			</div>
			<div class="comment-bottom">
				<button>댓글의 답글달기</button>
				<button class="float-r">추천</button>
			</div>
		</div>
		<div class="reply">
			<form action="">
				<div>댓글쓰기</div>
				<input placeholder="댓글을 작성하시려면 로그인 하세요">
				<button>확인</button>
			</form>
		</div>
	</div>
</body>
</html>