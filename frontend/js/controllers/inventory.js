PetsApp.controller("inventoryController", function($scope) {
    get("/api/inventory/list", function(data) {
        $scope.items = data;
        $scope.$apply();
    });
});
