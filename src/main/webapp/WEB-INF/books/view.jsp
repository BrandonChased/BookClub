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
        <div class="d-flex align-items-center justify-content-between my-5">
            <h1 >${book.title}</h1>
            <a href="/books">back to the shelves</a>
        </div>
        <p class="h4 my-4">
            <span class="text-danger">${book.user.userName}</span> Read 
            <span class="text-warning">${book.title}</span> by 
            <span class="text-success">${book.author}</span>.
        </p>
        <p class="h4">
            Here are ${book.user.userName} thoughts:
        </p>
        <hr/>
            <p>${book.myThoughts}</p>
        <hr/>
        <div class="btns text-end mt-4 d-flex justify-content-end">
            <c:if test="${book.user.id == userId}">
                <a class="btn btn-warning" style="margin-right: 1rem;" href="/books/${book.id}/edit">edit</a>
                <form action="/books/${book.id}" method="post">
                    <input type="hidden" name="_method" value="delete">
                    <input class="btn btn-danger" type="submit" value="delete">
                </form>   
            </c:if>
        </div>
    </div>
</body>
</html>