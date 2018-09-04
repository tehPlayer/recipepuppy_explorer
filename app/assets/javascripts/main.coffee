# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  phrase = null
  page = 1
  timer = null

  search_form = $('form#search-form')
  prev_page = search_form.siblings('#prev-page')
  next_page = search_form.siblings('#next-page')
  results_list = search_form.siblings('#search-results')
  search_field = search_form.find('input#search-input')
  loaders = $('.loader')

  url = search_form.attr('action')
  next_page.hide()
  loaders.hide()

  search_field.on 'keyup', (e) ->
    clearTimeout(timer)
    unless e.which == 13
      timer = setTimeout(
        (-> search_form.submit())
        , 1200)

  search_form.on 'submit', (e) ->
    e.preventDefault()

    phrase = search_field.val()
    page = 1

    launch_ajax(phrase, page)

  next_page.on 'click', (e) ->
    e.preventDefault()

    page += 1

    launch_ajax()

  launch_ajax = () ->
    loaders.show()
    $.post url, {search: phrase, page: page}, (response) ->
      loaders.hide()
      results_list.empty()

      if response.success
        page = response.page
        alt = true
        for record in response.entries
          alt = !alt
          classes = "list-group-item list-group-item-action"
          classes += " alternative" if alt
          results_list.append("
            <a href=\"#{record.href}\" class=\"#{classes}\">
              #{record.title}
            </a>
          ")
        if response.total_results == 20
          next_page.show()
        else
          next_page.hide()
      else
        results_list.append("Fail.")
        next_page.hide()
