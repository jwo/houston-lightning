LightningTalks.controller "AdminController", ($scope, $http, Talk, $timeout) ->
  $scope.admin = false
  $scope.statusMessage = ''
  $scope.password = ''
  $scope.talks = Talk.all()

  $scope.isAdmin = () ->
    $scope.admin == true

  $scope.hasStarted = (stuff) ->
    stuff.started_at != null

  $scope.validPassword = () ->
    if $scope.password.length >= 2
      true
    else if $scope.password.length > 0
      $scope.PasswordValidationMessage = 'Enter a password!'
      false

  $scope.allValid = () ->
    $scope.validPassword()

  $scope.authenticate = () ->
    $http.post('/admin/authenticate', password: $scope.password)
      .success (data) ->
        if data=='true'
          $scope.admin = true
        else
          $scope.password = ''
          $scope.PasswordValidationMessage = 'Sorry, negative'

      .error (data) ->
        alert("sorry")

  $scope.destroy = (talk) ->
    $http.delete("/admin/destroy?id=#{talk.id}")
      .success (data) ->
        Talk.destroyTalk(talk.id)
        $scope.statusMessage = "Deleted: #{talk.description}"
        $timeout( ->
          $scope.statusMessage = ''
        , 3000)
      .error (data) ->
        console.log(data)
        alert("sorry")

  $scope.start = (talk) ->
    $http.post('/admin/start', talk: talk)
      .success (data) ->
        Talk.startTalk(talk.id)
        $scope.statusMessage = "Started: #{talk.description}"
        $timeout( ->
          $scope.statusMessage = ''
        , 3000)
      .error (data) ->
        console.log(data)
        alert("sorry")
