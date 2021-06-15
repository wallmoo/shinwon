<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: m_review 페이지
* @original author: SearchTool
*/
	thisCollection = "m_review";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String PRD_REV_IDX              = wnsearch.getField(thisCollection,"PRD_REV_IDX",idx,false);
                String PRD_PRD_MST_CD           = wnsearch.getField(thisCollection,"PRD_PRD_MST_CD",idx,false);
                String PRD_REV_TITLE            = wnsearch.getField(thisCollection,"PRD_REV_TITLE",idx,false);
                String PRD_REV_CONTENTS         = wnsearch.getField(thisCollection,"PRD_REV_CONTENTS",idx,false);
                String PRD_REV_FNC_STAR         = wnsearch.getField(thisCollection,"PRD_REV_FNC_STAR",idx,false);
                String PRD_REV_PRC_STAR         = wnsearch.getField(thisCollection,"PRD_REV_PRC_STAR",idx,false);
                String PRD_REV_SCORE_STAR       = wnsearch.getField(thisCollection,"PRD_REV_SCORE_STAR",idx,false);
                String PRD_REV_AVG_STAR         = wnsearch.getField(thisCollection,"PRD_REV_AVG_STAR",idx,false);
                String PRD_REV_AVG_STAR_POINT   = wnsearch.getField(thisCollection,"PRD_REV_AVG_STAR_POINT",idx,false);
                String PRD_ORD_PRD_IDX          = wnsearch.getField(thisCollection,"PRD_ORD_PRD_IDX",idx,false);
                String PRD_REV_REG_DT           = wnsearch.getField(thisCollection,"PRD_REV_REG_DT",idx,false);
                String PRD_REV_CHN_GBN          = wnsearch.getField(thisCollection,"PRD_REV_CHN_GBN",idx,false);
                String PRD_MST_NM               = wnsearch.getField(thisCollection,"PRD_MST_NM",idx,false);
                String PRD_IMG                  = wnsearch.getField(thisCollection,"PRD_IMG",idx,false);
                String REP_CNT                  = wnsearch.getField(thisCollection,"REP_CNT",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				PRD_REV_TITLE= wnsearch.getKeywordHl(PRD_REV_TITLE,"<font color=red>","</font>");
				PRD_REV_CONTENTS= wnsearch.getKeywordHl(PRD_REV_CONTENTS,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
		<li>
			<a href="<c:out value="${mobileDomain}" />/mobile/product/product.do?prdMstCd=<%=PRD_PRD_MST_CD%>" class="pr_a">						
				<img src="<c:out value="${cdnDomain}" />/<%=PRD_IMG%>" alt="상품이미지" />
				<span class="tx_ti"><%=PRD_MST_NM%></span>
				
			<i class="ico_star0">	
		 	 <c:set var="star" value="<%=PRD_REV_AVG_STAR%>" />
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
				<span class="blind">별점 <%=PRD_REV_AVG_STAR %>점</span></i></i>
				<span class="tx_num"><span class="blind">상품후기 갯수</span>(<%=REP_CNT%>개)</span>
			</a>
			<a href="javascript:void(0)" class="re_a">	
				<%if(!PRD_REV_CHN_GBN.equals("P")){ %>
				<strong class="ti"><i class="ico_mobile"></i><%=PRD_REV_TITLE%></strong>
				<%}else{ %>
				<strong class="ti"><i class="ico_phone"><span class="blind">휴대폰으로 등록</span></i><%=PRD_REV_TITLE%></strong>
				<%} %>
				<span class="tx_con"><i class="ico_img"><span class="blind">이미지 첨부</span></i><%=PRD_REV_CONTENTS%></span>
			</a>
		</li>

<%
			}
		}
	}
%>