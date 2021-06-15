<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<!-- 별점 플러그인 시작-->
<link rel="stylesheet" href="<c:out value="${serverDomain}" />/am/js/star_rating/css/jquery.rating.css">
<script src="<c:out value="${serverDomain}" />/am/js/star_rating/jquery.rating.pack.js"></script>
<!-- 별점 플러그인 끝-->
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
    <a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

    <aside id="navigation"><!-- navigation -->
        <nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
        </nav>
    </aside><!-- // navigation -->

    <div id="body"><!-- body -->

        <section id="contents"><!-- contents -->

            <div id="breadcrumb"><!-- breadcrumb -->
                <a href="#none"><i class="icon-home em"></i> HOME</a>
                &gt;
                <a href="#none">고객센터</a>
                &gt;
                <span>채팅상담</span>
            </div><!-- // breadcrumb -->
    
            <div class="contents-inner"><!-- contents-inner -->

                <h4 class="title">채팅상담 상세보기</h4>

                <div class="section-form"><!-- section-form-a -->
                    <div class="form-group">
                        <label class="label"><span>고객명</span></label>
                        <div class="field">
                            <a href="javascript:goView('<c:out value="${row.CHT_CST_REG_ID }" />');">
                               <c:out value="${row.CHT_CST_MEM_NM }"/>(<c:out value="${row.CHT_CST_REG_ID }"/>)
                            </a> 
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="label"><span>담당자</span></label>
                        <div class="field">
                            <c:out value="${row.ADM_MST_NM }"/>(<c:out value="${row.CHT_CST_ADM_ID}"/>)
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="label"><span>시작시간</span></label>
                        <div class="field">
                            <ui:formatDate value="${row.CHT_CST_TME }" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="label"><span>내용</span></label>
                        <div class="field">
                        	<ui:replaceLineBreak content="${row.CHT_CST_CTS }"/>
                        </div>
                    </div>
 	                    
                </div><!-- // section-form-a -->
                
                 
                      <form id="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
		                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                    <input type="hidden" name="searchChtCstMemNm" value="<c:out value="${commandMap.searchChtCstMemNm }"/>"/>
	                    <input type="hidden" name="searchChtCstMemId" value="<c:out value="${commandMap.searchChtCstMemId }"/>"/>
	                    <input type="hidden" name="searchChtCstAdmNm" value="<c:out value="${commandMap.searchChtCstAdmNm }"/>"/>
	                    <input type="hidden" name="searchChtCstAdmId" value="<c:out value="${commandMap.searchChtCstAdmId }"/>"/>
	                    <input type="hidden" name="searchKeyWord" value="<c:out value="${commandMap.searchKeyWord }"/>"/>
                    </form>
                    <form id="frm" name="frm">
                        <input type="hidden" name="CHT_CST_IDX" value="<c:out value="${row.CHT_CST_IDX }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                    <input type="hidden" name="searchChtCstMemNm" value="<c:out value="${commandMap.searchChtCstMemNm }"/>"/>
	                    <input type="hidden" name="searchChtCstMemId" value="<c:out value="${commandMap.searchChtCstMemId }"/>"/>
	                    <input type="hidden" name="searchChtCstAdmNm" value="<c:out value="${commandMap.searchChtCstAdmNm }"/>"/>
	                    <input type="hidden" name="searchChtCstAdmId" value="<c:out value="${commandMap.searchChtCstAdmId }"/>"/>
	                    <input type="hidden" name="searchKeyWord" value="<c:out value="${commandMap.searchKeyWord }"/>"/>
	                    
	                </form>
                    
                 

                <div class="section-button"><!-- section button -->
                    <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
                </div><!-- // section button -->    


            </div><!-- // contents-inner -->

        </section><!-- // contents -->

    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function () {
	
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/chatConsultList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 회원정보 상세 팝업페이지 호출
    goView = function (memMstWebId)
    {
    	goMemberViewPopup("<c:out value="${serverDomain}"/>", memMstWebId);
    };
});
</script>
</body>
</html>