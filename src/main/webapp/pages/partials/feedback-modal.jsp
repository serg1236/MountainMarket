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
<div id="feedback-modal" class="modal bottom-sheet">
    <div class="modal-content">
        <h4>Feedback</h4>
        <sec:authorize access="isAuthenticated()">
        <form ng-submit="saveFeedback($event)" method="POST">
            <div class="input-field">
                <input id="text" name="text" type="text"  ng-model="feedbackData.text" required="true">
                <label for="text">Leave your feedback here</label>
            </div>
            <fieldset class="rating">
                <input type="radio" id="star5" ng-model="feedbackData.rating" name="rating" value="5" class="reset-this"/><label class = "full reset-this" for="star5" title="Awesome - 5 stars" required="true"></label>
                <input type="radio" id="star4" ng-model="feedbackData.rating" name="rating" value="4" class="reset-this"/><label class = "full reset-this" for="star4" title="Pretty good - 4 stars" required="true"></label>
                <input type="radio" id="star3" ng-model="feedbackData.rating" name="rating" value="3" class="reset-this"/><label class = "full reset-this" for="star3" title="Meh - 3 stars" required="true"></label>
                <input type="radio" id="star2" ng-model="feedbackData.rating" name="rating" value="2" class="reset-this"/><label class = "full reset-this" for="star2" title="Kinda bad - 2 stars" required="true"></label>
                <input type="radio" id="star1" ng-model="feedbackData.rating" name="rating" value="1" class="reset-this"/><label class = "full reset-this" for="star1" title="Sucks big time - 1 star" required="true"></label>
            </fieldset>
            <button class="btn waves-effect waves-light login" type="submit">Leave feedback
            </button>
        </form>
        </sec:authorize>
        <ul class="collection">
            <li class="collection-item avatar" ng-repeat="feedback in tourForFeedback.feedbacks | orderBy: '-'" >
                <i class="material-icons circle">perm_identity</i>
                <span class="title green-text">{{feedback.author.login}}</span>
                <p>{{feedback.text}}</p>
                <div class="secondary-content">
                    <a href="#!" ng-repeat="i in getNumber(1*feedback.rating) track by $index" class=" green-text"><i class="material-icons">grade</i></a>
                    <a href="#!" ng-repeat="i in getNumber(5-feedback.rating) track by $index" class="grey-text"><i class="material-icons">grade</i></a>
                </div>
            </li>
        </ul>
    </div>
</div>
</body>