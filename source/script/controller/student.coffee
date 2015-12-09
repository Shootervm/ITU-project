
angular.module("app").controller "StudentController", ["$scope", "Consultations", class
  constructor: (@$scope, @cons) ->
    # current displayed consultation
    @current = null

  # Performs search in all consultations and sets their information
  findConsultation: (id) ->
    return @cons.findConsultation(id)

  showConsultation: (id) ->
    @current = @cons.findConsultation(id)

  registerConsultation: (id) ->
    @cons.registerConsultation(id)

  unregisterConsultation: (id) ->
    @cons.unregisterConsultation(id)

]
