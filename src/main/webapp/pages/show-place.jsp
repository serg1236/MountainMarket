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
        <main class="container" ng-controller="ShowPlaceCtrl">
            <div class="row">
            <h3>${place.names.EN}</h3>
                <div class="col s12 m6">
                    <div class="image">
                        <img src="${place.imgUrl}">
                    </div>
                    <div class="description">
                        <p>${place.infos.EN}</p>
                    </div>
                    <input type="hidden" value="${place.lat}" name="lat" required="true">
                    <input type="hidden" value="${place.lng}" name="lng" required="true">
                </div>
                <div class="col s12 m6">
                    <div id="map" class="map no-margin"></div>
                </div>
            </div>
        </main>
        <%@include file="partials/footer.jsp" %>
    </div>
    <%@include file="partials/preloader.jsp" %>
    <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC_e5MGPMXRNHm6eiYKrdYQNS2lz975_wo">
    </script>
    <div id="upload-error" class="modal">
        <div class="modal-content">
            <h5>Unable to upload image. Try again.</h5>
        </div>
        <div class="modal-footer">
            <a href="#!" class="modal-action modal-close waves-effect waves-green btn">Ok</a>
        </div>
    </div>
</body>
</html>