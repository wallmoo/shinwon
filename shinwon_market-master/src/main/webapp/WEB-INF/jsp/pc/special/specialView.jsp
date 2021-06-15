<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

<script>
        $(function(){
                var item_list_H = 0;
                $(window).on('load resize', function(){
                        item_list_H = $('.new_item_list .thum_img_wrap').hiLow('max');
                        $('.new_item_list .thum_img_wrap').css('height',item_list_H);
                        $('.store_hotdeal_visual_inner').slick('resize');
                });

                $('.btn_time_deals_close').on('click', function(){
                        if ($('.time_deals_wrap').is(':visible')) {
                                $('.time_deals_wrap').fadeOut(500);
                        }
                });
        });
</script>

<div id="container">
        <div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">스페셜</h2>
            </div>
            <!--// Title -->

            <div class="pg_sub_tit_wrap clearboth">
                <h3 class="pg_sub_tit fl"><c:out value="${info.CNT_MST_TITLE }" /></h3>
            </div>
            <div class="editor_content_wrap">
            </div>
            <div class="sub_content product special">
                <div class="goods_list_wrap">
                    <!-- .title_exp_area -->
                    <div class="title_exp_area clearboth">
                        <h3 class="fl">콜라보레이션 상품</h3>
                    </div>
                                        <!-- .new_goods_wrap -->
                        <div class="new_goods_wrap mt100">
                            <ul class="new_goods_list new_goods_list5 clearboth">
                            
                            	<c:forEach var="infoRow" items="${list }">
                               	<li>
                                    <span class="flag_video">video</span>
                                    <a href="${frontDomain }/pc/product/productView.do?PRD_MST_CD=${infoRow.PRD_MST_CD}" target="_blank">
                                        <div class="img_thum_wrap">
                                            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain}${infoRow.PRD_IMAGE});"></div>
                                            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain}${infoRow.PRD_ROLL_OVER_IMG});"></div>
                                	            
                                            <ul class="color_list">
												<c:forEach var="colorRow" items="${infoRow.CNT_PRD_COLOR }">
													<li><span style="background:${colorRow.CNT_PRD_COLOR};">${colorRow.CMN_COM_NM}</span></li>
                                    			</c:forEach>
                                            </ul>
                                        </div>
                                        <div class="sort_tag_area clearboth">
                                            <span class="sort">${infoRow.PRD_MST_BRAND_NM }</span>
                                            <span class="tag">${infoRow.TAG_MST_TITLE }</span>
                                        </div>
                                        <p class="goods_title">${infoRow.PRD_MST_NM }</p>
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">
                                            	<fmt:formatNumber value="${infoRow.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" />
                                            </span>
                                            <strong class="clearboth">
                                                <span class="goods_cost">
                                                	<fmt:formatNumber value="${infoRow.PRD_MST_DSP_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" />
                                                </span>
                                                <em class="dc_percent">
                                                	${infoRow.PRD_SALE_RATE }%
                                                	<%--<fmt:formatNumber value="${infoRow.PRD_SALE_RATE }" type="percent" groupingUsed="false" /> --%>
                                                </em>
                                            </strong>
                                        </div>
                                    </a>
	                                    <div class="btn_like_area">
	                                        <button type="button" 
	                                        	onclick="likeBtnEvent($(this), '${infoRow.CNT_PRD_MST_CD}', 'TYPE_PRODUCT')" 
	                                        class="btn-like ${infoRow.MY_LIKE eq 'Y' ? 'on' : ''}" title="좋아요"><span>${infoRow.LIKE_COUNT}</span></button>
	                                    </div>
                                </li>
                            	</c:forEach>
	                            </ul>
	                        </div>
                        <!-- // .new_goods_wrap -->
		                </div>
		            </div>
		        </div>
		    </div>
    <!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

 
 
