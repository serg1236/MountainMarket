define(['./module'],function(controllers){
    'use strict';
    controllers.controller('ShowRouteCtrl', ['$scope','$timeout','$http','fb','imageService','Upload', function($scope, $timeout, $http, fb, imageService, Upload) {

     var directionsService = new google.maps.DirectionsService;
     var directionsDisplay = new google.maps.DirectionsRenderer;
     var map;


    initMap();

    function initMap() {

        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 9
        });

        var id = $('#map').attr('data-routeId');

        $http({
            url: '/place/all/'+id,
            method: 'GET',
            data: $scope.data
        }).success(function(data) {
            calculateAndDisplayRoute(data);
        }).error(function(data) {
            console.log("ERROR");
        });

        directionsDisplay.setMap(map);

    }

    function calculateAndDisplayRoute(places) {

        var waypoints = places.slice(1, places.length - 1).map(function(place) {
            return {
                location: {
                    lat: parseFloat(place.lat),
                    lng: parseFloat(place.lng)
                },
                stopover: false
            };
        });
        var origin = {lat: parseFloat(places[0].lat), lng: parseFloat(places[0].lng)};
        var destination = {lat: parseFloat(places[places.length - 1].lat), lng: parseFloat(places[places.length - 1].lng)};
        directionsService.route({
            origin: origin,
            destination: destination,
            waypoints: waypoints,
            travelMode: google.maps.TravelMode.WALKING
        }, function(response, status) {
            if (status === google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            } else {
                buildFuzzyWay(places);
                console.log('Directions request failed due to ' + status);
            }
        });
    }

    function buildFuzzyWay(places) {
        var vertexes = places.map(function(place) {
            return {
                lat: parseFloat(place.lat),
                lng: parseFloat(place.lng)
            };
        });
        map.setCenter(vertexes[(vertexes.length/2).toFixed()]);
        map.setZoom(9);
        var fuzzyWay = new google.maps.Polyline({
            path: vertexes,
            geodesic: true,
            strokeColor: '#FF0000',
            strokeOpacity: 1.0,
            strokeWeight: 2
        });

        fuzzyWay.setMap(map);
        for(var i = 0; i < vertexes.length; i++) {
            var marker = new google.maps.Marker({
                position: vertexes[i],
                map: map
            });
        }
    }

    }]);
});