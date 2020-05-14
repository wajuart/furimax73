$(document).on('turbolinks:load', function(){
 
  $('.trade-tab li').click(function() {
 
    var index = $('.trade-tab li').index(this);
 
    $('.trade-tab li').removeClass('active');
 
    $(this).addClass('active');
 
    $('.tab-area ul').removeClass('list-show').eq(index).addClass('list-show');
 
  });
});