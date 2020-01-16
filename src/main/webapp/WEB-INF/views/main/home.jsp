<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/home.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/home.js"></script>
</head>
<body>
    <div class="con-top">
    	<div class="allschedule"><h3>일정</h3></div>
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
			    	<c:forEach var="tmp" items="${schedule}">
				      	<tr>
					        <td>${tmp.date}</td>
					        <td>${tmp.time}</td>
					        <td>${tmp.status}</td>
					        <td>${tmp.league}</td>
					        <td><a href="<%=request.getContextPath()%>/team?team=${tmp.home}">${tmp.home}</a></td>
					        <td>${tmp.score}</td>
					        <td><a href="<%=request.getContextPath()%>/team?team=${tmp.away}">${tmp.away}</a></td>
					        <td>${tmp.stadium}</td>
				      	</tr>
			      	</c:forEach>
			    </tbody>
			 </table>
    	</div>
    </div>
    <div class="con-bottom">
    	<div class="fix"><h3>순위</h3></div>
    	<div class="con-btm-left">
    		<div class="imgBox">
    			<img alt="X" src="" name="england">
    			<span>프리미어리그 순위</span>
    			<a class="f-right" href="<%=request.getContextPath()%>/league?league=프리미어리그">더보기</a>
    		</div>
    		<div class="premier">
    			<table class="table table-striped">
					<thead>
				    	<tr>
				        	<th>순위</th>
				        	<th>팀</th>
				        	<th>승점</th>
				    	</tr>
				    </thead>
				    <tbody>
				    	<c:forEach var="tmp" items="${table}">
				      		<tr>
				      			<c:if test="${tmp.league eq '프리미어리그'}">
					        		<td>${tmp.ranked}</td>
					        		<td><a href="<%=request.getContextPath()%>/team?team=${tmp.team}">${tmp.team}</a></td>
					        		<td>${tmp.points}</td>
				        		</c:if>
				      		</tr>
			      		</c:forEach>
				    </tbody>
				</table>
    		</div>
    		<div class="imgBox">
    			<img alt="X" src="" name="italia">
    			<span>세리에A 순위</span>
    			<a class="f-right" href="<%=request.getContextPath()%>/league?league=세리에A">더보기</a>
    		</div>
    		<div class="serie">
    			<table class="table table-striped">
					<thead>
				    	<tr>
				        	<th>순위</th>
				        	<th>팀</th>
				        	<th>승점</th>
				    	</tr>
				    </thead>
				    <tbody>
				    	<c:forEach var="tmp" items="${table}">
				      		<tr>
				      			<c:if test="${tmp.league eq '세리에A'}">
					        		<td>${tmp.ranked}</td>
					        		<td><a href="<%=request.getContextPath()%>/team?team=${tmp.team}">${tmp.team}</a></td>
					        		<td>${tmp.points}</td>
				        		</c:if>
				      		</tr>
			      		</c:forEach>
				    </tbody>
				</table>
    		</div>
    	</div>
    	<div class="con-btm-mid">
    		<div class="imgBox">
    			<img alt="X" src="" name="spain">
    			<span>라리가 순위</span>
    			<a class="f-right" href="<%=request.getContextPath()%>/league?league=라리가">더보기</a>
    		</div>
    		<div class="laliga">
    			<table class="table table-striped">
					<thead>
				    	<tr>
				        	<th>순위</th>
				        	<th>팀</th>
				        	<th>승점</th>
				    	</tr>
				    </thead>
				    <tbody>
				    	<c:forEach var="tmp" items="${table}">
				      		<tr>
				      			<c:if test="${tmp.league eq '라리가'}">
					        		<td>${tmp.ranked}</td>
					        		<td><a href="<%=request.getContextPath()%>/team?team=${tmp.team}">${tmp.team}</a></td>
					        		<td>${tmp.points}</td>
				        		</c:if>
				      		</tr>
			      		</c:forEach>
				    </tbody>
				</table>
    		</div>
    		<div class="imgBox">
    			<img alt="X" src="" name="france">
    			<span>리그1 순위</span>
    			<a class="f-right" href="<%=request.getContextPath()%>/league?league=리그1">더보기</a>
    		</div>
    		<div class="ligue1">
    			<table class="table table-striped">
					<thead>
				    	<tr>
				        	<th>순위</th>
				        	<th>팀</th>
				        	<th>승점</th>
				    	</tr>
				    </thead>
				    <tbody>
				    	<c:forEach var="tmp" items="${table}">
				      		<tr>
				      			<c:if test="${tmp.league eq '리그1'}">
					        		<td>${tmp.ranked}</td>
					        		<td><a href="<%=request.getContextPath()%>/team?team=${tmp.team}">${tmp.team}</a></td>
					        		<td>${tmp.points}</td>
				        		</c:if>
				      		</tr>
			      		</c:forEach>
				    </tbody>
				</table>
    		</div>
    	</div>
    	<div class="con-btm-right">
    		<div class="imgBox">
    			<img alt="X" src="" name="germany">
    			<span>분데스리가 순위</span>
    			<a class="f-right" href="<%=request.getContextPath()%>/league?league=분데스리가">더보기</a>
    		</div>
    		<div class="bundes">
    			<table class="table table-striped">
					<thead>
				    	<tr>
				        	<th>순위</th>
				        	<th>팀</th>
				        	<th>승점</th>
				    	</tr>
				    </thead>
				    <tbody>
				    	<c:forEach var="tmp" items="${table}">
				      		<tr>
				      			<c:if test="${tmp.league eq '분데스리가'}">
					        		<td>${tmp.ranked}</td>
					        		<td><a href="<%=request.getContextPath()%>/team?team=${tmp.team}">${tmp.team}</a></td>
					        		<td>${tmp.points}</td>
				        		</c:if>
				      		</tr>
			      		</c:forEach>
				    </tbody>
				</table>
    		</div>
    		<div class="imgBox">
    			<img alt="X" src="" name="netherland">
    			<span>에레디비지에 순위</span>
    			<a class="f-right" href="<%=request.getContextPath()%>/league?league=에레디비지에">더보기</a>
    		</div>
    		<div class="eredivisie">
    			<table class="table table-striped">
					<thead>
				    	<tr>
				        	<th>순위</th>
				        	<th>팀</th>
				        	<th>승점</th>
				    	</tr>
				    </thead>
				    <tbody>
				    	<c:forEach var="tmp" items="${table}">
				      		<tr>
				      			<c:if test="${tmp.league eq '에레디비지에'}">
					        		<td>${tmp.ranked}</td>
					        		<td><a href="<%=request.getContextPath()%>/team?team=${tmp.team}">${tmp.team}</a></td>
					        		<td>${tmp.points}</td>
				        		</c:if>
				      		</tr>
			      		</c:forEach>
				    </tbody>
				</table>
    		</div>
    	</div>
    </div>
</body>
</html>