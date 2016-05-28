define(['./module'],function(controllers){
    'use strict';
    controllers.controller('RequestListCtrl', ['$scope','$timeout','$http','fb','imageService','Upload', function($scope, $timeout, $http, fb, imageService, Upload) {

    $scope.data = {};

    $http({
        url: '/request',
        method: 'GET'
    }).success(function(data) {
        $scope.requests = data;
    });

    $scope.deleteRequest = function(request) {
        $http({
            url: '/admin/requests/'+request.id,
            method: 'DELETE',
            transformResponse: undefined
        }).success(function(data) {
            $scope.requests.splice($scope.requests.indexOf(request), 1);
        });
    }

    }]);




});