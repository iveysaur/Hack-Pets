PetsApp.controller("shopController", function($scope, $routeParams, $http) {
    $scope.shop = {
        greeting: "Hello, buy stuff.",
        image: {
            src: "img/pets/octocat.png",
            alt: "Octopus Kitten"
        },
        items: [
            {
                name: "Kitten food",
                id: 1,
                image: "img/items/kitten_food.jpg",
                price: 400
            },
            {
                name: "Can of Biss",
                id: 2,
                image: "img/items/can.jpg",
                price: 400
            }
        ]
    };
    $scope.buy = function(item) {
        $http.get('/api/buy/' + $routeParams.id + '/' + item.id)
            .success(function(data) {
                $scope.shop = data;
            });
    };
});
