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
            <div class="row">
                <div class="col s12 l8">
                    <h3>Create account</h3>
                    <form id="register-form" method="post" ng-controller="RegisterCtrl" ng-submit="registerSubmit($event)" action="/register/new">
                        <div class="input-field">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="login" name="login" type="text" ng-model="data.login" ng-change="registerChanged()"
                                oninvalid="setCustomValidity('Please, enter login')" onchange="try{setCustomValidity('')}catch(e){}"  required="true">
                            <label for="login">Login</label>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">email</i>
                            <input id="login" name="email" type="email" ng-model="data.email" ng-change="registerChanged()"
                                oninvalid="setCustomValidity('Please, enter correct email')" onchange="try{setCustomValidity('')}catch(e){}"  required="true">
                            <label for="login">Email</label>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">vpn_key</i>
                            <input id="password" type="password" name="password" ng-model="data.password" ng-change="registerChanged()" required="true">
                            <label for="password">Password</label>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">vpn_key</i>
                            <input id="re-password" type="password" ng-model="data.rePassword" ng-change="registerChanged()" required="true">
                            <label for="password">Repeat password</label>
                        </div>
                        <button class="register-submit btn waves-effect waves-light login" type="submit">Create account
                        </button>
                        <div class="register-error-message red-text" ng-show="registerError">User with such login or email exists already</div>
                        <div class="register-error-message red-text" ng-show="passwordsError">Password inputs are different</div>
                    </form>
                </div>
            </div>
        </main>
        <%@include file="partials/footer.jsp" %>
    </div>
    <%@include file="partials/preloader.jsp" %>
</body>
</html>