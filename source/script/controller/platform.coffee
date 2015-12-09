

angular.module("app").controller "PlatformController", ["$scope", "Randomizer", class
  constructor: (@$scope, @rand) ->
    @states = @loadAll()

    @username = @rand.randomize(@rand.kConsultantNames)

#**** Search and handle functions for locality of report
  querySearch: (query) ->
    if query then @states.filter(@createFilterFor(query)) else @states

  loadAll: () =>

    allStates = @rand.kConsultantNames.join(", ")

    allStates.split(/, +/g).map (state) ->
      {
      value: state.toLowerCase()
      display: state
      }

  createFilterFor: (query) ->
    lowercaseQuery = angular.lowercase(query)
    (state) ->
      state.value.indexOf(lowercaseQuery) == 0
#****

]
