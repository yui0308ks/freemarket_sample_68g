$(function() {

  $("#tab li").click(function() {
   
      var num = $("#tab li").index(this);

      $(".mypage__main__list__notice_list").addClass('d_none');

      $(".mypage__main__list__notice_list").eq(num).removeClass('d_none');

      $("#tab li").removeClass('select');

      $(this).addClass('select')

  });

  $("#cage li").click(function() {
    
    var num = $("#cage li").index(this);
    
    $(".mypage__main__cage__notice_box").addClass('d_none');

    $(".mypage__main__cage__notice_box").eq(num).removeClass('d_none');

    $("#cage li").removeClass('select');

    $(this).addClass('select')

});
  
});
