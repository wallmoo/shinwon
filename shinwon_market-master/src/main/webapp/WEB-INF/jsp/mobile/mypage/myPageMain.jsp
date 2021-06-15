<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>     --%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- <%@ include file="/WEB-INF/jsp/mobile/mypage/mypage.jsp" %> --%>
 
        
        <!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="my_info">
                    <p class="nick"><c:out value="${sessionUser.MEM_MST_MEM_ID }" />님</p>
                    <p class="level">회원등급:<c:out value="${summaryMap.MEM_GRD_NM }"/></p>
                    <c:if test="${fn:indexOf(requestUrl,'/mobile/mypage/myInfoPasswordForm.do') > -1 || fn:indexOf(requestUrl,'/mobile/mypage/myInfoEditForm.do') > -1}"> active</c:if>
                    <a href="<c:out value="${serverSslDomain }"/>/mobile/mypage/myInfoPasswordForm.do"" class="b_edit">
                        <span class="pic"><img src="/nas/cdn/MW/images/_temp/img_temp_myinfo.png" alt=""></span>
                        <span class="txt" >내 정보 수정</span>
                    </a>
                    <div class="b_area">
                        <a href="<c:out value="${mobileDomain }"/>/mobile/event/memberBenefit.do"">등급별 혜택</a>
                    </div>
                </div><!-- // my_info -->
                <div class="tab_wrap">
                    <ul class="tab st3">
                        <li class="on"><a href="#tab1">OOTD</a></li>
                        <li><a href="#tab2">MY SHOPPING</a></li>
                    </ul>
                    <div class="tab_cont" id="tab1">
                        <ul class="ootd_count">
                            <li>
                                <p class="txt"><strong>999</strong></p>
                                <p class="tit">좋아요</p>
                            </li>
                            <li>
                                <p class="txt"><strong>89</strong></p>
                                <p class="tit">상품문의</p>
                            </li>
                            <li>
                                <p class="txt"><strong>10</strong></p>
                                <p class="tit">1:1 문의</p>
                            </li>
                        </ul>
                        <div class="tit_wp">
                            <p class="ct_tit">OOTD</p>
                        </div>
                        <div class="ootd_list">
                            <ul>
                                <li><a href="#n"><img src="/nas/cdn/MW/images/_temp/img_ootdlist_01.jpg" alt=""></a></li>
                                <li><a href="#n"><img src="/nas/cdn/MW/images/_temp/img_ootdlist_02.jpg" alt=""></a></li>
                                <li><a href="#n"><img src="/nas/cdn/MW/images/_temp/img_ootdlist_03.jpg" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="tit_wp">
                            <p class="ct_tit">좋아요</p>
                        </div>
                        <div class="ootd_list">
                            <ul>
                                <li><a href="#n"><img src="/nas/cdn/MW/images/_temp/img_ootdlist_01.jpg" alt=""></a></li>
                                <li><a href="#n"><img src="/nas/cdn/MW/images/_temp/img_ootdlist_02.jpg" alt=""></a></li>
                                <li><a href="#n"><img src="/nas/cdn/MW/images/_temp/img_ootdlist_03.jpg" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="link_list">
                            <ul>
                                <li><a href="#n">피드 관리</a></li>
                                <li><a href="#n">OOTD 관리</a></li>
                                <li><a href="#n">댓글 관리</a></li>
                                <li><a href="#n">좋아요 관리</a></li>
                                <li><a href="#n">이벤트 참여현황</a></li>
                                <li><a href="<c:out value="${frontDomain}" />/mobile/mypage/myWritableProductCommentList.do">상품 리뷰</a></li>
                                <li><a href="#n">재입고 알림</a></li>
                                <li><a href="#n">즐겨찾기 관리</a></li>
                                <li><a href="#n">상품문의</a></li>
                                <li><a href="<c:out value="${mobileDomain }"/>/mobile/mypage/myInquiryList.do">1:1문의</a></li>
                            </ul>
                        </div>
                    </div><!-- //tab_cont -->
                    <div class="tab_cont" id="tab2">
                        <ul class="ootd_count">
                            <li>
                                <p class="txt"><strong>1,500</strong></p>
                                <p class="tit">통합포인트</p>
                            </li>
                            <li>
                                <p class="txt"><strong>88</strong></p>
                                <p class="tit">E포인트</p>
                            </li>
                            <li>
                                <p class="txt"><strong>1,004</strong></p>
                                <p class="tit">쿠폰</p>
                            </li>
                        </ul>
                        <div class="tit_wp">
                            <p class="ct_tit">주문/배송조회</p>
                        </div>
                        <div class="order_process">
                            <ol>
                                <li><strong>10</strong><span>입금대기</span></li>
                                <li><strong>0</strong><span>결제완료</span></li>
                                <li><strong>0</strong><span>배송준비중</span></li>
                                <li><strong>1</strong><span>배송중</span></li>
                                <li><strong>2</strong><span>배송완료</span></li>
                            </ol>
                        </div>
                        <div class="order_info_wp">
                            <ul>
                                <li><span class="tit">매장수령</span><span class="num"><strong>1</strong>건</span></li>
                                <li><span class="tit">구매확정</span><span class="num"><strong>20</strong>건</span></li>
                                <li><span class="tit">취소</span><span class="num"><strong>20</strong>건</span></li>
                                <li class="none"><span class="tit">교환</span><span class="num"><strong>0</strong>건</span></li>
                                <li><span class="tit">반품</span><span class="num"><strong>1</strong>건</span></li>
                            </ul>
                        </div>
                        <div class="tit_wp">
                            <p class="ct_tit">최근 본 상품</p>
                        </div>
                        <ul class="goods_list dual mg_reset">
                            <li>
                                <a href="#n">
                                    <div class="thum_img">
                                        <span class="flag_video">video</span>
                                        <img src="/nas/cdn/MW/images/_temp/img_thum_dual.jpg" alt="">
                                    </div>
                                    <div class="thum_info_txt">
                                        <div class="sort_tag_area clearboth">
                                            <span class="sort">NIKE</span>
                                            <span class="tag">#기획전</span>
                                        </div>
                                        <p class="goods_title">모든 옷에 조화로운 베이직 셔츠의 활용</p>
                                        <div class="goods_cont_wp">
                                            <div class="goods_cost_info">
                                                <span class="dc_before_cost">￦1,000,000</span>
                                                <div class="dc_after_cost">
                                                    <span class="dc_percent"><strong>50</strong>%</span>
                                                    <span class="goods_cost"><strong>500,000</strong>원</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <div class="btn_goods_area">
                                    <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                </div>
                            </li>
                            <li>
                                <a href="#n">
                                    <div class="thum_img">
                                        <img src="/nas/cdn/MW/images/_temp/img_thum_dual.jpg" alt="">
                                    </div>
                                    <div class="thum_info_txt">
                                        <div class="sort_tag_area clearboth">
                                            <span class="sort">NIKE</span>
                                            <span class="tag">#기획전</span>
                                        </div>
                                        <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 원피스</p>
                                        <div class="goods_cont_wp">
                                            <div class="goods_cost_info">
                                                <span class="dc_before_cost">￦1,000,000</span>
                                                <div class="dc_after_cost">
                                                    <span class="dc_percent"><strong>50</strong>%</span>
                                                    <span class="goods_cost"><strong>500,000</strong>원</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <div class="btn_goods_area">
                                    <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                </div>
                            </li>
                            <li>
                                <a href="#n">
                                    <div class="thum_img">
                                        <span class="flag_video">video</span>
                                        <img src="/nas/cdn/MW/images/_temp/img_thum_dual.jpg" alt="">
                                    </div>
                                    <div class="thum_info_txt">
                                        <div class="sort_tag_area clearboth">
                                            <span class="sort">NIKE</span>
                                            <span class="tag">#기획전</span>
                                        </div>
                                        <p class="goods_title">모든 옷에 조화로운 베이직 셔츠의 활용</p>
                                        <div class="goods_cont_wp">
                                            <div class="goods_cost_info">
                                                <span class="dc_before_cost">￦1,000,000</span>
                                                <div class="dc_after_cost">
                                                    <span class="dc_percent"><strong>50</strong>%</span>
                                                    <span class="goods_cost"><strong>500,000</strong>원</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <div class="btn_goods_area">
                                    <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                </div>
                            </li>
                            <li>
                                <a href="#n">
                                    <div class="thum_img">
                                        <img src="/nas/cdn/MW/images/_temp/img_thum_dual.jpg" alt="">
                                    </div>
                                    <div class="thum_info_txt">
                                        <div class="sort_tag_area clearboth">
                                            <span class="sort">NIKE</span>
                                            <span class="tag">#기획전</span>
                                        </div>
                                        <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 원피스</p>
                                        <div class="goods_cont_wp">
                                            <div class="goods_cost_info">
                                                <span class="dc_before_cost">￦1,000,000</span>
                                                <div class="dc_after_cost">
                                                    <span class="dc_percent"><strong>50</strong>%</span>
                                                    <span class="goods_cost"><strong>500,000</strong>원</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                                <div class="btn_goods_area">
                                    <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                </div>
                            </li>
                        </ul>
                        <div class="link_list">
                            <ul>
                                <li><a href="<c:out value="${serverSslDomain}" />/mobile/mypage/myShoppingList.do"">주문/배송 조회</a></li>
                                <li><a href="<c:out value="${serverSslDomain}" />/mobile/mypage/myOrderCancelBackList.do">취소/교환/반품</a></li>
                                <li><a href="#n">회원등급 및 혜택</a></li>
                                <li><a href="<c:out value="${frontDomain}" />/mobile/mypage/myMileageList.do"">포인트</a></li>
                                <li><a href="<c:out value="${frontDomain}" />/mobile/mypage/myCouponUsableList.do"">할인쿠폰</a></li>
                                <li><a href="#n">마이핏 관리</a></li>
                                <li><a href="<c:out value="${serverSslDomain }"/>/mobile/mypage/myInfoPasswordForm.do">회원정보 수정</a></li>
                                <li><a href="<c:out value="${frontDomain}" />/mobile/mypage/myDeliveList.do">배송지 관리</a></li>
                                <li><a href="#n">환불계좌관리</a></li>
                                <li><a href="<c:out value="${serverSslDomain }"/>/mobile/mypage/myInfoDeleteForm.do">회원탈퇴</a></li>
                            </ul>
                        </div>

                    </div><!-- //tab_cont -->
                </div><!-- //tab_wrap -->

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript">
        $(".ootd_list").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true
            }
        })
        
        $("#goPage").on("click", function () {
			location.href = "<c:out value="${serverSslDomain }"/>/mobile/mypage/myInfoPasswordForm.do";
		})
        
  	</script>