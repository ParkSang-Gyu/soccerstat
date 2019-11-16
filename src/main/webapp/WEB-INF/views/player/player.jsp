<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/player.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/player.js"></script>
<title>선수</title>
</head>
<body>
	<input type="hidden" value="${player}">
	<div class="info">
		<div class="info-left">
			<img alt="X" src="${pageContext.request.contextPath}/resources/img/player/${player}.jpg">
		</div>
		<div class="info-right">
			<div class="info1">
				<div>이름</div>
				<div>팀</div>
				<div>등번호</div>
				<div>포지션</div>
			</div>
			<div class="info2">
				<div class="name">${playerInfo.player}</div>
				<div>${playerInfo.team}</div>
				<div>${playerInfo.backNo}</div>
				<div>${playerInfo.position}</div>
			</div>
			<div class="info1">
				<div>국적</div>
				<div>나이</div>
				<div>키</div>
				<div>몸무게</div>
			</div>
			<div class="info2">
				<div>${playerInfo.nationality}</div>
				<div>${playerInfo.age}</div>
				<div>${playerInfo.height}</div>
				<div>${playerInfo.weight}</div>
			</div>
		</div>
	</div>
	<h3>현재</h3>
	<div class="now">
		<table class="table table-striped">
	      	<thead>
		      	<tr>
		      		<th>리그</th>
		      		<th>시즌</th>
		      		<th>출장수</th>
		      		<th>출전시간</th>
		      		<th>득점</th>
		      		<th>도움</th>
		      		<th>키패스</th>
		      		<th>경고</th>
		      		<th>퇴장</th>
		      		<th>motm</th>
		      		<th>평점</th>
		      	</tr>
	      	</thead>
	      	<tbody>
		      	<tr>
	        		<td>${nowStat.league}</td>
	        		<td>${nowStat.season}</td>
	        		<td>${nowStat.appearance}</td>
	        		<td>${nowStat.played}</td>
	        		<td>${nowStat.goal}</td>
	        		<td>${nowStat.assist}</td>
	        		<td>${nowStat.keyPass}</td>
	        		<td>${nowStat.yc}</td>
	        		<td>${nowStat.rc}</td>
	        		<td>${nowStat.motm}</td>
	        		<td>${nowStat.rating}</td>
		      	</tr>
	      	</tbody>	    
  		</table>
  		<table class="table table-striped">
  			<thead>
  				<tr>
  					<th>슈팅</th>
		      		<th>골대 안 슈팅</th>
		      		<th>슈팅 정확도</th>
		      		<th>드리블 시도</th>
		      		<th>드리블 성공</th>
		      		<th>드리블 성공률</th>
		      		<th>패스 시도</th>
		      		<th>패스 성공</th>
		      		<th>패스 성공률</th>
		      		<th>오프사이드</th>
		      		<th>볼터치</th>
  				</tr>
  			</thead>
  			<tbody>
  				<tr>
  					<td>${nowStat.shootApt}</td>
	        		<td>${nowStat.shootOT}</td>
	        		<td>${nowStat.shootOT}/${nowStat.shootApt}</td>
	        		<td>${nowStat.dribbleApt}</td>
	        		<td>${nowStat.dribbleScc}</td>
	        		<td>${nowStat.dribbleScc}/${nowStat.dribbleApt}</td>
	        		<td>${nowStat.passApt}</td>
	        		<td>${nowStat.passScc}</td>
	        		<td>${nowStat.passScc}/${nowStat.passApt}</td>
	        		<td>${nowStat.offside}</td>
	        		<td>${nowStat.touches}</td>
  				</tr>
  			</tbody>
  		</table>
  		<table class="table table-striped">
  			<thead>
  				<tr>
  					<th>태클 시도</th>
		      		<th>태클 성공</th>
		      		<th>태클 성공률</th>
		      		<th>공중볼 경합 시도</th>
		      		<th>공중볼 경합 성공</th>
		      		<th>공중볼 경합 성공률</th>
		      		<th>인터셉트</th>
		      		<th>블록</th>
		      		<th>클리어</th>
		      		<th>실점</th>
		      		<th>세이브</th>
		      		<th>클린시트</th>
  				</tr>
  			</thead>
  			<tbody>
  				<tr>
  					<td>${nowStat.tackleApt}</td>
	        		<td>${nowStat.tackleScc}</td>
	        		<td>${nowStat.tackleScc}/${nowStat.tackleApt}</td>
	        		<td>${nowStat.aerialApt}</td>
	        		<td>${nowStat.aerialScc}</td>
	        		<td>${nowStat.aerialScc}/${nowStat.aerialApt}</td>
	        		<td>${nowStat.intercept}</td>
	        		<td>${nowStat.block}</td>
	        		<td>${nowStat.clearance}</td>
	        		<td>${nowStat.goalA}</td>
	        		<td>${nowStat.save}</td>
	        		<td>${nowStat.cleansheet}</td>
  				</tr>
  			</tbody>
  		</table>
	</div>
	<h3>통산</h3>
	<div class="total">
		<table class="table table-striped">
	      	<thead>
		      	<tr>
		      		<th>리그</th>
		      		<th>시즌</th>
		      		<th>출장수</th>
		      		<th>출전시간</th>
		      		<th>득점</th>
		      		<th>도움</th>
		      		<th>키패스</th>
		      		<th>경고</th>
		      		<th>퇴장</th>
		      		<th>motm</th>
		      		<th>평점</th>
		      	</tr>
	      	</thead>
	      	<tbody>
	      		<c:forEach var="tmp" items="${totalStat}">
			      	<tr>
		        		<td>${tmp.league}</td>
		        		<td>${tmp.season}</td>
		        		<td>${tmp.appearance}</td>
		        		<td>${tmp.played}</td>
		        		<td>${tmp.goal}</td>
		        		<td>${tmp.assist}</td>
		        		<td>${tmp.keyPass}</td>
		        		<td>${tmp.yc}</td>
		        		<td>${tmp.rc}</td>
		        		<td>${tmp.motm}</td>
		        		<td>${tmp.rating}</td>
			      	</tr>
		      	</c:forEach>
	      	</tbody>	    
  		</table>
  		<table class="table table-striped">
	      	<thead>
		      	<tr>
		      		<th class="sum">합계</th>
		      		<th>출장수</th>
		      		<th>출전시간</th>
		      		<th>득점</th>
		      		<th>도움</th>
		      		<th>키패스</th>
		      		<th>경고</th>
		      		<th>퇴장</th>
		      		<th>motm</th>
		      		<th>평점</th>
		      	</tr>
	      	</thead>
	      	<tbody>
		      	<tr class="t">
	        		<td></td>
	        		<td></td>
	        		<td></td>
	        		<td></td>
	        		<td></td>
	        		<td></td>
	        		<td></td>
	        		<td></td>
	        		<td></td>
	        		<td></td>
		      	</tr>
	      	</tbody>	    
  		</table>
	</div>
</body>
</html>