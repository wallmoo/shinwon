<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: emagazine 페이지
* @original author: SearchTool
*/
	thisCollection = "emagazine";
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
                String SUBSTR_MGZ_MST_CPY       = wnsearch.getField(thisCollection,"SUBSTR_MGZ_MST_CPY",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				MGZ_MST_TITLE= wnsearch.getKeywordHl(MGZ_MST_TITLE,"<font color=red>","</font>");
				MGZ_MST_CTS= wnsearch.getKeywordHl(MGZ_MST_CTS,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
			
			<c:set var="kid" value="<%=MGZ_MST_KID%>" />
					 	<%if((idx==0) || (idx==4) || (idx==8) || (idx==12)){%>
					 		<c:choose>
					 			<c:when test="${kid eq 'T'}">
									<a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<%=MGZ_MST_IDX%>&searchMgzMstCtg=<%=MGZ_MST_CTG%>" class="f tx_st">
								</c:when>
								<c:otherwise>
									<a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<%=MGZ_MST_IDX%>&searchMgzMstCtg=<%=MGZ_MST_CTG%>" class="f">
								</c:otherwise>
							</c:choose>
						<%}else if((idx==3) || (idx==7) || (idx==11) || (idx==15)) {%>
							<c:choose>
					 			<c:when test="${kid eq 'T'}">
									<a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<%=MGZ_MST_IDX%>&searchMgzMstCtg=<%=MGZ_MST_CTG%>" class="l tx_st">
								</c:when>
								<c:otherwise>
									<a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<%=MGZ_MST_IDX%>&searchMgzMstCtg=<%=MGZ_MST_CTG%>" class="l" >
								</c:otherwise>
							</c:choose>
						<%}else{ %>
						<c:choose>
					 			<c:when test="${kid eq 'T'}">
									<a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<%=MGZ_MST_IDX%>&searchMgzMstCtg=<%=MGZ_MST_CTG%>" class="tx_st">
								</c:when>
								<c:otherwise>
									<a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<%=MGZ_MST_IDX%>&searchMgzMstCtg=<%=MGZ_MST_CTG%>">
								</c:otherwise>
						</c:choose>
						<%} %>
						<c:set var="name" value="<%=MGZ_MST_CTG_NM%>" />
								<c:choose>
								    <c:when test="${name eq '구매가이드'}">
								      <i class="ico_guide">구매가이드</i>
								    </c:when>
								    <c:when test="${name eq '라이프가이드'}">
								        <i class="ico_life">라이프가이드</i>
								    </c:when>
								    <c:when test="${name eq 'Stuff'}">
								        <i class="ico_stuff">Stuff</i>
								    </c:when>
								    <c:when test="${name eq '상품리뷰'}">
								         <i class="ico_review">상품리뷰</i>
								    </c:when>
								     <c:when test="${name eq '상품뉴스'}">
								         <i class="ico_news">상품뉴스</i>
								    </c:when>
								     <c:when test="${name eq '테마가이드'}">
								        <i class="ico_theme">테마</i>
								    </c:when>
								    <c:otherwise>
								    </c:otherwise>
								</c:choose>
							
							<%--M:동영상 썸네일일때 / S:이미지일때 / T:텍스트 --%>
							<c:choose>
								<c:when test="${kid eq 'M' }">
									<span class="movie"><em class="blind">동영상 게시물</em></span>
									<span class="thumb"><img src="<c:out value="${cdnDomain}" /><%=IMG_PATH_PC%>" alt=""></span>
									<strong class="tx_doc"><%=MGZ_MST_TITLE%></strong>
									<span class="desc"><%=SUBSTR_MGZ_MST_CPY%></span>
								</c:when>
								<c:when test="${kid eq 'S' }">
									<img src="<c:out value="${cdnDomain}" /><%=IMG_PATH_PC%>" alt="">
									<strong class="tx_doc"><%=MGZ_MST_TITLE%></strong>
									<span class="desc"><%=SUBSTR_MGZ_MST_CPY%></span>
								</c:when>
								<c:when test="${kid eq 'T' }">
									<strong><%=MGZ_MST_TITLE%></strong>
									<span class="desc"><%=SUBSTR_MGZ_MST_CPY%></span>								
								</c:when>
							</c:choose>
							
						<%-- 	<c:choose>
					 			<c:when test="${kid eq 'T'}">
									<strong><%=MGZ_MST_TITLE%></strong>
								</c:when>
								<c:otherwise>
									<strong class="tx_doc"><%=MGZ_MST_TITLE%></strong>
								</c:otherwise>
						</c:choose>
							<%if(MGZ_MST_CPY.equals("")){ %>
							<span class="desc">&nbsp;</span>
							<%}else{ %>
							<span class="desc"><%=MGZ_MST_CPY%></span>
							<%} %> --%>
						</a> 
						
 <%
			}
%>
				
<%
			
		}
	}
%>