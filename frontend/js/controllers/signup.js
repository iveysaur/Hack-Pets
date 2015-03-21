PetsApp.controller("signupController", function($scope, $routeParams, $http) {
    $scope.form = {};
	$scope.error = "";

    $scope.signup = function() {
        $http.post('/api/user/signup', $scope.form).success(function(data) {
            console.log(data);
			if (data.status == true) {
				location.href = "#/";
			} else {
				$scope.error = "Something went wrong.";
			}
        });
    };
});

