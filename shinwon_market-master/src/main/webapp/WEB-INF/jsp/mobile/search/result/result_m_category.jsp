<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: m_category 페이지
* @original author: SearchTool
*/
	thisCollection = "m_category";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
			<div class="sectit">
				<h2><%=wnsearch.getCollectionKorName(thisCollection)%></h2>
				<p>| 검색결과 <%=numberFormat(thisTotalCount)%>건</p>
			</div>
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String PRD_CTG_IDX              = wnsearch.getField(thisCollection,"PRD_CTG_IDX",idx,false);
                String PRD_CTG_NM               = wnsearch.getField(thisCollection,"PRD_CTG_NM",idx,false);
                String PRD_CTG_LEVEL            = wnsearch.getField(thisCollection,"PRD_CTG_LEVEL",idx,false);
                String PRD_CTG_UP_IDX           = wnsearch.getField(thisCollection,"PRD_CTG_UP_IDX",idx,false);
                String PRD_CTG_TOP_IDX          = wnsearch.getField(thisCollection,"PRD_CTG_TOP_IDX",idx,false);
                String PRD_CTG_ENV              = wnsearch.getField(thisCollection,"PRD_CTG_ENV",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
				<dl class="resultsty1">
					<dt>
					</dt>
              <dd class="lh18"> DOCID : <%=DOCID%></dd>
              <dd class="lh18"> PRD_CTG_IDX : <%=PRD_CTG_IDX%></dd>
              <dd class="lh18"> PRD_CTG_NM : <%=PRD_CTG_NM%></dd>
              <dd class="lh18"> PRD_CTG_LEVEL : <%=PRD_CTG_LEVEL%></dd>
              <dd class="lh18"> PRD_CTG_UP_IDX : <%=PRD_CTG_UP_IDX%></dd>
              <dd class="lh18"> PRD_CTG_TOP_IDX : <%=PRD_CTG_TOP_IDX%></dd>
              <dd class="lh18"> PRD_CTG_ENV : <%=PRD_CTG_ENV%></dd>
              <dd class="lh18"> ALIAS : <%=ALIAS%></dd>
				</dl>
 <%
			}

			if ( collection.equals("ALL") && thisTotalCount > TOTALVIEWCOUNT ) {
%>
				<div class="moreresult"><a href="#none" onClick="javascript:doCollection('<%=thisCollection%>');">더보기</a></div>
<%
			}
		}
	}
%>