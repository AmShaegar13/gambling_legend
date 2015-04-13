$ ->
  refill = $('#refill')
  alert = $('#alert')

  refill.on('ajax:success', (e, data, status, xhr) ->
    if data.status == 'success'
      refill.addClass 'hidden'
      $('#balance').text data.balance
      ranges = $('input.bet-amount:visible')
      ranges.prop 'max', data.balance
      if data.balance < 10
        ranges.prop 'step', data.balance
      else
        ranges.prop 'step', 10
    else
      create_alert 'warning', data.message
  ).on 'ajax:error', (e, xhr, status, error) ->
    create_alert 'danger', '<strong>An unexpected error occurred.</strong> ' + error

  create_alert = (type, html) ->
    alert.html(
      $('<div>')
        .addClass('alert alert-' + type)
        .prop('role', 'alert')
        .html(html)
    )
