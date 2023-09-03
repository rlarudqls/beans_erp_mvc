<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
body {
	background-color: #f5f5f5;
	font-family: Arial, sans-serif;
}

.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.wrap {
	background-color: #fff;
	padding: 50px;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	width: 400px;
	max-width: 100%;
}

.logo_wrap {
	text-align: center;
	margin-bottom: 20px;
}

.logo_wrap span {
	font-size: 24px;
	font-weight: bold;
	color: #333;
}

.login_wrap {
	margin-bottom: 20px;
}

.id_wrap, .pw_wrap {
	margin-bottom: 10px;
}

.id_input_box, .pw_input_box {
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box;
	padding-right: 50px;
	position: relative;
}

.id_input, .pw_input {
	width: 100%;
	padding: 5px;
	border: none;
	outline: none;
}

.input_hint {
	position: absolute;
	top: 50%;
	left: 5px;
	transform: translateY(-50%);
	color: #aaa;
	transition: opacity 0.3s ease;
	opacity: 1;
	pointer-events: none; /* 추가 */
	user-select: none; /* 추가 */
}

.id_input:focus ~ .input_hint, .pw_input:focus ~ .input_hint {
	opacity: 0;
}

.login_warn {
	color: red;
	font-size: 14px;
	margin-bottom: 10px;
}

.login_button_wrap {
	text-align: center;
}

.login_button {
	background-color: #4CAF50;
	color: #fff;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	border-radius: 3px;
}

.login_button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>

	<div class="wrapper">

		<div class="wrap">
			<form id="login_form" method="post">
				<div class="logo_wrap">
					<span>bean's Mall</span>
				</div>
				<div class="login_wrap">
					<div class="id_wrap">
						<div class="id_input_box">
							<input class="id_input" name="memberId">
							<div class="input_hint">아이디를 입력하세요</div>
						</div>
					</div>
					<div class="pw_wrap">
						<div class="pw_input_box">
							<input class="pw_input" name="memberPw">
							<div class="input_hint">비밀번호를 입력하세요</div>
						</div>
					</div>

					<c:if test="${result == 0}">
						<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
					</c:if>

					<div class="login_button_wrap">
						<input type="button" class="login_button" value="로그인">
						<div class="nav-btn">
							<button type="button" class="btn-dropdown"
								onclick="location.href='/admin/main'">관리자 로그인</button>
						</div>
					</div>

				</div>
			</form>

		</div>



	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {

			//alert("로그인 버튼 작동");

			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "/member/login.do");
			$("#login_form").submit();

		});

		/* 아이디와 비밀번호 입력란 포커스 관련 이벤트 처리 */
		$(".id_input").focus(function() {
			$(".id_input_box .input_hint").css("opacity", 0);
		}).blur(function() {
			if ($(this).val().trim() === "") {
				$(".id_input_box .input_hint").css("opacity", 1);
			}
		});

		$(".pw_input").focus(function() {
			$(".pw_input_box .input_hint").css("opacity", 0);
		}).blur(function() {
			if ($(this).val().trim() === "") {
				$(".pw_input_box .input_hint").css("opacity", 1);
			}
		});
	</script>

</body>
</html>
