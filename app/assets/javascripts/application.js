// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.turbolinks
//= require_tree .

$(function() {
  var form_html = $('#request_user_id').html()
  $("#request_form").change(function() {
    //Запоминаем отдел и ответственного, чтобы передать их 
    // в скрытых полях, в открытых передается id
    var division = $('#request_department_id option:selected').text();
    var responsible = $('#request_user_id option:selected').text();
    var sla = $('#request_sla_id option:selected').text();
    $("#request_responsible").val(responsible)
    $("#request_division").val(division)
    $("#request_sla_number").val(sla)
    var peoples = $(form_html).filter('optgroup[label="' + division + '"]').html() 
    if (division)
      $('#request_user_id').html(peoples)
    else
      $('#request_user_id').html(form_html)  
  });

});