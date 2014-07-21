#window.App.controller 'ImageUploadController', [
#	'$scope', 
#	'$http', 
#	'$filter', 
#	'$window',
#	($scope, $http, $filter, $window) ->
#		$scope.options = {
#			url: url
#		};
#		$scope.loadingFiles = true
#		$http.get(url)
#			.then(
#				(response) ->
#					$scope.loadingFiles = false
#					$scope.queue = response.data.files || []
#				, () ->
#					$scope.loadingFiles = false
#			)
#]