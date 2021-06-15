<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-display blackyak"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>LOOKBOOK</span></h3>
		    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap"><!-- warp -->

				<div class="grid"><!-- visual -->
				    <div class="col-1-1">
				    	<img src="<c:out value="${cdnDomain }"/>${topLookBook.LKB_MST_IMG1_ATT_PATH}${topLookBook.LKB_MST_IMG1_SYS_NM}" alt="${topLookBook.LKB_MST_TITLE}" class="full"/>
				    </div>
				</div><!-- // visual -->

				<h4 class="title background-none mt10"><span>LOOKBOOK LIST</span></h4>
			
			    <div class="lookbook-list"><!-- lookbook-list -->
					<c:choose>
			    		<c:when test="${not empty lookBookImgList }">
							<div id="masonry" class="grid masonry">
							    <div class="item-sizer">
								    <c:forEach var="lookBookImgRow" items="${lookBookImgList }" varStatus="i">
									    <div class="item">
									    	<div class="module">
										        <a href="javascript:;" data-lkb_img_idx = "${lookBookImgRow.LKB_IMG_IDX }">
										        	<img src="<c:out value="${cdnDomain }"/>${lookBookImgRow.LKB_IMG_ATT_PATH}${lookBookImgRow.LKB_IMG_SYS_NM}" alt="${lookBookImgRow.LKB_IMG_TXT }" class="full"/>
										        </a>
									        </div>
									    </div>
								    </c:forEach>
							    </div>
						    </div>
						</c:when>
					</c:choose>
				</div><!-- // lookbook-list -->
				
				<form id="frm" name="frm">
					<input type="hidden" name="LKB_MST_IDX" value="${topLookBook.LKB_MST_IDX }" />
					<input type="hidden" name="LKB_MST_TITLE" value="${topLookBook.LKB_MST_TITLE }" />
					<input type="hidden" name="LKB_IMG_IDX" value="" />
					<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
            	</form>

				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- // warp -->
		</div><!-- // container -->
	</div><!-- // contents -->
	
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">

	$(function(){
		// 하위 이미지 클릭 시 
		$(document).on("click",".module a",function()
		{
			var $frm = $("#frm");
			$("input[name='LKB_IMG_IDX']").val($(this).data("lkb_img_idx"));
			$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/lookbook/lookbook.do", "target":"_self", "method":"get"}).submit();
		});
	});

</script>

</body>
</html>