define(['./module'], function(filters){
    filters.filter('freeFilter',function(){
        return function(tours, freeOnly){
            if(!freeOnly) {
                return tours;
            }
            var filtered = [];
            angular.forEach(tours, function(tour) {
                if( !tour.participants || !tour.participants.length < tour.capacity ) {
                    filtered.push(tour);
                }
            });
            return filtered;
        };
    });
})