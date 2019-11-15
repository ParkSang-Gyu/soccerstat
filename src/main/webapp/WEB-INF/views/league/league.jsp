<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/league.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/league.js"></script>
<title>리그</title>
</head>
<body>
	<input type="hidden" value="${league}">
	<input type="hidden" value="${team}" name="team">
	<div class="top">
		<div class="schedule">
			<h3>${league} 일정</h3>
		</div>
    	<div class="calendar">
    		<select id="year">
    			<option value="0">년</option>
    			<option value="2018">2018년</option>
    			<option value="2019">2019년</option>
    			<option value="2020">2020년</option>
    		</select>
	   		<select id="month">
				<option value="0"selected>월</option>
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4">4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
			<select id="day">
				<option value="0">일</option>
			</select>
		</div>
    	<div class="fixture">
    		<table class="table table-striped">
			    <thead>
			      	<tr>
				        <th>날짜</th>
						<th>시간(한국시각)</th>
						<th>진행</th>
						<th>리그</th>
						<th>홈팀</th>
						<th>스코어</th>
						<th>원정팀</th>
						<th>경기장</th>
			      	</tr>
			    </thead>
			    <tbody>
			    	<c:forEach var="tmp" items="${allLeague}">
				      	<tr>
					        <td>${tmp.date}</td>
					        <td>${tmp.time}</td>
					        <td>${tmp.status}</td>
					        <td>${tmp.league}</td>
					        <td><a href="<%=request.getContextPath()%>/team?team=${tmp.home}">${tmp.home}</a></td>
					        <td>${tmp.score}</td>
					        <td><a href="<%=request.getContextPath()%>/team?team=${tmp.away}">${tmp.away}</a></td>
					        <td>경기장</td>
				      	</tr>
			      	</c:forEach>
			    </tbody>
			</table>
    	</div>
	</div>
	<div class="middle">
		<div>
			<h3>팀순위</h3>
		</div>
		<div class="leagueTable">
    		<table class="table table-striped">
			    <thead>
			      	<tr>
				        <th>순위</th>
						<th>팀</th>
						<th><button value="win">승</button></th>
						<th><button value="draw">무</button></th>
						<th><button value="lose">패</button></th>
						<th><button value="goalF">득점</button></th>
						<th><button value="goalA">실점</button></th>
						<th><button value="goalD">득실차</button></th>
						<th><button value="points">승점</button></th>
			      	</tr>
			    </thead>
			    <tbody>
			    	<c:forEach var="tmp" items="${leagueTable}">
				      	<tr>
					        <td></td>
					        <td><a href="<%=request.getContextPath()%>/team?team=${tmp.team}">${tmp.team}</a></td>
					        <td>${tmp.win}</td>
					        <td>${tmp.draw}</td>
					        <td>${tmp.lose}</td>
					        <td>${tmp.goalF}</td>
					        <td>${tmp.goalA}</td>
					        <td>${tmp.goalD}</td>
					        <td>${tmp.points}</td>
				      	</tr>
			      	</c:forEach>
			    </tbody>
			</table>
    	</div>
	</div>
	<div class="bottom">
		<div>
			<h3>개인순위</h3>
		</div>
		<div class="standing">
			<table class="table table-striped">
			    <thead>
			      	<tr>
				        <th>순위</th>
						<th>선수</th>
						<th>팀</th>
						<th><button value="appearance">경기수</button></th>
						<th><button value="goal">득점</button></th>
						<th><button value="assist">도움</button></th>
						<th><button value="pk">페널티킥</button></th>
						<th><button value="yc">경고</button></th>
						<th><button value="rc">퇴장</button></th>
						<th><button value="shootApt">슈팅</button></th>
						<th><button value="shootOT">유효슈팅</button></th>
						<th><button value="pass">패스성공률(%)</button></th>
						<th><button value="motm">motm선정</button></th>
						<th><button value="rating">평점</button></th>
			      	</tr>
			    </thead>
			    <tbody>
			    	<c:forEach var="tmp" items="${playerStat}">
				      	<tr>
					        <td></td>
					        <td><a href="<%=request.getContextPath()%>/player?player=${tmp.player}">${tmp.player}</a></td>
					        <td><a href="<%=request.getContextPath()%>/team?team=${tmp.team}">${tmp.team}</a></td>
					        <td>${tmp.appearance}</td>
					        <td>${tmp.goal}</td>
					        <td>${tmp.assist}</td>
					        <td>${tmp.pk}</td>
					        <td>${tmp.yc}</td>
					        <td>${tmp.rc}</td>
					        <td>${tmp.shootApt}</td>
					        <td>${tmp.shootOT}</td>
					        <td>${tmp.pass}</td>
					        <td>${tmp.motm}</td>
					        <td>${tmp.rating}</td>
				      	</tr>
			      	</c:forEach>
			    </tbody>
			</table>
		</div>
	</div>
</body>
</html>