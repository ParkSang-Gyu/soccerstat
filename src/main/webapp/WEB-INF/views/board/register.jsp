<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% 
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/register.css">
<script src="<%=request.getContextPath()%>/resources/js/summernote-ko-KR.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
    	placeholder: '내용을 입력하세요',
        minHeight: 370,
        maxHeight: null,
        focus : true,
        lang : 'ko-KR'      
  	});
	function goWrite(frm) {
		var title = frm.title.value;
		var writer = frm.writer.value;
		var content = frm.content.value;
		
		if (title.trim() == ''){
			alert("제목을 입력해주세요");
			return false;
		}
		if (writer.trim() == ''){
			alert("필명을 입력해주세요");
			return false;
		}
		if (content.trim() == ''){
			alert("내용을 입력해주세요");
			return false;
		}
		frm.submit();
	}
});
</script>
</head>
<body>
	<div class="write">글쓰기</div>
	<div class="top">
		<div class="writer">필명</div>
		<div class="writer1">${user.writer}</div><br>
		<div class="title">제목</div>
		<div class="title1">
			<input type="text" name="title" placeholder="제목을 입력하세요">
		</div>
	</div>
	<div class="middle">
		<form action="<%=request.getContextPath()%>/register" method="post">
			<div class="form-group">
				<textarea id="summernote" name="content"></textarea>
			</div>
			<div>게시판 성격에 맞지 않거나 욕설 등이 포함된 글은 사전 공지 없이 삭제될 수 있습니다.</div>
			<a href="<%=request.getContextPath()%>/list"><button type="button">목록</button></a>
			<button>등록</button>
			<input type="hidden" value="<%= sf.format(nowTime) %>" name="date">
		</form>
	</div>
</body>
</html>