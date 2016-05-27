define(['./module'],function(controllers){
    'use strict';
    controllers.controller('TourCtrl', ['$scope','$timeout','$http','fb','imageService','Upload', function($scope, $timeout, $http, fb, imageService, Upload) {

    $scope.data = {};


    $http({
        url: '/route/all',
        method: 'GET'
    }).success(function(data) {
        $scope.routes = data;
        $scope.data.route = data[0];
        $timeout(function() { $("#route-select").material_select(); }, 0, false);
    });


    $scope.saveTour = function($event) {
        $scope.data.startDate = convertDate($scope.data.startDate);
        $scope.data.endDate = convertDate($scope.data.endDate);
        $http({
            url: '/admin/tour/create',
            method: 'POST',
            data: $scope.data,
            transformResponse: undefined
        }).success(function(data) {
            $('#tour-form').closeModal();
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

    function convertDate(date) {
        var dateArr = date.split('-');
        var localDate = {};
        localDate.year = dateArr[0];
        localDate.month = dateArr[1];
        localDate.day = dateArr[2];
        return localDate;
    }


});