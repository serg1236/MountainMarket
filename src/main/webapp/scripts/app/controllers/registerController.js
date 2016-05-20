define(['./module'], function (controllers) {
    'use strict';
    controllers.controller('RegisterCtrl', ['$scope', '$timeout', '$http', 'fb', 'imageService', function ($scope, $timeout, $http, fb, imageService) {
        $scope.registerSubmit = function($event) {
            if(!arePasswordsEqual()) {
                $event.preventDefault();
                $scope.passwordsError = true;
                return;
            }
            if (!$scope.checkSuccess) {
                $http({
                        url: '/register/check',
                        method: 'POST',
                        data: $scope.data,
                        transformResponse: undefined
                    }).success(function (data) {
                        $scope.checkSuccess = true;
                        $timeout(function() { angular.element('#register-form').submit(); }, 0, false);
                        console.log("OK");
                    }).error(function (data) {
                        console.log("ERROR");
                        $scope.registerError = true;
                    });
                $event.preventDefault();
            }
            
        };
        
        $scope.registerChanged = function() {
            $scope.registerError = false;
            $scope.passwordsError = false;
        }
        
        function arePasswordsEqual() {
            return $scope.data.password == $scope.data.rePassword;
        }
	}]);
});