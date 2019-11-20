<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>스프링</title>
<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
	font-size: 13px;
}
input:focus,select:focus{
	outline-color: #343a40;
}
button:focus{
	outline: none;
}
input:focus::-webkit-input-placeholder{
	color:transparent;
}
button{
	background-color: #343a40;
	border: 1px solid;
	color: white;
	padding: 5px;
	outline: none;
}
.white{
	color: white;
}
.text-center{
	text-align: center;
}
</style>
</head>
<body>
	<tiles:insertAttribute name="header" />
    <div class="container">        
		<tiles:insertAttribute name="body" />
	</div>                                                  
	<tiles:insertAttribute name="footer" />
</body>
</html>