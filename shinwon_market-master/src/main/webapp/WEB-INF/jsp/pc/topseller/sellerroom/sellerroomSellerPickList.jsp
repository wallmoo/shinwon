<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<!-- Content -->
    <div id="container">
        <div id="content" class="content">

			<%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

		   	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
         		<div class="topseller_wrap clearboth">
        	</c:if>
        	
        	
			<%@ include file="/WEB-INF/jsp/pc/topseller/include/sellerroomTabMenu.jsp"%>

        	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
         		<div class="topseller_right">
        	</c:if>
            
            <div class="seller_pick_swiper_wp">
                <div class="swiper-container seller_pick_swiper">
                    <div class="swiper-wrapper">
                    	<c:forEach var="infoRow" items="${sellerpickBanner }" varStatus="status">
                    		<c:if test="${status.index lt 3}">
                    		
		                        <div class="swiper-slide">
		                            <div class="seller_img">
		                                <img src="${cdnDomain }${infoRow.FILE_NM }" alt="${infoRow.CMN_FLE_ALT_TXT }">
		                                <p class="subject">${infoRow.BNR_MST_TITLE }</p>
		                            </div>
		                            <div class="seller_area">
		                                <div class="seller_info_wrap clearboth">
		                                    <div class="seller_info_thum">
		                                        <img src="${cdnDomain }${infoRow.PROFILE_IMG }" alt="${infoRow.CMN_FLE_ALT_TXT }">
		                                    </div>
		                                    <span class="seller_name">${infoRow.BND_MST_SEL_NM }</span>
		                                </div>
		                                <span class="txt">${infoRow.BNR_MST_TITLE }</span>
		                                <div class="tag_area clearboth">
		                                    ${infoRow.BNR_MST_DESC }
		                                </div>
		                                <div class="btn_area clearboth">
		                                    <div class="btn_like_sellerhome_area clearboth">
		                                        <button type="button" class="btn-like ${infoRow.LIKE_CLS }" 
		                                        onclick="javascript:likeBtnEvent($(this), '${infoRow.VDR_MST_IDX }', 'TYPE_TOP_SELLER')"
		                                        title="좋아요"><span>${infoRow.LIKE_COUNTS }</span></button>
		                                        <a href="javascript:goPage();">셀러홈으로 이동하기</a>
		                                    </div>
		                                    <button type="button" class="btn_social_sharing">공유하기</button>
		                                </div>
		                            </div>
		                        </div>
                    		
                    		</c:if>
                    	</c:forEach>
                    </div>
                    <!-- Add Arrows -->
                    <a href="#n" class="swiper-button-next"></a>
                    <a href="#n" class="swiper-button-prev"></a>
                </div>
                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>
            </div>
            <!-- //Swiper -->
            <div class="grid_wrap w4">
                <div class="grid">
                    <div class="grid_sizer"></div>
                    
                	<c:forEach var="infoRow" items="${sellerpickList }" varStatus="status">
                   		
                   		
		                   <div class="grid_item">
		                        <a href="javascript:goDetail('${infoRow.CNT_MST_IDX }');">
		                            <div class="thum_img">
		                                <img src="${cdnDomain }${infoRow.FILE_NM }" alt="${infoRow.CMN_FLE_ALT_TXT }">
		                            </div>
		                            <div class="seller_info_wrap clearboth">
		                                <div class="seller_info_thum">
		                                    <img src="${cdnDomain }${infoRow.PROFILE_IMG }" alt="${infoRow.CMN_FLE_ALT_TXT }">
		                                </div>
		                                <span class="seller_name">${infoRow.BND_MST_SEL_NM }</span>
		                            </div>
		                            <p class="subject">${infoRow.BNR_MST_TITLE }</p>
		                            <span class="txt">${infoRow.BNR_MST_DESC }</span>
		                            <!-- <div class="tag_area clearboth">
		                                <span>#핑크원피스</span>
		                                <span>#셔링원피스</span>
		                                <span>#러블리</span>
		                                <span>#원피스</span>
		                            </div>
		                             -->
		                        </a>
		                        <div class="btn_area clearboth">
		                            <div class="btn_like_sellerhome_area clearboth">
	                                    <button type="button" class="btn-like ${infoRow.LIKE_CLS }" 
	                                     onclick="javascript:likeBtnEvent($(this), ${infoRow.VDR_MST_IDX }, 'TYPE_TOP_SELLER')"
	                                     title="좋아요"><span>${infoRow.LIKE_COUNTS }</span></button>
		                                <a href="javascript:goPage();">셀러홈으로 이동하기</a>
		                            </div>
		                            <button type="button" class="btn_social_sharing">공유하기</button>
		                        </div>
		                    </div>
                   	
                   	</c:forEach>
                </div>
            </div>


       	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
				</div>
				<!-- //Right Wrapper -->
        	</div>
        	<!-- //All Wrapper -->
       	</c:if>
       	

        </div>
    </div>
    <!--// Content -->
<form id="pageForm" name="pageForm">
	<input type="hidden" id="CNT_MST_IDX" name="CNT_MST_IDX" value="">
	<input type="hidden" id="VDR_MST_IDX" name="VDR_MST_IDX" value="${sellerInfo.VDR_MST_IDX}">
</form>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script>
    $(function(){
        $('.grid_wrap').imagesLoaded(function() {
            $('.grid').masonry({
                itemSelector: '.grid_item',
                columnWidth: '.grid_sizer',
                percentPosition: true,
                transitionDuration: '0.3s'
            });
        });
        var swiper = new Swiper('.seller_pick_swiper', {
          slidesPerView: 'auto',
          loop: true,
          slidesPerView: 3,
          noSwiping: true,
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
          pagination: {
            el: '.swiper-pagination',
          },
        });
    });
    
	
	goPage = function(){
		var pageForm = $("#pageForm");
    	pageForm.attr({"action":"<c:out value='${serverDomain}' />/pc/topseller/sellerroom/sellerroomHome.do", "target":"_self", "method":"post"}).submit();
	}
	goDetail = function(pCntMstIdx){
		var pageForm = $("#pageForm");
		$('#CNT_MST_IDX').val(pCntMstIdx);
    	pageForm.attr({"action":"<c:out value='${serverDomain}' />/pc/topseller/sellerroom/sellerroomSellerPickView.do", "target":"_self", "method":"post"}).submit();
	}
</script>
