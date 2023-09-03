<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

/* 화면 전체 랩 */
.wrapper {
	width: 100%;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #f7f7f7;
}

/* content 랩 */
.wrap {
	width: 800px;
	margin: auto;
}

/* 페이지 제목 */
.subjecet {
	width: 100%;
	height: 120px;
	background-color: #55b95a;
	display: flex;
	justify-content: center;
	align-items: center;
}

.subjecet span {
	font-size: 40px;
	font-weight: 900;
	color: #fff;
}

/* 아이디 영역 */
.id_wrap {
	width: 100%;
	margin-top: 20px;
}

.id_name {
	font-size: 25px;
	font-weight: bold;
	color: #000;
}

.id_input_box, .pw_input_box, .pwck_input_box, .user_input_box,
	.mail_input_box, .address_input_1_box, .address_input_2_box,
	.address_input_3_box {
	border: 1px solid #ccc;
	background-color: #f2f2f2;
}

.id_input {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 20px;
	font-family: Arial, sans-serif;
	color: #000;
}

/* 중복아이디 존재하지 않는 경우 */
.id_input_re_1 {
	color: #3fa53f;
	display: none;
}

/* 중복아이디 존재하는 경우 */
.id_input_re_2 {
	color: #ff0000;
	display: none;
}

/* 비밀번호 영역 */
.pw_wrap {
	width: 100%;
	margin-top: 20px;
}

.pw_name {
	font-size: 25px;
	font-weight: bold;
	color: #000;
}

.pw_input {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 20px;
	font-family: Arial, sans-serif;
	color: #000;
}

/* 비밀번호 확인 영역 */
.pwck_wrap {
	width: 100%;
	margin-top: 20px;
}

.pwck_name {
	font-size: 25px;
	font-weight: bold;
	color: #000;
}

.pwck_input {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 20px;
	font-family: Arial, sans-serif;
	color: #000;
}

/* 이름 영역 */
.user_wrap {
	width: 100%;
	margin-top: 20px;
}

.user_name {
	font-size: 25px;
	font-weight: bold;
	color: #000;
}

.user_input {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 20px;
	font-family: Arial, sans-serif;
	color: #000;
}

/* 메일 영역 */
.mail_wrap {
	width: 100%;
	margin-top: 20px;
}

.mail_name {
	font-size: 25px;
	font-weight: bold;
	color: #000;
}

.mail_input {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 20px;
	font-family: Arial, sans-serif;
	color: #000;
}

.mail_check_wrap {
	margin-top: 20px;
}

.mail_check_input_box {
	border: 1px solid #000;
	height: 40px;
	padding: 10px 14px;
	width: 61%;
	float: left;
	background-color: #f2f2f2;
}

#mail_check_input_box_false {
	background-color: #ebebe4;
}

#mail_check_input_box_true {
	background-color: #fff;
}

.mail_check_input {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 20px;
	font-family: Arial, sans-serif;
}

.mail_check_button {
	border: 1px solid #000;
	height: 40px;
	width: 30%;
	float: right;
	line-height: 38px;
	text-align: center;
	font-size: 20px;
	font-weight: 900;
	background-color: #ececf7;
	color: #000;
	cursor: pointer;
}

.correct {
	color: #3fa53f;
}

.incorrect {
	color: #ff0000;
}

/* 주소 영역 */
.address_wrap {
	width: 100%;
	margin-top: 20px;
}

.address_name {
	font-size: 25px;
	font-weight: bold;
	color: #000;
}

.address_input_1 {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 20px;
	font-family: Arial, sans-serif;
	color: #000;
}

.address_button {
	border: 1px solid #000;
	height: 40px;
	width: 30%;
	float: right;
	line-height: 38px;
	text-align: center;
	font-size: 20px;
	font-weight: 900;
	background-color: #ececf7;
	color: #000;
	cursor: pointer;
}

.address_input_2_box, .address_input_3_box {
	border: 1px solid #ccc;
	background-color: #f2f2f2;
}

.address_input_2 {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 20px;
	font-family: Arial, sans-serif;
	color: #000;
}

.address_input_3 {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 20px;
	font-family: Arial, sans-serif;
	color: #000;
}

/* 가입하기 버튼 */
.join_button_wrap {
	margin-top: 40px;
	text-align: center;
}

.join_button {
	width: 100%;
	height: 80px;
	background-color: #55b95a;
	font-size: 40px;
	font-weight: 900;
	color: #fff;
	cursor: pointer;
}

/* 유효성 검사 문구 */
.final_id_ck {
	display: none;
}

.final_pw_ck {
	display: none;
}

.final_pwck_ck {
	display: none;
}

.final_name_ck {
	display: none;
}

.final_mail_ck {
	display: none;
}

.final_addr_ck {
	display: none;
}

/* 비밀번호 확인 일치 유효성검사 */
.pwck_input_re_1 {
	color: #3fa53f;
	display: none;
}

.pwck_input_re_2 {
	color: #3fa53f;
	display: none;
}

/* 로그인 실패시 경고글 */
.login_warn {
	margin-top: 30px;
	text-align: center;
	color: red;
}

/* float 속성 해제 */
.clearfix {
	clear: both;
}
</style>


<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="wrapper">
		<form id="join_form" method="post">
			<div class="wrap">
				<div class="subjecet">
					<span>회원가입</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<input class="id_input" name="memberId"> <span
						class="id_input_re_1">사용 가능한 아이디입니다.</span> <span
						class="id_input_re_2">아이디가 이미 존재합니다.</span> <span
						class="final_id_ck">아이디를 입력해주세요.</span>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<input class="pw_input" name="memberPw"> <span
						class="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<input class="pwck_input"> <span class="final_pwck_ck">비밀번호
						확인을 입력해주세요.</span> <span class="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
						class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				</div>
				<div class="user_wrap">
					<div class="user_name">이름</div>
					<input class="user_input" name="memberName"> <span
						class="final_name_ck">이름을 입력해주세요.</span>
				</div>
				<div class="mail_wrap">
					<div class="mail_name">이메일</div>
					<input class="mail_input" name="memberMail"> <span
						class="final_mail_ck">이메일을 입력해주세요.</span>
					<sapn class="mail_input_box_warn"></sapn>
					<div class="mail_check_wrap">
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input" disabled="disabled">
						</div>
						<div class="mail_check_button">
							<span>인증번호 전송</span>
						</div>
						<div class="clearfix"></div>
						<span id="mail_check_input_box_warn"></span>
					</div>
				</div>
				<div class="address_wrap">
					<div class="address_name">주소</div>
					<div class="address_input_1_wrap">
						<input class="address_input_1" name="memberAddr1">
						<div class="address_button" onclick="execution_daum_address()">
							<span>주소 찾기</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="address_input_2_wrap">
						<input class="address_input_2" name="memberAddr2">
					</div>
					<div class="address_input_3_wrap">
						<input class="address_input_3" name="memberAddr3">
					</div>
					<span class="final_addr_ck">주소를 입력해주세요.</span>
				</div>
				<div class="join_button_wrap">
					<div class="join_button">
						<span>회원가입하기</span>
					</div>
					<div id="join-note" class="form-note">
						가입하면 <a href="/other_categories/conditions">약관</a> 및 <a
							href="/other_categories/personal_information">개인정보처리방침</a>에 동의하는
						것으로 간주됩니다.
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
		var code = "";
		var idCheck = false;
		var idckCheck = false;
		var pwCheck = false;
		var pwckCheck = false;
		var nameCheck = false;
		var mailCheck = false;
		var mailnumCheck = false;
		var addressCheck = false;

		$(document).ready(
				function() {
					$(".join_button")
							.click(
									function() {
										var id = $('.id_input').val();
										var pw = $('.pw_input').val();
										var pwck = $('.pwck_input').val();
										var name = $('.user_input').val();
										var mail = $('.mail_input').val();
										var addr = $('.address_input_3').val();

										if (id == "") {
											$('.final_id_ck').css('display',
													'block');
											idCheck = false;
										} else {
											$('.final_id_ck').css('display',
													'none');
											idCheck = true;
										}

										if (pw == "") {
											$('.final_pw_ck').css('display',
													'block');
											pwCheck = false;
										} else {
											$('.final_pw_ck').css('display',
													'none');
											pwCheck = true;
										}

										if (pwck == "") {
											$('.final_pwck_ck').css('display',
													'block');
											pwckCheck = false;
										} else {
											$('.final_pwck_ck').css('display',
													'none');
											pwckCheck = true;
										}

										if (name == "") {
											$('.final_name_ck').css('display',
													'block');
											nameCheck = false;
										} else {
											$('.final_name_ck').css('display',
													'none');
											nameCheck = true;
										}

										if (mail == "") {
											$('.final_mail_ck').css('display',
													'block');
											mailCheck = false;
										} else {
											$('.final_mail_ck').css('display',
													'none');
											mailCheck = true;
										}

										if (addr == "") {
											$('.final_addr_ck').css('display',
													'block');
											addressCheck = false;
										} else {
											$('.final_addr_ck').css('display',
													'none');
											addressCheck = true;
										}

										if (idCheck && idckCheck && pwCheck
												&& pwckCheck && nameCheck
												&& mailCheck && mailnumCheck
												&& addressCheck) {
											$("#join_form").attr("action",
													"/member/join");
											$("#join_form").submit();
										}
										return false;
									});
				});

		$('.id_input').on(
				"propertychange change keyup paste input",
				function() {
					var memberId = $('.id_input').val();
					var data = {
						memberId : memberId
					}

					$.ajax({
						type : "post",
						url : "/member/memberIdChk",
						data : data,
						success : function(result) {
							if (result != 'fail') {
								$('.id_input_re_1').css("display",
										"inline-block");
								$('.id_input_re_2').css("display", "none");
								idckCheck = true;
							} else {
								$('.id_input_re_2').css("display",
										"inline-block");
								$('.id_input_re_1').css("display", "none");
								idckCheck = false;
							}
						}
					});
				});

		$(".mail_check_button").click(function() {
			var email = $(".mail_input").val();
			var cehckBox = $(".mail_check_input");
			var boxWrap = $(".mail_check_input_box");
			var warnMsg = $(".mail_input_box_warn");

			if (mailFormCheck(email)) {
				warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
				warnMsg.css("display", "inline-block");
			} else {
				warnMsg.html("올바르지 못한 이메일 형식입니다.");
				warnMsg.css("display", "inline-block");
				return false;
			}

			$.ajax({
				type : "GET",
				url : "mailCheck?email=" + email,
				success : function(data) {
					cehckBox.attr("disabled", false);
					boxWrap.attr("id", "mail_check_input_box_true");
					code = data;
				}
			});
		});

		$(".mail_check_input").blur(function() {
			var inputCode = $(".mail_check_input").val();
			var checkResult = $("#mail_check_input_box_warn");

			if (inputCode == code) {
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("class", "correct");
				mailnumCheck = true;
			} else {
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class", "incorrect");
				mailnumCheck = false;
			}
		});

		function execution_daum_address() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = '';
							var extraAddr = '';
							if (data.userSelectedType === 'R') {
								addr = data.roadAddress;
							} else {
								addr = data.jibunAddress;
							}
							if (data.userSelectedType === 'R') {
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								addr += (extraAddr !== '' ? ' (' + extraAddr
										+ ')' : '');
							}
							document.getElementsByClassName('address_input_1')[0].value = data.zonecode;
							document.getElementsByClassName('address_input_2')[0].value = addr;
							document.getElementsByClassName('address_input_3')[0]
									.focus();
						}
					}).open();
		}

		function mailFormCheck(mail) {
			if (!/^[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z0-9]{2,6}$/.test(mail)) {
				return false;
			} else {
				return true;
			}
		}
	</script>

</body>
</html>
