<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<div id="container">
        <div id="content" class="content">
        
        	<%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">기획전</h2>
            </div>
            <div class="pg_sub_tit_wrap clearboth">
                <h3 class="pg_sub_tit fl">${planInfo.PLN_MST_TITLE}</h3>
                <a type="button" class="btn-like ${planInfo.LIKE_CLS} fr" title="좋아요" onclick="likeBtnEvent($(this), '{planInfo.PLN_MST_IDX}', 'TYPE_PLAN')"><span>${planInfo.LIKE_COUNTS}</span></a>
            </div>
            
            <div class="editor_content_wrap" >
                            
            </div>
            <div class="tabmenuWrap anchor">
                <ul class="tabmenu_list w1200 cf">
                <c:if test="${not empty detailGroupList }">
					<div>
						<c:forEach var="groupRow" items="${detailGroupList }" varStatus="status">
							<li class='<c:if test="${status.index == 0}">on</c:if>'><a href="javascript:;" onclick="fnMove('${status + 1 }')"><c:out value="${groupRow.PLN_GRP_TITLE }"></c:out></a></li>
						</c:forEach>
					</div>
				</c:if>
				</ul>
             </div>   

            <c:if test="${not empty detailGroupList and not empty detailList }">
            	<c:forEach var="groupRow" items="${detailGroupList }" varStatus="groupSta">
            	    <div class="pg_sub_tit_wrap clearboth mt95 w1200" id="tab_scroll_0${groupSta.index + 1 }">
                		<h3 class="pg_sub_tit exhibition_tit fl">${groupRow.PLN_GRP_TITLE }</h3>
            		</div>
            		
            		<c:set var="col_cls" value=""></c:set>
            		
            		<c:if test="${groupRow.PLN_GRP_COL eq 2}">
            			<c:set var="col_cls" value="n02"></c:set>
            		</c:if>
            		
            		<c:if test="${groupRow.PLN_GRP_COL eq 3}">
            			<c:set var="col_cls" value="n03"></c:set>
            		</c:if>
            		
            		
            		<div class="sub_content exhi mt32">
                		<div class="new_goods_wrap">
                    		<!-- .goods_list -->
                    		<ul class="new_goods_list ${col_cls} clearboth">
                    			<c:forEach var="item" items="${detailList }" varStatus="inDetailSta">
                    				
                    				<c:if test="${item.PLN_GRP_IDX eq groupRow.PLN_GRP_IDX }">
                    				
				                        <li>
				                        	<c:if test="${item.PRD_MST_LIVE_ON_YN eq 'Y' }">
				                        		<span class="flag_video">video</span>
				                        	</c:if>
				                            
				                            
				                            <!-- .goods_info_wrap -->
				                            <div class="goods_info_wrap">
				                                <a href="/pc/product/productView.do?PRD_MST_CD=${item.PLN_PRD_MST_CD}" target="_blank">
				                                    <div class="img_thum_wrap">
				                                        <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${item.IMG_THUMBNAIL});"></div>
				                                        <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }${item.PRD_ROLL_OVER_IMG});"></div>
				                                        <ul class="color_list">
	                                                    	<c:forEach var="itemcolors" items="${item.PRD_CMM_OPT }" varStatus="status">
	                                                    		<li><span style="background:${itemcolors.CMN_COM_ETC2 };">${itemcolors.CMN_COM_NM }</span></li>
	                                                    	</c:forEach>
				                                        </ul>
				                                    </div>
				                                    <div class="sort_tag_area clearboth">
			                                            <span class="sort">${item.BND_MST_BRAND_NM }</span>
			                                            <span class="tag">${item.TAG_MST_TITLE }</span>
				                                    </div>
				                                    <p class="goods_title">${item.PRD_MST_NM }</p>
				                                    <div class="goods_cost_info">
				                                        <span class="dc_before_cost"><fmt:formatNumber value="${item.PRD_MST_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" /></span>
				                                        <strong class="clearboth">
				                                            <span class="goods_cost"><fmt:formatNumber value="${item.PRD_MST_DSP_PRC }" type="currency" currencySymbol="￦" groupingUsed="true" /></span>
				                                            <em class="dc_percent"><fmt:formatNumber value="${item.PRD_SALE_RATE }" type="percent" groupingUsed="false" /></em>
				                                        </strong>
				                                    </div>
				                                </a>
				                                <div class="btn_like_area">
				                                    <button type="button" class="btn-like  ${item.MY_LIKE eq 'Y' ? 'on' : ''}" 
				                                    onclick="likeBtnEvent($(this), '${item.PLN_PRD_MST_CD}', 'TYPE_PRODUCT')" title="좋아요"><span>${item.LIKE_COUNTS }</span></button>
				                                </div>
				                            </div>
				                            <!-- // .goods_info_wrap -->
				                        </li>   
	                    				
                    				
                    				</c:if>
            
                    			</c:forEach>
                    		</ul>
                    		<!-- // .goods_list -->
                		</div>
                	</div>
            	</c:forEach>
            </c:if>


            
            <div class="apply_info ml30 mt200">
                <p class="info_tit">유의사항</p>
                <ul class="ul_dot">
                    <li>본 기획전은 쑈윈도 로그인 이후 참여 가능합니다.</li>
                    <li>고객센터 통화가 어려울 때는 1:1 상담 게시판을 이용 부탁드립니다.</li>
                </ul>
            </div>
            <div class="btn_wrap">
				<button class="btn_large" onclick="goList()">목록</button>
            </div>
            <!-- ****************************************************************************

            E : 콘텐츠 끝

            ***************************************************************************** -->
        </div>
    </div>
    
<form id="pageInfoForm" name="pageInfoForm" method="get">
	<input type="hidden" id="cPage" name="cPage" value='<c:out value="${commandMap.cPage }"/>' />
	<input type="hidden" id="searchPlnMstStatus" name="searchPlnMstStatus" value='<c:out value="${commandMap.searchPlnMstStatus }"/>' />
	<input type="hidden" id="searchPlnMstCtg" name="searchPlnMstCtg" value='<c:out value="${commandMap.searchPlnMstCtg }"/>' />
</form>

<script>

	$(document).ready(function(){
		
	});
	
	//기획전 목록 이동
	goList = function(){
		$("#pageInfoForm").attr({'action':'<c:out value="${frontDomain}"/>/pc/event/planList.do','method':'post'}).submit();
	}
	
	
</script>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
