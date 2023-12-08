$(function(){
  $('.sdh_tabcontent > div').hide();
  $('.sdh_tabnav a').click(function () {
    $('.sdh_tabcontent > div').hide().filter(this.hash).fadeIn();
    $('.sdh_tabnav a').removeClass('active');
    $(this).addClass('active');
    return false;
  }).filter(':eq(0)').click();
  });