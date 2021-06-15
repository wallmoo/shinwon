$(function() {

    var $window = $(window),
        $html = $('html'),
        $body = $('body'),
        $inviewEl = $('.inview');

    var $gnb = $('#gnb'),
        $gnbSpacer = $gnb.next();


    // navigation collapse
    if (typeof $.cookie == 'function') {
        if ($.cookie('asideOff') == 'true') {
            $html.addClass('is-aside-out');
        } else {
            $html.removeClass('is-aside-out');
        }
        if ($.cookie('quickOff') == 'true') {
            $html.addClass('is-quick-out');
        } else {
            $html.removeClass('is-quick-out');
        }
    }

    $('.js-toggle-nav').on('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        var _class = ($html.hasClass('is-sm')) ? $this.data('class') : $this.data('lg-class');

        // 수정이 필요함
        _class = $this.data('lg-class');

        var _sub = function() {

            switch (_class) {
                case 'is-aside-in':
                    $html.removeClass('is-quick-in');
                    break;
                case 'is-quick-in':
                    $html.removeClass('is-aside-in');
                    break;
                default:
                    // done
            }

            $html.toggleClass(_class);

        };

        var _setCookie = function() {
            // navigation cookie
            if (typeof $.cookie == 'function') {
                if (_class == 'is-aside-out') {
                    if ($html.hasClass('is-aside-out')) {
                        $.cookie('asideOff', true, {
                            path: '/'
                        });
                    } else {
                        $.cookie('asideOff', false, {
                            path: '/'
                        });
                    }
                }
                if (_class == 'is-quick-out') {
                    if ($html.hasClass('is-quick-out')) {
                        $.cookie('quickOff', true, {
                            path: '/'
                        });
                    } else {
                        $.cookie('quickOff', false, {
                            path: '/'
                        });
                    }
                }
            }
        };

        _sub();
        _setCookie();

    });


    var _gnbTop = ($gnb.length) ? $gnb.offset().top : 0;

    $gnbSpacer.height($gnb.height());

    $window.on('load scroll', function(e) {

        var _scrollTop = $window.scrollTop();

        // sticky
        if (_scrollTop >= _gnbTop) {
            $html.addClass('is-sticky-in');
        } else {
            $html.removeClass('is-sticky-in');
        }

        var _minHeight = $(window).height() + $(window).scrollTop();

        if ($html.hasClass('is-sticky-in') !== true) {
            $('.aside').css({
                'min-height': _minHeight
            });
        } else {
            $('.aside').removeAttr('style');
        }

        $inviewEl.eachQ(function() {
            var $this = $(this);
            if ($.returnInView($this) === true) {
                $this.addClass('in');
            } else {
                $this.removeClass('in');
            }
        });

    });

    var initModel = (function() {

        // inview
        $inviewEl.each(function() {
            var $this = $(this);
            var _delay = 80;
            if ($this.data('delay') !== undefined) {
                _delay = _delay * $this.data('delay') + 'ms';
                $this.css('transition-delay', _delay);
            }
        });

    })();


    // active current item
    var _activeCurrent = function(_el) {
        _el.addClass('active').siblings().removeClass('active');
    };



    /**
     * parralaxr
     * $('.background-fixed').parallaxr();
     */
    $.fn.parallaxr = function() {

        var $this = $(this);
        var _scrollTop;

        var _core = function(_el) {

            var _ratio = (_el.data('ratio') !== undefined) ? _el.data('ratio') : 2;
            var _pos = _scrollTop - _el.offset().top,
                _posY = Math.abs(_pos) / _ratio;
            _posY = (_pos > 0) ? 0 - _posY : _posY;
            _el.css('background-position', '50% ' + _posY + 'px');
        };

        $window.on('resize scroll', function(e) {
            _scrollTop = $window.scrollTop();
            $this.each(function() {
                var $el = $(this);
                // && _isMobile !== true
                if ($.returnInView($el) === true && $html.hasClass('no-touch')) {
                    _core($el);
                }
            });
        }).trigger('resize');

    };

    $('#top').parallaxr();

    /**
     * 프로그레스바
     * @return {[type]} [description]
     */
    $.progressBar = function(el) {

        // if (typeof Nanobar !== 'function' && typeof imagesLoaded !== 'function') return false;

        // var $el = (el !== undefined) ? el : 'body';
        // var imgLoad = imagesLoaded($el);
        // var nanobar = new Nanobar({ // progress bar
        //     bg: '#C9CC14',
        //     id: 'loadingBar'
        // });
        // imgLoad.on('always', function() {
        //     for (var i = 0, len = imgLoad.images.length; i < len; i++) {
        //         var _result = parseInt((i / len) * 100, 10);
        //         nanobar.go(_result);
        //     }
        //     nanobar.go(100);
        // });
    };

    // $.progressBar($('#container'));

    /**
     * AJAX 인디케이터 설정
     */
    var setAjaxProgressbar = (function() {

        // if (typeof $.progressBar == 'function') {
        //     $(document).ajaxStart(function() {
        //         $.progressBar();
        //     });
        // }

        // alert('1');

    })();

});