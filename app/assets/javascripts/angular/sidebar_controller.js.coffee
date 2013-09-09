LightningTalks.controller "SidebarController", ($scope, Talk) ->
  $scope.talks = Talk.all()

  $scope.loadTalks = () ->
    Talk.loadTalks()
