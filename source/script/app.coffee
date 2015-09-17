
angular.module("app", ["ui.router", "ngMaterial", "pascalprecht.translate", "ngSanitize"])
  .config ($stateProvider, $urlRouterProvider, $mdThemingProvider, $translateProvider) ->

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

    $translateProvider.useStaticFilesLoader {
      prefix: "/translation/",
      suffix: ".json"
    }
    $translateProvider.preferredLanguage('en')
    $translateProvider.useSanitizeValueStrategy(null)
