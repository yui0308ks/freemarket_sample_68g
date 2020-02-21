// $(document).on('turbolinks:load', function() {
$(function(){
  // selectを追加するHTML
  var cat_seach = $(".select_wrap1");

  function appendSelect(catNum) {
    
    if(catNum == 1) {
    
      var select_id = `m_category`
    } else if(catNum == 2) {
      var select_id = `s_category`
    }
    var html =
    `<select name="item[category_id]" id="${select_id}">
        <option value>---</option>
    </select>`
    cat_seach.append(html)
  }

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

// $(function(){
//   // カテゴリーセレクトボックスのオプションを作成
//   function appendOption(category){
//     var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
//     return html;
//   }
//   // 子カテゴリーの表示作成
//   function appendChidrenBox(insertHTML){
//     var childSelectHtml = '';
//     childSelectHtml = `<div class='select_wrap__added' id= 'children_wrapper'>
//                         <div class='select_wrap__box'>
//                           <select class="select_wrap__box--select" id="child_category" name="category_id">
//                             <option value="---" data-category="---">---</option>
//                             ${insertHTML}
//                           <select>
//                           <i class='fas fa-chevron-down select_wrap__box--arrow-down'></i>
//                         </div>
//                       </div>`;
//     $('.listing-product-detail__category').append(childSelectHtml);
//   }
//   // 孫カテゴリーの表示作成
//   function appendGrandchidrenBox(insertHTML){
//     var grandchildSelectHtml = '';
//     grandchildSelectHtml = `<div class='select_wrap_added' id= 'grandchildren_wrapper'>
//                               <div class='select_wrap__box'>
//                                 <select class="select_wrap_box--select" id="grandchild_category" name="category_id">
//                                   <option value="---" data-category="---">---</option>
//                                   ${insertHTML}
//                                 </select>
//                                 <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
//                               </div>
//                             </div>`;
//     $('.listing-product-detail__category').append(grandchildSelectHtml);
//   }
//   // 親カテゴリー選択後のイベント
//   $('#parent_category').on('change', function(){
//     var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
//     if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
//       $.ajax({
//         url: 'get_category_children',
//         type: 'GET',
//         data: { parent_name: parentCategory },
//         dataType: 'json',
//         error : function(XMLHttpRequest, textStatus, errorThrown) {
//                     console.log("ajax通信に失敗しました");
//                     console.log("XMLHttpRequest : " + XMLHttpRequest.status);
//                     console.log("textStatus     : " + textStatus);
//                     console.log("errorThrown    : " + errorThrown.message);
//                 },
//                 //ajax通信成功
//                 success : function(response) {
//                     console.log("ajax通信に成功しました");
//                     console.log(response);
//                 }
//       })
//       .done(function(children){
//         $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
//         $('#grandchildren_wrapper').remove();
//         $('#size_wrapper').remove();
//         $('#brand_wrapper').remove();
//         var insertHTML = '';
//         children.forEach(function(child){
//           insertHTML += appendOption(child);
//         });
//         appendChidrenBox(insertHTML);
//       })
//       .fail(function(){
//         alert('カテゴリー取得に失敗しました');
//       })
//     }else{
//       $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
//       $('#grandchildren_wrapper').remove();
//       $('#size_wrapper').remove();
//       $('#brand_wrapper').remove();
//     }
//   });
//   // 子カテゴリー選択後のイベント
//   $('.listing-product-detail__category').on('change', '#child_category', function(){
//     var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
//     if (childId != "---"){ //子カテゴリーが初期値でないことを確認
//       $.ajax({
//         url: 'get_category_grandchildren',
//         type: 'GET',
//         data: { child_id: childId },
//         dataType: 'json'
//       })
//       .done(function(grandchildren){
//         if (grandchildren.length != 0) {
//           $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
//           $('#size_wrapper').remove();
//           $('#brand_wrapper').remove();
//           var insertHTML = '';
//           grandchildren.forEach(function(grandchild){
//             insertHTML += appendOption(grandchild);
//           });
//           appendGrandchidrenBox(insertHTML);
//         }
//       })
//       .fail(function(){
//         alert('カテゴリー取得に失敗しました');
//       })
//     }else{
//       $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
//       $('#size_wrapper').remove();
//       $('#brand_wrapper').remove();
//     }
//   });
// });