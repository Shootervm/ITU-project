
angular.module("app")
  .service "ConsultationGenerator", ["$http", class
    constructor: (@$http) ->
      @seq = 0

    generate: () ->
      @seq++

      return {
        id: @seq
        name: "Jmeno konzultace"
        time: new Date()
        place: "misto"
        consultant: "Jmeno konzultanta"
        registered: false
      }
  ]

angular.module("app")
  .service "Consultations", ["ConsultationGenerator", class
    constructor: (@gen) ->
      @registered = []
      @available= []

      @generateConsultations(5)

    generateConsultations: (n) ->
      for i in [0..n]
        @available.push(@gen.generate())

    registerConsultation: (id) =>
      consultation = @findConsultation(id)

      # push to registered
      i = @available.indexOf(consultation)
      consultation.registered = true
      @registered.push(consultation)

      # remove from available
      @available.splice(i, 1)

    unregisterConsultation: (id) =>
      consultation = @findConsultation(id)

      # push to available
      i = @registered.indexOf(consultation)
      consultation.registered = false
      @available.push(consultation)

      # remove from registered
      @registered.splice(i, 1)

    findConsultation: (id) =>
      for c in @available
        return c if id is c.id

      for c in @registered
        return c if id is c.id

      return null
  ]