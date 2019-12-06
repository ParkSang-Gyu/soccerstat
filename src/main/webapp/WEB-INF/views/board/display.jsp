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
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/display.js"></script>
</head>
<body>
	<div class="top">
		<div class="soccerBoard">축구 게시판</div>
		<c:if test="${user eq null}">
			<a class="float-r a-margin write" href="<%=request.getContextPath()%>/login">
		</c:if>
		<c:if test="${user ne null}">
			<a class="float-r a-margin write" href="<%=request.getContextPath()%>/register">
		</c:if>
				<button>글쓰기</button>
			</a>
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
					<li class="float-r">추천 : ${board.recommend}</li>
				</ul>
			</div>
		</div>
		<div class="mid-center">
			<div class="text">${board.content}</div>
		</div>
	</div>
	<div class="mid-bottom">
		<c:if test="${user eq null}">
			<a class="float-r a-margin write" href="<%=request.getContextPath()%>/login">
		</c:if>
		<c:if test="${user ne null}">
			<a class="float-r a-margin write" href="<%=request.getContextPath()%>/register">
		</c:if>
				<button>글쓰기</button>
			</a>
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
			<c:forEach var="tmp" items="${reply}">
				<div class="comment-top">
					<ul class="userinfo" >
						<li>${tmp.writer}</li>
						<li>${tmp.id}</li>
						<li class="float-r" style="padding-top: 2px;"><button class="btn" value="${board.num}">추천 : ${tmp.recommend}</button></li>
						<li class="float-r">${tmp.registered}</li>
					</ul>
					<div class="comment-mid">
						<div class="comment-txt">${tmp.content}</div>
					</div>
					<div class="comment-bottom">
						<button class="float-r recommend">추천</button>
						<input type="hidden" value="${tmp.num}" name="replyNum">
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="reply">
			<form action="<%=request.getContextPath()%>/display" method="post">
				<div>댓글쓰기</div>
				<c:if test="${user eq null}">
					<a href="<%=request.getContextPath()%>/login">
				</c:if>
						<input type="text" placeholder="댓글을 작성하시려면 로그인 하세요" name="content">
					</a>
				<input type="hidden" value="${board.num}" name="num">
				<input type="hidden" value="<%= sf.format(nowTime) %>" name="registered">
				<button  class="submit" type="submit">확인</button>
			</form>
		</div>
	</div>
</body>
</html>