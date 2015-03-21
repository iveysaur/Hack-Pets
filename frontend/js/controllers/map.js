PetsApp.controller("mapController", function($scope, $routeParams, $http) {
    $scope.map = Maps[0];
    $scope.goto = function(zone) {
        location.href = "#" + zone.href;
    };
});
