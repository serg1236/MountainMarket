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
        <main class="container" ng-controller="RequestListCtrl">
            <div class="row">
                <h3>Requests</h3>
            </div>
            <div class="row">
                <div class="card light-green darken-3" ng-repeat="request in requests | orderBy: '-' track by $index " >
                    <div class="card-content white-text row">
                        <span class="card-title">{{request.author.login}}<span style="cursor:pointer" class="secondary-content white-text" ng-click="deleteRequest(request)"><i class="material-icons">delete</i></span></span>
                        <p class="yellow-text request-metadata"><i class="tiny material-icons">today</i> {{request.startDate.day}}.{{request.startDate.month}}.{{request.startDate.year}} - {{request.endDate.day}}.{{request.endDate.month}}.{{request.endDate.year}}</p>
                        <p class="request-description">{{request.comment}}</p>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="partials/footer.jsp" %>
    </div>
    <%@include file="partials/preloader.jsp" %>
</body>
</html>