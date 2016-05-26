<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
    <div id="tour-form" class="modal">
        <form ng-controller="TourCtrl" method="POST" ng-submit="saveTour($event)">
            <div class="modal-content">
                <h3>Create tour</h3>
                <div class="input-field">
                    <input id="name" name="name" type="text"  ng-model="data.names.EN" required="true">
                    <label for="name">Tour name</label>
                </div>
                <div class="date-range row">
                    <div class="input-field col s6">
                        <input id="startDate" input-date name="startDate" format="yyyy-mm-dd" ng-model="data.startDate" required="true">
                        <label for="startDate">Start date</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="endDate" input-date format="yyyy-mm-dd" name="endDate" ng-model="data.endDate" required="true">
                        <label for="endDate">End date</label>
                    </div>
                </div>
                <div class="date-range row">
                    <div class="input-field col s6">
                        <input id="price" type="number" name="price" min="1" ng-model="data.price" required="true">
                        <label for="price">Price</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="capacity" type="number" min="1" max="100" name="capacity" ng-model="data.capacity" required="true">
                        <label for="capacity">Capacity</label>
                    </div>
                </div>
                <div class="input-field">
                    <select name="route" id="route-select" required="true" ng-model="data.route"
                    ng-options="option.names.EN for option in routes track by route.id" ng-model="data.route" required="true">
                    </select>
                </div>
                <div class="input-field">
                    <textarea name="description" id="description" class="materialize-textarea" ng-model="data.infos.EN"
                        oninvalid="setCustomValidity('Please, enter description')" onchange="try{setCustomValidity('')}catch(e){}"  required="true"></textarea>
                    <label for="description">Description</label>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn waves-effect waves-light login" type="submit">Create tour
                </button>
                <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
                <p class="red-text">{{uploadError}}</p>
            </div>
        </form>
    </div>
</body>