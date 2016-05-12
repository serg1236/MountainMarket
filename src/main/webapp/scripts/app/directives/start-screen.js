define(['./module'],function(directives){
	directives.directive('startScreen', function($timeout){
		  return{
		    restrict: 'E',
		    templateUrl: '/scripts/app/directives/start-screen.html',
		    link: function(scope, element, attr){
		    	
		    }
		  }
		});
})