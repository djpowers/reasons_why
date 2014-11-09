$ ->
  $reason = $('.reason')
  if $reason.length > 0
    numberOfReasons = reasonsArray.length
    first_reason = reasonsArray[Math.floor(Math.random() * numberOfReasons)]
    $reason.append('<p>' + first_reason + '</ p>')

    $('#reason_button').click ->
      $reason.empty()
      current_reason = reasonsArray[Math.floor(Math.random() * numberOfReasons)]
      $reason.append('<p>' + current_reason + '</ p>')
