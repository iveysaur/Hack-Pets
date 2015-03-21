PetsApp.controller("signinController", function($scope, $routeParams, $http) {
    $scope.form = {};

    $scope.signin = function() {
        $http.post('/api/user/signin', $scope.form).success(function(data) {
            console.log(data);
        });
    };
});

