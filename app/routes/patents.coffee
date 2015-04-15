`import Ember from 'ember'`
`import Results from "../models/results.js"`

PatentsRoute = Ember.Route.extend
  patents_fetcher: Ember.inject.service('patents_fetcher')

  model: (params) ->
    keywords = params.keywords.split(',')

    # Hardcoded combination <O>
    for k in [[keywords[0]], keywords]
      result = Results.create(keywords: k)
      @get('patents_fetcher').fetch(result, k)
      result

`export default PatentsRoute`
