<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage sub"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
<div id="inner"><!-- inner -->

    <div class="container breadcrumb-wrap"><!-- breadcrumb -->
        <div id="breadcrumb" class="wrap">
            <div class="holder">
                <span>홈</span>
                <span class="gt">&gt;</span>
                <span>MYPAGE</span>
                <span class="gt">&gt;</span>
                <span>쇼핑컨텐츠</span>
                <span class="gt">&gt;</span>
                <strong class="warning">상품평</strong>
            </div>
        </div>
    </div><!-- // breadcrumb -->

	<div class="container"><!-- container -->
		<div class="wrap"><!-- wrap -->
		
		<%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
	
		<div id="internal"><!-- internal -->
		
		<h4 class="title"><!-- title -->
		    <span>상품평</span>
		    <small class="desc">
		        고객님께서 작성하신 상품평 내역이며, 수정/삭제가 가능합니다 
		    </small>
		</h4><!-- // title -->
	
		<table class="bbs-list fixed faq qna js-faq" cellspacing="0"><!-- bbs-list -->
			<caption></caption>
			<colgroup>
				<col style="width: 50px;" />
				<col style="width: auto;" />
				<col style="width: 110px;" />
				<col style="width: 200px;" />
				<col style="width: 90px;" />
				<col style="width: 80px;" />
			</colgroup>
			<thead>
			    <tr>
			        <th><span>NO</span></th>
			        <th><span>상품정보</span></th>
			        <th><span>만족도</span></th>
			        <th><span>제목 </span></th>
			        <th><span>작성일</span></th>
			        <th><span>관리</span></th>
			    </tr>
			</thead>
			<tbody>
			    <c:choose>
				    <c:when test="${not empty list}">
				    	<c:set var="listNum" value="${paging.listNum}" />
				    	<c:forEach var="data" items="${list }" varStatus="status">
				    		<tr class="question"><!-- question -->
							    <td class="num"><c:out value="${listNum }"/></td>
							    <td class="text-left product">
							        <div class="item">
							            <div class="pull-left thumb">
							                <a href="<c:out value="${frontDomain }"/>/pc/product/productSimpleView.do?prdMstCd=${data.PRD_PRD_MST_CD }" class="hover">
							                	<img src="<c:out value="${cdnDomain }${data.PRD_MST_IMG_URL_PATH }"/>" alt="${data.PRD_MST_NM}" />
							                </a>
							            </div>
							            <div class="core">
							                <p>
							                    <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${data.PRD_PRD_MST_CD }">
							                    	<c:out value="${data.PRD_MST_NM}" />
							                    </a>
							                </p>
							            </div>
							        </div>
							    </td>
							    <td class="status">
							        <span class="star star-<c:out value="${data.PRD_REV_SCORE_STAR }"/>"><em></em></span>
							    </td>
							    <td class="text-left subject">
							    	<a href="javascript:;" class="toggle">
							    		<c:if test="${not empty data.fileList }">
								    		<span class="icon picture">
								    			<em>사진 첨부</em>
								    		</span>
							    		</c:if>
							    		<c:out value="${data.PRD_REV_TITLE}" />
							    	</a>
							    </td>
							    <td class="date"><ui:formatDate value="${data.PRD_REV_REG_DT}" pattern="yyyy.MM.dd"/></td>
							    <td class="action">
							        <p>
							        	<a href="javascript:;" class="button small edit" data-prd_rev_idx="${data.PRD_REV_IDX}" data-prd_prd_mst_cd="${data.PRD_PRD_MST_CD}">
							        		<span>수정</span>
							        	</a>
							        </p>
							        <p>
							        	<a href="javascript:;" class="button info small delete" data-prd_rev_idx="${data.PRD_REV_IDX}">
							        		<span>삭제</span>
							        	</a>
							        </p>
							    </td>
							</tr><!-- // question -->
							<tr class="answer"><!-- answer -->
							    <td colspan="6">
							        <div class="holder"><!-- holder -->
							            <div class="inner">
							                <div class="pic"><!-- 이미지 있을 경우 -->
							                    <c:if test="${not empty data.fileList }">
									            	<c:forEach var="fileRow" items="${data.fileList }" varStatus="i">
							                    		<img src="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH }${fileRow.CMM_FLE_SYS_NM }" alt="${fileRow.CMN_FLE_ALT_TXT}" />
							                    	</c:forEach>
							                    </c:if>
							                </div><!-- // 이미지 있을 경우 -->
							                <div class="q">
							                    <strong class="size">SIZE:</strong>
							                    <c:out value="${Code.PRODUCT_REV_SIZE_NM[data.PRD_REV_SIZE_STAR]}"/>&nbsp;
							                    <strong class="color">COLOR:</strong>
							                    <c:out value="${Code.PRODUCT_REV_COLOR_NM[data.PRD_REV_COLOR_STAR]}"/>
							                </div>
							                <div class="a">
							                    <ui:replaceLineBreak content="${data.PRD_REV_CONTENTS}"/>
							                </div>
							            </div>
							        </div><!-- // holder -->
							    </td>
							</tr><!-- // answer -->
							<c:set var="listNum" value="${listNum-1}" />
				    	</c:forEach>
				    </c:when>
				    <c:otherwise>
				    	<tr><!-- row -->
						    <td colspan="6">
						        <p class="message no-more">
						        	작성한 상품평이 없습니다.
						        </p>
						    </td>
						</tr><!-- // row -->
				    </c:otherwise>
				</c:choose>
			</tbody>
		</table><!-- // table -->
		
		<form id="frm" name="frm">
		    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
		    <input type="hidden" name="writableYn" value="<c:out value="${commandMap.writableYn }"/>"/>
		    <input type="hidden" name="PRD_REV_IDX" value=""/>
		    <double-submit:preventer/>
		    
		    <div class="section-pagination"><!-- section pagination -->
	  			<ui:frontpaging paging="${paging }" jsFunction="goPage" />
	        </div><!-- // section pagination -->
		</form>
	
		<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>
	
		</div><!-- internal -->
	
		</div><!-- wrap -->
	</div><!-- // container -->

</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
	$(function(){
	    // 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myProductCommentList.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    //상품평 수정 버튼 클릭
	    $('.edit').on('click', function(e)
	    {
	    	var prd_rev_idx = $(this).data("prd_rev_idx");
	    	var prd_prd_mst_cd = $(this).data("prd_prd_mst_cd");
	    	popup("<c:out value="${frontDomain}"/>/pc/mypage/myProductCommentPopup.do?PRD_PRD_MST_CD="+prd_prd_mst_cd+"&PRD_REV_IDX="+prd_rev_idx+"&pageStatus=M", "1024", "768", "yes", "productCommentPop");    	
	    });
	    
	    //상품평 삭제 버튼 클릭
	    $('.delete').on('click', function(e)
	    {
	    	var prd_rev_idx = $(this).data("prd_rev_idx");
	    	if(confirm("삭제하시겠습니까?"))
			{
				$("#frm input[name='cPage']").val("1");
				$("#frm input[name='PRD_REV_IDX']").val(prd_rev_idx);
				$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myProductCommentRemove.do", "target":"_self", "method":"post"}).submit();
			}
	    });
	});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>