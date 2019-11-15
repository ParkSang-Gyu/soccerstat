$(document).ready(function() {
	$('td').addClass('borderbtm');
	var day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	var year = 0;
	var month = 0;
	var length = 20;
	var league = $('input').val();
	if(league == "분데스리가" || league == "에레디비지에"){
		length = 18;
	}
	for(i = 1; i <= length; i++){
		$('.leagueTable tr:nth-child('+i+')').find('td:nth-child(1)').html(i);
		$('.standing tr:nth-child('+i+')').find('td:nth-child(1)').html(i);
	}
	$('.leagueTable th').click(function() {
		var sortData = $(this).find('button').val();
		$.ajax({
			type:'POST',
			data:{'sortData' : sortData, 'league' : league},
			url:"league/league",
			success : function (data) {
				$('.leagueTable').find('tbody td:nth-child(1)').siblings().remove();
				for(var i = 0; i < data.sortLeague.length; i++){
					var str = '<td><a href="/soccerstat/team?team='+data.sortLeague[i].team+'">'+data.sortLeague[i].team+'</a></td><td>'
								+data.sortLeague[i].win+'</td><td>'+data.sortLeague[i].draw+'</td><td>'+data.sortLeague[i].lose+'</td><td>'
								+data.sortLeague[i].goalF+'</td><td>'+data.sortLeague[i].goalA+'</td><td>'+data.sortLeague[i].goalD+'</td><td>'
								+data.sortLeague[i].points+'</td>';
					$('.leagueTable').find('tbody tr:nth-child('+(i+1)+')').append(str);
				};
				$('td').addClass('borderbtm');
			},
			error:function(request,status,error){
	            console.log( request.responseText ); // 실패 시 처리
			}
		});
	})
	$('.standing th').click(function() {
		var sortP = $(this).find('button').val();
		$.ajax({
			type:'POST',
			data:{'sortP' : sortP, 'league' : league},
			url:"league",
			success : function (data) {
				$('.standing').find('tbody td:nth-child(1)').siblings().remove();
				for(var i = 0; i < data.sortPlayer.length; i++){
					var str = '<td><a href="/soccerstat/player?player='+data.sortPlayer[i].player+'">'
								+data.sortPlayer[i].player+'</a></td><td><a href="/soccerstat/team?team='+data.sortPlayer[i].team+'">'
								+data.sortPlayer[i].team+'</a></td><td>'+data.sortPlayer[i].appearance+'</td><td>'+data.sortPlayer[i].goal+'</td><td>'
								+data.sortPlayer[i].assist+'</td><td>'+data.sortPlayer[i].pk+'</td><td>'+data.sortPlayer[i].yc+'</td><td>'
								+data.sortPlayer[i].rc+'</td><td>'+data.sortPlayer[i].shootApt+'</td><td>'+data.sortPlayer[i].shootOT+'</td><td>'
								+data.sortPlayer[i].pass+'</td><td>'+data.sortPlayer[i].motm+'</td><td>'+data.sortPlayer[i].rating+'</td>';
					$('.standing').find('tbody tr:nth-child('+(i+1)+')').append(str);
				};
				$('td').addClass('borderbtm');
			},
			error:function(request,status,error){
	            console.log( request.responseText ); // 실패 시 처리
			}
		});
	})
	//페이지 로딩 시 첫 일은 기준이 6월이므로 6월에 맞는 일을 넣어준다.
	//addDay(6);
	//월 셀렉트 박스의 값이 변하면 실행되는 이벤트 등록
	$('#year').change(function () {
		year = $(this).val();
		if(year % 4 == 0){
			day[1] = 29;
		}else{
			day[1] = 28;
		}
	});
	$('#month').click(function(){
		//현재 선택된 월의 value를 읽어옴
		month = $(this).val();
		addDay(month);
	});
	function addDay(month){
		if(month < 1 || month > 12){
			return ;
		}
		//반복문을 일수만큼 반복하여 option태그와 원하는 일을 문자열로 생성하여 추가
		var str = '<option value="0">일</option>';
		for(var i=1; i<=day[month-1];i++){
			str += '<option value="'+i+'">'+i+'일</option>'
		}
		//일 셀렉트 박스에 3에서 생성한 문자열을 html 코드로 넣어준다.
		$('#day').html(str);
	}
	$('#day').change(function () {
		var day = $(this).val();
		var cDate = month + "월" + " " + day + "일";
		$.ajax({
			type:'POST',
			data:{'year' : year, 'cDate' : cDate},
			url:"league/league",
			success : function (data) {
				if(data.schedules[0]!= null){
					$('.fixture').find('tbody tr').remove();
					var str = '<tr><td>'+data.schedules[0].date+'</td><td>'+data.schedules[0].time+'</td><td>'+data.schedules[0].status+'</td>'
								+'<td>'+data.schedules[0].league+'</td><td class="home'+0+'"><a href="/soccerstat/team?team='
								+data.schedules[0].home+'">'+data.schedules[0].home+'</td><td>'+data.schedules[0].score+'</td>'
								+'<td class="away'+0+'"><a href="/soccerstat/team?team='+data.schedules[0].away+'">'
								+data.schedules[0].away+'</td><td>경기장</td></tr>';
					for(var i = 0; i < data.schedules.length-1; i++){
						str += '<tr><td>'+data.schedules[i+1].date+'</td><td>'+data.schedules[i+1].time+'</td><td>'+data.schedules[i+1].status+'</td>'
								+'<td>'+data.schedules[i+1].league+'</td><td class="home'+(i+1)+'"><a href="/soccerstat/team?team='
								+data.schedules[i+1].home+'">'+data.schedules[i+1].home+'</td><td>'+data.schedules[i+1].score+'</td>'
								+'<td class="away'+(i+1)+'"><a href="/soccerstat/team?team='+data.schedules[i+1].away+'">'
								+data.schedules[i+1].away+'</td><td>경기장</td></tr>';
					};
					$('.fixture').find('tbody').html(str);
					$('td').addClass('borderbtm');
					var hg = [];
					var ag = [];
					for(var i = 0; i < data.schedules.length; i++){
						hg += data.schedules[i].homeG;
						ag += data.schedules[i].awayG;
						if(hg[i] > ag[i]){
							$('.home'+i+' a').css({
								"font-weight": "bold",
								color: "blue"
							});
						}else if(hg[i] < ag[i]){
							$('.away'+i+' a').css({
								"font-weight": "bold",
								color: "blue"
							});
						}
					}
				}else{
					alert("일정이 없습니다.");
				}
			},
			error:function(request,status,error){
	            console.log( request.responseText ); // 실패 시 처리
			}
		});
	});
});