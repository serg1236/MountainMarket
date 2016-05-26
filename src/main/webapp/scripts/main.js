require.config({
	waitSeconds: 20,
	
	paths:{
		
		angular: './vendor/angular/angular',
		angularCookies: './vendor/angular/angular-cookies',
		angularRoute: './vendor/angular/angular-route.min',
		domReady: './vendor/requirejs/domReady',
		fileUpload: './vendor/ng-file-upload/ng-file-upload',
		ngMaterial: './vendor/ng-material/ng-material'
	}, 
	shim:{
		
		angular:{
			exports: 'angular'
		},
		
		angularCookies:{
			deps: ['angular']
		},
		
		angularRoute:{
			deps: ['angular']
		},
		
		fileUpload:{
			deps: ['angular']
		},

		ngMaterial: {
		    deps: ['angular']
		}

		
	},
	
	deps: ['./bootstrap']
});