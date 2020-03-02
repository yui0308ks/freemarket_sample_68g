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










// window.addEventListener("load", function(){
//   $(function(){
//     $( '.input-default' ).on('click', function(){
//       let name = $(this).val();
//       if(name == 0){
//         $('.input-default').css('border-color','red');
//         $('.no-product-name').text('入力してください');
//       }else{
//         $('.input-default').css('border-color','');
//         $('.no-product-name').text('');
//       };
//     });
//     $( '.input-default' ).on('change',function(){
//       let name = $(this).val();
//       if(name == 0){
//         $('.input-default').css('border-color','red');
//         $('.no-product-name').text('入力してください');
//       }else{
//         $('.input-default').css('border-color','');
//         $('.no-product-name').text('');
//       };
//     });
//   })
//   $('.textarea-default').on('click',function(){
//     let description = $(this).val();
//     if(description == 0){
//       $('.textarea-default').css('border-color','red')
//       $('.no-product2').text('入力してください')
//     }else{
//       $('textarea-default').css('border-color','')
//       $('.no-product2').text('')
//     }
//   });
//   $('.textarea-default').on('change',function(){
//     let description = $(this).val();
//     if(description == 0){
//       $('.textarea-default').css('border-color','red')
//       $('.no-product2').text('入力してください')
//     }else{
//       $('.textarea-default').css('border-color','')
//       $('.no-product2').text('')
//     }
//   });
//   $('.default02').on('click',function(){
//     let status = $(this).val();
//     if(status == 0){
//       $('.default02').css('border-color','red')
//       $('.no-product4').text('選択してください')
//     }else{
//       $('.default02').css('border-color','')
//       $('.no-product4').text('')
//     }
//   });
//   $('.default02').on('change',function(){
//     let status = $(this).val();
//     if(status == 0){
//       $('.default02').css('border-color','red')
//       $('.no-product4').text('選択してください')
//     }else{
//       $('.default02').css('border-color','')
//       $('.no-product4').text('')
//     }
//   });
//   $('.default03').on('click',function(){
//     let send_price = $(this).val();
//     if(send_price == 0){
//       $('.default03').css('border-color','red')
//       $('.no-product5').text('選択してください')
//     }else{
//       $('.default03').css('border-color','')
//       $('.no-product5').text('')
//     }
//   });
//   $('.default03').on('change',function(){
//     let send_price = $(this).val();
//     if(send_price == 0){
//       $('.default03').css('border-color','red')
//       $('.no-product5').text('選択してください')
//     }else{
//       $('.default03').css('border-color','')
//       $('.no-product5').text('')
//     }
//   });
//   $( '.tk-price' ).on('click', function(){
//     let price = $(this).val();
//     if( price == 0){
//       $('.tk-price').css('border-color','red')
//       $('.no-product2').text('300以上9999999以下で入力してください')
//     }else{
//       $('.tk-price').css('border-color','')
//       $('.no-product2').text('')
//     }
//   });
//   $( '.tk-price' ).on('change',function(){
//     let price = $(this).val();
//     if( price == 0){
//       $('.tk-price').css('border-color','red')
//       $('.no-product2').text('300以上9999999以下で入力してください')
//     }else{
//       $('.tk-price').css('border-color','')
//       $('.no-product2').text('')
//     }
//   });
//   $('.default05').on('click',function(){
//     let ship_day = $(this).val();
//     if(ship_day == 0){
//       $('.default05').css('border-color','red')
//       $('.no-product7').text('選択してください')
//     }else{
//       $('.default05').css('border-color','')
//       $('.no-product7').text('')
//     }
//   });
//   $('.default05').on('change',function(){
//     let ship_day = $(this).val();
//     if(ship_day == 0){
//       $('.default05').css('border-color','red')
//       $('.no-product7').text('選択してください')
//     }else{
//       $('.default05').css('border-color','')
//       $('.no-product7').text('')
//     }
//   });
//   $(function(){
//     let buildPrompt = `<option value>---</option>`
//     let buildHtmlOption = function(parent) {
//       let option = `<option value ="${parent.id}">${parent.name}</option>`
//       return option
//     }
//     $('#parent').change(function() {
//       let parent_id = $(this).val();
//       $.ajax({
//         type: 'GET',
//         url: '/products/new/mid_category',
//         data: {big_category_id: parent_id},
//         dataType: 'json'
//       })
//       .done(function(parent) {
//         $('.child').css('display', 'block');
//         $('#child').empty();
//         $('.grand_child').css('display', 'none');
//         $('#child').append(buildPrompt);
//         parent.forEach(function(child) {
//           var html_option = buildHtmlOption(child);
//           $('#child').append(html_option);
//         });
//       })
//       .fail(function() {
//         alert('aaaa')
//       });
//     });
//     $(this).on("change", "#child", function() {
//       let parent_id = $("#parent").val();
//       let child_id = $("#child").val();
//       $.ajax({
//           type: 'GET',
//           url: '/products/new/small_category',
//           data: {
//             big_category_id: parent_id,
//             mid_category_id: child_id
//           },
//           dataType: 'json'
//       })
//       .done(function(parent) {
//         $('.grand_child').css('display', 'block');
//         $('#grand_child').empty();
//         $('#grand_child').append(buildPrompt);
//         parent.forEach(function(child) {
//           var html_option = buildHtmlOption(child);
//           $('#grand_child').append(html_option);
//         });
//       })
//     });
//   })
//   $(function(){
//     const buildFileField = (index_box, src)=>{
//       let html;
//       let index = Math.min(...index_box);
//       if (index_box.length == 1) {
//          html = `<div class='item-image'>
//                   <div class=' item-image__content'>
//                     <div class='item-image__content--icon'>
//                       <img src=${src} width="114" height="80" >
//                     </div>
//                   </div>
//                   <div class='item-image__operetion'>
//                     <div class='item-image__operetion--delete' data-index="${index}">削除</div>
//                   </div>
//                 </div>`
//       }else{
//         html = `<div class='item-image'>
//                   <div class=' item-image__content'>
//                     <div class='item-image__content--icon'>
//                       <img src=${src} width="114" height="80" >
//                     </div>
//                   </div>
//                   <div class='item-image__operetion'>
//                     <div class='item-image__operetion--delete' data-index="${index}">削除</div>
//                   </div>
//                   <input value="" class="sell-upload-drop-file" id="product_images_attributes_${index}_name" type="file" name="product[images_attributes][${index}][name]">
//                 </div>`
//       }
//       return html;
//     }
//     let file_index = [0,1,2,3,4,5,6,7,8,9];
//     $('#image-box-1').on('change', '.sell-upload-drop-file', (e)=>{
//       let file = e.target.files[0]
//       let file_url = window.URL.createObjectURL(file);
//       if (file_index.length != 0){
//         $('#image-box__container').hide();
//         $('#image-box__container').before(buildFileField(file_index, file_url))
//         file_index.shift();
//       }
//     })
//     $('#image-box-1').on('click', '.item-image__operetion--delete', function(){
//       let delete_image_id = parseInt($(this).attr('data-index'))
//       file_index.push(delete_image_id);
//       file_index.sort();
//       if (file_index.length == 10) {
//         $('#image-box__container').show();
//       }else if(file_index.length == 1){
//         let html = `<input value="" class="sell-upload-drop-file" id="product_images_attributes_${delete_image_id}_name" type="file" name="product[images_attributes][${delete_image_id}][name]">`
//         $('#image-box-1').append(html);
//       }
//       $(this).parent().parent().remove();
//     })
//   })
// })



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