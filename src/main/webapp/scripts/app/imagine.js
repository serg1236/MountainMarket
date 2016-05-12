define(['angular',
        'angularRoute',
        './controllers/index',
        './directives/index',
        './services/index',
        './filters/index'], 
        function(ng){
	
			var app = ng.module('imagine',[
	                        'imagine.services',
	                        'imagine.controllers',
	                        'imagine.filters',
	                        'imagine.directives',
	                        'ngRoute']);
			
			app.config(function($routeProvider){
				  $routeProvider
				  .when('/',{
				    controller: 'HomeCtrl',
				    templateUrl:'/scripts/app/views/home.html'
				  })
				  .when('/imaginations/:id',{
				   	controller: 'ImaginationCtrl',
				    templateUrl: '/scripts/app/views/imagination.html'
				  })
				  .when('/image/:id',{
				   	controller: 'ImageCtrl',
				    templateUrl: '/scripts/app/views/image.html'
				  })
				  .otherwise({
				    redirectTo: '/'
				  });
				});

			
			
			
			return app;
	
		});