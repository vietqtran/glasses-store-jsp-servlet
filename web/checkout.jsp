<%--
    Document   : checkout
    Created on : May 14, 2023, 1:49:00 PM
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
        <link rel="stylesheet" href="./style/checkout.css">
        <link rel="stylesheet" href="style/home.css" />
        <link rel="stylesheet" href="style/footer.css" />
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <%@ page import="java.text.DecimalFormat" %>

        <c:set var="orders" value="${requestScope.orders}"></c:set>
            <div class="container-fluid container-md my-4 mx-auto row d-flex flex-column-reverse flex-md-row">
                <div class="col-12 col-md-7 p-0">
                    <form action="createorder" method="post" class="w-100">
                        <label for="emailContact" class="mt-3">Contact</label></br>
                        <input class="w-100 py-2" name="contact" type="email" id="emailContact" placeholder="Email"/>
                        <label class="fw-bold mt-5">Shipping address</label></br>
                        <label for="city">Tỉnh / Thành phố <span>*</span></label></br>
                        <select id="city" name="city" class="w-100 py-2" required>
                            <option value="" class="py-2" selected></option>
                        </select>
                        <label for="district">Quận / Huyện <span>*</span></label></br>
                        <select id="district" name="district" class="w-100 py-2" required>
                            <option value="" selected></option>
                        </select>
                        <label for="ward">Xã / Phường / Thị trấn <span>*</span></label></br>
                        <select id="ward" name="ward" class="w-100 py-2" required>
                            <option value=""  selected></option>
                        </select>
                        <label class="fw-bold mt-5">Information</label>
                        <div class="d-flex w-100">
                            <div class="w-50 fn">
                                <label for="firstName">First Name</label></br>
                                <input class="w-100 py-2" name="firstname" type="text" id="firstname" placeholder="First Name" required/>
                            </div>
                            <div class="w-50 ln">
                                <label for="lastname">Last Name <span>*</span></label></br>
                                <input required class="w-100 py-2" name="lastname" type="text" id="lastname" placeholder="Last Name"/>
                            </div>
                        </div>
                        <label for="phone">Phone number <span>*</span></label></br>
                        <input required class="w-100 py-2 mb-5" name="phone" type="text" id="phone" placeholder="Phone"/>
                        <div class="d-flex align-items-center justify-content-between">
                            <a href="/glasses/cart" class="text-decoration-underline"><i class="bi bi-chevron-left"></i> Return to cart</a>
                            <button type="submit" class="btn btn-primary py-3 px-3">Continue shipping</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-5 col-12 p-0 p-md-4">
                    <div>
                    <c:forEach items="${orders}" var="o">
                        <div class="row d-flex align-items-center mb-2">
                            <div class="col-3 position-relative"><img src="${o.img}" class="imgProduct" alt="">
                                <span class="quantity position-absolute">${o.quantity}</span>
                            </div>
                            <div class="col-5">
                                <h4>${o.name}</h4>
                                <span>${o.color}</span>
                            </div>
                            <span class="col-4 d-block price">${DecimalFormat("###,###,###").format(o.price*o.quantity)} VND</span>
                        </div>
                        <span class="priceorder opacity-0 w-0 h-0 d-block">${o.price*o.quantity}</span>
                    </c:forEach>
                </div>
                <div class="row p-3">
                    <input type="text" placeholder="Discount code" class="p-3 my-3">
                    <button class="btn btn-primary h-100 px-4">Apply</button>
                </div>
                <div>
                    <div class="d-flex align-items-center justify-content-between">
                        <span>Shipping</span>
                        <span>${DecimalFormat("###,###,###").format(30000)} VND</span>
                    </div>
                    <div class="d-flex align-items-center justify-content-between">
                        <span>Discount</span>
                        <span><span id="discount">0</span>%</span>
                    </div>
                    <div class="d-flex align-items-center justify-content-between">
                        <span>Sub-total</span>
                        <span  id="subtotal"></span>
                    </div>
                    <div class="d-flex align-items-center justify-content-between">
                        <span class="fw-bold">TOTAL</span>
                        <span id="total"></span>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="./components/footer.jsp" %>

        <script
            type="text/javascript"
            src="./bootstrap/js/bootstrap.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script src="./js/checkout.js"></script>
        <script>
                const discount = parseFloat((document.getElementById('discount')).textContent)
                const total = document.getElementById('total')
                const subTotal = document.getElementById('subtotal')
                const order = document.getElementsByClassName('priceorder')
                var totalPrice = 0.0;
                var totalWithDis = 0.0

                for (var i = 0, max = order.length; i < max; i++) {
                    totalPrice += parseFloat(order[i].textContent)
                }


                var sub = (totalPrice).toLocaleString(
                        undefined, {minimumFractionDigits: 0}
                );


                var tt = ((totalPrice - (totalPrice * discount) / 100)).toLocaleString(
                        undefined, {minimumFractionDigits: 0}
                );
                subTotal.innerHTML = sub + ' VND'
                total.innerHTML = tt + ' VND'
        </script>
    </body>
</html>
