<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="head.jsp" %>
</head>
<body>
    <header>
        <div class="panorama hide-on-small-and-down">
            <img src="/images/panorama.JPG"/>
        </div>
        <nav class="light-green darken-3" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="/" class="brand-logo">
                <i class="material-icons white-text">location_on</i>
                <i class="material-icons white-text">shopping_cart</i>
                    Mountain Market
                </a>
                <a href="#" data-activates="main-sidenav" class="button-collapse"><i class="material-icons">menu</i></a>
                <ul class="right hide-on-med-and-down header-menu">
                    <li ><a href="/tour/all" class="btn-flat white-text">Tours</a></li>
                    <li ><a href="/place/all" class="btn-flat white-text">Places</a></li>
                    <li ><a href="/about" class="btn-flat white-text">About</a></li>
                    <sec:authorize access="isAnonymous()">
                        <a href="#login-form" class="btn-flat white-text light-green darken-1 modal-trigger">Login</a>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <a class='dropdown-button btn light-green darken-1' href='#' data-activates='login-dropdown'>
                          <sec:authentication property="principal.username" />
                        </a>
                        <ul id='login-dropdown' class='dropdown-content'>
                            <li><a href="/logout_from_app">Logout</a></li>
                        </ul>
                    </sec:authorize>
                </ul>
                <a href="#login-form" class="login-icon hide-on-large-only right modal-trigger"><i class="material-icons">perm_identity</i></a>
                <ul class="side-nav" id="main-sidenav">
                    <li ><a href="/tour/all" class="btn-flat">Tours</a></li>
                    <li ><a href="/place/all" class="btn-flat">Places</a></li>
                    <li ><a href="/about" class="btn-flat">About</a></li>
                </ul>
            </div>
        </nav>
        <sec:authorize access="hasRole('ROLE_ADMIN')">
            <%@include file="admin-header.jsp" %>
        </sec:authorize>
    </header>
    <%@include file="login-form.jsp" %>
    <c:if test="${not empty message}" >
        <%@include file="message-modal.jsp" %>
    </c:if>
</body>