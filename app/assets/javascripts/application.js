// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery.slick
//= require bootstrap-sprockets
//= require gmaps/google
//= require_tree .

//ハンバーガー
$(function() {
  $('.menu-trigger').on('click', function() {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    return false;
  });
 	$('.toggle_switch').on('click',function(){
	  $(this).toggleClass('open');
	  $(this).next('.toggle_contents').slideToggle();
	});
});

$(function(){
	$("#acMenu dt").on("click", function() {
	$(this).next().slideToggle();
	});
});

// ABOUTフェードイン
$(function () {
// フェードイン要素を隠す
  $('.target').hide();
// 繰り返し処理
// function (i)はjQueryメソッドのコールバック関数
// ※ここではiはインデックス番号、0番から順にdelayをかけて一つづつ表示させる
  $('.target').each(function (i) {
    $(this).delay(1000 * i).fadeIn(1000);
  });
});

// ヘッダーENTRYのスライド
$(function(){

$('#slide_btn').on('click', function(){
    $('#slide_box').slideToggle('fast');
});

});