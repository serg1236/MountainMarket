define(['./module'],function(controllers){
    'use strict';
    controllers.controller('PlaceCtrl', ['$scope','$timeout','$http','fb','imageService','Upload', function($scope, $timeout, $http, fb, imageService, Upload) {

    initMap();

    function initMap() {
        var myLatlng = {lat: 48.3959259, lng: 23.9243141};

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 9,
            center: myLatlng
        });

        var marker;

        function placeMarker(location) {
            if ( marker ) {
                marker.setPosition(location);
            } else {
                marker = new google.maps.Marker({
                    position: location,
                    map: map
                });
            }
        }

        google.maps.event.addListener(map, 'click', function(event) {
            placeMarker(event.latLng);
            $scope.lat = event.latLng.lat();
            $scope.lng = event.latLng.lng();
            $scope.$apply();
        });
      }

    }]);
});