<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <jsp:include page="layout/fragments.jsp"></jsp:include>
</head>
<body class="bg-gradient-primary">
<div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                </div>
                                <c:if test="${not empty param.error}">
                                    <div class="alert alert-danger text-center">
                                        Invalid username or password
                                    </div>
                                </c:if>

                                <c:if test="${not empty param.logout}">
                                    <div class="alert alert-success text-center">
                                        You have been logged out!
                                    </div>
                                </c:if>

                                <form class="user" action="/do-login" method="post">
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user"
                                               id="username" aria-describedby="emailHelp"
                                               name="username" placeholder="Enter Email Address...">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                               id="password" name="password" placeholder="Password">
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-user btn-block">
                                        Login
                                    </button>
                                    <hr>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="/forgot-password">Forgot Password?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="/register">Create an Account!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
</body>
<jsp:include page="layout/script.jsp"></jsp:include>
</html>

