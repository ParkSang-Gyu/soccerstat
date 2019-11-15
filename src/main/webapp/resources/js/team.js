$(document).ready(function() {
	for(var i = 1; i <= 30; i++){
		$('.squad tbody tr:nth-child('+i+')').find('td:nth-child(1)').html(i);
	}
	$('.squad th').click(function() {
		var sortData = $(this).find('button').val();
		var team = $('.name').html();
		$.ajax({
			type:'POST',
			data:{'sortData' : sortData, 'team' : team},
			url:"team",
			success : function (data) {
				$('.squad').find('tbody td:nth-child(1)').siblings().remove();
				for(var i = 0; i < data.sortStat.length; i++){
					var str = '<td><a href="/soccerstat/player?player='+data.sortStat[i].player+'">'
								+data.sortStat[i].player+'</a></td><td>'+data.sortStat[i].appearance+'</td><td>'+data.sortStat[i].goal+'</td><td>'
								+data.sortStat[i].assist+'</td><td>'+data.sortStat[i].shootApt+'</td><td>'+data.sortStat[i].pass+'</td><td>'
								+data.sortStat[i].yc+'</td><td>'+data.sortStat[i].rc+'</td><td>'+data.sortStat[i].motm+'</td><td>'
								+data.sortStat[i].rating+'</td>';
					$('.squad').find('tbody tr:nth-child('+(i+1)+')').append(str);
				};
				$('td').addClass('borderbtm');
			},
			error:function(request,status,error){
	            console.log( request.responseText ); // 실패 시 처리
			}
		});
	})
})