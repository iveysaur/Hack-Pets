PetsApp.controller("signupController", function($scope, $routeParams, $http) {
    $scope.form = {};

    $scope.signup = function() {
        $http.post('/api/signup', $scope.form).success(function(data) {
            console.log(data);
        });
    };
});

