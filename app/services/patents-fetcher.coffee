`import Ember from 'ember'`

PatentsFetcher = Ember.Service.extend
  _url: (keywords) ->
    searchTerms = encodeURIComponent "ti=\"#{keywords.join(' ')}\""
    "http://ops.epo.org/3.1/rest-services/published-data/search/biblio.js?q=#{searchTerms}"

  fetch: (result, keywords) ->
    $.ajax(
      @_url(keywords),
      dataType: 'jsonp',
      success: (data) ->
        documents = data["ops:world-patent-data"]["ops:biblio-search"]["ops:search-result"]["exchange-documents"]
        patents = documents.map (r) ->
            r["exchange-document"]?["bibliographic-data"]?["invention-title"]?["$"]
          .reject (r) -> r == undefined
          .map (name) -> { name: name }

        result.set('items', patents)
    )

`export default PatentsFetcher`
