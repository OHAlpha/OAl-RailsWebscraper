fetch_delegate = ->
    jel = $ @
    url = jel.attr 'data-delegate-url'
    query = jel.attr 'data-delegate-params'
    query = if typeof query is typeof undefined or query is false then '' else "?#{query}"
    req = new XMLHttpRequest
    req.onload = ->
        jel.html @.responseText
        jel.attr 'data-delegate-fetched' 'true'
    req.open "GET",url+query
    req.send()

iterate_delegates = ->
    delegates = $ 'article.delegate[data-delegate-fetched="false"]'
    delegates.each fetch_delegate

$(document).ready iterate_delegates