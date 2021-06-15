<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top01.jsp" %>


<!-- #container -->
        <div id="container">
	        
	        <!-- popup -->
		    <!-- <div id="lay_mask"></div> --><!-- 마스크로 띄워질 Div -->
		    	<c:choose>
		    	<c:when test="${not empty listPopup }" >
		    	<c:forEach var="item" items="${listPopup }" varStatus="status">
		    	<c:if test="${item.POP_MST_TYP eq 'L' }">
			    <div id="pop_notice_${item.POP_MST_IDX }" class="pop_layer pop_notice">
			        <div class="pop_wrap">
			            <div class="pop_container">
			                <div class="notice_area">
			                    <a href="javascript:popupLink('<c:out value="${item.POP_MST_LNK }"/>', '<c:out value="${item.POP_MST_MDE }"/>')">
								        ${item.POP_MST_CNT }
								</a>
			                </div>
			                <div class="btn_area dual">
			                <c:if test="${item.POP_MST_DAY_YN eq 'Y' }" >
			                    <button type="button" class="btn"	id="serach_chk_${item.POP_MST_IDX }" name="serach_chk_${item.POP_MST_IDX }">오늘그만보기</button>
			                </c:if>    
			                    <button type="button" class="btn" data-type="l" data-id="${item.POP_MST_IDX}" onclick="toggleLayer($('#pop_notice'), 'off');">닫기</button>
			                </div>
			            </div><!-- //pop_container -->
			        </div><!-- //pop_wrap -->
			    </div>
			    </c:if>
			    </c:forEach>
			    </c:when>
			    </c:choose>
			    <!-- //pop_layer -->
	    <!-- //popup -->
	    
            <!-- #content_area -->
            <div id="content_area">
                <div class="ootd_main">
                    <div class="set_tag mCustomScrollbar">
                        <a href="#b" class="b_tag"><span>태그관리</span></a>
                        <span class="tag"><em>#일이삼사오육칠팔구십일이삼팔구십일이삼</em></span>
                        <span class="tag"><em>#유니크</em></span>
                        <span class="tag"><em>#모던한</em></span>
                    </div>
                    <ul class="goods_list">
                        <li class="atv">
                            <a href="#n">
                                <div class="thum_img">
                                    <span class="flag_timer">타임세일</span>
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#기획전이벤트</span>
                                    </div>
                                    <p class="goods_title">모든 옷에 조화로운 베이직 셔츠의 활용</p>
                                    <div class="goods_cont_wp">
                                        <p class="goods_term">01.22-01.31</p>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                <button type="button" class="btn_comment" title="코멘트"><span>920</span></button>
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <span class="flag_timer">타임세일</span>
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#타임세일</span>
                                    </div>
                                    <p class="goods_title">겨울 한정 판매 봄을 맞이하는 여성스러운 원피스</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="per_bar_wrap">
                                        <p class="time">14h : 21m : 21s 남음</p>
                                        <div class="per_bar">
                                            <span style="width:90%;">90%</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="saler">
                                        <span class="pic"><img src="/nas/cdn/MW/images/_temp/img_temp_saler.jpg" alt=""></span>
                                        <span class="name">Seller Stylenanda</span>
                                    </div>
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#셀러피드</span>
                                    </div>
                                    <p class="goods_title">고민없는 선택 데일리 백</p>
                                    <div class="goods_cont_wp">
                                        <p class="goods_context">돔바의 어글리 슈즈 라운드업은 5cm의 굽을 가지고 있지만 편안한 착화감을 선물하는 반전 매력의 주인공이...</p>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                <button type="button" class="btn_saler">셀러홈으로 이동하기</button>
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img banner">
                                    <img src="/nas/cdn/MW/images/_temp/img_temp_banner.jpg" alt="">
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#기획전이벤트</span>
                                    </div>
                                    <p class="goods_title">모든 옷에 조화로운 베이직 셔츠의 활용</p>
                                    <div class="goods_cont_wp">
                                        <p class="goods_term">01.22-01.31</p>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                <button type="button" class="btn_comment" title="코멘트"><span>920</span></button>
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="saler">
                                        <span class="pic"><img src="/nas/cdn/MW/images/_temp/img_temp_saler.jpg" alt=""></span>
                                        <span class="name">Seller Stylenanda</span>
                                    </div>
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#셀러피드</span>
                                    </div>
                                    <p class="goods_title">고민없는 선택 데일리 백</p>
                                    <div class="goods_cont_wp">
                                        <p class="goods_context">돔바의 어글리 슈즈 라운드업은 5cm의 굽을 가지고 있지만 편안한 착화감을 선물하는 반전 매력의 주인공</p>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                <button type="button" class="btn_saler">셀러홈으로 이동하기</button>
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="saler">
                                        <span class="pic"><img src="/nas/cdn/MW/images/common/ico/img_default_saler.png" alt=""></span>
                                        <span class="name">Seller Stylenanda</span>
                                    </div>
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#일반고객피드</span>
                                    </div>
                                    <p class="goods_title">모든 옷에 조화로운 베이직 셔츠의 활용이 가능한 조화로운 모든 옷</p>
                                </div>
                            </a>
                            <ul class="prod_list">
                                <li>
                                    <a href="#">
                                        <div class="prod"><img src="/nas/cdn/MW/images/_temp/img_temp_prod.jpg" alt=""></div>
                                        <div class="info">
                                            <p class="tit">신상품 v블랙 실크 플라워 체크 패턴 랩 스타일 원피스</p>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong><em>원</em></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="prod"><img src="/nas/cdn/MW/images/_temp/img_temp_prod.jpg" alt=""></div>
                                        <div class="info">
                                            <p class="tit">신상품 v블랙 실크 플라워 체크 패턴 랩 스타일 원피스</p>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong><em>원</em></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <div class="prod"><img src="/nas/cdn/MW/images/_temp/img_temp_prod.jpg" alt=""></div>
                                        <div class="info">
                                            <p class="tit">신상품 v블랙 실크 플라워 체크 패턴 랩 스타일 원피스</p>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong><em>원</em></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                <button type="button" class="btn_comment" title="코멘트"><span>920</span></button>
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#하울영상</span>
                                    </div>
                                    <p class="goods_title">모든 옷에 조화로운 베이직 셔츠의 활용이 가능한 조화로운 모든 옷</p>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img banner">
                                    <img src="/nas/cdn/MW/images/_temp/img_temp_banner.jpg" alt="">
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="saler">
                                        <span class="pic"><img src="/nas/cdn/MW/images/_temp/img_temp_saler.jpg" alt=""></span>
                                        <span class="name">핑크플레이스</span>
                                    </div>
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">SIEG</span>
                                        <span class="tag">#일반고객피드</span>
                                    </div>
                                    <p class="goods_title">모든 옷에 조화로운 베이직 셔츠의 활용이 가능한 조화로운 모든 옷</p>
                                </div>
                            </a>
                            <ul class="prod_list">
                                <li>
                                    <a href="#">
                                        <div class="prod"><img src="/nas/cdn/MW/images/_temp/img_temp_prod.jpg" alt=""></div>
                                        <div class="info">
                                            <p class="tit">컬러 스트라이프 골지 원피스<br>(BWOCX4912)</p>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong><em>원</em></span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                <button type="button" class="btn_comment" title="코멘트"><span>920</span></button>
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <span class="flag_video">video</span> <!-- 0323  flag가 동시 노출되는 케이스 추가 -->
                                    <span class="flag_funding">펀딩</span>
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#펀딩</span>
                                    </div>
                                    <p class="goods_title">모든 옷에 조화로운 베이직 셔츠의 활용 가능한 조화로운 모든 옷</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
                                            <div class="dc_after_cost">
                                                <span class="dc_percent"><strong>50</strong>%</span>
                                                <span class="goods_cost"><strong>500,000</strong>원</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="per_bar_wrap funding">
                                        <span class="per">60%달성</span>
                                        <p class="time">14h : 21m : 21s 남음</p>
                                        <div class="per_bar">
                                            <span style="width:65%;">65%</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="btn_goods_area">
                                <button type="button" class="btn_sharing">공유하기</button>
                            </div>
                        </li>
                        <li>
                            <a href="#n">
                                <div class="thum_img">
                                    <span class="flag_video">video</span>
                                    <img src="/nas/cdn/MW/images/_temp/img_feed_01.jpg" alt="">
                                </div>
                                <div class="thum_info_txt">
                                    <div class="sort_tag_area clearboth">
                                        <span class="sort">NIKE</span>
                                        <span class="tag">#일반상품라이브온</span>
                                    </div>
                                    <p class="goods_title">모든 옷에 조화로운 베이직 셔츠의 활용</p>
                                    <div class="goods_cont_wp">
                                        <div class="goods_cost_info">
                                            <span class="dc_before_cost">1,000,000</span>
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
                </div>
            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript">
        $(".set_tag").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true,
                updateOnImageLoad: false
            }
        });
        
        $(function () {
	        $(".menuSlide").hide();
		});
    </script>
    <script type="text/javascript">
        toggleLayer($('#pop_notice'), 'on');
    </script>