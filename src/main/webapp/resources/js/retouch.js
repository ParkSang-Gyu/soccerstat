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
	$('#retouch').submit(function(){
		if(!checkLength('#signin input[name=pw]',8,13)){
			alert('비밀번호는 8~13자리입니다');
			return false;
		}
		alert('회원정보 수정에 성공했습니다');
		return true;
	});	
	$('#pwConfirm').click(function() {
		if(!checkSame('#signin input[name=pw]','#signin input[name=pw2]')){
			alert('비밀번호와 일치하지 않습니다');
			return false;
		}else{
			alert('비밀번호가 일치합니다');
		}
	});
	/*$("form").validate({
        rules: {
            pw: {
                required : true,
                minlength : 8,
                maxlength : 13,
                regex: /^(?=\w{8,13}$)\w*(\d[A-z]|[A-z]\d)\w*$/
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
            pw: {
                required : "필수로입력하세요",
                minlength : "최소 {8}글자이상이어야 합니다",
                maxlength : "최대 {13}글자이하이어야 합니다",
                regex : "영문자, 숫자로 이루어져있으며 최소 하나이상 포함"
            },
            pw2: {
                required : "필수로입력하세요",
                equalTo : "비밀번호가 일치하지 않습니다"
            },
            email: {
                required : "필수로입력하세요",
                email : "메일규칙에 어긋납니다"
            }
        }
    });*/
});
/*$.validator.addMethod(
	"regex",
	function(value, element, regexp) {
	    var re = new RegExp(regexp);
	    return this.optional(element) || re.test(value);
	},
	"Please check your input."
);*/