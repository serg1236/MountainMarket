define(['./module'], function(filters){
	filters.filter('priceFilter',function(){
		  return function(tours, price){
		    var filtered = [];
           angular.forEach(tours, function(tour) {
            if( tour.price <= price) {
              filtered.push(tour);
            }
          });
          return filtered;
		  };
		});
})