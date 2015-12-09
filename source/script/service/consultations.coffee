

angular.module("app")
  .service "Randomizer", [ class
    constructor: () ->
      @kConsultationNames = [
        "[ITU] Konzultace k projektu"
        "[ITU] Konzultace k pulsemestralni skousce"
        "[ITU] Konzultace ke konzultaci"
        "[ISA] Konzultace k laborarnim cvicenim"
        "[ISA] Skupinove reseni uloh k projektum"
        "[ISA] Vanocni konzultace"
        "[IAL] Projekty"
        "[IPK] Vseobecny konzultace"
        "[IMS] Konzultace k pulsemestralnimu testu"
        "[IMS] Konzultace k projektum"
        "[IMP] Projekty"
        "[IMP] Konzultace k prednaskam"
      ]
      @kDescriptions = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sit amet tempus ante. Vivamus suscipit eget erat ut porttitor. Aenean non mauris eget diam molestie aliquam. Ut vel augue ullamcorper, cursus enim ut, accumsan velit. Maecenas eget aliquet mi. Morbi auctor neque ante, eget ullamcorper arcu dictum et."
        "Ut vel augue ullamcorper, cursus enim ut, accumsan velit. Maecenas eget aliquet mi. Morbi auctor neque ante, eget ullamcorper arcu dictum et. Maecenas bibendum elit leo, eget euismod ex ultrices quis. Quisque at tortor pharetra, tempus leo ac, accumsan justo."
        "Maecenas bibendum elit leo, eget euismod ex ultrices quis. Quisque at tortor pharetra, tempus leo ac, accumsan justo. Etiam imperdiet risus mi, nec fermentum turpis elementum vitae. Pellentesque feugiat leo laoreet arcu viverra mollis. Nulla nisi tortor, sagittis vitae rutrum vitae, ornare vitae leo."
        "Etiam imperdiet risus mi, nec fermentum turpis elementum vitae. Pellentesque feugiat leo laoreet arcu viverra mollis. Nulla nisi tortor, sagittis vitae rutrum vitae, ornare vitae leo. Vivamus a rutrum mauris. Vivamus quis neque malesuada, dignissim lectus vel, euismod enim. Cum sociis natoque penatibus et magnis dis parturient montes"
        "Vivamus a rutrum mauris. Vivamus quis neque malesuada, dignissim lectus vel, euismod enim. Cum sociis natoque penatibus et magnis dis parturient montes. Quisque porttitor finibus libero, eget bibendum odio vulputate ut. Proin venenatis, augue at laoreet vestibulum, arcu tortor"
        "Quisque porttitor finibus libero, eget bibendum odio vulputate ut. Proin venenatis, augue at laoreet vestibulum, arcu tortor. Phasellus non ullamcorper mauris. Vivamus auctor mattis ante, ut efficitur ipsum sagittis et. Proin sed nibh porttitor, cursus ex et, scelerisque dolor. Suspendisse aliquam eu metus"
        "Phasellus non ullamcorper mauris. Vivamus auctor mattis ante, ut efficitur ipsum sagittis et. Proin sed nibh porttitor, cursus ex et, scelerisque dolor. Suspendisse aliquam eu metus. Phasellus non ullamcorper mauris. Vivamus auctor mattis ante, ut efficitur ipsum sagittis et. Proin sed nibh porttitor, cursus ex et, scelerisque dolor. Suspendisse aliquam eu metus."
      ]
      @kConsultantNames = [
        "Evert Hoppe", "Laurel Bogan", "Mrs. Conrad Grant", "Kristy Treutel", "Susie Padberg",
        "Andrew Beatty", "Emily Konopelski", "Emily Konopelski", "Elvera Powlowski", "Johann Feil Ms.",
        "Khalid Harvey", "Willow Sauer", "Easton Nicolas", "Forest Pfeffer", "Reanna Green"
      ]
      @kPlaces = [
        "G202", "G201", "G203", "L301", "L302", "L303", "L304", "C105", "C106", "C102", "A101", "A112", "A113",
        "B205", "B206", "B207", "T102", "T143", "U137", "U122", "U182", "H101", "H102", "H103"
      ]

    # returns random element fro, the array
    randomize: (arr) ->
      return arr[Math.floor(Math.random()*arr.length)]

    randomDate: (start, end) ->
      return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
]

angular.module("app")
  .service "ConsultationGenerator", ["$http", "Randomizer", class
    constructor: (@$http, @rand) ->
      @seq = 0

    generate: () =>
      console.dir @rand.randomize
      consultation = {
        id: @seq++
        name: @rand.randomize(@rand.kConsultationNames)
        max: 3
        actual: 0
        desc: @rand.randomize(@rand.kDescriptions)
        date: @rand.randomDate(new Date(), new Date(2016, 4, 31))
        place: @rand.randomize(@rand.kPlaces)
        consultant: @rand.randomize(@rand.kConsultantNames)
        registered: false
        comments: []
      }

      return consultation
  ]

angular.module("app")
  .service "Consultations", ["ConsultationGenerator", class
    constructor: (@gen) ->
      @registered = []
      @available = []

      @generateConsultations(5)

    generateConsultations: (n) ->
      for i in [0..n]
        @available.push(@gen.generate())

    newConsultation: (c) =>
      @available.push(c)

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