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
                <a href="#none">상품관리</a>
                &gt;
                <span>안내문구관리</span>
            </div><!-- // breadcrumb -->
    
            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">안내문구관리</h3>

                <h4 class="title">수정</h4>

                <p>
                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
                </p>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                    <input type="hidden" name="searchBrdGdsTitle" value="<c:out value="${commandMap.searchBrdGdsTitle }"/>"/>
	                    <input type="hidden" name="searchBrdGdsContents" value="<c:out value="${commandMap.searchBrdGdsContents }"/>"/>
	                    <input type="hidden" name="searchBrdGdsUseYn" value="<c:out value="${commandMap.searchBrdGdsUseYn }"/>"/>
	                    <input type="hidden" name="searchBrdGdsTopYn" value="<c:out value="${commandMap.searchBrdGdsTopYn }"/>"/>
	                    <input type="hidden" name="searchBrdGdsCat" value="<c:out value="${commandMap.searchBrdGdsCat }"/>"/>
                    </form>
                    <form id="frm" name="frm" enctype="multipart/form-data" >
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="BRD_GDS_IDX" id="BRD_GDS_IDX" value="<c:out value="${row.BRD_GDS_IDX }"/>"/>
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                        <input type="hidden" name="searchBrdGdsTitle" value="<c:out value="${commandMap.searchBrdGdsTitle }"/>"/>
                        <input type="hidden" name="searchBrdGdsContents" value="<c:out value="${commandMap.searchBrdGdsContents }"/>"/>
                        <input type="hidden" name="searchBrdGdsUseYn" value="<c:out value="${commandMap.searchBrdGdsUseYn }"/>"/>
                        <input type="hidden" name="searchBrdGdsTopYn" value="<c:out value="${commandMap.searchBrdGdsTopYn }"/>"/>
                        <input type="hidden" name="searchBrdGdsCat" value="<c:out value="${commandMap.searchBrdGdsCat }"/>"/>
	
	                    <div class="form-group">
	                        <label class="label"><span>안내문구 제목 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <input type="text" name="BRD_GDS_TITLE" id="BRD_GDS_TITLE" class="text long" value="<c:out value="${row.BRD_GDS_TITLE }"/>"  maxlength="255"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>게시글코드 </span></label>
	                        <div class="field">
	                            <c:out value="${row.BRD_GDS_IDX}"/>
	                        </div>
	                    </div>
	                                            
	                    <div class="form-group">
	                        <label class="label"><span>분류 <em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<select class="select" id="BRD_GDS_CAT" name="BRD_GDS_CAT" >
	                        		<option value="">선택</option>
									<option value="<c:out value="${Code.PRODUCT_GUIDE_INFO}" />"     <ui:select v="${row.BRD_GDS_CAT }" t="${Code.PRODUCT_GUIDE_INFO }" g="selected"/>><c:out value="${Code.PRODUCT_GUIDE_NM[Code.PRODUCT_GUIDE_INFO]}" /></option>
                                	<option value="<c:out value="${Code.PRODUCT_GUIDE_SIZE}" />"     <ui:select v="${row.BRD_GDS_CAT }" t="${Code.PRODUCT_GUIDE_SIZE }" g="selected"/>><c:out value="${Code.PRODUCT_GUIDE_NM[Code.PRODUCT_GUIDE_SIZE]}" /></option>
                                	<option value="<c:out value="${Code.PRODUCT_GUIDE_WASH}" />"     <ui:select v="${row.BRD_GDS_CAT }" t="${Code.PRODUCT_GUIDE_WASH }" g="selected"/>><c:out value="${Code.PRODUCT_GUIDE_NM[Code.PRODUCT_GUIDE_WASH]}" /></option>
                                	<option value="<c:out value="${Code.PRODUCT_GUIDE_SHIPPING}" />" <ui:select v="${row.BRD_GDS_CAT }" t="${Code.PRODUCT_GUIDE_SHIPPING }" g="selected"/>><c:out value="${Code.PRODUCT_GUIDE_NM[Code.PRODUCT_GUIDE_SHIPPING]}" /></option>
                                	<option value="<c:out value="${Code.PRODUCT_GUIDE_AS}" />"       <ui:select v="${row.BRD_GDS_CAT }" t="${Code.PRODUCT_GUIDE_AS }" g="selected"/>><c:out value="${Code.PRODUCT_GUIDE_NM[Code.PRODUCT_GUIDE_AS]}" /></option>
								</select>
	                            <input type="checkbox" name="BRD_GDS_TOP_YN" id="BRD_GDS_TOP_YN" class="checkbox channelType" value="Y" <c:if test="${row.BRD_GDS_TOP_YN eq 'Y' }">checked="checked"</c:if>/>
	                            <label for="BRD_GDS_TOP_YN">[기본] 문구로 설정</label>
	                        </div>
	                    </div>
	                                            
	                    <div class="form-group">
	                        <label class="label"><span>상태 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <input type="radio" name="BRD_GDS_USE_YN" id="stateA" value="Y" class="radio" <c:if test="${row.BRD_GDS_USE_YN eq 'Y' }">checked="checked"</c:if>/>
	                            <label for="stateA">사용</label>
	                            <input type="radio" name="BRD_GDS_USE_YN" id="stateB" value="N" class="radio" <c:if test="${row.BRD_GDS_USE_YN eq 'N' }">checked="checked"</c:if>/>
	                            <label for="stateB">미사용</label>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group" >
	                        <label class="label"><span>이미지</span></label>
	                        <div class="field">
	                        	<input id="file" name="file" type="file" class="file"/>
	                            <small class="desc">최대 3M까지 첨부가능</small>
	                            
	                            <input type="hidden" value="${fn:length(fileList)}" id="fileListLen"/>
	                            <c:forEach items="${fileList}" var="fileRow" varStatus="i">	
	                            	<c:set var="cmnFleAltTxt" value="${fileRow.CMN_FLE_ALT_TXT }"/>
									<a href="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH }${fileRow.CMM_FLE_SYS_NM }" class="button button-a small js-modal" data-width="600" data-height="700" data-scroll="true" target="_blank" title="새 창 으로 열립니다.">
									    <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
                                    </a>
                                    <input type="hidden" name="OLD_CMN_FLE_ALT_TXT" value="<c:out value="${fileRow.CMN_FLE_ALT_TXT }"/>"/>
                                    <input type="hidden" name="OLD_CMN_FLE_ALT_TXT_IDX" value="<c:out value="${fileRow.CMM_FLE_IDX}"/>"/>                                    
								</c:forEach>
								
								<br/>대체텍스트 <input type="text" name="CMN_FLE_ALT_TXT" id="CMN_FLE_ALT_TXT" class="text" value="${cmnFleAltTxt}" placeholder="20자 이내로 입력하세요." maxlength="100" style="width: 60%;"/>
																		
	                        </div>
	                    </div>
	
	                    <div class="form-group">
	                        <label class="label"><span>내용 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <textarea class="textarea" name="BRD_GDS_CONTENTS" id="BRD_GDS_CONTENTS" style="height: 500px;"><c:out value="${row.BRD_GDS_CONTENTS }"/></textarea>
	                        </div>
	                    </div>
                    </form>
                </div><!-- // section-form-a -->

                <div class="section-button"><!-- section button -->
                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
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
<ui:editor objId="#BRD_GDS_CONTENTS"/>
<script type="text/javascript">
$(document).ready(function () {
    
	//유형 변경시
	<%
	/**
	$(document).on("change","#BRD_GDS_CAT",function(){

		//상품기술정보, 공백이 아닌 것들만 체크함.
		if( $(this).val() == "${Code.PRODUCT_GUIDE_SIZE}"){
            $(".fileDiv").show(); //파일 첨부 활성화
            $(".file").prop("disabled", false);
		}else {
			$(".fileDiv").hide(); //파일 첨부 비활성화
			$(".file").prop("disabled", true);
		}
	});
	**/
	%>
    // 폼체크
    $("#frm").validate({
        rules: {
            BRD_GDS_USE_YN:{required:true}, // 사용 유무
            BRD_GDS_TITLE:{required:true} // 제목
        }
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/product/guideList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        if($frm.valid()){
        	
        	if($("#BRD_GDS_CAT").val() == "")
        	{
        		alert("[분류]반드시 선택해주십시오.");
        		$(this).focus();
        		return;
        	}
        	
        	try { oEditors.getById["BRD_GDS_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ }
            var CONTENTS = stringUtil.getString($.trim($("#BRD_GDS_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            	 alert("[내용]반드시 입력해주십시오.");
                $("#BRD_GDS_CONTENTS").focus();
                return;
            }
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/guideModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
});
</script>
</body>
</html>