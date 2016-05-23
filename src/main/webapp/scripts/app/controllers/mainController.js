define(['./module'],function(controllers){
	'use strict';
	controllers.controller('MainCtrl', ['$scope','$timeout','$http','fb','imageService', function($scope, $timeout, $http, fb, imageService){
        //angular loading hack
        $("#page").removeClass("no-display");
        $("#preloader").addClass("no-display");
        $(".button-collapse").sideNav();
        $('.modal-trigger').leanModal();
        $('.datepicker').pickadate({
            selectMonths: true,
            selectYears: 15
        });
		
		$scope.loginToFb = function(){
			var loginPromise = fb.login();
			loginPromise.then(function(resolve){
				if(loginPromise.status==="connected"){
					$scope.loginedToFb = true;
					initUser();
				}
			});
		};

		function initUser(){
			var userPromise = fb.getUserInfo(['id','first_name','last_name']);
			userPromise.then(function(){
                  $scope.currentUser = userPromise.user;
                  $timeout(function(){
                      $scope.$broadcast('UserInit');
                  });

              });
				
		}
		
		
	}]);
})