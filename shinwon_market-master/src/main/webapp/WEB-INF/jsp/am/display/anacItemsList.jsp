<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
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
                <a href="#none">전시 관리</a>
                &gt;
                <a href="#none">브랜드전시-아낙</a>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">브랜드전시-아낙</h3>
                
                 <div class="tab-a justified" style="margin-top: 20px; width: 100%"><!-- tab -->
                    <ul class="tab">
                        <li id="ANAC_MAIN_TAB"><a href="javascript:fnAnacChangeTab('MAIN');" >Main Page</a></li>
                        <li id="ANAC_TOP7_TAB"><a href="javascript:fnAnacChangeTab('TOP7');" >TOP7</a></li>
                        <li id="ANAC_REAL_TAB"><a href="javascript:fnAnacChangeTab('REAL');" >REAL ANAC</a></li>
                        <li id="ANAC_PLAY_TAB"><a href="javascript:fnAnacChangeTab('PLAY');" >PLAY</a></li>
                        <li id="ANAC_ISSUE_TAB"><a href="javascript:fnAnacChangeTab('ISSUE');" >ISSUE</a></li>
                        <li id="ANAC_ITEMS_TAB" class = "active" ><a href="javascript:fnAnacChangeTab('ITEMS');" >ITEMS</a></li>
                    </ul>
                </div><!-- // tab -->

                <div class="title-box">
                    <h4 class="title">검색</h4>
                </div>
                
                
                <div class="section-form"><!-- section-form-a -->
                
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
 
	                    <div class="form-group">
                            <label class="label"><span>상태</span></label>
                            <div class="field">
                                <input type="radio" id="stateA" name="searchAnaItmDplYn" class="radio" <c:if test="${empty commandMap.searchAnaItmDplYn }">checked="checked"</c:if> value=""/>
                                <label for="stateA">전체</label>
                                <input type="radio" id="stateB" name="searchAnaItmDplYn" class="radio" <c:if test="${commandMap.searchAnaItmDplYn eq 'Y' }">checked="checked"</c:if> value="Y"/>
                                <label for="stateB">전시</label>
                                <input type="radio" id="stateC" name="searchAnaItmDplYn" class="radio" <c:if test="${commandMap.searchAnaItmDplYn eq 'N' }">checked="checked"</c:if> value="N"/>
                                <label for="stateC">미전시</label>
                            </div>
                        </div>
                        <div class="form-group">
                        	<label class="label"><span>카테고리</span></label>
                            	<div class="field">
    		                    	<select id="searchAnaItmCtg" name="searchAnaItmCtg" class="select" title="카테고리">
    									<option value="">전체</option>
    									<c:forEach items="${categoryList}" var="data">
     									<option value="<c:out value="${data.CMN_COM_IDX}"/>" <ui:select v="${data.CMN_COM_IDX}" t="${commandMap.searchAnaItmCtg}" g="selected"/>>
     									    <c:out value="${data.CMN_COM_NM}"/>
     									</option> 
     								</c:forEach> 
    					           </select>
    		                    </div>
                        </div>
                    </form>
                </div><!-- // section-form-a -->

                 <div class="section-button search">
                        <a href="#none" id="search" class="button button-b submit"><span>검색</span></a>
                        <a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                 </div>


                <h4 class="title">리스트</h4>
                <div class="right">
                    <a href="#none" id="goForm" class="button button-b"><span>등록</span></a>
                </div>
                <form id="frmTable" name="frmTable">
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: 20%;" />
                            <col style="width: 7%;" />
                        </colgroup>
                        <thead>
                            <tr>
                            	<th><input type="checkbox" class="checkbox checkAll" /></th>
                                <th>번호</th>
                                <th>카테고리</th>
                                <th>ID</th>
                                <th>상품명</th>
                                <th>상품코드</th>
                                <th>등록일</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody id="list-field">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td>
			                                	<input type="checkbox" class="checkbox checkRow ANA_ITM_IDXs" id="ANA_ITM_IDX<c:out value="${i.index }"/>" name="ANA_ITM_IDXs" value="<c:out value="${row.ANA_ITM_IDX }"/>"/>
			                                	<input type="hidden" name="ANA_ITM_IDX" value="<c:out value="${row.ANA_ITM_IDX }"/>" />
			                                </td>
			                                <td>
			                                	<input type="text" name="ANA_ITM_SRT" id="ANA_ITM_SRT" class="number center short" value="<c:out value="${row.ANA_ITM_SRT }"/>"/>
			                                </td>
			                                <td>
			                                	 <c:out value="${row.ANA_ITM_CTG_NM }"/>
			                                </td>
			                                <td>
                                                <a href="#none" class="list-title" data-ana_itm_idx="${row.ANA_ITM_IDX }" >
                                                    <c:out value="${row.ANA_ITM_IDX }"/>
                                                </a>
			                                </td>
			                                <td>
			                                	 <c:out value="${row.ANA_ITM_PRD_NM }"/>
			                                </td>
			                                <td>
			                                	 <c:out value="${row.ANA_ITM_PRD_MST_CD }"/>
			                                </td>
			                                 <td><ui:formatDate value="${row.ANA_ITM_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
			                                <td>
                                                <span class="label label-<c:out value="${row.ANA_ITM_DPL_YN eq 'Y'?'b':'a' }"/>">
                                                    <c:out value="${row.ANA_ITM_DPL_YN eq 'Y'?'전시':'미전시' }"/>
                                                </span>
                                            </td>
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
 				</form>
                <div class="pagination"><!-- pagination -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->
				<div class="left">
                    선택된 항목을 (변경된 내용으로)&nbsp;<a href="#none" id="modifySrt" class="button button-a"><span>수정</span></a>
                </div>  
                <form id="frm" name="frm">
                    <input type="hidden" name="ANA_ITM_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchAnaItmDplYn" value="<c:out value="${commandMap.searchAnaItmDplYn }"/>"/>
                    <input type="hidden" name="searchAnaItmCtg" value="<c:out value="${commandMap.searchAnaItmCtg }"/>"/>
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
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script type="text/javascript">

$(document).ready(function () {
    // 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacItemsForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    $(document).on("click", "#modifySrt", function () {
    	
    	
    	var len = $(".checkRow").length;
    	var chk = 0;
    	
    	for(var i= 0;i<len;i++)
    	{
    		if($("#ANA_ITM_IDX"+i).is(":checked"))chk++;
    	}
    	
    	if(chk==0)
    	{
    		alert("저장 할 행을 체크 해 주십시오.");
			return;
    	}
    		
    	
    	if(confirm("수정하시겠습니까?"))
    	{
        	$("#frmTable").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacItemsSrtMod.do", "target":"_self", "method":"post"}).submit();
    	}
    });
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", "#list-field .list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='ANA_ITM_IDX']").val($(this).data("ana_itm_idx"));
        
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/anacItemsEdit.do", "target":"_self", "method":"post"}).submit();
        
        
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/anacItemsList.do", "target":"_self", "method":"post"}).submit();
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/anacItemsList.do", "target":"_self", "method":"post"}).submit();
    };
    
    fnAnacChangeTab  = function (pageGb) 
    {
    	if(pageGb=="MAIN") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacMainList.do", "target":"_self", "method":"post"}).submit();
    	if(pageGb=="TOP7") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacTopList.do", "target":"_self", "method":"post"}).submit();
    	if(pageGb=="REAL") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacRealList.do", "target":"_self", "method":"post"}).submit();
    	if(pageGb=="PLAY") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacPlayList.do", "target":"_self", "method":"post"}).submit();
    	if(pageGb=="ISSUE") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacIssueList.do", "target":"_self", "method":"post"}).submit();
    	if(pageGb=="ITEMS") $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/anacItemsList.do", "target":"_self", "method":"post"}).submit();
    	
    };
    
    $(document).on("change", ".checkAll", function () {
        var $this = $(this);
        var $tbody = $("#list-field");
        var $checkbox = $tbody.find(".checkRow");
        if($checkbox.length == 0)
        {
            $this.prop("checked", false);
        }
        else
        {
            if($this.is(":checked"))
            {
                $checkbox.prop("checked", true);
            }
            else
            {
                $checkbox.prop("checked", false);    
            }
        }
    });
    
});
</script>
</body>
</html>