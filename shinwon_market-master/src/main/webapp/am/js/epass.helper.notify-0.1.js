/**
 *                                           _
 *   ___  ____  ____ ____________________  (_)
 *  / _ \/ __ \/ __ `/ ___/ ___/ ___/ __ \/ /
 * /  __/ /_/ / /_/ (__  |__  ) /__/ / / / /
 * \___/ .___/\__,_/____/____/\___/_/ /_/_/
 *    /_/
 * alertify helper
 * author: riix@epasscni.com
 */

(function($, window, document, ua) {

    'use strict';

    var Notify = function() {

        var param1, param2, param3, param4;

        var getParam = function(params) {
            console.log(params.length);
            param1 = param2 = param3 = param4 = null; // reset
            param1 = params[0];
            param2 = params[1];
            param3 = params[2];
            param4 = params[3];
        }

        var _setting = {
            labels: {
                ok: "확인",
                cancel: "취소"
            },
            delay: 5000,
            buttonReverse: false,
            buttonFocus: "ok"
        };

        var _notify = {

            reset: function() {
                alertify.set(_setting);
            },

            set: function() {
                this.reset();
                alertify.set($.extend({}, _setting, param1));
            },

            alert: function() {
                alertify.alert(param1, param2, param3); // alertify.alert(message, fn, cssClass)
            },

            confirm: function() {
                alertify.confirm(param1, param2, param3); // alertify.confirm(message, fn, cssClass)
            },

            prompt: function() {
                alertify.prompt(param1, param2, param3, param4) // alertify.prompt(message, fn, placeholder, cssClass)
            },

            log: function() {
                alertify.log(param1, param2, param3); // alertify.log(message, type, wait)
            },

            success: function() {
                alertify.log(param1, 'success', param2); // alertify.success(message, wait)
            },

            error: function() {
                alertify.log(param1, 'error', param2); // alertify.error(message, wait)
            },

            extend: function() {
                getParam(arguments);
                return alertify.extend(param1); // alertify.custom = alertify.extend("custom"); alertify.custom("I'm a custom log message");
            }
        }

        return {
            reset: function() {
                _notify.reset();
            },
            set: function() {
                getParam(arguments);
                _notify.set(arguments);
            },
            alert: function() {
                getParam(arguments);
                _notify.alert();
            },
            confirm: function() {
                getParam(arguments);
                _notify.confirm();
            },
            prompt: function() {
                getParam(arguments);
                _notify.prompt();
            },
            log: function() {
                getParam(arguments);
                _notify.log();
            },
            success: function() {
                getParam(arguments);
                _notify.success();
            },
            error: function() {
                getParam(arguments);
                _notify.error();
            },
            extend: _notify.extend
        };

    };

    // AMD and window support
    /*
    if (typeof define === "function") {
        define([], function() {
            return new Notify();
        });
    } else if (typeof window.Notify === "undefined") {
        window.notify = new Notify();
    }
    */

    // jquery way
    $.notify = new Notify();

})(jQuery, window, document, navigator.userAgent || navigator.vendor || window.opera);


$(function() {

    var initNotification = function() {

        var $document = $(document);

        var param = {};

        // 클릭 기본기능 차단
        var _preventDefault = function(e) {
            var $this = _returnThis(e);
            if ($this.data('prevent') === true) e.preventDefault();
        };

        // 클릭 이벤트 객체 반환
        var _returnThis = function(e) {
            var $this = $(e.target);
            $this = ($this[0].tagName.toLowerCase() !== 'a') ? $this.closest('a') : $this;
            return $this;
        };

        // 파라미터 반환
        var _returnParam = function(e) {
            var $this = _returnThis(e);
            var $target = ($this.attr('href') !== '#!' && $($this.attr('href')).length) ? $($this.attr('href')) : undefined;
            param = {
                el: $this,
                target: $target,
                message: ($this.attr('title')) ? $this.attr('title') : undefined,
                type: null,
                ok: ($this.data('ok')) ? $this.data('ok') : undefined,
                cancel: ($this.data('cancel')) ? $this.data('cancel') : undefined
            };
        };

        // 콜백
        var _callFunc = function(_callback, _el, _param, _delay) {
            _callback = (typeof _callback == 'string') ? window[_callback] : _callback;
            if ($.isFunction(_callback)) {
                _param = (_param === null) ? '' : _param;
                setTimeout(function() {
                    _callback.call(null, _el, _param);
                }, 1);
            }
        };

        var handler = {
            log: function(e) { // 인라인 로거
                _preventDefault(e);
                _returnParam(e);
                if (param.el.hasClass('success')) {
                    param.type = 'success';
                } else if (param.el.hasClass('error')) {
                    param.type = 'error';
                }
                $.notify.log(param.message, param.type);
            },
            alert: function(e) { // 인라인 경고창
                _preventDefault(e);
                _returnParam(e);
                if (param.message !== undefined) {
                    $.notify.reset();
                    $.notify.alert(param.message);
                }
            },
            confirm: function(e) { // 인라인 확인
                _preventDefault(e);
                _returnParam(e);
                if (param.message !== undefined) {
                    $.notify.confirm(param.message, function(e) {
                        if (e) {
                            _callFunc(param.ok);
                        } else {
                            _callFunc(param.cancel);
                        }
                    });
                }
            },
            prompt: function(e) { // 인라인 프롬프트
                _preventDefault(e);
                _returnParam(e);
                if (param.message !== undefined) {
                    $.notify.reset();
                    $.notify.prompt(param.message, function(e, str) {
                        if (e) {
                            param.target.text(str);
                        }
                    }, param.target.text());
                }
            }
        }

        // 핸들러 등록
        var setHandler = (function() {
            $document.on('click', '.js-log', handler.log); // 인라인 로거
            $document.on('click', '.js-alert', handler.alert); // 인라인 경고창
            $document.on('click', '.js-confirm', handler.confirm); // 인라인 확인
            $document.on('click', '.js-prompt', handler.prompt); // 인라인 프롬프트            
        })();

    };

    initNotification();

});

// data-ok 에 연결된 콜백
var doOk = function() {
    $.notify.success('ok');
}

// data-cancel 에 연결된 콜백
var doCancel = function() {
    $.notify.log('cancel');
}