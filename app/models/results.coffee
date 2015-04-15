Results = Ember.Object.extend
  keywords: null
  items: null
  formattedKeywords: (->
    @get('keywords').join(' + ')
  ).property('keywords')

`export default Results`
