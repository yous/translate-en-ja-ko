# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#source').keyup (e) ->
    if $('#source').val() != ''
      $.get('/ko/translate?' + $('#source').val(), (data) ->
        $('#result').val(data)
      )
    else
      $('#result').val('')
