<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->


			<div class="sub_content">
				<h2 class="pg_tit blind">마이페이지</h2>

				<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->

			<div class="tab_view_wp">
				<div class="tab_cont tab_view1 on">
					<h4 class="blind">OOTD</h4>

					<div class="personal_wrap">
						<strong class="tit">
							<em class="lato bold"><c:out value="${sessionUser.MEM_MST_MEM_ID }"/></em> 님의 <em class="lato bold">OOTD</em>
						</strong>
						<div class="sorting">
							<ul class="clearboth">
								<li>
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myLikeList.do" class="clearboth">
										<span class="name">좋아요</span>
										<span class="num lato bold"><c:out value="${myPageCount.LIK_HIS_CNT }"/><em class="txt">건</em></span>
									</a>
								</li>
								<li>
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myProductInquiryIncompleteList.do" class="clearboth">
										<span class="name">상품문의</span>
										<span class="num lato bold"><c:out value="${myPageCount.BRD_INQ_CNT }"/><em class="txt">건</em></span>
									</a>
								</li>
								<li>
									<a href="<c:out value="${frontDomain }"/>/pc/mypage/myInquiryList.do" class="clearboth">
										<span class="name">1:1문의</span>
										<span class="num lato bold"><c:out value="${myPageCount.MEM_ADV_CNT }"/><em class="txt">건</em></span>
									</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="thumb_list_wrap mb95">
						<div class="rep_thumb">
							<a href="<c:out value="${frontDomain }"/>/pc/mypage/myOotdList.do">
								<img src="/nas/cdn/PW/images/@temp/img_temp_thumb.jpg" alt="OOTD">
								<span class="tit">OOTD</span>
								<span class="b_total"><em>전체보기</em></span>
							</a>
						</div>
						<ul class="clearboth">
							<c:choose>
								<c:when test="${not empty myOotdList }">
									<c:forEach var="data" items="${myOotdList }" varStatus="status">
							<li>
								<a href="/pc/mypage/myOotdDetail.do?CNT_MST_IDX=<c:out value="${data.CNT_MST_IDX }"/>">
									<img src="<c:out value="${data.CNT_MST_URL }"/>" alt="OOTD">
								</a>
							</li>
											</c:forEach>
										</c:when>
									</c:choose>
						</ul>
					</div>

					<div class="thumb_list_wrap mb95">
						<div class="rep_thumb">
							<a href="<c:out value="${frontDomain }"/>/pc/mypage/myLikeList.do">
								<img src="/nas/cdn/PW/images/@temp/img_temp_thumb2.jpg" alt="좋아요">
								<span class="tit">좋아요</span>
								<span class="b_total"><em>전체보기</em></span>
							</a>
						</div>
						<ul class="clearboth">
							<c:choose>
								<c:when test="${not empty myPageLike }">
									<c:forEach var="data" items="${myPageLike }" varStatus="status">
						
										<li>
											<a href="<c:out value="${frontDomain }"/>/pc/product/productView.do?PRD_MST_CD=<c:out value="${data.PRD_MST_CD }" />">
												<img src="<c:out value="${data.PRD_IMG_URL_PATH }"/>" alt="좋아요">
											</a>
										</li>

											</c:forEach>
										</c:when>
									</c:choose>

						</ul>
					</div>
				</div>
			</div>

			</div>
			<!-- //sub_content -->
			<!-- <script type="text/javascript">
				$(function(){
					$('.my_modify_top_wrap .tab a').on('click',function(){
						var idx = $(this).parent('li').index();
						var view = $(this).parents('.my_modify_top_wrap').next('.tab_view_wp').find('.tab_cont');
						view.eq(idx).addClass('on').siblings().removeClass('on');
					})
				})
			</script> -->


		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>