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
    openUploadDialog()

  $('.edit-article').on 'drop', (e)->
    e.stopPropagation()
    e.preventDefault()

    file = e.originalEvent.dataTransfer.files[0]

    openUploadDialog(file)

  openUploadDialog = (file)->
    editForm = $('.edit-article').find('form')
    contentArea = editForm.find('#page_content')
    caretPosition = contentArea.get(0).selectionStart
    content = contentArea.val()

    uploadFormUrl = editForm.find('.js-screenshot').attr('href')
    uploadFormUrl = uploadFormUrl + "?filename=#{file.name}" if file?

    Nifty.Dialog.open
      url:  uploadFormUrl
      afterLoad: (dialog)->
        form = dialog.find('form')
        form.find('#screenshot_alt_text').focus()

        dialog.on 'submit', 'form', (e)->
          form = $(this)
          formData = new FormData(form.get(0))

          if file?
            filename = file.name
            formData.append('screenshot[upload_file]', file)
          else
            filename = form.find('#screenshot_upload_file').val()

          fileExt = filename.split('.').pop().toLowerCase()
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
              screenshotLink = "![#{data.title}*centre](#{data.path})"
              newContent = content.substring(0, caretPosition) + screenshotLink + content.substring(caretPosition)
              newCaretPosition = (content.substring(0, caretPosition) + screenshotLink).length
              contentArea.val(newContent)

              contentArea.focus()
              contentArea.get(0).setSelectionRange(newCaretPosition, newCaretPosition)

              Nifty.Dialog.closeTopDialog()
              
            error: (xhr, status, errorThrown)->
              console.log xhr.responseText

          false
