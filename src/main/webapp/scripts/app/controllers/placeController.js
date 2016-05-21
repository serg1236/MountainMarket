define(['./module'],function(controllers){
    'use strict';
    controllers.controller('PlaceCtrl', ['$scope','$timeout','$http','fb','imageService','Upload', function($scope, $timeout, $http, fb, imageService, Upload) {

    $scope.data = {};
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
            $scope.data.lat = event.latLng.lat();
            $scope.data.lng = event.latLng.lng();
            $scope.$apply();
        });
      }

    $scope.submit = function($event) {
        Upload.upload({
            url: '/image/upload',
            file: $scope.picFile,
            transformResponse: undefined
        }).success(function (data) {
            $scope.uploadSuccess = true;
            $scope.data.imgUrl = data;
           // $timeout(function() { angular.element('#place-form').submit(); }, 0, false);
            $http({
                url: '/admin/place/create',
                method: 'POST',
                data: $scope.data,
                transformResponse: undefined
            }).success(function(data) {
                window.location.pathname = data;
            }).error(function(data) {
                console.log("ERROR");
                $scope.placeError = data;
                $('#upload-error').openModal();
            });
            console.log("OK");
        }).error(function (data) {
            console.log("ERROR");
            $scope.placeError = data;
            $('#upload-error').openModal();
        });
    }

    }]);
});