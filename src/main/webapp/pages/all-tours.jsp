<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mountain Market</title>
    <link rel="stylesheet" href="/styles/tour-list.css"/>
</head>
<body ng-controller="MainCtrl">
    <div id="page" class="no-display">
        <%@include file="partials/header.jsp" %>
        <main class="container" ng-controller="TourListCtrl">
            <div class="row">
                <h3>Tours</h3>
            </div>
            <div class="row">
                <div class="filters col l3 m4 s12">
                    <div class="input-field">
                        <input id="search" type="search" ng-model="search">
                        <label for="search"><i class="material-icons">search</i></label>
                    </div>
                    <h5>Order by:</h5>
                    <form>
                        <p>
                            <input type="radio" id="date-radio"  name="order-group" ng-model="orderType" value="date"/>
                            <label for="date-radio">Date</label>
                        </p>
                        <p>
                            <input type="radio" id="price-radio" name="order-group" ng-model="orderType" value="price"/>
                            <label for="price-radio">Price</label>
                        </p>
                        <p>
                            <input type="radio" id="name-radio"  name="order-group" ng-model="orderType" value="name"/>
                            <label for="name-radio">Name</label>
                        </p>
                        <p>
                            <input type="checkbox" id="desc" ng-model="orderDesc"/>
                            <label for="desc">Descending</label>
                        </p>
                        <p class="range-field">
                            <input type="range" id="range-input" min="0" max="{{maxPrice}}" ng-model="priceRange"/>
                            <label for="range-input">Max price</label>
                        </p>
                        <p>
                            <input type="checkbox" id="actual" ng-model="actual"/>
                            <label for="actual">Actual only</label>
                        </p>
                        <p>
                            <input type="checkbox" id="free" ng-model="free"/>
                            <label for="free">Free places available</label>
                        </p>
                        <sec:authorize access="isAuthenticated()">
                            <p>
                                <input type="checkbox" id="cart" ng-model="cart"/>
                                <label for="cart"><i class="tiny material-icons">shopping_cart</i> Booked by me</label>
                            </p>
                        </sec:authorize>
                    </form>
                </div>
                <div class="col l9 m8 s12">
                    <div class="card light-green darken-3" ng-repeat="tour in tours | orderBy: orderCondition:orderDesc | filter:search | priceFilter:priceRange | actualFilter:actual | freeFilter:free |cartFilter:cart:currentUser track by $index " >
                        <div class="card-content white-text row">
                            <div class="col l4 m4 hide-on-small-and-down">
                                <img ng-if="tour.route.places[0].imgUrl" class="tour-image" ng-src="{{tour.route.places[0].imgUrl}}"/>
                                <img ng-if="!tour.route.places[0].imgUrl" class="tour-image" src="http://res.cloudinary.com/imagine/image/upload/v1464370838/m-montagne_v5vwrz.jpg"/>
                            </div>
                            <div class="col l8 m8 s12">
                                <span class="card-title">{{tour.names.EN}}<span class="secondary-content light-green-text text-lighten-2">{{tour.price}} UAH</span></span>
                                <p class="yellow-text tour-metadata"><i class="tiny material-icons">today</i> {{tour.startDate.day}}.{{tour.startDate.month}}.{{tour.startDate.year}} - {{tour.endDate.day}}.{{tour.endDate.month}}.{{tour.endDate.year}}</p>
                                <p class="white-text tour-metadata"><i class="tiny material-icons">supervisor_account</i> {{tour.participants? tour.participants.length: 0}} / {{tour.capacity}}</p>
                                <p class="tour-description">{{tour.infos.EN}}</p>
                            </div>
                        </div>
                        <div class="card-action">
                            <a href="/route/{{tour.route.id}}" class="secondary-content"><i class="tiny material-icons">location_on</i>Show route</a>
                            <sec:authorize access="isAuthenticated()">
                                <a href="#" class="secondary-content white-text" ng-click="addToCart(tour)" ng-if="(!checkInCart(tour)) && (!tour.participants||tour.capacity>tour.participants.length)">
                                    <i class="tiny material-icons">shopping_cart</i>
                                Book place</a>
                                <a href="#" ng-if="checkInCart(tour)" class="secondary-content white-text" ng-click="removeFromCart(tour)">
                                    <i class="tiny material-icons">delete</i>
                                Cancel booking</a>
                            </sec:authorize>
                            <a href="#" class="secondary-content white-text" ng-click="feedbackModal(tour)"><i class="tiny material-icons">thumbs_up_down</i> Feedback</a>
                        </div>
                    </div>
                </div>
            </div>
            <sec:authorize access="isAuthenticated()">
            <div class="fixed-action-btn">
                <a href="#request-form" class="btn-floating btn-large waves-effect waves-light red modal-trigger"><i class="material-icons">mode_edit</i></a>
            </div>
            </sec:authorize>
            <%@include file="partials/request-modal.jsp" %>
            <%@include file="partials/feedback-modal.jsp" %>
        </main>
        <%@include file="partials/footer.jsp" %>
    </div>
    <%@include file="partials/preloader.jsp" %>
</body>
</html>