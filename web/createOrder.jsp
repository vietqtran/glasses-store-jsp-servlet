<%--
    Document   : createOrder
    Created on : May 14, 2023, 6:08:05 PM
    Author     : tranq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            rel="stylesheet"
            href="./bootstrap/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="./bootstrap/icon/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="style/home.css" />
        <link rel="stylesheet" href="style/cart.css" />
        <link rel="stylesheet" href="style/createOrder.css" />
    </head>
    <body>

        <%@include file="./components/header.jsp" %>
        <div id="successContainer" class="d-flex align-items-center justify-content-center container-fluid container-md flex-column">
            <img src="./images/success-icon.png" class="imgscs" alt="alt"/>
            <h1>Thanks for your order</h1>
            <p>Shop chúc cho bạn sinh đa tiết khánh, hạ bảo bình an, tu tấm tâm tai, đông toàn đa phước, shop chúc cho bạn muôn đời bình an, đời đời bạn sống an lành trong ánh sáng hào quang của 10 phương chư Phật. Shop chúc cho bạn sở nguyện tùy tâm, sở cầu như ý. Xin đức Phật A di đà từ bi phù hộ độ trì cho bạn muôn đời phước an. Một câu niệm Phật để tâm chúng sanh trở thành tâm Phật, một câu niệm Phật ao nước đục trở thành ao nước trong, một câu niệm Phật tăng trưởng phước duyên và tiêu trừ nghiệp chướng. Nam mô A di đà Phật, xin Phật ban phước lành cho bạn muôn đời bình an nha bạn.</p>
            <div class="w-50 text-center">
                <h1 class="text-center">Information</h1>
                <div>
                    <h2 class="fs-5">Name</h2>
                    <p>${requestScope.firstName} ${requestScope.lastName}</p>
                </div>
                <div>
                    <h2 class="fs-5">Address</h2>
                    <p>${requestScope.village}, ${requestScope.province}, ${requestScope.city}</p>
                </div>
                <div>
                    <h2 class="fs-5">Phone Number</h2>
                    <p>${phone}</p>
                </div>
            </div>
        </div>
        <%@include file="./components/footer.jsp" %>
        <script
            type="text/javascript"
            src="./bootstrap/js/bootstrap.min.js">
        </script>
    </body>
</html>
