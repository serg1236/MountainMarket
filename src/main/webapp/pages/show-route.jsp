<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="/styles/route.css"/>
    <title>Mountain Market</title>
</head>
<body ng-controller="MainCtrl">
    <div id="page" class="no-display">
        <%@include file="partials/header.jsp" %>
        <main class="container" ng-controller="ShowRouteCtrl">
            <div class="row">
                <h3>${route.names.EN}</h3>
                <div id="map" data-routeId="${route.id}" class="map"></div>
                <div class="description">
                    <p>${route.infos.EN}</p>
                <div>
                <h5>Complexity: <span class="${route.complexity}">${route.complexity}</span></h5>
                <h5>Places to visit:</h5>
                <div class="row">
                    <c:forEach var="place" items="${route.places}">
                        <div class="col s6 m3">
                            <div class="card">
                                <div class="card-image">
                                    <img src="${place.imgUrl}">
                                    <span class="card-title">${place.names.EN}</span>
                                </div>
                                <div class="card-action">
                                    <a href="/place/${place.lat}/${place.lng}">More info</a>
                                </div>
                            </div>
                        </div>
                  </c:forEach>
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