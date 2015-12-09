
angular.module("app").controller "ConsultantController", ["$scope", "Consultations", class
  constructor: (@$scope, @cons) ->
    @liveEdit = false
    @edit = false
    @new = false

    # message that will be added to consultation
    @message = {}
    # current displayed consultation
    @current = null
    # people registered to current consultation
    @registered = null

  # Performs search in all consultations and sets their information
  findConsultation: (id) ->
    return @cons.findConsultation(id)

  showConsultation: (id) ->
    @current = @cons.findConsultation(id)

  addConsultation: () ->
    @edit = true
    @new = true
    @current = null

  # Performs search in all student registered to consultation and sets their information
  findPerson: (pid) ->
    for s in @people
      return s if pid is s.pid

    return null

  showPerson: (pid) ->
    @registered = @findConsultation(pid)

  switchEdit: ->
    @edit = !@edit
    if @new
      @cons.newConsultation(@current)
      @new = false

  addMessage: ->
    @message.date = new Date()
    @current.comments.push(@message)
    @message = {}

]
