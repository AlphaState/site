$document = $(document)
$window = $(window)
$body = $('body')

$spectrum = $('.spectrum')
$offset = 800 * Math.random()

$menu = $('#menu')
$menu_height = $menu.outerHeight()
$placeholder_height = $menu.outerHeight(true)

$placeholder = $('<div/>')
  .css(width: '100%', height: $placeholder_height + 'px')
  .hide()
  .insertAfter($menu)

$threshold = $menu.offset().top + $menu_height - 110
$compressed = false

onScroll = (e) ->
  scrollTop = $window.scrollTop()
  position = Math.round($offset + 0.5 * scrollTop)
  $spectrum.css 'background-position': position + 'px 0px'

  if scrollTop > $threshold and not $compressed
    $menu.addClass 'compressed'
    $placeholder.show()
    $compressed = true
  else if scrollTop < $threshold and $compressed
    $menu.removeClass 'compressed'
    $placeholder.hide()
    $compressed = false

anchorToScroll = (anchor) ->
  position =  $(anchor).offset().top
  if anchor is '#top'
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
