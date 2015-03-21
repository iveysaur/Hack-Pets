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
        .when('/slots', {
                templateUrl: 'templates/slots.html',
                controller: 'slotsController'
        })
        .when('/inventory', {
                templateUrl: 'templates/inventory.html',
                controller: 'inventoryController'
        })
        .when('/shop/:id', {
                templateUrl: 'templates/shop.html',
                controller: 'shopController'
        })
        .when('/npcshop/:id', {
                templateUrl: 'templates/shop.html',
                controller: 'shopController'
        })
        .when('/user', {
                templateUrl: 'templates/user.html',
                controller: 'userController'
        });
});
PetsApp.controller('siteController', function($rootScope) {
    $rootScope.getItem = function(item) {
        return window.Items[item];
    };
    $rootScope.goHome = function() {
            location.href = "#/";
    };
	get("/api/user/points", function(data) {
		$rootScope.points = data;
		$rootScope.$apply();
	});
});
PetsApp.config(function ($routeProvider, $httpProvider) {
        $httpProvider.defaults.withCredentials = true;
});

