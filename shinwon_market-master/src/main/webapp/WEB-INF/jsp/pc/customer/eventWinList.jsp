<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>

<body class="page-customer"><!-- page class : page-helpdesk -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<!-- #container S -->
    <article id="container" class="container">
        <div class="minW contents"><!-- contents S -->

            <dl class="loc">
                <dt class="blind">현제 카테고리 경로</dt>
                <dd class="f"><a href="javascript:void(0)" class="ico_home"><span class="ir">홈</span></a></dd>
                <dd><a href="javascript:void(0)"><span>고객센터</span></a></dd>
                <dd class="l"><a href="javascript:void(0)"><span>당첨자발표</span></a></dd>
            </dl>

            <%@ include file="/WEB-INF/jsp/pc/include/customer/aside.jsp" %>

            <div id="body"><!-- #body -->

                <h3 class="title">당첨자 발표</h3> 

                <table class="bbs-list"><!-- bbs-list -->
                <caption>번호, 제목, 등록일, 조회수로 구성된 당첨자 발표 목록입니다.</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: auto%;" />
                    <col style="width: 15%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">NO</th>
                        <th scope="col">제목</th>
                        <th scope="col">등록일</th>
                        <th scope="col">조회수</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
                	<c:when test="${not empty list }">
                		<c:set var="listNum" value="${paging.listNum}" />
                		<c:forEach items="${list }" var="list">
		                    <tr>
		                        <td><c:out value="${listNum }"/></td>
		                        <td class="subject">
		                            <a href="javascript:;" data-evt_win_idx="<c:out value="${list.EVT_WIN_IDX }" />" ><c:out value="${list.EVT_WIN_NM }" /></a>
		                            <c:if test="${list.NEWMARK eq 'Y' }" ><span class="new"><em class="blind">최근게시글</em></span></c:if>
		                        </td>
		                        <td><ui:formatDate value="${list.EVT_WIN_REG_DT }" pattern="yyyy-MM-dd"/></td>
		                        <td><fmt:formatNumber value="${list.EVT_WIN_CNT}" groupingUsed="true"/></td>
		                    </tr>
		                    <c:set var="listNum" value="${listNum-1}" />
                    	</c:forEach>
					</c:when>
				</c:choose>		                    		
                </tbody>
                </table><!-- // bbs-list -->
				<form id="frm" name="frm">
				<input type="hidden" name="EVT_WIN_IDX" id="EVT_WIN_IDX" value="" />
				<input type="hidden" name="cPage" id="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
                <div class="section-pagination"><!-- section pagination -->
                    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
                </div><!-- // section pagination -->
				</form>
            </div><!-- // #body -->

        </div><!--// .contents E -->
    </article>
    <!--// #container E -->
    
    <%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    
    <script type="text/javascript">
    	$(function(){
    		
    		$(document).on("click", ".subject a", function(){
    			var $frm = $("#frm");
   		        $frm.find("#EVT_WIN_IDX").val($(this).data("evt_win_idx"));
   		        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/eventWinView.do", "target":"_self", "method":"get"}).submit();
    		});
    		
    		goPage = function (cPage){
    	        var $frm = $("#frm");
    	        $frm.find("#cPage").val(cPage);
    	        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/eventWinList.do", "target":"_self", "method":"get"}).submit();
    	    };
    	});
    </script>
</html>