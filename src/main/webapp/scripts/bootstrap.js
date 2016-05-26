define(['require','angular','ngMaterial','./app/imagine'], function(require,ng){
	'use strict';
	require(['domReady!'],function(document){
		ng.bootstrap(document,['imagine']);
	});
});