var PetsApp = angular.module('petsApp', ['ngRoute']);
PetsApp.config(function($routeProvider) {
        $routeProvider.when('/', {
                templateUrl: 'templates/main.html',
                controller: 'mainController'
        })
        .when('/npc/:id', {
                templateUrl: 'templates/npc.html',
                controller: 'npcController'
        });
});
PetsApp.controller('siteController', function() {

});

