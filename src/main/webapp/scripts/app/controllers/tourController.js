define(['./module'],function(controllers){
    'use strict';
    controllers.controller('TourCtrl', ['$scope','$timeout','$http','fb','imageService','Upload', function($scope, $timeout, $http, fb, imageService, Upload) {

    $scope.data = {};
    $scope.data.chosenPlaces = [];


    $http({
        url: '/route/all',
        method: 'GET'
    }).success(function(data) {
        $scope.routes = data;
        $timeout(function() { $("#route-select").material_select(); }, 0, false);
    });


    $scope.saveTour = function($event) {
        $http({
            url: '/admin/tour/create',
            method: 'POST',
            data: $scope.data,
            transformResponse: undefined
        }).success(function(data) {
            window.location.pathname = data;
        }).error(function(data) {
            if(data) {
                $scope.uploadError = data;
            }
            else {
                $scope.uploadError = "Unknown error";
            }
            console.log("ERROR");
        });
    }

    }]);


});