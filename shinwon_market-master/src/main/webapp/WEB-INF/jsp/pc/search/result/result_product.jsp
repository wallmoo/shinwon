<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import= "java.util.ArrayList" %>
<%
/*
* subject: product 페이지
* @original author: SearchTool
*/
	thisCollection = "product";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String PRD_MST_CD               = wnsearch.getField(thisCollection,"PRD_MST_CD",idx,false);
                String PRD_MST_NM               = wnsearch.getField(thisCollection,"PRD_MST_NM",idx,false);
                String PRD_MST_PRC              = wnsearch.getField(thisCollection,"PRD_MST_PRC",idx,false);
                String PRD_IMAGE                = wnsearch.getField(thisCollection,"PRD_IMAGE",idx,false);
                String PRD_IMAGE_ALT            = wnsearch.getField(thisCollection,"PRD_IMAGE_ALT",idx,false);
                String PRD_MST_ERP_DSP_PRC      = wnsearch.getField(thisCollection,"PRD_MST_ERP_DSP_PRC",idx,false);
                String ERP_MST_DSP_PRC          = wnsearch.getField(thisCollection,"ERP_MST_DSP_PRC",idx,false);
                String PRD_MST_PRICE            = wnsearch.getField(thisCollection,"PRD_MST_PRICE",idx,false);
                String PRD_MST_PC_CPN_PRC       = wnsearch.getField(thisCollection,"PRD_MST_PC_CPN_PRC",idx,false);
                String PRD_MST_LNG_DIV_YN       = wnsearch.getField(thisCollection,"PRD_MST_LNG_DIV_YN",idx,false);
                String PRD_MST_DLV_FEE          = wnsearch.getField(thisCollection,"PRD_MST_DLV_FEE",idx,false);
                String PRD_MST_O2O_YN           = wnsearch.getField(thisCollection,"PRD_MST_O2O_YN",idx,false);
                String REP_POINT                = wnsearch.getField(thisCollection,"REP_POINT",idx,false);
                String REP_CNT                  = wnsearch.getField(thisCollection,"REP_CNT",idx,false);
                String REP_POINT_GRD            = wnsearch.getField(thisCollection,"REP_POINT_GRD",idx,false);
                String PRD_NEW_ICO              = wnsearch.getField(thisCollection,"PRD_NEW_ICO",idx,false);
                String PRD_MST_OPT_EST_CNT      = wnsearch.getField(thisCollection,"PRD_MST_OPT_EST_CNT",idx,false);
                String PRD_MST_ICON_LIST        = wnsearch.getField(thisCollection,"PRD_MST_ICON_LIST",idx,false);
                String PRD_MST_SIKR_ICON        = wnsearch.getField(thisCollection,"PRD_MST_SIKR_ICON",idx,false);
                String PRD_MST_ERP_PRC          = wnsearch.getField(thisCollection,"PRD_MST_ERP_PRC",idx,false);
                String PRD_MST_OFF_ALL_CNT      = wnsearch.getField(thisCollection,"PRD_MST_OFF_ALL_CNT",idx,false);
                String PRD_MST_SEL_STATE        = wnsearch.getField(thisCollection,"PRD_MST_SEL_STATE",idx,false);
                String DSP_PRD_CTG_IDX          = wnsearch.getField(thisCollection,"DSP_PRD_CTG_IDX",idx,false);
                String CATE_LEV_1               = wnsearch.getField(thisCollection,"CATE_LEV_1",idx,false);
                String CATE_LEV_2               = wnsearch.getField(thisCollection,"CATE_LEV_2",idx,false);
                String CATE_LEV_3               = wnsearch.getField(thisCollection,"CATE_LEV_3",idx,false);
                String CATE_LEV_4               = wnsearch.getField(thisCollection,"CATE_LEV_4",idx,false);
                String CATE_LEV_5               = wnsearch.getField(thisCollection,"CATE_LEV_5",idx,false);
                String CATE_LEV_NM_1            = wnsearch.getField(thisCollection,"CATE_LEV_NM_1",idx,false);
                String CATE_LEV_NM_2            = wnsearch.getField(thisCollection,"CATE_LEV_NM_2",idx,false);
                String CATE_LEV_NM_3            = wnsearch.getField(thisCollection,"CATE_LEV_NM_3",idx,false);
                String CATE_LEV_NM_4            = wnsearch.getField(thisCollection,"CATE_LEV_NM_4",idx,false);
                String CATE_LEV_NM_5            = wnsearch.getField(thisCollection,"CATE_LEV_NM_5",idx,false);
                String PRD_MST_MTA_TAG1         = wnsearch.getField(thisCollection,"PRD_MST_MTA_TAG1",idx,false);
                String PRD_MST_MTA_TAG2         = wnsearch.getField(thisCollection,"PRD_MST_MTA_TAG2",idx,false);
                String PRD_MST_MTA_TAG3         = wnsearch.getField(thisCollection,"PRD_MST_MTA_TAG3",idx,false);
                String PRD_CTG_INFO             = wnsearch.getField(thisCollection,"PRD_CTG_INFO",idx,false);
                String ONLINE_HIT               = wnsearch.getField(thisCollection,"ONLINE_HIT",idx,false);
                String OFFLINE_HIT              = wnsearch.getField(thisCollection,"OFFLINE_HIT",idx,false);
                String PRD_MST_REG_DT           = wnsearch.getField(thisCollection,"PRD_MST_REG_DT",idx,false);
                String DATE                     = wnsearch.getField(thisCollection,"DATE",idx,false);
                String PRD_MST_CPR_PRC1         = wnsearch.getField(thisCollection,"PRD_MST_CPR_PRC1",idx,false);
                String PRD_MST_CPR_PRC2         = wnsearch.getField(thisCollection,"PRD_MST_CPR_PRC2",idx,false);
 				String PRD_CPN_DST_POINT         = wnsearch.getField(thisCollection,"PRD_CPN_DST_POINT",idx,false);
                String PRD_NOW_DST_POINT           = wnsearch.getField(thisCollection,"PRD_NOW_DST_POINT",idx,false);
                String SEARCH_RED_PRICE            = wnsearch.getField(thisCollection,"SEARCH_RED_PRICE",idx,false);
                String SEARCH_SILVER_PRICE         = wnsearch.getField(thisCollection,"SEARCH_SILVER_PRICE",idx,false);
                String SEARCH_GOLD_PRICE           = wnsearch.getField(thisCollection,"SEARCH_GOLD_PRICE",idx,false);
                String SEARCH_VIP_PRICE            = wnsearch.getField(thisCollection,"SEARCH_VIP_PRICE",idx,false);
                String SEARCH_PLATINUM_PRICE       = wnsearch.getField(thisCollection,"SEARCH_PLATINUM_PRICE",idx,false);
                String SEARCH_SIMPLE_PRICE         = wnsearch.getField(thisCollection,"SEARCH_SIMPLE_PRICE",idx,false);
                String PRD_MST_PRICE_ASC            = wnsearch.getField(thisCollection,"PRD_MST_PRICE_ASC",idx,false);
                String PRD_MST_SEL_CNT            = wnsearch.getField(thisCollection,"PRD_MST_SEL_CNT",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				PRD_MST_NM= wnsearch.getKeywordHl(PRD_MST_NM,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";
            	//int형으로 변환하여 숫자 비교
                int aPRD_MST_ERP_DSP_PRC = Integer.parseInt(PRD_MST_ERP_DSP_PRC);
                int aPRD_MST_PRICE = Integer.parseInt(PRD_MST_PRICE);
                int aPRD_MST_CPR_PRC1 = Integer.parseInt(PRD_MST_CPR_PRC1);
                int aPRD_MST_CPR_PRC2 = Integer.parseInt(PRD_MST_CPR_PRC2);
                double aPRD_NOW_DST_POINT = Double.parseDouble(PRD_NOW_DST_POINT);
            
%>
<%
//상품 사진icon 자르기(한정수량,신상품,즉시할인 등등)
String p1 = PRD_MST_SIKR_ICON;
if(!p1.equals("")){
	p1 = p1.substring(p1.lastIndexOf(",")+1,p1.length());
}
//이미지icon자르기(쿠폰할인,사은품,무료배송 등등)
String icons = PRD_MST_ICON_LIST;
String[] iconsResult = icons.split("&nbsp;");
%>
<%if(idx%4==0){ %>
		<li class="f">
		<%}else if(idx%4==3){ %>
		<li class="l">
		<%}else{ %>
		<li>
		<%} %>
			<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<%=PRD_MST_CD%>">
				<c:set var="name" value="<%=p1%>" />
				<%--임시품절일 때 좌측상단 표시--%>
				<%if(PRD_MST_SEL_CNT.equals("0")){ %>
					<i class="tx_soldout"><strong>일시품절</strong></i>
				<%} %>			
								<%--상품이미지 좌측상단 표시 --%>
								<c:choose>
								    <c:when test="${name eq '한정수량'}">
								      	<i class="ico_lmt"><span class="blind">한정수량</span></i>
								    </c:when>
								    <c:when test="${name eq '리퍼상품'}">
								        <i class="ico_rp"><span class="blind">리퍼상품</span></i>
								    </c:when>
								    <c:when test="${name eq '박스개봉'}">
								        <i class="ico_boxOp"><span class="blind">박스개봉</span></i>
								    </c:when>
								    <c:when test="${name eq '베스트'}">
								         <i class="ico_best"><span class="blind">베스트</span></i>
								    </c:when>
								    <c:when test="${name eq '사은품'}">
								         <i class="ico_gift"><span class="blind">사은품</span></i>
								    </c:when>
								    <c:when test="${name eq '즉시할인'}">
								         <i class="ico_sale"><span class="blind">즉시할인</span></i>
								    </c:when>
								    <c:when test="${name eq '신상품'}">
								         <i class="ico_new"><span class="blind">신상품</span></i>
								    </c:when>
								    <c:otherwise>
								    </c:otherwise>
								</c:choose>
				<img src="<c:out value="${cdnDomain}" />/<%=PRD_IMAGE%>" alt="상품사진">
				<span class="ti"><%=PRD_MST_NM%></span>
				<%-- <strong class="pr_m"><strong><fmt:formatNumber value="<%=PRD_MST_ERP_DSP_PRC%>" groupingUsed="true" /></strong><span>원</span></strong> --%>
				<%--기간계표시판가가 리스트 노출가격보다 클경우만 노출 --%> 
				<%if(aPRD_MST_ERP_DSP_PRC > aPRD_MST_PRICE){ %>
					<strong class="pr_m"><strong><fmt:formatNumber value="<%=PRD_MST_ERP_DSP_PRC%>" groupingUsed="true" /></strong><span>원</span></strong>
				<%}else if(aPRD_MST_ERP_DSP_PRC > aPRD_MST_CPR_PRC1){ %>
					<strong class="pr_m"><strong><fmt:formatNumber value="<%=PRD_MST_ERP_DSP_PRC%>" groupingUsed="true" /></strong><span>원</span></strong>
				<%}else if(aPRD_MST_ERP_DSP_PRC > aPRD_MST_CPR_PRC2){ %>
					<strong class="pr_m"><strong><fmt:formatNumber value="<%=PRD_MST_ERP_DSP_PRC%>" groupingUsed="true" /></strong><span>원</span></strong>
				<%}else{ %>
				<%} %>
			<c:choose>
				<%--기업회원1등급 --%>
				<c:when test="${commandMap.MEM_MST_MEM_GBN =='683' && commandMap.MEM_MST_MEM_GRD =='1838'}">
							
				<%if(aPRD_NOW_DST_POINT>0){%>
						<strong class="co_red"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC1%>" groupingUsed="true" /><span>원</span></strong>
				<%}else{ %>		
						<strong class="sel_m"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC1%>" groupingUsed="true" /><span>원</span></strong>
				<%} %>
				</c:when>
				<%--기업회원2등급 --%>
				<c:when test="${commandMap.MEM_MST_MEM_GBN =='683' && commandMap.MEM_MST_MEM_GRD =='1839'}">
				<%if(aPRD_NOW_DST_POINT>0){%>
						<strong class="co_red"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC2%>" groupingUsed="true" /><span>원</span></strong>
				<%}else{ %>	
						<strong class="sel_m"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC2%>" groupingUsed="true" /><span>원</span></strong>
				<%} %>
				</c:when>
				<c:otherwise>
				<%if(aPRD_NOW_DST_POINT>0){%>
						<strong class="co_red"><fmt:formatNumber value="<%=PRD_MST_PRICE%>" groupingUsed="true" /><span>원</span></strong>
				<%}else{ %>
						<strong class="sel_m"><fmt:formatNumber value="<%=PRD_MST_PRICE%>" groupingUsed="true" /><span>원</span></strong>
				<%} %>
				</c:otherwise>
			</c:choose>
			
				<span class="star_box">
					<i class="ico_star2">
			<c:set var="star" value="<%=REP_POINT_GRD%>" />
				<c:choose>
					<c:when test="${star eq 0}"><i class="star_00"></c:when>
					<c:when test="${star eq 0.5}"><i class="star_05"></c:when>
					<c:when test="${star eq 1}"><i class="star_1"></c:when>
					<c:when test="${star eq 1.5}"><i class="star_15"></c:when>
					<c:when test="${star eq 2}"><i class="star_2"></c:when>
					<c:when test="${star eq 2.5}"><i class="star_25"></c:when>
					<c:when test="${star eq 3}"><i class="star_3"></c:when>
					<c:when test="${star eq 3.5}"><i class="star_35"></c:when>
					<c:when test="${star eq 4}"><i class="star_4"></c:when>
					<c:when test="${star eq 4.5}"><i class="star_45"></c:when>
					<c:when test="${star eq 5}"><i class="star_5"></c:when>
				</c:choose>	
					
					<span class="blind"><%=REP_POINT_GRD%></span></i></i>
					<strong class="re_num"><%=REP_POINT%></strong>
				</span>
				<span class="ico_box">
				
				<%-- <%for(int i =0; i<iconsResult.length; i++){
						if(("신상품").equals(iconsResult[i])){	%>
							<span class="ico_new"><span class="ir">신상품</span></span>
						<%}else if(iconsResult[i].equals("즉시할인")){ %>
							<span class="ico_sale"><span class="ir">즉시할인</span></span>
						<%}else if(iconsResult[i].equals("장기할부")){ %>
							<span class="ico_plan"><span class="ir">장기할부</span></span>
						<%}else if(iconsResult[i].equals("사은품")){ %>
							<span class="ico_gift"><span class="ir">사은품</span></span>
						<%}else if(iconsResult[i].equals("무료배송")){ %>
							<span class="ico_free"><span class="ir">무료배송</span></span>
						<%}else if(iconsResult[i].equals("베스트")){ %>
							<span class="ico_best"><span class="ir">베스트</span></span>
						<%}else if(iconsResult[i].equals("쿠폰할인")){ %>
							<span class="ico_coupon"><span class="ir">쿠폰할인</span></span>
						<%}else if(iconsResult[i].equals("카드할인")){ %>
							<span class="ico_card"><span class="ir">카드할인</span></span>
						<%}else if(iconsResult[i].equals("겟잇나우")){ %>
							<span class="ico_getNew"><span class="ir">겟잇나우</span></span>
						<%}else{%>
							<span class="ico_soldout"><span class="ir">soldout</span></span>
						<%} %>
				<% 
				} 
				%> --%>
				<%for(int i =0; i<iconsResult.length; i++){%>
						<%=iconsResult[i]%>
				<%} %>
				</span>
			</a>
			<div class="etc_btn">
				<a href="javascript:goProductView('<%=PRD_MST_CD%>')" class="f btn_zoom"><span class="ir">상품 크게보기</span></a> 
				<a href="javascript:insertCart('<%=PRD_MST_CD%>','<%=PRD_MST_OPT_EST_CNT%>')" class="btn_cart"><span class="ir">상품 장바구니에 담기</span></a>
				<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<%=PRD_MST_CD%>&cateIdx=<%=DSP_PRD_CTG_IDX%>" target="_blank" class="btn_share"><span class="ir">상품 공유하기</span></a>
				<a href="javascript:insertKeeping('<%=PRD_MST_CD%>')" class="l btn_jjim"><span class="ir">상품 찜하기</span></a>
				<%-- <a href="javascript:goProductView('<c:out value="<%=PRD_MST_CD%>" />');" class="f btn_zoom"><span class="ir">상품 크게보기</span></a>
				<a href="javascript:insertCart('<c:out value="<%=PRD_MST_CD%>" />','<c:out value="<%=PRD_MST_OPT_EST_CNT%>" />');" class="btn_cart"><span class="ir">상품 장바구니에 담기</span></a>
				<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD}" />&cateIdx=<c:out value="${cateIdx}" />" target="_blank"" class="btn_share"><span class="ir">상품 공유하기</span></a>
				<a href="javascript:insertKeeping('<c:out value="${listProduct.PRD_MST_CD}" />');" class="l btn_jjim"><span class="ir">상품 찜하기</span></a> --%>
			</div>
		</li>   
 <%
			}
%>
<%
		}
	}
%>
