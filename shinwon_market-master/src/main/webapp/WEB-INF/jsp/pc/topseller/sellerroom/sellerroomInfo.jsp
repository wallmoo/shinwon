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
        	
			<!-- topseller_cont -->
			<div class="topseller_cont">
				<div class="seller_info_wp">
					<div class="sl_img"><img src="${cdnDomain }${bannerInfo.FILE_NM }" alt="${bannerInfo.CMN_FLE_ALT_TXT }"></div>
					<div class="sl_cont">
                        <p class="tit" >${bannerInfo.BNR_MST_TITLE }</p>
                        <p class="desc">${bannerInfo.BNR_MST_SUB_TITLE }</p>
                        <p class="txt" >${bannerInfo.BNR_MST_DESC }</p>						
					</div>
				</div>
			</div>
			<!--// topseller_cont -->


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
	<input type="hidden" id="VDR_MST_IDX" name="VDR_MST_IDX" value="${sellerInfo.VDR_MST_IDX }">
</form>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script>
    $(function(){
        
    });
</script>

