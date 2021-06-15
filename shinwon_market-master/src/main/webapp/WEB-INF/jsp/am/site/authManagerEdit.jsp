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

                <h2 class="title"><span>권한관리</span></h2>

                <div class="section-title"><!-- section-title -->
                    <h3 class="title"><span>기본 정보</span></h3>
                </div><!-- // section-title -->
                
                <form id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchAutMstNm" value="<c:out value="${commandMap.searchAutMstNm }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchAutMstState" value="<c:out value="${commandMap.searchAutMstState }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>
                
                <form id="frm" name="frm">
                	<input type="hidden" name="AUT_MST_IDX" value="<c:out value="${row.AUT_MST_IDX }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchAutMstNm" value="<c:out value="${commandMap.searchAutMstNm }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchAutMstState" value="<c:out value="${commandMap.searchAutMstState }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr><!-- row -->
                                <th><span>권한명<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" class="text large" name="AUT_MST_NM" id="AUT_MST_NM" maxlength="40" value="<c:out value="${row.AUT_MST_NM }"/>"/>
                                </td>
                            </tr>
                            <tr><!-- row -->
                                <th><span>상태<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" id="stateA" name="AUT_MST_STATE" value="Y" class="radio" <c:if test="${row.AUT_MST_STATE eq 'Y' }">checked="checked"</c:if>/>
		                            <label for="stateA">사용</label>
		                            <input type="radio" id="stateB" name="AUT_MST_STATE" value="N" class="radio" <c:if test="${row.AUT_MST_STATE eq 'N' }">checked="checked"</c:if>/>
		                            <label for="stateB">미사용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                    <div class="section-title"><!-- section-title -->
                        <h3 class="title"><span>권한 설정</span></h3>
                        <div class="more">
                            <a href="javascript:;" id="checkAll" class="button small"><span>전체선택</span></a>
                            <a href="javascript:;" id="unCheckAll" class="button small"><span>선택해제</span></a>
                        </div>
                    </div><!-- // section-title -->
                    
                    <c:if test="${not empty menuList }">
                        <table cellspacing="0" class="table-row table-a is-td-valign-top menuList"><!-- table -->
                            <colgroup>
                                <col style="width: 15%; min-width: 180px;" />
                                <col style="width: 35%;" />
                                <col style="width: 15%; min-width: 180px;" />
                                <col style="width: 35%;" />
                            </colgroup>
                            <tbody id="menuCheckList">
                            	<c:set var="k" value="1"/>    
                                <c:forEach var="row" items="${menuList }" varStatus="i">
                                    <c:if test="${row.ADM_MNU_LEVEL eq 0 and k % 2 eq 1}">
                                    <tr><!-- row -->
                                    </c:if>
                                    <c:if test="${row.ADM_MNU_LEVEL eq '0' }">
                                        <th>
                                            <span>
                                                <label>
                                                    <input type="checkbox" name="ADM_ADM_MNU_IDX" class="checkbox admin_mnu_depth1" value="<c:out value="${row.ADM_MNU_IDX }"/>" <c:if test="${row.ADM_MNU_CHECK_YN eq 'Y' }">checked="checked"</c:if> />
                                                    <c:out value="${row.ADM_MNU_NM }"/>
                                                </label>
                                            </span>
                                        </th>
                                        <td>
                                    </c:if>
                                    <c:if test="${row.PREV_ADM_MNU_IDX eq row.ADM_MNU_UP_IDX and row.ADM_MNU_LEVEL eq 1}">
                                        <ul class="d1">
                                    </c:if>
                                    <c:if test="${row.PREV_ADM_MNU_IDX eq row.ADM_MNU_UP_IDX and row.ADM_MNU_LEVEL eq 2}">
                                        <ul class="d2">
                                    </c:if>
                                    <c:if test="${row.ADM_MNU_LEVEL > 0 and row.ADM_MNU_LEVEL eq 1}">
                                        <li class="d1">
                                            <label><input type="checkbox" class="checkbox admin_mnu_depth2" name="ADM_ADM_MNU_IDX" value="<c:out value="${row.ADM_MNU_IDX }"/>" <c:if test="${row.ADM_MNU_CHECK_YN eq 'Y' }">checked="checked"</c:if> /><c:out value="${row.ADM_MNU_NM }" /></label>
                                    </c:if>
                                    <c:if test="${row.ADM_MNU_LEVEL > 0 and row.ADM_MNU_LEVEL eq 2}">
                                        <li class="d2">
                                            <label><input type="checkbox" class="checkbox admin_mnu_depth3" name="ADM_ADM_MNU_IDX" value="<c:out value="${row.ADM_MNU_IDX }"/>" <c:if test="${row.ADM_MNU_CHECK_YN eq 'Y' }">checked="checked"</c:if> /><c:out value="${row.ADM_MNU_NM }"/></label>    
                                    </c:if>
                                    
                                    <c:if test="${row.ADM_MNU_LEVEL gt 0 and row.ADM_MNU_CHILD_CNT eq '0' }">
                                        </li>
                                    </c:if>
                                    
                                    <c:if test="${row.ADM_MNU_LEVEL gt 0 and row.NEXT_ADM_MNU_LEVEL < row.ADM_MNU_LEVEL}">
                                        <c:forEach begin="1" end="${row.NEXT_ADM_MNU_LEVEL eq '0' ? row.ADM_MNU_LEVEL : (row.ADM_MNU_LEVEL-row.NEXT_ADM_MNU_LEVEL)}" varStatus="j">
                                            </ul>
                                            <c:if test="${row.ADM_MNU_LEVEL gt 1 and (not j.last or row.NEXT_ADM_MNU_LEVEL ne 0)}">
                                            </li>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${row.NEXT_ADM_MNU_LEVEL eq 0 }">
                                        </td>
                                        <c:set var="k" value="${k+1}"/> 
                                    </c:if>
                                    <c:if test="${row.NEXT_ADM_MNU_LEVEL eq 0 and k % 2 eq 1}">
                                    </tr>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table><!-- // table -->
                    </c:if>
                </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
						<a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="javascript:;" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->


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

<form id="searchForm">
<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
<input type="hidden" name="searchAutMstNm" value="<c:out value="${commandMap.searchAutMstNm }"/>"/>
<input type="hidden" name="searchAutMstState" value="<c:out value="${commandMap.searchAutMstState }"/>"/>
<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
</form>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script type="text/javascript">
$(function() {

    var $frm = $("#frm"); 
    
    // 폼체크
    $frm.validate({
        rules: {
            AUT_MST_NM:{required:true}, // 권한명
            AUT_MST_STATE:{required:true} // 상태
        },
        messages :{
        	AUT_MST_NM : {required:"[권한명]은 필수 입력 사항입니다."},
        	AUT_MST_STATE : {required:"[상태]는 필수 선택 사항입니다."}
        }
    });
    
    // 권한 전체 선택
    $("#checkAll").on("click", function () {
        $(".menuList").find("input[type='checkbox']").prop("checked", true);
    });
    // 권한 전체 선택 해제
    $("#unCheckAll").on("click", function () {
        $(".menuList").find("input[type='checkbox']").prop("checked", false);
    });
    
    // 메뉴 선택
    $("#menuCheckList").find("input[type=checkbox]").on("click", function(){
        var thisClass = $(this).attr("class");
        var checkYn =  $(this).is(":checked");
        
        if(thisClass.indexOf("admin_mnu_depth1") != -1){ // 1depth click
            var targetTh = $(this).parent().parent().parent();
            var targetTd = $(targetTh).next();
            
            // 2depth, 3depth checked
            $(targetTd).find("input[type=checkbox]").prop("checked", checkYn);
        }else if(thisClass.indexOf("admin_mnu_depth2") != -1){ // 2depth click
            var targetTd = $(this).parent().parent().parent().parent();
            var targetTh = $(targetTd).prev();
            var targetUl = $(this).parent().parent().find("ul");

            // 3depth checked
            $(targetUl).find(".admin_mnu_depth3").prop("checked", checkYn);

            // 1depth checked
            if($(targetTd).find("input[type=checkbox]:checked").length == 0){
                $(targetTh).find(".admin_mnu_depth1").prop("checked", false);
            }else{
                $(targetTh).find(".admin_mnu_depth1").prop("checked", true);
            }
        }else if(thisClass.indexOf("admin_mnu_depth3") != -1){ // 3depth click
            var targetTd = $(this).parent().parent().parent().parent().parent().parent();
            var targetTh = $(targetTd).prev();
            var targetUl = $(this).parent().parent().parent();

            // 2depth checked
            if($(targetUl).find("input[type=checkbox]:checked").length == 0){
                $(targetUl).siblings("label").find(".admin_mnu_depth2").prop("checked", false);
            }else{
                $(targetUl).siblings("label").find(".admin_mnu_depth2").prop("checked", true);
            }

            // 1depth checked
            if($(targetTd).find("input[type=checkbox]:checked").length == 0){
                $(targetTh).find(".admin_mnu_depth1").prop("checked", false);
            }else{
                $(targetTh).find(".admin_mnu_depth1").prop("checked", true);
            }
        }
    });
    
    // 목록 버튼 클릭 이벤트 
    $("#goList").on("click", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/authManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    
    // 등록 이벤트
    $("#goRegist").on("click", function () {
        
        if($frm.valid()){
            if (confirm( "저장 하시겠습니까?")) {
                $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/authManagerModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
});
</script>
</body>
</html>