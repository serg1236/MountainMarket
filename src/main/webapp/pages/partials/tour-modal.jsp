<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
    <div id="tour-form" class="modal">
        <form ng-controller="TourCtrl" method="POST" ng-submit="createTour($event)">
            <div class="modal-content">
                <h3>Create tour</h3>
                <div class="input-field">
                    <input id="name" name="name" type="text"  ng-model="data.names.EN" required="true">
                    <label for="name">Tour name</label>
                </div>
                <div class="date-range row">
                    <div class="input-field col s6">
                        <input id="startDate" type="date" name="startDate" class="datepicker" ng-model="data.startDate" required="true">
                        <label for="startDate">Start date</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="endDate" type="date" name="endDate" class="datepicker" ng-model="data.endDate" required="true">
                        <label for="endDate">End date</label>
                    </div>
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
            </div>
        </form>
    </div>
</body>