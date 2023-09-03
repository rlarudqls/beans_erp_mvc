<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>주소 검색</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>주소 검색</h2>
        <input type="text" class="form-control" id="addressInput" placeholder="주소를 입력하세요">
        <button class="btn btn-primary mt-2" id="searchButton">주소 검색</button>
        <div id="addressResult" class="mt-3"></div>
    </div>
    
    <!-- Daum Map API 스크립트 추가 -->
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_KAKAO_APP_KEY&libraries=services"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#searchButton").click(function() {
                var address = $("#addressInput").val();
                
                var geocoder = new kakao.maps.services.Geocoder();
                
                geocoder.addressSearch(address, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var firstResult = result[0];
                        var fullAddress = firstResult.address_name;
                        var latitude = firstResult.y;
                        var longitude = firstResult.x;
                        
                        var addressInfo = "<p><strong>주소:</strong> " + fullAddress + "</p>";
                        addressInfo += "<p><strong>경도:</strong> " + longitude + "</p>";
                        addressInfo += "<p><strong>위도:</strong> " + latitude + "</p>";
                        
                        $("#addressResult").html(addressInfo);
                    } else {
                        $("#addressResult").html("<p>주소를 찾을 수 없습니다.</p>");
                    }
                });
            });
        });
    </script>
</body>
</html>
