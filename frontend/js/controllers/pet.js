PetsApp.controller("petController", function($scope, $routeParams, $http) {
    $scope.pet = {
        name: "Jim",
        type: {
            image: "img/pets/octocat.png",
            name: "Octopus Kitty"
        },
        health: 80
    };
});
