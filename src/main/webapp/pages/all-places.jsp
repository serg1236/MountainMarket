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
        <main class="container">
            <h3>Places</h3>
            <div class="row">
                <c:forEach var="place" items="${places}">
                    <a href="/place/${place.lat}/${place.lng}" href class="col s6 m3">
                        <div class="card">
                            <div class="card-image large-card">
                                <img src="${place.imgUrl}">
                                <span class="card-title">${place.names.EN}</span>
                            </div>
                            <div class="card-action">
                                <div><i class="tiny material-icons">location_on</i>Lat: ${place.lat}</div>
                                <div><i class="tiny material-icons">location_on</i>Lng: ${place.lng}</div>
                            </div>
                        </div>
                    </a>
                </c:forEach>
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