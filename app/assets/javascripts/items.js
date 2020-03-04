// $(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
$(function(){
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  
    // プレビュー用のimgタグを生成する関数
    const buildImg = (index, url)=> {
      const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
      return html;
    }

  $('.hidden-destroy').hide();

  // $(document).on('change', 'input[type="file"]', function(e) {
  //   console.log('change')
  //   // fileIndexの先頭の数字を使ってinputを作る
  //   $('#image-box').append(buildFileField(fileIndex[0]));
  //   fileIndex.shift();
  //   // 末尾の数に1足した数を追加する
  //   fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  // });

  $('#image-box').on('change', '.js-file', function(e) {
    console.log('change')
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });


    // file_fieldのnameに動的なindexをつける為の配列
    let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    // ページ読み込み時に、既に使われているindexを除外(既に3枚投稿していたら、3つ除く)
    lastIndex = $('.js-file_group:last').data('index');
    fileIndex.splice(0, lastIndex);
    $('.hidden-destroy').hide();
    $('.hidden').hide();

    // "js-remove"がclickされたら、該当するindexの"hiddenCheck"がclickされる様に連動させる。
  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // console.log(targetIndex);
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる   
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    
    // 画像入力欄が0個にならないようにしておく 
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });

});