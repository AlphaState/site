class window.Menu
  constructor: (@element, @threshold) ->
    id = @element.attr('id')
    id = if id then id + '-placeholder' else 'placeholder'
    @placeholder = $('<div/>')
      .attr('id', id)
      .css(width: '100%', height: @element.outerHeight(true) + 'px')
      .insertAfter(@element)
    @compressed = false

  compress: () ->
    @element.addClass 'compressed'
    @placeholder.addClass 'active'
    @compressed = true

  decompress: () ->
    @element.removeClass 'compressed'
    @placeholder.removeClass 'active'
    @compressed = false

  isCompressed: () ->
    @compressed

  update: (scrollTop) ->
    if scrollTop > @threshold and not @compressed
      @compress()
    else if scrollTop < @threshold and @compressed
      @decompress()
