define(['./module'],function(controllers){
	'use strict';
	controllers.controller('AdminHeaderCtrl', ['$scope','$timeout','$http','fb','imageService', function($scope, $timeout, $http, fb, imageService){
        //angular loading hack


        $http({
            url: '/request/',
            method: 'GET'
        }).success(function(data) {
            $scope.requestCount = data.length;
        });

        $http({
            url: '/admin/route/all',
            method: 'GET'
        }).success(function(data) {
            $scope.headerRoutes = data;
        });

		
		
	}]);
})