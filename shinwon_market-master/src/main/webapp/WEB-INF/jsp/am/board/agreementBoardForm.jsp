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

                <h3 class="title"><span>등록</span></h3>

                <form id="frm" name="frm">
                <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
                <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%; min-width: 180px;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr><!-- row -->
                            <th><span>유형</span></th>
                            <td>
                                <select class="select" name="BRD_AGR_TYPE" id="BRD_AGR_TYPE">
                                    <option value="">선택</option>
                                    <c:if test="${not empty codeList }">
                                        <c:forEach var="codeRow" items="${codeList }" varStatus="i">
                                            <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>">
                                                <c:out value="${codeRow.CMN_COM_NM }"/>
                                            </option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span>약관내용</span></th>
                            <td>
                                <textarea name="BRD_AGR_CONTENTS" id="BRD_AGR_CONTENTS" cols="30" rows="10" class="textarea xlarge"></textarea>
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
<script src="/am/js/common/jquery.ajax.js"></script>
<script>
$(function(){
    // 목록
    goList = function(){
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/agreementBoardList.do", "target":"_self", "method":"post"}).submit(); 
    };

    // 저장
    goRegist = function(){
        // 유형 체크
        if($("#BRD_AGR_TYPE").val() == ""){
            alert("유형을 선택해주세요.");
            $("#BRD_AGR_TYPE").focus();
            return false;
        }

        // 유형 중복 체크
        if(agreementBoardTypeCheck()){
            try{
                oEditors.getById["BRD_AGR_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);
            }catch(e){ 
                ;
            };

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
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/agreementBoardRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }else{
            alert("이미 등록된 이용약관 유형입니다.\n다른 유형을 선택해 주십시오.");
            return false;
        }
    };

    // 유형 중복 체크
    function agreementBoardTypeCheck(){
        var blnCheck = false;

        $.postSyncJsonAjax("<c:out value="${serverDomain}" />/am/board/agreementBoardTypeAjax.do", { BRD_AGR_TYPE : $("#BRD_AGR_TYPE").val() }, function(data){
            if(data.cnt == 0){
                blnCheck = true;
            }
        });

        return blnCheck;
    }
});
//-->
</script>

</body>
</html>
