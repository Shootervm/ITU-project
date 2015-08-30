
angular.module("app", ["ui.router", "ngMaterial"])
  .config ($stateProvider, $urlRouterProvider, $mdThemingProvider) ->

    $urlRouterProvider.otherwise("")

    #$mdThemingProvider.theme("default")
    #  .primaryPalette("")
    #  .accentPalette("")

    $stateProvider
      .state "index", {
        url: "/"
        #templateUrl: ""
        #controller: ""
      }
