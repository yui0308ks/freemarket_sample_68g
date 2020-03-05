$(function(){
  function buildHTML(comment){
    var html = `<li class="clearfix">
                  <div class="comment-left">
                    ${comment.user_name}
                  </div>
                  <div class="comment-right">
                    ${comment.text}
                  </div>
                </li>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      console.log(data); 
      $('.commentBox__inner').append(html);  //ここではないか
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});