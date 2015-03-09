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
		$scope.has_like = $('header #action_control').data 'like'
		$scope.has_favor = $('header #action_control').data 'favor'
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
					$('#like').toggleClass "active"
					$scope.has_like = true
					

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
					$('#favor').toggleClass "active"
					$scope.has_favor = true
					

		$scope.unlike = () ->
			$http
					method: 'GET'
					url: '/api/v1/score/unlike'
					params:
						secret: $scope.secret
						id: $scope.id
						user: $scope.current_user
					isArray: false
				.success () ->
					$scope.get_score()
					$('#like').toggleClass "active"
					$scope.has_like = false
					

		$scope.unfavor = () ->
			$http
					method: 'GET'
					url: '/api/v1/score/unfavor'
					params:
						secret: $scope.secret
						id: $scope.id
						user: $scope.current_user
					isArray: false
				.success () ->
					$scope.get_score()
					$('#favor').toggleClass "active"
					$scope.has_favor = false

		$scope.do_like = () ->
			switch $scope.has_like
				when true then $scope.unlike()
				when false then $scope.like()
				else window.base.Warning '未知错误，点赞失败，请刷新重试'

		$scope.do_favor = () ->
			switch $scope.has_favor
				when true then $scope.unfavor()
				when false then $scope.favor()
				else window.base.Warning '未知错误，收藏失败，请刷新重试'

		$scope.do_share = () ->
			window.base.Notice '分享功能尚未开放，敬请期待！'
]