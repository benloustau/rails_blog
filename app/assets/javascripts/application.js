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
//= require_tree .

$(document).ready(function(){
  $('.shim').on('click', function () {
    $(this).hide();
    $('#sign-in-form').hide().css('top', "50%");
    $('.sign-up-form').hide().css('top', "50%");
  });

  $('#sign-up').click(function(e){
    e.preventDefault();
    $('.shim').show();
    $('.sign-up-form').show().animate({top: "90px"}, 200);
  });

  $('#sign-in').click(function(e){
    e.preventDefault();
    $('.shim').show();
    $('#sign-in-form').show().animate({top: "90px"}, 200);
  });

  $('.post-form').click(function(){
    $(this).animate({
        height: ($(this).height()==35) ? 100 : 35
    });
  });

  $('.edit-text-area').click(function(){
    $(this).animate({
      height: ($(this).height()==35) ? 100 : 35
    });
  });

  $('.bio-text-area').click(function(){
    $(this).animate({
      height: ($(this).height()==35) ? 100 : 35
    });
  });

});
