document.addEventListener 'DOMContentLoaded', ->
  source = Rx.Observable.timer(1000,500).take(3)
  subscription = source.subscribe((x) ->
    document.getElementById('content').innerHTML = "ほげ〜" + x.toString())

  clickDom = $('#clickContent')
  Rx.Observable
    .fromEvent(clickDom, 'click')
    .subscribe((x) ->
      alert 'clicked')

  clickDom.trigger('click')
  return
