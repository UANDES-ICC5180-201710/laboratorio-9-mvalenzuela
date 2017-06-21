// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//
$(document).ready(function() {
  var $addPersonForm = $('#addPersonAndEnrollment form');

  $addPersonForm.on('ajax:success', function(e, data, status, xhr)  {
    var $newHtml = $(data);
    $addPersonForm.html($newHtml.find('form#new_person').html());
  }).on('ajax:error', function(e, xhr, status, error) {
    alert(error);
  });
});

function updateIconColor(e) {
  var target = e.target;
  var value = target.value;
  if ( target.classList.contains('active') ){
    target.classList.remove('active');
    target.blur();
  }

  else{
    target.classList.add('active');
    target.blur();
  }
  var result
  $.ajax({
          type: "POST",
          url: "courses/ajaxFunction",
          data: {
          "course_id" : value
          },
          datatype: 'json',
          success: function(json){
            result = json
            target.innerHTML = result;
          }
      })

}
