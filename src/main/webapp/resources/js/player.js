$(document).ready(function() {
	var player = $('input').val();
	$.ajax({
		type: 'POST',
		data: {'player' : player},
		url: 'player',
		success : function(data) {
			var apps = 0;
			var played = 0;
			var goal = 0;
			var assist = 0;
			var key = 0;
			var yc = 0;
			var rc = 0;
			var motm = 0;
			var rating = 0;
			for(var i = 0; i < data.sum.length; i++){
				apps += data.sum[i].appearance;
				played += data.sum[i].played;
				goal += data.sum[i].goal;
				assist += data.sum[i].assist;
				key += data.sum[i].keyPass;
				yc += data.sum[i].yc;
				rc += data.sum[i].rc;
				motm += data.sum[i].motm;
				rating += data.sum[i].rating/data.sum.length;
			}
			$('.t td:nth-child(2)').html(apps);
			$('.t td:nth-child(3)').html(played);
			$('.t td:nth-child(4)').html(goal);
			$('.t td:nth-child(5)').html(assist);
			$('.t td:nth-child(6)').html(key);
			$('.t td:nth-child(7)').html(yc);
			$('.t td:nth-child(8)').html(rc);
			$('.t td:nth-child(9)').html(motm);
			$('.t td:nth-child(10)').html(rating);
		},
		error : function(request,status,error) {
			console.log(request.responseText);
		}
	})
})