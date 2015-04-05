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
