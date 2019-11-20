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
		<a class="write" href="<%=request.getContextPath()%>/register"><button>글쓰기</button></a>
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
						<td><a class="title" href="<%=request.getContextPath()%>/display?listNum=${tmp.listNo}&page=${pageMaker.criteria.page}&perPageNum=${pageMaker.criteria.perPageNum}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">${tmp.title}</a></td>
						<td>${tmp.penName}</td>
						<td>${tmp.day}</td>
						<td>${tmp.count}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="write" href="<%=request.getContextPath()%>/register"><button>글쓰기</button></a>
	</div>
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li class="page-item">
				<a class="page-link" href="<%=request.getContextPath()%>/list?page=${pageMaker.startPage-1}&perPageNum=${pageMaker.criteria.perPageNum}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
	    	<c:if test="${pageMaker.criteria.page == index }">
		        <li class="page-item active">
		            <a class="page-link " href="<%=request.getContextPath()%>/list?page=${index}&perPageNum=${pageMaker.criteria.perPageNum}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">${index}</a>
		        </li>
        	</c:if>
	        <c:if test="${pageMaker.criteria.page != index }">
		        <li class="page-item">
		            <a class="page-link" href="<%=request.getContextPath()%>/list?page=${index}&perPageNum=${pageMaker.criteria.perPageNum}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">${index}</a>
		        </li>
	        </c:if>
	    </c:forEach>
	    <c:if test="${pageMaker.next}">
	  		<li class="page-item">
	  			<a class="page-link" href="<%=request.getContextPath()%>/list?page=${pageMaker.endPage+1}&perPageNum=${pageMaker.criteria.perPageNum}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">다음</a>
  			</li>
  		</c:if>
	</ul>
	<form class="search" action="<%=request.getContextPath()%>/list" method="get">
		<select class="search-sel" name="type">
			<option value="1" <c:if test="${pageMaker.criteria.type == 1}">selected</c:if> >제목</option>
			<option value="2" <c:if test="${pageMaker.criteria.type == 2}">selected</c:if>>내용</option>
			<option value="3" <c:if test="${pageMaker.criteria.type == 3}">selected</c:if>>필명</option>
		</select>
		<input class="search-inp" name="search" type="text" value="${pageMaker.criteria.search}">
		<button>검색</button>
	</form>
</body>
</html>