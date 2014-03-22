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

onReady = ->
  $window.on 'scroll', onScroll
  onScroll()

  $('a.scroll').click (e) ->
    position = Math.max(0, $($(e.target).attr('href')).offset().top - 150)
    $body.animate { scrollTop: position }, 600
    e.preventDefault()
    return false

$document.on 'ready', onReady
