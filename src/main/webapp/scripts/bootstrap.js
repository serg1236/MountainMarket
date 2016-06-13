define(['require','angular','ngMaterial','./app/imagine','pagination'], function(require,ng){
	'use strict';
	require(['domReady!'],function(document){
		ng.bootstrap(document,['imagine']);
	});
});