<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>축구 게시판</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/list.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/list.js"></script>
</head>
<body>
	<div class="top">
		<div>축구 게시판</div>
		<a href="<%=request.getContextPath()%>/register"><button>글쓰기</button></a>
	</div>
	<div class="middle">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>필명</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${list}">
					<tr>
						<td>${tmp.listNo}</td>
						<td>${tmp.title}</td>
						<td>${tmp.penName}</td>
						<td>${tmp.day}</td>
						<td>${tmp.count}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="<%=request.getContextPath()%>/register"><button>글쓰기</button></a>
	</div>
	<ul class="pagination">
		<li class="page-item"><a class="page-link hover" href="#">이전</a></li>
	  	<li class="page-item active"><a class="page-link" href="#">1</a></li>
	  	<li class="page-item"><a class="page-link" href="#">2</a></li>
	  	<li class="page-item"><a class="page-link" href="#">다음</a></li>
	</ul>
	<form action="" class="search">
		<select class="search-sel">
			<option>제목</option>
			<option>내용</option>
			<option>필명</option>
		</select>
		<input class="search-inp">
		<button>검색</button>
	</form>
</body>
</html>