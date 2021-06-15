<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<title>쑈윈도 | 이벤트 | 럭키드로우</title>

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

            <div class="event_luckkey_draw_box bg_use" style="background-image:url(${cdnDomain}${imgList.get(0).FILE_NM});">
                <ul>
                	<c:forEach var="prdInfo" items="${prdList}" varStatus="status">
	                    <li>
	                    <form>
	                    	<input type="hidden" name="EVT_MST_IDX" value="${info.EVT_MST_IDX}">
	                    	<input type="hidden" name="EVT_MST_TYPE" value="${info.EVT_MST_TYPE}">
	                    	<input type="hidden" name="EVT_PRD_IDX" value="${prdInfo.EVT_PRD_IDX}">
	                        <div class="thum_area">
	                            <img src="${cdnDomain}${prdInfo.FILE_NM}" alt="이미지">
	                        </div>
	                        <p>${prdInfo.EVT_PRD_ALT_TEXT}</p>
	                        <div class="entry_area"><strong>${prdInfo.EVT_PRD_ETR_CNT}</strong><span>명 응모</span></div>
	                        <div class="btn_area">
	                            <button type="button" class="btn_large ok event_apply">응모하기</button>
	                        </div>
	                     </form>
	                    </li>
                	</c:forEach>
                </ul>
            </div>
            <div class="caution_img_area">
                <img src="/nas/cdn/PW/images/@temp/img_cause.png" alt="">
            </div>
            <div class="btn_wrap event">
                <button type="button" class="btn_large">목록</button>
                <button type="button" class="btn_large ok">이벤트 참여현황 바로가기</button>
            </div>
            <!-- ****************************************************************************

            E : 콘텐츠 끝

            ***************************************************************************** -->
        </div>
    </div>
    <!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script>
$(document).ready(function(){
	
	$('.event_apply').on('click', function(){
		
		var $frm = $(this).closest('form');
		
		if(GetIsLogin() == false) {
			alert('로그인하셔야 합니다.');
		} else {
			$frm.attr({"action":"<c:out value="${serverDomain}" />/pc/event/eventLuckyDraw.do", "target":"_self", "method":"post"}).submit();
		}
		
	});

	
});
</script>

	



