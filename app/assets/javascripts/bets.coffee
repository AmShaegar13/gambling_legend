$ ->
  progress_bar = $('#time-left')
  seconds_left = progress_bar.data('seconds-left')

  timer = $.timer ->
    seconds_left -= 1
    
    time = new Date(seconds_left * 1000)
    min = if time.getMinutes() < 10 then '0'+time.getMinutes() else time.getMinutes()
    sec = if time.getSeconds() < 10 then '0'+time.getSeconds() else time.getSeconds()
    time_str = min + ':' + sec
    progress_bar.attr('aria-valuenow', time_str)
    progress_bar.text(time_str)
    
    progress = 100 * (600 - seconds_left) / 600
    progress_bar.css('width', progress+'%')
    
    if seconds_left == 0
      timer.stop()
      location.reload()

  timer.set
    time: 1000,
    autostart : true

  amounts = $('.bet-amount')
  amounts.on 'change mousemove keypress', ->
    $(this).siblings('.preview-amount').text($(this).val())
  
  alert = $('#alert')
  $('.new_bet').on('ajax:success', (e, data, status, xhr) ->
    if data.status == 'success'
      create_alert 'success', data.message
    else
      create_alert 'warning', data.message
  ).on 'ajax:error', (e, xhr, status, error) ->
    create_alert 'danger', '<strong>An unexpected error occurred.</strong> ' + error
  
  create_alert = (type, html) ->
    alert.append(
      $('<div>')
        .addClass('alert alert-' + type + ' alert-dismissable')
        .prop('role', 'alert')
        .append('<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>')
        .append(html)
    )

    alert_timer = $.timer ->
      alert.find(':first-child').remove()

    alert_timer.once 3000
