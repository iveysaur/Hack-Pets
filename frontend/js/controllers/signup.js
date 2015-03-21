PetsApp.controller("signupController", function($scope, $routeParams, $http) {
    $scope.form = {};
	$scope.error = "";

    $scope.signup = function() {
        $http.post('/api/user/signup', $scope.form).success(function(data) {
            console.log(data);
	    console.log(data.authkey);
			document.cookie = "D=" + data.authkey;
	    console.log(document.cookie);
			if (data.status == true) {
				location.href = "#/create_pet";
			} else {
				$scope.error = "Something went wrong.";
			}
        });
    };
});

