PetsApp.controller("npcController", function($scope, $routeParams) {
    $scope.states = {
        0: {
            image: {
                src: "img/bacon.jpg",
                alt: "Bacon!"
            },
            description: "It's a giant omlete.",
            actions: [
                {
                    text: "Eat some!",
                    goto: 1
                },
                {
                    text: "Question the meaning of life.",
                    goto: 2
                },
            ]
        },
        1: {
            image: {
                src: "img/bacon.jpg",
                alt: "Bacon!"
            },
            description: "You approach the bacon and wait for the server to respond. Get it? Server? Hah.",
            loading: true,
        },
        2: {
            image: {
                src: "img/bacon.jpg",
                alt: "Bacon!"
            },
            description: "It's just a mound of bacon, don't question it.",
            actions: [
                {
                    text: "Eat some!",
                }
            ]
        }
    };
    $scope.state = $scope.states[0];
    $scope.handleAction = function(action) {
        $scope.state.loading = true;
        $http.get('/api/npc/' + $routeParams.id + '/' + action.requestId)
            .success(function(data) {
                $scope.state = data;
            });
    };
});
