<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body >
    <div id="login-form" class="modal">
        <form ng-controller="LoginCtrl" action="<c:url value='/login_to_app' />" method="POST" ng-submit="loginSubmit($event)">
            <div class="modal-content">
                <h3>Login</h3>
                <div class="input-field">
                    <i class="material-icons prefix">account_circle</i>
                    <input id="login" name="login" type="text" ng-model="data.login" ng-change="loginChanged()" required="true">
                    <label for="login">Login or email</label>
                </div>
                <div class="input-field">
                    <i class="material-icons prefix">vpn_key</i>
                    <input id="password" type="password" name="password" ng-model="data.password" ng-change="loginChanged()" required="true">
                    <label for="password">Password</label>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <a href="/register" class="register-link black-text">Do not have account yet?</a>
            </div>
            <div class="modal-footer">
                <div class="login-error-message red-text" ng-show="loginError">Invalid username or password</div>
                <button class="btn waves-effect waves-light login" type="submit">Login
                </button>
                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
            </div>
        </form>
    </div>
</body>