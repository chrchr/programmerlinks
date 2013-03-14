$ ->
  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    $("#points_for_" + $(e.target).attr('data-link-id')).html(xhr.responseText)




