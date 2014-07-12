#= require jquery
#= require jquery_ujs
#= require documentation/jquery-ui
#= require documentation/jquery.autosize

$ ->
  $('form.pageForm textarea').autosize({append: '\n\n'})
  $('form.reordering ul').sortable
    containment: 'parent'
    update: ->
      form = $(this).parents('form')
      url = form.attr('action')
      $.post(url, form.serialize());
  