<%--
    Document   : home
    Created on : May 8, 2023, 2:51:54 PM
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
        <%@include file="components/header.jsp" %>
        <%@ page import="java.text.DecimalFormat" %>

        <div id="slider" class="position-relative w-100 d-md-block d-none">
            <div id="pre" class="cover position-absolute fs-4 px-4" onclick="changeSlide(-1)">
                <i class="bi bi-chevron-left fs-1"></i>
            </div>
            <div id="next" class="cover position-absolute fs-4 px-4" onclick="changeSlide(1)">
                <i class="bi bi-chevron-right fs-1"></i>
            </div>

            <div class="w-100 h-100 slideContainer">
                <div class="slide w-100 h-100">
                    <img src="./images/slider1.png" alt="">
                </div>
                <div class="slide w-100 h-100 active">
                    <img src="./images/slider2.png" alt="">
                </div>
                <div class="slide w-100 h-100">
                    <img src="./images/slider3.png" alt="">
                </div>
            </div>
        </div>

        <div id="slider" class="position-relative w-100 d-md-none d-block">
            <div class="w-100 h-100 slideContainer">
                <img src="./images/slideMobile.png" alt="alt"/>
            </div>
        </div>

        <div id="productsContainer" class="container-md container-fluid h-100 row m-auto my-md-5">
            <div id="filter" class="col-12 p-2 mt-md-5">

                <div class="d-flex align-items-center justify-content-start">
                    <i class="bi bi-funnel fs-4 d-md-flex d-none"></i>
                </div>

                <button class="accordion d-flex align-items-center justify-content-between border-bottom">
                    <h4 class="fw-light">Category</h4>
                    <i class="bi fs-4 fw-light bi-chevron-down"></i></button>
                <div class="panel p-0 w-100 h-100">
                    <form action="" class="">
                        <input type="button" class="w-100 h-100 button-filter py-3 border-bottom border-opacity-50" id="glasses" name="fav_language" value="Glasses">
                        <input type="button" class="w-100 h-100 button-filter py-3 border-bottom border-opacity-50" id="sunglasses" name="fav_language" value="Sunglasses">
                    </form>
                </div>

                <button class="accordion d-flex align-items-center justify-content-between border-bottom">
                    <h4 class="fw-light">Price</h4>
                    <i class="bi fs-4 fw-light bi-chevron-down"></i></button>
                <div class="panel">
                    <input type="button" class="w-100 h-100 button-filter py-3 border-bottom border-opacity-50" id="glasses" name="fav_language" value="Glasses">
                    <input type="button" class="w-100 h-100 button-filter py-3 border-bottom border-opacity-50" id="sunglasses" name="fav_language" value="Sunglasses">
                </div>

                <button class="accordion d-flex align-items-center justify-content-between border-bottom">
                    <h4 class="fw-light">Collection</h4>
                    <i class="bi fs-4 fw-light bi-chevron-down"></i></button>
                <div class="panel">
                    <input type="button" class="w-100 h-100 button-filter py-3 border-bottom border-opacity-50" id="glasses" name="fav_language" value="Glasses">
                    <input type="button" class="w-100 h-100 button-filter py-3 border-bottom border-opacity-50" id="sunglasses" name="fav_language" value="Sunglasses">
                </div>
            </div>

            <div id="products" class="col-12 m-auto d-flex align-items-start justify-content-center px-0">
                <div class="w-100 row gy-1">

                    <div class="sort fs-5 fw-light p-0 m-0 d-flex align-items-center justify-content-end">
                        <a href="#"><i class="bi bi-sort-down"></i>Price increase</a>
                        <a href="#"><i class="bi bi-sort-down-alt"></i>Price decrease</a>
                    </div>

                    <c:forEach items="${requestScope.list}" var="p">
                        <div class="col-6 col-md-4 p-1">
                            <a href="product?id=${p.id}">
                                <div class="product">
                                    <div class="w-100 wrapper-image">
                                        <img class="my-2 image-product" src='${p.i1}' onmouseout="changeImgOut(this, '${p.i1}')" onmouseover="changeImgOver(this, '${p.i2}')" alt=""/>
                                    </div>
                                    <p class="m-0 fw-semibold">${p.name}</p>
                                    <span class="py-2 d-block fw-lighter">${DecimalFormat("###,###,###").format(p.price)} VND</span>
                                </div>
                            </a>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>


        <%@include file="components/footer.jsp" %>

        <script
            type="text/javascript"
            src="./bootstrap/js/bootstrap.min.js">
        </script>
        <script>
            const prev = document.getElementById('pre')
            const next = document.getElementById('next')
            const slides = document.getElementsByClassName('slide')

            prev.classList.contain
            function changeSlide(i) {
                for (let index = 0; index < slides.length; index++) {
                    if (slides.item(index).classList.contains('active')) {
                        console.log(index);
                        slides.item(index).classList.remove('active')
                        if (index + i < 0) {
                            slides.item(slides.length - 1).classList.add('active')
                            break
                        } else if (index + i >= slides.length) {
                            slides.item(0).classList.add('active')
                            break
                        } else {
                            slides.item(index + i).classList.add('active')
                            break
                        }
                    }
                }
            }

            showSlides();

            function showSlides() {
                changeSlide(1)
                setTimeout(showSlides, 3000);
            }

            //accordion
            var acc = document.getElementsByClassName("accordion");
            var i;
            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function () {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight) {
                        panel.style.maxHeight = null;
                    } else {
                        panel.style.maxHeight = panel.scrollHeight + "px";
                    }
                });
            }


            // const range = document.getElementById('submitRange')
            // function handleRange(){
            //     range.submit()
            // }

            function changeImgOver(e, url) {
                e.src = url;
            }

            function changeImgOut(e, url) {
                e.src = url;
            }
        </script>
    </body>

</html>
