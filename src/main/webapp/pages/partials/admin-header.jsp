<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
    <nav class="light-green darken-4 admin-nav" role="navigation" ng-controller="AdminHeaderCtrl">
        <div class="nav-wrapper container">
            <ul class="right header-menu">
                <li ><a href="#tour-form" class="btn-flat white-text modal-trigger">Create tour</a></li>
                <li ><a href="/admin/route/create" class="btn-flat white-text">Create route</a></li>
                <li ><a href="/admin/place/create" class="btn-flat white-text">Create place</a></li>
                <li ><a href="#!" class="btn-flat white-text dropdown-button" data-activates='routes-dropdown'>Available Routes</a>
                    <ul id='routes-dropdown' class='dropdown-content'>
                        <li ng-repeat="route in headerRoutes | orderBy: 'names.EN' track by $index"><a href="/route/{{route.id}}" ng-class="{ 'grey-text': !route.isActive}">{{route.names.EN}}</a></li>
                    </ul>
                </li>
                <li ><a href="/admin/requests" class="white-text request-chip btn-flat"><i class="material-icons small">email</i><span class="white-text">{{requestCount}}</span></a></li>
            </ul>
        </div>
    </nav>
    <%@include file="tour-modal.jsp" %>
</body>