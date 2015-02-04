//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require admin-lte
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap


$(function(){
  $('a.sort_asc').each(function() {
     $(this).parent().addClass('sorting_asc');
  });
  $('a.sort_desc').each(function() {
     $(this).parent().addClass('sorting_desc');
  });
});
