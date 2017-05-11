/**
 * member.js
 * 회원가입, 회원정보 수정에서 공통으로 사용할 코드
 */
$(document).ready(function(){
	$("#email2").change(function(){
		if($("#email2").val()=="etc"){
			$('#email3').css("visibility","visible");
			$("#email3").val("");
			$("#email3").focus();
		}else{
			$('#email3').css("visibility","hidden");
		}
	});
	
	
/*
	$("#btnZipcode").click(function(){
		window.open("/herb/zipcode/zipcode.do","zip",
		"width=450,height=500,left=10,top=10,location=yes,resizable=yes");	
	});
*/
});

function validate_userid(userid){
	var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
	return pattern.test(userid); //true이면 정규식을 만족,
								 //false이면 에러 
    /*
   	정규식  /^[a-zA-Z0-9_]+$/g
	a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 
	숫자나 _로 시작하거나 끝나야 한다는 의미
	닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 
	그 이상 반복된다는 의미
    */
}

function validate_hp(hp){
	var pattern = new RegExp(/^[0-9]*$/g);
	return pattern.test(hp);
	/*  정규식  /^[0-9]*$/g
	0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 
	(^는 시작, $는 끝을 의미)
	닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복  */
}

function validate_pwd(pwd){
	var pattern = new RegExp( /^[a-z0-9]{5,19}$/g);
	return pattern.test(pwd); //true이면 정규식을 만족,
								 //false이면 에러 
    /*
   	정규식  /^[a-zA-Z0-9_]+$/g
	a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 
	숫자나 _로 시작하거나 끝나야 한다는 의미
	닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 
	그 이상 반복된다는 의미
    */
}

