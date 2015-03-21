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
        .when('/shop/:id', {
                templateUrl: 'templates/shop.html',
                controller: 'shopController'
        });
});
PetsApp.controller('siteController', function() {

});

