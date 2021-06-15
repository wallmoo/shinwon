<%@ page contentType="text/html; charset=UTF-8"%><%
/*
* subject: postnm 페이지
* @original author: SearchTool
*/
	thisCollection = "postnm";
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
                String POST                     = wnsearch.getField(thisCollection,"POST",idx,false);
                String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
            String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
			<tbody>
	            			<tr>
				                <td rowspan="2" class="number"><%=idx+1 %></td>
				                <td rowspan="2" class="zip"><%=BASE_ZONE%></td>
				                <th class="type" scope="row">도로명</th>
				                <td class="al">
				                	<a href="javascript:setDoroAddrInfo(<%=idx %>);" class="doroInfo" 
						                        data-doro="<%=DORO_ADDR%>" 
						                        data-zip="<%=BASE_ZONE%>" 
						                        data-jibun="<%=JIBUN_ADDR%>" >
			                			<%=DORO_ADDR%>
				                	</a>
				                </td>
				            </tr>
				            <tr>
				                <th class="type" scope="row">지번</th>
				                <td class="al">
				                	<a href="javascript:setJibunAddrInfo(<%=idx %>);" class="jibunInfo" 
						                        data-doro="<%=DORO_ADDR%>" 
						                        data-zip="<%=BASE_ZONE%>" 
						                        data-jibun="<%=JIBUN_ADDR%>" >
				                		<%=JIBUN_ADDR%>
				                	</a>
				                </td>
				            </tr>
	        </tbody>
	       
<%}%>
		<%}else{%>
			        <tr>
               			<td colspan="4">
                  			 <p class="message no-more">검색할 주소를 입력해 주세요.</p>
               			</td>
           			</tr>
<%
		}
	}
%>