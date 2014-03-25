#= require menu

$document = $(document)
$window = $(window)
$body = $('body')

$spectrum = $('.spectrum')
$offset = 800 * Math.random()

$menu = $('#menu')
$menu = new Menu $menu, $menu.offset().top + $menu.outerHeight() - 110

canCompressMenu = ->
  $window.height() > 700

onScroll = (e) ->
  scrollTop = $window.scrollTop()
  position = Math.round($offset + 0.5 * scrollTop)
  $spectrum.css 'background-position': position + 'px 0px'

  if not canCompressMenu()
    if $menu.isCompressed() then $menu.decompress()
    return

  $menu.update scrollTop

anchorToScroll = (anchor) ->
  position =  $(anchor).offset().top

  if not canCompressMenu() or anchor is '#top'
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
