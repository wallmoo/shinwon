/**
 *                                           _
 *   ___  ____  ____ ____________________  (_)
 *  / _ \/ __ \/ __ `/ ___/ ___/ ___/ __ \/ /
 * /  __/ /_/ / /_/ (__  |__  ) /__/ / / / /
 * \___/ .___/\__,_/____/____/\___/_/ /_/_/
 *    /_/
 * javascript base modules
 * author: riix@epasscni.com
 */

$.params = (typeof $.params !== 'undefined') ? $.params : []; // 전역 변수 선언
$.params.domain = (typeof $.params.domain !== 'undefined') ? $.params.domain : '..'; // 도메인
$.params.htmlClass = (typeof $.params.htmlClass !== 'undefined') ? $.params.htmlClass : ''; // 문서에 포함시킬 class
$.params.DETECT = (typeof $.params.DETECT !== 'undefined') ? $.params.DETECT : []; // 접속환경
$.params.SUPPORT = (typeof $.params.SUPPORT !== 'undefined') ? $.params.SUPPORT : []; // 접속브라우저 지원기능
$.params.BASE = (typeof $.params.BASE !== 'undefined') ? $.params.BASE : []; // 엘리먼트
$.params.STR = (typeof $.params.STR !== 'undefined') ? $.params.STR : []; // 문자열

var noop = $.noop || function() {};

// console polyfill
window.console = window.console || {
    log: function() {}
};

(function($, window, document, ua) {

    'use strict';

    // DOM cache 
    var $document = $(document),
        $window = $(window),
        $head = $('head'),
        $meta = $('meta[http-equiv="X-UA-Compatible"]'),
        $html = $('html'),
        $body = $('body');

    // set meta equiv for old ie to edge
    var setMetaIeEdge = (function() {
        if ($meta.length) {
            $meta.attr('content', 'IE=edge');
        } else {
            $head.prepend($('<meta http-equiv="X-UA-Compatible" content="IE=edge" />'));
        }
    }());

    /* ********************************************************************************************************************/

    // set base elements
    $.params.BASE.$overlay = $('#overlay').length ? $('#overlay') : $('<div id="overlay" class="md-overlay"></div>').appendTo($body);
    $.params.BASE.$indicator = $('#indicator').length ? $('#indicator') : $('<div id="indicator" class="md-indicator"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>').appendTo($body);

    // set string vars.
    $.params.STR.timeStamp = 'timeStamp' + Math.floor(+new Date() / 100);
    $.params.STR.indicatorSrc = $.params.domain + '/common/img/module/loading.gif';
    $.params.STR.blankSrc = 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==';
    $.params.STR.activeClass = 'active';

    // easing
    var easingNames = {};

    $.each(["Quad", "Cubic", "Quart", "Quint", "Expo"], function(i, name) {
        easingNames[name] = function(p) {
            return Math.pow(p, i + 2);
        };
    });

    $.each(easingNames, function(name, easeIn) {
        $.easing["easeInOut" + name] = function(p) {
            return p < 0.5 ? easeIn(p * 2) / 2 : 1 - easeIn(p * -2 + 2) / 2;
        };
    });

    // set easing
    $.params.STR.easing = 'easeInOutQuad';

    /* ********************************************************************************************************************/

    // and etc.
    var vendorNames = {
        "android": "mobile android",
        "windows phone": "mobile windows",
        "iphone": "mobile iphone",
        "ipad": "mobile ipad",
        "ipod": "mobile ipod",
        "msie 6": "ie ie6 lt-ie7 lt-ie8 lt-ie9 lt-ie10 oldie",
        "msie 7": "ie ie7 lt-ie8 lt-ie9 lt-ie10 oldie ",
        "msie 8": "ie ie8 lt-ie9 lt-ie10 oldie ",
        "msie 9": "ie ie9 lt-ie10",
        "msie 10": "ie ie10",
        "msie 11": "ie ie11",
        "chrome": "chrome",
        "webkit": "webkit",
        "safari": "safari",
        "firefox": "firefox"
    };

    var supportNames = {
        'touch': Modernizr.touch,
        'transitions': Modernizr.csstransitions,
        'transforms': Modernizr.csstransforms,
        'transforms3d': Modernizr.csstransforms3d,
        'animations': Modernizr.cssanimations,
        'opacity': Modernizr.opacity,
        'rgba': Modernizr.rgba,
        'inputtypes': Modernizr.inputtypes,
        'placeholder': Modernizr.placeholder,
        'video': Modernizr.video
    };

    var transitEndEventNames = {
        'WebkitTransition': 'webkitTransitionEnd',
        'OTransition': 'oTransitionEnd',
        'msTransition': 'MSTransitionEnd',
        'transition': 'transitionend'
    };

    var animEndEventNames = {
        'WebkitAnimation': 'webkitAnimationEnd',
        'OAnimation': 'oAnimationEnd',
        'msAnimation': 'MSAnimationEnd',
        'animation': 'animationend'
    };

    // detect browser
    var detectBrowser = function() {

        var _result;

        // set _ieVer, for use conditional comment
        if (typeof verIE !== 'undefined' && verIE !== null) ua = 'msie ' + verIE;
        if ('behavior' in document.documentElement.style && '-ms-user-select' in document.documentElement.style) ua = 'msie 10';
        if ('-ms-scroll-limit' in document.documentElement.style && '-ms-ime-align' in document.documentElement.style) ua = 'msie 11';
        if (!!window.chrome) ua = 'chrome';

        $.each(vendorNames, function(key, value) {
            if (ua.toLowerCase().match(key)) {
                _result = vendorNames[key];
            }
        });
        return _result;
    };

    // detect browser
    $.params.DETECT.browser = detectBrowser();

    // detect device
    $.params.DETECT.device = ((/(android|ipad|playbook|silk|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(ua) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(ua.substr(0, 4)))) ? 'mobile' : 'classic';

    // detect supports
    $.extend($.params.SUPPORT, supportNames);

    // get animation end event name
    $.params.transitEndEventName = transitEndEventNames[Modernizr.prefixed('transition')];
    $.params.animEndEventName = animEndEventNames[Modernizr.prefixed('animation')];

    /* ********************************************************************************************************************/

    $.easing.def = $.params.STR.easing;

    // set ajax
    $.ajaxSetup({
        cache: false
    });

    /* ********************************************************************************************************************/

    /**
     * 콜백 함수 실행
     * @param  {obj} _el, 필요할 경우 객체
     * @param  {func} _func  실행할 함수
     * @param  {param} _param 파라미터(생략가능)
     * $.callFunc(foo, param);
     */
    $.callFunc = function(_callback, _el, _param, _delay) {
        _callback = (typeof _callback == 'string') ? window[_callback] : _callback;
        if ($.isFunction(_callback)) {
            _el = (typeof _el == 'undefined') ? null : _el;
            _param = (_param === null) ? '' : _param;
            _delay = _delay || 50;
            setTimeout(function() {
                _callback.call(null, _el, _param);
            }, _delay);
        } else {
            return false;
        }
    };

    /**
     * add class to HTML
     * @param {[type]} _str [description]
     *
     * $.addClassToHtml([
     *     $.params.DETECT.browser,
     *     $.params.DETECT.device,
     *     $.params.STR.indicatorClass,
     *     $.params.STR.easing,
     *     $.params.STR.timeStamp
     * ]);
     *
     * or
     *
     * $.addClassToHtml($.params.STR.timeStamp);
     */
    $.addClassToHtml = function(_str) {
        var _core = function(_str) {
            $.params.htmlClass = $.params.htmlClass + ' ' + _str;
        };
        if (typeof _str === 'string') {
            _core(_str);
        } else if (typeof _str === 'object') {
            $.each(_str, function() {
                _core(this);
            });
        }
        $.params.htmlClass = $.params.htmlClass.replace(/^\s*|\s*$/g, ''); // 앞뒤 공백 제거
        $html.addClass($.params.htmlClass);
        if ($.isFunction(console.log)) {
            //console.log('$.addClassToHtml : ' + $.params.htmlClass);
        }
    };


    /**
     * faster Each for
     */
    $.fn.eachQ = (function() {
        var $this = $([1]);
        return function(_func) {
            var i = -1,
                len = this.length,
                $el;
            try {
                while (
                    ++i < len &&
                    ($el = $this[0] = this[i]) &&
                    _func.call($this, i, $el) !== false
                );
            } catch (e) {
                delete $this[0];
                throw e;
            }
            delete $this[0];
            return this;
        };
    }());



    // 학습 필요
    $.event.special.riixTransitionEnd = {
        bindType: $.params.transitEndEventName,
        delegateType: $.params.transitEndEventName,
        handle: function(e) {
            if ($(e.target).is(this)) {
                return e.handleObj.handler.apply(this, arguments);
            }
        }
    };

    // 학습필요
    $.fn.emulateTransitionEnd = function(_duration) {
        var _called = false;
        var $this = $(this);
        $this.one('riixTransitionEnd', function() {
            _called = true;
        });
        var _callback = function() {
            if (_called !== true && $('html').hasClass('csstransitions')) {
                $this.trigger($.params.transitEndEventName);
            }
        };
        setTimeout(_callback, _duration);
        return this;
    };



    $('body').one('riixTransitionEnd', function() {
        //console.log('transtion done');
    });

    $('body').emulateTransitionEnd(100);



    /**
     * js toggler
     * @param  {arr} _options 옵션
     */
    $.fn.classToggler = function(_options) {
        var _opts = $.extend({
            classname: 'toggle',
            onAfter: null
        }, _options);
        this.each(function() {
            var base = [];
            base.$this = $(this);
            base.attr = base.$this.attr('href');
            base.$target = $(base.attr);
            base.$wrap = base.$target.parent();
            base.$siblings = base.$wrap.find('.' + _opts.classname).not(base.$target);
            base.$this.on('click', function(e) {
                e.preventDefault();
                base.$target.addClass('in');
                base.$siblings.removeClass('in');
                base.$this.currentActive();
                $.callFunc(_opts.onAfter, base);
            });
        });
    };

    /**
     * not equal
     * @param { } [varname] [description]
     */
    $.fn.neq = function(i) {
        return this.pushStack(this.not(':eq(' + i + ')'));
    };

    // detect support css3 transfom
    // $.isSupport3d(is3dTransforms);
    $.isSupport3d = function(_is) {
        var _result = false;
        if (_is === undefined || _is === true) {
            _result = (document.body && document.body.style.perspective !== undefined) ? true : _result;
            var _tempDiv = document.createElement("div"),
                style = _tempDiv.style,
                a = ["Webkit", "Moz", "O", "Ms", "ms"],
                i = a.length;
            _result = (_tempDiv.style.perspective !== undefined) ? true : _result;
            while (--i > -1) {
                _result = (style[a[i] + "Perspective"] !== undefined) ? true : _result;
            }
        }
        return _result;
    };

    /**
     * 동일한 패턴의 엘리먼트 집합 인덱스를 구함
     * alert($this.indexType('.subject'));
     */
    $.fn.indexType = function(_selector) {
        var $this = $(this),
            _result;
        if (_selector === undefined) {
            if ($this.attr('class') !== undefined) { // class
                _selector = '.' + $this.attr('class').split(' ')[0];
            } else { // tagname
                _selector = $this.get(0).tagName.toLowerCase();
            }
        }
        _result = $this.parent().children(_selector).index($this);
        return _result;
    };

    /**
     * css3 transition 시 실행
     * @param  {func} _callback 콜백
     * @param  {func} _pullback transition 적용이 안될 경우 우선 실행
     * $foo.onTransitionEnd(function(){
     *     todo();
     * });
     */
    $.fn.onTransitionEnd = function(_callback, _pullback) {

        var $this = $(this),
            _supportTransforms = $.params.SUPPORT.transforms || true,
            _eventName = $.params.transitEndEventName || 'transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd';

        var core = function() {
            $this.off(_eventName);
            try {
                // _callback.call();
                $.callFunc(_callback);
            } catch (e) {
                _callback.call();
            }
        };

        if (_supportTransforms === true) { // 보강필요
            $this.off(_eventName).on(_eventName, core);
        } else if ($.isFunction(_pullback)) {
            $.callFunc(_pullback);
        } else {
            $.callFunc(_callback);
        }

    };

    /**
     * css3 animation end 시 실행
     * @param  {func} _callback 콜백
     * @param  {func} _pullback animation 적용이 안될 경우 우선 실행
     * $foo.onAnimationEnd(function(){
     *     todo();
     * });
     */
    $.fn.onAnimationEnd = function(_callback, _pullback) {

        var $this = $(this),
            _supportAnimations = $.params.SUPPORT.animations || true,
            _eventName = $.params.animEndEventName || 'animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd';

        var core = function() {
            $this.off(_eventName);
            try {
                $.callFunc(_callback);
            } catch (e) {
                _callback.call();
            }
        };

        if (_supportAnimations === true) { // 보강필요
            $this.off(_eventName).on(_eventName, core);
        } else if ($.isFunction(_pullback)) {
            $.callFunc(_pullback);
        } else {
            $.callFunc(_callback);
        }
    };

    /**
     * img toggler
     * $('img').imgToggle('_on');
     * $('img').imgToggle('_off');
     * $('img').imgToggle('_off','_on');
     */
    $.fn.imgToggle = function(_arguments) {
        var opts = {
            off: '_off',
            on: '_on'
        };
        var _asIs = opts.off,
            _toBe = opts.on;
        switch (arguments.length) {
            case 1:
                if (arguments[0] == opts.off) {
                    _asIs = opts.on;
                    _toBe = opts.off;
                }
                break;
            case 2:
                _asIs = arguments[0];
                _toBe = arguments[1];
                break;
            default:
                break;
        }
        this.each(function() {
            var $this = $(this);
            if ($this[0].tagName.toLowerCase() !== 'img') {
                $this = $this.find('img').eq(0);
            }
            if ($this.attr('src') !== undefined) {
                $this.attr('src', $this.attr('src').replace(_asIs, _toBe));
            }
        });
        return this;
    };

    /**
     * img hover toggler
     * $('.nav img').imgHover();
     */
    $.fn.imgHover = function(_options) {
        var opts = $.extend({
            on: '_on',
            off: '_off'
        }, _options);
        this.each(function() {
            var $this = $(this);
            $this.hover(function() {
                $this.imgToggle(opts.off, opts.on);
            }, function() {
                $this.imgToggle(opts.on, opts.off);
            });
        });
        return this;
    };

    /**
     * class, img 활성화
     * $foo.currentActive();
     */
    $.fn.currentActive = function(_options) {

        var opts = $.extend({
            parentEl: 'div',
            className: 'active',
            imgToggle: true
        }, _options);

        var $el = $(this),
            $li = $el.parent(opts.parentEl),
            $siblings, $img;

        $el = ($li.length) ? $li : $el;
        $siblings = $el.siblings();
        $img = $('img', $el).eq(0);

        $el.addClass(opts.className).siblings().removeClass(opts.className);

        if ($img.length && opts.imgToggle === true) {
            $img.imgToggle('_on');
            $siblings.find('img').imgToggle('_off');
        }

        return this;

    };




    /**
     * 이미지 로드 후 콜백 실행
     * @param  {Function} callback 실행할 콜백
     * $('img', $('#foo')).imgsLoaded(function() {
     *     console.log('done');
     * });
     */
    $.fn.imgsLoaded = function(_callback, _delay) {
        var _items = this.filter('img'),
            _len = _items.length,
            _totalLen = 0,
            _delayLoaded = _delay || 0,
            _timer = null,
            _blankImageSrc = 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==';

        _items.one('load.imgloaded', function() {
            _totalLen = --_len;
            if (_totalLen <= 0 && this.src !== _blankImageSrc) {
                _items.off('load.imgloaded');
                if ($.isFunction(_callback)) {
                    _timer = setTimeout(function() {
                        _callback.call(_items, this);
                    }, _delayLoaded);
                }
            }
        });

        _items.each(function() {
            if (this.complete || this.complete === undefined) {
                var _src = this.src; // + '?time = ' + new Date().getTime();
                this.src = _blankImageSrc;
                this.src = _src;
            }
        });

        return this;
    };

    /**
     * Z-index 설정
     * @param {[type]} _num  반환할 z-index
     * @param {[type]} _base 더해질 기본값
     */
    $.fn.setZindex = function(_num, _base) {
        _num = (_base !== undefined) ? _num + _base : _num;
        $(this).css('z-index', _num);
        return this;
    };

    $.fn.scrollToElement = function() {

        var $el = $(this),
            $target = null,
            _marginTop = ($el.data('margin') !== undefined) ? $el.data('margin') : 0,
            _top = 0; // default

        if (!$el.length) return false;

        $el = ($el.get(0).tagName.toLowerCase() !== 'a') ? $el.find('a') : $el;

        $el.each(function() {
            $(this).on('click', function(e) {
                e.preventDefault();
                $target = $($(this).attr('href'));
                if ($target.length) {
                    _top = parseInt($target.offset().top, 10);
                }
                $('html, body').animate({
                    scrollTop: _top - _marginTop
                }, 50);
            });
        });

        return this;

    };

    // init
    $('.js-scrollTo').scrollToElement();
    $('a[href="#top"]').scrollToElement();




    /**
     * 이벤트 타겟을 탐지하여 존재할 경우 preventDefault 적용
     * @param  {[type]} e 탐지할 대상
     * $.preventDefault(e);
     */
    $.preventDefault = function(e) {
        if (e !== null && e !== undefined && $(e.target).length) {
            e.preventDefault();
        }
        return this;
    };

    /**
     * lorempixel 랜덤 이미지 경로 구하기
     * @return {str} 이미지 경로 src
     */
    $.getRandomImgSrc = function() {
        var _size = Math.random() * 3 + 1,
            _width = Math.round((Math.random() * 110 + 100) * _size),
            _height = Math.round(140 * _size),
            _random = Math.ceil(Math.random() * 1000),
            _src = 'http://lorempixel.com/' + _width + '/' + _height + '/' + '?cacheBuster=' + _random;
        return _src;
    };

    /**
     * 스크롤 위치를 포함한 스크린 중앙 값을 구한다.
     * @param  {[type]} _height 계산 대상의 높이 크기
     * var _center = $.returnWinCenterPos($foo);
     */
    $.returnWinCenterPos = function(_el, _mode) {
        if (_el === undefined || !_el.length) return false;
        var _height = _el.height() || 0,
            _result = ($window.height() / 2) - (_height / 2);
        if (_el.css('position') !== 'absolute') {
            _result += $window.scrollTop();
        }
        return _result;
    };

    /**
     * 인덱스값 범위 내 반환
     * @param  {[type]} _idx 받아올 인덱스
     * @param  {[type]} _max 제한범위
     */
    $.idxProof = function(_idx, _max) {
        _idx = (_idx < 0) ? _max - 1 : _idx;
        _idx = (_idx < _max) ? _idx : 0;
        return _idx;
    };

    /**
     * 해당 객체가 뷰포트 내에 있는지 불린값 반환
     * @param  {[type]} el 불러올 객체
     * @return {[type]}    불린 값
     * if ($.returnInView($el) === true) {
     *     todo()
     * };
     */
    $.returnInView = function(el) {
        var $this = $(el),
            _elHeight = parseInt($this.outerHeight() * 0.5, 10),
            _elTop = $this.offset().top,
            _scrollTop = document.documentElement.scrollTop || document.body.scrollTop,
            _winHeight = $window.height(),
            _winInnerHeight = (window.innerHeight && window.innerHeight < _winHeight) ? window.innerHeight : _winHeight,
            _result = (_elTop + _elHeight) > _scrollTop && (_elHeight + _elTop) < (_scrollTop + _winInnerHeight);
        return _result;
    };

    /**
     * 페이징 등 객체의 인덱스 순서 추출
     * @param  {[type]} _el 추출할 객체
     */
    $.getElemIdx = function(_el) {
        var $el = $(_el),
            $li = $el.parent('li'),
            _result;
        $el = ($li.length) ? $li : $el;
        _result = ($el.length) ? $el.index() : 0;
        return _result;
    };

    // set z-index
    // setElementZindex([
    //     base.$el,
    //     base.$pager,
    //     base.$prev,
    //     base.$next
    // ], base.opts.baseZindex);
    $.setElementZindex = function(_arrEl, _base) {
        $.each(_arrEl, function(i, _el) {
            i = (_base !== undefined) ? i + _base : i;
            _el.css('z-index', i);
        });
    };

    /**
     * 페이징등, 인덱싱된 앵커를 찾는 함수
     * @param  {[type]} _parent 탐지 대상
     * @param  {[type]} _idx    생략시 전체 반환
     * var $anchor = $.getIndexedAnchor($pager);
     * var $currentAnchor = $.getIndexedAnchor($pager, 0);
     */
    $.getIndexedAnchor = function(_parent, _idx) {
        var $parent = _parent,
            $el = $parent.find('a');
        if ($el.eq(0).parent('li').length) {
            $el = $parent.find('li');
            $el = (_idx === undefined) ? $el.find('a') : $el.eq(_idx).find('a');
        } else if (_idx !== undefined) {
            $el = $el.eq(_idx);
        }
    };

    /**
     * 경로를 포함한 파일명에서 경로를 제외한 파일명만 구하기
     * @param  {[type]} _src 추출할 경로
     * @return {[type]}      파일명
     */
    $.getFileName = function(_src) {
        var _result = _src.split('/');
        _result = _result[_result.length - 1];
        return _result;
    };

    /**
     * _off 확장자를 가진 이미지를 찾아 preload 이미지를 생성함
     * @param {[type]} _el 탐지할 부모 객체
     * $.appendPreloadImg();
     */
    $.appendPreloadImg = function(_el) {
        var _arrImgs = [], // 중복방지를 위한 캐싱
            _style = {
                'position': 'absolute',
                'visibility': 'hidden',
                'left': 0,
                'top': '-1000px',
                'width': 0,
                'height': 0,
                'z-index': -100
            };
        _el = (_el === undefined || !_el.length) ? $('body') : _el;

        var _timerAppendImg = setTimeout(function() {

            clearTimeout(_timerAppendImg);

            $('img[src*="_off"]', _el).each(function(i) {

                var _src = $(this).attr('src'),
                    _fileName = $.getFileName(_src);

                if (jQuery.inArray(_fileName, _arrImgs) < 0) { // 중복 방지
                    // if (_arrImgs.indexOf(_fileName) < 0) { // 중복 방지
                    _arrImgs.push(_fileName);
                    $('<img class="preload" aria-hidden="true" alt="Temporary Image" />')
                        .attr('src', _src.replace('_off', '_on'))
                        .css(_style).appendTo($('body'));
                }
            });

        }, 1000);
    };

    /**
     * 배열에서 랜덤 값 추출하기
     * var _color = [1, 2, 3, 4];
     * var _timestamp = '?rand=' + $.getRandInArray(_color);
     */
    $.getRandInArray = function(_arr) {
        var _result = ['blue', 'red', 'green', 'orange', 'pink'];
        _result = (typeof _arr === 'object') ? _arr : _result;
        _result = _result[Math.floor(Math.random() * _result.length)];
        return _result;
    };

    // return random
    $.returnRandom = function(_scope) {
        var result = Math.floor(Math.random() * _scope);
        return result;
    };

    /**
     * json 등 배열 객체로 부터 html Dom List 생성
     * @param  {obj, str} _el       생성될 객체의 wrap 객체, $객체 또는 셀렉터
     * $.setListItems('#nav ul', data);
     * $.setListItems('.itemwrap', data, {
     *     filter: function(_item, _idx) {
     *         ...
     *     },
     *     onComplete: function() {
     *         ...
     *     }
     */
    $.setListItems = function(_el, _data, _options) {
        var _html = '',
            _items = _data.items, // set json key
            $el = (typeof _el == 'string') ? $(_el) : _el;
        var _setting = {
            filter: function(_item, _idx) {
                var _return = '';
                _return += '<li class="' + 'nth-child-' + (_idx + 1) + '"><a href="javascript:;"><span>' + _item.name + '</span></a></li>';
                return _return;
            },
            onComplete: null
        };
        var opts = $.extend(_setting, _options);
        if ($el === undefined || !$el.length || _items === undefined) return false;
        for (var i = 0, len = _items.length; i < len; i++) {
            _html += opts.filter.call(null, _items[i], i);
        }
        $el.html(_html);
        $.callFunc(opts.onComplete);
    };

    /**
     * Perspective Zoom In Out 효과
     * @param  {[type]} _todo   on, off, clear
     */
    $.perspectiveZoom = function(_todo, options) {

        var supportTransforms3d = $.params.SUPPORT.transforms3d || true;

        if (supportTransforms3d !== true) return false;

        var setting = {
            $body: $('body'),
            $container: $('#container')
        };

        var opts = $.extend(setting, options);

        var _winHeight = $window.height();

        if (_todo == 'on') {

            opts.$body.css({
                'perspective': '2000px',
                'background-color': '#333'
            });

            opts.$container.css({
                'overflow': 'hidden',
                'height': _winHeight,
                'transition': 'all 0.5s',
                'transform': 'translate3d(0, 0, -120px)'
            });

        } else if (_todo == 'off') {

            opts.$container.css({
                'transform': 'translate3d(0, 0, 0)'
            });

        } else if (_todo == 'clear') {

            opts.$body.removeAttr('style');
            opts.$container.removeAttr('style');

        }

    };

    /**
     * do typho element css transition effect
     * @param {str} _todo    'from' : 'to'
     * @param {el} _el      target el
     * @param {arr} _options options
     * doTyphoTransit('from', $item, base.opts.typho); // typho effect
     * doTyphoTransit('to', $item, base.opts.typho); // typho effect
     */
    $.doTyphoTransit = function(_todo, _el, _options) {

        var _setting = {
            el: '.typho',
            duration: '.7s',
            transformFrom: 'translate3d(0, 0, 0) scale(1,1) rotate(0deg)',
            transformTo: 'translate3d(-20px, 0, 0) scale(1, 1) rotate(0deg)'
        };

        var _opts = $.extend(_setting, _options);

        var $item = _el.find(_opts.selector);

        if (!$item.length) return false;

        if (_todo === 'from') {
            $item.css({
                'opacity': '1',
                'transform': _opts.transformFrom
            });
        } else {
            for (var i = 0, _len = $item.length; i < _len; i++) {
                var $this = $item.eq(i),
                    _index = $this.data('index') || i,
                    _delay = (_index * 2) / 10 + 's';
                $this.css({
                    'opacity': '0',
                    'transform': _opts.transformTo,
                    'transition-duration': _opts.duration,
                    'transition-delay': _delay
                });
            }
        }

    };

    /**
     * throttle, 스크롤 반응 지연등에 쓰임
     * $.throttle(function() {
     *     console.log('throttled');
     * }, 50);
     */
    $.throttle = (function() {
        var _timerThrottle;
        return function(_fn, _delay) {
            clearTimeout(_timerThrottle);
            _timerThrottle = setTimeout(_fn, _delay);
        };
    }());

    /**
     * get option from custom data
     * @param { } [varname] [description]
     */
    $.getOptsFromData = function(el, opts) {
        $.each(opts, function(key, val) {
            var _key = (key.replace(/([a-z])([A-Z])/g, '$1-$2')).toLowerCase();
            var _data = el.data(_key);
            if (_data !== undefined) {
                opts[key] = _data;
            }
        });
    };

    /**
     * get element from custom data
     * @param { } [varname] [description]
     */
    $.getOptsFromDataKey = function(str) {
        var $this = $(this);
        var _result = base.opts[str];
        if ($this.data(str) !== undefined) {
            _result = $this.data(str);
        }
        return _result;
    };

    // 모달 관련 함수
    $.openPopup = function(_href, _width, _height, _scroll) {
        if (!_scroll) _scroll = 'no';
        var _left = parseInt((screen.width - _width) / 2, 10),
            _top = parseInt((screen.height - _height) / 2, 10) - 100;
        var _name = 'popup' + _left;
        var modalWin = window.open(_href, _name, 'top=' + _top + ', left=' + _left + ', width=' + _width + ', height=' + _height + ', scrollbars=' + _scroll + ', toolbar=no, menubar=no, location=no, resizable=false, status=yes');
        modalWin.focus();
    };

    /* event handlers */
    $.handlerPopup = function(e) {
        e.preventDefault();
        var $this = $(this);
        if (!$this.data('isClicked') && $this.data('size')) { // interval
            var _href = ($this.attr('href') !== undefined) ? $this.attr('href') : 'http://google.com';
            var _size = $this.data('size').split('x'),
                _width = _size[0],
                _height = _size[1],
                _scroll = ($this.data('scroll') === true) ? 'yes' : 'no';
            $this.data('isClicked', true);
            $.openPopup(_href, _width, _height, _scroll);
            setTimeout(function() {
                $this.removeData('isClicked');
            }, 1000);
        }
    };

    /* popup handler */
    $('.js-popup').on('click', $.handlerPopup);

    /**
     * aria hidden false
     * @param { } [varname] [description]
     */
    $.fn.showAria = function() {
        return this.removeAttr('hidden').attr('aria-hidden', 'false');
    };

    /**
     * aria hidden true
     * @param { } [varname] [description]
     */
    $.fn.hideAria = function() {
        return this.attr('hidden', 'hidden').attr('aria-hidden', 'true');
    };

    /**
     *
     * @param { } [varname] [description]
     */
    $.fn.oneClick = function() {
        return this.on('click', function() {
            $this.addClass('clicked').attr('disabled', 'true');
        }).removeClass('clicked').removeAttr('disabled');
    };

    /* js check all */
    $.fn.jsCheckAll = function() {
        this.each(function() {
            var $this = $(this),
                $wapper = ($this.data('wrap') !== undefined) ? $($this.data('wrap')) : $this.parents('div'),
                $others = $wapper.find('input').not($this);

            $others.on('click', function(e) {
                if ($others.filter(':checked').length == $others.length) {
                    $this.prop('checked', true);
                } else {
                    $this.prop('checked', false);
                }
            });

            $this.on('click', function(e) {
                if ($this.is(':checked')) {
                    $others.prop('checked', true);
                } else {
                    $others.prop('checked', false);
                }
            });
        });
    };

    /* check all */
    $('input.js-checkAll').jsCheckAll();

    /**
     * toggle element
     * @param { } [varname] [description]
     */
    $.fn.toggleTarget = function(options) {
        var opts = $.extend({
            className: $.params.STR.activeClass
        }, options);
        this.each(function() {
            var $this = $(this),
                $el = null;

            var _tagName = $this[0].tagName.toLowerCase(),
                _textActive = $this.data('text-active'),
                _textDeactive = $this.data('text-deactive');

            switch (_tagName) {
                case 'input':
                    // $el.toggleClass(opts.className);
                    break;
                case 'select':
                    // $el.toggleClass(opts.className);
                    break;
                default:
                    $el = (this.hash !== undefined) ? $(this.hash) : $($this.data('target'));
                    $el.toggleClass(opts.className);
                    // 버튼 텍스트 변경
                    if (_textActive !== undefined && _textDeactive !== undefined) {
                        if ($el.hasClass(opts.className)) {
                            $this.children().text(_textActive);
                        } else {
                            $this.children().text(_textDeactive);
                        }
                    }
                    break;
            }
        });
    };

    /**
     * toggle animation class
     * @param { } [varname] [description]
     */
    $.fn.toggleAnimClass = function(fxOff, fxOn, animNames, callback) {
        var $this = $(this);
        if ($this.data('animation') !== true) {
            $this.addClass('animated').data('animation', true);
            if (!$this.hasClass(fxOff)) {
                $this.removeClass(fxOn).addClass(fxOff);
            } else {
                $this.removeClass(fxOff).addClass(fxOn);
            }
            // if (typeof(callback) == 'function') {
            //     callback.call();
            //     // callback.apply();

            // }
            $.callFunc(callback);

            $this.one(animNames, function() {
                $this.data('animation', false).off(_animationEndNames);
            });
        }
    };

    /**
     * html5 placeholder polyfill
     * @param { } [varname] [description]
     */
    $.fn.placeHolder = function(options) {

        var opts = $.extend({
            formCheck: false
        }, options);

        if (!("placeholder" in document.createElement("input"))) { // if (!Modernizr.input.placeholder)
            this.each(function() {
                var $this = $(this);
                $this.on({
                    "focus": function() {
                        if ($this.val() == $this.attr('placeholder')) {
                            $this.val('').removeClass('placeholder');
                        }
                    },
                    "blur": function() {
                        if ($this.val() === '' || $this.val() == $this.attr('placeholder')) {
                            $this.addClass('placeholder').val($this.attr('placeholder'));
                        }
                    }
                });
                if (opts.formCheck === true) {
                    $this.parents('form').submit(function() {
                        $(this).find('input[placeholder]').each(function() {
                            var $input = $(this);
                            if ($input.val() == $input.attr('placeholder')) {
                                $input.val('');
                            }
                        });
                    });
                }
            });
            this.blur();
        }

    };

    /* placeholder */
    $('input[placeholder]').placeHolder({
        formCheck: true
    });

    // lazy add class
    $.fn.lazyAddClass = function(_class, _delay) {
        var $this = $(this);
        var _timer = null;
        _timer = setTimeout(function() {
            $this.addClass(_class);
        }, _delay);
        return this;
    };

})(jQuery, window, document, navigator.userAgent || navigator.vendor || window.opera);