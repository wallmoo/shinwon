$(function() {
    $('body').jpreLoader();
});

var $html = $('html').eq(0);
var $contents = $('#body').eq(0);
/* Text Fit */
$(".js #title").each(function() {
    $(this).css('visibility', 'visible').fitText(1.1, {
        minFontSize: '16px',
        maxFontSize: '22px'
    });
});

var console = window.console || {
    log: function() {}
}; // console 에러 방지
var throttleSide = (function() { // 지연실행
    var _timerThrottle;
    return function(fn, delay) {
        clearTimeout(_timerThrottle);
        _timerThrottle = setTimeout(fn, delay);
    };
})();
var resizeContents = function() {
    var $el = $('#body');
    var _asideH = $('aside').height();
    var _height = $(window).height();
    // var _height = $(window).height() - $('header').outerHeight() - $('footer').outerHeight();


    if (_asideH > _height) {
        $el.css({
            'min-height': _asideH - $('header').outerHeight() - $('footer').outerHeight()
        });
    } else {
        $el.css({
            'min-height': _height - $('header').outerHeight() - $('footer').outerHeight()
        });
    }
    //	console.log('#contents height:' + _height);
};
var repeatResize = function() {
    _timerDelay = setTimeout(function() {
        clearTimeout(_timerDelay);
        resizeContents();
        repeatResize();
    }, 3000);
};
if (window.DeviceOrientationEvent) {
    window.addEventListener('orientationchange', resizeContents, false);
}


// side menu
var _bar = $('aside');
var _container = $('#container');

function resetMenu() {
    _bar.removeAttr('style');
    _container.removeAttr('style');
};

function lnbToggle() {
    var _class = 'nav-off';

    $(document).on('mouseup', '.fullscreen a', function(e) {
        e.preventDefault();

        var $this = $(this);
        if ($this.hasClass(_class)) {
            $this.removeClass(_class);
            _bar.animate({
                left: '0px'
            });
            _container.show().animate({
                marginLeft: '220px'
            });
        } else {
            $this.addClass(_class);
            _bar.animate({
                left: '-220px'
            });
            _container.show().animate({
                marginLeft: '0px'
            });
        }
    });

    $(document).on('mouseup', '.pushmenu a', function(e) {
        e.preventDefault();

        var $this = $(this);

        if ($this.hasClass(_class)) {
            $this.removeClass(_class);
            _bar.animate({
                right: '-220px'
            });
            _container.animate({
                marginLeft: '0px',
                marginRight: '0px'
            });

            setTimeout(function() {
                _bar.hide();
            }, 300);
        } else {
            resetMenu();
            $this.addClass(_class);
            _bar.show().animate({
                right: '0px'
            });
            _container.animate({
                marginLeft: '-220px',
                marginRight: '220px'
            });
        }
    });
};

// navigation
function navigation() {

    // 하위 메뉴 개수 표시
    $('#navigation > nav > ul > li > a').each(function() {
        var _d2Size = $(this).siblings('ul').children().size();

        $(this).append(' <span class="num">(' + _d2Size + ')</span>');
        $(this).parent().siblings().first().children('span.num').remove();
    });

    // $('#navigation > nav > ul > li a').click(function(e) {
    // 2016-04-04 navigation d1 toggle 적용
    $('#navigation a.d1').click(function(e) {
        e.preventDefault();

       	var $parent = $(this).parent(),
       		$ul = $parent.find('ul').eq(0);
	
		$parent.toggleClass('active');
		$parent.siblings().removeClass('active').find('ul').hide();
		
		if ($ul.length){
			if($parent.hasClass('active')){
				$ul.show();
			} else {
				$ul.hide();
			}
		} else {
			$(location).attr('href', $(this).attr('href'));
		}
        
    });
};

// tab size
function tabJustified() {
    var $this = $('div.justified');
    var _li = $this.children().children('li');
    var _liSize = _li.size();
    var _liM = _liSize - 1;
    var _liWidth = ($this.width() - _liSize) / _liSize;

    _li.width(_liWidth);
};

$(window).on('load', function() { // 로드
    resizeContents();
    lnbToggle();
    navigation();
    tabJustified();

    throttleSide(function() {
        repeatResize();
    }, 500);
});
$(window).on('resize', function() { // 리사이즈
    throttleSide(function() {
        resizeContents();
    }, 500);

    resetMenu();
    tabJustified();
});


(function($) {
    $.fn.extend({
        jsPopup: function() {
            $(this).on('click', function(e) {
                e.preventDefault();
                var $this = $(this);
                var _href = $this.attr('href'),
                    _width = $this.data('width') ? $this.data('width') : 400,
                    _height = $this.data('height') ? $this.data('height') : 300,
                    _scroll = ($this.data('scroll') === true) ? 'yes' : 'no';
                popup(_href, _width, _height, _scroll);
            });
        }
    })
})(jQuery);

// 이전 날짜들은 선택막기 
function noBefore(date) {
	// 오늘 날짜도 선택 가능하게 하기 위해 어제 일자로 지정 
	var today = new Date();
	today.setDate(today.getDate()-1);
    if (date > today)
        return [true];
    return [false];
}

$(function() {

    if (100 < $(window).scrollTop()) {
        $('#skyscraper').stop().addClass('in');
    }

    $(window).on('scroll', function() {

        if (100 < $(window).scrollTop()) {
            $('#skyscraper').addClass('in');
        } else {

            $('#skyscraper').removeClass('in');
        }
    });
    
    $("#top").on('click', function(e) {
        e.preventDefault();
        $('html, body').animate({
            'scrollTop': 0
        });
    });
    
    // datepicker
    $.datepicker.regional['ko'] = {
        showOn: 'both', // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
        buttonImage: '../../../am/img/ico_calendar.png', // 버튼 이미지
        buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시
        changeYear: true // 년을 바꿀 수 있는 셀렉트 박스를 표시  
    };
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    $('.datepicker').datepicker();

    var $sDate = $('.s-datepicker'); // 종료일
    var $eDate = $('.e-datepicker'); // 시작일
    var $pDate = $('.p-datepicker'); // 이전날짜

    $sDate.datepicker("option", "maxDate", $eDate.val());
    $sDate.datepicker("option", "onClose", function(selectedDate) {
        $eDate.datepicker("option", "minDate", selectedDate);
    });
    $eDate.datepicker("option", "minDate", $sDate.val());
    $eDate.datepicker("option", "onClose", function(selectedDate) {
        $sDate.datepicker("option", "maxDate", selectedDate);
    });
    $pDate.datepicker("option", "beforeShowDay", noBefore);


    $('.datepicker2').datepicker();
    var $sDate2 = $('.s-datepicker2'); // 종료일
    var $eDate2 = $('.e-datepicker2'); // 시작일
    var $pDate2 = $('.p-datepicker2'); // 이전날짜

    $sDate2.datepicker("option", "maxDate", $eDate2.val());
    $sDate2.datepicker("option", "onClose", function(selectedDate) {
        $eDate2.datepicker("option", "minDate", selectedDate);
    });
    $eDate2.datepicker("option", "minDate", $sDate2.val());
    $eDate2.datepicker("option", "onClose", function(selectedDate) {
        $sDate2.datepicker("option", "maxDate", selectedDate);
    });
    $pDate2.datepicker("option", "beforeShowDay", noBefore);

    var _tabTimer = null;

    // toggle
    $(document).on('mouseup', '[data-toggle=toggle] ul.tab li a', function(e) {
        e.preventDefault();


        var pos = $(this).parents('div.toggler').position().top - 65;
        $("html, body").animate({
            scrollTop: pos
        });

        $(this).parent().siblings().removeClass('active');
        $(this).parent().addClass('active');

        var _hash = $(this.hash);

        setTimeout(function() {

            _hash.siblings('.toggle').hide();
            _hash.show();


        }, 50);

    });

    // dropdown
    $(document).on('mouseup', '[data-toggle=dropdown]', function(e) {
        e.preventDefault();
        var $this = $(this);
        var _i = $this.find('i');
        var _dropdown = $this.next();
        var _class = _i.attr('class');

        if (_class.slice(-4) == 'down') {
            $('.dropdown-menu').hide();
            $('[data-toggle=dropdown]').removeClass('active');
            $('[data-toggle=dropdown]').find('i').attr('class', _class.replace('up', 'down'));
            $this.addClass('active');
            _i.attr('class', _class.replace('down', 'up'));
            _dropdown.show().css({
                top: $(this).offset().top + $this.height(),
                left: $(this).offset().left
            });

            if ($this.hasClass('last-child')) {
                var _width = _dropdown.outerWidth() - $this.width();
                _dropdown.show().css({
                    left: $(this).offset().left - _width
                });
                return
            }
        } else {
            $this.removeClass('active');
            _i.attr('class', _class.replace('up', 'down'));
            _dropdown.hide();
        }
    });

    // thumbnail
    $('.thumb').each(function() {
        var $this = $(this);
        if ($this.data('thumb') !== undefined) {
            var _sizeW = $this.data('thumb').split('/')[0];
            var _sizeH = $this.data('thumb').split('/')[1];

            $this.children().css({
                width: _sizeW,
                height: _sizeH,
                lineHeight: _sizeH + 'px'
            });
            if (_sizeW < 100) {
                $this.children('em').empty();
            }
        }
    });

    // gallery
    $('.gallery-b a.thumb-link').hover(function() {
        var $this = $(this);

        $this.append('<span class="more"><i class="icon-plus"></i></span>');
        $this.children('span.thumbnail').children().css({
            opacity: 0.7
        });
    }, function() {
        var $this = $(this);

        $this.children('span.more').remove();
        $this.children('span.thumbnail').children().css({
            opacity: 1
        });
    });

    $('.gallery-list').each(function() {
        var $this = $(this);
        var _liWidth = $(this).width() / $(this).find('li').outerWidth(true);
        var _width = Math.round(_liWidth);

        $this.find('li:nth-child(' + _width + 'n+1)').addClass('clear');
    });

    // message
    $(document).on('mouseup', '.message a.btn-remove', function(e) {
        e.preventDefault();
        var $this = $(this);
        $this.parent().remove();
    });

    // popup open
    // 팝업 열기
    $('a.js-modal[target="_blank"]').jsPopup();

    // bbs preview
    $('a.preview').hover(function() {
        var _box = $(this).next();
        _box.show();
    }, function() {
        var _box = $(this).next();
        _box.hide();
    });


    // table toggle
    $(document).on('mouseup', 'div.table-toggle table td a.toggle-subject', function(e) {
        e.preventDefault();

        var $this = $(this);
        var _link = $('div.table-toggle table td a.toggle-subject');
        var _box = $this.parent().parent().siblings('.hide');
        var _next = $this.parent().parent().next();

        if ($this.hasClass('open')) {
            $this.removeClass('open');
            _next.hide();
        } else {
            _link.removeClass('open');
            $this.addClass('open');
            _box.hide();
            _next.show();
        }
    });
    

    // search 자동완성
//    $('input.search-view').on('keyup', function(e) {
//        e.preventDefault();
//        var wrap = $(this).next('.search-list');
//
//        wrap.addClass('in');
//    });
    $('input.search-view').on('focusout', function(e) {
        e.preventDefault();
        var wrap = $(this).next('.search-list');

        if (wrap.css('display') == 'block') {
            setTimeout(function() {
                wrap.hide();
            }, 200);
        }
    });
});

// 팝업 관련 함수
var popup = function(_href, _width, _height, _scroll, _id) {
    if (!_scroll) _scroll = 'no';
    else _scroll = 'yes';
    var _left = parseInt((screen.width - _width) / 2, 10),
        _top = parseInt((screen.height - _height) / 2, 10) - 100;
    var popup = window.open(_href, 'popup' + _id, 'top=' + _top + ', left=' + _left + ', width=' + _width + ', height=' + _height + ', scrollbars=' + _scroll + ', toolbar=no, menubar=no, location=no, resizable=true, status=yes');
    popup.focus();
};

function treePageSetting() {

    // datepicker
    $.datepicker.regional['ko'] = {
        showOn: 'both', // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
        buttonImage: '../../../am/img/ico_calendar.png', // 버튼 이미지
        buttonImageOnly: true, // 버튼에 있는 이미지만 표시한다.
        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시
        changeYear: true // 년을 바꿀 수 있는 셀렉트 박스를 표시  
    };
    $.datepicker.setDefaults($.datepicker.regional['ko']);
    $('.datepicker').datepicker();

    var $sDate = $('.s-datepicker'); // 종료일
    var $eDate = $('.e-datepicker'); // 시작일
    var $pDate = $('.p-datepicker'); // 이전날짜

    $sDate.datepicker("option", "maxDate", $eDate.val());
    $sDate.datepicker("option", "onClose", function(selectedDate) {
        $eDate.datepicker("option", "minDate", selectedDate);
    });
    $eDate.datepicker("option", "minDate", $sDate.val());
    $eDate.datepicker("option", "onClose", function(selectedDate) {
        $sDate.datepicker("option", "maxDate", selectedDate);
    });
    $pDate.datepicker("option", "beforeShowDay", noBefore);


    $('.datepicker2').datepicker();
    var $sDate2 = $('.s-datepicker2'); // 종료일
    var $eDate2 = $('.e-datepicker2'); // 시작일
    var $pDate2 = $('.p-datepicker2'); // 이전날짜

    $sDate2.datepicker("option", "maxDate", $eDate2.val());
    $sDate2.datepicker("option", "onClose", function(selectedDate) {
        $eDate2.datepicker("option", "minDate", selectedDate);
    });
    $eDate2.datepicker("option", "minDate", $sDate2.val());
    $eDate2.datepicker("option", "onClose", function(selectedDate) {
        $sDate2.datepicker("option", "maxDate", selectedDate);
    });
    $pDate2.datepicker("option", "beforeShowDay", noBefore);
}