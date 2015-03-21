PetsApp.controller("userController", function($scope) {
	get("/api/user/info", function(data) {
		$scope.user = data;
		dateDif = (new Date().getTime() / 1000) - data.created;
		$scope.user.created = Math.round(dateDif / 3600);
		$scope.$apply();
	});
});
