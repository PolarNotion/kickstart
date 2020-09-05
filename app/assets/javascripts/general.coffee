copyClipboard = (clicked_obj) ->
  item       = clicked_obj.closest('.copy-wrapper')
  copyText   = $('.copyToClipboard', item)[0]

  console.log(item)
  copyText.select()
  copyText.setSelectionRange 0, 99999

  document.execCommand 'copy'

document.addEventListener "turbolinks:load", ->
  
  $('.colorPicker').minicolors()

  $('.triggerPrint').click ->
    window.print()

  $('.copyToClipboard').click ->
    copyClipboard($(this))

  $('.alert-banner').each ->
    fade_count = $(this).data('fade-count')

    $(this).delay(fade_count).slideUp(300)

  $('.inputPhone').keyup ->
    val     = $(this).val()

    if (val != '')
      new_val = val.replace(/(\d{3})(\d{3})(\d{4})/, '$1 $2 $3')
      $(this).val(new_val)

  $('.inputCurrency').keyup (event) ->
    if event.which >= 37 and event.which <= 40
      return

    @value = @value.replace(/\D/g, '').replace(/\B(?=(\d{3})+(?!\d))/g, ',')

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time   = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  # Smooth Scroll to Anchor
  $('a[href*="#"]').not('[href="#"]').not('[href="#0"]').click (event) ->
    # On-page links
    if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
      # Figure out element to scroll to
      target = $(@hash)
      target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
      # Does a scroll target exist?
      if target.length
        # Only prevent default if animation is actually gonna happen
        event.preventDefault()
        $('html, body').animate { scrollTop: target.offset().top }, 1000, ->
          # Callback after animation
          # Must change focus!
          $target = $(target)
          $target.focus()
          if $target.is(':focus')
            # Checking if the target was focused
            return false
          else
            $target.attr 'tabindex', '-1'
            # Adding tabindex for elements not focusable
            $target.focus()
            # Set focus again

  # Set anchor to under sticky nav-height
  if $(location.href.split('#')[1])
    target = $('#' + location.href.split('#')[1])
    
    if target.length
      $('html, body').scrollTop(target.offset().top - 65)

document.addEventListener 'page:restore', ->
  app.init()
