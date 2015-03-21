PetsApp.controller("signinController", function($scope, $routeParams, $http) {
    $scope.form = {};
	$scope.error = "";

    $scope.signin = function() {
        $http.post('/api/user/signin', $scope.form).success(function(data) {
            console.log(data);
			if (data.status == true) {
				location.href = "#/";
			} else {
				$scope.error = "The username or password is incorrect.";
			}
        });
    };
});

