$(function(){
  // selectを追加するHTML
  // var cat_seach = $(".select_wrap1");

  // function appendSelect(catNum) {
    
  //   if(catNum == 1) {
    
  //     var select_id = `m_category`
  //   } else if(catNum == 2) {
  //     var select_id = `s_category`
  //   }
  //   var html =
  //   `<select name="item[category_id]" id="${select_id}">
  //       <option value>---</option>
  //   </select>`
  //   cat_seach.append(html)
  // }

  // optionを追加するHTML
  function appendCat(catOption, catNum) {
    if (catNum == 1) {
      
      var appendId = $("#m_category")
    } else if (catNum == 2) {
      var appendId = $("#s_category")
    }
    appendId.append(
      $("<option>")
        .val($(catOption).attr('id'))
        .text($(catOption).attr('name'))
    )
  }

  // Lカテゴリーが選択された時のアクション
  $("#parent-category").on('change', function() {
    l_cat = $(this).val()
    console.log(l_cat)
    $("#m_category, #s_category").remove()
    
    // ajaxでリクエストを送信
      $.ajax({
        type: "GET",
        url: "/items/category",
        data: {l_cat: l_cat},
        dataType: 'json',
        error : function(XMLHttpRequest, textStatus, errorThrown) {
          console.log("ajax通信に失敗しました");
          console.log("XMLHttpRequest : " + XMLHttpRequest.status);
          console.log("textStatus     : " + textStatus);
          console.log("errorThrown    : " + errorThrown.message);
      },
      //ajax通信成功
      success : function(response) {
          console.log("ajax通信に成功しました");
          console.log(response);
      }
      })
      // doneメソッドでappendする
      .done(function(m_cat) {
        var catNum = 1
        appendSelect(catNum)
        m_cat.forEach(function(m_cat) {
          appendCat(m_cat, catNum)
        })
      })
  })

  // Mカテゴリーが選択された時のアクション
  $(document).on('change', "#m_category", function() {
    m_cat = $(this).val()
    $("#s_category").remove()

    $.ajax({
      type: "GET",
      url: "/items/category",
      data: {m_cat: m_cat},
      dataType: 'json'
    })
    .done(function(s_cat) {
      var catNum = 2
      appendSelect(catNum)
      s_cat.forEach(function(s_cat) {
        appendCat(s_cat, catNum)
      })
    })
  })
})