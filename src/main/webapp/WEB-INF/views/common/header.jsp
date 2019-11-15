<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
.logo{
	display: inline-block;
}
.logo a{
	font-size: 60px;
	margin: 0;
	padding: 0;
}
.logo a:hover,.nav-menu a:hover{
	color: white;
	text-decoration: none;
}
.nav-menu{
	display: inline-flex;
	flex-flow: row wrap;
	width: 830px;
}
.menulist{
	list-style: none;
	display: inline-flex;
	margin: 0;
	width: 360px;
	font-size: 25px;
}
.member{
	list-style: none;
	display: inline-flex;
	margin: 0;
	width: 180px;
	font-size: 25px;
	margin-left: auto;
}
.menulist a,.member a{
	color: white;
	font-size: 20px;
}
.container-bottom{
	background-color: white;
}
.container-bottom a:hover{
	text-decoration: none;
}
.leaguelist{
	display: inline-flex;
	margin: 0;
	margin-left: 485px;
	list-style: none;
	font-size: 13px;
	font-weight: bold;
	background-color: white;
}
.tournamentlist{
	display: inline-flex;
	margin: 0;
	list-style: none;
	font-size: 13px;
	font-weight: bold;
	background-color: white;
}
.leaguelist a,.tournamentlist a{
	color: black;
}
li{
	padding: 5px 10px;
}
.dis-none{
	display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function () {
	var england = $('img[name=england]').attr('name');
	var spain = $('img[name=spain]').attr('name');
	var germany = $('img[name=germany]').attr('name');
	var italia = $('img[name=italia]').attr('name');
	var france = $('img[name=france]').attr('name');
	var netherland = $('img[name=netherland]').attr('name');
	var uefa = $('img[name=uefa]').attr('name');
	$('img[name=england]').attr('src', '${pageContext.request.contextPath}/resources/img/'+england+'.png')
	$('img[name=spain]').attr('src', '${pageContext.request.contextPath}/resources/img/'+spain+'.png')
	$('img[name=germany]').attr('src', '${pageContext.request.contextPath}/resources/img/'+germany+'.png')
	$('img[name=italia]').attr('src', '${pageContext.request.contextPath}/resources/img/'+italia+'.png')
	$('img[name=france]').attr('src', '${pageContext.request.contextPath}/resources/img/'+france+'.png')
	$('img[name=netherland]').attr('src', '${pageContext.request.contextPath}/resources/img/'+netherland+'.png')
	$('img[name=uefa]').attr('src', '${pageContext.request.contextPath}/resources/img/'+uefa+'.png')
	$('.league').click(function () {
		$('.leaguelist').removeClass('dis-none');
		$('.tournamentlist').addClass('dis-none');
	})
	$('.tournament').click(function () {
		$('.tournamentlist').removeClass('dis-none');
		$('.tournamentlist').css('margin-left','485px');
		$('.leaguelist').addClass('dis-none');
	})
})
</script>
</head>
<body>
	<nav class=" navbar-expand-sm bg-dark navbar-dark">
	  	<div class="container">
	  		<div class="logo">
		  		<a class="navbar-brand" href="<%=request.getContextPath()%>/">SoccerStat</a>
		  	</div>
		  	<div class="nav-menu">
			  	<ul class="menulist">
			    	<li class="league">
			      		<a href="#">리그</a>
			    	</li>
			    	<li class="tournament">
			      		<a href="#">토너먼트</a>
			    	</li>
			    	<li class="stat">
			      		<a href="#">스탯</a>
			    	</li>
			    	<li class="comparison">
			      		<a href="#">비교</a>
			    	</li>
			    	<li class="board">
			      		<a href="<%=request.getContextPath()%>/list">게시판</a>
			    	</li>
			  	</ul>
			  	<ul class="member">
			    	<li class="">
			      		<a href="<%=request.getContextPath()%>/login">로그인</a>
			    	</li>
			    	<li class="">
			      		<a href="<%=request.getContextPath()%>/signin">회원가입</a>
			    	</li>
			  	</ul>
		  	</div>
	  	</div>
	  	<div class="container-bottom">
		  	<ul class="leaguelist dis-none">
		  		<li class="">
		  			<a href="<%=request.getContextPath()%>/league?league=프리미어리그"><img alt="x" src="" name="england">프리미어리그</a>
	  			</li>
		  		<li class="">
		  			<a href="<%=request.getContextPath()%>/league?league=라리가"><img alt="x" src="" name="spain">라리가</a>
	  			</li>
	  			<li class="">
		  			<a href="<%=request.getContextPath()%>/league?league=분데스리가"><img alt="x" src="" name="germany">분데스리가</a>
	  			</li>
	  			<li class="">
		  			<a href="<%=request.getContextPath()%>/league?league=세리에A"><img alt="x" src="" name="italia">세리에A</a>
	  			</li>
	  			<li class="">
		  			<a href="<%=request.getContextPath()%>/league?league=리그1"><img alt="x" src="" name="france">리그1</a>
	  			</li>
	  			<li class="">
		  			<a href="<%=request.getContextPath()%>/league?league=에레디비지에"><img alt="x" src="" name="netherland">에레디비지에</a>
	  			</li>
		  	</ul>
		  	<ul class="tournamentlist dis-none">
		  		<li class="">
		  			<a href="<%=request.getContextPath()%>/tournament"><img alt="X" src="" name="uefa">챔피언스리그</a>
	  			</li>
		  		<li class="">
		  			<a href="<%=request.getContextPath()%>/tournament"><img alt="X" src="" name="uefa">유로파리그</a>
	  			</li>
		  	</ul>
	  	</div>
	</nav>
</body>
</html>