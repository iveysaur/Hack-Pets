PetsApp.controller("petsController", function($scope) {
	$scope.petModels = Pets;
    get("/api/pets/list", function(data) {
        $scope.pets = data;
		for (var i = 0; i < $scope.pets.length; i++) {
			dateDif = (new Date().getTime() / 1000) - $scope.pets[i].created;
			$scope.pets[i].created = Math.round(dateDif / 3600);
		}
        $scope.$apply();
    });

    $scope.newPet = function() {
	location.href = "#/create_pet";
    };
});
