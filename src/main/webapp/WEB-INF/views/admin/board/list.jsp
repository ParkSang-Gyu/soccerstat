<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 관리</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<style type="text/css">
.container{
	width: 1140px;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}
button{
	padding: 5px;
	border: 0;
	outline: 0;
	width: 60px;
	background-color: #343a40;
	color: white;
}
input:focus,select:focus{
	outline-color: #343a40;
}
a{
	color: black;
}
a:hover{
	color: black;
	text-decoration: none;
}
.table th{
	padding: 5px;
	text-align: center;
}
.pagination a:hover{
	background-color: white;
}
.write{
	float: right;
	margin-bottom: 12px;
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
.search-inp:nth-child(1){
	width: 100px;
}
.search-inp:nth-child(2){
	width: 300px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('select[name=validState]').change(function(){
		location.href = '<%=request.getContextPath()%>/admin/board/update?'+$(this).val();
	})
})
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
	<div class="container">
		<h1>게시판</h1>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>조회수</th>
				<th>상태</th>
			</tr>
			<c:forEach var="board" items="${list}">
				<tr>
					<th>${board.num}</th>
					<th style="text-align: left;"><a  href="<%=request.getContextPath()%>/board/display?num=${board.num}">${board.title}</a></th>
					<th>${board.writer}</th>
					<th>${board.registered}</th>
					<th>${board.views}</th>
					<th>
						<select name="validState">
							<option  value="num=${board.num}&valid=D&page=${pageMaker.criteria.page}" <c:if test="${board.valid eq 'D'}">selected</c:if> >삭제</option>
							<option  value="num=${board.num}&valid=I&page=${pageMaker.criteria.page}"<c:if test="${board.valid eq 'I'}">selected</c:if> >게시</option>
						</select>
					</th>
				</tr>
			</c:forEach>
		</table>
		<ul class="pagination">
	    <c:if test="${pageMaker.prev}">
        <li class="page-item">
           <a class="page-link" href="<%=request.getContextPath()%>/admin/board/list?page=${pageMaker.startPage-1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">Previous</a>
        </li>
	    </c:if>
	    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
    		<c:if test="${pageMaker.criteria.page == index }">
	        <li class="page-item active">
            <a class="page-link" href="<%=request.getContextPath()%>/admin/board/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">${index}</a>
	        </li>
        </c:if>
        <c:if test="${pageMaker.criteria.page != index }">
	        <li class="page-item ">
            <a class="page-link" href="<%=request.getContextPath()%>/admin/board/list?page=${index}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">${index}</a>
	        </li>
        </c:if>
	    </c:forEach>
	    <c:if test="${pageMaker.next}">
        <li class="page-item">
           <a class="page-link" href="<%=request.getContextPath()%>/admin/board/list?page=${pageMaker.endPage+1}&type=${pageMaker.criteria.type}&search=${pageMaker.criteria.search}">Next</a>
        </li>
	    </c:if>
		</ul>
		<form class="search" method="get" action="<%=request.getContextPath()%>/board/list">
			<select name="type" class="search-inp">
				<option value="0">선택</option>
				<option value="1" <c:if test="${pageMaker.criteria.type eq 1}">selected</c:if>>제목</option>
				<option value="2" <c:if test="${pageMaker.criteria.type eq 2}">selected</c:if>>내용</option>
				<option value="3" <c:if test="${pageMaker.criteria.type eq 3}">selected</c:if>>필명</option>
			</select>
 			<input type="text" name="search" class="search-inp" value="${pageMaker.criteria.search}">
			<button type="submit">검색</button>
		</form>
	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>