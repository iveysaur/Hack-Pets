PetsApp.controller("petController", function($scope, $routeParams, $http) {
	$scope.petModel = Pets;
    get("/api/pets/pet/" + location.hash.split("/")[2], function(data) {
        $scope.pet = data;
        $scope.$apply();
    });
});
