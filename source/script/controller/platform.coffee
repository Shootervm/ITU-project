angular.module("app").controller "PlatformController", ["$scope", class
  constructor: (@$scope) ->
    @states = loadAll()
    @querySearch = querySearch

#**** Search and handle functions for locality of report
  querySearch = (query) ->
    if query then @states.filter(createFilterFor(query)) else @states

  loadAll = () ->
    allStates = "[ITU] Konzultace k projektum, G202, [IZP] Konzultace k pulsemestralce, L301, Vojtech Mašek, xmasek15, Peter Malina, xmalin26, [IZG] Konzultace, D202"

    allStates.split(/, +/g).map (state) ->
      {
      value: state.toLowerCase()
      display: state
      }

  createFilterFor = (query) ->
    lowercaseQuery = angular.lowercase(query)
    (state) ->
      state.value.indexOf(lowercaseQuery) == 0
#****

]
