<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: m_emagazine 페이지
* @original author: SearchTool
*/
	thisCollection = "m_emagazine";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String MGZ_MST_IDX              = wnsearch.getField(thisCollection,"MGZ_MST_IDX",idx,false);
                String MGZ_MST_TITLE            = wnsearch.getField(thisCollection,"MGZ_MST_TITLE",idx,false);
                String MGZ_MST_CTS              = wnsearch.getField(thisCollection,"MGZ_MST_CTS",idx,false);
                String MGZ_MST_CPY              = wnsearch.getField(thisCollection,"MGZ_MST_CPY",idx,false);
                String MGZ_MST_CTG_NM           = wnsearch.getField(thisCollection,"MGZ_MST_CTG_NM",idx,false);
                String MGZ_MST_CTG              = wnsearch.getField(thisCollection,"MGZ_MST_CTG",idx,false);
                String IMG_PATH_PC              = wnsearch.getField(thisCollection,"IMG_PATH_PC",idx,false);
                String IMG_PATH_MB              = wnsearch.getField(thisCollection,"IMG_PATH_MB",idx,false);
                String IMG_PATH_PC_ALT          = wnsearch.getField(thisCollection,"IMG_PATH_PC_ALT",idx,false);
                String IMG_PATH_MB_ALT          = wnsearch.getField(thisCollection,"IMG_PATH_MB_ALT",idx,false);
                String MGZ_MST_KID              = wnsearch.getField(thisCollection,"MGZ_MST_KID",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				MGZ_MST_TITLE= wnsearch.getKeywordHl(MGZ_MST_TITLE,"<font color=red>","</font>");
				MGZ_MST_CTS= wnsearch.getKeywordHl(MGZ_MST_CTS,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
	
						<%if(idx%2==0){%>
						<li class="ui-block-a">
							<a href="<c:out value="${mobileDomain}" />/mobile/contents/emagazineView.do?MGZ_MST_IDX=<%=MGZ_MST_IDX%>&searchMgzMstCtg=<%=MGZ_MST_CTG%>">
						<%}else{ %>
						<li class="ui-block-b">
							<a href="<c:out value="${mobileDomain}" />/mobile/contents/emagazineView.do?MGZ_MST_IDX=<%=MGZ_MST_IDX%>&searchMgzMstCtg=<%=MGZ_MST_CTG%>">
						<%} %>
								<c:set var="name" value="<%=MGZ_MST_CTG_NM%>" />
								<c:choose>
								    <c:when test="${name eq '구매가이드'}">
								      <i class="ico_purch"><span>구매가이드</span></i>
								    </c:when>
								    <c:when test="${name eq '라이프가이드'}">
								        <i class="ico_life"><span>라이프가이드</span></i>
								    </c:when>
								    <c:when test="${name eq 'Stuff'}">
								        <i class="ico_stuff"><span>Stuff</span></i>
								    </c:when>
								    <c:when test="${name eq '상품리뷰'}">
								         <i class="ico_review"><span>상품리뷰</span></i>
								    </c:when>
								     <c:when test="${name eq '상품뉴스'}">
								         <i class="ico_prNew"><span>상품뉴스</span></i>
								    </c:when>
								    <c:when test="${name eq '테마가이드'}">
								        <i class="ico_thema">테마</i>
								    </c:when>
								    <c:otherwise>
								    </c:otherwise>
								</c:choose>
							<img src="<c:out value="${cdnDomain}" /><%=IMG_PATH_PC%>" alt="">
							<strong class="tx_doc tx_ti"><%=MGZ_MST_TITLE%></strong>
							<%if(MGZ_MST_CPY.equals("")){ %>
							<span>&nbsp;</span>
							<%}else{ %>
							<span class="tx_con"><%=MGZ_MST_CPY%></span>
							<%} %>
						</a> 
					</li>	
					
				
<%
			}
		}
	}
%>