PetsApp.controller("petCreateController", function($scope, $routeParams, $http) {
	$scope.pets = Pets;
	$scope.chosen = null
	$scope.form = {};

	console.log($scope.pets);

	$scope.choosePet = function (index) {
		$scope.form = {};
		console.log($scope.pets[index]);
		$scope.chosen = $scope.pets[index];
	}

	$scope.createPet = function() {
		$scope.form.id = $scope.chosen.id;
		$scope.form.userId = document.cookie.split(',')[0].substr(2);
		console.log($scope.form);
		$http.post('/api/pet/create', $scope.form).success(function(data) {
			console.log(data);
		});
	}
});
