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

                <h2 class="title"><span>메뉴 관리</span></h2>

                <h3 class="title"><span>등록</span></h3>
                
                <form id="frm" name="frm" method="post">
                <c:if test="${not empty row }">
                <!-- 상위 메뉴 정보 시작 -->
                <input type="hidden" name="ADM_MNU_IDX" value="${row.ADM_MNU_IDX }" />
                <input type="hidden" name="ADM_MNU_LEVEL" value="${row.ADM_MNU_LEVEL+1}" />
                <input type="hidden" name="ADM_MNU_UP_IDX" value="${row.ADM_MNU_IDX }"/>
                <input type="hidden" name="ADM_MNU_TOP_IDX" value="${row.ADM_MNU_TOP_IDX eq '0' ? row.ADM_MNU_IDX : row.ADM_MNU_TOP_IDX }"/>

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%; min-width: 180px;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr><!-- row -->
                            <th><span>최상위 메뉴명</span></th>
                            <td>
                                <c:out value="${empty row.ADM_MNU_TOP_NM ? row.ADM_MNU_NM : row.ADM_MNU_TOP_NM }"/>
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span>상위 메뉴명</span></th>
                            <td>
                                <c:out value="${row.ADM_MNU_NM }"/>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
                <!-- // 상위 메뉴 정보 종료 -->
                </c:if>
                
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%; min-width: 180px;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr><!-- row -->
                            <th><span>메뉴명 <i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="text" class="text" name="ADM_MNU_NM" id="ADM_MNU_NM" maxlength="50" />
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span>링크 경로 <i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="text" class="text xlarge" name="ADM_MNU_URL" id="ADM_MNU_URL" maxlength="100" />
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span>권한 체크 경로 <i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="text" class="text xlarge" name="ADM_MNU_AUTH_URL" id="ADM_MNU_AUTH_URL" maxlength="100" />
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span>상태</span></th>
                            <td>
                                <label><input type="radio" cass="radio" id="stateA" name="ADM_MNU_ON_YN" value="Y" checked="checked" /> 사용</label>
                                <label><input type="radio" cass="radio" id="stateB" name="ADM_MNU_ON_YN" value="N" /> 미사용</label>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
                </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <c:if test="${not empty row }">
                        <a href="javascript:;" id="goEdit" class="button large"><span>상위 메뉴 목록</span></a>
                        </c:if>
						<a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="javascript:;" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->

            </div><!-- // container -->

        </div><!-- // contents -->

    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<form id="searchForm" name="searchForm" method="post">
<input type="hidden" name="ADM_MNU_IDX" value="${row.ADM_MNU_IDX }" />
<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
<input type="hidden" name="searchAdmMnuNm" value="<c:out value="${commandMap.searchAdmMnuNm }"/>"/>
<input type="hidden" name="searchAdmMnuOnYN" value="<c:out value="${commandMap.searchAdmMnuOnYN }"/>"/>
</form>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
$(function(){
    // 폼체크
    $("#frm").validate({
        rules : {
            ADM_MNU_NM : { required : true },
            ADM_MNU_URL : { required : true },
            ADM_MNU_AUTH_URL : { required : true }
        }, messages : {
            ADM_MNU_NM : { required : "메뉴명을 입력해 주십시오." },
            ADM_MNU_URL : { required : "링크 경로를 입력해 주십시오." },
            ADM_MNU_AUTH_URL : { required : "권한 체크 경로를 입력해 주십시오." }
        }
    });
    
    // 상위 메뉴 목록 버튼 클릭 이벤트
    $("#goEdit").on("click", function(){
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/menuManagerEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 목록 버튼 클릭 이벤트 
    $("#goList").on("click", function(){
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/menuManagerList.do", "target":"_self", "method":"post"}).submit();  
    });
    
    // 등록 이벤트
    $("#goRegist").on("click", function(){
        var $frm = $("#frm"); 
        if($frm.valid()){
            if(confirm("저장 하시겠습니까?")){
                $("#ADM_MNU_URL").val($.trim($("#ADM_MNU_URL").val()));
                $("#ADM_MNU_AUTH_URL").val($.trim($("#ADM_MNU_AUTH_URL").val()));
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/menuManagerRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
});
//-->
</script>
</body>
</html>
