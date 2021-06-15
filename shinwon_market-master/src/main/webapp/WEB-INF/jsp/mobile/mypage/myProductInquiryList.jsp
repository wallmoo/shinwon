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
	            <h2>상품Q&A 작성</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
			<form id="frm" name="frm">
		        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
		        <input type="hidden" name="BRD_INQ_IDX" id="brdInqIdx"/>
		        <input type="hidden" name="PRD_MST_CD" id="prdMstCd"/>
		        <input type="hidden" name="type" id="type" value="myPage"/>
		        <div class="qna-view"><!-- qna-view -->
		            <c:choose>
	                	<c:when test="${not empty list }">
		                    <c:forEach var="row" items="${list }" varStatus="i">
					            <div class="col">
					                <div class="product-info"><!-- product-info -->
					                    <a href="<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=${row.BRD_PRD_MST_CD}" class="_pg_link" target="_self">
						                    <span class="thumb">
						                    	<img src="<c:out value="${cdnDomain }${row.PRD_IMG}"/>" alt="<c:out value="${row.PRD_MST_NM }"/>" />
						                    </span>
						                    <span class="subject"><c:out value="${row.PRD_MST_NM }"/></span>
					                    </a>
					                </div><!-- product-info -->
					
					                <div class="question">
					                    <i class="type"><span class="blind">질문</span></i>
					                    <p class="subject">
					                        <strong><ui:replaceLineBreak content="${row.BRD_INQ_CONTENTS}"/></strong>
					                        <c:if test="${row.BRD_INQ_CHN_GBN eq 'M' }">
												<span class="icon phone"><em class="blind">모바일에서 작성된 게시글</em></span>
		                                    </c:if>
					                    </p>
					                    <div class="ct desc">
					                        <div class="fl date">
					                            <ui:formatDate value="${row.BRD_INQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
					                            <span class="blind">에 작성</span>
					                        </div>
					                        <c:if test="${row.BRD_INQ_REPLY_CD eq 'N' }">
						                        <div class="fr">
						                            <a href="javascript:goEdit('<c:out value="${row.BRD_INQ_IDX }"/>','<c:out value="${row.BRD_PRD_MST_CD }"/>');" class="button small _pg_link"><span>수정</span></a>
						                            <a href="javascript:goDelete('<c:out value="${row.BRD_INQ_IDX }"/>');" class="button primary small _pg_link"><span>삭제</span></a>
						                        </div>
					                        </c:if>
					                    </div>
					                </div>
					
					                <div class="answer">
					                    <i class="type"><span class="blind">답변</span></i>
					                    <c:choose>
	                                   		<c:when test="${row.BRD_INQ_REPLY_CD eq 'Y' }">
	                                   			<strong><ui:replaceLineBreak content="${row.BRD_INQ_REPLY_CONTENTS}"/></strong>
	                                   		</c:when>
	                                   		<c:otherwise>
												<strong>문의에 대한 빠른 답변 드리도록 하겠습니다. 감사합니다.</strong>		                                   		
	                                   		</c:otherwise>
	                                   	</c:choose>
					                </div>
					            </div>
					      	</c:forEach>
				    	</c:when>
				    	<c:otherwise>
							<p class="no-more" style="padding: 20px 0; text-align: center; border-bottom: 1px #b2b2b2 solid;">
			                	문의하신 상품Q&amp;A가 없습니다.
				            </p>
				    	</c:otherwise>
				    </c:choose>
		        </div><!-- // qna-view -->
			</form>
	        
	        <div class="padder mt20">
	            <ul class="list list-a">
	                <li>문의하신 상품 Q&amp;A를 쉽고 빠르게 확인하실 수 있습니다.</li>
	                <li>상품과 관계가 없는 내용이나 비방성 글은 등록자에게 사전 동의 없이 임의로 삭제될 수 있습니다. </li>
	                <li>답변완료된 문의는 수정, 삭제 하실 수 없습니다.</li>
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
	// 페이지 이동
    goPage = function (cPage) 
    {
        var $pageFrm = $("#pageFrm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        $pageFrm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myProductInquiryList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 상품Q&A 수정 팝업 이동
    goEdit = function(brdInqIdx,prdMstCd){
    	var $frm = $("#frm");
        $frm.find("#brdInqIdx").val(brdInqIdx);
        $frm.find("#prdMstCd").val(prdMstCd);
        $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/product/productQnaForm.do", "target":"_self", "method":"post"}).submit();
    };
    
    //상품 qna삭제
    goDelete = function(brdInqIdx){
    	if(brdInqIdx != ""){
    		if(confirm("문의사항을 삭제 하시겠습니까?")){
	    		$.ajax
		        ({
		            async : false,
		            type : "POST",
		            data : {"brdInqIdx": brdInqIdx},
		            url : "<c:out value="${mobileDomain}" />/mobile/product/productQnaDeleteAjax.do",
		            success : function (data) 
		            { 
		            	if(data.resultYn == "Y")
		    			{
							alert("삭제되었습니다.");
							location.reload();
		    			}else{
		    				alert("삭제 중 오류가 발생하였습니다.\n다시 시도해주세요.");
		    			}
		            },
		            error : function (err)
		            {
		                alert("오류가 발생하였습니다.\n[" + err.status + "]");
		                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
		            }
				});
    		}
    	}else{
    		alert("필수값이 없습니다.\n다시 확인해주세요");
    		return;
    	}
    };
});
//]]>
</script>
</body>
</html>