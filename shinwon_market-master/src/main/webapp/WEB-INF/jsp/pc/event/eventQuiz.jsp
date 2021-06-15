<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<title>쑈윈도 | 이벤트 | 퀴즈</title>

<!-- Content -->
    <div id="container">
        <div id="content" class="content">
            <!-- LOCATION -->
            <div class="location">
                <ol class="clearboth">
                    <li><a href="#" class="home">홈</a></li>
                    <li class="active">
                        <a href="#">1Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">1Depth Menu 01</a></li>
                            <li><a href="#">1Depth Menu 02</a></li>
                            <li><a href="#">1Depth Menu 03</a></li>
                            <li><a href="#">1Depth Menu 04</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">2Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">2Depth Menu 01</a></li>
                            <li><a href="#">2Depth Menu 02</a></li>
                            <li><a href="#">2Depth Menu 03</a></li>
                            <li><a href="#">2Depth Menu 04</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">3Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">3Depth Menu 01</a></li>
                            <li><a href="#">3Depth Menu 02</a></li>
                            <li><a href="#">3Depth Menu 03</a></li>
                            <li><a href="#">3Depth Menu 04</a></li>
                        </ul>
                    </li>
                </ol>
            </div>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">이벤트</h2>
            </div>
            <div class="pg_sub_tit_wrap clearboth">
                <h3 class="pg_sub_tit fl">${info.EVT_MST_TITLE}</h3>
            </div>
            <!-- .event_random_cou -->
            <div class="event_chosung">
                <div class="event_chosung_img">
                    <img src="${cdnDomain}${imgList.get(0).FILE_NM}" alt="${imgList.get(0).CMN_FLE_ALT_TXT}">
                </div>
                <div class="qiuz_txt">
                    <p class="ac">${info.EVT_MST_QST}</p>
                </div>
                <div class="qiuz_form">
                    <input type="text" name="" id="">
                    <span>${info.EVT_MST_FTR}</span>
                </div>
                <div class="btn_wrap mt100">
                    <button id="quiz_submit" type="button" class="btn_large ok">정답 확인</button>
                </div>
            </div>
            <!-- // .event_random_cou -->
            <div class="caution_img_area">
                <img src="/nas/cdn/PW/images/@temp/img_cause_2.png" alt="">
            </div>
            <div class="btn_wrap event">
                <button type="button" class="btn_large">목록</button>
            </div>
            <!-- ****************************************************************************

            E : 콘텐츠 끝

            ***************************************************************************** -->
            
            <div id="layer_bg" class="dim not"></div>
            <div id="layer_benefit" class="layer type02 is_btn">
                <div class="layer_header">
                    <h2>당첨확인</h2>
                </div>
                <div class="layer_content">
                    <div class="prize_bx">
                        <p class="tit">축하드립니다!</p>
                        <p class="prize">쿠폰 당첨!!</p>
                        <div class="coupon">
                            <p class="c_tit">VIKI</p>
                            <p class="c_txt"> 24% 할인</p>
                        </div>
                    </div>
                </div>
                <div class="layer_footer">
                    <div class="btn_wrap">
                        <button id="coupon_confirm" type="button" class="btn_large purple">확인</button>
                    </div>
                </div>
                <a href="#none" class="btn_layer_close">레이어 닫기</a>
            </div>
            
        </div>
    </div>
    <!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script>
$(document).ready(function(){

	var funcCouponPopup = function(pIsShow){
		if(pIsShow) {
			$('#layer_bg').show();
			$('#layer_benefit').show();
		} else {
			$('#layer_bg').hide();
			$('#layer_benefit').hide();
		}
	}
	$('#quiz_submit').on('click', function(){
		funcCouponPopup(true);
	});
	$('#coupon_confirm').on('click', function(){
		funcCouponPopup(false);
	})
});
	
</script>