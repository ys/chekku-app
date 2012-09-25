$(document).foundationTopBar( )
$ ->
  $('.search').live 'click', () ->
    $('#search-form').submit()
  $('#search-form').live 'submit', () ->
    $.pjax
      type: this.method
      url: this.action
      data: $(this).serializeArray()
      container: "[data-pjax-container]"
    false

