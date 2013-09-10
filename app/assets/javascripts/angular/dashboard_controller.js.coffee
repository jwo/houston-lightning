LightningTalks.controller "DashboardController", ($scope, $timeout, Talk) ->

  $scope.progressAsInt = 0
  $scope.talks = Talk.all()

  $scope.isCurrentTalk = (talk) ->
    return false if _.isUndefined(talk)
    talk.current_talk == true

  $scope.remainingTalks = (talk) ->
    return false if _.isUndefined(talk)
    return true if !talk.started_at

  $scope.calcTick = () ->
    $scope.$apply( ->
      $scope.progressAsInt = $scope.calcProgressAsInt()
    )
    if $scope.progressAsInt < 100
      $timeout($scope.calcTick, 1000)

  $timeout($scope.calcTick, 1000)

  $scope.calcProgressAsInt = () ->
    return 0 if _.isUndefined(Talk.currentStarted())
    minutes = 10
    totalMinutes = minutes * 60000
    startedAt = new Date(Talk.currentStarted().started_at)
    projectedEnd = new Date( startedAt.getTime() + totalMinutes)
    now = new Date().getTime()
    max = projectedEnd.getTime()
    difference = max - now
    (totalMinutes - difference) / totalMinutes * 100

  $scope.progressAsPercentage= () ->
    "#{$scope.progressAsInt}%"
