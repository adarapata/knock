document.addEventListener 'DOMContentLoaded', ->
  source = Rx.Observable.range(0, 3).delay(new Date(Date.now() + 1000))
  subscription = source.subscribe((x) ->
    document.getElementById('content').innerHTML = "ほげ〜" + x.toString())
  return
