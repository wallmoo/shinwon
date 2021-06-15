<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
            	<form id="frm" name="frm">
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="tabId" value="<c:out value="${commandMap.tabId }"/>"/>  
	                <%-- <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" /> --%>
		            <input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="${commandMap.ORD_MST_CD }" />
		            <input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="${commandMap.PRD_MST_CD }" />
		            <input type="hidden" id="searchCancelBack" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
		            <input type="hidden" id="searchState" name="searchState" value="<c:out value="${commandMap.searchState }"/>"/>
	      		</form>
                <div class="prod_order_list">
                    <ul>
                    	<c:forEach var="row" items="${orderProductList }">
                        <li>
                            <div class="order_info">
                                <p class="date"><ui:formatDate value="${orderPayInfo.ORD_MST_ORD_DT}" pattern="yyyy.MM.dd"/><span class="order_num">(${orderPayInfo.ORD_MST_CD })</span></p>
                                <div class="btn_area">
                                    <button type="button" class="btn mid gray full">전체주문취소</button>
                                </div>
                            </div>
                            <div class="title_wp2 mt30 b15">
                                <p class="ct_title2">주문상품 정보</p>
                            </div>
                            <ul class="product_list st2">
                                <li>
                                    <p class="t_state"><c:out value="${row.ORD_PRD_ORD_STATE_NM }" /></p>
                                    <div class="prod_info">
                                        <div class="pic">
                                        <a href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');" class="product_thumb">
                                        <img src="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG}"/>" alt="${row.PRD_IMAGE_ALT}" /></a>
                                        </div>
                                        <div class="prod_cont">
                                            <p class="logo"><c:out value="${row.VDR_MST_NM }" /></p>
                                            <p class="tit"><c:out value="${row.PRD_MST_NM }" /></p>
                                            <p class="detail"><c:out value="${row.ORD_PRD_COLOR }" /> / <c:out value="${row.ORD_PRD_SIZE }" /> / <c:out value="${row.ORD_PRD_ORD_CNT }" />개</p>
                                        </div>
                                    </div>
                                    <ul class="gray_info_box">
                                        <li>
                                            <strong class="tit">원가</strong>
                                            <span class="txt"><em class="cost before">￦<span><fmt:formatNumber value="${row.ORD_IST_CPN_PRC}" type="number"/></span></em></span>
                                        </li>
                                        <li>
                                            <strong class="tit">상품금액</strong>
                                            <span class="txt"><em class="cost">￦<span><fmt:formatNumber value="${row.ORD_PRD_PRD_PRC}" type="number"/></span></em></span>
                                        </li>
                                        <li>
                                            <strong class="tit">배송정보</strong>
                                            <c:choose>
                                            	<c:when test="${row.ORD_PRD_DLV_CAG ne 0 }">
                                            		<span class="txt"><c:out value="${row.ORD_PRD_DLV_CAG }"/></span>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<span class="txt">무료배송</span>
                                            	</c:otherwise>
                                            </c:choose>
                                        </li>
                                    </ul>
	                                    <div class="btn_area">
	                                    <c:if test="${row.ORD_PRD_ORD_STATE eq '405' or row.ORD_PRD_ORD_STATE eq '3022' }">
    	                                <button type="button" class="btn mid gray full">주문취소</button>
                                        
                                        <%-- <c:if test="${data.ORD_PRD_ORD_STATE eq '408' }">
                                        <button type="button" class="btn mid gray full">반품신청</button>
                                        <button type="button" class="btn mid gray full">교환신청</button>
                                        <button type="button" class="btn mid gray full">구매확정</button>
                                        </c:if>
                                        <c:if test="${data.ORD_PRD_ORD_STATE eq '409' }">
                                        <button type="button" class="btn mid gray full">상품후기</button>
                                        </c:if> --%>
                                    	</c:if>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="order_detail_wp">
                    <c:if test="${not empty requestedGiftList}">
                    <div class="box">
                        <div class="title_wp2 mt0">
                            <p class="ct_title2">사은품 정보</p>
                        </div>
                        <div class="prod_info">
                        	<c:forEach var="gift" items="${requestedGiftList}" varStatus="i">
                            <div class="pic">
                            	<img src="<c:out value="${cdnDomain }${gift.PRODUCT_THUM_IMG}"/>" alt="<c:out value="${gift.PRD_IMAGE_ALT}"/>">
                            </div>
                            <div class="prod_cont">
                                <p class="logo">[신원]VIKI</p>
                                <p class="tit">플라워 체크 패턴 랩 스타일 원피스</p>
                                <p class="detail">블랙 / 85 / 1개</p>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    </c:if>
                    <div class="box">
                    
                        <div class="title_wp2 m0">
                            <p class="ct_title2">결제 정보</p>
                            <div class="right">
                                <a href="#n" class="total_sum b_detail on"><strong>￦1,500,000</strong></a>
                            </div>
                        </div>
                        <div class="sum_list_wp detail_box" style="display:none">
                            <ul class="sum_list">
                                <li>
                                    <dl>
                                        <dt>주문금액</dt><dd>￦1,500,000</dd>
                                        <dt>총 상품금액</dt><dd>￦1,500,000</dd>
                                        <dt>배송비</dt><dd>￦2,500</dd>
                                        <dt>도서산간 배송비</dt><dd>￦2,500</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt>할인금액</dt><dd>-￦10,000</dd>
                                        <dt>즉시할인</dt><dd>-￦5,000</dd>
                                        <dt>제휴사할인</dt><dd>-￦2,500</dd>
                                        <dt>상품할인쿠폰</dt><dd>-￦2,500</dd>
                                        <dt>배송비쿠폰</dt><dd>-￦2,500</dd>
                                        <dt>프로모션 할인</dt><dd>-￦2,500</dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt>포인트 사용</dt><dd>-17,500p</dd>
                                        <dt>통합포인트 사용</dt><dd>-2,000p</dd>
                                        <dt>E포인트 사용</dt><dd>-10,000p</dd>
                                        <dt>임직원포인트 사용</dt><dd>-5,000p</dd>
                                    </dl>
                                </li>
                            </ul>
                        </div>
                        
                    </div>
                    <div class="box">
                        <div class="title_wp2 m0">
                            <p class="ct_title2">적립혜택 정보</p>
                            <div class="benefit">15,000P</div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="title_wp2 mt0">
                            <p class="ct_title2">배송지 정보</p>
                            <div class="right btn_area">
                                <button type="button" class="btn mid black">배송지 정보 변경</button>
                            </div>
                        </div>
                        <ul class="gray_info_box">
                            <li>
                                <strong class="tit">받으시는 분</strong>
                                <span class="txt">홍길동</span>
                            </li>
                            <li>
                                <strong class="tit">휴대폰</strong>
                                <span class="txt">010-1234-5678</span>
                            </li>
                            <li>
                                <strong class="tit">전화번호</strong>
                                <span class="txt">02-123-4567</span>
                            </li>
                            <li>
                                <strong class="tit">주소</strong>
                                <span class="txt">[14043] 서울 광진구 경변북로 332, APT 1523-102</span>
                            </li>
                            <li>
                                <strong class="tit">배송 유의사항</strong>
                                <span class="txt">부재시 경비실/관리실에 맡겨주세요. </span>
                            </li>
                        </ul>
                    </div>
                    <div class="box">
                        <div class="title_wp2 mt0">
                            <p class="ct_title2">주문고객 정보</p>
                        </div>
                        <ul class="gray_info_box">
                            <li>
                                <strong class="tit">받으시는 분</strong>
                                <span class="txt">홍길동</span>
                            </li>
                            <li>
                                <strong class="tit">이메일</strong>
                                <span class="txt">gdhong@naver.com</span>
                            </li>
                            <li>
                                <strong class="tit">휴대폰</strong>
                                <span class="txt">010-1234-5678</span>
                            </li>
                            <li>
                                <strong class="tit">전화번호</strong>
                                <span class="txt">02-123-4567</span>
                            </li>
                        </ul>
                    </div>
                    <div class="box">
                        <div class="title_wp2 mt0">
                            <p class="ct_title2">배송 포장 정보</p>
                        </div>
                        <div class="info_packing">
                            <p class="txt">선물포장 옵션 선택이 정상적으로 되었습니다.</p>
                        </div>
                        <div class="gray_bx">
                            <ul class="dot_list">
                                <li>신선물용이나 이동 시, 편리하게 사용할 수 있는 쇼핑백을 포장해드립니다.</li>
                                <li>브랜드 쇼핑백 또는 선물용 고급 쇼핑백 중 1개로 무작위 발송되어, 고객님의 요청사항이 반영되지 않으니 양해 부탁 드립니다.</li>
                            </ul>
                        </div>
                    </div>
                </div><!-- //order_detail_wp -->
                <div class="btn_area">
                    <button type="button" class="btn black">목록</button>
                </div>
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
        });
    </script>