<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>축구 게시판</title>
<style type="text/css">
.top{
	height: 30px;
	margin-top: 10px;
}
.title{
	position: absolute;
	font-size: 20px;
	text-align: center;
}
.write{
	float: right;
	margin-bottom: 12px;
}
button{
	padding: 5px;
	border: 0;
	outline: o;
}
.middle{
	margin: 10px 0;
}
.pagination{
	margin-top: 80px;
	justify-content: center;
}
.page-link{
	border-style: none;
	color: black;
	margin-top: 45px;
}
.search{
	text-align: center;
	margin-bottom: 20px;
}
.search-sel,.search-inp{
	height: 34px;
}
.search-inp{
	width: 300px;
}
a{
	color: white;
	float: right;
}
</style>
</head>
<body>
	<div class="top">
		<div class="title">축구 게시판</div>
		<a href="<%=request.getContextPath()%>/register"><button>글쓰기</button></a>
	</div>
	<div class="middle">
		<form action="">
			<table class="table table-hover">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>필명</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천</th>
				</tr>
				<tr>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
				</tr>
			</table>
		</form>
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