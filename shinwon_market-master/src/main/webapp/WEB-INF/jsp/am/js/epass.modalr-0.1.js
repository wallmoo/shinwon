/**
 *                                           _
 *   ___  ____  ____ ____________________  (_)
 *  / _ \/ __ \/ __ `/ ___/ ___/ ___/ __ \/ /
 * /  __/ /_/ / /_/ (__  |__  ) /__/ / / / /
 * \___/ .___/\__,_/____/____/\___/_/ /_/_/
 *    /_/
 * modal popup
 * author: riix@epasscni.com
 */

(function($, window, document, ua) {

    'use strict';

    var Modal = function() {

        var $document = $(document), // dom cache
            $html = $('html');

        // base for return object
        var base = {
            $el: null, // modal
            $inner: null, // modal inner
            $title: null, // title
            $buttons: null, // buttons
            $anchor: null, // anchor
            progressObj: null, // progress bar object
            progress: 100, // progress percent
            width: 0,
            height: 0
        };

        // setting
        var setting = {
            html: [
                '<div id="modal" class="md-modal"><div class="md-content">',
                '<h3 class="title"><a href="javascript:;">Modal Dialog</a></h3>',
                '<div id="modalInner" class="inner-wrapper"></div>',
                '<div class="section-buttons"></div>',
                '<a href="javascript:;" class="md-close close"><span class="icon"><em>닫기</em></span></a>',
                '</div>',
                '</div>'
            ],
            title: 'Modal', // 제목
            text: '<p>처리중입니다.</p>', // 내용
            buttonSubmit: false, // 확인버튼 출력여부
            buttonCancel: false, // 취소버튼 출력여부
            buttonClose: true, // 닫기버튼 출력여부
            closeOnSubmit: true, // 확인 클릭 시 닫기
            dragAndMove: true, // drag and move 기능
            indicator: true, // indicator
            labelSubmit: '확인', // 확인버튼 레이블
            labelCancel: '취소', // 취소버튼 레이블
            labelClose: '닫기', // 닫기버튼 레이블
            overlay: true, // overlay 유무
            perspective: false, // perspective 유무
            position: null, // 'left bottom'
            size: null, // '200x500'
            sizeMax: '800x600', // max width, max height
            focusFormEl: true, // focus to form element
            fx: 'fx-9', // effect
            fullSize: false, // 전체화면
            onInit: function(base) {
                // 생성시 실행
                // console.log('init');
            },
            onComplete: function(base) { // 팝업 완료시 실행
                // console.log('complete');
            },
            onSubmit: function(base) { // 확인 버튼 클릭시 실행
                // console.log('submit');
            },
            onCancel: function(base) { // 취소 버튼 클릭시 실행
                // console.log('cancel');
            },
            progress: true, // progress 동작 유무
            initProgress: function() { // progress 생성
                if (typeof Nanobar === 'function') {
                    var _id = 'modalProgressBar';
                    $('#' + _id).off().remove();
                    base.progressObj = new Nanobar({ // progress bar
                        bg: '#ff8000',
                        id: _id
                    });
                    $('#' + _id).addClass('progressbar');
                }
            },
            onProgress: function(base) { // progress 진행시 호출
                if (typeof Nanobar === 'function' && typeof base.progressObj == 'object') {
                    base.progressObj.go(base.progress); // percent
                }
            }
        };

        var params,
            opts;

        var REGSIZE = /^(\d{1,4})x(\d{1,4})$/;

        var _transitionEndEventName = 'webkitTransitionEnd oTransitionEnd MSTransitionEnd transitionend transitionEnd',
            _animEndEventName = 'webkitAnimationEnd oAnimationEnd MSAnimationEnd animationend animationEnd';

        var _is = { // detect object
            lteIE10: !!window.ActiveXObject, // IE, lte 10
            gteIE10: (!!window.navigator.msPointerEnabled), // IE, gte 10
            cssanimations: !$html.hasClass('no-cssanimations'),
            animating: false
        };

        var _delay = { // delay object
            second: 250, // 찰나, 효과를 위해서 확보 되어야 함, 300ms 가 css 모션 기준
            beforeComplete: 1, // complete 콜백 전 딜레이
            anim: 300 // 가상 애니메이션 지연 시간, 콜백이나 핸들링 지연에 사용
        };

        _delay.second = (_is.lteIE10 === true || _is.gteIE10 === true) ? 300 : _delay.second; // ie 대응, 찰나 수정

        var _timer = { // timer object
            modal: null,
            overlay: null,
            progressComplete: null,
            beforeComplete: null,
            forceComplete: null
        };

        /**
         * common func.
         */
        var common = {
            callFunc: function(_func, _bool, _param) {
                if (_bool !== undefined && _bool === false) return false;
                _func = (typeof _func == 'string') ? window[_func] : _func;
                _param = (_param === null) ? '' : _param;
                if (_func && $.isFunction(_func)) {
                    _func.call(null, base, _param);
                } else {
                    console.log('no exist function');
                }
            },
            returnAnchor: function(_el) {
                var $el = (_el[0].tagName !== undefined && _el[0].tagName.toLowerCase() !== 'a') ? _el.parents('a').eq(0) : _el;
                return $el;
            },
            progress: function(_func, _el) {

                var $imgs = _el.find('img');

                var _length = $imgs.length,
                    _blocker = 0,
                    _percent = 0;

                var _callback = function(num) { // callback
                    base.progress = num;
                    common.callFunc(_func);

                    if (num >= 100) { // complete

                        _timer.progressComplete = setTimeout(function() {
                            $html.removeClass('is-indicator');
                            util.setPosition();
                        }, _delay.anim);

                    }
                };

                var _core = function(i) {

                    var $img = $imgs.eq(i);

                    if ($img.length > 0) {

                        $('<img />', {
                            'src': $img.attr('src')
                        }).one('load', function() {
                            _percent = Math.max(parseInt((i / _length) * 100, 10), 5);
                            _callback(_percent); // going
                            _core(i + 1);
                        }).error(function() {
                            _core(i + 1);
                        });

                    } else {

                        if (_blocker <= 1) {
                            _blocker++;
                            _callback(100); // complete
                        }

                    }

                };

                if (_length < 0) {
                    _callback(100);
                } else {
                    _callback(5); // start
                    _core(0);
                }

            }
        };

        /**
         * utilities
         */
        var util = {
            getParam: function(_params) {

                var $anchor = null; // reset

                if (_params[0] !== null && typeof _params[0] == 'object') { // _params = event
                    $anchor = $(_params[0].target);
                    $anchor = common.returnAnchor($anchor);
                } else {
                    console.log('_params[0] is must be event object');
                }

                params = _params[1];
                opts = $.extend({}, setting, params);
                opts.html = opts.html.join('');
                base.$anchor = $anchor;

            },
            // set button
            setButton: function(_type) {

                var $el = base.$buttons,
                    $button = null;

                var _submit = opts.buttonSubmit,
                    _cancel = opts.buttonCancel,
                    _close = opts.buttonClose;

                $el.empty();

                if (_submit === true || _cancel === true) {
                    if (_submit === true) {
                        $button = $('<a href="javascript:;" class="button submit"><span>' + opts.labelSubmit + '</span></a>');
                        $el.append($button);
                    }
                    if (_cancel === true) {
                        $button = $('<a href="javascript:;" class="button cancel"><span>' + opts.labelCancel + '</span></a>');
                        $el.append($button);
                    }
                } else {
                    if (_close === true) {
                        $button = $('<a href="javascript:;" class="button close"><span>' + opts.labelClose + '</span></a>');
                        $el.append($button);
                    }
                }

            },
            // set size
            setSize: function() {

                if (opts.fullSize === true) { // opts. full size
                    $el.addClass('fx-full');
                    return false;
                }

                var $el = base.$el,
                    $inner = base.$inner;

                var _toWidth = 0,
                    _toHeight = 0;

                base.width = $el.width();
                base.height = $el.height();

                var _setInnerScroll = function() {

                    var _margin = parseInt($inner.css('marginTop'), 10) + parseInt($inner.css('marginBottom'), 10); // inner 상하 마진
                    var _innerHeight = parseInt($el.height() - base.$title.height() - base.$buttons.height() - _margin, 10);
                    $inner.css({
                        'height': _innerHeight,
                        'overflow': 'auto',
                        'overflow-x': 'hidden'
                    });
                };

                if (opts.size !== undefined && opts.size !== null && REGSIZE.test(opts.size)) { // set size
                    var _size = opts.size.split('x');
                    _toWidth = _size[0];
                    _toHeight = _size[1];
                }

                if (opts.sizeMax !== undefined && opts.sizeMax !== null && REGSIZE.test(opts.sizeMax)) { // set max size
                    var _sizeMax = opts.sizeMax.split('x');
                    _toWidth = Math.min(_toWidth, _sizeMax[0]);
                    _toHeight = Math.min(_toHeight, _sizeMax[1]);
                }

                if (_toWidth > 0) {
                    base.width = _toWidth;
                    $el.css('width', _toWidth);
                }

                if (_toHeight > 0) {
                    base.height = _toHeight;
                    $el.css('height', _toHeight);
                    _setInnerScroll();
                }

            },
            // set perspective
            setPerspective: function(_bool) {
                if (opts.perspective === false) return false; // opts
                $html.toggleClass('md-perspective', _bool);
            },
            // set position
            setPosition: function() {

                if (opts.fx === 'fx-7' || opts.fx === 'fx-12') return false; // opts.

                var $el = base.$el;

                var _width = $el.width(),
                    _height = $el.height();

                var _top,
                    _left,
                    _classArrow;

                var _setPositionCenter = function() { // 중앙 정렬
                    $el.css({
                        'margin-left': 0 - (_width / 2),
                        'margin-top': 0 - (_height / 2)
                    });
                };

                var _setPosition = function() { // 위치 지정

                    var _anchorOffset = base.$anchor.offset(),
                        _anchorTop = parseInt(_anchorOffset.top, 10),
                        _anchorLeft = parseInt(_anchorOffset.left, 10);

                    if (opts.position == 'left bottom') { // 위치 지정시
                        _classArrow = 'arrow';
                        _top = (_anchorTop - $el.height() - 10);
                        _left = _anchorLeft;
                    }

                    $el.addClass(_classArrow);
                    $el.css({
                        'position': 'absolute',
                        'z-index': 99,
                        'top': _top,
                        'left': _left
                    });

                };

                if (opts.position !== null) {
                    _setPosition();
                } else {
                    _setPositionCenter();
                }

            },
            // toggle display overlay
            toggleOverlay: function(_bool) {
                if (opts.overlay === false || opts.position !== null) return false; // opts.
                $html.toggleClass('is-overlay', _bool);
            },
            // drag and drop
            dragMove: function(_bool) {

                if (opts.dragAndMove === false) return false; // opts.

                var _selector = '.md-modal .title', // handler selector
                    _class = 'is-handle-clicked';

                var $handler = $(_selector),
                    $el = $handler.parents('.md-modal');

                var _reset = function(e) { // reset
                    e.preventDefault();
                    $el.toggleClass(_class, false);
                    $document.off('.draggr-sub');
                };

                var _hander = function(e) {

                    var _offset = $handler.offset(), // 정확한 좌표 탐지를 위한 보정 장치
                        _marginX = e.pageX - _offset.left,
                        _marginY = e.pageY - _offset.top;

                    $el.toggleClass(_class, true);

                    $document.one('mouseup.draggr-sub', _selector, _reset);
                    $document.one('mouseup.draggr-sub', _reset);
                    $document.on('mousemove.draggr-sub', function(e) {
                        e.preventDefault();
                        if ($el.hasClass(_class) !== true) return false;

                        $el.offset({
                            left: e.pageX - _marginX, // 정확한 좌표 탐지를 위한 보정 장치
                            top: e.pageY - _marginY
                        });

                    });
                };

                var _init = function() {
                    $handler.css('cursor', 'move');
                    $document.off('.draggr .draggr-sub');
                    $document.on('mousedown.draggr', _selector, _hander);
                };

                if (_bool === true) {
                    _init(); // init
                } else {
                    $document.off('.draggr .draggr-sub'); // destroy
                }

            }
        };

        /**
         * modeling
         */
        var model = {

            // do reset modal
            reset: function() {

                $('#modal').remove(); // reset model

                var _resetElement = function() { // reset element
                    base.$el = $(opts.html).prependTo('body');
                    base.$inner = base.$el.find('.inner-wrapper');
                    base.$title = base.$el.find('.title');
                    base.$buttons = base.$el.find('.section-buttons');
                    base.$close = base.$el.find('.md-close');
                };

                _resetElement(); // reset element
                $html.toggleClass('is-modal is-overlay', false); // turn off modal
                common.callFunc(opts.onInit); // on init callback 

            },
            // destroy
            destroy: function() {

                if (_is.animating === true) return false; // detect animating
                model.toggle(false);

            },
            // do focus
            setFocus: function(_bool) { // 정리 필요

                var $anchor = base.$anchor,
                    $title = base.$title,
                    $el = base.$el,
                    $input = $el.find('input[type="text"], input[type="number"]');

                if (_bool === true) {

                    $el.attr('tabindex', '1').focus();
                    $title.children().focus();

                    if ($input.length && opts.focusFormEl === true) {
                        $input.eq(0).focus();
                    }

                } else {
                    $anchor.focus();
                }

            },
            // set handler
            handler: function(_bool) {

                $document.off('.modal'); // set off handler

                var _destroy = function() {
                    model.destroy();
                };

                if (_bool === true) {
                    $document.one('click.modal', '#modal a.close', function(e) {
                        e.preventDefault();
                        e.stopPropagation();
                        _destroy();
                    });
                    $document.one('click.modal', '#modal .submit', function(e) {
                        common.callFunc(opts.onSubmit);
                        if (opts.closeOnSubmit === true) _destroy();
                    });
                    $document.one('click.modal', '#modal .cancel', function(e) {
                        common.callFunc(opts.onCancel);
                        _destroy();
                    });
                    $('.md-close').on('focusout.modal', function(e) {
                        base.$title.children().focus();
                    });
                    _timer.overlay = setTimeout(function() { // 중복 실행 방지
                        $document.one('click.modal', '#overlay', function(e) {
                            e.preventDefault();
                            e.stopPropagation();
                            _destroy();
                        });
                    }, _delay.anim);

                }

            },
            // do open
            open: function() {

                if (_is.animating === true) return false; // detect animating

                var $el = base.$el,
                    $title = base.$title,
                    $close = base.$close;

                $el.addClass(opts.fx); // set fx class
                $title.children().html(opts.title + '<span class="sr-only"> 레이어</span>'); // set title
                $close.find('em').text(opts.title + ' 레이어 닫기');

                if (opts.indicator === true) $html.addClass('is-indicator'); // indicator

                if (opts.progress === true) { // progress
                    common.callFunc(opts.initProgress); // init
                    common.progress(opts.onProgress, $el); // set progress, when next build
                }

                util.setButton(); // set button
                util.setSize(); // set size
                util.setPosition(); // set position

                model.toggle(true);

            },
            resetTimer: function() { // reset timer object
                clearTimeout(_timer.modal);
                clearTimeout(_timer.overlay);
                clearTimeout(_timer.beforeComplete);
                clearTimeout(_timer.forceComplete);
            },
            toggle: function(_bool) { // toggle modal

                var $el = base.$el;
                var _blocker = 0;

                _is.animating = true;

                model.resetTimer(); // reset timer object

                var _core = function(_str) {

                    if (_blocker >= 1) return false;

                    _blocker++;

                    $el.off(_transitionEndEventName); // transition 감지 해제 

                    _timer.beforeComplete = setTimeout(function() {

                        _is.animating = false;

                        $html.toggleClass('is-modal', _bool);
                        $el.toggleClass('is-modal-complete', _bool);

                        util.setPerspective(_bool); // set perspective
                        util.dragMove(_bool); // drag and move

                        model.resetTimer(); // reset timer object
                        model.handler(_bool); // set handler    
                        model.setFocus(_bool); // set focus

                        common.callFunc(opts.onComplete, _bool); // callback

                        if (opts.progress === false) $html.removeClass('is-indicator'); // progress 기능 없을때 indicator 강제 제거

                        if (_bool === false) { // turn off 시 clean
                            $el.remove();
                        }

                        console.log('modal toggled by: ' + _str);

                    }, _delay.beforeComplete);

                };

                if (_bool === true && _is.cssanimations === true) { // transition 감지, off 일때는 force 방식으로 _core 호출
                    $el.one(_transitionEndEventName, function() {
                        _core('transitionend');
                    });
                }

                _timer.modal = setTimeout(function() {

                    if (_bool === true) util.setPerspective(_bool); // set perspective, true 일 경우 먼저 실행

                    $el.toggleClass('md-show', _bool);
                    util.toggleOverlay(_bool); // toggle overlay    

                    _timer.forceComplete = setTimeout(function() { // off 일때는 force 방식으로 _core 호출
                        _core('force');
                    }, _delay.anim);

                }, _delay.second);

            },
            drag: function(e) {
                console.log(e.pageY);
            }
        };

        /**
         * build contents
         */
        var build = {
            html: function() {
                base.$inner.html(opts.text);
                model.open();
            },
            ajax: function(_callback) {

                var $sandbox = $('<div />'),
                    $firstchild,
                    $inner;

                var _selector = '.modal-inner', // div selector
                    _src = opts.text,
                    _html;

                var _core = function(_data) {
                    $sandbox.html(_data);
                    $firstchild = $sandbox.find('div').eq(0);
                    $inner = $sandbox.find(_selector);
                    $sandbox = ($inner.length) ? $inner : $firstchild;
                    base.$inner.html($sandbox.html());
                    model.open();
                };

                try {
                    $sandbox.load(_src, function(data) { // ajax load
                        _core(data);
                    });
                } catch (e) {
                    console.log(e.message);
                }

            },
            clone: function(_callback) {
                var $target = $(opts.text);
                if (!$target.length) {
                    console.log('there is no element');
                    return false;
                }
                base.$inner.html($target.html());
                model.open();
            },
            iframe: function(_callback) {
                var $iframe = $('<iframe src="' + opts.text + '" class="iframe" frameborder="0" width="400" height="400" marginwidth="0" marginheight="0" scrolling="no" />');
                base.$inner.append($iframe);
                model.open();
            },
            image: function(_callback) {
                base.$inner.html(opts.text);
                model.open();
            }
        };

        /**
         * structure
         */
        var modal = function(_arg, _type) {
            util.getParam(_arg);
            model.reset();
            switch (_type) {
                case 'clone':
                    build.clone();
                    break;
                case 'ajax':
                    build.ajax();
                    break;
                case 'iframe':
                    build.iframe();
                    break;
                case 'image':
                    build.image();
                    break;
                default:
                    build.html();
                    break;
            }
        };

        /**
         * public method
         */
        return {
            close: function() {
                model.destroy();
            },
            html: function() {
                modal(arguments, 'html');
            },
            clone: function() {
                modal(arguments, 'clone');
            },
            ajax: function() {
                modal(arguments, 'ajax');
            },
            iframe: function() {
                modal(arguments, 'iframe');
            },
            image: function() {
                modal(arguments, 'image');
            }
        };
    };

    // jquery way
    $.modal = new Modal();

})(jQuery, window, document, navigator.userAgent || navigator.vendor || window.opera);


$(function() {

    var $document = $(document);

    // 더블 클릭 방지
    var _isActive = false,
        _timerDbClick = null;

    var returnAnchor = function(_el) { // return anchor element
        var $el = (_el[0].tagName !== undefined && _el[0].tagName.toLowerCase() !== 'a') ? _el.parents('a').eq(0) : _el;
        return $el;
    };

    // get custom data
    var getCustomData = function(e) {

        var _result = {},
            _defaults = {
                html: null,
                title: null, // 제목
                text: null, // 내용
                buttonSubmit: null, // 확인버튼 출력여부
                buttonCancel: null, // 취소버튼 출력여부
                buttonClose: null, // 닫기버튼 출력여부
                closeOnSubmit: null, // 확인 클릭 시 닫기
                dragAndMove: true, // drag and move 기능
                indicator: null, // indicator
                labelSubmit: null, // 확인버튼 레이블
                labelCancel: null, // 취소버튼 레이블
                labelClose: null, // 닫기버튼 레이블
                overlay: null, // overlay 유무
                position: null, // 'left bottom'
                perspective: null, // perspective
                size: null, // '200x500'
                sizeMax: null, // max width, max height
                focusFormEl: null, // focus to form element
                fx: null, // effect
                fullSize: null, // 전체화면
                onInit: null, // 생성시 실행
                onComplete: null, // 팝업 완료시 실행
                onSubmit: null, // 확인 버튼 클릭시 실행
                onCancel: null, // 취소 버튼 클릭시 실행
                progress: null, // progress 기능 설정
                initProgress: null, // progress 생성
                onProgress: null // progress 진행시 호출
            };

        var $this = $(e.target);

        $this = returnAnchor($this); // return anchor element

        $.each(_defaults, function(key, val) { // get custom data
            var _key = (key.replace(/([a-z])([A-Z])/g, '$1-$2')).toLowerCase(); // buttonSubmit 을 button-submit 등으로 camelCase 를 hipen 구조로 변환
            var _data = $this.data(_key);
            if (_data !== undefined) {
                _result[_key] = _data;
            }
        });

        return _result;
    };

    // set handler
    var _handler = function(e) {

        var $this = $(e.target),
            _class;

        $this = returnAnchor($this); // return anchor element

        _class = $this.attr('class');

        if (_class !== undefined && _class.match('js-modal')) {

            e.preventDefault();
            e.stopPropagation();

            // 더블 클릭 방지
            _timerDbClick = setTimeout(function() {
                _isActive = false;
            }, 300);

            if (_isActive === true) return false;

            _isActive = true;

            if (_class.match('js-modal-html')) {
                $.modal.html(e, getCustomData(e));
            } else if (_class.match('js-modal-image')) {
                $.modal.html(e, getCustomData(e));
            } else if (_class.match('js-modal-clone')) {
                $.modal.clone(e, getCustomData(e));
            } else if (_class.match('js-modal-ajax')) {
                $.modal.ajax(e, getCustomData(e));
            } else if (_class.match('js-modal-close')) {
                $.modal.close(e);
            }

        }

    };

    $document.on('click', _handler); // set handler

});