$ ->
  alert = $('#alert')
  $('#new_user').on('ajax:success', (e, data, status, xhr) ->
    if data.status == 'success'
      Turbolinks.visit('/')
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
