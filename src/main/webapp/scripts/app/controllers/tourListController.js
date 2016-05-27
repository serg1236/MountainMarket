define(['./module'],function(controllers){
    'use strict';
    controllers.controller('TourListCtrl', ['$scope','$timeout','$http','fb','imageService','Upload', function($scope, $timeout, $http, fb, imageService, Upload) {

    $scope.data = {};


    $http({
        url: '/tour/all.rest',
        method: 'GET'
    }).success(function(data) {
        $scope.tours = data;
        $scope.maxPrice = Math.max(...data.map(function(tour) {
            return tour.price;
        }));
        $timeout(function(){
            $scope.priceRange = $scope.maxPrice;
        });
    });

    function convertDate(date) {
        var dateArr = date.split('-');
        var localDate = {};
        localDate.year = dateArr[0];
        localDate.month = dateArr[1];
        localDate.day = dateArr[2];
        return localDate;
    }

    $scope.orderCondition = function(tour) {
        if($scope.orderType == 'date') {
            return new Date(tour.startDate.year, tour.startDate.month, tour.startDate.day, 0, 0, 0, 0).getTime();
        } else if ($scope.orderType == 'name') {
            return tour.names.EN;
        } else {
            return tour.price;
        }
    }

    }]);


});