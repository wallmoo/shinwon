\<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<!-- 별점 플러그인 -->
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
                <a href="#none">고객상담</a>
                &gt;
                <span>채팅상담</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">채팅상담</h3>

                <div class="title-box">
                    <h4 class="title">검색</h4>
                </div>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    
	                    <div class="form-group">
	                        <label class="label"><span>등록일</span></label>
	                        <div class="field">
	                            <input type="text" name="searchStartDate" id="searchStartDate" class="text datepicker s-datepicker" value="<c:out value="${commandMap.searchStartDate }"/>"/> ~
	                            <input type="text" name="searchEndDate" id="searchEndDate" class="text datepicker e-datepicker" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                            <a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
	                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                             
	                        </div>
	                    </div>
	                    <div class="form-group">
                            <label class="label"><span>고객명/고객ID</span></label>
                            <div class="field">
                                <input type="text" class="text" name="searchChtCstMemNm" id="searchChtCstMemNm"  value="<c:out value="${commandMap.searchChtCstMemNm }"/>"/> / 
                                <input type="text" class="text" name="searchChtCstMemId" id="searchChtCstMemId"  value="<c:out value="${commandMap.searchChtCstMemId }"/>"/>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="label"><span>담당자명/담당자ID</span></label>
                            <div class="field">
                                <input type="text" class="text" name="searchChtCstAdmNm" id="searchChtCstAdmNm"  value="<c:out value="${commandMap.searchChtCstAdmNm }"/>"/> / 
                                <input type="text" class="text" name="searchChtCstAdmId" id="searchChtCstAdmId"  value="<c:out value="${commandMap.searchChtCstAdmId }"/>"/>
                            </div>
                        </div>
                        
	                  
                        <div class="form-group">
                            <label class="label"><span>키워드</span></label>
                            <div class="field">
                                <input type="text" class="text serach-text long" name="searchKeyWord" id="searchKeyWord" placeholder="채팅 내용에서 찾으시는 단어를 입력하세요" value="<c:out value="${commandMap.searchKeyWord }"/>"/>
                            </div>
                        </div>
                        
	                     
                    </form>
                </div><!-- // section-form-a -->

                 <div class="section-button search">
<!--                  		<a href="javascript:regTestAjax();" class="button"><span>등록테스트</span></a> -->
<!--                  		<a href="javascript:prdTestAjax();" class="button"><span>상품조회테스트</span></a> -->
                        <a href="#none" id="search" class="button button-b submit"><span>검색</span></a>
                        <a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                 </div>


                <h4 class="title">리스트</h4>
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: 35%;" />
                            <col style="width: 35%;" />
                            <col style="width: 20%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>고객ID</th>
                                <th>담당자ID</th>
                                <th>시작시간</th>
                            </tr>
                        </thead>
                        <tbody id="list-field">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td><c:out value="${listNum }"/></td>
			                                <td>
			                                    <a href="#none" class="list-title" data-cht_cst_idx="<c:out value="${row.CHT_CST_IDX }"/>" data-view_type="view">
			                                        <c:out value="${row.CHT_CST_MEM_NM }"/> (<c:out value="${row.CHT_CST_REG_ID }"/>)
			                                    </a>
			                                </td>
			                                <td>
												<c:out value="${row.ADM_MST_NM }"/> (<c:out value="${row.CHT_CST_ADM_ID }"/>)
			                                </td>
			                                <td><ui:formatDate value="${row.CHT_CST_TME }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			                            </tr>
                                        <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div><!-- // col list -->

                <div class="pagination"><!-- pagination -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->

                <form id="frm" name="frm">
                	<input type="hidden" name="CHT_CST_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchChtCstMemNm" value="<c:out value="${commandMap.searchChtCstMemNm }"/>"/>
                    <input type="hidden" name="searchChtCstMemId" value="<c:out value="${commandMap.searchChtCstMemId }"/>"/>
                    <input type="hidden" name="searchChtCstAdmNm" value="<c:out value="${commandMap.searchChtCstAdmNm }"/>"/>
                    <input type="hidden" name="searchChtCstAdmId" value="<c:out value="${commandMap.searchChtCstAdmId }"/>"/>
                    <input type="hidden" name="searchKeyWord" value="<c:out value="${commandMap.searchKeyWord }"/>"/>
                    <div class="bbs-status"><!-- bbs status -->
                        <div class="page">
		                    총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
		                </div>
	                    <div class="sort">
	                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                    </div>
	                </div>
                </form>
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
<script type="text/javascript">
$(document).ready(function () {
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", "#list-field .list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='CHT_CST_IDX']").val($(this).data("cht_cst_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/chatConsultView.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 검색 필드 엔터 이벤트 
    $(document).on("keydown", ".serach-text", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/board/chatConsultList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/chatConsultList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 회원정보 상세 팝업페이지 호출
    goView = function (memMstWebId)
    {
    	goMemberViewPopup("<c:out value="${serverDomain}"/>", memMstWebId);
    };
    
    
});

function fnResult(data) {
	
	alert("등록 되었습니다.");
	 
	
}

function regTestAjax() {
	
	var CHT_CST_REG_ID = "kmh0703";//고객ID
	var CHT_CST_ADM_ID = "admin";//어드민ID
	var CHT_CST_TME = "20160114224524";//채팅시작시간 yyyymmddhhmiss 시간은 24시 
	var CHT_CST_CTS = "채팅 내용테스트 입니다.";//채팅내용
	
    $.ajax({
        type : "POST",
        async:true,
        cache: false,
        dataType :"json",
        url : "<c:out value="${serverDomain}"/>/am/board/chatRegistAjax.do",
        data : {
            'CHT_CST_REG_ID'       : CHT_CST_REG_ID, //고객ID
            'CHT_CST_ADM_ID'       : CHT_CST_ADM_ID, //관리자ID
            'CHT_CST_TME'       : CHT_CST_TME,       //채팅시작시간
            'CHT_CST_CTS'       : CHT_CST_CTS        //채팅내용
        },  
        success : fnResult,
        error : function(err){alert("error : " + err.status );}
    });
}
function prdTestAjax() {
	
	var PRD_MST_CD = "TEST112200011463"; //상품코드
	var PRD_MST_NM = "";
	var PRD_IMG_LINK = "";
	var PRD_MST_PRC = "";
	var PRD_MST_LINK = "";
	
    $.ajax({
        type : "POST",
        async:true,
        cache: false,
        dataType :"json",
        url : "<c:out value="${serverDomain}"/>/am/board/chatProductAjax.do",
        data : {
            'PRD_MST_CD'       : PRD_MST_CD
        },  
        success	: function(data)
        {
        	PRD_MST_NM = data.PRD_MST_NM;     //상품명
        	PRD_IMG_LINK = data.PRD_IMG_LINK; //이미지링크
        	PRD_MST_PRC = data.PRD_MST_PRC;   //상품가격
        	PRD_MST_LINK = data.PRD_MST_LINK;  //상품페이지 링크(추후 추가예정)
        	
        	alert(PRD_MST_NM + ", " + PRD_IMG_LINK+ ", "+PRD_MST_PRC+", "+PRD_MST_LINK);
        	    
        },
        error : function(err){alert("error : " + err.status );}
    });
    
    
    
}
</script>
</body>
</html>