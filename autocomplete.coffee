CORS_PROXY = "http://127.0.0.1:3001/"

#DEVELOPMENT
window.availableTags = []
window.queries = {}


$ ->
  $("#tags").autocomplete(
    source: availableTags
    # focus: (event, ui) ->
    #   $("#item").val ui.item.label
    #   false
    select: (event, ui) ->
      console.log ui.item
      console.log ui.item.label
      $("#item").val ui.item.label
      $("#item-id").val ui.item.id
      $("#item-description").html ui.item.desc
      $("#item-icon").attr "src", "images/" + ui.item.icon
      false
  ).data("ui-autocomplete")._renderItem = (ul, item) ->
    $("<li>").append("<a>" + item.label + "<br>" + item.desc + "</a>").appendTo ul

  $('#tags').on 'keyup', ->
      query = $('#tags').val()
      unless query.length < 3 or queries[query]?
          lang = $('#language').val()
          console.log "#{lang}: #{query}"
          getJSONWikidataSearchResults query, lang
          queries[query] = {}
      return

cors-anywhere
wikidataSearch = (query, language = "en", format="json")->
    return "https://www.wikidata.org/w/api.php?action=wbsearchentities&language=#{language}&format=#{format}&search=#{query}"


getJSONWikidataSearchResults = (query, language, format)->
    $.getJSON CORS_PROXY + wikidataSearch(query, language, "json") , (data)->
        if data.search?
            data.search.forEach (r)->
                if r.label?
                    availableTags.push(r.label)
                    queries[query][r.id] = r
                return
    return