PetsApp.controller("npcController", function($scope, $routeParams) {
    $scope.state = $scope.states[0];
    $scope.handleAction = function(action) {
        $scope.state.loading = true;
        $http.get('/api/npc/' + $routeParams.id + '/' + action.requestId)
            .success(function(data) {
                $scope.state = data;
            });
    };
});
