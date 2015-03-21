PetsApp.controller("mainController", function($scope, $http) {
    $scope.loggedIn = document.cookie != "" && document.cookie != "D=";
    $scope.userProfile = function() {
        location.href = "#/user";
    };
    $scope.signOff = function() {
        document.cookie = "";
        $http.get("/api/user/signoff").success(function() {
            window.location = "/";
        });
    };
    $scope.signUp = function() { location.href = "#/signup"; };
    $scope.signIn = function() { location.href = "#/signin"; };
});
