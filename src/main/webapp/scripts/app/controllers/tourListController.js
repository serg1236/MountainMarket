define(['./module'],function(controllers){
    'use strict';
    controllers.controller('TourListCtrl', ['$scope','$timeout','$http','fb','imageService','Upload',
    function($scope, $timeout, $http, fb, imageService, Upload) {

    $scope.data = {};




    $http({
        url: '/current-user',
        method: 'GET'
    }).success(function(data) {
        $scope.currentUser = data;
        $http({
            url: '/tour/all.rest',
            method: 'GET'
        }).success(function(data) {
            $scope.tours = data;
            $scope.maxPrice = Math.max(...data.map(function(tour) {
                return tour.price;
            }));
            $timeout(function(){
                $scope.priceRange = $scope.maxPrice;
            });
        });
    });

    function convertDate(date) {
        var dateArr = date.split('-');
        var localDate = {};
        localDate.year = dateArr[0];
        localDate.month = dateArr[1];
        localDate.day = dateArr[2];
        return localDate;
    }

    $scope.orderCondition = function(tour) {
        if($scope.orderType == 'date') {
            return new Date(tour.startDate.year, tour.startDate.month-1, tour.startDate.day, 0, 0, 0, 0).getTime();
        } else if ($scope.orderType == 'name') {
            return tour.names.EN;
        } else {
            return tour.price;
        }
    }

    $scope.feedbackModal = function (tour) {
        $("#feedback-modal").openModal();
        $scope.tourForFeedback = tour;
    }

    $scope.saveFeedback = function($event) {
        if(!$scope.tourForFeedback.feedbacks) {
            $scope.tourForFeedback.feedbacks = [];
        }
        $scope.tourForFeedback.feedbacks.push($scope.feedbackData);
        $http({
            url: '/tour/new-feedback',
            method: 'PUT',
            data: $scope.tourForFeedback,
            transformResponse: undefined
        }).success(function(data) {
            //$('#tour-form').closeModal();
        }).error(function(data) {
            console.log("ERROR"+data);
        });
    }

    $scope.getNumber = function(num) {
        return new Array(num);
    }

    $scope.addToCart = function(tour) {
        tour.participants.push($scope.currentUser);
        $http({
            url: '/cart',
            method: 'PUT',
            data: tour,
            transformResponse: undefined
        }).success(function(data) {
            //location.reload();
        }).error(function(data) {
            console.log("ERROR"+data);
        });
    }

    $scope.removeFromCart = function(tour) {
        var index = tour.participants.indexOf($scope.currentUser);
        tour.participants.splice(index, 1);
        $http({
            url: '/cart',
            method: 'PUT',
            data: tour,
            transformResponse: undefined
        }).success(function(data) {
            //location.reload();
        }).error(function(data) {
            console.log("ERROR"+data);
        });
    }

    $scope.checkInCart = function(tour) {
        for(var i = 0 ; i < tour.participants.length; i++) {
            if(tour.participants[i].login == $scope.currentUser.login) {
                return true;
            }
        }
        return false;
    }

    $scope.sendRequest = function($event) {
        $scope.requestData.startDate = convertDate($scope.requestData.startDate);
        $scope.requestData.endDate = convertDate($scope.requestData.endDate);
        $scope.requestData.author = $scope.currentUser;
        $http({
            url: '/request/new',
            method: 'POST',
            data: $scope.requestData,
            transformResponse: undefined
        }).success(function(data) {
            $('#request-form').closeModal();
        }).error(function(data) {
            if(data) {
                $scope.uploadError = data;
            }
            else {
                $scope.requestError = "Unknown error";
            }
            console.log("ERROR");
        });
    }

    $scope.showParticipants = function(tour) {
        $scope.tourForParticipants = tour;
        $("#participants-modal").openModal();
    }

    function convertDate(date) {
        var dateArr = date.split('-');
        var localDate = {};
        localDate.year = dateArr[0];
        localDate.month = dateArr[1];
        localDate.day = dateArr[2];
        return localDate;
    }

    }]);


});