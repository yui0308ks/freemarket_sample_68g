// $(function(){
//     $('#lists div[id != "mypage__main__list__notice_list"] ').hide();
  
//     $("a").click(function(){

//       $(list).hide();

//       $(this).atter("href");

//       return false;
//     });

// });

// $(function() {

//   $(".mypage__main__list__tab").click(function() {

//       var num = $(".mypage__main__list__tab").index(this);

//       $("#mypage__main__list__notice_list").addClass('#mypage__main__list__todo_list');

//       $("#mypage__main__list__notice_list").eq(num).removeClass('#mypage__main__list__todo_list');

//       $(".mypage__main__list__tab").removeClass('.mypage__main__list__tab__notice');

//       $(this).addClass('.mypage__main__list__tab__notice')

//   });

// });




// $(function()  {
//   // タブのDOM要素を取得し、変数で定義
//   let tabs = $(".mypage__main__list__tab");

//   // クラスの切り替えをtabSwitch関数で定義
//   function tabSwitch() {
//     // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
//     $('.active').removeClass("active");

//     // クリックしたタブにactiveクラスを追加

//     $(this).addClass("active");

//     // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
//     const index = tabs.index(this);

//     // クリックしたタブに対応するshowクラスを追加する
//     $("#lists__list").removeClass("show").eq(index).addClass("show");
//   }

//   // タブがクリックされたらtabSwitch関数を呼び出す
//   tabs.click(tabSwitch);    
// });


