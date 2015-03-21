PetsApp.controller("shopController", function($scope, $routeParams, $rootScope) {
    var update = function() {
        var npc = false;
        if (location.hash.indexOf("npcshop") !== -1) {
            npc = true;
        }

        if (npc) {
            get('/api/npcshop/list/' + $routeParams.id, function(data) {
                for (var i = 0; i < data.items.length; i++) {
                    data.items[i].item = Items[data.items[i].item_id];
                }
                $scope.shop = data;
                $scope.$apply();
            });
        }
    };
    update();

    $scope.buy = function(item) {
        get('/api/npcshop/buy/' + $routeParams.id + '/' + item.id, function(result) {
            if (result) {
                $rootScope.points -= item.price;
                $rootScope.$apply();
                update();
            } else {
                alert("Insufficient funds!");
            }
        });
    };
});
