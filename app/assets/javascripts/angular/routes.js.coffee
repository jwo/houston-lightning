LightningTalks.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when "/",
      templateUrl: "../../assets/dashboard/index.html"
      controller: "DashboardController"
    .when "/register",
      templateUrl: "../../assets/dashboard/new.html"
      controller: "TalkController"
    .when '/admin',
      templateUrl: "../../assets/admin/index.html"
      controller: 'AdminController'
    .otherwise redirectTo: "/"
  $locationProvider.html5Mode(true)
