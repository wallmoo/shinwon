<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-exhibit"><!-- page-display view : 기획전 -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<article id="container" class="container">
		<div class="contents minW"><!-- .contents S -->


			<div class="exhi_ti">
				<dl class="loc">
					<dt class="blind">현제 카테고리 경로</dt>
					<dd class="f"><a href="javascript:void(0)" class="ico_home"><span class="ir">홈</span></a></dd>
					<dd class="l"><a href="javascript:void(0)"><span>쇼핑기획전</span></a></dd>
				</dl>
			</div>

				<h4 class="title title-event">
					<span>

					</span>
				</h4>


			<!-- .exhi_detail S -->
			<dl class="exhi_detail">
				<dt>
					<strong class="tx_doc"><c:out value="${planInfo.PLN_MST_TITLE }"/></strong>
					<span>기간 : <ui:formatDate value="${planInfo.PLN_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${planInfo.PLN_MST_ED_DT }" pattern="yyyy.MM.dd"/></span>
					
					<div class="sns">
						<a href="javascript:goProductKakaoStory();" class="ico_kakao"><span class="ir">kakaotalk 공유</span></a>
						<a href="javascript:goProductTwitter();" class="ico_t"><span class="ir">twitter 공유</span></a>
						<a href="javascript:goProductFacebook();" class="ico_f"><span class="ir">facebook 공유</span></a>
						<a href="javascript:insertKeepingContents(<c:out value="${planInfo.PLN_MST_IDX}" />);" class="btn_st0 btn_white small keeping"><span>키핑</span></a>
							<!-- <a href="javascript:goProductPinterest();" class="ico_p"><span class="ir">pinterest 공유</span></a> -->
					</div>
				</dt>
				<dd>
					<c:out value="${planInfo.PLN_MST_PC_BANNER }" escapeXml="false" />
				</dd>
			</dl>
			
			<!--// .exhi_detail E -->
			<c:choose>
				<c:when test="${not empty detailGroupList and not empty detailList }">
                   	<c:forEach var="groupRow" items="${detailGroupList }" varStatus="groupSta">
                   		<c:set var="col" value="${groupRow.PLN_GRP_COL }" />
                   		<!-- .exhi_lists S -->
                   		<c:if test="${planInfo.PLN_MST_PRD_DPL_YN eq 'Y' }">
						<dl class="exhi_lists">
							<c:if test="${groupRow.PLN_GRP_TYPE eq 'T'}">
							<dt>
								<strong><c:out value="${groupRow.PLN_GRP_TITLE }"/></strong>
							</dt>
							</c:if>
							<c:if test="${groupRow.PLN_GRP_TYPE eq 'I'}">
							<dt class="dt_img">
								<img src="<c:out value="${cdnDomain }${groupRow.FILE_NM }" />" alt="<c:out value="${groupRow.CMM_FLE_ALT_TXT }" />" />
							</dt>
							</c:if>
							<dd>
								<ol class="list_<c:out value="${groupRow.PLN_GRP_COL}" />" >
									<c:set var="countNum" value="1" /> 
									<c:forEach var="item" items="${detailList }" varStatus="itemSta">									
										<c:if test="${groupRow.PLN_GRP_IDX eq item.PLN_GRP_IDX }">
											<li class="no_hover <c:if test="${countNum mod col == 0 }">l</c:if> <c:if test="${countNum mod col == 1 }">f</c:if>" >
												<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="${item.PLN_PRD_MST_CD }" />&planIdx=<c:out value="${commandMap.PLN_MST_IDX }" />" >
													<i class="ico_best<fmt:formatNumber value="${item.RNK_NUM}" pattern="00"/>"><span class="blind">best <fmt:formatNumber value="${item.RNK_NUM}" pattern="00"/></span></i>
													<img src="<c:out value="${cdnDomain }${groupRow.PLN_GRP_COL ne '4' ? item.IMG_THUMBNAIL_BIG : item.IMG_THUMBNAIL }"/>" alt="<c:out value="${item.PRD_MST_NM_SUB}" />" >
													<span class="ti"><c:out value="${item.PRD_MST_NM_SUB}" /></span>
													<c:if test="${item.PRD_MST_ERP_DSP_PRC > item.PRD_MST_DSP_PRC }">
													<strong class="pr_m"><strong><fmt:formatNumber value="${item.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
													</c:if>
													<c:choose>
														<c:when test="${item.PRD_MST_PRC eq  item.PRD_MST_DSP_PRC}">
															<strong class="sel_m"><strong><fmt:formatNumber value="${item.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></strong>
														</c:when>
														<c:otherwise>
															<strong class="sel_m"><strong class="co_red"><fmt:formatNumber value="${item.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong><span class="co_red">원</span></strong>
														</c:otherwise>
													</c:choose>	
													
													<c:if test="${item.REP_CNT > 0 }">
													<span class="star_box">
														<i class="ico_star3">
															<i class="star_<c:out value="${item.REP_POINT_GRD }" />"><span class="blind">별점 <c:out value="${item.REP_POINT }" />점</span></i>
														</i>
														<strong class="re_num"><c:out value="${item.REP_CNT }" />개</strong>
													</span>
													</c:if>
													<span class="ico_box">
														<ui:replaceLineBreak content="${item.PRD_MST_ICON_LIST }"/>
													</span>
												</a>
											</li>
											<c:set var="countNum" value="${countNum  + 1}" /> 
										</c:if>
									</c:forEach>
								</ol>
							</dd>
						</dl>
						</c:if>
						<!--// .exhi_lists E -->
                   	</c:forEach>
				</c:when>
			</c:choose>
			
		</div><!--// .contents E -->
	</article>
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

$(function(){
    // 해당 브랜드 다른 event로 이동
    $(document).on("change", "#ingPlanList", function(){
        var PLN_MST_IDX = $(this).val("code");
        if(PLN_MST_IDX != ""){
            location.href = "<c:out value="${frontDomain}"/>/pc/event/planProductList.do?PLN_MST_IDX="+PLN_MST_IDX;			
        }
    });
    
    //목록
    $(document).on("click","#goList",function()
    {
        $("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/event/planList.do", "target":"_self", "method":"get"}).submit();
    });
    
    
    // sns kakostory
    goProductKakaoStory = function(){
        var paramUrl = "<c:out value="${frontDomain}"/>/pc/event/planProductList.do?PLN_MST_IDX=<c:out value="${commandMap.PLN_MST_IDX }" />";
        var url = 'https://story.kakao.com/share?url='+encodeURIComponent(paramUrl); 
        window.open(url,'kakoStory','toolbar=0,status=0,width=1024,height=665'); 
    };
    
    // sns Twitter
    goProductTwitter = function(){
        var paramUrl = "<c:out value="${frontDomain}"/>/pc/event/planProductList.do?PLN_MST_IDX=<c:out value="${commandMap.PLN_MST_IDX }" />";
        var url = encodeURIComponent(paramUrl);
        var text = encodeURIComponent("<c:out value="${planInfo.PLN_MST_TITLE }"/>");
        window.open("https://twitter.com/share?url="+url+"&text="+text, "twitter", "width=650, height=400");
    };
    
    // sns facebook
    goProductFacebook = function(){ 
        var paramUrl = "<c:out value="${frontDomain}"/>/pc/event/planProductList.do?PLN_MST_IDX=<c:out value="${commandMap.PLN_MST_IDX }" />"; 
        var text = encodeURIComponent("<c:out value="${planInfo.PLN_MST_TITLE }"/>");
        var url = 'http://www.facebook.com/sharer.php?u='+encodeURIComponent(paramUrl)+'&t='+text;
        window.open(url,'faceBook','toolbar=0,status=0,width=1024,height=665'); 
    }; 
    
    // sns Pinterest
    goProductPinterest = function(){ 
        var sImg = "<c:out value="${cdnDomain }${planInfo.CMM_FLE_ATT_PATH}${planInfo.CMM_FLE_SYS_NM }" />";
        var paramUrl = "<c:out value="${frontDomain}"/>/pc/event/planProductList.do?PLN_MST_IDX=<c:out value="${commandMap.PLN_MST_IDX }" />"; 
        //var sImg = "http://image.etland.co.kr/etlandbo/product/images/1094709_M1.jpg";
        //var paramUrl = "http://www.etland.co.kr/etland/servlet/fs.EtlandServlet_FS?tc=c.cmd.FSC_renew_shop_cmd&gb=CS_DTAL&PRD_CD=1093147";
        var text = encodeURIComponent("<c:out value="${planInfo.PLN_MST_TITLE }"/>");
        var url = 'http://www.pinterest.com/pin/create/button/?url='+encodeURIComponent(paramUrl)+"&amp;media="+encodeURIComponent(sImg)+"&amp;description="+encodeURIComponent(text);
        window.open(url,'pinterest','toolbar=0,status=0,width=1024,height=800'); 
    };
    
    // 관심등록
    insertKeepingContents = function(MEM_CTS_GBN_IDX){
        $.ajax({
            async : false,
            type : "POST",
            data : {
                "MEM_CTS_GBN_IDX" : MEM_CTS_GBN_IDX
                ,"MEM_CTS_GBN" : "P" //기획전:P, 이벤트:E, 매거진:M
            },
            url : "<c:out value="${frontDomain}" />/pc/contents/insertInterestContentsAjax.do",
            success : function(data) {
                var result = data.result;//0:로그인 필요 1:성공 -1:실패
                if(result == 0){
                    if(confirm(data.resultMsg)){
                        var url = location.href;
                        url = encodeURIComponent(url);
                        window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
                    }
                }else{
                    alert(data.resultMsg);
                }
            },
            error : function(err) {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
                window.jquery
                        || console
                                .log('오류가 발생하였습니다: ' + err.status);
            }
        });
    };
});

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>