
angular.module("app").controller "StudentController", ["$scope", class
  constructor: (@$scope) ->
    # consultations registered by the student
    @consultations = [
      {
        id: 1
        name: "[ITU] Konzultace k projektum"
        time: "10.10.2015 - 14:00"
        place: "G202"
        consultant: "Jmeno konzultanta"
        registered: true
      }
      {
        id: 2
        name: "[IZP] Konzultace k pulsemestralce"
        time: "3.11.2015 - 15:00"
        place: "L301"
        consultant: "Jmeno konzultanta"
        registered: true
      }
      {
        id: 3
        name: "[IZG] Konzultace"
        time: "4.11.2015 - 12:00"
        place: "D202"
        consultant: "Jmeno konzultanta"
        registered: true
      }
      {
        id: 4
        name: "[IPZ] Predvanocni dárková konzultace"
        time: "20.12.2015 - 11:00"
        place: "Severní pól"
        consultant: "Santa"
        registered: true
      }
    ]

    # available consultations for the student
    @available = [
      {
        id: 11
        name: "[IPK] Konzultace k projektum"
        time: "10.10.2015 - 14:00"
        place: "G202"
        consultant: "Jmeno konzultanta"
      }
      {
        id: 12
        name: "[IZU] Konzultace k pulsemestralce"
        time: "3.11.2015 - 14:00"
        place: "L301"
        consultant: "Jmeno konzultanta"
      }
      {
        id: 13
        name: "[IPK] Jak vytrhnout kabel z racku"
        time: "4.11.2015 - 14:00"
        place: "D202"
        consultant: "Jmeno konzultanta"
      }
      {
        id: 14
        name: "[ISA] Santova allstar akce"
        time: "20.12.2015 - 14:00"
        place: "Severní pól"
        consultant: "Santa"
      }
    ]

    # current displayed consultation
    @current = null

  # Performs search in all consultations and sets their information
  findConsultation: (id) ->
    for c in @consultations
      return c if id is c.id

    for c in @available
      return c if id is c.id

    return null

  showConsultation: (id) ->
    @current = @findConsultation(id)
]
