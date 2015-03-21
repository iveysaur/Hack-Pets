PetsApp.controller("npcController", function($scope, $routeParams, $http) {
    get("/api/npc/start/" + $routeParams.id, function(data) {
        $scope.state = data;
        $scope.$apply();
    });

    $scope.handleAction = function(action) {
        $scope.state.loading = true;
        if (action.href) {
            location.href = action.href;
            return;
        }

        get('/api/npc/action/' + $routeParams.id + '/' + action.actionId, function(data) {
                $scope.state = data;
                $scope.$apply();
        });
    };
});
