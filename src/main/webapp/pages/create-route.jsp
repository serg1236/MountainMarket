<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mountain Market</title>
    <link rel="stylesheet" href="/styles/route.css"/>
</head>
<body ng-controller="MainCtrl">
    <div id="page" class="no-display">
        <%@include file="partials/header.jsp" %>
        <main class="container" ng-controller="RouteCtrl">
            <div class="row">
                <h3>Create route</h3>
            </div>
            <div class="row">
                <div class="col l3 m4 s12">
                    <h5>Available places:</h5>
                    <div class="available-places collection">
                        <a href="#!" class="collection-item light-green-text text-darken-3" ng-repeat="place in places | orderBy: 'names.EN' track by $index " ng-click="choosePlace($index)">{{place.names.EN}}</a>
                    </div>
                    <h5 ng-show="data.chosenPlaces.length > 0">Route:</h5>
                    <ul class="places collection" ng-show="data.chosenPlaces.length > 0">
                        <li class="collection-item" ng-repeat="place in data.chosenPlaces track by $index ">
                            <div>{{place.names.EN}}
                                <a href="#!" class="secondary-content" ng-click="removePlace($index)"><i class="material-icons">delete</i></a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="col s12 m4 l6">
                    <div id="map" class="map"></div>
                </div>
                <form ng-submit="saveRoute($event)">
                    <div class="col l3 m4 s12">
                        <div class="input-field">
                            <input id="name" name="name" type="text" ng-model="data.names.EN" ng-change="placeChanged()"
                                oninvalid="setCustomValidity('Please, enter name')" onchange="try{setCustomValidity('')}catch(e){}"  required="true">
                            <label for="name">Name</label>
                        </div>
                        <div class="input-field">
                            <select name="data.complexity" id="complexity-select" required="true">
                                <option value="" disabled selected>Choose route complexity</option>
                                <option value="LOW">Low</option>
                                <option value="AVERAGE">Average</option>
                                <option value="HIGH">High</option>
                                <label>Complexity</label>
                            </select>
                        </div>
                        <div class="input-field">
                            <textarea name="description" id="description" class="materialize-textarea" ng-model="data.infos.EN" ng-change="placeChanged()"
                                oninvalid="setCustomValidity('Please, enter description')" onchange="try{setCustomValidity('')}catch(e){}"  required="true"></textarea>
                            <label for="description">Description</label>
                        </div>
                        <button class="register-submit btn waves-effect waves-light light-green darken-1" type="submit">Create place
                        </button>
                    </div>
                </form>
            </div>
        </main>
        <%@include file="partials/footer.jsp" %>
    </div>
    <%@include file="partials/preloader.jsp" %>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_e5MGPMXRNHm6eiYKrdYQNS2lz975_wo">
    </script>
</body>
</html>