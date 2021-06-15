$(function() {

    var $gnb = $('#gnb'),
        $gnbSpacer = $gnb.next(),
        $lnb = $('#lnb');

    var initMenuAim = function() {

        var $menu = $('#gnb ul.d2, #lnb ul.d3');

        var deactiveAll = function() {
            $menu.find('div').css({
                'opacity': 0,
                'visibility': 'hidden',
                'transition': 'opacity .2s 0s, visibility 0s .2s'
            });
        };

        var activateSubmenu = function(row) {
            var $row = $(row),
                submenuId = $row.data("submenuId"),
                $submenu = $("#" + submenuId),
                height = $menu.outerHeight(),
                width = $menu.outerWidth();

            // deactiveAll();
            $submenu.css({
                'opacity': 1,
                'visibility': 'visible',
                'transition': 'opacity .2s 0s, visibility 0s 0s'
            });

        };

        var deactivateSubmenu = function(row) {
            var $row = $(row),
                submenuId = $row.data("submenuId"),
                $submenu = $("#" + submenuId);

            // deactiveAll();
            $submenu.css({
                'opacity': 0,
                'visibility': 'hidden',
                'transition': 'opacity .4s 0s, visibility 0s .4s'
            });

        };

        if (typeof $menu.menuAim !== 'function') return false;

        $menu.menuAim({
            activate: activateSubmenu,
            deactivate: deactivateSubmenu
        });
    };

    /**
     * active gnb, lnb navigation
     */
    var initNav = function() {

        var doActiveNav = function() {

            var _core = function(_el) {

                var $el = $('#gnb');
                var _class = 'active';

                if (_el == 'lnb') {
                    $el = $('#lnb');
                    /*
                    $el.find('div.d2').removeAttr('style');
                    var _d2 = $el.find('li.d1').eq($.params.nav[0]).find('div.d2');
                    var _height = Math.max(_d2.children().height() + 50, 200);
                    _d2.height(_height);
                    */
                }

                $el.find('li').removeClass('active');

                if ($.params.nav[0] !== null) {

                    $el.find('li.d1').eq($.params.nav[0]).addClass(_class)
                        .find('li.d2').eq($.params.nav[1]).addClass(_class)
                        .find('li.d3').eq($.params.nav[2]).addClass(_class);

                    if (_el == 'gnb') {
                        var _title = $el.find('li.d1').eq($.params.nav[0]).find('a').eq(0).text();
                        $('#lnb').find('.title').text(_title);
                    }

                }
            };

            _core('gnb');
            _core('lnb');


        };

        var setActiveNav = function(e) {
            var _d1, _d2, _d3;
            _d1 = _d2 = _d3 = 0;
            var $el = $(this).parent();
            if ($el.hasClass('d3')) {
                _d3 = $el.index();
                $el = $el.parents('li');
            }
            if ($el.hasClass('d2')) {
                _d2 = $el.index();
                $el = $el.parents('li');
            }
            if ($el.hasClass('d1')) {
                _d1 = $el.index();
            }
            $.params.nav = [_d1, _d2, _d3];
            doActiveNav();
        };

        var _handler = {
            'activate': setActiveNav,
            'click': function() {
                $(this).trigger('activate');
            }
        };

        $gnb.find('a').on(_handler);
        $lnb.find('a').on(_handler);

        doActiveNav();

    };

    /**
     * json 데이타를 추출하여 DOM 트리 구성
     * @param  {[type]} _json [description]
     * @return {[type]}       [description]
     */
    var _returnJsonTree = function(_json) {

        var _result = '';

        var _core = function(_arr) {
            _result += '<ul>';
            $.each(_arr, function(i) {
                var _this = this;
                _result += '<li>';
                _result += '<a href="' + _this.src + '"><span>' + _this.name + '</span></a>';
                if (_this.child !== undefined && _this.child !== null) {
                    _result += '<div>';
                    _core(_this.child);
                    _result += '</div>';
                }
                _result += '</li>';
            });
            _result += '</ul>';
        };

        if (_json === undefined) return false;

        _core(_json.child);

        return _result;

    };

    var _nav = _returnJsonTree($.params.tree);

    var initNavList = function(_el, _menuAimId) {

        var _core = function(_el) {

            _el.each(function(i) {

                var $this = $(this),
                    $anchor = $this.children('a'),
                    $div = $this.children('div'),
                    $ul = $div.children('ul');

                if ($this.parent().attr('menu') === undefined) {
                    $this.parent().attr('menu', 'menu');
                }

                var _class = $this.parent().attr('menu') + '-' + i;

                var _depth = ((_class.split('-').length) - 1);

                $this.attr('menu', _class);
                $anchor.attr('menu', _class);
                $div.attr('menu', _class);
                $ul.attr('menu', _class);

                $this.addClass('d' + _depth).addClass(_class);
                $anchor.addClass('d' + _depth).addClass(_class);
                $div.addClass('d' + (_depth + 1)).addClass(_class);
                $ul.addClass('d' + (_depth + 1)).addClass(_class);

                $this.attr('data-submenu-id', _menuAimId + _class);
                $div.attr('id', _menuAimId + _class);

                if ($ul.length) { // loop
                    _core($ul.children());
                }

            });

        };

        _core(_el);

    };

    $('#gnb .core').empty().html(_nav);
    $('#lnb .core').empty().html(_nav);

    $('#gnb ul').eq(0).addClass('nav');
    $('#lnb ul').eq(0).addClass('nav');

    initNavList($('#gnb ul').eq(0).children(), 'gnb');
    initNavList($('#lnb ul').eq(0).children(), 'lnb');

    var initGnb = function() {
        var $gnbLi = $gnb.find('ul').eq(0).children();
        var _navWidth = (1 / ($gnbLi.length + 2) * 100) + '%';

        // $gnb.children().css('padding-left', _navWidth);
        // $gnb.children().css('padding-right', _navWidth);

        // gnb
        // $gnbLi.css('width', (1 / ($gnbLi.length) * 100) + '%');

    };

    initGnb();
    initMenuAim();
    initNav();

});
