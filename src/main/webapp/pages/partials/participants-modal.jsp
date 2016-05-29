<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" />
</head>
<body >
<div id="participants-modal" class="modal">
    <div class="modal-content">
        <h4>Participants</h4>
        <ul ng-if="tourForParticipants.participants.length > 0" class="collection">
            <li class="collection-item avatar" ng-repeat="user in tourForParticipants.participants" >
                <i class="material-icons circle">perm_identity</i>
                <span class="title green-text">{{user.login}}</span>
                <p>{{user.email}}</p>
            </li>
        </ul>
        <p ng-if="!tourForParticipants.participants||tourForParticipants.participants.length == 0">No participants yet</p>
    </div>
</div>
</body>