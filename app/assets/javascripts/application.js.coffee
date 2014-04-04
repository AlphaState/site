#= require menu

window.findElementsToHyphenate = ->
  return document.querySelectorAll('section p, section ol, section ul')

if window.chrome then Hyphenator.run()

$mobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)

return if $mobile

$pageWidth = 800
$compressedMenuHeight = 96
$tallShortThreshold = 700
$spectrumScrollRate = 0.5
$scrollTime = 600

$document = $(document)
$window = $(window)
$scrollable = $('body, html') # To make IE work

$spectrum = $('.spectrum')
$offset = $pageWidth * Math.random()

$menu = $('#menu')
$menu = new Menu $menu, $menu.offset().top +
  $menu.outerHeight() - $compressedMenuHeight

onScroll = (e) ->
  scrollTop = $window.scrollTop()
  position = Math.round($offset + $spectrumScrollRate * scrollTop)
  $spectrum.css 'background-position': position + 'px 0px'
  $menu.update scrollTop

anchorToScroll = (anchor) ->
  position =  $(anchor).offset().top

  if $window.height() < $tallShortThreshold
  else if anchor is '#top'
  else if anchor is '#contact'
  else
    position = position - $compressedMenuHeight

  position

onReady = ->
  setTimeout(
    () ->
      anchor = window.location.hash
      if anchor and anchor.length > 0
        $scrollable.scrollTop anchorToScroll(anchor)
    1
  )

  onScroll()
  $window.on 'scroll', onScroll

  $('a.scroll').click (e) ->
    anchor = $(e.target).attr('href')
    $scrollable.animate { scrollTop: anchorToScroll(anchor) }, $scrollTime
    history.pushState null, null, anchor

    e.preventDefault()
    return false

$document.on 'ready', onReady
