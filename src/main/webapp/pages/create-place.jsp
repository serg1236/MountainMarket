<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="/styles/place.css"/>
    <title>Mountain Market</title>
</head>
<body ng-controller="MainCtrl">
    <div id="page" class="no-display">
        <%@include file="partials/header.jsp" %>
        <main class="container">
            <div class="row" ng-controller="PlaceCtrl">
                <!--оголошення колонки 50% на великому екрані 100% на малому-->
                <div class="col s12 m6">
                    <h3>Add new place</h3>
                    <form id="place-form" method="post" ng-submit="submit($event)">
                        <div class="input-field">
                            <i class="material-icons prefix">label_outline</i>
                            <input id="name" name="name" type="text" ng-model="data.names.EN" ng-change="placeChanged()"
                                oninvalid="setCustomValidity('Please, enter name')" onchange="try{setCustomValidity('')}catch(e){}"  required="true">
                            <label for="name">Name</label>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">comment</i>
                            <textarea name="description" id="description" class="materialize-textarea" ng-model="data.infos.EN" ng-change="placeChanged()"
                                oninvalid="setCustomValidity('Please, enter description')" onchange="try{setCustomValidity('')}catch(e){}"  required="true"></textarea>
                            <label for="description">Description</label>
                        </div>
                        <div class="row">
                            <!--оголошення колонки 50% на великому екрані 100% на малому-->
                            <div class="col s12 m6">
                                <div class="file-field input-field image-select">
                                    <div class="btn light-green darken-1">
                                        <span>Image</span>
                                        <input type="file" ngf-select ng-model="picFile" accept="image/*">
                                    </div>
                                    <div class="file-path-wrapper">
                                        <input class="file-path validate" type="text">
                                    </div>
                                </div>
                            </div>
                            <!--оголошення колонки 50% на великому екрані 100% на малому-->
                            <div class="col s12 m6">
                                <img ngf-thumbnail="picFile" class="thumb">
                                <img ng-show="!picFile" class="thumb" src="/images/image-placeholder.png">
                            </div>
                        </div>
                        <button class="register-submit btn waves-effect waves-light light-green darken-1" type="submit">Create place
                        </button>
                        <input type="hidden" value="{{data.lat}}" name="lat" required="true">
                        <input type="hidden" value="{{data.lng}}" name="lng" required="true">
                        <input type="hidden" value="{{data.imgUrl}}" name="lng" required="true">
                    </form>
                </div>
                <!--оголошення колонки 50% на великому екрані 100% на малому-->
                <div class="col s12 m6">
                    <div id="map" class="map"></div>
                    <p ng-hide="!lat"><span>{{lat}}</span> : <span>{{lng}}</span></p>
                </div>
            </div>
        </main>
        <%@include file="partials/footer.jsp" %>
    </div>
    <%@include file="partials/preloader.jsp" %>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_e5MGPMXRNHm6eiYKrdYQNS2lz975_wo">
    </script>

    <div id="upload-error" class="modal">
        <div class="modal-content">
            <h5>{{placeError}}</h5>
        </div>
        <div class="modal-footer">
            <a href="#!" class="modal-action modal-close waves-effect waves-green btn">Ok</a>
        </div>
    </div>
</body>
</html>