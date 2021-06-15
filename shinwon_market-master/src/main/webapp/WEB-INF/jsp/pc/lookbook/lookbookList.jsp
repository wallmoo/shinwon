<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-display"><!-- page class : page-display -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->

		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
	        <div id="breadcrumb" class="wrap">
	            <div class="holder">
	                <span>홈</span>
	                <span class="gt">&gt;</span>
	                <strong class="warning">LOOKBOOK</strong>
	            </div>
	        </div>
	    </div><!-- // breadcrumb -->


		<div class="container"><!-- container -->
			<div class="wrap"><!-- wrap -->

				<h3 class="title"><span>LOOKBOOK</span></h3>
	
				<div class="event-view-body"><!-- event-view-body -->
				    <div class="holder">
				    	<c:if test="${not empty topLookBook }">
				        <img src="<c:out value="${cdnDomain }"/>${topLookBook.LKB_MST_IMG1_ATT_PATH}${topLookBook.LKB_MST_IMG1_SYS_NM}" alt="${topLookBook.LKB_MST_TITLE}"  />
				        </c:if>
				    </div>
				</div><!-- // event-view-body -->

				<div class="lookbook-list"><!-- lookbook-list -->
				    <c:choose>
				    	<c:when test="${not empty lookBookImgList }">
				    		<div id="masonry" class="core masonry">
				    		<c:forEach var="lookBookImgRow" items="${lookBookImgList }" varStatus="i">
				    			<div class="item">
				            		<a href="javascript:;" data-lkb_img_idx = "${lookBookImgRow.LKB_IMG_IDX }">
				            			<img src="<c:out value="${cdnDomain }"/>${lookBookImgRow.LKB_IMG_ATT_PATH}${lookBookImgRow.LKB_IMG_SYS_NM}" alt="${lookBookImgRow.LKB_IMG_TXT }" style="width: 230px;"/>
				            		</a>
				        		</div>
				    		</c:forEach>
				    		</div>
				    	</c:when>
				    	<c:otherwise>
				    		<p class="no-list-more pt30">
                              	등록된 게시물이 없습니다.
                            </p> 
				    	</c:otherwise>
				    </c:choose>
				</div><!-- // lookbook-list -->
				
				<form id="frm" name="frm">
					<input type="hidden" name="LKB_MST_IDX" value="${topLookBook.LKB_MST_IDX }" />
					<input type="hidden" name="LKB_IMG_IDX" value="" />
					<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
		            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
            	</form>

				<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

			</div><!-- wrap -->
		</div><!-- // container -->              

	</div><!-- // inner -->

<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
	$(document).ready(function()
	{
		// 하위 이미지 클릭 시 
		$(document).on("click",".item a",function()
		{
			var $frm = $("#frm");
			$("input[name='LKB_IMG_IDX']").val($(this).data("lkb_img_idx"));
			$frm.attr({"action":"<c:out value="${frontDomain}" />/pc/lookbook/lookbook.do", "target":"_self", "method":"get"}).submit();
		});
		
	});

</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>