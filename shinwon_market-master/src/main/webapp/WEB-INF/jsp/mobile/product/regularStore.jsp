<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-detail blackyak"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
 		  <div id="contents"><!-- contents -->

                <div class="section-title"><!-- section-title-->
                    <h3><span>단골샵 설정</span></h3>
                    <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${commandMap.PRD_MST_CD}" class="back"><span class="icon"><em>돌아가기</em></span></a>
                </div><!-- // section-title -->
 
                <div class="container"><!-- container -->
                    <div class="wrap gutter"><!-- wrap -->

                        <ul class="list list-a">
                            <li>고객님의 자주 이용하는 샵을 설정하실 수 있습니다.<br />(샵은 1개만 선택 가능합니다.)</li>
                        </ul>

                        <div class="grid head-actions mt0"><!-- head-actions -->
                            <div class="col-1-1 total text-left">
                                <strong class="primary">고객님이 선택한 단골샵 :</strong>
                                <strong class="warning">${empty regularStore.BCNC_NM ? '양재점' : regularStore.BCNC_NM }</strong>
                            </div>
                        </div><!-- // head-actions -->
						
                        <table class="table-col table-a layout-auto">
                            <colgroup>
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th><span>샵명</span></th>
                                    <th><span>주소</span></th>
                                    <th><span>전화번호</span></th>
                                    <th><span>선택</span></th>
                                </tr>
                            </thead>
                            <tbody>
								<c:choose>
				            	<c:when test="${not empty regularStoreList }">
				            		<c:forEach var="regularStoreRow" items="${regularStoreList }" varStatus="i">
										<tr><!-- row -->
			                                <td class="break-all"><c:out value="${regularStoreRow.BCNC_NM }"/></td>
		                                    <td class="break-all">
		                                        <c:out value="${regularStoreRow.ADDR2 }"/>
		                                    </td>
		                                    <td class="break-all">
		                                        <a href="tel:<c:out value="${regularStoreRow.TEL }"/>"><c:out value="${regularStoreRow.TEL }"/></a>
		                                    </td>
		                                    <td>
		                                        <a href="javascript:goRegist('${regularStoreRow.BCNC_CD}','${regularStoreRow.BCNC_NM}');" class="button small info"><span>선택</span></a>
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
                            </tbody>
                        </table>

                        <div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>
						
						<form id="frm" name="frm">
					        <input type="hidden" id="BCNC_NM"  name="BCNC_NM"   value=""/>
					        <input type="hidden" id="BCNC_CD"  name="BCNC_CD"   value=""/>
					        <input type="hidden" id="prdMstCd" name="prdMstCd"  value="${commandMap.PRD_MST_CD}"/>
				        </form>
						
                    </div><!-- // wrap -->
                </div><!-- // container -->
                
            </div><!-- // inner -->

	
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
$.params = ($.params !== undefined) ? $.params : [];

$(function(){
	
	// 단골매장 변경 
	goRegist = function(id,name)
	{
		$("#BCNC_CD").val(id);
		$("#BCNC_NM").val(name);
		
		if (confirm("단골샵 변경 시 현재 단골샵 장바구니 상품은 초기화 됩니다.\n단골샵을 변경하시겠습니까?"))
        {        	
        	$("#frm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/product/updateRegularStore.do", "target":"_self", "method":"post"}).submit();
        }
	}
});

</script>
</body>
</html>    