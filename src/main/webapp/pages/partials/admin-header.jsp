<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
    <nav class="light-green darken-5" role="navigation">
        <div class="nav-wrapper container">
            <ul class="right header-menu">
                <li ><a href="#tour-form" class="btn-flat white-text modal-trigger">Create tour</a></li>
                <li ><a href="/admin/create/route" class="btn-flat white-text">Create route</a></li>
                <li ><a href="/admin/create/place" class="btn-flat white-text">Create place</a></li>
            </ul>
        </div>
    </nav>
    <div id="tour-form" class="modal">
        <form ng-controller="TourCtrl" method="POST" ng-submit="createTour($event)">
            <div class="modal-content">
                <h3>Create tour</h3>
                <div class="input-field">
                    <input id="name" name="name" type="text" ng-model="data.names.EN" required="true">
                    <label for="name">Tour name</label>
                </div>
                <div class="date-range">
                    <div class="input-field">
                        <input id="startDate" type="date" name="startDate" ng-model="data.startDate" required="true">
                        <label for="startDate">Start date</label>
                    </div>
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