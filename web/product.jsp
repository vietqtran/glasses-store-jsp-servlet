<%--
    Document   : product
    Created on : May 9, 2023, 9:56:29 PM
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
        <link rel="stylesheet" href="style/footer.css" />
    </head>
    <body>
        <%@ page import="java.text.DecimalFormat" %>
        <c:set var="product" value="${requestScope.product}"></c:set>
        <%@include file="components/header.jsp" %>
        <c:set var="product" value="${requestScope.product}"></c:set>
            <div class="row w-100 container-md container-fluid m-auto my-5">
                <div class="col-md-2 d-md-block d-none"></div>
                <div class="col-12 col-md-4">
                    <div class="w-100 px-4 row m-auto wrapper-image">
                        <img id="main" class="col-12 p-0 " src="${product.i1}" alt="alt"/>
                </div>
                <div class="w-100 row px-4 m-auto my-3">
                    <div class="col col-3 p-0 w-25 border-end border-dark border-opacity-25"><img onclick="change(this)" class="col-12" src="${product.i2}" alt="alt"/></div>
                    <div class="col col-3 p-0 w-25 border-end border-dark border-opacity-25"><img onclick="change(this)" class="col-12" src="${product.i3}" alt="alt"/></div>
                    <div class="col col-3 p-0 w-25 border-end border-dark border-opacity-25"><img onclick="change(this)" class="col-12" src="${product.i4}" alt="alt"/></div>
                    <div class="col col-3 p-0 w-25"><img onclick="change(this)" class="col-12" src="${product.i5}" alt="alt"/></div>
                </div>
            </div>

            <div class="col-12 col-md-4">
                <div class="p-4">
                    <h3 class="fs-5 fw-semibold">${product.name}</h3>
                    <h4 class="fs-6 fw-light my-3">${DecimalFormat("###,###,###").format(product.price)} VND</h4>
                    <p>${product.description}</p>
                    <a href="check?action=addToCart&productid=${product.id}"><button class="btn btn-light fs-6 px-5 my-3">ADD TO CART</button></a>
                </div>
                <div class="col-md-2 d-md-block d-none"></div>
            </div>

        </div>
        <%@include file="components/footer.jsp" %>
        <script>
            const img = document.getElementById('main')
            function change(e) {
                img.src = e.src
            }
        </script>
    </body>
</html>
