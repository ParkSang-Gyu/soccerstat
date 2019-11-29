<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% 
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<title>상세 페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/display.css">
<script type="text/javascript">
$(document).ready(function () {
	$('.submit').click(function () {
		location.href = '<%=request.getContextPath()%>/display?'+$('input[name=board_num]').val();
	})
})
</script>
</head>
<body>
	<div class="top">
		<div class="soccerBoard">축구 게시판</div>
		<a class="float-r" href="<%=request.getContextPath()%>/register"><button>글쓰기</button></a>
		<a class="float-r a-margin" href="<%=request.getContextPath()%>/list"><button>목록</button></a>
	</div>
	<div class="middle">
		<div class="mid-top">
			<div class="title">${board.title}</div>
			<div class="info">
				<ul class="userinfo">
					<li>${board.writer}</li>
					<li>${board.id}</li>
					<li>${board.registered}</li>
					<li class="float-r">조회 : ${board.views}</li>
				</ul>
			</div>
		</div>
		<div class="mid-center">
			<div class="text">${board.content}</div>
		</div>
	</div>
	<div class="mid-bottom">
		<a class="float-r a-margin" href="<%=request.getContextPath()%>/register"><button>글쓰기</button></a>
		<a class="float-r a-margin" href="<%=request.getContextPath()%>/list"><button>목록</button></a>
		<c:if test="${user.writer eq board.writer }">
			<a class="float-r a-margin" href="<%=request.getContextPath()%>/modify?num=${board.num}"><button>수정</button></a>
		</c:if>
		<c:if test="${user.writer eq board.writer }">
			<a class="float-r" href="<%=request.getContextPath()%>/list?num=${board.num}" style="margin-right: 5px;"><button>삭제</button></a>
		</c:if>
	</div>
	<div class="bottom">
		<div class="comment">
			<div class="comment-top">
				<ul class="userinfo">
					<li>${reply.writer}</li>
					<li>${reply.id}</li>
					<li class="float-r">${reply.registered}</li>
				</ul>
			</div>
			<div class="comment-mid">
				<div class="comment-txt">${reply.content}</div>
			</div>
			<div class="comment-bottom">
				<button>댓글의 답글달기</button>
				<button class="float-r">추천</button>
			</div>
		</div>
		<div class="reply">
			<form action="<%=request.getContextPath()%>/display" method="post">
				<div>댓글쓰기</div>
				<input type="text" placeholder="댓글을 작성하시려면 로그인 하세요" name="content">
				<input type="hidden" value="${board.num}" name="num">
				<input type="hidden" value="<%= sf.format(nowTime) %>" name="registered">
				<button  class="submit" type="submit">확인</button>
			</form>
		</div>
	</div>
</body>
</html>