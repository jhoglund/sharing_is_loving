// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload
//= require_tree .
//= require ./infinitive_scrolling


$(function(){
	$('#new_comment').bind('ajax:success', function(e,data){
	  $('.comments').show().append(data);
	});
});
$(function(){
	$('.rate').bind('ajax:success', function(e,data){
		$(this).closest('.rating').find('.badge').html(data)
	});
});


// Infinitive scrolling
(function(){
  var page = 1,
      loading = false;

  function nearBottomOfPage() {
    return $(window).scrollTop() > $(document).height() - $(window).height() - 200;
  }

  $(window).scroll(function(){
    if(loading) {
      return;
    }

    if(nearBottomOfPage()) {
      loading=true;
      page++;
      $('.spinner').show();
			$.ajax({
        url: '/items?page=' + page,
        type: 'get',
        dataType: 'html',
        success: function(html) {
					$('.spinner').hide();
					$('.items-list').append(html)
					$(window).sausage('draw');
          loading=false;
        },
				error:function(e,data){
				}
      });
    }
  });

  $(window).sausage();
}());
