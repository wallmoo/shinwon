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

            <h2 class="title"><span>회원등급 목록</span></h2>

            <form id="frm" name="frm">
				<input type="hidden" name="MEM_GRD_CD" value="" />
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
				<input type="hidden" name="searchMemberType" value="" />
				<input type="hidden" name="searchMemGrade" value="" />
				
                <h3 class="title"><span>목록</span></h3>

                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="text-right">
                        <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        <a href="#none" id="goForm" class="button small primary"><span>등록</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 8%;" />
                        <col style="width: 10%;" />
                        <col style="width: 12%;" />
                        <col style="width: 5%;" />
                        <col style="width: 5%;" />
                        <col style="width: 8%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 5%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th>등급</th>
                            <th>등급설명</th>
                            <th>구매금액조건</th>
                            <th>E포인트</th>
                            <th>App전용 E포인트</th>
                            <th>생일기념 E포인트</th>
                            <th>추가적립포인트</th>
                            <th>회원 수</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${not empty list}">
                    		<c:forEach var="row" items="${list }" varStatus="i">
								<tr>
			                       <td><a href="#" class="list-title" data-mem_grd_idx="<c:out value="${row.MEM_GRD_CD}"/>"><c:out value="${row.MEM_GRD_NM }"/></a></td>
			                       <td class="text-left"><c:out value="${row.MEM_GRD_DESC }"/></td>
			                       <td class="text-left">
			                       		<c:if test="${not empty row.MEM_AMT_CDT_MIN}">
			                       			<fmt:formatNumber value="${row.MEM_AMT_CDT_MIN }" groupingUsed="true" /> ~ <fmt:formatNumber value="${row.MEM_AMT_CDT_MAX }" groupingUsed="true" />
			                       		</c:if>
										<c:if test="${empty row.MEM_AMT_CDT_MIN}">
			                       			<c:out value="${row.MEM_AMT_CDT_DESC }"/>
			                       		</c:if>
		                       		</td>
			                       <td>
			                       		<c:if test="${not empty row.MEM_GRD_E_PIT}">
			                       			<fmt:formatNumber value="${row.MEM_GRD_E_PIT }" groupingUsed="true" />P
			                       		</c:if>
			                       		<c:if test="${empty row.MEM_GRD_E_PIT}">
			                       			-
			                       		</c:if> 
			                       	</td>
			                       <td>
										<c:if test="${not empty row.MEM_GRD_APP_PIT}">
			                       			<fmt:formatNumber value="${row.MEM_GRD_APP_PIT }" groupingUsed="true" />P
			                       		</c:if>
			                       		<c:if test="${empty row.MEM_GRD_APP_PIT}">
			                       			-
			                       		</c:if>
			                       </td>
			                       <td>
										<c:if test="${not empty row.MEM_GRD_BRT_PIT}">
			                       			<fmt:formatNumber value="${row.MEM_GRD_BRT_PIT }" groupingUsed="true" />P
			                       		</c:if>
			                       		<c:if test="${empty row.MEM_GRD_BRT_PIT}">
			                       			-
			                       		</c:if>
			                       </td>
			                       <td>
										<c:if test="${not empty row.MEM_GRD_ADD_PIT}">
											<!-- 2020.06.08 출력부분 수정  -->
			                       			<%-- <fmt:formatNumber value="${row.MEM_GRD_ADD_PIT }" groupingUsed="true" />p --%>
			                       			<fmt:formatNumber value="${row.MEM_GRD_ADD_PIT }" groupingUsed="true" />%
			                       		</c:if>
			                       		<c:if test="${empty row.MEM_GRD_ADD_PIT}">
			                       			-
			                       		</c:if>
			                       </td>
									<td>
										<a href="javascript:goMemberList('<c:out value="${MEMBER_TYPE_BASIC }"/>','<c:out value="${row.MEM_GRD_CD }"/>')">
											<!-- 2020.06.08 출력부분 수정  -->
											<%-- <c:out value="${row.MEMBER_COUNTS }"/> --%>
											<fmt:formatNumber value="${row.MEMBER_COUNTS }" pattern="#,###"/>
										</a>
									</td>
		                        </tr>
							</c:forEach>
                    	</c:if>
                        
                    </tbody>
                </table>

                <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <a class="ir first" href="javascript:;" ><i><em>처음</em></i></a> <a class="ir prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em></em><span>1<span></strong> <a class="ir next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="ir last" href="javascript:;" ><i><em>끝</em></i></a>
                        <%-- <ui:paging paging="${paging }" jsFunction="goPage" /> --%>
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
    	var $frm = $("#frm");
    	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/memberGradeForm.do", "target":"_self", "method":"post"}).submit();
    });
	 
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $frm = $("#frm");
        $frm.find("input[name='MEM_GRD_CD']").val($(this).data("mem_grd_idx"));
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/memberGradeEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
	
    // 엑셀 다운로드
    $(document).on("click", "#excelDown", function () {
		if ("${paging.totalRecordCount}" > 10000) {
			alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
			return;
		} else if ("${paging.totalRecordCount}" == 0) {
			alert("저장할 내역이 없습니다.");
			return;
		}
		var $frm = $("#frm");
		$frm.attr({
			"action" : "<c:out value="${serverDomain}" />/am/member/memberGradeListExcelDownload.do",
			"target" : "_self",
			"method" : "post"
		}).submit();
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/memberGradeList.do", "target":"_self", "method":"post"}).submit();
    };
    
    //회원수 클릭 이벤트
    goMemberList = function(memberType, memberGrade)
    {
    	var $frm = $("#frm");
    	$frm.find("input[name='searchMemberType']").val(memberType);
    	$frm.find("input[name='searchMemGrade']").val(memberGrade);
    	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberList.do", "target":"_blank", "method":"post"}).submit();
    }
    
});
//-->
</script>

</body>
</html>
