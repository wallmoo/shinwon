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
                    <strong class="warning">단체주문 문의</strong>
                </div>
            </div>
        </div><!-- // breadcrumb -->
		
		<div class="container"><!-- container -->
		<div class="wrap"><!-- wrap -->

		    <%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
	
	    	<div id="internal"><!-- internal -->
	
	        <h4 class="title"><!-- title -->
	            <span>단체주문문의</span>
	            <small class="desc">
	                  	고객님께서 단체주문 문의로 문의하신 내역입니다.
	            </small>
	        </h4><!-- // title -->
	
	        <table class="bbs-list fixed" cellspacing="0"><!-- bbs-list -->
	        <caption></caption>
	        <colgroup>
	            <col style="width: 8%;" />
	            <col style="width: 15%;" />
	            <col style="width: auto;" />
	            <col style="width: 16%;" />
	        </colgroup>
	        <thead>
	            <tr>
	                <th><span>NO</span></th>
	                <th><span>답변상태</span></th>
	                <th><span>단체명</span></th>
	                <th><span>작성일</span></th>
	            </tr>
	        </thead>
	        <tbody>
	        	<c:choose>
			    	<c:when test="${not empty list}">
			    		<c:set var="listNum" value="${paging.listNum}" />
			    		<c:forEach var="data" items="${list }" varStatus="status">
				            <tr>
				                <td class="no"><c:out value="${listNum }"/></td>
				                <td class="status">
				                	<span class="${data.GRP_INQ_REPLY_YN == 'Y' ? 'warning' : '' }">${data.GRP_INQ_REPLY_YN == 'Y' ? '답변완료' : '접수완료' }</span>
				                </td>
				                <td class="subject text-left">
				                    <a href="javascript:;" class="js-collapse-toggler" id="title_${data.GRP_INQ_IDX}" data-grp_inq_idx="<c:out value="${data.GRP_INQ_IDX }"/>"><c:out value="${data.GRP_INQ_GRP_NM}"/></a>
				                </td>
				                <td class="date"><ui:formatDate value="${data.GRP_INQ_REG_DT}" pattern="yyyy.MM.dd"/></td>
				            </tr>
				        	<c:set var="listNum" value="${listNum-1}" />
	            		</c:forEach>
	            	</c:when>
	            	<c:otherwise>
	            		<tr>
			                <td colspan="4">
			                    <p class="message no-more">
	                        		문의하신 내역이 없습니다.
			                    </p>
			                </td>
	            		</tr>
	            	</c:otherwise>
	            	</c:choose>
	        </tbody>
	        </table><!-- // table -->
	
	        <form id="frm" name="frm">
	            <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
	            <input type="hidden" name="GRP_INQ_IDX" value=""/>
	            
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
	$(function()
	{
		// 제목 a Tag 클릭 이벤트
	    $(document).on("click", ".js-collapse-toggler", function () 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='GRP_INQ_IDX']").val($(this).data("grp_inq_idx"));
	        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myGroupInquiryView.do", "target":"_self", "method":"post"}).submit();
	    });
		
	    // 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myGroupInquiryList.do", "target":"_self", "method":"post"}).submit();
	    };
	
	});
//]]>
</script>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>