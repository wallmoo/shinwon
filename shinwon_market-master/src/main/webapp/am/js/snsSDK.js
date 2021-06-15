	/**
	 * VER.2017-02-20
	 * snsSDK.js를 호출한 jsp내에 있는 hidden field에 API KEY(client id)를 세팅 후 추출하여 사용하는 방식
	 * 키 추출에 사용하는 form 명은 [snsInitForm] 으로 공통 지정
	 */
    var $snsInitForm = $("#snsInitForm");
    
    var siteDomain = $snsInitForm.find("input[name=FRONT_DOMAIN]").val();
    var httpDomain = siteDomain;
    
    var url = $snsInitForm.find("input[name=url]").val();
    var locationProtocol = $snsInitForm.find("input[name=locationProtocol]").val();
    
    // 네이버의 경우 callback을 따로 처리
    var naverCallbackUrl = httpDomain+"/pc/manager/naverCallbackUrl.do?locationProtocol="+locationProtocol;
    if(url){
    	naverCallbackUrl = naverCallbackUrl+"&url="+url+"&";
    }
    var snsCallbackUrl = httpDomain+"/pc/manager/snsLoginCallback.do?snsType=";
    
    var naverAppId = $snsInitForm.find("input[name=SNS_NAVER_API_KEY]").val();
    var kakaoApiKey = $snsInitForm.find("input[name=SNS_KAKAO_API_KEY]").val();
    var fbookApiKey = $snsInitForm.find("input[name=SNS_FACEBOOK_API_KEY]").val();
    
    // SNS로그인 후 정보를 리턴받을 공통 객체 // KAKAO, FACEBOOK 에서만 사용
    var snsRstObj = new Object();
    

    /***************
     * FACEBOOK
     ***************/
    // FACEBOOK SDK Init
    window.fbAsyncInit = function() {
    	FB.init({
            appId      : fbookApiKey,        // '{앱 ID}',
            cookie     : true,               // enable cookies to allow the server to access, the session > 쿠키가 세션을 참조할 수 있도록 허용
            xfbml      : true,               // parse social plugins on this page                         > 소셜 플러그인이 있으면 처리
            version    : 'v6.0'              // use version 2.8                                           > 버전 2.8 사용
        });
    };
  
    // FACEBOOK SDK LOAD 
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/ko_KR/all.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
    
    
    // 로그인
    function loginFacebook() {
    	FB.getLoginStatus(function(response) {
        	if(response.status === 'connected') {
        		getUserInfoGraphAPI();
            } else {
        		// facebook 로그인이 아닐 경우 로그인
                FB.login(function(response) {
                	getUserInfoGraphAPI();
        	    },{
        	        scope : "public_profile,email",
        	        return_scopes : true
        	    });
            }
       });
    } 
    
    // 로그인 성공 시 그래프API 호출
    function getUserInfoGraphAPI(response) {
	  	FB.api('/me', {fields: 'email, id, name'}, function(response)
	    {
	        if(typeof response.id != "undefined")
	        {
	        	snsRstObj.sns = "facebook";
	        	snsRstObj.name = response.name;
	        	snsRstObj.id = response.id;
	        	snsRstObj.email = response.email;
	        	fnSnsLogin(snsRstObj);
	        }
	    });
    }
    
    
    /***************
     * NAVER 
     ***************/
    // API init    
    var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: naverAppId,
			callbackUrl: naverCallbackUrl,
			isPopup: true, /* 팝업을 통한 연동처리 여부 */
			callbackHandle: true
		}
	);
    
    // 로그인팝업 호출
    function loginNaver ()
    {
    	window.open(naverLogin.generateAuthorizeUrl(), "_blank", "width=500, height=450, scrollbars=no, toolbar=no, menubar=no, resizable=no");
    }
    
    
    /***************
     * KAKAOTALK
     ***************/
    // 사용할 앱의 javascript Key 설정
	Kakao.init(kakaoApiKey);
	    
	// 커스텀 로그인 버튼을 이용한 카카오 로그인
	function loginKakao()
	{
		// 로그인창 호출 
	    Kakao.Auth.login({
	    	// 로그인이 성공할 경우 사용자 토큰을 받을 콜백 함수
		    success: function(authObj) {
		    	Kakao.Auth.getStatusInfo(function(res){
		    		if(!res.user.kakao_account.email){
						Kakao.API.request({
				            url: '/v1/user/unlink',
				            success: function(res) {
				                alert('이메일을 필수로 동의해주시기 바랍니다.');
				            },
				            fail: function(error) {
				                console.log('다시 시도해 주시기 바랍니다');
				            }
				        });
						return;
					}
		    		else{
		    			snsRstObj.sns = "kakaotalk";
						snsRstObj.id = res.user.id;
						snsRstObj.email = res.user.kakao_account.email
						snsRstObj.name = res.user.kakao_account.profile.nickname;
		    		}
		            fnSnsLogin(snsRstObj);  // 해당 함수 콜하면서 객체로 리턴
		    	});
	        },
	        // 로그인이 실패할 경우 에러를 받을 콜백 함수
	        fail: function(err) {
//	            alert(JSON.stringify(err));
	            alert("카카오 로그인에 실패하였습니다. 다시 한번 로그인해주세요.");
	        }
	    });
    };
    
    // SNS 로그인 호출
    snsLogin = function (type)
    {
    	if (type == "NAVER")
    	{
    		loginNaver();
		}
    	else if (type == "KAKAO")
    	{
    		loginKakao();
		}
    	else if (type == "FACEBOOK")
    	{
    		loginFacebook();
		}
    }
