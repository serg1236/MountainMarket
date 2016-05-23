define(['./module'],function(controllers){
    'use strict';
    controllers.controller('TourCtrl', ['$scope','$timeout','$http','fb','imageService','Upload', function($scope, $timeout, $http, fb, imageService, Upload) {

    $scope.data = {};
    $scope.data.chosenPlaces = [];


    $scope.saveTour = function($event) {
        $scope.data.complexity = $('#complexity-select').val();
        $scope.data.places = $scope.data.chosenPlaces;
        $http({
            url: '/admin/route/create',
            method: 'POST',
            data: $scope.data,
            transformResponse: undefined
        }).success(function(data) {
            window.location.pathname = data;
        }).error(function(data) {
            $scope.routeError = data;
            $('#upload-error').openModal();
            console.log("ERROR");
        });
    }

    }]);


});