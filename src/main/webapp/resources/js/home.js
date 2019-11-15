$(document).ready(function() {
	$('td').addClass('borderbtm');
	var day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	var year = 0;
	var month = 0;
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
		if(month != 0){
			addDay(month);
		}
	});
	$('#month').click(function(){
		//현재 선택된 월의 value를 읽어옴
		month = $(this).val();
		if(year != 0){
			addDay(month);
		}
	});
	function addDay(month){
		if(month < 1 || month > 12){
			return ;
		}
		//반복문을 일수만큼 반복하여 option태그와 원하는 일을 문자열로 생성하여 추가
		var str = '<option value="0">일</option>';
		for(var i=1; i<=day[month-1];i++){
			str += '<option value="'+i+'">'+i+'일</option>';
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
			url:"main/home",
			success : function (data) {
				if(data.schedules[0] != null){
					$('.fixture').find('tbody tr').remove();
					var str = '<tr><td>'+data.schedules[0].date+'</td><td>'+data.schedules[0].time+'</td><td>'+data.schedules[0].status+'</td>'
								+'<td>'+data.schedules[0].league+'</td><td class="home'+0+'"><a href="<%=request.getContextPath()%>/team?team='
								+data.schedules[0].home+'">'+data.schedules[0].home+'</td><td>'+data.schedules[0].score+'</td>'
								+'<td class="away'+0+'"><a href="<%=request.getContextPath()%>/team?team='+data.schedules[0].away+'">'
								+data.schedules[0].away+'</td><td>경기장</td></tr>';
					for(var i = 0; i < data.schedules.length-1; i++){
						str += '<tr><td>'+data.schedules[i+1].date+'</td><td>'+data.schedules[i+1].time+'</td><td>'+data.schedules[i+1].status+'</td>'
								+'<td>'+data.schedules[i+1].league+'</td><td class="home'+(i+1)+'"><a href="<%=request.getContextPath()%>/team?team='
								+data.schedules[i+1].home+'">'+data.schedules[i+1].home+'</td><td>'+data.schedules[i+1].score+'</td>'
								+'<td class="away'+(i+1)+'"><a href="<%=request.getContextPath()%>/team?team='+data.schedules[i+1].away+'">'
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
				console.log(request.responseText); // 실패 시 처리
           }
		});
	});
});