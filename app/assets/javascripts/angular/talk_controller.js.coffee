LightningTalks.controller "TalkController", ($scope, $http, $location, Talk) ->

  $scope.talk = {name: '', description: '', email: '', twitter: ''}

  $scope.validName = () ->
    if $scope.talk.name.length < 5
      $scope.NameValidationMessage = 'Must be 5 characters or more'
      false
    else
      true

  $scope.validDescription = () ->
    if $scope.talk.description.length < 25
      $scope.DescriptionValidationMessage = "Must be 25 characters or more. You need: #{25 - $scope.talk.description.length} more"
      false
    else
      true

  $scope.validEmail = () ->
    emailRegex = /\S+@\S+\.\S+/
    if !emailRegex.test($scope.talk.email)
      $scope.EmailValidationMessage = 'Does not appear valid'
      false
    else
      true
    
  $scope.validTwitter = () ->
    if $scope.talk.twitter.indexOf(' ') > 0
      $scope.TwitterValidationMessage = 'No spaces'
      false
    else if /@/.test($scope.talk.twitter)
      $scope.TwitterValidationMessage= 'Do not include the @'
      false
    else if $scope.talk.twitter.length < 2
      $scope.TwitterValidationMessage = 'Must be 2 characters or more'
      false
    else
      true


  $scope.allValid = () ->
    $scope.validDescription() && $scope.validEmail() && $scope.validTwitter() && $scope.validName()

  $scope.register = () ->
    if $scope.allValid()
      $http.post("/talks", talk: $scope.talk)
        .success (data, status, headers, config) ->
          $location.path('/')
        .error (data, status, headers, config) ->
          alert(data)
    else
      console.log("no registering")
