PetsApp.controller("shopController", function($scope, $routeParams, $http) {
    $scope.shop = {
        greeting: "Hello, buy stuff.",
        image: {
            src: "img/pets/octocat.png",
            alt: "Octopus Kitten"
        },
        items: [
            {
                id: 0,
                item_id: 0,
                price: 40000
            },
            {
                id: 1,
                item_id: 1,
                price: 400
            },
            {
                id: 2,
                item_id: 2,
                price: 400
            }
        ]
    };

    for (var i = 0; i < $scope.shop.items.length; i++) {
        $scope.shop.items[i].item = Items[$scope.shop.items[i].item_id];
    }

    $scope.buy = function(item) {
        $http.get('/api/buy/' + $routeParams.id + '/' + item.id)
            .success(function(data) {
                $scope.shop = data;
            });
    };
});
