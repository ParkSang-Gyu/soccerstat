$(document).ready(function () {
	$('.submit').click(function () {
		location.href = '<%=request.getContextPath()%>/display?'+$('input[name=board_num]').val();
	});
	$('.recommend').click(function () {
		var num = $('.btn').val();
		var replyNum = $(this).siblings('input[name=replyNum]').val();
		var obj = $(this);
		$.ajax({
			type:'POST',
			data:{'replyNum' : replyNum, 'num' : num},
			url:"reply",
			success : function (data){
				console.log(data.reply)
					var str = '추천 : ' + data.reply.recommend;
					obj.parent().siblings('.userinfo').find('.btn').html(str);
			},
			error:function(request,status,error){
	            console.log( request.responseText ); // 실패 시 처리
			}
		});
	});
});