Spree.ready ($) ->
  $('.line_item_quantity').on 'change', ->
    $(this).siblings('#update-button').fadeIn()

  ### ==========================================================================
   Parallax Header
   ========================================================================== 
  ###
  $('#slider').carousel interval: 4000

  $window = $(window)

  scrollFade = ($element, friction, offset) ->
    friction = if friction == undefined then 0.45 else friction
    offset = if offset == undefined then 0 else offset
    parentHeight = $element.parent().outerHeight() * 0.45
    previousOpacity = Infinity
    $window.scroll ->
      scrollTop = Math.max(0, $window.scrollTop())
      yOffset = $element.outerHeight() * -0.45 + scrollTop * friction
      opacity = 1 - (scrollTop / parentHeight - (parentHeight * offset))
      if opacity < 0 and previousOpacity < 0
        return
      $element.css
        transform: 'translate3d(0px,' + yOffset + 'px, 0)'
        opacity: opacity
      previousOpacity = opacity
      return
    return

  scrollFade $('article'), 0.7, 0
