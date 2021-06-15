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
                <a href="#none">마케팅 관리</a>
                &gt;
                <a href="#none">포인트리스트</a>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">포인트리스트</h3>

                <div class="title-box">
                    <h4 class="title">검색</h4>

                  
                </div>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm" name="searchForm">
                         <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
 	                     <div class="form-group">
                            <label class="label"><span>기간검색</span></label>
                            <div class="field">
                                <input type="text" name="searchMileageStDt" id="searchMileageStDt" class="text datepicker s-datepicker" value="<c:out value="${commandMap.searchMileageStDt }"/>"/> ~
                                <input type="text" name="searchMileageEdDt" id="searchMileageEdDt" class="text datepicker e-datepicker" value="<c:out value="${commandMap.searchMileageEdDt }"/>"/>
                                <a href="javascript:fnDateSet('searchMileageEdDt', 'searchMileageStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                <a href="javascript:fnDateSet('searchMileageEdDt', 'searchMileageStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                <a href="javascript:fnDateSet('searchMileageEdDt', 'searchMileageStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                <a href="javascript:fnDateSet('searchMileageEdDt', 'searchMileageStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                <a href="javascript:fnDateSet('searchMileageEdDt', 'searchMileageStDt', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
                                
                            </div>
                        </div>
 	                    <div class="form-group">
                            <label class="label"><span>관리자아이디/이름</span></label>
                            <div class="field">
					           <input type="text" name="searchMlgMstRegId" id="searchMlgMstRegId" class="text middle" value="<c:out value="${commandMap.searchMlgMstRegId }"/>">/
					           <input type="text" name="searchMlgMstRegNm" id="searchMlgMstRegNm" class="text middle" value="<c:out value="${commandMap.searchMlgMstRegNm }"/>">
		                    </div>
                        </div>
 	                    <div class="form-group">
                            <label class="label"><span>관리자메모</span></label>
                            <div class="field">
					           <input type="text" name="searchMlgMstMemo" id="searchMlgMstMemo" class="text long" value="<c:out value="${commandMap.searchMlgMstMemo }"/>">
		                    </div>
                        </div>
 	                    
                        <div class="form-group">
                            <label class="label"><span>포인트 구분/내역</span></label>
                            <div class="field">
		                       	<select id="searchMlgUseGb" name="searchMlgUseGb" class="select" title="포인트 구분">
		                       		<option value="" <c:if test="${commandMap.searchMlgUseGb eq ''}">selected="selected"</c:if>>전체</option>
									<option value="P" <c:if test="${commandMap.searchMlgUseGb eq 'P'}">selected="selected"</c:if>>적립</option>
									<option value="M" <c:if test="${commandMap.searchMlgUseGb eq 'M'}">selected="selected"</c:if>>적립취소</option>
								</select>
					          	<select id="searchMlgMstBrkDwn" name="searchMlgMstBrkDwn" class="select" title="포인트  내역">
					          		<option value="" <c:if test="${commandMap.searchMlgMstBrkDwn eq ''}">selected="selected"</c:if>>전체</option>
					          		<option value="4" <c:if test="${commandMap.searchMlgMstBrkDwn eq '04'}">selected="selected"</c:if>>특별행사(쇼핑몰)</option>
									<option value="34" <c:if test="${commandMap.searchMlgMstBrkDwn eq '34'}">selected="selected"</c:if>>크라운전환(쇼핑몰)</option>
							   </select>
		                    </div>
                        </div>
	                       
                    </form>
                </div><!-- // section-form-a -->
                 <div class="section-button search">
                        <a href="#none" id="search" class="button button-b"><span>검색</span></a>
                        <a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                 </div>


                <h4 class="title">목록</h4>
                <div class="right">
                    <a href="javascript:goExcelDown()" id="goExcel" class="button button-b"><span>엑셀다운로드</span></a>
                </div>
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 8%;" />
                            <col style="width: 10%;" />
                            <col style="width: 15%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>구분</th>
                                <th>내역</th>
                                <th>관리자메모</th>
                                <th>개별포인트</th>
                                <th>대상인원수</th>
                                <th>총 포인트</th>
                                <th>처리자</th>
                                <th>처리일</th>
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
		                               			<c:if test="${row.MIL_MST_GBN eq 'P'}">적립</c:if>
		                               			<c:if test="${row.MIL_MST_GBN eq 'M'}">차감</c:if>
		                               			<c:if test="${row.MIL_MST_GBN eq 'D'}">소명</c:if>
		                               		</td>
			                                <td>
			                                	 <c:out value="${row.MIL_MST_BRK_DWN_NM }"/>
			                                </td>
			                                <td>
			                                	 <c:out value="${row.MIL_MST_MEMO }"/>
			                                </td>
			                                <td>
			                                	<fmt:formatNumber value="${row.MIL_MST_PRC }" groupingUsed="true" />
			                                	 
			                                </td>
			                                <td>
			                                	<a href="#none" class="list-title" data-mil_mst_idx="${row.MIL_MST_IDX }" >
			                                		<fmt:formatNumber value="${row.MIL_MST_MIL_CNT }" groupingUsed="true" />
			                                	</a>
			                                </td>
			                                <td>
			                                	 <fmt:formatNumber value="${row.MIL_MST_MIL_TOTAL }" groupingUsed="true" />
			                                </td>
			                                <td>
			                                	 <c:out value="${row.MIL_MST_REG_NM }"/>(<c:out value="${row.MIL_MST_REG_ID }"/>)
			                                </td>
			                                <td><ui:formatDate value="${row.MIL_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
			                                
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
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchMileageStDt" value="<c:out value="${commandMap.searchMileageStDt }"/>"/>
                    <input type="hidden" name="searchMileageEdDt" value="<c:out value="${commandMap.searchMileageEdDt }"/>"/>
                    <input type="hidden" name="searchMlgMstRegId" value="<c:out value="${commandMap.searchMlgMstRegId }"/>"/>
                    <input type="hidden" name="searchMlgMstRegNm" value="<c:out value="${commandMap.searchMlgMstRegNm }"/>"/>
                    <input type="hidden" name="searchMlgMstMemo" value="<c:out value="${commandMap.searchMlgMstMemo }"/>"/>
                    <input type="hidden" name="searchMlgMstGbn" value="<c:out value="${commandMap.searchMlgMstGbn }"/>"/>
                    <input type="hidden" name="searchMlgMstBrkDwn" value="<c:out value="${commandMap.searchMlgMstBrkDwn }"/>"/>
                    <input type="hidden" name="MLG_MST_IDX" value=""/>
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
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/mileageForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 상세페이지 이동
    $(document).on("click", "#list-field .list-title", function () {
        var $this = $(this);
        
        var MIL_MST_IDX = $this.data("mil_mst_idx");
        
        popup("<c:out value="${serverDomain}" />/am/marketing/searchMileageDetailPopup.do?MIL_MST_IDX="+MIL_MST_IDX, "600", "600", "yes", "searchMileageDetailPopup");
        
    });
    
    // 검색 엔터 이벤트 
    $(document).on("keydown", "#searchWord", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        if($searchForm.valid())
        {
	        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
	        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/mileageManageList.do", "target":"_self", "method":"post"}).submit();
        }
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/mileageManageList.do", "target":"_self", "method":"post"}).submit();
    };
    
     
 // 엑셀다운
    goExcelDown = function () 
    {
    	if("${paging.totalRecordCount}" > 10000){
    		alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
    		return;
    	}else if("${paging.totalRecordCount}" == 0){
    		alert("저장할 내역이 없습니다.");
    		return;
    	}
    	
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/mileageListExcel.do", "target":"_self", "method":"post"}).submit();
    };
    
    getSubCodeList($("#searchMlgMstGbn").val());
    
});
</script>
</body>
</html>