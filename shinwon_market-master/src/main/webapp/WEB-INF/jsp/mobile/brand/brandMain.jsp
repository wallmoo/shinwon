<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top01.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="brand_main">
                    <div class="slider_wrap brand_top">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                            	<c:if test="${not empty topBrandList }">
									<c:forEach var="topRow" items="${topBrandList}"	varStatus="status">
                                		<div class="swiper-slide">
                                    		<a href="javascript:goPage('<c:out value="${topListRow.BND_MST_IDX }" />')">
                                        		<img src="/nas/cdn/MW/images/_temp/img_brand_visual.jpg" alt="">
                                        <%-- <img src="${topRow.IMG_THUMBNAIL}" alt="${topRow.CMN_FLE_ALT_TXT }"> --%>
                                        		<p class="tit"><c:out value="${topRow.BND_MST_BRAND_NM }" /></p>
                                    		</a>
                                		</div>
                                	</c:forEach>
                                </c:if>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                    <script>
                        var swiper = new Swiper('.brand_top .swiper-container', {
                            slidesPerView : 1,
                            spaceBetween: 0,
                            initialSlide: 0,
                            roundLengths: true,
                            pagination: {
                                el: '.swiper-pagination',
                            }
                        });
                    </script>

                    <div class="tit_wp">
                        <p class="ct_tit">SHINWON’S PICK</p>
                    </div>
                    <div class="slider_wrap brand_slide">
                        <div class="swiper-container">
                            <div class="swiper-wrapper">
                            	 <c:if test="${not empty shinwonPickList }">
									<c:forEach var="pickRow" items="${shinwonPickList}"	varStatus="status">
		                                <div class="swiper-slide">
		                                    <a href="javascript:goPage('<c:out value="${pickRow.BND_MST_IDX }" />')">
		                                        <img src="/nas/cdn/MW/images/_temp/img_brand_visual1.jpg" alt="">
		                                        <%-- <img src="${pickRow.IMG_THUMBNAIL }/${pickRow.BND_MST_IDX}" alt="${pickRow.CMN_FLE_ALT_TXT }"> --%>
		                                        <div class="t_area">
		                                            <p class="tit"><c:out value="${pickRow.BND_MST_BRAND_NM }" /></p>
		                                        </div>
		                                    </a>
		                                </div>
	                                </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <script>
                        var swiper = new Swiper('.brand_slide .swiper-container', {
                            slidesPerView : 2.34,
                            spaceBetween: 6,
                            initialSlide: 0,
                            roundLengths: true
                        });
                    </script>

                    <div class="tit_wp">
                        <p class="ct_tit">BRAND LIST</p>
                    </div>
                    <div class="brand_list_wrap">
                        <div class="tit_wp">
                            <p class="ct_tit2" id="allBrandCount">총 브랜드 (0)</p>
                            <div class="board_right">
                                <button type="button" class="b_reset" onclick="btn_large gray()">초기화</button>
                                <button type="button" class="b_filter" onclick="btn_searchOpen()">필터</button>
                            </div>
                        </div>
                        <div class="brand_list">
                            <div class="brand_nav">
                                <a href="#n">ㄱ</a>
                                <a href="#n">ㄴ</a>
                                <a href="#n">ㄷ</a>
                                <a href="#n">ㄹ</a>
                                <a href="#n">ㅁ</a>
                                <a href="#n">ㅂ</a>
                                <a href="#n">ㅅ</a>
                                <a href="#n">ㅇ</a>
                                <a href="#n">ㅈ</a>
                                <a href="#n">ㅊ</a>
                                <a href="#n">ㅋ</a>
                                <a href="#n">ㅌ</a>
                                <a href="#n">ㅍ</a>
                                <a href="#n">ㅎ</a>
                            </div>
                            <div class="list_wp">
                                <p class="tit">ㄱ</p>
                                <ul>
                                    <li>가니송(99)</li>
                                    <li>가브리엘 리(99)</li>
                                    <li>겐조(99)</li>
                                    <li>게이즈(99)</li>
                                    <li>게이트(99)</li>
                                    <li>그늘(99)</li>
                                    <li>그림자(99)</li>
                                    <li>기키(99)</li>
                                    <li>긱스(101)</li>
                                    <li>깔롱(29)</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
        <form id="pageForm" name="pageForm" method="post">
			<input type="hidden" id="BND_MST_IDX" name="BND_MST_IDX" value="">
		</form>

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript">
        $(".set_tag").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true
            }
        });
        
        
        goPage = function(idx){
    		var pageForm = $("#pageForm");
    		pageForm.find("input[name='BND_MST_IDX']").val(idx);
    		pageForm.attr({"action":"/mobile/brand/brandView.do", "target":"_self", "method":"post"}).submit();
    		
    	}
    </script>