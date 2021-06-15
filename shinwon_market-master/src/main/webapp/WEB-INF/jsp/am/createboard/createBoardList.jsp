<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

            <div class="container">

                <h2 class="title"><span>게시판 생성</span></h2>
					 
                <h3 class="title"><span>목록</span></h3>
                
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr><!-- row -->
	                            <th><span>구분</span></th>
	                            <td>
	                                <input type="radio" id="gubunA" name="searchBrdMstType" class="radio" <c:if test="${empty commandMap.searchBrdMstType }">checked="checked"</c:if> value=""/> 
		                            <label for="gubunA">전체</label> 	                  
		                            <input type="radio" id="gubunB" name="searchBrdMstType" class="radio" <c:if test="${commandMap.searchBrdMstType eq Code.BOARD_TYPE_NORMAL }">checked="checked"</c:if> value="<c:out value="${Code.BOARD_TYPE_NORMAL}"/>"/> 
		                            <label for="gubunB">일반게시판</label> 
		                            <input type="radio" id="gubunC" name="searchBrdMstType" class="radio" <c:if test="${commandMap.searchBrdMstType eq Code.BOARD_TYPE_IMAGE }">checked="checked"</c:if> value="<c:out value="${Code.BOARD_TYPE_IMAGE}"/>"/> 
		                            <label for="gubunC">이미지게시판</label> 
	                            </td>
	                            <th><span>키워드</span></th>
	                            <td>
	                               	<input type="text" class="text xlarge" name="searchBrdMstNm" id="searchBrdMstNm" value="<c:out value="${commandMap.searchBrdMstNm }"/>" placeholder="[게시판명]을 입력하세요."/>
	                            </td>
	                            <th><span>상태</span></th>
	                            <td>
	                            	<input type="radio" id="stateA" name="searchBrdMstUseYn" class="radio" <c:if test="${empty commandMap.searchBrdMstUseYn }">checked="checked"</c:if> value=""/> 
		                            <label for="stateA">전체</label> 	                  
		                            <input type="radio" id="stateB" name="searchBrdMstUseYn" class="radio" <c:if test="${commandMap.searchBrdMstUseYn eq 'Y' }">checked="checked"</c:if> value="Y"/> 
		                            <label for="stateB">사용</label> 
		                            <input type="radio" id="stateC" name="searchBrdMstUseYn" class="radio" <c:if test="${commandMap.searchBrdMstUseYn eq 'N' }">checked="checked"</c:if> value="N"/> 
		                            <label for="stateC">미사용</label> 
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="#none" id="search" class="button small primary"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm"> 
	                <input type="hidden" name="BRD_MST_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>    
                    <input type="hidden" name="searchBrdMstNm" value="<c:out value="${commandMap.searchBrdMstNm }"/>"/>	                    
                    <input type="hidden" name="searchBrdMstUseYn" value="<c:out value="${commandMap.searchBrdMstUseYn }"/>"/>
                    <input type="hidden" name="searchBrdMstType" value="<c:out value="${commandMap.searchBrdMstType }"/>"/>                
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                 		<div class="col-1-2 text-left">
	                 		<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
						</div>		
						
	                    <div class="col-1-2 text-right">
	                        <a href="javascript:;" id="goForm" class="button small primary"><span>등록</span></a>
	                    </div>
                	</div><!-- // 목록 상단 버튼 -->
			 	
	                <table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
							<col style="width: 5%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
	                        <col style="width: 8%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
	                            <th>구분</th>
	                            <th>게시판명</th>
	                            <th>상단여부</th>
	                            <th>덧글여부</th>
	                            <th>첨부파일여부</th>
	                            <th>사용여부</th>
	                            <th>미리보기</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty list }">
									<c:set var="listNum" value="${paging.listNum}" />
									<c:forEach var="row" items="${list }" varStatus="i">
										<tr>
											<td><c:out value="${listNum }"/></td>			                                
											<td>
												<c:if test="${row.BRD_MST_TYPE eq Code.BOARD_TYPE_NORMAL }">
													일반게시판
												</c:if>
												<c:if test="${row.BRD_MST_TYPE eq Code.BOARD_TYPE_IMAGE }">
													이미지게시판
												</c:if>
											</td>
											<td class="left">
												<a href="javascript:;" class="list-title" data-brd_mst_idx="<c:out value="${row.BRD_MST_IDX }"/>">
													<c:out value="${row.BRD_MST_NM }"/>
												</a>
											</td>	
											<!-- 상단여부 -->		                                			                                
											<td>
												<c:out value="${row.BRD_MST_TOP_YN eq 'Y' ? '사용' : '미사용' }"/>
											</td>
											<!-- 덧글여부 -->
											<td>
												<c:out value="${row.BRD_MST_REPLY_YN eq 'Y' ? '사용' : '미사용' }"/>
											</td>
											<!-- 첨부파일여부 -->
											<td>
												<c:out value="${row.BRD_MST_FLE_YN eq 'Y' ? '사용' : '미사용' }"/>
											</td>
											<!-- 사용여부 -->
											<td>
												<c:out value="${row.BRD_MST_USE_YN eq 'Y' ? '사용' : '미사용' }"/>
											</td>
											<!-- 미리보기 -->
											<td>
												<c:if test="${row.BRD_MST_TYPE eq Code.BOARD_TYPE_NORMAL }">
													<a href="<c:out value="${row.preBoardServerDomain }"/>/pc/customer/preBoardList.do?BRD_MST_IDX=${row.BRD_MST_IDX}" class="button button-a" target="_blank"><span>미리보기</span></a>
												</c:if>
												<c:if test="${row.BRD_MST_TYPE eq Code.BOARD_TYPE_IMAGE }">
													<a href="<c:out value="${row.preBoardServerDomain }"/>/pc/customer/preImageBoardList.do?BRD_MST_IDX=${row.BRD_MST_IDX}" class="button button-a" target="_blank"><span>미리보기</span></a>
												</c:if>
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
						
					<div class="section-pagination"><!-- section pagination -->
	                    <h4 class="sr-only">목록 페이징</h4>
	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
	                        <ui:paging paging="${paging }" jsFunction="goPage" />
	                    </div>
	                </div><!-- // section pagination -->
                </form>
            </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>


<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
$(function(){
	// 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
       $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/createboard/createBoardForm.do", "target":"_self", "method":"post"}).submit();
    }); 
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='BRD_MST_IDX']").val($(this).data("brd_mst_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/createboard/createBoardEdit.do", "target":"_self", "method":"post"}).submit();
    });
        
    //키워드 검색 필드 엔터 이벤트
    $(document).on("keydown", "#searchBrdMstNm", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/createboard/createBoardList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/createboard/createBoardList.do", "target":"_self", "method":"post"}).submit();
    };
});
//-->
</script>

</body>
</html>
