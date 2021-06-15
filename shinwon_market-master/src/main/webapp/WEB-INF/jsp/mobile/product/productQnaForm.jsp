<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-login page-join -->
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
	            <h2>상품Q&A 작성</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="padder">
	            <div class="frame-a mt20"><!-- product-info -->
                	<c:out value="${commandMap.PRD_MST_NM}" />
	            </div><!-- product-info -->
	              
	            <form id="frm" name="frm">
	        		<input type="hidden" id="prdMstCd"   name="prdMstCd"   value="<c:out value="${commandMap.PRD_MST_CD}"/>" />
	        		<input type="hidden" id="BRD_INQ_IDX"   name="BRD_INQ_IDX"   value="<c:out value="${commandMap.BRD_INQ_IDX}"/>" /> 
	        		<input type="hidden" id="type" name="type" value="<c:out value="${commandMap.type }"/>"/> 
		            
		            <div class="form-b"><!-- form-b -->
		                <p class="bbs-guide">
		                    <span class="essential"><em class="blind">필수입력 항목은</em></span> 필수 입력
		                </p>
		                
		                <ul>
		                    <li>
		                        <div class="tit">
		                            <label for="qnaText">내용 <span class="essential"><em class="blind">필수입력</em></span></label>
		                        </div>
		                        <div class="field">
		                            <textarea class="textarea" name="comment" id="comment" maxlength="1000"><c:out value="${selectQnaInfo.BRD_INQ_CONTENTS }" /></textarea>
		                            <p class="desc">
		                                ( 1000자 이내  )
		                            </p>
		                        </div>
		                    </li>
		                </ul>
		            </div><!-- // form-b -->
		        </form>
	
	            <ul class="list list-a mt20">
	                <li>본 게시판과 관련이 없거나 광고성, 단순반복성, 저작권침해 등 불건전한 내용을 올리실 경우 통보 없이 임의로 삭제 처리될 수 있습니다.</li>
	            </ul>
	        </div>
	            
	        <div class="section-button"><!-- section-button -->
	        	<c:choose>
	        		<c:when test="${not empty selectQnaInfo }">
	        			<a href="javascript:writeQna();" class="button"><span>수정</span></a>
	        		</c:when>
	        		<c:otherwise>
	        			<a href="javascript:writeQna();" class="button"><span>등록</span></a>
	        		</c:otherwise>
	        	</c:choose>
	        </div><!-- // section-button -->
				
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
	writeQna = function()
	{
		
		if($.trim($("#comment").val()) == "") 
		{
			alert("상품문의 내용을 입력해주세요.");
			$("#comment").focus();
			return;
		}

		var $frm = $("#frm");
		//var param = $("#frm").serialize();
    	if(confirm("상품문의를 등록하시겠습니까?"))
        {
			$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/product/productQnaRegist.do", "target":"_self", "method":"post"}).submit();
        }
    };
});
//]]>
</script>
</body>
</html>