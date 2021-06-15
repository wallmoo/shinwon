<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: m_product 페이지
* @original author: SearchTool
*/
	thisCollection = "m_product";
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
                String PRD_MST_SEL_CNT            = wnsearch.getField(thisCollection,"PRD_MST_SEL_CNT",idx,false);
                String ALIAS                        = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				PRD_MST_NM= wnsearch.getKeywordHl(PRD_MST_NM,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";
            
            double aPRD_NOW_DST_POINT = Double.parseDouble(PRD_NOW_DST_POINT);
%>
<%if(idx%2==0){ %>
	<ul class="ui-grid-a">
		<li class="ui-block-a">
			<a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<%=PRD_MST_CD%>&cateIdx=<%=DSP_PRD_CTG_IDX%>" class="_pg_link ui-link">
				<span class="tx_img">
				<%if(PRD_MST_SEL_CNT.equals("0")){ %>
					<span class="sold_out"><i>일시품절</i></span>
				<%} %>	
				<img data-original="<c:out value="${cdnDomain}" />/<%=PRD_IMAGE%>" src="<c:out value="${cdnDomain}" />/<%=PRD_IMAGE%>" alt="상품 사진" /></span>
				<span class="tx_ti"><%=PRD_MST_NM%></span>
				<c:choose>
					<%--기업회원1등급 --%>
					<c:when test="${commandMap.MEM_MST_MEM_GBN =='683' && commandMap.MEM_MST_MEM_GRD =='1838'}">
							<%if(aPRD_NOW_DST_POINT>0){%>
									<strong class="co_red"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC1%>" groupingUsed="true" /><span>원</span>
							<%}else{ %>		
									<strong class="tx_price"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC1%>" groupingUsed="true" /><span>원</span>
							<%} %>
					</c:when>
					<%--기업회원2등급 --%>
					<c:when test="${commandMap.MEM_MST_MEM_GBN =='683' && commandMap.MEM_MST_MEM_GRD =='1839'}">
							<%if(aPRD_NOW_DST_POINT>0){%>
									<strong class="co_red"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC2%>" groupingUsed="true" /><span>원</span>
							<%}else{ %>	
									<strong class="tx_price"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC2%>" groupingUsed="true" /><span>원</span>
							<%} %>
					</c:when>
					<c:otherwise>
							<%if(aPRD_NOW_DST_POINT>0){%>
									<strong class="co_red"><fmt:formatNumber value="<%=PRD_MST_PRICE%>" groupingUsed="true" /><span>원</span>
							<%}else{ %>
									<strong class="tx_price"><fmt:formatNumber value="<%=PRD_MST_PRICE%>" groupingUsed="true" /><span>원</span>
							<%} %>
					</c:otherwise>
				</c:choose>
				
				<%if(!PRD_CPN_DST_POINT.equals("0")){ %>					
					<em class="discount">
						<span class="blind">할인률</span>
						<strong class="tx_num"><%=PRD_CPN_DST_POINT %></strong>%
					</em>
				<%} %>
				</strong>
			</a>
		</li>
<%}else{ %>
		<li class="ui-block-b">
			<a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<%=PRD_MST_CD%>&cateIdx=<%=DSP_PRD_CTG_IDX%>" class="_pg_link ui-link">
				<span class="tx_img">
				<%if(PRD_MST_SEL_CNT.equals("0")){ %>
					<span class="sold_out"><i>일시품절</i></span>
				<%} %>
				<img data-original="<c:out value="${cdnDomain}" />/<%=PRD_IMAGE%>" src="<c:out value="${cdnDomain}" />/<%=PRD_IMAGE%>" alt="상품 사진" /></span>
				<span class="tx_ti"><%=PRD_MST_NM%></span>
				<c:choose>
					<%--기업회원1등급 --%>
					<c:when test="${commandMap.MEM_MST_MEM_GBN =='683' && commandMap.MEM_MST_MEM_GRD =='1838'}">
							<%if(aPRD_NOW_DST_POINT>0){%>
									<strong class="co_red"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC1%>" groupingUsed="true" /><span>원</span>
							<%}else{ %>		
									<strong class="tx_price"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC1%>" groupingUsed="true" /><span>원</span>
							<%} %>
					</c:when>
					<%--기업회원2등급 --%>
					<c:when test="${commandMap.MEM_MST_MEM_GBN =='683' && commandMap.MEM_MST_MEM_GRD =='1839'}">
							<%if(aPRD_NOW_DST_POINT>0){%>
									<strong class="co_red"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC2%>" groupingUsed="true" /><span>원</span>
							<%}else{ %>	
									<strong class="tx_price"><fmt:formatNumber value="<%=PRD_MST_CPR_PRC2%>" groupingUsed="true" /><span>원</span>
							<%} %>
					</c:when>
					<c:otherwise>
							<%if(aPRD_NOW_DST_POINT>0){%>
									<strong class="co_red"><fmt:formatNumber value="<%=PRD_MST_PRICE%>" groupingUsed="true" /><span>원</span>
							<%}else{ %>
									<strong class="tx_price"><fmt:formatNumber value="<%=PRD_MST_PRICE%>" groupingUsed="true" /><span>원</span>
							<%} %>
					</c:otherwise>
				</c:choose>
				
				<%if(!PRD_CPN_DST_POINT.equals("0")){ %>					
					<em class="discount">
						<span class="blind">할인률</span>
						<strong class="tx_num"><%=PRD_CPN_DST_POINT %></strong>%
					</em>
				<%} %>
				</strong>
			</a>
		</li>
<%} %>
<%
	if(idx % 2 == 1 || idx == count - 1){ 
%>
	</ul>
<%		
	}
%>
 <%
			}
%>
<%
		}
	}
%>