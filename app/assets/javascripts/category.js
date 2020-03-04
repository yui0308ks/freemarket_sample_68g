$(function(){
  var seach = $(".select_wrap1");
  function appendSelect(Num) {
    if(Num == 1) {
      var select_id = `m_category`
    } else if(Num == 2) {
      var select_id = `s_category`
    }
    var html =
    `<select name="item[category_id]" id="${select_id}">
        <option value>---</option>
    </select>`
    seach.append(html)
  }
  function appendCat(Option, Num) {
    if (Num == 1) {
      var appendId = $("#m_category")
    } else if (Num == 2) {
      var appendId = $("#s_category")
    }
    appendId.append(
      $("<option>")
        .val($(Option).attr('id'))
        .text($(Option).attr('name'))
    )
  }
  $("#parent-category").on('change', function() {
    parent = $(this).val()
    $("#m_category, #s_category").remove()
      $.ajax({
        type: "GET",
        url: "/items/category",
        data: {parent: parent},
        dataType: 'json',
      })
      .done(function(child) {
        var Num = 1
        appendSelect(Num)
        child.forEach(function(child) {
          appendCat(child, Num)
        })
      })
  })
  $(document).on('change', "#m_category", function() {
    child = $(this).val()
    $("#s_category").remove()
    $.ajax({
      type: "GET",
      url: "/items/category",
      data: {child: child},
      dataType: 'json'
    })
    .done(function(grandchild) {
      var Num = 2
      appendSelect(Num)
      grandchild.forEach(function(grandchild) {
        appendCat(grandchild, Num)
      })
    })
  })

// })

  // // Sカテゴリーが選択された時のアクション
  // $(document).on('change', "#s_category", function() {
  //   // m_cat = $(this).val()

  //   var array = ['S','M','L']
    
  //   $("#size").remove()

  //   $.ajax({
  //     type: "GET",
  //     url: "/items/category",
  //     data: {m_cat: m_cat},
  //     dataType: 'json'
  //   })
  //   .done(function(s_cat) {
  //     var catNum = 2
  //     appendSelect(catNum)
  //     s_cat.forEach(function(s_cat) {
  //       appendCat(s_cat, catNum)
  //     })
  //   })
  // })
})
