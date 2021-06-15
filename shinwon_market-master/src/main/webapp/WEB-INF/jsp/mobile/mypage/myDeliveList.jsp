<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-mypage -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>배송지관리</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="padder text-right mt10">
	            <a href="javascript:delivePop('N', '');" class="button primary _pg_link" target="_self"><span>배송지 등록</span></a>
	        </div>
	
			<form id="frm">
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	        	<table class="table-d table-col table-address mt10" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
			        <caption>상품코드, 상품명, 판매가격, 선택으로 구성된 상품검색 목록입니다.</caption>
			        <colgroup>
			            <col style="width: auto;">
			            <col style="width: 25%;">
			            <col style="width: 14%;">
			        </colgroup>
			        <thead>
			            <tr>
			                <th scope="col">배송지 정보</th>
			                <th scope="col">연락처</th>
			                <th scope="col">관리</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:choose>
		                   	<c:when test="${not empty list }">
		                   		<c:forEach var="deliveRow" items="${list }" varStatus="i">
		                   			<tr>
						                <td class="text-left">
						                    <p>
						                        <strong>
						                        	<span class="primary"><c:out value="${deliveRow.MEM_DLV_NM }"/> /
						                        	</span> 
						                        	<c:out value="${deliveRow.MEM_DLV_RCV_NM }"/> <c:if test="${deliveRow.MEM_DLV_BSC_YN eq 'Y' }">[기본배송지]</c:if> 
						                        </strong>
						                    </p>
						                    <p class="mt10">
						                        <span class="blind">우편번호</span>
						                        [<c:out value="${deliveRow.MEM_DLV_ZIP_CDE5 }"/>]
						                    </p>
						                    <p>
						                        <span class="blind">도로명 주소</span>
						                        <c:out value="${deliveRow.MEM_DLV_DRO_ADR1 }"/>&nbsp;<c:out value="${deliveRow.MEM_DLV_DRO_ADR2 }"/>
						                    </p>
						                    <p>
						                        <span class="blind">지번주소</span>
						                        <c:out value="${deliveRow.MEM_DLV_JBN_ADR1 }"/>&nbsp;<c:out value="${deliveRow.MEM_DLV_JBN_ADR2 }"/>
						                    </p>
						                </td>
						                <td>
						                    <p>
						                    	<c:out value="${deliveRow.MEM_DLV_HP1 }"/>-<c:out value="${deliveRow.MEM_DLV_HP2 }"/>-<c:out value="${deliveRow.MEM_DLV_HP3 }"/>
						                    </p>
						                    <c:if test="${not empty deliveRow.MEM_DLV_TEL2 && not empty deliveRow.MEM_DLV_TEL3 }">
							                    <p>
							                    	<c:out value="${deliveRow.MEM_DLV_TEL1 }"/>-<c:out value="${deliveRow.MEM_DLV_TEL2 }"/>-<c:out value="${deliveRow.MEM_DLV_TEL3 }"/>				                            		 
							                    </p>
						                    </c:if>
						                </td>
						                <td>
						                    <p><a href="javascript:delivePop('M','${deliveRow.MEM_DLV_IDX }');" class="button small _pg_link" target="_self">수정</a></p>
						                    <p><a href="javascript:removeDeliv('${deliveRow.MEM_DLV_IDX }');" class="button small _pg_link" target="_self">삭제</a></p>
						                </td>
						            </tr>
		                   		</c:forEach>
		                   	</c:when>
		                    <c:otherwise>
		                    	<tr>
					                <td colspan="3">
					                    <p class="no-more">
					                       	 등록된 배송지가 없습니다.
					                    </p>
					                </td>
					            </tr>
		                    </c:otherwise>
		                </c:choose>
			        </tbody>
		        </table><!-- // table-d -->
	        </form>
	
	        <div class="padder mt20">
	            <ul class="list list-a">
	                <li>자주 사용하시는 배송지를 등록해 두시면 더욱 더 편리하게 이용하실 수 있습니다.</li>
	                <li>배송 주소록에는 최대 10개 까지 주소등록이 가능합니다. </li>
	            </ul>
	        </div>
	
	        <form id="pageFrm" name="pageFrm">
	           	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	            <div class="section-pagination"><!-- section pagination -->
	                <ui:frontpaging paging="${paging }" jsFunction="goPage" />
	            </div><!-- // section pagination -->
            </form>
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	
	//배송지 추가/수정 등록 폼
	delivePop = function(pageStatus, memDlvIdx){
		if(pageStatus == "N" && "${totalCount}" == 10){
			alert("배송지 등록은 10개까지 가능합니다.");
			return;
		}
		$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myDeliveForm.do?MEM_DLV_IDX="+memDlvIdx + '&pageStatus='+ pageStatus, "target":"_self", "method":"post"}).submit();
	};
	
	//배송지 삭제
	removeDeliv = function(memDlvIdx){
		if(confirm("삭제하시겠습니까?")){
			$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myDeliveRemove.do?MEM_DLV_IDX="+memDlvIdx, "target":"_self", "method":"post"}).submit();
		}
	};
	
	// 페이지 이동
	goPage = function (cPage) 
	{
	    var $pageFrm = $("#pageFrm");
	    $pageFrm.find("input[name='cPage']").val(cPage);
	    $pageFrm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myDeliveList.do", "target":"_self", "method":"get"}).submit();
	};
});
//]]>
</script>
</body>
</html>