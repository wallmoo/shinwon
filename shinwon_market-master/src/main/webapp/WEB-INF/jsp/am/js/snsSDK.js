	/**
	 * VER.2017-02-20
	 * snsSDK.js를 호출한 jsp내에 있는 hidden field에 API KEY(client id)를 세팅 후 추출하여 사용하는 방식
	 * 키 추출에 사용하는 form 명은 [snsInitForm] 으로 공통 지정
	 */
    var $snsInitForm = $("#snsInitForm"); 
    
    var siteDomain = $snsInitForm.find("input[name=FRONT_DOMAIN]").val();
    var httpDomain = "http://pc.marketplanta.epasscni.com:8080";
    
    var url = $snsInitForm.find("input[name=url]").val();
    var locationProtocol = $snsInitForm.find("input[name=locationProtocol]").val();
    
    // 네이버의 경우 callback을 따로 처리
    var naverCallbackUrl = siteDomain+"/pc/manager/naverCallbackUrl.do?locationProtocol="+locationProtocol+"&url="+url+"&";
    var snsCallbackUrl = siteDomain+"/pc/manager/snsLoginCallback.do?snsType=";
    
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
            xfbml      : false,               // parse social plugins on this page                         > 소셜 플러그인이 있으면 처리
            version    : 'v2.8'              // use version 2.8                                           > 버전 2.8 사용
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
    
    function loginFacebook() {
        FB.getLoginStatus(function(response){
            FBstatusChangeCallback(response);
       });
    } 
       
    // 페이스북 로그인 인증 응답
    function FBstatusChangeCallback(response){
        if(response.status === 'connected') {
        	LoginAPI();
        } else {
            FB.login(function(response) {
            	LoginAPI();
            });
        }  
    }
    
    // 로그인이 성공한 다음에는 간단한 그래프API를 호출
    // 이 호출은 statusChangeCallback에서 LoginAPI() 호출.
    function LoginAPI() { 
        FB.login(function(response)
	    {
        	FB.api('/me', {fields: 'email, id, name'}, function(response)
		    {
		        if(typeof response.id != "undefined")
		        {
		        	snsRstObj.sns = "facebook";   
		        	snsRstObj.name = response.name;   
		        	snsRstObj.id = response.id;
		        	snsRstObj.email = response.email;
		        	console.log(response);
		        	fnSnsLogin(snsRstObj); 
		        }
		    });
	    },
	    {
	        scope : "public_profile,email",
	        return_scopes : true
	    });
    }
    
    
    /***************
     * NAVER 
     ***************/
    // API init
    var naver_id_login = new naver_id_login(naverAppId, naverCallbackUrl);  //key, redirect_url
    var state = naver_id_login.getUniqState();              // xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx 형태, 상태 코드 생성
    naver_id_login.setButton("green", 3, 48);               // 네이버 아이디로 로그인 버튼 설정
    naver_id_login.setDomain(httpDomain);      				// 상태 토큰 비교를 위한 domain 설정
    naver_id_login.setState(state);                         // 고유 세션을 나타내는 값, CSRF를 방지하기 위해 사용하는 client side의 인증 값
    naver_id_login.setPopup();                              // Popup형태의 인증 진행	// 주석 시 현재창 이동 인증진행
    naver_id_login.getNaverIdLoginLink(naverAppId);			// 로그인 URL 생성

    // 로그인팝업 호출
    function loginNaver ()
    {
    	window.open(naver_id_login.getNaverIdLoginLink(naverAppId), "naverLogin", "width=500, height=450, scrollbars=no, toolbar=no, menubar=no, resizable=no");
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
		    	// 로그인 성공시, API를 호출
		        Kakao.API.request({
		            url: '/v2/user/me',
					success: function(res) {    
						snsRstObj.sns = "kakaotalk";   
						snsRstObj.id = res.id;  
				    	// 로그인 성공시, API를 호출
				        Kakao.API.request({
						    url: '/v1/api/talk/profile',  // 프로필 요청 url
							success: function(res) {  
								snsRstObj.name = res.nickName;    
							}
					    });    
			            fnSnsLogin(snsRstObj);  // 해당 함수 콜하면서 객체로 리턴
					},
					// 개인이 카카오톡 계정이 연동이 안되어 있을 시 Error
					fail: function(error) {
						// alert(JSON.stringify(error)); -> given account is not connected to any talk user
						alert("카카오톡 프로필 관리에서 계정 연동을 해주세요."); 
					}
			    });  
	        },
	        // 로그인이 실패할 경우 에러를 받을 콜백 함수
	        fail: function(err) {
	            alert(JSON.stringify(err));
	            alert("카카오 로그인에 실패하셨습니다. 다시 한번 로그인해주세요.");
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
