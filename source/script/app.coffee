
angular.module("app", ["ui.router", "ngMaterial", "pascalprecht.translate", "ngSanitize"])
  .config ($stateProvider, $urlRouterProvider, $mdThemingProvider, $translateProvider) ->

    $urlRouterProvider.otherwise("/student")

    $stateProvider
      .state "student", {
        url: "/student"
        templateUrl: "template/student.html"
        controller: "StudentController as student"
      }
      .state "consultant", {
        url: "/consultant"
        templateUrl: "template/consultant.html"
        controller: "ConsultantController as consultant"
      }

    $translateProvider.useStaticFilesLoader {
      prefix: "/translation/",
      suffix: ".json"
    }
    $translateProvider.preferredLanguage('en')
    $translateProvider.useSanitizeValueStrategy(null)
