$window = $(window)
$spectrum = $('.spectrum')
$offset = Math.round(800 * Math.random())

onScroll = ->
  position = $offset + 0.5 * $window.scrollTop()
  $spectrum.css 'background-position': position + 'px 0px'

$window.on 'scroll', onScroll

onScroll()
