<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
<style type="text/css">
.write{
	font-size: 20px;
	margin: 15px 0;
}
.info{
	border-top: 1px solid #343a40;
	height: 60px;
}
.id{
	width: 910px;
	padding: 3 0 3 10px;
	display: inline-block;
	border-bottom: 1px solid #343a40;
	float: left;
}
.title{
	width: 910px;
	padding: 1.8 0 1.8 10px;
	display: inline-block;
	border-bottom: 1px solid #343a40;
	line-height: 2px;
	float: left;
}
label{
	width: 200px;
	padding: 3px 10px 3px 0;
	text-align: right;
	border-bottom: 1px solid #343a40;
	float: left;
	background-color: #f6f6f6;
}
label:nth-child(1){
	margin-bottom: 0;
}
.info::after {
	content: "";
	dispaly: block;
	clear: both
}
input{
	width: 890px;
}
.middle{
	margin-bottom: 15px;
	text-align: center;
}
.middle button{
	margin: 5 0 5 5px;
	padding: 5 15px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$('#summernote').summernote({
		height: 300,
        minHeight: null,
        maxHeight: null,
        focus: true 
	});
});
</script>
</head>
<body>
	<div class="write">글쓰기</div>
	<div class="top">
		<div class="info">
			<label>필명</label>
			<div class="id">아무나</div>
			<label>제목</label>
			<div class="title">
				<input></input>
			</div>
		</div>
	</div>
	<div class="middle">
		<form action="">
			<div class="form-group">
				<textarea id="summernote"></textarea>
			</div>
			<a href="<%=request.getContextPath()%>/list"><button type="button">목록</button></a>
			<button>등록</button>
		</form>
	</div>
</body>
</html>