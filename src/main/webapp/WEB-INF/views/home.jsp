<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Home</title>
    <!-- 부트스트랩 링크 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5 text-center">
    <h1>Hello world!</h1>
    
    <!-- 서버 시간 JSTL로 표시 -->
    <p>빈스erp를 시작하는 시간 <fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초 z" /></p>
    
    <!-- 로그인 및 회원가입 버튼 -->
    <div class="d-flex justify-content-center">
        <a href="<c:url value="/kkb_login/login"/>" class="btn btn-primary mr-2">로그인</a>
        <a href="<c:url value="/kkb_login/signup"/>" class="btn btn-success">회원가입</a>
    </div>
</div>

<!-- 부트스트랩 스크립트 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
