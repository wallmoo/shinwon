/**
 * @constructor
 * @description NAVER Login authorize API
 * @author nid.nullism@navercorp.com
 * @version 0.0.2
 * @date 15. 06. 25
 * @copyright 2015 Licensed under the MIT license.
 */
 
/**
 공통 영역
 */
//버튼 종류에 대한 정의
BUTTON_TYPE = 1;
BANNER_SMALL_TYPE = 2;
BANNER_BIG_TYPE = 3;
//버튼 색깔에 대한 정의
BUTTON_COLOR_WHITE = "white";
BUTTON_COLOR_GREEN = "green";

var naver_id_login = function (client_id,redirect_uri)
{
    this.button_color = BUTTON_COLOR_GREEN;
    this.button_type = BUTTON_TYPE;
    this.button_height = 40;
    this.nil_domain = ""; 
    /*  '네이버 아이디로 로그인' 인증 요청문 생성 - 인증 요청문 명세: 요청url : https://nid.naver.com/oauth2.0/authorize, 요청 파라미터(Request Parameters) */
    this.authorize_url="https://nid.naver.com/oauth2.0/authorize";  // Authorization : 인증 토큰(Access Token)을 전달하는 헤더, 헤더값에는 인증토큰을 포함
    this.response_type="token";                                     // 인증과정에 대한 구분값. 어떠한 형태의 결과 값을 받을지를 명시, "code"고정
    this.state = "";                                                // CSRF를 방지하기 위해 사용하는 client side의 인증 값
    this.scope="";                                                  // 접근허용 범위, 현재는 DB에 미리 설정된 값으로만 동작 (생략 가능)
    this.client_id = client_id;                                     // Client 등록 시 발급 받은 client id 값
    this.redirect_uri = redirect_uri;                               // Client 등록 시 설정한 uri값으로 고정
    /* **************************************************************************************************************************************************** */
    this.cookie_name="nil_state";
    this.popup = false;
    this.oauthParams = {};
    this.profileParams = {};
    this.is_callback = false;
    this.callback_status="";
    this.callback_message="";

/**
 * 로그인창 팝업 설정
 * @ignore
 * @return void
 * @private
 */
    this.setPopup = function() {
        this.popup = true;
    }     
/**
 * 서비스 도메인 설정
 * @ignore
 * @return void
 * @private
 */
    this.setState = function(state_value) {
        this.state = ((typeof(state_value)!='undefined') && (state_value != "") ) ? state_value : "";
    }
/**
 * 서비스 도메인 설정
 * @ignore
 * @return void
 * @private
 */
    this.setDomain = function(domain_value) {  // http://local.etland.co.kr
        this.nil_domain = ((typeof(domain_value)!='undefined') && (domain_value != "") ) ? domain_value : "";
    }
/**
 * 네이버 아이디로 로그인 버튼 디자인 선택
 * @ignore
 * @return void
 * @private
 */
    this.setButton = function(button_color,button_type,button_height) {
        this.button_color = ((typeof(button_color)!='undefined') && (button_color != "") ) ? button_color : BUTTON_COLOR_GREEN;
        this.button_type = ((typeof(button_type)!='undefined') && (button_type != "") ) ? button_type : BUTTON_TYPE;
        this.button_height = ((typeof(button_height)!='undefined') && (button_height != "") ) ? button_height : 40;
    }
/**
 * oauth 2.0 spec 의 state 값 자동 생성
 * @ignore
 * @returns {*}
 * @private
 */
    this.getUniqState = function(){
        var stat_str = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) { var r = Math.random()*16|0, v = c === 'x' ? r : (r&0x3|0x8); return v.toString(16); });
        return stat_str;
    };
/**
 * local Storage에 해당 name 을 key로 가지는 value 값을 안전하게 받아온다.
 * @ignore
 * @param {string} local Storage 에 저장된 키값
 * @private
 */
    this.getLocalStorageItemSafely = function () {
        try {
            var item = localStorage.getItem(this.cookie_name);
            if (item == null || item.length == 0) {
                return item;
            }
            return item.replace(/&/g, '&amp;')
                .replace(/"/g, '&quot;')
                .replace(/'/g, '&#x27;')
                .replace(/</g, '&lt;')
                .replace(/>/g, '&gt;');
        }   catch (e)
        {
            return null;
        }
    }

/**
 * local Storage 혹은 cookie storage 에 원하는 key value 쌍을 저장 한다.
 * @ignore
 * @param {string} local Storage 혹은 cookie storage 에 저장할 value 값
 * @returns {*}
 * @private
 */
    // localStorage, Cookie 설정
    this.setStateStore = function ()
    {
    	// alert("--> [Storage] nil_domain: " + this.nil_domain);
        try {
            if (this.nil_domain!="")
            {
            	// alert("--> [Storage] cookie_name: " + this.cookie_name);
                document.cookie = this.cookie_name+"=; path=/; domain="+this.nil_domain+"; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
            }
            else
            {
                document.cookie = this.cookie_name+"=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
            }
            
            // localStorage 설정
            // alert("--> [Storage] this.state: " + this.state);
            localStorage.setItem('nil_state', this.state);
            
            if (this.nil_domain!="")
            {
                var today = new Date();
                var expire = new Date(today.getTime() + 60 * 5 * 1000); //5분간 유효
                var curCookie = this.cookie_name+"=" + escape(this.state) + "; expires="
                    + expire.toGMTString() + "; domain=" + this.nil_domain+ ";path=/;";
                document.cookie = curCookie;    
            }
        }catch (e)
        {
            var today = new Date();
            var expire = new Date(today.getTime() + 60 * 5 * 1000); //5분간 유효
            var curCookie = this.cookie_name+"=" + escape(this.state) + "; expires="
                + expire.toGMTString() + ";path=/;";
            document.cookie = curCookie;    
        }
    }

/**
 * 네이버 아이디로 로그인때 사용할 링크의 주소를 생성한다.
 * @ignore
 * @private
 */
    this.getNaverIdLoginLink = function (client_id)
    {
        if (!this.is_callback)  // true
        { 
        	// alert("--> [call_url] !this.is_callback: " + !this.is_callback);
            this.setStateStore();  // localStorage, Cookie 설정
        }
        else
        {
            this.state = this.oauthParams.state;
        }
        if ( ( this.client_id == undefined ) || ( this.client_id == "등록한 ClientID 값" ) || ( this.client_id.length < 5 ) )
        {
            alert("등록한 ClientID 값을 입력해 주세요.");
            return false;
        }
        if ( ( this.redirect_uri == undefined ) || ( this.redirect_uri == "등록한 Callback URL 값" ) || ( this.redirect_uri.length < 5 ) )
        {
            alert("등록한 Callback URL 값을 입력해 주세요.");
            return false;
        }
        
        // this.authorize_url : https://nid.naver.com/oauth2.0/authorize
        // Access Token 요청 과정은 모두 서버간 https 통신으로 이루어지며 완성된 요청문은 다음과 같은 URL의 형태
        call_url = this.authorize_url+"?response_type="+this.response_type+"&client_id="+this.client_id+"&redirect_uri="+encodeURIComponent(this.redirect_uri)+"&state="+encodeURIComponent(this.state);
        
        if (this.scope!="")
        {
            call_url = call_url + "&scope="+encodeURIComponent(this.scope);
        }
        return call_url;
    }

/**
 * 네이버 아이디로 로그인때 사용할 이미지 및 링크를 생성한다.
 * @ignore
 * @param {int} 이미지의 높이 값 (px 단위)
 * @private
 */
    this.init_naver_id_login = function ()
    {
        var naver_id_login = document.getElementById('naver_id_login');
        if (naver_id_login==undefined)
        {
            //alert("id 가 naver_id_login 인 div tag 가 존재해야 합니다.");
            return false;
        }     
        if (this.button_color=="green")
        {
            color="g";
        }
        else
        {
            color="w";
        }  
        naver_id_login.innerHTML="";
        naver_id_login_contents="";
        naver_id_login_url = this.getNaverIdLoginLink();  // 네이버 아이디로 로그인때 사용할 링크의 주소를 생성
        
        // Access Token 요청 과정은 모두 서버간 https 통신으로 이루어지며 완성된 요청문은 다음과 같은 URL의 형태
        // this.authorize_url+"?response_type="+this.response_type+"&client_id="+this.client_id+"&redirect_uri="+encodeURIComponent(this.redirect_uri)+"&state="+encodeURIComponent(this.state);
        // alert("--> [naver_id] naver_id_login_url: " + naver_id_login_url);
        
        if (this.state==undefined || this.state=="")
        { 
            this.state = this.getUniqState();  
        }
        naver_id_popup_option = "";
        if (this.popup)
        { 
            naver_id_popup_option = " onClick=\"window.open(this.href, 'naverloginpop', 'titlebar=1, resizable=1, scrollbars=yes, width=600, height=550'); return false\" ";
        }
        if (this.button_type == BUTTON_TYPE)
        {
            naver_id_login_contents="<a href='"+naver_id_login_url+"' "+naver_id_popup_option+" id='naver_id_login_anchor'><img src='http://static.nid.naver.com/oauth/button_"+color+".PNG' border='0' title='네이버 아이디로 로그인' width='"+this.button_height+"' height='"+this.button_height+"'></a> ";
        }
        else if (this.button_type == BANNER_SMALL_TYPE)
        {
            naver_id_login_contents="<a href='"+naver_id_login_url+"' "+naver_id_popup_option+" id='naver_id_login_anchor'><img src='http://static.nid.naver.com/oauth/small_"+color+"_in.PNG' border='0' title='네이버 아이디로 로그인' width='"+(this.button_height*656/250)+"px' height='"+this.button_height+"'></a> ";
        }
        else 
        {
            naver_id_login_contents="<a href='"+naver_id_login_url+"' "+naver_id_popup_option+" id='naver_id_login_anchor'><img src='http://static.nid.naver.com/oauth/big_"+color+".PNG' border='0' title='네이버 아이디로 로그인' width='"+(this.button_height*185/40)+"px' height='"+this.button_height+"px'></a> ";
        }
        
        // 화면에 노출
        naver_id_login.innerHTML = naver_id_login_contents;
        // alert("--> [naver_id] this.is_callback: " + this.is_callback);
        if (this.is_callback)
        {
            this.init_naver_id_login_callback();
        }
    }

/**
 * 사용자가 셋팅한 state 값의 일치 여부를 확인
 * @ignore
 * @param {string} oauth callback url 로 전달된 state 값
 * @returns {boolean} 일치 여부 true/false
 * @private
 */
    this.checkStateStore = function (receive_state)
    {
        //사용자가 setting 한 값이 있으면 우선권을 가진다.
        if (this.state!=undefined || this.state=="")
        {
            state = this.getLocalStorageItemSafely();
        }
        else
        {
            state = this.state;
        }
        if (state != null && state.length > 10 )
        {
            if (state==receive_state)
            {
                try {
                    localStorage.removeItem(this.cookie_name)
                }catch (e) {}
                return true;
            }
            else
            {
                try {
                    localStorage.removeItem(this.cookie_name)
                }catch (e) {}
                return false;
            }
        }
        else //check cookie
        {
        //사용자가 setting 한 값이 있으면 우선권을 가진다.
            if (this.state!=undefined || this.state=="")
            {
                state = this.getCookie();
            }
            else
            {
                state = this.state;
            }
            if (state != null && state.length > 10 )
            {
                if (state==receive_state)
                {
                    if (this.nil_domain!="") {
                        document.cookie = this.cookie_name+"=; path=/; domain="+this.nil_domain+"; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
                    } else {
                        document.cookie = this.cookie_name+"=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
                    }
                    
                    return true;
                }   
                else
                {
                    if (this.nil_domain!="") {
                        document.cookie = this.cookie_name+"=; path=/; domain="+this.nil_domain+"; expires=Thu, 01 Jan 1970 00:00:00 UTC;";
                    } else {
                        document.cookie = this.cookie_name+"=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC";
                    }
                    return false;
                }
            }
            return false;
        }
    }

/**
 * cookie Storage에 nil_state 을 key로 가지는 value 값을 받아온다.
 * @ignore
 * @return {string} cookie Storage 에 저장된 value 값
 * @private
 */
    this.getCookie = function () {
        var b = "nil_state=";
        var c = b.length;
        var d = document.cookie.length; 
        var e = 0;
        while (e < d) {
            var f = e + c;
            if (document.cookie.substring(e, f) == b) {
                var g = document.cookie.indexOf(";", f);
                if (g == -1) g = document.cookie.length;
                return unescape(document.cookie.substring(f, g))
            }
            e = document.cookie.indexOf(" ", e) + 1;
            if (e == 0) break
        }
        return null
    }
/**
 * callback 호출 주소를 parsing 해서 결과를 array 로 저장한다.
 * @ignore
 * @return {string} parameter 가 저장된 array
 * @private
 */
    this.parseCallBack = function (){
        var params = {};  
        var queryString = (document.location+"").substring(1);
        var regex = /([^#?&=]+)=([^&]*)/g;  
        var match;  
        
        // RegExp.exec() 매칭된 값을 Array로 리턴
        while ((match = regex.exec(queryString)) !== null) {
        	/*
        	 * 발급 받은 Access Token은 앞으로 사용자의 인증을 대신할 것이고, 
        	 * Open API를 사용하기 위한 인증 값으로 사용됩니다. OAuth Access Token은 영구적으로 존재하는 값은 아닙니다. 
        	 * Token을 발급받을 때 같이 전달받는 정보 중 하나인 “expires_in” 값으로 해당 Token의 유효시간을 확인가능합니다. 
        	 * 유효시간이 지나버린 Token은 더이상 인증 용도로 사용할 수는 없으며 
        	 * Token을 새로 발급을 받거나 Refresh Token을 이용하여 Token을 갱신받는 과정을 별도도 거쳐야 합니다.
        	 */         	
        	
            // alert("--> match: " + match);                            // ex)
            // alert("--> match[1]: " + decodeURIComponent(match[1]));  // Key   : access_token  
            // alert("--> match[2]: " + decodeURIComponent(match[2]));  // value : AAAANui ~ VYDpcNKY6s=
            params[decodeURIComponent(match[1])] = decodeURIComponent(match[2]);
        }
         
        this.oauthParams = params;
    }

    // 1. callback인지 아닌지 확인
    this.parseCallBack_check = function (){
    	// oauth 생성
        this.parseCallBack();        
        
        if (this.oauthParams.access_token!=undefined)  
        {
            this.is_callback = true;
        }
        else
        {
            this.is_callback = false;
        }
    }
/**
 * callback 페이지에서 호출 되면 oauthParams 에 결과를 저장하고 종료한다.
 * @ignore
 * @return void
 * @private
 */
    this.init_naver_id_login_callback = function (){
        this.parseCallBack_check();    
        if (this.is_callback)
        {  
            if (this.oauthParams.error==undefined)
            {
                if (this.oauthParams.access_token!=undefined)
                {
                    if (this.checkStateStore(this.oauthParams.state))
                    {
                        this.callback_status = "success";
                        this.callback_message = "state check success";
                    }
                    else
                    {
                        /*
                         * state 가 맞지 않음 cookie 사용이 차단 된 경우 
                         * 사용자가 명시적으로 state 값을 사용한 경우
                        */
                        if (this.state == this.oauthParams.state)
                        {
                            this.callback_status = "success";
                            this.callback_message = "state check success";
                        }
                        else
                        {
                            /*
                             * state 가 맞지 않음 localstorage 및 cookie 사용이 불가능한 경우엔 nil_login.setState(....); 로 지정 해야 함.
                            */
                            alert("state 값이 맞지 않습니다.");
                            this.callback_status = "warning";
                            this.callback_message = "state miss match";
                        }
                    }
                }
            }
            else
            {
                /* 정상적인 접근이 아닌 경우 */
                this.callback_status = "fail";
                this.callback_message = "invalid access";
            }
        }
    }
    //우선 callback 인지 확인
    this.parseCallBack_check();

    this.get_naver_userprofile = function(callback_func1) {
    	
    	/*
    	 * 요청을 진행하게 되면 로그인 여부에 따라 비로그인 시에는 “네이버 로그인” 화면으로 전환이 되고 
    	 * 로그인 시에는 “OAuth인증 동의” 화면으로 전환이 됩니다. 사용자의 인증 및 인증 동의 과정이 완료되면 redirect uri로 페이지가 redirect됩니다.
    	 */
    	console.log(this.oauthParams.access_token);
        $.ajax({
        url: "https://openapi.naver.com/v1/nid/getUserProfile.json?response_type=json",
        type: "GET",
        data: {"access_token":this.oauthParams.access_token},
        dataType: "jsonp",
        jsonp: "oauth_callback",
        success: function (result) {
            //inner_profileParams.age           = result.response.age;
            //inner_profileParams.birthday      = result.response.birthday;
            inner_profileParams.email         = result.response.email;  
            //inner_profileParams.enc_id        = result.response.enc_id;
            //inner_profileParams.gender        = result.response.gender;
            inner_profileParams.id            = result.response.id;
            //inner_profileParams.nickname      = result.response.nickname;
            inner_profileParams.name          = result.response.name;
            //inner_profileParams.profile_image = result.response.profile_image;
            eval(callback_func1);
        },
        error: function (xhr, ajaxOptions, thrownError) {
            //에러 처리는 적절히
            alert(xhr.status);
            alert(thrownError);    
        }
        });
    }
/*
 * 아래 값을 name 으로 사용할 수 있음.
 * age
 * birthday
 * email
 * enc_id
 * gender
 * id
 * nickname
 * profile_image  
 * */
    this.getProfileData = function (name) {
        return inner_profileParams[name];
    }
    this.getOauthMessage = function ()
    {
        return this.callback_message;
    }
    this.getOauthStatus = function ()
    {
        return this.callback_status;
    }
    this.getAccessToken = function ()
    {
        return this.oauthParams.access_token;
    }
}
var inner_profileParams = {};




