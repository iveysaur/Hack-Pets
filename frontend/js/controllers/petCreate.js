PetsApp.controller("petCreateController", function($scope) {
	$scope.pets = Pets;
	$scope.chosen = null
	$scope.form = {};

	$scope.choosePet = function (index) {
		$scope.form = {};
		$scope.chosen = $scope.pets[index];
	}

	$scope.createPet = function() {
		$scope.form.id = $scope.chosen.id;
		$scope.form.userId = document.cookie.split(',')[0].substr(2);
		post('/api/pet/create', $scope.form, function(data) {
			console.log(data);
		})
	}
});
