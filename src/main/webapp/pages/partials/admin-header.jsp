<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
    <nav class="light-green darken-4 admin-nav" role="navigation">
        <div class="nav-wrapper container">
            <ul class="right header-menu">
                <li ><a href="#tour-form" class="btn-flat white-text modal-trigger">Create tour</a></li>
                <li ><a href="/admin/route/create" class="btn-flat white-text">Create route</a></li>
                <li ><a href="/admin/place/create" class="btn-flat white-text">Create place</a></li>
            </ul>
        </div>
    </nav>
    <%@include file="tour-modal.jsp" %>
</body>