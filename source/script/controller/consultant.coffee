
angular.module("app").controller "ConsultantController", ["$scope", class
  constructor: (@$scope) ->
    @edit = false
    @desc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut ipsum sollicitudin, commodo lorem nec, tempus arcu. Quisque a ligula a velit vulputate iaculis a at purus. Phasellus enim neque, cursus id ante quis, convallis faucibus sapien. Pellentesque nibh felis, tempus quis tortor quis, blandit laoreet nisi. Aliquam hendrerit malesuada urna vitae convallis. In sagittis nec nisl eget porta. Nullam dignissim rhoncus nisl, quis tristique felis varius a."
    # consultations created by the consultant (me)
    @consultations = [
      {
        id: 1
        name: "[ITU] Konzultace k projektum"
        time: "10.10.2015 - 14:00"
        place: "G202"
        consultant: "Jmeno konzultanta"
        people: [
          {
            pid: 1
            name: "Vojtech"
            surname: "Mašek"
            login: "xmasek15"
          }
          {
            pid: 3
            name: "Yolan"
            surname: "Swaginsky"
            login: "xswagi00"
          }
        ]
      }
      {
        id: 2
        name: "[IZP] Konzultace k pulsemestralce"
        time: "3.11.2015 - 15:00"
        place: "L301"
        consultant: "Jmeno konzultanta"
        people: [
          {
            pid: 1
            name: "Vojtech"
            surname: "Mašek"
            login: "xmasek15"
          }
          {
            pid: 2
            name: "Peter"
            surname: "Malina"
            login: "xmalin26"
          }
          {
            pid: 3
            name: "Yolan"
            surname: "Swaginsky"
            login: "xswagi00"
          }
        ]
      }
      {
        id: 3
        name: "[IZG] Konzultace"
        time: "4.11.2015 - 12:00"
        place: "D202"
        consultant: "Jmeno konzultanta"
        people: [
          {
            pid: 3
            name: "Yolan"
            surname: "Swaginsky"
            login: "xswagi00"
          }
        ]
      }
    ]

    # current displayed consultation
    @current = null
    # people registered to current consultation
    @registered = null

  # Performs search in all consultations and sets their information
  findConsultation: (id) ->
    for c in @consultations
      return c if id is c.id

    return null

  showConsultation: (id) ->
    @current = @findConsultation(id)

  # Performs search in all student registered to consultation and sets their information
  findPerson: (pid) ->
    for s in @people
      return s if pid is s.pid

    return null

  showPerson: (pid) ->
    @registered = @findConsultation(pid)

  switchEdit: ->
    @edit = !@edit
]
