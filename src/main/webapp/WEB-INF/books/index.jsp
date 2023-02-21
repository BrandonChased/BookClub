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
        <nav class="d-flex justify-content-between align-items-center mt-5">
            <h1>Welcome, ${userName}</h1>
            <a href="/logout">logout</a>
        </nav>
        <div class="d-flex justify-content-between align-items-center mt-5">
            <h3>Books From everyone's shelves:</h3>
            <a href="/books/new">+ Add a book to my shelf</a>
        </div>
        <table class="table table-striped">
            <thead>
                <th>ID</th>
                <th>Title</th>
                <th>Author Name</th>
                <th>Posted By</th>
            </thead>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.id}</td>
                    <td>
                        <a href="/books/${book.id}">
                            ${book.title}
                        </a>
                    </td>
                    <td>${book.author}</td>
                    <td>${book.myThoughts}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>