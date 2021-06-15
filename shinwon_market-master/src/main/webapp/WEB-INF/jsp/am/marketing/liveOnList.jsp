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

            <h2 class="title"><span>라이브 ON</span></h2>

            <h3 class="title"><span>목록</span></h3>

            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />

                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>등록일</span></th>
                            <td colspan="3">
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" name="searchPlnMstStDt" id="searchPlnMstStDt" value="<c:out value="${commandMap.searchPlnMstStDt }"/>" readonly="readonly" data-target-end="#searchPlnMstEdDt"> ~
                                <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                <input type="text" class="text" name="searchPlnMstEdDt" id="searchPlnMstEdDt" value="<c:out value="${commandMap.searchPlnMstEdDt }"/>" readonly="readonly" data-target-start="#searchPlnMstStDt">
                                <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                <a href="javascript:fnDateSet('searchPlnMstEdDt', 'searchPlnMstStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><span>상품명/상품코드</span></th>
                            <td>
                              <input type="text" name="searchPrdMstNm" id="searchPrdMstNm" class="text" value="${commandMap.searchPrdMstNm }"/> / <input type="text" name="searchPrdMstCd" id="searchPrdMstCd" class="text" value="${commandMap.searchPrdMstCd }"/>
                            </td>
                            <th><span>전시상태</span></th>
                            <td>
                                <input type="radio" id="stateA" name="searchPrdMstLiveOnDspYn" class="radio" <c:if test="${empty commandMap.searchPrdMstLiveOnDspYn }">checked="checked"</c:if> value="" />
                                <label for="stateA">전체</label>
                                <input type="radio"	id="stateB" name="searchPrdMstLiveOnDspYn" class="radio"  value="Y" <c:if test="${commandMap.searchPrdMstLiveOnDspYn eq 'Y' }">checked="checked"</c:if>/>
                                <label for="stateB">전시</label>
                                <input type="radio" id="stateC" name="searchPrdMstLiveOnDspYn" class="radio"  value="N" <c:if test="${commandMap.searchPrdMstLiveOnDspYn eq 'N' }">checked="checked"</c:if>/>
                                <label for="stateC">미전시</label>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </form>

            <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                <a href="javascript:goSearch();" id="search" class="button small primary"><span>검색</span></a>
            </div>
			
            <form id="frm" name="frm">
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                
                <input type="hidden" name="PLN_MST_IDX" value="" />

                <input type="hidden" name="searchPlnMstShopType" value="<c:out value="${commandMap.searchPlnMstShopType }"/>" />
                <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchExpMstCd }"/>" />
                <input type="hidden" name="searchPlnMstStDt" value="<c:out value="${commandMap.searchPlnMstStDt }"/>" />
                <input type="hidden" name="searchPlnMstEdDt" value="<c:out value="${commandMap.searchPlnMstEdDt }"/>" />
                <input type="hidden" name="searchPlnMstStatus" value="<c:out value="${commandMap.searchPlnMstStatus }"/>" />
                <input type="hidden" name="searchPlnMstUseYn" value="<c:out value="${commandMap.searchPlnMstUseYn }"/>" />
                <input type="hidden" name="selectedPrdMstList" id="selectedPrdMstList">

                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">
                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                        <span class="pages">
                            	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
                            </span>
                    </div>                    
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 3%;" />
                        <col style="width: 3%;" />
                        <col style="width: 15%;" />
                        <col style="width: 8%;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                        <col style="width: 15%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th colspan="2">NO</th>
                            <th>상품코드</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>등록/수정일</th>
                            <th>전시상태</th>
                        </tr>
                    </thead>
                    <tbody id="liveOnList">
                    	<c:choose>
                    		<c:when test="${not empty list }">
                    			<c:forEach var="row" items="${list }" varStatus="i">
                    				<tr>
			                            <td>
			                                <a href="#none" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△ </a>
			                                <a href="#none" class="row-sort" data-sort_type="down" onclick="moveDown(this)"> ▽</a>
											<input type="hidden" name="PRD_MST_LIVE_ON_SRT" value="${row.RNUM}"></input>
			                            </td>
			                            <td>${row.RNUM}</td>
			                            <td><a href="/am/product/basicProductEdit.do?PRD_MST_CD=${row.PRD_MST_CD }" class="list-title" data-prd_mst_cd="<c:out value="${row.PRD_MST_CD }"/>">${row.PRD_MST_CD}</a></td>
			                            <td><span class="thumbnail_img"><img src="${cdnDomain}${row.PRD_IMAGE}"></span></td>
			                            <td class="text-left"><a href="/pc/product/productView.do?PRD_MST_CD=${row.PRD_MST_CD}">${row.PRD_MST_NM }</a></td>
			                            <td><ui:formatDate pattern="yyyy.MM.dd HH:mm:ss" value="${row.PRD_MST_REG_DT}"/> </td>
			                            <td>
			                                <select class="select">
			                                    <option value="Y" <ui:select v="${row.PRD_MST_LIVE_ON_DSP_YN}" t="Y" g="selected"/>>전시</option>
			                                    <option value="N" <ui:select v="${row.PRD_MST_LIVE_ON_DSP_YN}" t="N" g="selected"/>>미전시</option>
			                                </select>
			                            </td>
			                        </tr>
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
                </form>

                <div class="section-button text-center" style="margin-bottom:30px;"><!-- section button -->
                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
                </div><!-- // section button -->

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->

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

    // 검색 버튼 클릭 이벤트
    goSearch = function()
    {
    	var searchPlnMstStDt = $("#searchPlnMstStDt").val().replace(/\-/g, "");
    	var searchPlnMstEdDt = $("#searchPlnMstEdDt").val().replace(/\-/g, "");

    	if(searchPlnMstStDt != "" && searchPlnMstEdDt != "" && searchPlnMstStDt > searchPlnMstEdDt){
    		alert("등록종료일자가 등록시작일자이후 여야 합니다.");
    		return;
    	} 
        var $searchForm = $("#searchForm");
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/liveOnList.do", "target":"_self", "method":"post"}).submit();
    };

	// 저장 버튼
	$(document).on("click",	"#goRegist",function() {
		var data = new Array();
    	$("#liveOnList").find("tr").each(function(i){
    		var obj = new Object();
			var $tr = $(this).find(".list-title");
			obj.PRD_MST_CD = $tr.data("prd_mst_cd");
			obj.PRD_MST_LIVE_ON_SRT = $(this).find("[name=PRD_MST_LIVE_ON_SRT]").val();
			obj.PRD_MST_LIVE_ON_DSP_YN = $(this).find("select :selected").val();
			data.push(obj);
		});

		$("#selectedPrdMstList").val(JSON.stringify(data));
		$("#frm").attr(
				{
					"action" : "<c:out value="${serverDomain}" />/am/marketing/liveOnListModify.do",
					"target" : "_self",
					"method" : "post"
				}).submit();
	});
    
    // 검색 엔터 이벤트
    $('#searchForm').find("input").not(".datepicker").keydown(function (e){
        if(e.keyCode == 13)
        {
            goSearch();
        }
    });

    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });

    // 페이지 이동
    goPage = function (cPage) {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/liveOnList.do", "target":"_self", "method":"post"}).submit();
    };
});


function moveUp(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
	if($tr.prev().length == 0){
		alert("최상위 순서 입니다.");
		return;
	}

	var index = $(el).parent().children()[2].value
	$tr.prev().children()[0].children[2].value =index;
	$tr.prev().children()[1].textContent =index;

	$(el).parent().children()[2].value = --index;
	$(el).parent().parent().children()[1].textContent = index;
	
	$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
}

function moveDown(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
	if($tr.next().length == 0){
		alert("최하위 순서 입니다.");
		return;
	}
	var index = $(el).parent().children()[2].value
	$tr.next().children()[0].children[2].value =index;
	$tr.next().children()[1].textContent = index;	// no값 변경
	$(el).parent().children()[2].value = ++index;
	$(el).parent().parent().children()[1].textContent = index;
	$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
}
//-->
</script>

</body>
</html>
