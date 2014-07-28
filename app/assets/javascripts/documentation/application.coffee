#= require jquery
#= require jquery_ujs
#= require documentation/jquery-ui
#= require documentation/jquery.autosize
#= require nifty/dialog

$ ->
  $('form.pageForm textarea').autosize({append: '\n\n'})
  $('form.reordering ul').sortable
    containment: 'parent'
    update: ->
      form = $(this).parents('form')
      url = form.attr('action')
      $.post(url, form.serialize());
  
  $('.js-screenshot').on 'click', (e)->
    e.preventDefault()

    contentArea = $('#page_content')
    caretPosition = contentArea.get(0).selectionStart
    content = contentArea.val()

    Nifty.Dialog.open
      url: $(this).attr('href')
      afterLoad: (dialog)->
        form = dialog.find('form')

        dialog.on 'submit', 'form', (e)->
          form = $(this)
          formData = new FormData(form.get(0))

          fileExt = form.find('#screenshot_upload_file').val().split('.').pop().toLowerCase()
          if $.inArray(fileExt, ['gif','png','jpg','jpeg']) == -1
            alert("Invalid file extension (allowed: gif, png, jpg, jpeg)")
            return false

          $.ajax
            url: form.attr('action')
            type: form.attr('method')
            data: formData
            processData: false
            contentType: false
            success: (data)->
              screenshotLink = "![#{data.title}*centre](#{data.path})\n"
              newContent = content.substring(0, caretPosition) + screenshotLink + content.substring(caretPosition)
              newCaretPosition = (content.substring(0, caretPosition) + screenshotLink).length
              contentArea.val(newContent)

              contentArea.focus()
              contentArea.get(0).setSelectionRange(newCaretPosition, newCaretPosition)

              Nifty.Dialog.closeTopDialog()
              
            error: (xhr, status, errorThrown)->
              console.log xhr.responseText

          false