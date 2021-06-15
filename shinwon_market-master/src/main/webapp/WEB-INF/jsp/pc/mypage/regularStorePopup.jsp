<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
<body class="page-popup"><!-- page-popup : 600x300 -->

	<div id="skipNavigation">
	    <a href="#contents">컨텐츠 바로가기</a>
	</div>
	
	<div id="popContainer"><!-- popContainer -->

    <h3 class="title">
        <span>단골샵 설정</span>
        <a href="javascript:;" class="close js-close"><span class="icon"><em>창 닫기</em></span></a>
    </h3>

    <div id="popWrapper"><!-- popWrapper -->

        <p>
            고객님의 자주 이용하는 샵을 설정하실 수 있습니다.(샵은 1개만 선택 가능합니다.)
        </p>

        <div class="favorite-search"><!-- favorite-search -->
            <!-- 
    		<select id="si" class="select">
    			<option value="" >시/도 선택</option>
		        <c:if test="${not empty storeAreaList }">
			        <c:forEach var="storeAreaRow" items="${storeAreaList }" varStatus="i">
						<option value="${storeAreaRow.AREA_CD}" <c:if test="${storeAreaRow.AREA_CD eq commandMap.searchAreaCd}">selected="selected"</c:if>>
							<c:out value="${storeAreaRow.AREA_NM }"/>
						</option>
			        </c:forEach>
		        </c:if>
		    </select>	
	    	
            <a href="javascript:;" id="searchRegularStore" class="button primary small"><span>검색</span></a>
             -->
                  현재단골샵 : ${empty regularStore.BCNC_NM ? '양재점' : regularStore.BCNC_NM }
        </div><!-- // favorite-search -->

        <table class="table-col table-a table-favorite-shop" cellspacing="0"><!-- table-col -->
	        <caption></caption>
	        <colgroup>
	            <col style="width:8%;" />
	            <col style="width:13%;" />
	            <col style="width:auto;" />
	            <col style="width:20%;" />
	        </colgroup>
	        <thead>
	            <tr>
	                <th><span>선택</span></th>
	                <th><span>샵명</span></th>
	                <th><span>주소</span></th>
	                <th><span>전화번호</span></th>
	        </thead>
	        <tbody>
	            <c:choose>
	            	<c:when test="${commandMap.searchYn eq 'Y' }">
	           			<c:choose>
			            	<c:when test="${not empty regularStoreList }">
			            		<c:forEach var="regularStoreRow" items="${regularStoreList }" varStatus="i">
									<tr><!-- row -->
						                <td><input type="radio" class="radio" name="storeRadio" value="${regularStoreRow.BCNC_CD}" data-bcnc_nm="${regularStoreRow.BCNC_NM}"/></td>
						                <td>
						                	<c:out value="${regularStoreRow.BCNC_NM }"/>
						                </td>
						                <td class="text-left">
						                    <c:out value="${regularStoreRow.ADDR2 }"/>
						                </td>
						                <td>
						                	<c:out value="${regularStoreRow.TEL }"/>
						                </td>
					            	</tr><!-- // row -->	            		
			            		</c:forEach>
			            	</c:when>
			            	<c:otherwise>
			         			<tr>
			           				<td colspan="4">조회된 매장 없습니다.</td>
			           			</tr>
			            	</c:otherwise>
			            </c:choose>
	            	</c:when>
	            	<c:otherwise>
	            		<tr>
	           				<td colspan="4">지역을 검색해주세요.</td>
	           			</tr>	
	            	</c:otherwise>
	            </c:choose>
	        </tbody>
        </table><!-- // table-col -->

        <form id="frm" name="frm">
	        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	        <input type="hidden" name="BCNC_NM" value=""/>
	        <input type="hidden" name="BCNC_CD" value=""/>
	        <input type="hidden" name="searchYn" value="Y"/>
	        <input type="hidden" name="searchAreaCd" value="<c:out value="${commandMap.searchAreaCd }"/>"/>
	        
	        <div class="section-pagination"><!-- section pagination -->
			<!--   	<ui:frontpaging paging="${paging }" jsFunction="goPage" />  -->
	        </div><!-- // section pagination -->
	        
      	</form>

        <div class="section-button">
            <a href="javascript:self.close();" class="button primary large"><span>닫기</span></a>
            <a href="javascript:;" id="goRegist" class="button warning large"><span>저장</span></a>
        </div>

    </div><!-- // popWrapper -->
</div><!-- // popContainer -->	
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
	$(function()
	{
		// 등록 버튼 클릭 이벤트
	    $(document).on("click", "#goRegist", function () 
	    {
	    	if($("input[name='storeRadio']").is(":checked"))
	    	{
	    		$("input[name='BCNC_CD']").val($("input[name='storeRadio']:checked").val());
	    		$("input[name='BCNC_NM']").val($("input[name='storeRadio']:checked").data("bcnc_nm"));
	    	}
	    	else
	    	{
	    		alert("[단골샵]을 선택해주세요.");
	    		return;
	    	}
	    	
            if (confirm("단골샵 변경 시 현재 단골샵 장바구니&주문서 상품은 초기화 됩니다.\n단골샵을 변경하시겠습니까?"))
	        {
            	window.opener.resultBCNC_NM($("input[name='BCNC_NM']").val());
            	
            	$("#frm").attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/updateRegularStore.do", "target":"_self", "method":"post"}).submit();
            	
	        }
	    });
		
		// 검색 버튼 클릭 이벤트
		$(document).on("click", "#searchRegularStore" , function()
		{
			$("input[name='cPage']").val("1");
			$("input[name='searchYn']").val("Y");
			$("input[name='searchAreaCd']").val($("#si").val());
			$("#frm").attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/regularStorePopup.do", "target":"_self", "method":"get"}).submit();
		});
		
		// 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='cPage']").val(cPage);	
	        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/regularStorePopup.do", "target":"_self", "method":"get"}).submit();
	    };
	});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>