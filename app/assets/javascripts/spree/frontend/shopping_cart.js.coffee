Spree.ready ($) ->
  $('.line_item_quantity').on 'change', ->
    $(this).siblings('#update-button').fadeIn()
