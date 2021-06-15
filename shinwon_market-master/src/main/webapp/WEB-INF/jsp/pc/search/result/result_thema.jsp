<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: thema 페이지
* @original author: SearchTool
*/
	thisCollection = "thema";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String MGZ_MST_IDX              = wnsearch.getField(thisCollection,"MGZ_MST_IDX",idx,false);
                String MGZ_MST_THM_CTG1         = wnsearch.getField(thisCollection,"MGZ_MST_THM_CTG1",idx,false);
                String MGZ_MST_THM_CTG1_NM      = wnsearch.getField(thisCollection,"MGZ_MST_THM_CTG1_NM",idx,false);
                String MGZ_MST_THM_CTG2         = wnsearch.getField(thisCollection,"MGZ_MST_THM_CTG2",idx,false);
                String MGZ_MST_THM_CTG2_NM      = wnsearch.getField(thisCollection,"MGZ_MST_THM_CTG2_NM",idx,false);
                String MGZ_MST_THM_CTG3         = wnsearch.getField(thisCollection,"MGZ_MST_THM_CTG3",idx,false);
                String MGZ_MST_THM_CTG3_NM      = wnsearch.getField(thisCollection,"MGZ_MST_THM_CTG3_NM",idx,false);
                String MGZ_MST_GBN              = wnsearch.getField(thisCollection,"MGZ_MST_GBN",idx,false);
                String MGZ_MST_TITLE            = wnsearch.getField(thisCollection,"MGZ_MST_TITLE",idx,false);
                String MGZ_MST_REG_DT           = wnsearch.getField(thisCollection,"MGZ_MST_REG_DT",idx,false);
                String MGZ_MST_CNT              = wnsearch.getField(thisCollection,"MGZ_MST_CNT",idx,false);
                String MGZ_MST_REG_NM           = wnsearch.getField(thisCollection,"MGZ_MST_REG_NM",idx,false);
                String MGZ_MST_YN               = wnsearch.getField(thisCollection,"MGZ_MST_YN",idx,false);
                String MGZ_MST_CTS              = wnsearch.getField(thisCollection,"MGZ_MST_CTS",idx,false);
                String CMM_FLE_SAVE_PATH        = wnsearch.getField(thisCollection,"CMM_FLE_SAVE_PATH",idx,false);
                
                String MGZ_MST_CPY          	= wnsearch.getField(thisCollection,"MGZ_MST_CPY",idx,false);
                String MGZ_MST_CTG_NM           = wnsearch.getField(thisCollection,"MGZ_MST_CTG_NM",idx,false);
                String MGZ_MST_KID              = wnsearch.getField(thisCollection,"MGZ_MST_KID",idx,false);
                String MGZ_MST_CTG        		= wnsearch.getField(thisCollection,"MGZ_MST_CTG",idx,false);
                
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
               
				MGZ_MST_TITLE= wnsearch.getKeywordHl(MGZ_MST_TITLE,"<font color=red>","</font>");
				MGZ_MST_CPY= wnsearch.getKeywordHl(MGZ_MST_CPY,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";
%>
		
			<%if(idx%4==0){ %>
				<li class="f">
			<%}else if(idx%4==3){%>
				<li class="l">
			<%}else{ %>
				<li>
			<%} %>
					<a href="javascript:void(0)" onclick="goDetail('<%=MGZ_MST_IDX %>'); return false;">
						<img src="<c:out value="${cdnDomain}" /><%=CMM_FLE_SAVE_PATH %>" alt="" />
						<strong><%=MGZ_MST_TITLE %></strong>
						<span><%=MGZ_MST_CPY%></span>
					</a>
				</li>
 		<%}%><!-- for문 -->
 		
 		<%}else{ %>
 		<li class="no_list">
			<strong>검색결과가 없습니다.</strong>
		</li>
 		
<%
		}//thistotal if문
	}
%>