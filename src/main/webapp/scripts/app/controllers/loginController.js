define(['./module'], function (controllers) {
    'use strict';
    controllers.controller('LoginCtrl', ['$scope', '$timeout', '$http', 'fb', 'imageService', function ($scope, $timeout, $http, fb, imageService) {
        $scope.checkSuccess = false;
        $scope.loginSubmit = function ($event) {
            if (!$scope.checkSuccess) {
                $http({
                    url: '/login-check',
                    method: 'POST',
                    data: $scope.data
                }).then(function () {
                    console.log("OK");
                    $scope.checkSuccess = true;
                    $timeout(function() { angular.element('#login-form>form').submit(); }, 0, false);
                }, function () {
                    console.log("ERROR");
                    $scope.loginError = true;
                });
                    $event.preventDefault();
            }
        };

        $scope.loginChanged = function () {
            $scope.loginError = false;
        };
	}]);
})
