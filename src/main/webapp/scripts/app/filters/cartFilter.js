define(['./module'], function(filters){
    filters.filter('cartFilter',function(){
        return function(tours, cartOnly, user){
            if(!cartOnly) {
                return tours;
            }
            var filtered = [];
            angular.forEach(tours, function(tour) {
                for(var i = 0; i < tour.participants.length; i++) {
                    if(tour.participants[i].login == user.login) {
                        filtered.push(tour);
                        break;
                    }
                }
            });
            return filtered;
        };
    });
})