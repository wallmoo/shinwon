$.params = (typeof $.params !== 'undefined') ? $.params : []; // 전역 변수 선언
$.params.domain = (typeof $.params.domain !== 'undefined') ? $.params.domain : '..'; // 도메인
$.params.htmlClass = (typeof $.params.htmlClass !== 'undefined') ? $.params.htmlClass : ''; // 문서에 포함시킬 class
$.params.DETECT = (typeof $.params.DETECT !== 'undefined') ? $.params.DETECT : []; // 접속환경
$.params.SUPPORT = (typeof $.params.SUPPORT !== 'undefined') ? $.params.SUPPORT : []; // 접속브라우저 지원기능
$.params.BASE = (typeof $.params.BASE !== 'undefined') ? $.params.BASE : []; // html 문자열
$.params.STR = (typeof $.params.STR !== 'undefined') ? $.params.STR : []; // 문자열
$.params.nav = (typeof $.params.nav !== 'undefined') ? $.params.nav : [null, null];

// set var
$.params.STR.indicatorClass = 'indicator-load8'; // 인디케이터 타입

$(function() {

    // 인디케이터 타입 설정
    var indicatorClass = (typeof $.params.STR.indicatorClass !== 'undefined') ? $.params.STR.indicatorClass : 'indicator-load8';

    $('html').addClass(indicatorClass);

    var _scripts = [
        $.params.domain + '/js/epass.datepickr-0.5.js'
    ];

    // isotope for masonry layout
    var _scripts_isotope = [
        $.params.domain + '/js/plugins/isotope.pkgd.min.js'
    ];

    // DOM cache 
    var $document = $(document),
        $window = $(window),
        $head = $('head'),
        $meta = $('meta[http-equiv="X-UA-Compatible"]'),
        $html = $('html'),
        $body = $('body'),
        // $gnb = $('#gnb'),
        $depth1 = $('#depth1'),
        $depth2 = $('#depth2');

    // console log
    $window.on('load', function() {
        if ($.isFunction(console.log)) {
            console.log($.params);
        }
        $html.addClass('loaded');
    });


    // add class to HTML
    if ($.isFunction($.addClassToHtml)) {
        $.addClassToHtml([
            $.params.DETECT.browser,
            $.params.DETECT.device,
            $.params.STR.indicatorClass,
            $.params.STR.easing,
            $.params.STR.timeStamp
        ]);
    }

    var _bodyClass = ($body.attr('class') !== undefined) ? $body.attr('class') : 'default';

    // set responsive class
    var initResponsiveClass = (function() {

        var _new, _old;
        var _isOldIe = ($html.hasClass('lt-ie9'));

        var $sm = $('<div class="detector-sm"></div>').appendTo($body),
            $lg = $('<div class="detector-lg"></div>').appendTo($body);

        var _doTrigger = function() {
            console.log('changed');
            $html.removeClass('is-sticky-in');
        }

        var _core = function() {

            if (_isOldIe === true) {
                $html.addClass('is-lg');
            } else {
                _old = _new;
                if ($sm.is(':visible')) {
                    _new = 'is-sm';
                    $html.removeClass('is-lg');
                } else {
                    _new = 'is-lg';
                    $html.removeClass('is-sm');
                }
                $html.addClass(_new);

                if (_old !== _new) {

                    _doTrigger();

                }
            }
        };
        if (_isOldIe !== true) {
            $window.off('.responsive').on('resize.responsive orientationchange.responsive', function() {
                // $.throttle(function() {
                //     _core();
                // }, 10);
                _core();
            });
        }
        _core();
    }());

    // init masonry
    var initMasonry = function(_el) {

        var _timerMasonry = null;

        var _core = function() {
            _el.children().each(function(i) {
                var $this = $(this),
                    j = (i + 1),
                    _delay = 50;
                $this.addClass('nth-child-' + j).css('transition', 'opacity ' + j * _delay + 'ms');
            });
            _el.addClass('loaded');
            _timerMasonry = setTimeout(function() {
                _el.imagesLoaded(function() {
                    _el.isotope({
                        itemSelector: '.item-grid',
                        transitionDuration: '0.2s',
                        masonry: {
                            columnWidth: '.item-sizer' // 사이즈 판단 객체
                        }
                    });
                });
            }, 50);
        };

        if (typeof Isotope === 'function') {
            _core();
        } else if (typeof Isotope !== 'function' && $.isFunction(yepnope)) {
            yepnope({
                load: _scripts_isotope,
                complete: function() {
                    _core();
                }
            });
        }

    };

    /**
     * 시작날짜 마감날짜 값 입력
     * $('.js-dateTerm').dateTerm();
     * <button class="js-dateTerm" data-start="#dateA" data-end="#dateB" data-term="0">전체</button>
     * <button class="js-dateTerm" data-start="#dateA" data-end="#dateB" data-term="-7">1주일</button>
     * <button class="js-dateTerm" data-start="#dateA" data-end="#dateB" data-term="-30">1개월</button>
     * <button class="js-dateTerm" data-start="#dateA" data-end="#dateB" data-term="-60">2개월</button>
     * <button class="js-dateTerm" data-start="#dateA" data-end="#dateB" data-term="-90">3개월</button>
     * <input type="text" id="dateA" data-min="2015-02-10" data-max="2015-08-14" />
     */
    $.fn.dateTerm = function() {
        return this.each(function() {
            var $this = $(this);
            $this.on('click', function(e) {
                e.preventDefault();

                var $start = $($this.data('start')),
                    $end = $($this.data('end')),
                    _term = $this.data('term'),
                    _dateStart = new Date(),
                    _dateEnd = new Date();

                var formatDate = function(date) {
                    var _month = date.getMonth() + 1,
                        _weekDay = date.getDate(),
                        _result = (date.getFullYear() + "-" + ((_month < 10) ? "0" : "") + _month + "-" + ((_weekDay < 10) ? "0" : "") + _weekDay);
                    return _result;
                };

                if (!$start.length || !$end.length || _term === undefined) alert('error');

                if (_term === 0) {
                    $start.val("");
                    $end.val("");
                } else if (_term == 1) {
                    $start.val(formatDate(_dateStart));
                    $end.val(formatDate(_dateEnd));
                } else {
                    _dateStart.setDate(_dateStart.getDate() + _term);
                    _dateEnd.setDate(_dateEnd.getDate());
                    $start.val(formatDate(_dateStart));
                    $end.val(formatDate(_dateEnd));
                }

                return false;
            });
        });
    };

    // ui 공통
    var initCommon = function() {

        // 전체메뉴 토글
        $('.js-allmenu').on('click', function(e) {
            e.preventDefault();

            var $allMenu = $('#allMenu');
            var _core = function() {
                $html.toggleClass('is-allmenu is-overlay');
                if ($html.hasClass('is-allmenu is-overlay')) {
                    $allMenu.attr('tabindex', 0).focus();
                } else {
                    $(this).focus();
                }
            };
            _core();

            $('#overlay').off('.overlay').one('click.overlay', function(e) {
                $html.removeClass('is-allmenu is-overlay');
            });

        });

        // 전체메뉴
        $('#allMenuCore h4 a').on('click', function(e) {
            e.preventDefault();
            $(this).parents('.nav').toggleClass('active').siblings().removeClass('active');
        });

        // 제목 네비게이션
        var titleNav = function() {
            var $pageTitle = $('.page-title'),
                $inner = $pageTitle.find('.title'),
                $more = $('<a class="sm more" href="javascript:;"><i class="icon more" title="더 보기"><em>더 보기</em></i></a>'),
                $sub = null;
            if (typeof $.params.nav[0] !== 'undefined' && $.params.nav[0] !== null) {
                $sub = $depth2.children().eq($.params.nav[0]).clone();
                $sub.find('h4').remove();
                $sub.appendTo($inner);
                if ($inner.find('a.more').length) { // 버튼이 없으면 삽입
                    $more = $inner.find('a.more');
                } else {
                    $more.appendTo($inner);
                }
                $more.on('click', function() {
                    $pageTitle.toggleClass('in');
                });
            }
        };
        titleNav();

        // bbs nth-child, 게시판 목록 스타일링
//        $('.list-bbs').eachQ(function() {
//            var $list = $(this).addClass('js-nth-child-in'),
//                $notice = $list.find('.notice'),
//                $items = $list.find('.item-bbs').not('.notice').not('.head');
//
//            $notice.eachQ(function(i) {
//                $(this).addClass('nth-child-' + (i + 1));
//            });
//            $items.eachQ(function(i) {
//                $(this).addClass('nth-child-' + (i + 1));
//            });
//        });

        /* icon title */
//        $('i.icon em').eachQ(function() {
//            var $this = $(this);
//            $this.parent().attr('title', $this.text());
//        });

        /* focus form element */
        $('input').on({
            "focusin": function(e) {
                $(this).addClass('focus');
            },
            "focusout": function(e) {
                $(this).removeClass('focus');
            }
        });

        /* prevent datepicker when classic mode */
        if ($html.hasClass('is-lg')) {
            $('input[type="date"]').attr('type', 'text');
        }

        // 시작날짜 마감날짜 값 입력
        $('.js-dateTerm').dateTerm();

        yepnope({
            load: _scripts,
            complete: function() {
                console.log('ready');
                if ($('.js-datepickr').length > 0) { // datePickr
                    $.datePickr();
                }
            }
        });

        /* disabled */
        $('input.disabled, input[data-disabled]').prop('disabled', true);

        var $masonry = $('#masonry');

        if ($masonry.length > 0 && $masonry.hasClass('masonry')) {
            // 기능 차단
            initMasonry($masonry);
        }

        /* 상품 카테고리 탭 */
        var $tabProducts = $('#tabProducts');

        if ($tabProducts.length) {

            var _timerTab = null;

            $tabProducts.find('a.d1').on('click', function(e) {
                $(this).currentActive();
            });

            // div.xlarge 너비 설정
            var _setDivWidth = function(_bool) {
                $tabProducts.find('div.xlarge').each(function() {
                    var $this = $(this),
                        $d2 = $this.find('div.d2'),
                        _length = $d2.length,
                        _width = (_length * 100) + 1 + '%',
                        _maxWidth = (_length * 174) + 2 + 'px';
                    if (_bool === true && $html.hasClass('is-lg')) {
                        $d2.css('width', (100 / _length) + '%');
                        $this.css({
                            'width': _width,
                            'max-width': _maxWidth
                        });
                    } else {
                        $d2.removeAttr('style');
                        $this.removeAttr('style');
                    }
                });

            };

            $tabProducts.find('div.d1').hover(function() {
                clearTimeout(_timerTab);
                _setDivWidth(true);
                $(this).addClass('hover').siblings().removeClass('hover');
            }, function() {
                var $this = $(this);
                _timerTab = setTimeout(function() {
                    _setDivWidth(false);
                    $this.removeClass('hover');
                }, 500);
            });


        }

        /* 고객사 안내 */
        var $listPartner = $('#listPartner');

        if ($listPartner.length) {
            var $close = $listPartner.find('.js-button');
            $close.on('click', function(e) {
                e.preventDefault();
                var $this = $(this);
                var $parent = $this.parents('.detail');
                var $more = $parent.children('.more');
                if ($parent.hasClass('in')) {
                    $parent.removeClass('anim');
                    $more.slideUp(function() {
                        $parent.removeClass('in');
                    });
                } else {
                    $parent.addClass('anim');
                    $more.slideDown(function() {
                        $parent.addClass('in');
                    });
                }
                $parent.parents('.item').siblings().children('.detail').removeClass('anim').children('.more').slideUp(function() {
                    $(this).parent('.detail').removeClass('in');
                });
            });
        }

        // 날짜선택 후 min-height 지정
        var setCalendarHeight = (function() {
            var $calendar = $('.select-service-time');
            if ($calendar.length) {
                var _rowLength;
                var _core = function() {
                    _rowLength = $calendar.find('.day').length;
                    $calendar.removeClass('row-4 row-5 row-6').addClass('row-' + _rowLength);
                };
                _core();
                $calendar.find('.year a').on('click', function() {
                    _core();
                });
            }
        }());

    };

    initCommon();

    // 페이지별
    var initCustomPages = function() {

        if (_bodyClass.match('page-brand') || _bodyClass.match('page-display')) {


        }

    };

    initCustomPages();

    // 접근성 관련
    var initSemantic = function() {

        // 현재위치 활성화
        $.fn.prependCurrentPageIs = function(_options) {
            this.find('.active').prepend('<span class="semantic">현재위치 - </span>');
            return this;
        };
        $('.tab-xlarge').prependCurrentPageIs();

        // img label
        $('label img').on('click', function(e) {
            $(this).parents('label').trigger('click');
        });

    };

    initSemantic();



    // 실행
    var initUI = function() {

//        // nth-child
//        $('ul.js-nth-child').eachQ(function() {
//            var $items = $(this).children();
//            $items.eachQ(function(i) {
//                $(this).addClass('nth-child-' + (i + 1));
//            }).addClass('js-nth-child-in');
//        });

        // toggle target element
        $('.js-toggle').on('click', function(e) {
            e.preventDefault();
            var $target = $(this.hash);
            if ($target.length) {
                $target.toggleClass('in');
            }
        });

        // input number 수량 스피너
        $.fn.spinnr = function() {
            this.each(function() {
                var $this = $(this),
                    $spinnr = $('<span class="spinnr"></span>'),
                    $plus = $('<a href="javascript:;" class="nav plus"><span class="icon"><em>더하기</em></span></a>'),
                    $minus = $('<a href="javascript:;" class="nav minus"><span class="icon"><em>빼기</em></span></a>');

                var _max = $this.attr('max'),
                    _val = null;

                $this.wrap($spinnr).after($minus).after($plus);

                var core = function(_todo) {
                    _val = parseInt($this.val(), 10);
                    _val = (_todo == 'plus') ? _val + 1 : _val;
                    _val = (_todo == 'minus') ? _val - 1 : _val;
                    _val = (_val < 0) ? 0 : _val;
                    if (_val > _max) {
                        alert('The maximum quantity allowed is ' + _max);
                        _val = _max;
                    }
                    $this.val(_val);
                };
                core();

                $plus.on('click', function(e) {
                    e.preventDefault();
                    core('plus');
                });

                $minus.on('click', function(e) {
                    e.preventDefault();
                    core('minus');
                });

            });
        };

    };

    initUI();

    $.params.$overlay = $('#overlay');
    $.params.$indicator = $('#indicator');


    $.showOverlay = function(_overlay, _options) {

        var _setting = {
            isIndicator: false,
            indicatorPositionMode: 'fixed',
            indicatorClassName: 'flip',
            onBefore: null,
            onAfter: null
        };

        var _opts = $.extend(_setting, _options);

        var $overlay = $.params.$overlay.attr('aria-hidden', true),
            $indicator = $.params.$indicator.addClass(_opts.indicatorClassName);

        var _timerOverlay = null,
            _delayHide = (_opts.isIndicator === true) ? 1000 : 0;

        $.callFunc(_opts.onBefore);

        if (_overlay === true) { // 보이기

            $overlay.css('display', 'block');

            _timerOverlay = setTimeout(function() {

                clearTimeout(_timerOverlay);

                $overlay.onTransitionEnd(function() {
                    $.callFunc(_opts.onAfter); // _opts.onAfter.call();
                });

                if (_opts.isIndicator === true) {
                    if (_opts.indicatorPositionMode == 'absolute') {
                        $indicator.removeAttr('style').css({
                            'position': 'absolute',
                            'top': $.returnWinCenterPos($indicator),
                            'margin-top': 0
                        });
                    } else {
                        $indicator.removeAttr('style').css({
                            'position': 'fixed',
                            'margin-top': -($indicator.height() / 2),
                            'top': '50%'
                        });
                    }
                    $html.addClass('is-indicator');
                }

                $html.addClass('overlay-open');

            }, 1);

        } else { // 감추기

            $overlay.onTransitionEnd(function() {
                $overlay.css('display', 'none');
                $html.removeClass('overlay-close indicator');
                $.callFunc(_opts.onAfter);
            });

            _timerOverlay = setTimeout(function() {
                clearTimeout(_timerOverlay);
                $html.removeClass('overlay-open').addClass('overlay-close');
            }, _delayHide);

        }
    };

    // 차량 상세
    $('.image-list .desc a').on('click', function(e) {
        e.preventDefault();
        var _src = $(this).children('img').attr('src'),
            _core = $('#largeThumbnail');

        _core.attr('src', _src);
    });

    // tab toggle
    $('.section-tab .tab-list a').on('click', function(e) {
        e.preventDefault();
        var $this = $(this),
            _length = $this.parent().index(),
            _target = $this.parents('.section-tab').find('.item');

        $(this).parent().addClass('active').siblings().removeClass('active')
        _target.eq(_length).show().siblings().hide();
    });


});



/* 이하 정리 전 ********************************************************************* */

var tempFuncUi = function() {

    // init owl carousel
    $.fn.initOwlCarousel = function(_options) {
        var $this = $(this),
            $slider = $this.children('.slider'),
            $prev = $this.children('.prev'),
            $next = $this.children('.next');

        var _setting = {
            slideSpeed: 500,
            rewindSpeed: 500,
            paginationSpeed: 500,
            pagination: false,
            autoPlay: true,
            singleItem: true,
            autoHeight: true,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [979, 3],
            itemsTablet: [768, 2],
            itemsMobile: [479, 2]
        };

        var _opts = $.extend(_setting, _options);

        $slider.owlCarousel(_opts);

        $prev.on('touchstart click', function(e) {
            e.preventDefault();
            $slider.trigger('owl.prev');
        });

        $next.on('touchstart click', function(e) {
            e.preventDefault();
            $slider.trigger('owl.next');
        });

        return this;
    };


    // 베스트 상품 랭크 뱃지
    $.fn.setBestRankBadge = function() {
        this.each(function(i) {
            i += 1;
            var _html = '<span class="badge rank rank-' + i + '">BEST<strong>' + i + '</strong></span>';
            var $badge = $(_html);
            $badge.prependTo($(this).find('.thumb'));
            $badge.lazyAddClass('show', 50 * i);
        });
    };

    // 베스트 상품 랭크 뱃지
    $('#listBestSellers .item-product').setBestRankBadge();

    $.fn.setSaleBadge = function() {
        this.each(function(i) {
            var $this = $(this),
                $badge = null;
            var _percent = $this.data('sale'),
                _html = '';
            if (_percent !== undefined && _percent !== null) {
                _html = '<span class="badge sale sale-' + _percent + '"><strong>' + _percent + '</strong>%</span>';
                $badge = $(_html);
                $badge.prependTo($this.find('.thumb'));
                $badge.lazyAddClass('show', 50 * i);
            }
        });
    };

    // 아싸딜
    $('#listAssaDeal .item-product').setSaleBadge();

    // 상품 목록 유틸리티 메뉴 출력
    $.fn.setProductUtil = function() {

        this.each(function(i) {

            var $items = $(this).find('.item');
            var _html = '';

            _html += '<div class="util">';
            _html += '<p class="colors"><span style="background-color: transparent;"></span></p>';
            _html += '<a href="javascript:;" class="basket"><span>장바구니</span></a>';
            _html += '<a href="javascript:;" class="wishlist"><span>바로구매</span></a>';
            _html += '</div>';

            var _html2 = '';
            _html2 += '<a href="#1" class="zoom js-popup"><span class="icon"><em>상품간편보기</em></span></a>';

            var _html3 = '';
            _html3 += '<div class="hover"><p class="name"></p><p class="price-after"></p></div>';

            $items.on('mouseenter', function(e) {
                var $this = $(this),
                    $thumb = $this.find('.thumb'),
                    $util = $(_html),
                    $zoom = $(_html2),
                    $name = $(_html3),
                    $color = $util.find('.colors'),
                    _colors = [],
                    _code,
                    _price;
                if (!$this.find('.util').length) {
                    if ($thumb.data('colors') !== undefined) {
                        _colors = $thumb.data('colors').split('|');
                        $color.empty();
                        $.each(_colors, function(i) {
                            $color.append('<span style="background-color: ' + _colors[i] + '"></span>');
                        });
                    }
                    if ($thumb.data('code') !== undefined) { // 수정 바랍니다.
                        /*
                        _code = '"간편보기연결 - 제품코드:' + $thumb.data('code') + '"';
                        $zoom.attr('href', 'javascript:alert(' + _code + ')');
                        */
                        _code = $thumb.data('code');
                        $thumb.append($zoom);
                    }
                    if ($thumb.data('name') !== undefined && $thumb.data('price') !== undefined) { // 수정 바랍니다.
                        /*
                        _code = '"간편보기연결 - 제품코드:' + $thumb.data('code') + '"';
                        $zoom.attr('href', 'javascript:alert(' + _code + ')');
                        */
                        $name.find('.name').text($thumb.data('name'));
                        $name.find('.price-after').text($thumb.data('price'));
                        $thumb.prepend($name);
                    }
                    $thumb.append($util);
                }
            });

        });

    };



    /**
     * tooltip
     * $('.js-tooltip').tooltip();
     */
    $.fn.tooltip = function() {
        this.each(function() {
            var $this = $(this),
                $tooltip = $('<div class="tooltip"><div class="tooltip-holder"><div class="tooltip-inner"></div><span class="tooltip-tail"></span></div></div>'),
                _contents = $this.data('tooltip'),
                _css = {};

            var _setPosition = function(e, _mode) {
                if (_mode == 'mouse') {
                    _css.left = (e.clientX - 20) + 'px';
                    _css.top = (e.clientY - $tooltip.outerHeight() - 20) + 'px';
                    _css.marginTop = $(document).scrollTop();
                }
                if (_mode == 'offset') {
                    _css.left = ($this.offset().left - 14) + 'px';
                    _css.top = ($this.offset().top - $tooltip.outerHeight() - 10) + 'px';
                    _css.marginTop = 0;
                }
            };
            var _core = function(e, _todo) {
                if (_todo === true) {
                    $tooltip.addClass('in').find('.tooltip-inner').html(_contents);
                    _setPosition(e, 'offset'); // mode
                    if ($this.data('theme') !== undefined) { // theme
                        $tooltip.addClass($this.data('theme'));
                    }
                    $tooltip.css(_css);
                } else if (_todo === false) {
                    $tooltip.removeClass('in');
                }
            };

            if ($this.next('tooltip').length) {
                $tooltip = $this.next('tooltip').find('.tooltip-inner').empty();
            } else {
                $this.after($tooltip);
            }

            $this.hover(function(e) {
                _core(e, true);
            }, function(e) {
                _core(e, false);
            });
        });
    };



    // faq toggle
    $.fn.collapseToggle = function() {

        this.each(function(i) {

            var $table = $(this),
                $link = $table.find('a.toggle');

            var _offHeight = function(_el) {
                _el.css('height', '0');
                return _el;
            };

            var _core = function(_el) {

                if (!_el.parent().hasClass('subject')) return false;
                if (_el.parent().find('.secret').length) return false;

                var $question = _el.parents('.question'),
                    $answer = $question.next('tr'),
                    $holder = $answer.find('.holder');

                $question.toggleClass('active').siblings('.question').removeClass('active');
                $answer.toggleClass('active').siblings('.answer').removeClass('active');

                if (Modernizr.csstransitions === true) { // css transition
                    if (!$question.hasClass('active')) {
                        // hide
                        _offHeight($holder);
                    } else {
                        // show
                        _offHeight($holder).css('height', $holder.children().outerHeight());
                    }
                    _offHeight($answer.siblings('.answer').removeAttr('style').find('.holder'));
                } else {
                    if (!$question.hasClass('active')) {
                        $answer.hide(); // hide
                    } else {
                        $answer.show(); // show
                    }
                    $answer.siblings('.answer').hide();
                }
            };

            if (Modernizr.csstransitions === true) {
                _offHeight($table.find('.answer').find('.holder'));
            } else {
                $table.find('.answer').hide();
            }

            $link.off('.collapse').on('click.collapse', function(e) {
                e.preventDefault();
                var $this = $(e.target);
                _core($this);
            });

        });

    };

    // 상품목록 타입 변경
    $.fn.changeProductListType = function() {

        this.each(function() {
            var $this = $(this),
                $button = $this.children('.type').find('a'),
                $list = $this.next().find('.list-product').eq(0);

            $list = ($list !== null) ? $list : $this.parent().find('.list-product').eq(0);

            var setButtonIcon = function() {
                if ($list.hasClass('image')) {
                    $button.find('.icon').removeClass('image list').addClass('image');
                } else {
                    $button.find('.icon').removeClass('image list').addClass('list');
                }
            };
            var toggleListType = function() {
                if ($list.hasClass('image')) {
                    $list.removeClass('image').addClass('list');
                } else {
                    $list.removeClass('list').addClass('image');
                }
                setButtonIcon();
            };

            $button.on('click', function(e) {
                e.preventDefault();
                toggleListType();
            });

            setButtonIcon();
        });

    };

    $('.head-actions').changeProductListType();

    /**
     * 별점 등록 콤보박스
     */
    $.fn.rateSelector = function(_options) {

        var _setting = {
            classRateEl: 'star', // 별점 대상 클래스, 'star star-5'
            semantic: true, // 시맨틱 텍스트
            reset: true // 초기화
        };

        var _opts = $.extend(_setting, _options);
        var $this = $(this),
            $rateEl = $this.siblings('.' + _opts.classRateEl);

        $rateEl = ($rateEl !== null) ? $rateEl : $this.parent().children('.' + _opts.classRateEl);

        var _core = function() {
            var _value = $this.children('option:selected').data('rate'),
                _className = _opts.classRateEl + ' ' + _opts.classRateEl + '-' + _value;
            $rateEl.removeClass().addClass(_className);
            if (_opts.semantic === true) {
                $rateEl.html('<em>별 5개 만점 중 ' + _value + '개</em>');
            }
        };

        if (_opts.reset === true) {
            $this.find('option').eq(0).prop('selected', true);
        }

        $this.on('change', function() {
            _core();
        });

        _core();
    };

    var init = function() {



        // lnb, submenu
        var $lnb = $('#lnb'),
            $submenu = $('#submenu');

        $('a.d1', $lnb).on('click', function(e) {
            var $parent = $(this).parent('li');
            $parent.toggleClass('active');
            $parent.siblings().removeClass('active');
            $submenu.find('li.d1').removeClass('active');
        });

        $('a.d1', $submenu).on('click', function(e) {
            var $parent = $(this).parent('li');
            if ($parent.hasClass('link') !== true) {
                $parent.toggleClass('active');
                $parent.siblings().removeClass('active');
                $lnb.find('li.d1').removeClass('active');
            }
        });


        // 상품평등 collapse 게시판 토글러
        $('.js-bbs-collapse').each(function() {
            var $this = $(this);
            $this.find('a.toggler').on('click', function(e) {
                e.preventDefault();
                $(this).parents('.item-bbs').find('.toggle').toggleClass('in').end().siblings().find('.toggle').removeClass('in');
            });
        });

        $('.section-title .more').on('click', function(e) {
            e.preventDefault();
            var $target = $(this.hash);
            if ($target.length) {
                $target.toggleClass('in');
            }
        });

        // to the top
        if ($('#toTheTop').length < 1) {
            var $toTheTop = $('<div id="toTheTop"><a href="#top"><span class="icon"><em>TOP</em></span></a></div>');
            $toTheTop.appendTo($('body'));
            $toTheTop.find('a').on('click', function(e) {
                e.preventDefault();
                $('#innerWrap').animate({
                    'scrollTop': 0
                });
            });
        }

        // skyscraper
        // $('.skyscraper').skyscraper($('#sectionA')).init();
        $.fn.skyscraper = function($target) {

            var $window = $(window),
                $this = $(this);

            var core = function() {
                var _scroll = $window.scrollTop(),
                    _start = ($target !== undefined && $target.length) ? $target.offset().top : 0,
                    _margin = 100,
                    _top = $this.css('top'),
                    _mode = $this.css('position');
                if (_mode == 'fixed') {
                    _top = (_scroll < _start - _margin) ? _start - _scroll : _margin;
                } else if (_mode == 'absolute') {
                    _top = (_scroll < _start - _margin) ? _start : _scroll + _margin;
                }
                $this.css('top', _top);
                $this.fadeIn(300);
            };

            var init = function() {
                $window.on('resize scroll', core);
                setTimeout(core, 100);
            };

            return {
                init: function() {
                    init();
                },
                core: function() {
                    core();
                }
            };
        };



        // to the top
        // $('area[href="#top"]').toTheTop();
        // $.fn.toTheTop = function() {
        //     $(this).on('click', function(e) {
        //         e.preventDefault();
        //         $('html, body').stop().animate({
        //             'scrollTop': '0'
        //         }, 500);
        //     });
        //     return this;
        // };

        // sticky gnb
        // stickyGnb();



        // faq toggle
        // $('table.js-faq').collapseToggle();

        // product util
        // $('.list-product').setProductUtil();

        // tooltip
        // $('.js-tooltip').tooltip();

        // 상품 목록 타입 변경
        // $('.section-product-sort').changeProductListType();

        // $('.slidr-nav').imgHover();


    };


    // modernizr yepnope
    /*
    if ($.isFunction(yepnope)) {
        yepnope({
            load: _scripts,
            complete: function() {
                init();
                initCustomPages();
                initCommon();
            }
        });
    }
    */

    // init();
    // initCustomPages();
    // initCommon();

    // brand toggle bbs
    // $('.technology a.subject').on('click', function(e) {
    //     e.preventDefault();

    //     var $this = $(this),
    //         $article = $this.parent(),
    //         $list = $this.next('.detail');

    //     $article.toggleClass('active').siblings().removeClass('active');

    //     if (!$article.hasClass('active')) {
    //         $list.css('height', '0');
    //     } else {
    //         $list.css('height', $list.children().outerHeight());
    //         $article.siblings().children('.detail').css('height', '0');
    //     }
    // });



    /**
     * 오버레이 + 인디케이터 출력
     * @param  {boolean} _overlay      오버레이 출력 여부
     * @param  {boolean} _indicator 인디케이터 출력 여부
     * @param  {func} _func      콜백함수
     * $.showOverlay(false);
     * $.showOverlay(true, {
     *     isIndicator: false,
     *     onAfter: function(){
     *         alert('done!');
     *     }
     * });
     *  $.showOverlay(false, {
     *     isIndicator: true
     *  });
     */



};

//팝업 관련 함수
var popup = function(_href, _width, _height, _scroll, _id) {
    if (!_scroll) _scroll = 'no';
    else _scroll = 'yes';
    var _left = parseInt((screen.width - _width) / 2, 10),
        _top = parseInt((screen.height - _height) / 2, 10) - 100;
    var popup = window.open(_href, 'popup' + _id, 'top=' + _top + ', left=' + _left + ', width=' + _width + ', height=' + _height + ', scrollbars=' + _scroll + ', toolbar=no, menubar=no, location=no, resizable=true, status=yes');
    popup.focus();
};