<%--
    Document   : cart
    Created on : May 14, 2023, 2:24:00 AM
    Author     : tranq
--%>

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
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <%@ page import="java.text.DecimalFormat" %>

        <div id="cart-container" class="container-fluid container-md my-4 mx-auto">
            <div class="text-decoration-underline w-100 my-4">
                <a href="/glasses/home"><i class="bi bi-chevron-left"></i> Continue shopping</a>
            </div>
            <div class="d-flex align-items-center justify-content-between border-bottom w-100 row">
                <h3 class="fs-5 col-9">YOUR CART</h3>
                <h3 class="fs-5 col-3 text-center">TOTAL</h3>
            </div>
            <c:forEach items="${requestScope.orders}" var="o">
                <div class="w-100 border-bottom py-3">
                    <div class="row">
                        <div class="col-md-2 col-3">
                            <a href="${o.img}"></a>
                            <img class="p-0 m-0" src="${o.img}" alt="">
                        </div>
                        <div class="col-md-7 col-6 d-md-flex justify-content-between">
                            <div>
                                <h4>${o.name}</h4>
                                <h5 id="price">${DecimalFormat("###,###,###").format(o.price)} VND</h5>
                                <p>Color: ${o.color}</p>
                            </div>
                            <div  class="d-flex actionQuantity">
                                <div class="d-flex align-items-center justify-content-start fs-6 fw-light border quantity">
                                    <a href="check?action=decreaseCart&img=${o.img}&quantity=${o.quantity}"><button class="p-3">-</button></a>
                                    <div class="px-5 fs-5">${o.quantity}</div>
                                    <a href="check?action=increaseCart&img=${o.img}&quantity=${o.quantity}"><button class=" p-3">+</button></a>
                                </div>
                                <div class="p-3 py-3">
                                    <a href="check?action=deleteCartProduct&img=${o.img}">
                                        <i class="bi bi-trash3"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div id="totalIndex" class="col-3 text-center">${DecimalFormat("###,###,###").format(o.price*o.quantity)} VND</div>
                    </div>
                </div>
            </c:forEach>
            <div class="w-100 py-3">
                <a href="check?action=checkout"><input class="px-4 py-2" type="button" value="Check Out" /></a>
            </div>

        </div>

        <%@include file="components/footer.jsp" %>
        <script
            type="text/javascript"
            src="./bootstrap/js/bootstrap.min.js">
        </script>
    </body>
</html>
