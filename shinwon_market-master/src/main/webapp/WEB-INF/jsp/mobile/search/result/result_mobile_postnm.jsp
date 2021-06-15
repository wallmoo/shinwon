<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: mobile_postnm 페이지
* @original author: SearchTool
*/
	thisCollection = "mobile_postnm";
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		int count = wnsearch.getResultCount(thisCollection);
		int thisTotalCount = wnsearch.getResultTotalCount(thisCollection);

		if ( thisTotalCount > 0 ) {
%>
			
<%
			for(int idx = 0; idx < count; idx ++) {
                String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
                String BASE_ZONE                = wnsearch.getField(thisCollection,"BASE_ZONE",idx,false);
                String SIDO                     = wnsearch.getField(thisCollection,"SIDO",idx,false);
                String SIGUNGU                  = wnsearch.getField(thisCollection,"SIGUNGU",idx,false);
                String BUBJUNG_DONG             = wnsearch.getField(thisCollection,"BUBJUNG_DONG",idx,false);
                String DORO                     = wnsearch.getField(thisCollection,"DORO",idx,false);
                String BUILDING1                = wnsearch.getField(thisCollection,"BUILDING1",idx,false);
                String BUILDING2                = wnsearch.getField(thisCollection,"BUILDING2",idx,false);
                String JIBUN1                   = wnsearch.getField(thisCollection,"JIBUN1",idx,false);
                String JIBUN2                   = wnsearch.getField(thisCollection,"JIBUN2",idx,false);
                String MOUNT_YN                 = wnsearch.getField(thisCollection,"MOUNT_YN",idx,false);
                String SIGUNGU_BUILDING         = wnsearch.getField(thisCollection,"SIGUNGU_BUILDING",idx,false);
                String DORO_ADDR                = wnsearch.getField(thisCollection,"DORO_ADDR",idx,false);
                String JIBUN_ADDR               = wnsearch.getField(thisCollection,"JIBUN_ADDR",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
					<tr tabindex="0">
						<td rowspan="2" class="f"><%=idx+1 %></td>
						<td rowspan="2"><%=BASE_ZONE %></td>
						<td class="td_add"><span class="ico_tx btn_gre2">도로명</span>
						<a href="javascript:setDoroAddrInfo(<c:out value="<%=idx %>"/>);"class="doroInfo" data-doro="<c:out value="<%=DORO_ADDR %>"/>" data-zip="<c:out value="<%=BASE_ZONE%>"/>" data-jibun="<c:out value="<%=JIBUN_ADDR %>"/>" > 	<c:out value="<%=DORO_ADDR%>"/>
							                		</a></td>
					</tr>
					<tr tabindex="0">
						<td class="td_add"><span class="ico_tx btn_gre3">지번</span><%=JIBUN_ADDR %></td>
					</tr>
<%}%>
		<%}else{%>
					<tr tabindex="0">
						<td class="no_list" colspan="3">검색 결과가 없습니다.</td>
					</tr>
		
<%
		}
	}
%>