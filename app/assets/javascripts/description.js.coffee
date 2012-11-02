remove_description = () ->
  $('.description').remove()

$ ->
  if localStorage['hide-description']?
    remove_description()
  $('.hide-description').on 'click', (event) ->
    event.preventDefault()
    remove_description()
    if confirm('Hide it forever?')
      localStorage['hide-description'] = true
