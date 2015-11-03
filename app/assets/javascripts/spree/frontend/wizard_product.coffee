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

  pole_size            = $("input[name='product[pole_size]']").val()
  size_values          = $('.size-values li')
  images_grip_right    = $('img.right-overlap.grip')
  images_grip_left     = $('img.left-overlap.grip')
  images_basket_left   = $('img.left-overlap.basket')
  images_basket_right  = $('img.right-overlap.basket')
  images_tip_left      = $('img.left-overlap.tip')
  images_tip_right     = $('img.right-overlap.tip')
  engraving_live       = $('.engraving_live')
  custom_engraving     = $('#product_custom_engraving')

  size_values.each ->
    if $(this).attr('value') == pole_size
      $(this).addClass("select")
    return

  if $("input[name=disabled]").val() == "true"
    $("#continue-button").attr("disabled", true)

  $('.fonts-values li').click (event) ->
    font = $(this).attr("value")
    $("input[name='product[engraving_font]']").val(font)
    $('h1#engraving-live').css("font-family", font)
    if ($("input[name='product[engraving-live]']").val() != "")
      $("#continue-button").attr("disabled", false)


  $('.has-engraving-radios input').click (event) ->
    if $(this).val() == "true"
      engraving_live.fadeIn()
      custom_engraving.removeAttr('disabled')
    else if $(this).val() == "false"
      engraving_live.fadeOut()
      custom_engraving.attr('disabled', 'true')
      custom_engraving.val('')
      $('#engraving-live').val('')
    return

  $('.grip-colors.left-grip li, .basket.left-basket li, .grip-colors.right-grip li, 
    .basket.right-basket li, .basket-size li, .left-tip li, .right-tip li').click (event) ->
    event.preventDefault()
    
    $(this).siblings("li.select").removeClass("select")
    $(this).addClass('select')
    value = $(this).attr('value')

    if $(this).hasClass("left")
      images_grip_left.each ->
        if $(this).hasClass("selected")
          $(this).removeClass("selected")
          $(this).addClass("hidden")

        if $(this).hasClass(value)
          $(this).removeClass("hidden")
          $(this).addClass("selected")
        return

    if $(this).hasClass("right")
      images_grip_right.each ->
        if $(this).hasClass("selected")
          $(this).removeClass("selected")
          $(this).addClass("hidden")

        if $(this).hasClass(value)
          $(this).removeClass("hidden")
          $(this).addClass("selected")
        return

    if $(this).hasClass("left_tip")
      images_tip_left.each ->
        if $(this).hasClass("selected")
          $(this).removeClass("selected")
          $(this).addClass("hidden")

        if $(this).hasClass(value)
          $(this).removeClass("hidden")
          $(this).addClass("selected")
        return

    if $(this).hasClass("right_tip")
      images_tip_right.each ->
        if $(this).hasClass("selected")
          $(this).removeClass("selected")
          $(this).addClass("hidden")

        if $(this).hasClass(value)
          $(this).removeClass("hidden")
          $(this).addClass("selected")
        return


    if $(this).hasClass("left_basket")
      images_basket_left.each ->
        if $(this).hasClass("selected")
          $(this).removeClass("selected")
          $(this).addClass("hidden")

        if $(this).hasClass(value)
          $(this).removeClass("hidden")
          $(this).addClass("selected")
        return

    if $(this).hasClass("right_basket")
      images_basket_right.each ->
        if $(this).hasClass("selected")
          $(this).removeClass("selected")
          $(this).addClass("hidden")

        if $(this).hasClass(value)
          $(this).removeClass("hidden")
          $(this).addClass("selected")
        return
    
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

    
  $("#product_custom_engraving").bind 'change paste keyup', ->
    a = $(this).val()
    $("#engraving-live").text(a)
