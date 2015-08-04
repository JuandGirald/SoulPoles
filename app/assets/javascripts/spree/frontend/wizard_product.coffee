Spree.ready ($) ->

  pole_size   = $("input[name='product[pole_size]']").val()
  size_values = $('.size-values li')

  size_values.each ->
    if $(this).attr('value') == pole_size
      $(this).addClass("select")
    return

  $('.grip-colors.right-grip li, .basket.right-basket li').click (event) ->
    event.preventDefault()

    $(this).siblings("li.select").removeClass("select")
    $(this).addClass('select')
    right = $(this).attr('value')
    $("input[name='product[grip_right]']").val(right)
    $("input[name='product[basket_right]']").val(right)

  $('.grip-colors.left-grip li, .basket.left-basket li, .grip-colors.right-grip li, 
    .basket.right-basket li, .basket.basket-size li').click (event) ->
    event.preventDefault()
    
    $(this).siblings("li.select").removeClass("select")
    $(this).addClass('select')
    value = $(this).attr('value')
    $(this).siblings("input[name='product[grip_left]']").val(value)
    $(this).siblings("input[name='product[grip_right]']").val(value)
    $(this).siblings("input[name='product[basket_left]']").val(value)
    $(this).siblings("input[name='product[basket_right]']").val(value)
    $(this).siblings("input[name='product[basket_size]']").val(value)


  $('.size-values li').click (event) ->
    event.preventDefault()
    
    $("li.select").removeClass("select")
    $(this).addClass('select')
    size = $(this).attr('value')
    $("input[name='product[pole_size]']").val(size)
    