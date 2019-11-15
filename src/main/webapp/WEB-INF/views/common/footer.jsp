<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
.jumbotron{
	background-color: #343a40;
	color: white;
}
.jumbotron>div{
	height: 54px;
}
.con-left{
	width: 300px;
	height: 54px;
	display: inline-block;
	line-height: 50px;
}
.con-left a{
	font-size: 60px;
	text-decoration: none;
	color: white;
}
.con-right{
	display: inline-block;
	width: calc(100% - 300px);
	padding: 5px 0;
}
.con-right1,.con-right2{
	display: inline-block;
	margin-right: 10px;
}
.con-right3{
	display: inline-block;
}
.con-right-top a{
	color: white;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="jumbotron jumbotron-fluid mb-0">
	  <div class="container">
	       <div class="con-left float-left">
	       		<a href="<%=request.getContextPath()%>/">SoccerStat</a>
	       	</div>
	       <div class="con-right float-left">
	       		<div class="con-right-top">
	       			<div class="con-right1">
	       				<a href="<%=request.getContextPath()%>/privacy?">개인정보</a>
	    			</div>
	       			<div class="con-right2">
	       				<a href="<%=request.getContextPath()%>/adalliance?">광고제휴</a>
	     			</div>
	       			<div class="con-right3">
	       				<a href="<%=request.getContextPath()%>/termsOfUse?">이용약관</a>
	      			</div>
	       		</div>
	       		<div class="con-right-bottom">Copyright© 2019 soccer & stat All rights reserved</div>
	       </div>
	  </div>
	</div>
</body>
</html>