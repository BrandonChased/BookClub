<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<style>
    .errors {
        color: red;
        font-weight: 500;
    }
</style>
<body>
    <div class="container">
        <h1 class="mb-5">Welcome!</h1>
        <h3 class="mb-5">A place for friends to share thoughts on books.</h3>
        <div class="d-flex justify-content-around">
            <div class="card" style="width: 40%;">
                <div class="card-body">
                    <form:form action="/register" modelAttribute="newUser" method="post">
                        <h2 class="mb-5">Register</h2>
                        <div class="form-control mb-3 d-flex">
                            <div class="d-flex flex-column" style="width: 50%;">
                                <form:label path="userName">Username:</form:label>
                                <form:errors class="errors" path="userName"/>
                        </div>
                        <form:input style="width: 50%;" path="userName" />
                        </div>
                        <div class="form-control mb-3 d-flex">
                            <div class="d-flex flex-column" style="width: 50%;">
                                <form:label style="width: 50%;" path="email">Email:</form:label>
                                <form:errors class="errors" path="email"/>
                            </div>
                            <form:input style="width: 50%;" path="email" />
                        </div>
                        <div class="form-control mb-3 d-flex">
                            <div class="d-flex flex-column" style="width: 50%;">
                                <form:label style="width: 50%;" path="password">Password:</form:label>
                                <form:errors class="errors" path="password"/>
                            </div>
                            <form:input style="width: 50%;" path="password" />
                        </div>
                        <div class="form-control mb-3 d-flex">
                            <div class="d-flex flex-column" style="width: 50%;">
                                <form:label style="width: 50%;" path="confirm">Confirm Password:</form:label>
                                <form:errors class="errors" path="confirm"/>
                            </div>
                            <form:input style="width: 50%;" path="confirm" />
                        </div>
                        <button class="btn btn-primary w-100">Register</button>
                    </form:form>
                </div>
            </div>
            <div class="card" style="width: 40%;">
                <div class="card-body">
                    <form:form  action="/login" method="post" modelAttribute="newLogin" class="d-flex flex-column">
                        <h2 class="mb-5">Login in</h2>
                        <div class="form-control mb-3 d-flex">
                            <div class="d-flex flex-column" style="width: 50%;">
                                <form:label style="width: 50%;" path="email">Email:</form:label>
                            </div>
                            <form:input style="width: 50%;" path="email" />
                        </div>
                        <div class="form-control mb-3 d-flex">
                            <div class="d-flex flex-column" style="width: 50%;">
                                <form:label style="width: 50%;" path="password">Password:</form:label>
                                <form:errors class="errors" path="email"/>
                                <form:errors class="errors" path="password"/>
                            </div>
                            <form:input style="width: 50%;" path="password" />
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>