<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

<div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="tab_wrap">
                
                	<form name="frm" id="frm"		>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
					<input type="hidden" name="ORD_MST_CD" value=""/>
					<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="${commandMap.PRD_MST_CD }" />
	                <%-- <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" /> --%>
	                <input type="hidden" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
	                <input type="hidden" name="tabId" value="<c:out value="${commandMap.tabId }"/>"/>
	                
                    <ul class="tab ty2">
                        <li	id="tab1"  class="on"<c:if test="${commandMap.tabId == 'tab1' }" ></c:if>>
                        	<a href="#tab1" onclick="moveTab('tab1');">배송상품 주문내역</a>
                        </li>
                        <li	id="tab2" <c:if test="${commandMap.tabId == 'tab2' }" ></c:if>>
                        	<a href="#tab2"	onclick="moveTab('tab2');">매장수령 주문내역</a>
                        </li>
                    </ul>
                    <div class="tab_cont" id="tab">

                        <div class="stab_wrap">
                            <ul class="stab n4">
                                <li><a href="#n">1개월</a></li>
                                <li><a href="#n">3개월</a></li>
                                <li><a href="#n">6개월</a></li>
                                <li><a href="#n">12개월</a></li>
                            </ul>
                        </div>
                        <div class="prod_order_list">
                            <ul>
                            <c:choose>
                            	<c:when test="${not empty list }">
									<c:forEach var="data" items="${list }" varStatus="status">
                                	<li>
                                		<c:if test="${data.ORD_RNK eq 1 }">
                                    		<div class="order_info">
                                        		<p class="date<c:out value="${data.ORD_MST_CNT}"/>"><ui:formatDate value="${data.ORD_MST_ORD_DT}" pattern="yyyy-MM-dd"/>
                                        		<span class="order_num">(<c:out value="${data.ORD_MST_CD }" />)</span></p>
                                        		<div class="btn_area dual">
                                            		<button type="button" class="btn mid gray">전체주문취소</button>
                                            		<button type="button" class="btn mid black" onclick="goOrderView()">주문상세조회</button>
                                        		</div>
                                    		</div>
                                    	</c:if>
                                    <ul class="product_list">
                                        <li>
                                        	<!-- 상품준비....배송중 케이스별 진행상태 -->
                                            <p class="t_state"><c:out value="${data.ORD_PRD_ORD_STATE_NM }" /></p>
                                            
                                            
                                            <div class="prod_info">
                                                <div class="pic"><img src="<c:out value="${cdnDomain }${data.PRODUCT_THUM_IMG}"/>" alt="${data.PRD_IMAGE_ALT}"></div>
                                                <div class="prod_cont">
                                                    <p class="logo"><c:out value="${data.PRD_MST_NM}" /></p>
                                                    <p class="tit">${data.PRD_MST_NM }</p>
                                                    <p class="detail">블랙 / 85 / 1개<c:out value="${data.OPT_DTL_NM}" /></p>
                                                </div>
                                            </div>
                                            <ul class="gray_info_box">
                                                <li>
                                                    <strong class="tit">상품금액</strong>
                                                    <span class="txt"><em class="cost">￦<span><fmt:formatNumber value="${data.ORD_MST_PAY_PRC}"></fmt:formatNumber></span></em></span>
                                                </li>
                                                <li>
                                                    <c:if test="${data.ORD_PRD_ORD_STATE eq '407' or data.ORD_PRD_ORD_STATE eq '408' }">
                                                    <strong class="tit">배송정보</strong>
                                                    <span class="txt">무료배송 / <a href="javascript:goDeliveryView" class="t_delivery"><c:out value="${row.ORD_PRD_IVC_NO }" /><c:out value="${row.DLV_CPN_URL }"/>1234567</a></span>
                                                    </c:if>
                                                    
                                                </li>
                                            </ul>
                                            
                                            <div class="btn_area third">
                                            <c:if test="${data.ORD_PRD_ORD_STATE eq '408' }">
                                                <button type="button" class="btn mid gray">반품신청</button>
                                                <button type="button" class="btn mid black">교환신청</button>
                                                <button type="button" class="btn mid purple">구매확정</button>
                                            </c:if>    
                                            </div>
                                            <div class="btn_area">
                                            <c:if test="${data.ORD_PRD_ORD_STATE eq '405' or data.ORD_PRD_ORD_STATE eq '3022' }">
                                            	<button type="button" class="btn mid gray full">주문취소</button>
                                            </c:if>	
                                            <c:if test="${data.ORD_PRD_ORD_STATE eq '409' }">
                                                <button type="button" class="btn mid black full">상품후기</button>
                                            </c:if>    
                                            </div>
                                            
                                        </li>
                                    </ul>
                                </li>
                                </c:forEach>
                                </c:when>
                                </c:choose>
                            </ul>
                        </div>
                        <div class="more_area">
                            <button type="button" class="btn_more" onclick="moreList()"><span>더보기</span></button>
                        </div>

                    </div><!-- //tab_cont -->
                    </form>
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
    });
    
    
    moveTab = function (tabId){
    	
		var $frm = $("#frm");
			$frm.find("input[name='cPage']").val(1);
			$frm.find("input[name='tabId']").val(tabId);
			
			
		var actionUrl = "";
		
		if(tabId == "tab1" ){
			actionUrl ="<c:out value="${serverSslDomain}"/>/mobile/mypage/myShoppingList.do";
		}else if(tabId == "tab2"){
			actionUrl ="<c:out value="${serverSslDomain}"/>mobile/mypage/myOfflineShoppingList.do";
		}else{
			alert("올바르지 않은 접근입니다.");
			return false;
		}
		     
		$frm.attr({"action":actionUrl, "target":"_self", "method":"post"}).submit();
	    
	};
	
	// 배송조회 팝업페이지 호출
    goDeliveryView = function (url) {
		var $frm = $("#frm");
    	goSearchDelivery(url);
    };
    
  //주문배송상세페이지 이동
	goOrderView = function(ordMstCd){
		var $frm = $("#frm");
		$frm.find("input[name='ORD_MST_CD']").val(ordMstCd);
	    $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/mobile/mypage/myShoppingInfo.do", "target":"_self", "method":"get"}).submit();
	};

	//더보기 구현중
	moreList = function (cPage) {
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.append({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/myShoppingList.do", "target":"_self", "method":"get"}).submit();
	}

</script>
