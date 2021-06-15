/**
 * @PackageName: js
 * @FileName : common.select.js
 * @Date : 2015. 12. 22.
 * @프로그램 설명 : 프론트 > 상품관리에 관련된 로직을 처리하는 JS파일
 * @author DEV_JANGSIN
 */
(function (jQuery) {
    
    $.fn.extend(jQuery, {
        
        common : {
            
            /**
             * <pre>
             * 1. MethodName : common.createNextSelectOption
             * 2. ClassName  : common.select.js
             * 3. Comment    : 카테고리와 같은 계층형 테이블의 하위 Depth 데이터를 셀렉트 박스 옵션으로 생성한다. 
             * 4. 작성자       : DEV_JANGSIN
             * 5. 작성일       : 2015. 12. 22.
             * </pre>
             *
             * @param customOption
             * 
             * ex) - $.common.createNextSelectOption.init(option, callback);
             *     - option : {
             *           targets : selectbox objects (array)
             *           , url : controller mapping url (json type)
             *           , parameter : 'parameterName'
             *           , column : {index : 'idx', name : 'name'}
             *       };
             *     - callback : change event가 발생된 후 호출  
             */
            createNextSelectOption : {
                
                option : {}
                /**
                 * <pre>
                 * 1. MethodName : common.getOption
                 * 2. ClassName  : common.select.js
                 * 3. Comment    : 옵션을 반환한다. 
                 * 4. 작성자       : DEV_JANGSIN
                 * 5. 작성일       : 2015. 12. 28.
                 * </pre>
                 *
                 * @param option
                 * @returns
                 */
                , getOption : function (option) {
                    
                    if (option === undefined) {
                        
                        option = this.option;
                        
                    }
                    
                    return option;
                }
                /**
                 * <pre>
                 * 1. MethodName : common.createNextSelectOption.init
                 * 2. ClassName  : common.select.js
                 * 3. Comment    : 초기 셋팅을 한다.
                 * 4. 작성자       : DEV_JANGSIN
                 * 5. 작성일       : 2015. 12. 22.
                 * </pre>
                 *
                 * @param customOption
                 * @param callback
                 */
                , init : function (customOption, callback) {
                    
                    if (typeof customOption === 'object') {
                        
                        var _this = this;
                        
                        // option setting
                        _this.option = customOption;
                        
                        // array loop
                        $.each(customOption.targets, function (i) {
                            
                            var $this = $(this);
                            
                            // event regist
                            _this.eventTrigger($this, i, callback);
                            // option selected
                            _this.selected($this, i);
                            
                        });
                    }
                }
                /**
                 * <pre>
                 * 1. MethodName : common.createNextSelectOption.eventTrigger
                 * 2. ClassName  : common.select.js
                 * 3. Comment    : 셀렉트 박스 변경 이벤트를 등록 한다.
                 * 4. 작성자       : DEV_JANGSIN
                 * 5. 작성일       : 2015. 12. 22.
                 * </pre>
                 *
                 * @param $el
                 * @param i
                 * @param callback
                 */
                , eventTrigger : function ($el, i, callback) {
                    
                    var _this = this
                        , option = _this.option;
                    
                    $el.on('change', function (e) {

                        var $this = $(this);
                        
                        // next target
                        var target = option.targets[i + 1];
                        
                        if (target !== undefined) {
                            
                            var value = $this.val();
                            
                            if (value !== '') {
                                
                                // ajax call
                                _this.ajaxOptionList($(target), value, 'event', option);
                                
                            } else {
                                
                                $(option.targets).filter(':gt(' + i + ')').children().not(':first-child').remove();
                                
                            }
                        }
                        
                        if (typeof callback === 'function') {
                            
                            // callback call
                            callback($this, e);
                            
                        }
                    });
                }
                /**
                 * <pre>
                 * 1. MethodName : common.createNextSelectOption.ajaxOptionList
                 * 2. ClassName  : common.select.js
                 * 3. Comment    : ajax를 처리한다. 
                 * 4. 작성자       : DEV_JANGSIN
                 * 5. 작성일       : 2015. 12. 22.
                 * </pre>
                 *
                 * @param $el
                 * @param value
                 * @param type
                 * @param option
                 */
                , ajaxOptionList : function ($el, value, type, option) {
                    
                    var _this = this
                        , data = new Object();

                    option = _this.getOption(option);
                    data[option.parameter] = value;
                    
                    $.ajax({
                        
                        type : 'POST'
                        , async : true
                        , dataType :'json'
                        , data : data
                        , url : option.url
                        , success : function (data) {
                            
                            // ajax result
                            _this.fnResult($el, data, type, option);
                            
                        }
                        , error : function(err) { 
                            
                            alert( 'error : ' + err.status );
                            
                        }
                        
                    });
                }
                /**
                 * <pre>
                 * 1. MethodName : common.createNextSelectOption.fnResult
                 * 2. ClassName  : common.select.js
                 * 3. Comment    : ajax 결과를 처리한다.
                 * 4. 작성자       : DEV_JANGSIN
                 * 5. 작성일       : 2015. 12. 22.
                 * </pre>
                 *
                 * @param $el
                 * @param data
                 * @param type
                 * @param option
                 */
                , fnResult : function ($el, data, type, option) {

                    option = this.getOption(option);
                    
                    if($el.children(':first-child').val()==""){
                        $el.children().not(':first-child').remove();    
                    }
                    else{
                        $el.children().remove();
                    }
                    
                    // option create
                    $el.append(this.optionStr(data, option));

                    if (type === 'init') {
                        
                        var value = $el.data('selected_value');
                        $el.children('option[value="' + value + '"]').prop('selected', true);
                        
                    }
                }
                /**
                 * <pre>
                 * 1. MethodName : common.createNextSelectOption.optionStr
                 * 2. ClassName  : common.select.js
                 * 3. Comment    : Option을 생성한다. 
                 * 4. 작성자       : DEV_JANGSIN
                 * 5. 작성일       : 2015. 12. 22.
                 * </pre>
                 *
                 * @param data
                 * @param option
                 * @returns {String}
                 */
                
                , optionStr : function (data, option) {
                    
                    var str = '';
                  
                    option = this.getOption(option);
                   
                    $.each(data.list, function (i, row) {
                        str += '<option value="' + row[option.column.index] + '">';
                        str += row[option.column.name];
                        str += '</option>';
                        
                    });
                    
                    return str;
                }
                /**
                 * <pre>
                 * 1. MethodName : common.createNextSelectOption.selected
                 * 2. ClassName  : common.select.js
                 * 3. Comment    : 사용자가 선택한 옵션을 선택한다.
                 * 4. 작성자       : DEV_JANGSIN
                 * 5. 작성일       : 2015. 12. 22.
                 * </pre>
                 *
                 * @param $el
                 * @param i
                 */
                , selected : function ($el, i) {
                    
                    var value = $el.data('selected_value');
                    
                    if (value !== '' && value !== undefined) {
                        
                        var target = this.option.targets[i + 1];
                        
                        $el.children('option[value="' + value + '"]').prop('selected', true);
                        
                        if (target !== undefined) {

                            this.ajaxOptionList($(target), value, 'init');
                            
                        }
                    }
                }
            }
        }
    });
    
})(jQuery);