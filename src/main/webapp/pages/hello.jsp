<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mountain Market</title>
</head>
<body ng-controller="MainCtrl">
    <div id="page" class="no-display">
        <%@include file="partials/header.jsp" %>
        <main class="container">
            <h1>${message}</h1>
        </main>
        <%@include file="partials/footer.jsp" %>
    </div>
    <%@include file="partials/preloader.jsp" %>
</body>
</html>