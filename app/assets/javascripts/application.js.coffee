#= require menu
#= require hyphenator

$pageWidth = 800
$compressedMenuHeight = 84
$tallShortThreshold = 700
$spectrumScrollRate = 0.5
$scrollTime = 600

$document = $(document)
$window = $(window)

window.findElementsToHyphenate = ->
  document.querySelectorAll('section p, section ol, section ul')

$mobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)

computeAnchorPosition = (anchor) ->
  position =  $(anchor).offset().top

  if $window.height() < $tallShortThreshold
  else if anchor is '#top'
  else if anchor is '#contact'
  else position = position - $compressedMenuHeight

  position

onReady = ->
  Hyphenator.run() if window.chrome

  initialized = window.initialized
  window.initialized = true

  $document.on('page:load', onReady) unless initialized

  return if $mobile

  $scrollable = $('body, html') # To make IE work
  $spectrum = $('#menu')
  $offset = $pageWidth * Math.random()

  $menu = $('#menu')
  $menu = new Menu($menu, $menu.offset().top +
    $menu.outerHeight() - $compressedMenuHeight)

  onScroll = (e) ->
    scrollTop = $window.scrollTop()
    position = Math.round($offset + $spectrumScrollRate * scrollTop)
    $spectrum.css('background-position': "#{position}px 0px")
    $menu.update(scrollTop)

  scrollToWindowAnchor = ->
    anchor = window.location.hash
    if anchor and anchor.length > 0
      $scrollable.scrollTop(computeAnchorPosition(anchor))

  unless initialized
    setTimeout(scrollToWindowAnchor, 1)
  else
    scrollToWindowAnchor()
    $window.off('scroll')

  onScroll()
  $window.on('scroll', onScroll)

  $('a.scroll').click (e) ->
    anchor = $(e.target).attr('href')
    $scrollable.animate({ scrollTop: computeAnchorPosition(anchor) }, $scrollTime)
    history.pushState(null, null, anchor)

    e.preventDefault()
    return false

$document.on('ready', onReady)
