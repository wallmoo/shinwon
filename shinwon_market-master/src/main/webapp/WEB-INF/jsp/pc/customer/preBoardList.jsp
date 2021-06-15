<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-helpdesk"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->
		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
            <div id="breadcrumb" class="wrap">
                <div class="holder">
                    <span>홈</span>
                    <span class="gt">&gt;</span>
                    <strong class="warning">일반게시판 미리보기</strong>
                </div>
            </div>
        </div><!-- // breadcrumb -->

		<div class="container visual-wrap"><!-- visual -->
		    <div class="wrap">
		        <img src="<c:out value="${cdnDomain}"/>/pc/img/custom/visual_helpdesk.png" alt="" />
		    </div>
		</div><!-- // visual -->


		<div class="container"><!-- container -->
		<div class="wrap"><!-- wrap -->

		<div id="lnb"><!-- lnb -->
		    <ul class="reset">
		        <li class="active"><a href="javascript:;">일반게시판 미리보기</a></li>
		    </ul>
		</div><!-- // lnb -->

		<div id="internal"><!-- internal -->
		
		<h3 class="title"><span>일반게시판 미리보기</span></h3>

		<table class="bbs-list fixed" cellspacing="0"><!-- bbs-list -->
			<caption></caption>
			<colgroup>
			    <col style="width: 70px;" />
			    <col style="width: auto;" />
			    <col style="width: 120px;" />
			    <col style="width: 100px;" />
			</colgroup>
		    <thead>
		        <tr>
		            <th><span>NO</span></th>
		            <th><span>제목</span></th>
		            <th><span>등록일</span></th>
		            <th><span>조회수</span></th>
		        </tr>
		    </thead>
		    <tbody>
		        <!-- 상단공지 -->
              	<c:if test="${not empty topList }">
	                <c:forEach var="row" items="${topList }" varStatus="i">
	               	<tr>
	                    <td class="num">상단</td>
	                    <td class="text-left subject">
	                        <a href="javascript:;" class="subject2" data-brd_dtl_idx="<c:out value="${row.BRD_DTL_IDX }"/>" data-brd_dtl_top_yn="Y"><c:out value="${row.BRD_DTL_TITLE }"/></a>
	                    </td>
	                    <td class="date"><ui:formatDate value="${row.BRD_DTL_REG_DT }" pattern="yyyy.MM.dd"/></td>
	                    <td class="hit"><fmt:formatNumber value="${row.BRD_DTL_READ_CNT}" groupingUsed="true"/></td>
	                </tr>
	                </c:forEach>
                </c:if>
                <!-- 일반공지 -->
                <c:choose>
	                <c:when test="${not empty list }">
	                    <c:set var="listNum" value="${paging.listNum}" />
	                    <c:forEach var="row" items="${list }" varStatus="i">
	                    	<tr>
	                      <td class="num"><c:out value="${listNum }"/></td>
	                      <td class="text-left subject">
	                          <a href="javascript:;" class="subject2" data-brd_dtl_idx="<c:out value="${row.BRD_DTL_IDX }"/>" data-brd_dtl_top_yn="N"><c:out value="${row.BRD_DTL_TITLE }"/></a>
	                      </td>
	                      <td class="date"><ui:formatDate value="${row.BRD_DTL_REG_DT }" pattern="yyyy.MM.dd"/></td>
	                      <td class="hit"><fmt:formatNumber value="${row.BRD_DTL_READ_CNT}" groupingUsed="true"/></td>
	                  </tr>
	                        <c:set var="listNum" value="${listNum-1}" />
	                    </c:forEach>
	                </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4">
								<p class="message no-more">게시글이 없습니다.</p>
							</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
		    </tbody>
		</table><!-- // bbs-list -->
		
		<form id="frm" name="frm">
		<input type="hidden" name="BRD_MST_IDX" value="${commandMap.BRD_MST_IDX }"/>
		<input type="hidden" name="BRD_DTL_IDX" value="" />
		<input type="hidden" name="BRD_DTL_TOP_YN" value="" />
		<input type="hidden" name="BRD_MST_TYPE" value="N"/>
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
		
		<div class="section-pagination"><!-- section pagination -->
  			<ui:frontpaging paging="${paging }" jsFunction="goPage" />
        </div><!-- // section pagination -->
        </form>

		</div><!-- internal -->

		</div><!-- wrap -->
		</div><!-- // container -->

		<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

	</div><!-- // inner -->

<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script>
	$(function()
	{
		// 제목 a Tag 클릭 이벤트
	    $(document).on("click", ".subject2", function () 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='BRD_DTL_IDX']").val($(this).data("brd_dtl_idx"));
	        $frm.find("input[name='BRD_DTL_TOP_YN']").val($(this).data("brd_dtl_top_yn"));	        
	        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/preBoardView.do", "target":"_self", "method":"get"}).submit();
	    });
		
		// 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/preBoardList.do", "target":"_self", "method":"get"}).submit();
	    };
	});
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>
