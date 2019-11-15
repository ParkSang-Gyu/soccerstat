<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/team.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/team.js"></script>
<title>팀</title>
</head>
<body>
	<div class="info">
		<div class="info-left">
			<img alt="X" src="${pageContext.request.contextPath}/resources/img/team/${team}.png">
		</div>
		<div class="info-right">
			<div class="info1">
				<div>팀명</div>
				<div>리그</div>
				<div>연고지</div>
			</div>
			<div class="info2">
				<div class="name">${teamInfo.team}</div>
				<div>${teamInfo.league}</div>
				<div>${teamInfo.hometown}</div>
			</div>
			<div class="info1">
				<div>창단</div>
				<div>경기장</div>
				<div>감독</div>
			</div>
			<div class="info2">
				<div>${teamInfo.est}</div>
				<div>${teamInfo.stadium}</div>
				<div>${teamInfo.coach}</div>
			</div>
		</div>
	</div>
	<div class="stat">
		<h3>순위</h3>
		<table class="table table-striped">
	      	<thead>
		      	<tr>
		      		<th>순위</th>
		      		<th>승</th>
		      		<th>무</th>
		      		<th>패</th>
		      		<th>득점</th>
		      		<th>실점</th>
		      		<th>득실차</th>
		      		<th>승점</th>
		      	</tr>
	      	</thead>
	      	<tbody>
		      	<tr>
	        		<td>${teamStat.ranked}</td>
	        		<td>${teamStat.win}</td>
	        		<td>${teamStat.draw}</td>
	        		<td>${teamStat.lose}</td>
	        		<td>${teamStat.goalF}</td>
	        		<td>${teamStat.goalA}</td>
	        		<td>${teamStat.goalD}</td>
	        		<td>${teamStat.points}</td>
		      	</tr>
	      	</tbody>	    
  		</table>
	</div>
	<div class="squad">
		<h3>선수단</h3>
		<table class="table table-striped">
	      	<thead>
		      	<tr>
		      		<th>순위</th>
		      		<th>이름</th>
		      		<th><button value="appearance">경기수</button></th>
		      		<th><button value="goal">득점</button></th>
		      		<th><button value="assist">도움</button></th>
		      		<th><button value="shootApt">슈팅</button></th>
		      		<th><button value="pass">패스성공률(%)</button></th>
		      		<th><button value="yc">경고</button></th>
		      		<th><button value="rc">퇴장</button></th>
		      		<th><button value="motm">motm</button></th>
		      		<th><button value="rating">평점</button></th>
		      	</tr>
	      	</thead>
	      	<tbody>
		      	<c:forEach var="tmp" items="${squad}">
			      	<tr>
			        	<td></td>
		        		<td><a href="<%=request.getContextPath()%>/players?player=${tmp.player}">${tmp.player}</a></td>
		        		<td>${tmp.appearance}</td>
		        		<td>${tmp.goal}</td>
		        		<td>${tmp.assist}</td>
		        		<td>${tmp.shootApt}</td>
		        		<td>${tmp.pass}</td>
		        		<td>${tmp.yc}</td>
		        		<td>${tmp.rc}</td>
		        		<td>${tmp.motm}</td>
		        		<td>${tmp.rating}</td>
			      	</tr>
		      	</c:forEach>
	      	</tbody>	    
  		</table>
	</div>
</body>
</html>