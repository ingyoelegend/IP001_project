
const submit = document.getElementById("submit");

function check(event)
{
	var pwd = document.getElementById("pwd");
    var pwd2 = document.getElementById("pwd2");
	
	if(pwd.value.length > 20)
	{
		alert("비밀번호 길이는 20자 이내입니다.");
		event.preventDefault();
	}
	
	
	if(pwd.value != pwd2.value)
	{
		alert("비밀번호 재확인 불일치");
		event.preventDefault();
	}
	
	
	
	

}

submit.addEventListener("click",check);
