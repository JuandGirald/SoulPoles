Spree.ready ($) ->
  $("img[alt='Torched Soul'].top_image").removeClass("hidden")

  $('.learn-more').click (event) ->
    event.preventDefault()
    $('.nav-tabs li a[href="#properties"]').trigger('click')
    $('html, body').animate { scrollTop: $('.tab-content').offset().top }, 1000

  $('.customers-reviews').click (event) ->
    event.preventDefault()
    $('.nav-tabs li a[href="#reviews_tab"]').trigger('click')
    $('html, body').animate { scrollTop: $('.tab-content').offset().top }, 1000

  $('.engraving-link').click (event) ->
    event.preventDefault()
    $(this).fadeOut()
    $('.custom-engraving').slideDown()
  $('.dismiss-engraving').click (event) ->
    event.preventDefault()
    $(this).closest('.custom-engraving').slideUp()
    $('.engraving-link').fadeIn()

  $('.custom-style img').click (event) ->
    alt    = $(this).closest("div").children(".product_name").text()
    images = $("img[alt].top_image")

    images.each ->
      if this.alt == alt
        $(this).removeClass("hidden")
      else if !$(this).hasClass("hidden")
        $(this).addClass("hidden")
      return
    
    event.preventDefault()
    $("div.select").removeClass("select")
    $(this).closest(".cards").addClass("select")
    
    product_id = $(this).siblings('input').val()
    $("input[name='product_id']").val(product_id)
    $("input[name='alt']").val(alt)

    $('html, body').animate { scrollTop: $('.navbar2').offset().top }, 1000

  # $("body").waypoint ((direction) ->
  #   $(".navbar2").addClass("navbar-fixed-top",5000, "easeOutBounce")
  #   return
  # ),
  #   offset: "-150px"

  # $("body").waypoint ((direction) ->
  #   $(".navbar2").removeClass "navbar-fixed-top"
  #   return
  # ),
  #   offset: "-100px"



  $(document).delegate '*[data-toggle="lightbox"]', 'click', (event) ->
    event.preventDefault()
    $(this).ekkoLightbox()
    return
    