<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<section class="page-section">
	<div class = "container">
		<form id = "repwCheck" method = "post" action = "pwUpdateResult">
			새 비밀번호 입력: <input type = "password" id = "person_pw" name = "person_pw" class= "form-control" style = "width: 15%; display: inline;">
			<div class = "check_font" id = "pw_check"></div>
			새 비밀번호 확인: <input type = "password" id = "person_pw2" name = "person_pw2" class= "form-control" style = "width: 15%; display: inline; margin-top: 3px;">
			<div class = "check_font" id = "pw2_check"></div>
			<input type = "submit" value = "다음" id = "submitBtn" class = "btn btn-primary btn-lg">
		</form>
	</div>
</section>
<script>
	document.getElementById('repwCheck').onsubmit = function(event){
		event.preventDefault()
		const person_pw = event.target.querySelector('input[name="person_pw"]').value
		const person_pw2 = event.target.querySelector('input[name="person_pw2"]').value
		if(person_pw != person_pw2){
			alert('비밀번호가 일치하지 않습니다.')
		}
		else{
			event.target.submit()
		}
	}
</script>

<script>
let pwFlag = false
let pw2Flag = false
const submitBtn = document.getElementById('submitBtn')
function check(event){
	if(pwFlag && pw2Flag) submitBtn.disabled = false
	else submitBtn.disabled = true
}
</script>

<script>
	//비밀번호 체크
	$('#person_pw').blur(function(){
		const pwJ = /^[a-z0-9]{6,20}$/
		const person_pw = $('#person_pw').val()
		const person_pw2 = $('#person_pw2').val()
			if(pwJ.test(person_pw)){
				$('#pw_check').text('사용 가능한 비밀번호입니다')
				$('#pw_check').css('color', 'blue')
	// 			$('#reg_submit').attr('disabled', false)
				check()
			} else if(person_pw == ''){
				$('#pw_check').text('비밀번호를 입력해주세요')
				$('#pw_check').css('color', 'red')
	// 			$('#reg_submit').css('disabled', true)
				check()
			} else {
				$('#pw_check').text('비밀번호는 소문자와 숫자 6~20자리만 가능합니다')
				$('#pw_check').css('color', 'red')
	// 			$('#reg_submit').attr('disabled', true)
				check()
				
			}
	})
	//비밀번호 확인 체크
	$('#person_pw2').blur(function(){
		const person_pw = $('#person_pw').val()
		const person_pw2 = $('#person_pw2').val()
		if(person_pw2 != person_pw){
				$('#pw2_check').text('비밀번호가 일치하지 않습니다')
				$('#pw2_check').css('color', 'red')
				check()
		}else{
				$('#pw2_check').text('비밀번호가 일치합니다')
				$('#pw2_check').css('color', 'blue')
				check()
		}
	})
</script>
<%@ include file="../layout/footer.jsp" %>