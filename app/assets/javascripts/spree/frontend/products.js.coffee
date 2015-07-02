Spree.ready ($) ->
  $('.learn-more').click (event) ->
    event.preventDefault()
    $('.nav-tabs li a[href="#properties"]').trigger('click')
    $('html, body').animate { scrollTop: $('.tab-content').offset().top }, 1000

  $(document).delegate '*[data-toggle="lightbox"]', 'click', (event) ->
    event.preventDefault()
    $(this).ekkoLightbox()
    return
    