define(['./module'],function(controllers){
    'use strict';
    controllers.controller('ShowPlaceCtrl', ['$scope','$timeout','$http','fb','imageService','Upload', function($scope, $timeout, $http, fb, imageService, Upload) {

    initMap();

    function initMap() {
        var lat = parseFloat($('input[name=lat]').val());
        var lng = parseFloat($('input[name=lng]').val());
        console.log(lat+' : '+lng);
        var myLatlng = {lat: lat, lng: lng};

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 9,
            center: myLatlng
        });

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map
        });

    }

    }]);
});