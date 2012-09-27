$ ->
  $('#definition_tags_list').select2
    tags: window.availableTags
    containerCssClass: 'large'
    width: 'off'
  $(document).on 'pjax:success', () ->
    $('#definition_tags_list').select2
    tags: window.availableTags
    containerCssClass: 'large'
    width: 'off'

