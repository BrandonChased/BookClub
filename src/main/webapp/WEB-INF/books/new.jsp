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
        <form:form action="/books" modelAttribute="book" method="post" class="mt-5">
            <form:hidden path="user" value="${userId}"></form:hidden>
            <div class="d-flex justify-content-around align-items-center">
                <h2 class="mb-5">Add a book to Your Shelf</h2>
                <a href="/books">back to the shelves</a>
            </div>
            <div class="form-control mb-3 d-flex">
                <div class="d-flex flex-column" style="width: 50%;">
                    <form:label path="title">Title : </form:label>
                    <form:errors class="errors" path="title"/>
            </div>
            <form:input style="width: 50%;" path="title" />
            </div>
            <div class="form-control mb-3 d-flex">
                <div class="d-flex flex-column" style="width: 50%;">
                    <form:label style="width: 50%;" path="author">Author : </form:label>
                    <form:errors class="errors" path="author"/>
                </div>
                <form:input style="width: 50%;" path="author" />
            </div>
            <div class="form-control mb-3 d-flex">
                <div class="d-flex flex-column" style="width: 50%;">
                    <form:label style="width: 50%;" path="myThoughts">My Thoughts : </form:label>
                    <form:errors class="errors" path="myThoughts"/>
                </div>
                <form:textarea style="width: 50%;" path="myThoughts" />
            </div>
            <button class="btn btn-primary">Submit</button>
        </form:form>
    </div>
</body>
</html>