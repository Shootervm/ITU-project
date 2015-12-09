
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
    @current.actual = @current.actual + 1
    @cons.registerConsultation(id)

  unregisterConsultation: (id) ->
    @current.actual = @current.actual - 1
    @cons.unregisterConsultation(id)

]
