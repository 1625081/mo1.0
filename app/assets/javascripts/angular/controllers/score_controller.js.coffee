window.App.controller 'ScoreController', [
	'$scope', 
	'$http', 
	'$filter', 
	'$window',
	($scope, $http, $filter, $window) ->
		rails_data = $("header .angular-data")
		$scope.id = rails_data.data 'score-id'
		$scope.secret = rails_data.data 'secret'
		$scope.login = rails_data.data 'login'
		$scope.get_score = () ->
			$http
					method: 'GET'
					url: '/api/v1/score'
					params:
						id: $scope.id
					isArray: false
				.success (data) ->
					$scope.score = data
		$scope.get_score()

		$scope.current_user = $('header #action_control').data 'user-id'

		$scope.like = () ->
			$http
					method: 'GET'
					url: '/api/v1/score/like'
					params:
						secret: $scope.secret
						id: $scope.id
						user: $scope.current_user
					isArray: false
				.success () ->
					$scope.get_score()

		$scope.favor = () ->
			$http
					method: 'GET'
					url: '/api/v1/score/favor'
					params:
						secret: $scope.secret
						id: $scope.id
						user: $scope.current_user
					isArray: false
				.success () ->
					$scope.get_score()

]