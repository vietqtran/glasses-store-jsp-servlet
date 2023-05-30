<%--
    Document   : header
    Created on : May 8, 2023, 2:53:17 PM
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
            href="../bootstrap/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="./bootstrap/icon/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="./style/header.css" />
    </head>
    <body>
        <header id="header" class="container-fluid p-0 position-sticky top-0">
            <div class="w-100 h-100 container-fluid container-md row m-auto">
                <div class="col col-4 p-2">
                    <a href="/glasses/home"><h1>vieqtran</h1></a>
                </div>
                <div class="col col-4 d-flex justify-content-center align-items-center">
                    <input
                        type="search"
                        class="form-control rounded"
                        placeholder="Search"
                        aria-label="Search"
                        aria-describedby="search-addon"
                        />
                </div>
                <div class="col col-4 d-flex justify-content-end align-items-center">
                    <div class="p-md-3 p-2">
                        <a href="check?action=getCart">
                            <i class="bi bi-cart-dash"></i>
                        </a>
                    </div>
                    <div id="acc" class="p-md-3 p-2 position-relative acc-container">
                        <a href="#" class="fs-5 fw-lighter">
                            <i class="bi bi-person"></i>
                        </a>
                        <div id="user-select" class="position-absolute top-100">
                            <ul class="list-unstyled text-center m-0">
                                <c:if test="${sessionScope.user!=null}">
                                    <a href="#"><li class="py-2 px-5">${sessionScope.user.userName}</li></a>
                                    <a href="check?action=logout"><li class="py-2 px-5">Logout</li></a>
                                        </c:if>
                                        <c:if test="${!(sessionScope.user!=null)}">
                                    <a href="check?action=login"><li class="py-2 px-5">Login</li></a>
                                        </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <script
            type="text/javascript"
            src="./bootstrap/js/bootstrap.min.js">
        </script>

    </body>
</html>
