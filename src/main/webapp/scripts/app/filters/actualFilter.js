define(['./module'], function(filters){
    filters.filter('actualFilter',function(){
        return function(tours, actualOnly){
            if(!actualOnly) {
                return tours;
            }
            var filtered = [];
            angular.forEach(tours, function(tour) {
                var tourTime = new Date(tour.startDate.year, tour.startDate.month-1, tour.startDate.day, 0, 0, 0, 0).getTime();
                if( new Date().getTime() < tourTime) {
                    filtered.push(tour);
                }
            });
            return filtered;
        };
    });
})