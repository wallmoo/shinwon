var $html = $('html').eq(0);
var $contents = $('#body').eq(0);

/* Text Fit */
$(".js #title").each(function(){
	$(this).css('visibility', 'visible').fitText(1.1, { minFontSize: '16px', maxFontSize: '22px' });
});
var console = window.console || { log: function() {} }; // console 에러 방지
var throttleSide = (function () { // 지연실행
	var _timerThrottle;
    return function (fn, delay) {
        clearTimeout(_timerThrottle);
        _timerThrottle = setTimeout(fn, delay);
    };
})();
var resizeContents = function(){
	var $el = $('#body');
	var _asideH = $('aside').height();
	var _height = $(window).height();
	// var _height = $(window).height() - $('header').outerHeight() - $('footer').outerHeight();

	if( _asideH > _height ){
		$el.css({ 'min-height' : _asideH - $('header').outerHeight() - $('footer').outerHeight() });
	}else {
		$el.css({ 'min-height' : _height - $('header').outerHeight() - $('footer').outerHeight() });
	}
};
var repeatResize = function(){
	_timerDelay = setTimeout(function(){
		clearTimeout(_timerDelay);
		resizeContents();
		repeatResize();
	}, 3000);
};
if (window.DeviceOrientationEvent) {
	window.addEventListener('orientationchange', resizeContents, false);
}

// 로드
$(window).on('load', function(){
	var _bar = $('#navigation');
	var _container = $('#container');
	resizeContents();
	throttleSide(function () { repeatResize(); }, 500);
	_bar.find('.nav-sub .active').parent().parent().addClass('active').siblings().removeClass('active');

	function resetMenu(){
		_bar.removeAttr('style');
		_container.removeAttr('style');
	};

	$('body').on('click','.fullscreen a', function(e){
		e.preventDefault();
		$(this).toggleClass('nav-off');
		if($(this).hasClass('nav-off')) {
			_bar.stop().animate({left:-220});
			_container.stop().animate({marginLeft:0});
		}
		else{
			_bar.stop().animate({left:0});
			_container.stop().animate({marginLeft:220});
		}
	})
	.on('click','.pushmenu a', function(e){
		e.preventDefault();
		var $this = $(this);
		if ( $this.hasClass(_class) ) {
			$this.removeClass(_class);
			_bar.animate({ right : '-220px' });
			_container.animate({ marginLeft : '0px', marginRight : '0px' });			
			setTimeout(function() { _bar.hide(); }, 300);
		} else {
			resetMenu();
			$this.addClass(_class);
			_bar.show().animate({ right : '0px' });
			_container.animate({ marginLeft : '-220px', marginRight : '220px' });
		}
	});
	_bar.find('.nav-sub li').on('click', 'a', function(){
		$(this).parent().addClass('active').siblings().removeClass('active').end()
		.parent().parent().addClass('active').siblings().removeClass('active');
	});

	// keyword Search toggle
	$('#keySearchBtn').click(function(){
		$(this).toggleClass('open');
		if($(this).hasClass('open')) $(this).find('b').hide().next().show();
		else $(this).find('b').show().next().hide();
		$('#keywordSearch').slideToggle(500);
	});

	// 리사이즈
	$(window).on('resize', function(){
		throttleSide(function(){ resizeContents(); }, 500);
		resetMenu();
	});
})


$(function() {
	// datepicker
    $.datepicker.regional['ko'] = {
		showOn: 'both', // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
		buttonImage: '/img/admin/ico_calendar.png', // 버튼 이미지
		buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
		monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월', '7월','8월','9월','10월','11월','12월'], 
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear:true,
		yearSuffix: '년',
		changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시
		changeYear: true // 년을 바꿀 수 있는 셀렉트 박스를 표시  
    };
    $.datepicker.setDefaults($.datepicker.regional['ko']);
	$('.datepicker').datepicker();
	
	var $sDate= $('.s-datepicker'); // 종료일
	var $eDate= $('.e-datepicker'); // 시작일

    $sDate.datepicker("option", "maxDate", $eDate.val());
    $sDate.datepicker("option", "onClose", function ( selectedDate ) {
        $eDate.datepicker( "option", "minDate", selectedDate );
    });
    $eDate.datepicker("option", "minDate", $sDate.val());
    $eDate.datepicker("option", "onClose", function ( selectedDate ) {
		$sDate.datepicker( "option", "maxDate", selectedDate );
    });

	// tab size
	$('div.justified').each(function(){
		var $this = $(this);
		var _li = $this.children().children('li');
		var _liSize = _li.size();
		var _liM = _liSize - 1;
		var _liWidth = ( $this.width() - _liSize ) / _liSize ;

		_li.width(_liWidth);	
	});

	// toggle
	$(document).on('mouseup','[data-toggle=toggle] > ul.tab li a', function(e){
		e.preventDefault();

		$(this).parent().siblings().removeClass('active');
		$(this).parent().addClass('active');
		$(this.hash).siblings('.toggle').hide();
		$(this.hash).slideDown();
	});

	// dropdown
	$(document).on('mouseup','[data-toggle=dropdown]', function(e){
		e.preventDefault();
		var $this = $(this);
		var _i = $this.find('i');
		var _dropdown = $this.next();
		var _class = _i.attr('class');
		
		if(_class.slice(-4) == 'down'){
			$('.dropdown-menu').hide();
			$('[data-toggle=dropdown]').removeClass('active');
			$('[data-toggle=dropdown]').find('i').attr('class', _class.replace('up', 'down'));
			$this.addClass('active');
			 _i.attr('class', _class.replace('down', 'up'));
			_dropdown.show().css({ top : $(this).offset().top + $this.height(), left : $(this).offset().left });
			
			 if ($this.hasClass('last-child')){
				var _width = _dropdown.outerWidth() - $this.width();
				_dropdown.show().css({ left : $(this).offset().left - _width  });
				return
			 }
		}else{
			$this.removeClass('active');
			 _i.attr('class', _class.replace('up', 'down'));
			_dropdown.hide();
		}
	});

	// thumbnail
	$('.thumb').each(function() {
		var $this = $(this);
		var _sizeW = $this.attr('data-thumb').split('/')[0];
		var _sizeH = $this.attr('data-thumb').split('/')[1];
		
		$this.children().css({ width: _sizeW, height:_sizeH, lineHeight : _sizeH+'px' });
		if(_sizeW < 100) {
			$this.children('em').empty();
		}
	});

	// gallery
    $('.gallery-b a.thumb-link').hover(function () {
		var $this = $(this);

		$this.append('<span class="more"><i class="icon-plus"></i></span>');
		$this.children('span.thumbnail').children().css({ opacity : 0.7 });
	}, function () { 
		var $this = $(this);

		$this.children('span.more').remove();
		$this.children('span.thumbnail').children().css({ opacity : 1 });
	});

    $('.gallery-list').each(function () {
		var $this = $(this);
		var _liWidth = $(this).width() / $(this).find('li').outerWidth(true);
		var _width = Math.round(_liWidth);

		$this.find('li:nth-child(' + _width + 'n+1)').addClass('clear');
	});

	// message
	$(document).on('mouseup','.message a.btn-remove', function(e){
		e.preventDefault();
		var $this = $(this);
		$this.parent().remove();
	});
 

});