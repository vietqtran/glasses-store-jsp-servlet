<%--
    Document   : login
    Created on : May 6, 2023, 4:36:44 PM
    Author     : tranq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Bootstrap Demo</title>
        <link
            rel="stylesheet"
            href="./bootstrap/css/bootstrap.min.css"
            />
        <link rel="stylesheet" href="bootstrap/icon/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="style/style.css" />
    </head>
    <body class="container-fluid d-flex justify-content-center align-items-center row m-auto">
        <c:set var="cookie" value="${pageContext.request.cookies}"/>

        <div id="sign-container" class="col col-md-8 bg-white h-100 overflow-hidden p-0 m-0 row">

            <div id="sign-in-form" class="d-flex flex-column align-items-center justify-content-center col-12 col-lg-6 h-100">
                <form action="login" method="post" class="w-50" autocomplete="off">
                    <h1 class="text-center fs-1">Sign in</h1>
                    <p class="text-center">You already have an account</p>
                    <div>
                        <!--TYPE USERNAME-->
                        <p class="text-center text-danger">${requestScope.msg}</p>
                        <label class="d-block fs-6 mt-5 mb-1 username" for="username">Username
                            <input value="${cookie.user.value}" id="usernameSignIn" class="d-block fs-6 p-2 border-0 border-bottom w-100 username" type="text" placeholder="@vietqtran" name="usernamesi" required/>
                        </label>
                        <!--TYPE PASSWORD-->
                        <label class="d-block fs-6 mt-4 mb-1 password">Password
                            <input value="${cookie.pass.value}" id="pass" class="d-block fs-6 p-2 border-0 border-bottom w-100 password" type="password" placeholder="••••••••" name="passwordsi" required/>
                            <i id="showPass" class="bi bi-eye position-absolute eye d-none" onclick="passToggle()"></i>
                            <i id="hidePass" class="bi bi-eye-slash position-absolute eye" onclick="passToggle()"></i>
                        </label>
                        <!--SAVE INFORMATION-->
                        <input type="checkbox" name="remember" class="" id="remember"/>
                        <label for="remember" value="on" ${cookie.remember.value!=null?'checked':''} class="py-3 fs-6">Remember me</label>
                    </div>
                    <div class="w-100 d-flex align-items-center justify-content-center mt-5">
                        <button class="btn btn-primary fs-5 px-4 btn-sign-1" type="submit">Sign in</button>
                    </div>
                    <span class="w-100 text-center d-flex align-items-center justify-content-center d-lg-none">
                        <hr class="w-25 mx-3"/> or <hr class="w-25 mx-3"/>
                    </span>
                    <div class="w-100 d-flex align-items-center justify-content-center mt-1 d-lg-none">
                        <button class="btn bg-white text-primary fs-5 px-4 btn-sign-1" type="button" onclick="swap()"> Sign up </button>
                    </div>
                </form>
            </div>

            <div id="sign-up-form" class="d-flex flex-column align-items-center justify-content-center col-12 col-lg-6 h-100 d-none">
                <form action="login" method="post" class="w-50" autocomplete="off">
                    <h1 class="text-center fs-1">Sign up</h1>
                    <p class="text-center">You don't have an account yet</p>
                    <div>
                        <!--TYPE USERNAME-->
                        <p class="text-center text-danger">${requestScope.msgSu}</p>
                        <label class="d-block fs-6 mt-5 mb-1 username" for="username">Username
                            <input id="usernameSignUp" class="d-block fs-6 p-2 border-0 border-bottom w-100 username" type="text" placeholder="@vietqtran" name="usernamesu" required/>
                        </label>
                        <!--TYPE PASSWORD-->
                        <label class="d-block fs-6 mt-4 mb-1 password">Password
                            <input id="passSignUp" class="d-block fs-6 p-2 border-0 border-bottom w-100 password" type="password" placeholder="••••••••" name="passwordsu" required/>
                        </label>
                        <!--TYPE CONFIRM-->
                        <label class="d-block fs-6 mt-4 mb-1 password">Confirm password
                            <input id="passCf" class="d-block fs-6 p-2 border-0 border-bottom w-100 password" type="password" placeholder="••••••••" name="passwordcfsu" required/>
                        </label>
                        <!--SAVE INFORMATION-->
                        <input type="checkbox" name="remember" value="on" class="" id="rememberUp"/>
                        <label for="rememberUp" class="py-3 fs-6">Remember me</label>
                    </div>
                    <div class="w-100 d-flex align-items-center justify-content-center mt-5">
                        <button class="btn btn-primary fs-5 px-4 btn-sign-1" type="submit">Sign up</button>
                    </div>
                    <span class="w-100 text-center d-flex align-items-center justify-content-center d-lg-none">
                        <hr class="w-25 mx-3"/> or <hr class="w-25 mx-3"/>
                    </span>
                </form>
                <div class="w-100 d-flex align-items-center justify-content-center mt-1 d-lg-none">
                    <button class="btn bg-white text-primary fs-5 px-4 btn-sign-1" type="button" onclick="swap()"> Sign in </button>
                </div>
            </div>

            <!--COVER-->
            <div class="col-12 col-lg-6 p-0 m-0 position-relative">
                <!--GET SIGN UP-->
                <div id="get-sign-up" class="w-100 h-100">
                    <c:set var="index" value='${Math.round((Math.random()*10))}'></c:set>
                    <img id="imgLeftLogin" src="./images/login/login${index}.jpg" class="" alt="">
                    <div class="position-absolute w-100 h-100 bg-opacity-50 bg-black top-0 d-flex align-items-center justify-content-center flex-column text-white">
                        <h1 class="text-center fs-1">Sign up</h1>
                        <p class="text-center">You don't have an account yet</p>
                        <div class="w-100 d-flex align-items-center justify-content-center mt-2">
                            <button class="btn fs-5 px-4 btn-sign-2" type="button" onclick="swap()">Sign up</button>
                        </div>
                    </div>
                </div>

                <!--GET SIGN IN-->
                <div id="get-sign-in" class="w-100 h-100 d-none">
                    <c:set var="index" value='${Math.round((Math.random()*10))}'></c:set>
                    <img id="imgRightLogin" src="./images/login/login${index}.jpg" class="" alt="">
                    <div class="position-absolute w-100 h-100 bg-opacity-50 bg-black top-0 d-flex align-items-center justify-content-center flex-column text-white">
                        <h1 class="text-center fs-1">Sign in</h1>
                        <p class="text-center">You already have an account</p>
                        <div class="w-100 d-flex align-items-center justify-content-center mt-2">
                            <button class="btn fs-5 px-4 btn-sign-2" type="button" onclick="swap()">Sign in</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script
            type="text/javascript"
        src="./bootstrap/js/bootstrap.min.js"></script>
        <script>
                                const usernameSignIn = document.getElementById('usernameSignIn')
                                const usernameSignUp = document.getElementById('usernameSignUp')
                                const passSignUp = document.getElementById('passSignUp')
                                const passCf = document.getElementById('passCf')
                                const pass = document.getElementById('pass')
                                const show = document.getElementById('showPass')
                                const hide = document.getElementById('hidePass')
                                function passToggle() {
                                    show.classList.toggle('d-none')
                                    hide.classList.toggle('d-none')
                                    if (pass.type == 'password') {
                                        pass.type = 'text'
                                    } else {
                                        pass.type = 'password'
                                    }
                                }

                                function clearInput() {
                                    usernameSignIn.value = ''
                                    usernameSignUp.value = ''
                                    passSignUp.value = ''
                                    passCf.value = ''
                                    pass.value = ''
                                }

                                const container = document.getElementById('sign-container')
                                const signInForm = document.getElementById('sign-in-form')
                                const signUpForm = document.getElementById('sign-up-form')
                                const signInCover = document.getElementById('get-sign-up')
                                const signUpCover = document.getElementById('get-sign-in')
                                function swap() {
                                    container.classList.toggle('flex-row-reverse')
                                    signInForm.classList.toggle('d-none')
                                    signUpForm.classList.toggle('d-none')
                                    signInCover.classList.toggle('d-none')
                                    signUpCover.classList.toggle('d-none')
                                    clearInput()
                                }
                                if (window.history.replaceState) {
                                    window.history.replaceState(null, null, window.location.href);
                                }
        </script>
    </body>
</html>

