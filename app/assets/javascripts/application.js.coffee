#= require hyphenator
#= require menu

window.findElementsToHyphenate = ->
  return document.querySelectorAll('section p, section ul')

if window.chrome then Hyphenator.run()

$document = $(document)
$window = $(window)
$body = $('body')

$spectrum = $('.spectrum')
$offset = 800 * Math.random()

$menu = $('#menu')
$menu = new Menu $menu, $menu.offset().top + $menu.outerHeight() - 100

onScroll = (e) ->
  scrollTop = $window.scrollTop()
  position = Math.round($offset + 0.5 * scrollTop)
  $spectrum.css 'background-position': position + 'px 0px'
  $menu.update scrollTop

anchorToScroll = (anchor) ->
  position =  $(anchor).offset().top

  if $window.height() < 700 or anchor is '#top'
  else if anchor is '#contact'
    position = position - 60
  else
    position = position - 130

  position

onReady = ->
  setTimeout(
    () ->
      anchor = window.location.hash
      if anchor and anchor.length > 0
        $body.scrollTop anchorToScroll(anchor)
    1
  )

  onScroll()
  $window.on 'scroll', onScroll

  $('a.scroll').click (e) ->
    anchor = $(e.target).attr('href')
    $body.animate { scrollTop: anchorToScroll(anchor) }, 600
    history.pushState null, null, anchor

    e.preventDefault()
    return false

$document.on 'ready', onReady
