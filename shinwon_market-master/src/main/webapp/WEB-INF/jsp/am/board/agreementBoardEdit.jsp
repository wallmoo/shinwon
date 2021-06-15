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

                <h2 class="title"><span>약관관리</span></h2>

                <h3 class="title"><span>수정</span></h3>

                <form id="frm" name="frm">
                <input type="hidden" name="BRD_AGR_IDX" value="<c:out value="${info.BRD_AGR_IDX}"/>"/>
                <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%; min-width: 180px;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr><!-- row -->
                            <th><span>유형</span></th>
                            <td>
                                <c:out value="${info.CMN_COM_NM}" />
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span>약관내용</span></th>
                            <td>
                                <textarea name="BRD_AGR_CONTENTS" id="BRD_AGR_CONTENTS" cols="30" rows="10" class="textarea xlarge"><c:out value="${info.BRD_AGR_CONTENTS}" /></textarea>
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span>개정이력</span></th>
                            <td>
                                <textarea name="BRD_AGR_HIS_CONTENTS" id="BRD_AGR_HIS_CONTENTS" cols="30" rows="10" class="textarea xlarge"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
                </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                    	<a href="javascript:goRegist();" class="button large primary"><span>저장</span></a>
                        <a href="javascript:goList();" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->

                <h3 class="title"><span>개정이력</span></h3>

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                <colgroup>
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                    <col style="width: auto;" />
                </colgroup>
                <thead>
                    <tr>
                        <th><span>내용</span></th>
                        <th><span>작성자</span></th>
                        <th><span>변경일</span></th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty historyList }">
                            <c:forEach var="row" items="${historyList }" varStatus="i">
                                <tr>
                                    <td class="text-left">
                                        <c:out value="${row.BRD_AGR_HIS_CONTENTS }"/>
                                    </td>
                                    <td>
                                        <c:out value="${row.BRD_AGR_HIS_REG_ID }"/>(<c:out value="${row.BRD_AGR_HIS_REG_NM }"/>)
                                    </td>
                                    <td><ui:formatDate value="${row.BRD_AGR_HIS_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="3">조회된 데이터가 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
                </table><!-- // table -->
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

<form id="searchForm">
<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
</form>

<ui:editor objId="#BRD_AGR_CONTENTS"/>
<script>
$(function(){
    // 목록
    goList = function(){
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/agreementBoardList.do", "target":"_self", "method":"post"}).submit(); 
    };

    // 저장
    goRegist = function(){
    	try { oEditors.getById["BRD_AGR_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ }
        var CONTENTS = stringUtil.getString($.trim($("#BRD_AGR_CONTENTS").val()), "");

        if(CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            alert("약관내용을 입력해주세요");
            $("#BRD_AGR_CONTENTS").focus();
            return;
        }

        if($("#BRD_AGR_HIS_CONTENTS").val() == ""){
            alert("개정이력을 입력해 주세요.");
            $("#BRD_AGR_HIS_CONTENTS").focus();
            return;
        }

        if (confirm( "저장 하시겠습니까?")) {
            $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/agreementBoardModify.do", "target":"_self", "method":"post"}).submit();
        }
    };
});
//-->
</script>

</body>
</html>
