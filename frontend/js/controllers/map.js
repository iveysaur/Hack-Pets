PetsApp.controller("mapController", function($scope, $routeParams, $http) {
    $scope.map = Maps[~~$routeParams.id];
    $scope.goto = function(zone) {
        location.href = "#" + zone.href;
    };
});
