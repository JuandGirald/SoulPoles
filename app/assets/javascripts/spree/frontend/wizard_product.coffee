Spree.ready ($) ->

  $(".owl-carousel").owlCarousel
    items: 3
    itemsDesktop: [
      1199
      3
    ]
    itemsDesktopSmall: [
      979
      3
    ]

  pole_size   = $("input[name='product[pole_size]']").val()
  size_values = $('.size-values li')

  size_values.each ->
    if $(this).attr('value') == pole_size
      $(this).addClass("select")
    return

  if $("input[name=disabled]").val() == "true"
    $("#continue-button").attr("disabled", true)

  $('.grip-colors.left-grip li, .basket.left-basket li, .grip-colors.right-grip li, 
    .basket.right-basket li, .basket-size li, .left-tip li, .right-tip li').click (event) ->
    event.preventDefault()
    
    $(this).siblings("li.select").removeClass("select")
    $(this).addClass('select')
    value = $(this).attr('value')
    
    $(this).siblings("input[name='product[grip_right]']").val(value)
    $(this).siblings("input[name='product[grip_left]']").val(value)
    $(this).siblings("input[name='product[basket_left]']").val(value)
    $(this).siblings("input[name='product[basket_right]']").val(value)
    $(this).siblings("input[name='product[basket_size]']").val(value)
    $(this).siblings("input[name='product[tip_left]']").val(value)
    $(this).siblings("input[name='product[tip_right]']").val(value)

    grip_right   = $("input[name='product[grip_right]']").val()
    grip_left    = $("input[name='product[grip_left]']").val()
    basket_left  = $("input[name='product[basket_left]']").val()
    basket_right = $("input[name='product[basket_right]']").val()
    basket_size  = $("input[name='product[basket_size]']").val()
    tip_left     = $("input[name='product[tip_left]']").val()
    tip_right    = $("input[name='product[tip_right]']").val()

    if (grip_right && grip_left != "") || (tip_left && tip_right != "") || (basket_right && basket_left && basket_size != "")
      $("#continue-button").attr("disabled", false)


  $('.size-values li').click (event) ->
    event.preventDefault()
    
    $("li.select").removeClass("select")
    $(this).addClass('select')
    size = $(this).attr('value')
    $("input[name='product[pole_size]']").val(size)
    if ($("input[name='product[pole_size]']").val() != "")
      $("#continue-button").attr("disabled", false)

    