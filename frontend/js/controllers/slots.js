PetsApp.controller("slotsController", function($scope, $rootScope) {
    $scope.current = 1;

	var stoppedColors = [];
    $scope.stopOrRestart = function() {
        if ($scope.current == 4) {
            restart();
        } else {
            stop();
        }
    };

	function stop() {
		var ele = document.getElementById("spinner" + $scope.current);
		var computed = window.getComputedStyle(ele);

		if (computed) {
			var split = computed.transform.split(", ");
			var value = split[5].slice(0, -1);
			var next = Math.round(value / 70);
			ele.style.webkitTransform = "translate(0, " + (next * 70) + "px)";
			ele.className = "column";
			getColorFromSpinner($scope.current, next);
		}
		$scope.current++;

		if ($scope.current > 3) {
			for (var i = 0; i < 3; i++) {
				var match = true;
				for (var j = 0; j < 2; j++) {
					if (stoppedColors[j][i] != stoppedColors[j+1][i]) {
						match = false;
					}
				}
				if (match) {
                    sendScore();
                    break;
				}
			}
			stoppedColors = [];
		}
	}

    function sendScore() {
	$scope.won = true;
	setTimeout(function() {
	    $scope.won = false;
	    $scope.$apply();
	}, 1500);
        post("/api/game/win", { points: 1000 }, function() {
		$rootScope.points += 1000;
		$rootScope.$apply();
        });
    }

	function restart() {
		for (var i = 3; i > 0; i--) {
			var ele = document.getElementById("spinner" + i);
			ele.className = "column spinner"
		}

		$scope.current = 1;
	}

	function getColorFromSpinner(n, next) {
		var colors = document.querySelectorAll("#spinner" + n + " div");
		var a = [];
		a.push(colors[-next].className.split(" ")[0]);
		a.push(colors[-next + 1].className.split(" ")[0]);
		a.push(colors[-next + 2].className.split(" ")[0]);
		stoppedColors.push(a);
	}
});

