$(document).ready(function () {
	var box = [$('.player-box1'),$('.player-box2'),$('.player-box3'),$('.player-box4')];
	var cnt = [];
	var click = 1;
	var num = 0;
	$('select[name=league]').change(function(){
		var league = $(this).val();
		var obj = $(this);
		$.ajax({
	        type:'POST',
	        data:{'league' : league},
	        url:"comparison",
	        success : function(data){
	        	var str = '<option>시즌</option>';
	        	for(var i=0; i<data.seasonList.length; i++){
	        	   	str += '<option>'+data.seasonList[i]+'</option>';
	           	}
	           	obj.siblings('select[name=season]').html(str);
	        },
	        error:function(request,status,error){
	            console.log( request.responseText ); // 실패 시 처리
           }
	    });
	});
	$('select[name=season]').change(function(){
		var league = $(this).prev().val();
		var season = $(this).val();
		var obj = $(this);
		$.ajax({
	        type:'POST',
	        data:{'league':league,'season':season},
	        url:"comparison",
	        success : function(data){
	        	var str = '<option>팀</option>';
	        	for(var i=0; i<data.teamList.length; i++){
	        	   	str += '<option>'+data.teamList[i]+'</option>';
	           	}
	           	obj.siblings('select[name=team]').html(str);
	        }
	    });
	});
	$('select[name=team]').change(function(){
		var league = $(this).siblings('select[name=league]').val();
		var season = $(this).prev().val();
		var team = $(this).val();
		var obj = $(this);
		$.ajax({
	        type:'POST',
	        data:{'league':league,'season':season,'team':team},
	        url:"comparison",
	        success : function(data){
	        	var str = '<option>선수</option>';
	        	for(var i=0; i<data.playerList.length; i++){
	        	   	str += '<option>'+data.playerList[i]+'</option>';
	           	}
	           	obj.siblings('select[name=player]').html(str);
	        }
	    });
	});
	$('select[name=player]').change(function () {
		num = $(this).parent().attr('id');
		var search = cnt.indexOf(num);
		if(search == -1){
			cnt.push(num);
			cnt.sort();
		}else{
			return ;
		}
	});
    $('.plus-btn').click(function () {
    	click++;
		if(click == 2){
			$('.comparisonSelect3').removeClass('display-none');
			$('.comparisonSelect3').siblings().removeClass('display-none');
		}
		if(click == 3){
			$('.comparisonSelect3').removeClass('display-none');
			$('.comparisonSelect3').siblings().removeClass('display-none');
			$('.comparisonSelect4').removeClass('display-none');
			$('.comparisonSelect4').siblings().removeClass('display-none');
		}
	});
	$('.compare').click(function () {
		var index = 0;
		$('select[name=player]').each(function(){
			var playerName = $('select[name=player]').eq(index).val();
			var season = $('select[name=season]').eq(index).val();
			var str = '';
			if(playerName != null && playerName != ''){
				$.ajax({
					async:false,
					type:'POST',
			        data:{'playerName' : playerName,'season' : season},
			        url:"comparison",
			        success : function(data){
			        	for(var i = 0; i < 4; i++){
		        			if(index == i){
		        				$('.player-info'+(i+1)).find('.p-img').attr('src','resources/img/player/'+data.compareStat[0].player+'.jpg');
		        				$('.player-info'+(i+1)).find('.t-img').attr('src','resources/img/team/'+data.compareStat[0].team+'.png');
		        				$('.player-info'+(i+1)).find('.player-name').html(data.compareStat[0].player);
		        				$('.player-info'+(i+1)).find('.team-name').html(data.compareStat[0].team);
		        				$('.player-info'+(i+1)).find('.tournament-name').html(data.compareStat[0].league);
		        				$('.player-info'+(i+1)).find('.player-info-nationality').html(data.compareStat[0].nationality);
		        				$('.player-info'+(i+1)).find('.player-info-age').html(data.compareStat[0].age);
		        				$('.player-info'+(i+1)).find('.player-info-position').html(data.compareStat[0].position);
		        				$('.player-stat'+(i+1)).find('.apps').html(data.compareStat[0].appearance);
		        				$('.player-stat'+(i+1)).find('.played').html(data.compareStat[0].played);
								$('.player-stat'+(i+1)).find('.goal').html(data.compareStat[0].goal);
								$('.player-stat'+(i+1)).find('.assist').html(data.compareStat[0].assist);
								$('.player-stat'+(i+1)).find('.yc').html(data.compareStat[0].yc);
								$('.player-stat'+(i+1)).find('.rc').html(data.compareStat[0].rc);
								$('.player-stat'+(i+1)).find('.pass').html(data.compareStat[0].pass);
								$('.player-stat'+(i+1)).find('.rating').html(data.compareStat[0].rating);
								$('.player-stat'+(i+1)).find('.motm').html(data.compareStat[0].motm);
				        		box[index].removeClass('display-none');
				        		if(click == 3){
							    	box[2].removeClass('display-none');
							    	box[3].removeClass('display-none');
						    	}
		        			}
			        	}
			        }
		        });
			}
			index++;
		});
    	if(cnt.length != 0){
			$('.resultPlayer').removeClass('display-none');
			$('.stat-explanation').removeClass('display-none');
		}
	});
	$('.closeComparison').click(function () {
		$(this).addClass('display-none');
		$(this).siblings().addClass('display-none');
		click--;
		num = $(this).siblings().attr('id');
		var str1 = '<option>리그</option><option value="프리미어리그">프리미어리그</option><option value="라리가">라리가</option>'
			+'<option value="분데스리가">분데스리가</option><option value="세리에A">세리에A</option><option value="리그1">리그1</option>'
			+'<option value="에레디비지에">에레디비지에</option>';
		var str2 = '';
		if(num == 3){
			cnt.splice(cnt.indexOf("3"),1);
			box[2].addClass('display-none');
			$('select[name=league]').eq(2).html(str1);
			$('select[name=season]').eq(2).html(str2);
			$('select[name=team]').eq(2).html(str2);
			$('select[name=player]').eq(2).html(str2);
			$('.player-info'+num).find('.player-name').html(str2);
			$('.player-info'+num).find('.team-name').html(str2);
			$('.player-info'+num).find('.tournament-name').html(str2);
			$('.player-info'+num).find('.player-info-nationality').html(str2);
			$('.player-info'+num).find('.player-info-age').html(str2);
			$('.player-info'+num).find('.player-info-position').html(str2);
			$('.player-stat'+num).find('.apps').html(str2);
			$('.player-stat'+num).find('.played').html(str2);
			$('.player-stat'+num).find('.goal').html(str2);
			$('.player-stat'+num).find('.assist').html(str2);
			$('.player-stat'+num).find('.yc').html(str2);
			$('.player-stat'+num).find('.rc').html(str2);
			$('.player-stat'+num).find('.pass').html(str2);
			$('.player-stat'+num).find('.rating').html(str2);
			$('.player-stat'+num).find('.motm').html(str2);
		}else if(num == 4){
			cnt.splice(cnt.indexOf("4"),1);
			box[3].addClass('display-none');
			$('select[name=league]').eq(3).html(str1);
			$('select[name=season]').eq(3).html(str2);
			$('select[name=team]').eq(3).html(str2);
			$('select[name=player]').eq(3).html(str2);
			$('.player-info'+num).find('.player-name').html(str2);
			$('.player-info'+num).find('.team-name').html(str2);
			$('.player-info'+num).find('.tournament-name').html(str2);
			$('.player-info'+num).find('.player-info-nationality').html(str2);
			$('.player-info'+num).find('.player-info-age').html(str2);
			$('.player-info'+num).find('.player-info-position').html(str2);
			$('.player-stat'+num).find('.apps').html(str2);
			$('.player-stat'+num).find('.played').html(str2);
			$('.player-stat'+num).find('.goal').html(str2);
			$('.player-stat'+num).find('.assist').html(str2);
			$('.player-stat'+num).find('.yc').html(str2);
			$('.player-stat'+num).find('.rc').html(str2);
			$('.player-stat'+num).find('.pass').html(str2);
			$('.player-stat'+num).find('.rating').html(str2);
			$('.player-stat'+num).find('.motm').html(str2);
		}
	});
});