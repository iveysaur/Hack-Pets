var PetsApp = angular.module('petsApp', ['ngRoute']);
PetsApp.config(function($routeProvider) {
        $routeProvider.when('/', {
                templateUrl: 'templates/main.html',
                controller: 'mainController'
        })
        .when('/npc/:id', {
                templateUrl: 'templates/npc.html',
                controller: 'npcController'
        })
        .when('/pet/:id', {
                templateUrl: 'templates/pet.html',
                controller: 'petController'
        })
        .when('/create_pet', {
                templateUrl: 'templates/petCreate.html',
                controller: 'petCreateController'
        })
        .when('/map/:id', {
                templateUrl: 'templates/map.html',
                controller: 'mapController'
        })
        .when('/signup', {
                templateUrl: 'templates/signup.html',
                controller: 'signupController'
        })
        .when('/signin', {
                templateUrl: 'templates/signin.html',
                controller: 'signinController'
        })
        .when('/shop/:id', {
                templateUrl: 'templates/shop.html',
                controller: 'shopController'
        });
});
PetsApp.controller('siteController', function() {

});
PetsApp.config(function ($routeProvider, $httpProvider) {
        $httpProvider.defaults.withCredentials = true;
});

