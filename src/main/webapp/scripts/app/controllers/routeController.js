define(['./module'],function(controllers){
    'use strict';
    controllers.controller('RouteCtrl', ['$scope','$timeout','$http','fb','imageService','Upload', function($scope, $timeout, $http, fb, imageService, Upload) {

    var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;
    $scope.data = {};
    $scope.data.chosenPlaces = [];
    var map;
    var fuzzyWay;
    var markers = [];
    initMap(48.3959259, 23.9243141);
    $("#complexity-select").material_select();


    function initMap(lat, lng) {
        console.log(lat+' : '+lng);
        var myLatlng = {lat: lat, lng: lng};

         map = new google.maps.Map(document.getElementById('map'), {
            zoom: 9,
            center: myLatlng
        });

        directionsDisplay.setMap(map);

    }

    function calculateAndDisplayRoute(places) {

        if(fuzzyWay) {
            deleteFuzzyWay();
        }

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

    $scope.data.chosenPlaces = [];

    $scope.choosePlace = function($index) {
        $scope.data.chosenPlaces.push($scope.places[$index]);
        if($scope.data.chosenPlaces.length > 1) {
            calculateAndDisplayRoute($scope.data.chosenPlaces);
        }
    };

    $scope.removePlace = function($index) {
        $scope.data.chosenPlaces.splice($index, 1);
        if($scope.data.chosenPlaces.length > 1) {
            calculateAndDisplayRoute($scope.data.chosenPlaces);
        }
    }

    $http({
        url: '/place/all.rest',
        method: 'GET',
        data: $scope.data
    }).success(function(data) {
        $scope.places = data;
    }).error(function(data) {
        console.log("ERROR");
    });

    function buildFuzzyWay(places) {
        directionsDisplay.setDirections({routes: []});
        markers = [];
        var vertexes = places.map(function(place) {
            return {
                lat: parseFloat(place.lat),
                lng: parseFloat(place.lng)
            };
        });
        map.setCenter(vertexes[vertexes.length/2]);
        map.setZoom(9);
        fuzzyWay = new google.maps.Polyline({
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
            markers.push(marker);
        }
    }

    function deleteFuzzyWay() {
        fuzzyWay.setMap(null);
        for(var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    }]);


});