<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: m_exhibitions 페이지
* @original author: SearchTool
*/
	thisCollection = "m_exhibitions";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String PLN_MST_IDX              = wnsearch.getField(thisCollection,"PLN_MST_IDX",idx,false);
                String PLN_MST_CHANNEL_PC_YN    = wnsearch.getField(thisCollection,"PLN_MST_CHANNEL_PC_YN",idx,false);
                String PLN_MST_CHANNEL_MOBILE_YN  = wnsearch.getField(thisCollection,"PLN_MST_CHANNEL_MOBILE_YN",idx,false);
                String PLN_MST_TITLE            = wnsearch.getField(thisCollection,"PLN_MST_TITLE",idx,false);
                String PLN_MST_ST_DT            = wnsearch.getField(thisCollection,"PLN_MST_ST_DT",idx,false);
                String PLN_MST_ED_DT            = wnsearch.getField(thisCollection,"PLN_MST_ED_DT",idx,false);
                String PLN_MST_ST_HH            = wnsearch.getField(thisCollection,"PLN_MST_ST_HH",idx,false);
                String PLN_MST_ED_HH            = wnsearch.getField(thisCollection,"PLN_MST_ED_HH",idx,false);
                String PLN_MST_ST_MI            = wnsearch.getField(thisCollection,"PLN_MST_ST_MI",idx,false);
                String PLN_MST_ED_MI            = wnsearch.getField(thisCollection,"PLN_MST_ED_MI",idx,false);
                String PLN_MST_PC_BANNER        = wnsearch.getField(thisCollection,"PLN_MST_PC_BANNER",idx,false);
                String PLN_MST_MOBILE_BANNER    = wnsearch.getField(thisCollection,"PLN_MST_MOBILE_BANNER",idx,false);
                String PC_ATT_PATH              = wnsearch.getField(thisCollection,"PC_ATT_PATH",idx,false);
                String PC_SYS_NM                = wnsearch.getField(thisCollection,"PC_SYS_NM",idx,false);
                String PC_ALT_TXT               = wnsearch.getField(thisCollection,"PC_ALT_TXT",idx,false);
                String MOBILE_ATT_PATH          = wnsearch.getField(thisCollection,"MOBILE_ATT_PATH",idx,false);
                String MOBILE_SYS_NM            = wnsearch.getField(thisCollection,"MOBILE_SYS_NM",idx,false);
                String MOBILE_ALT_TXT           = wnsearch.getField(thisCollection,"MOBILE_ALT_TXT",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				PLN_MST_TITLE= wnsearch.getKeywordHl(PLN_MST_TITLE,"<font color=red>","</font>");
				PLN_MST_PC_BANNER= wnsearch.getKeywordHl(PLN_MST_PC_BANNER,"<font color=red>","</font>");
				PLN_MST_MOBILE_BANNER= wnsearch.getKeywordHl(PLN_MST_MOBILE_BANNER,"<font color=red>","</font>");
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
					<li>
						<a href="<c:out value="${mobileDomain}" />/mobile/event/planProductList.do?PLN_MST_IDX=<%=PLN_MST_IDX%>">
							<img src="<c:out value="${cdnDomain}" /><%=PC_ATT_PATH%><%=PC_SYS_NM%>" alt="" />
							<strong class="tx_ti"><%=PLN_MST_TITLE%></strong>
							<span class="tx_date"><ui:formatDate value="<%=PLN_MST_ST_DT%>" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="<%=PLN_MST_ED_DT%>" pattern="yyyy.MM.dd"/></span>						
						</a>
					</li>
			
			
			
<%
			}
		}
	}
%>