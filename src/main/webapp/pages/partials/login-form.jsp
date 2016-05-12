<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    <div id="login-form" class="modal">
        <div class="modal-content">
            <h4>Login</h4>
            <div class="input-field">
                <i class="material-icons prefix">account_circle</i>
                <input id="icon_prefix" type="text" class="validate">
                <label for="icon_prefix">Login or email</label>
            </div>
            <div class="input-field">
                <i class="material-icons prefix">vpn_key</i>
                <input id="icon_telephone" type="tel" class="validate">
                <label for="icon_telephone">Password</label>
            </div>
        </div>
        <div class="modal-footer">
            <a href="#!" class="modal-action modal-close waves-effect waves-green btn light-green darken-3">Login</a>
            <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
        </div>
    </div>
</body>