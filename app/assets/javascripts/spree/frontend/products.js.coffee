Spree.ready ($) ->
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


  $(document).delegate '*[data-toggle="lightbox"]', 'click', (event) ->
    event.preventDefault()
    $(this).ekkoLightbox()
    return
    