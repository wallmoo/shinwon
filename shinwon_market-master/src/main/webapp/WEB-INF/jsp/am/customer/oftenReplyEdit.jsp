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
                <a href="#none">고객센터</a>
                &gt;
                <span>자주쓰는 답변</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">자주쓰는답변</h3>

                <h4 class="title">수정</h4>

                <p>
                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form name="searchForm" id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchCmnCmnComIdx" value="<c:out value="${commandMap.searchCmnCmnComIdx }"/>"/>
                    <input type="hidden" name="searchCmnAnsUseYn" value="<c:out value="${commandMap.searchCmnAnsUseYn }"/>"/>
                </form>
                <div class="section-form"><!-- section-form-a -->
                    <form name="frm" id="frm">
                        <input type="hidden" name="CMN_ANS_IDX" id="CMN_ANS_IDX" value="<c:out value="${row.CMN_ANS_IDX }"/>"/>
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
	                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
	                    <input type="hidden" name="searchCnmCmnComIdx" value="<c:out value="${commandMap.searchCnmCmnComIdx }"/>"/>
	                    <input type="hidden" name="searchCmnAnsUseYn" value="<c:out value="${commandMap.searchCmnAnsUseYn }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    
	                    <div class="form-group">
	                        <label class="label"><span>문의유형 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <select class="select" name="CMN_CMN_COM_IDX" id="CMN_CMN_COM_IDX">
	                                <option value="" <c:if test="${empty row.CMN_CMN_COM_IDX }">selected="selected"</c:if>>선택</option>
	                                <c:if test="${not empty inqTypeCodeList }">
	                                   <c:forEach var="codeRow" items="${inqTypeCodeList }" varStatus="i">
	                                       <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${row.CMN_CMN_COM_IDX eq codeRow.CMN_COM_IDX }">selected="selected"</c:if>>
	                                           <c:out value="${codeRow.CMN_COM_NM }"/>
	                                       </option>
	                                   </c:forEach>
	                               </c:if>
	                            </select>
	                        </div>
	                    </div>
	
	                    <div class="form-group">
	                        <label class="label"><span>제목 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <input type="text" name="CMN_ANS_TITLE" id="CMN_ANS_TITLE" class="text long" value="<c:out value="${row.CMN_ANS_TITLE }"/>"/>
	                        </div>
	                    </div>
	
	                    <div class="form-group">
	                        <label class="label"><span>답변내용 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <textarea class="textarea" name="CMN_ANS_CONTENTS" id="CMN_ANS_CONTENTS" style="height: 500px;"><c:out value="${row.CMN_ANS_CONTENTS }"/></textarea>
	                        </div>
	                    </div>
                    </form>
                </div><!-- // section-form-a -->

                <div class="section-button"><!-- section button -->
                    <a href="#none" id="goRemove" class="button button-a"><span>삭제</span></a>
                    <a href="#none" id="goModify" class="button button-b"><span>저장</span></a>
                    <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
                </div><!-- // section button -->    


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
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>
<ui:editor objId="#CMN_ANS_CONTENTS"/>
<script type="text/javascript">
$(document).ready(function () {
    $("#frm").validate({
        rules: {
            CMN_CMN_COM_IDX:{required:true},
            CMN_ANS_TITLE:{required:true}
        }
    });
    
    // 등록 버튼 클릭 이벤트
    $(document).on("click", "#goModify", function () {
        var $frm = $("#frm");
        
        if($frm.valid()){
        	try { oEditors.getById["CMN_ANS_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ }
            var CONTENTS = stringUtil.getString($.trim($("#CMN_ANS_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            	 alert("[내용]반드시 입력해주십시오.");
                $("#CMN_ANS_CONTENTS").focus();
                return;
            }
            if (confirm( "저장 하시겠습니까?")) 
            {
                $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/board/oftenReplyModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
    
    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}"/>/am/board/oftenReplyList.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 삭제 버튼 클릭 이벤트
    $(document).on("click", "#goRemove", function () {
        if (confirm( "삭제 하시겠습니까?")) 
        {
            $("#frm").attr({"action":"<c:out value="${serverDomain }"/>/am/board/oftenReplyRemove.do", "target":"_self", "method":"post"}).submit();
        }
    });
});
</script>
</body>
</html>