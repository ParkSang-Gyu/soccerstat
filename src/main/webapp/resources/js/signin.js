function checkSame(sel1, sel2){
	var val1 = $(sel1).val();
	var val2 = $(sel2).val();
	if(val1 == val2)
		return true;
	return false;
}
function checkLength(sel,min,max){
	var val = $(sel).val();
	if(val.length >= min && val.length <= max)
		return true;
	return false;
}	
var isCheck = false;	
$(document).ready(function(){
	$('#confirm').click(function(){
		var id = $('input[name=id]').val();
		//id 유효성 검사
		$.ajax({
	        async:true,
	        type:'POST',
	        data:id,
	        url:"confirm",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){
	            if(!data.isMember){
	            	alert('회원 가입이 가능한 아이디입니다.');
	            	isCheck = true;
	            }else{
	            	alert('이미 가입된 회원입니다.');
	            	isCheck = false;
	            }
	        },
	        error : function(request,status,error) {
				console.log(request.responseText);
			}
	    });
	});
	$('#pwConfirm').click(function() {
		if(!checkSame('#signin input[name=pw]','#signin input[name=pw2]')){
			alert('비밀번호와 일치하지 않습니다.');
			return false;
		}else{
			alert('비밀번호가 일치합니다.');
		}
	})
	$('#writerConfirm').click(function(){
		var writer = $('input[name=writer]').val();
		//필명 유효성 검사
		$.ajax({
	        async:true,
	        type:'POST',
	        data:writer,
	        url:"writerConfirm",
	        dataType:"json",
	        contentType:"application/json; charset=UTF-8",
	        success : function(data){
	            if(!data.isWriter){
	            	alert('사용 가능한 필명입니다.');
	            	isCheck = true;
	            }else{
	            	alert('이미 사용하고 있는 필명입니다.');
	            	isCheck = false;
	            }
	        },
	        error : function(request,status,error) {
				console.log(request.responseText);
			}
	    });
	});
	$('input[name=id]').change(function(){
		isCheck = false;
	});
	$('#signin').submit(function(){
		if(!checkLength('#signin input[name=id]',8,13)){
			alert('아이디는 8~13자리입니다.');
			return false;
		}
		var regex = /^\w*(\d[A-z]|[A-z]\d)\w*$/;
		var id = $('input[name=id]').val();
		if(!regex.test(id)){
			alert('아이디는 영문자와 숫자를 반드시 1개이상 포함해야 합니다.');
			return false;
		}
		if(!isCheck){
			alert('아이디 중복검사를 하세요.');
			return false;
		}
		if($('#signin input[type=email]').val().length == 0){
			alert('이메일을 입력해주세요.')
			return false;
		}
		alert('회원가입에 성공했습니다.');
		return true;
	});	
	$("form").validate({
        rules: {
            id: {
                required : true,
                minlength : 4,
                maxlength : 12
            },
            pw: {
                required : true,
                minlength : 8,
                maxlength : 12,
                regex: /^\w*(\d[A-z]|[A-z]\d)\w*$/
            },
            pw2: {
                required : true,
                equalTo : pw
            },
            email: {
                required : true,
                email : true
            }
        },
        //규칙체크 실패시 출력될 메시지
        messages : {
            id: {
                required : "필수로입력하세요",
                minlength : "최소 {4}글자이상이어야 합니다",
                maxlength : "최대 {12}글자이하이어야 합니다"
            },
            pw: {
                required : "필수로입력하세요",
                minlength : "최소 {8}글자이상이어야 합니다",
                maxlength : "최대 {12}글자이하이어야 합니다",
                regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
            },
            pw2: {
                required : "필수로입력하세요",
                equalTo : "비밀번호가 일치하지 않습니다."
            },
            email: {
                required : "필수로입력하세요",
                email : "메일규칙에 어긋납니다"
            }
        }
    });
});
/*$.validator.addMethod(
	"regex",
	function(value, element, regexp) {
	    var re = new RegExp(regexp);
	    return this.optional(element) || re.test(value);
	},
	"Please check your input."
);*/