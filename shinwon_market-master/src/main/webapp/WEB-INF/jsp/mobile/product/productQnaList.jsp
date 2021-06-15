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
                    <h3><span>상품 Q&amp;A</span></h3>
                    <a href="javascript:goBack();" class="back" id="goProductDetail"><span class="icon"><em>돌아가기</em></span></a>
                </div><!-- // section-title -->

				<div class="container"><!-- container -->
                    <div class="wrap gutter"><!-- wrap -->

                        <ul class="list list-a">
                            <li>배송 및 주문관련 문의는 고객센터의 FAQ나 1:1 문의를 이용해 주세요.</li>
                            <li>먼저 질문하신 고객님들의 내용을 확인하시면, 보다 유용한 정보를 빠르게 확인하실 수 있습니다.</li>
                            <li>상품 Q&amp;A는 회원만 작성 가능하며, 단순 상품비방, 상업적인 내용, 미풍양속 위반, 게시판의 성격에 맞지 않는 글은 통보 없이 삭제될 수 있습니다.</li>
                            <li>최근 3개월간 작성한 질문만 조회 가능합니다.<br />이전 내역은 PC 버전에서 확인해주시기 바랍니다.</li>
                        </ul>


                        <div class="grid head-actions"><!-- head-actions -->
                            <div class="col-1-2 total text-left">
                                <strong class="primary">문의 목록:</strong>
                                <strong class="warning">${totalCount}개</strong>
                            </div>
                            <div class="col-1-2 action">
                                <a href="<c:out value="${mobileDomain}"/>/mobile/product/productQnaForm.do?prdMstCd=${commandMap.PRD_MST_CD}" class="button info small"><span>상품 Q&amp;A 작성하기</span></a>
                            </div>
                        </div><!-- // head-actions -->
                       	<c:choose>
						<c:when test="${not empty listProductQna}">
	                        <div id="bbsQna" class="bbs-qna js-bbs-collapse"><!-- bbs-qna -->
	                        	<c:forEach var="item" items="${listProductQna }" varStatus="status">
									<div class="item-bbs"><!-- item -->
		                                <div class="grid head">
		                                    <div class="col-2-3">
		                                        <strong class="primary">
													<c:if test="${item.BRD_INQ_REPLY_CD eq 'Y' }" >[답변완료]</c:if>
	                            					<c:if test="${item.BRD_INQ_REPLY_CD ne 'Y' }" >[미답변]</c:if>
		                                        </strong>
		                                    </div>
		                                    <div class="col-1-3 text-right">
		                                        <span class="info"><c:out value="${fn:substring(item.BRD_INQ_REG_ID,0,(fn:length(item.BRD_INQ_REG_ID)-4))}" />**** / <ui:formatDate value="${item.BRD_INQ_REG_DT }" pattern="yyyy.MM.dd" /></span>
		                                    </div>
		                                </div>
		                                <div class="subject">
		                                    <a href="#!" class="toggler">
		                                        ${item.BRD_INQ_TITLE } 
		                                    </a>
		                                </div>
		                                <div class="toggle body no-padder"><!-- body -->
		                                    <div class="grid question">
		                                        <span class="icon q"><em>질문</em></span>
		                                        <div class="col">
		                                            <p>
		                                                <strong class="primary">${item.BRD_INQ_TITLE }</strong>
		                                            </p>
		                                            <p>
		                                                <ui:replaceLineBreak content="${item.BRD_INQ_CONTENTS }"/>
		                                            </p>
		                                        </div>
		                                        <div class="clearfix text-center pt5">
		                                        	<c:if test="${sessionUser.MEM_MST_MEM_ID eq item.BRD_INQ_REG_ID and item.BRD_INQ_REPLY_CD ne 'Y'}">
			                                            <a href="javascript:goDeleteQna('${item.BRD_INQ_IDX}');" class="button small primary"><span>삭제</span></a>
			                                            <a href="<c:out value="${mobileDomain}"/>/mobile/product/productQnaEdit.do?prdMstCd=${commandMap.PRD_MST_CD}&BRD_INQ_IDX=${item.BRD_INQ_IDX}" class="button small warning"><span>수정</span></a>
		                                            </c:if>
		                                        </div>
		                                    </div>
		                                    <c:if test="${item.BRD_INQ_REPLY_CD eq 'Y'}">
		                                    <div class="grid answer">
		                                        <span class="icon a"><em>답변</em></span>
		                                        <div class="col">
		                                            ${item.BRD_INQ_REPLY_CONTENTS }
		                                            [<ui:formatDate value="${item.BRD_INQ_REPLY_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>]
		                                        </div>
		                                    </div>
		                                    </c:if>
		                                    <c:if test="${item.BRD_INQ_REPLY_CD ne 'Y'}">
		                                    <div class="grid answer">
		                                        <span class="icon a"><em>답변</em></span>
		                                        <div class="col">
		                                            답변 미작성 상태 입니다.
		                                        </div>
		                                    </div>
		                                    </c:if>
		                                </div><!-- // body -->
		                            </div><!-- // item -->
	                        	</c:forEach>
							</div><!--// bbs-qna -->
						</c:when>
						<c:otherwise>
							<div class="section-message message">
	                            <p>조회할 내역이 없습니다.</p>
	                        </div>
						</c:otherwise>
						</c:choose>
						
						<form id="frm" name="frm">
							<input type="hidden" id="cPage"       name="cPage" value="${commandMap.cPage }" />
							<input type="hidden" id="prdMstCd"    name="prdMstCd" value="${commandMap.PRD_MST_CD}" />
							<input type="hidden" id="BRD_INQ_IDX" name="BRD_INQ_IDX" value="" />
							<double-submit:preventer/> 
						</form>	

                        <div class="section-pagination"><!-- section pagination -->
                            <ui:frontpaging paging="${paging }" jsFunction="goPage" />
                        </div><!-- // section pagination -->

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
	
	// 페이지 이동
	goPage = function (cPage) 
	{
	    var $frm = $("#frm");
	    $frm.find("input[id='cPage']").val(cPage);
	    $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/product/productQnaList.do", "target":"_self", "method":"get"}).submit();
	};
	
	// 상품 상세 페이지로 이동 
	$("#goProductDetail").click(function(){
		var $frm = $("#frm");
		$frm.attr({"action":"<c:out value="${mobileDomain }"/>/mobile/product/product.do", "target":"_self", "method":"get"}).submit();
	});
	
	// QnA 삭제
	goDeleteQna = function (idx) 
	{
		var $frm = $("#frm");
		if(confirm("상품문의를 삭제하시겠습니까?"))
        {
			 $frm.find("input[id='cPage']").val("1");
			 $frm.find("input[id='BRD_INQ_IDX']").val(idx);
			 $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/product/productQnaRemove.do", "target":"_self", "method":"get"}).submit();
        }
	};
	
});

</script>
</body>
</html>    