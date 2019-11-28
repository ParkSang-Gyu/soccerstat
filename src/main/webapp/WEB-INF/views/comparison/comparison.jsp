<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비교</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/comparison.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/comparison.js"></script>
</head>
<body>
	<div class="top">
		<div class="comparison1">
			<div class="comparisonSelect1" id="1">
				<select name="league">
					<option>리그</option>
					<option value="프리미어리그">프리미어리그</option>
					<option value="라리가">라리가</option>
					<option value="분데스리가">분데스리가</option>
					<option value="세리에A">세리에A</option>
					<option value="리그1">리그1</option>
					<option value="에레디비지에">에레디비지에</option>
				</select>
				<select name="season"></select>
				<select name="team"></select>
				<select name="player"></select>
			</div>
		</div>
		<div class="comparison1">
			<div class="comparisonSelect2" id="2">
				<select name="league">
					<option>리그</option>
					<option value="프리미어리그">프리미어리그</option>
					<option value="라리가">라리가</option>
					<option value="분데스리가">분데스리가</option>
					<option value="세리에A">세리에A</option>
					<option value="리그1">리그1</option>
					<option value="에레디비지에">에레디비지에</option>
				</select>
				<select name="season"></select>
				<select name="team"></select>
				<select name="player"></select>
			</div>
		</div>
		<div class="comparison1">
			<div class="closeComparison display-none">
				<div class="close"><i class="fas fa-window-close"></i></div>
			</div>
			<div class="comparisonSelect3 display-none" id="3">
				<select name="league">
					<option>리그</option>
					<option value="프리미어리그">프리미어리그</option>
					<option value="라리가">라리가</option>
					<option value="분데스리가">분데스리가</option>
					<option value="세리에A">세리에A</option>
					<option value="리그1">리그1</option>
					<option value="에레디비지에">에레디비지에</option>
				</select>
				<select name="season"></select>
				<select name="team"></select>
				<select name="player"></select>
			</div>
		</div>
		<div class="comparison1">
			<div class="closeComparison display-none">
				<div class="close"><i class="fas fa-window-close"></i></div>
			</div>
			<div class="comparisonSelect4 display-none" id="4">
				<select name="league">
					<option>리그</option>
					<option value="프리미어리그">프리미어리그</option>
					<option value="라리가">라리가</option>
					<option value="분데스리가">분데스리가</option>
					<option value="세리에A">세리에A</option>
					<option value="리그1">리그1</option>
					<option value="에레디비지에">에레디비지에</option>
				</select>
				<select name="season"></select>
				<select name="team"></select>
				<select name="player"></select>
			</div>
		</div>
		<div class="plus-btn">
			<button>추가</button>
		</div>
		<div class="compare">
			<button>비교</button>
		</div>
	</div>
	<div class="bottom">
		<div class="resultPlayer display-none">
			<div id="comparisonTable">
				<div><span>Apps</span></div>
				<div><span>Played</span></div>
				<div><span>Goal</span></div>
				<div><span>Assist</span></div>
				<div><span>Yc</span></div>
				<div><span>Rc</span></div>
				<div><span>Psass</span></div>
				<div><span>Rating</span></div>
				<div><span>Motm</span></div>
			</div>
		</div>
		<div class="player">
			<div class="player-box1 display-none">
				<div class="player-info1">
					<div class="player-info-top">
						<div class="player-name"></div>
						<div class="team-name"></div>
						<div class="tournament-name"></div>
					</div>
					<div class="player-info-bottom">
						<div class="player-info-left">
							<img class="p-img" alt="X" src="">
						</div>
						<div class="player-info-right">
							<div class="player-info-teamimage">
								<img class="t-img" alt="X" src="">
							</div>
							<div class="player-info-nationality"></div>
							<div class="player-info-age"></div>
							<div class="player-info-position"></div>
						</div>
					</div>
				</div>
				<div class="player-stat1">
					<div class="player-stat-box">
						<div class="apps"></div>
						<div class="played"></div>
						<div class="goal"></div>
						<div class="assist"></div>
						<div class="yc"></div>
						<div class="rc"></div>
						<div class="pass"></div>
						<div class="rating"></div>
						<div class="motm"></div>
					</div>
				</div>
			</div>
			<div class="player-box2 display-none">
				<div class="player-info2">
					<div class="player-info-top">
						<div class="player-name"><strong></strong></div>
						<div class="team-name"></div>
						<div class="tournament-name"></div>
					</div>
					<div class="player-info-bottom">
						<div class="player-info-left">
							<img class="p-img" alt="X" src="">
						</div>
						<div class="player-info-right">
							<div class="player-info-teamimage">
								<img class="t-img" alt="X" src="">
							</div>
							<div class="player-info-nationality"></div>
							<div class="player-info-age"></div>
							<div class="player-info-position"></div>
						</div>
					</div>
				</div>
				<div class="player-stat2">
					<div class="player-stat-box">
						<div class="apps"></div>
						<div class="played"></div>
						<div class="goal"></div>
						<div class="assist"></div>
						<div class="yc"></div>
						<div class="rc"></div>
						<div class="pass"></div>
						<div class="rating"></div>
						<div class="motm"></div>
					</div>
				</div>
			</div>
			<div class="player-box3 display-none">
				<div class="player-info3">
					<div class="player-info-top">
						<div class="player-name"><strong></strong></div>
						<div class="team-name"></div>
						<div class="tournament-name"></div>
					</div>
					<div class="player-info-bottom">
						<div class="player-info-left">
							<img class="p-img" alt="X" src="">
						</div>
						<div class="player-info-right">
							<div class="player-info-teamimage">
								<img class="t-img" alt="X" src="">
							</div>
							<div class="player-info-nationality"></div>
							<div class="player-info-age"></div>
							<div class="player-info-position"></div>
						</div>
					</div>
				</div>
				<div class="player-stat3">
					<div class="player-stat-box">
						<div class="apps"></div>
						<div class="played"></div>
						<div class="goal"></div>
						<div class="assist"></div>
						<div class="yc"></div>
						<div class="rc"></div>
						<div class="pass"></div>
						<div class="rating"></div>
						<div class="motm"></div>
					</div>
				</div>
			</div>
			<div class="player-box4 display-none">
				<div class="player-info4">
					<div class="player-info-top">
						<div class="player-name"><strong></strong></div>
						<div class="team-name"></div>
						<div class="tournament-name"></div>
					</div>
					<div class="player-info-bottom">
						<div class="player-info-left">
							<img class="p-img" alt="X" src="">
						</div>
						<div class="player-info-right">
							<div class="player-info-teamimage">
								<img class="t-img" alt="X" src="">
							</div>
							<div class="player-info-nationality"></div>
							<div class="player-info-age"></div>
							<div class="player-info-position"></div>
						</div>
					</div>
				</div>
				<div class="player-stat4">
					<div class="player-stat-box">
						<div class="apps"></div>
						<div class="played"></div>
						<div class="goal"></div>
						<div class="assist"></div>
						<div class="yc"></div>
						<div class="rc"></div>
						<div class="pass"></div>
						<div class="rating"></div>
						<div class="motm"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="stat-explanation display-none">
			<table>
				<tr>
					<th>
						<strong>Apps</strong>
						: 출전경기수
					</th>
					<th>
						<strong>played</strong>
						: 출전시간
					</th>
					<th>
						<strong>Goal</strong>
						: 득점
					</th>
				</tr>
				<tr>
					<th>
						<strong>Assist</strong>
						: 어시스트
					</th>
					<th>
						<strong>YC</strong>
						: 옐로우 카드
					</th>
					<th>
						<strong>RC</strong>
						: 레드 카드
					</th>
				</tr>
				<tr>
					<th>
						<strong>Pass</strong>
						: 패스성공률
					</th>
					<th>
						<strong>Rating</strong>
						: 평점
					</th>
					<th>
						<strong>Motm</strong>
						: 경기 최우수선수 선정
					</th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>