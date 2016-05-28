<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mountain Market</title>
    <link rel="stylesheet" href="/styles/hello.css"/>
</head>
<body ng-controller="MainCtrl">
    <div id="page" class="no-display">
        <%@include file="partials/header.jsp" %>
        <main class="container">
            <div class="hello white-text">
                <h1>Welcome to Mountain Market!</h1>
                <h3>We will help you to find the best trip</h3>
                <a  href="/tour/all" class="waves-effect waves-light btn-large white-text green darken-2">Start my journey</a>
            </div>
        </main>
        <%@include file="partials/footer.jsp" %>
    </div>
    <%@include file="partials/preloader.jsp" %>
</body>
</html>