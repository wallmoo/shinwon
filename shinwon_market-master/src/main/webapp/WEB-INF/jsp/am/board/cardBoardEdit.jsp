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
                <span>카드이벤트 안내 관리</span>
            </div><!-- // breadcrumb -->
    
            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">카드이벤트 안내 관리</h3>

                <h4 class="title">수정</h4>

                <p>
                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
                </p>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm">
                    	<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
	                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
	                    <input type="hidden" name="searchBrdCarUseYn" value="<c:out value="${commandMap.searchBrdCarUseYn }"/>"/>
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    </form>
                    <form id="frm" name="frm" enctype="multipart/form-data">                    
                     	<input type="hidden" name="BRD_CAR_IDX" value="<c:out value="${info.BRD_CAR_IDX}"/>"/>
                     	<input type="hidden" name="BRD_CAR_GUBUN_CD" value="<c:out value="${info.BRD_CAR_GUBUN_CD}"/>"/>
						<input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
						<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
						
						<div class="form-group">
	                        <label class="label"><span>상태</span></label>
	                        <div class="field">
	                            <input type="radio" name="BRD_CAR_USE_YN" id="stateA" value="Y" class="radio" <c:if test="${info.BRD_CAR_USE_YN eq 'Y' }">checked="checked"</c:if>/>
	                            <label for="stateA">사용</label>
	                            <input type="radio" name="BRD_CAR_USE_YN" id="stateB" value="N" class="radio" <c:if test="${info.BRD_CAR_USE_YN eq 'N' }">checked="checked"</c:if>/>
	                            <label for="stateB">미사용</label>
	                        </div>
	                    </div>
	                    
						<div class="form-group">
	                        <label class="label"><span>유형 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <select class="select" name="BRD_CMN_COM_IDX" id="BRD_CMN_COM_IDX" >
                                    <option value="">선택</option>
                                    <c:if test="${not empty codeList }">
                                        <c:forEach var="codeRow" items="${codeList }" varStatus="i">
                                            <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${info.BRD_CMN_COM_IDX eq codeRow.CMN_COM_IDX}">selected="selected"</c:if>>
                                                <c:out value="${codeRow.CMN_COM_NM }"/>
                                            </option>
                                        </c:forEach>
                                    </c:if>
                                </select>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
				        	<label class="label"><span>이미지 <em class="strong">*</em></span></label>
				            <div class="field">
				            	<ul class="img-upload">
				                	<li>
				                    	<i class="icon-file"></i>
				                        <a href="<c:out value="${cdnDomain }${info.CMM_FLE_ATT_PATH}${info.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
				                        	<c:out value="${info.CMM_FLE_ORG_NM }"/>
				                        </a>
				                        <input type="checkbox" class="checkbox" id="CMM_FLE_IDX" name="CMM_FLE_IDX" value="<c:out value="${info.CMM_FLE_IDX }"/>" />
				                        <label for="CMM_FLE_IDX">삭제</label>
				                    </li>
				                </ul>
				                <input type="file" name="file" id="file" class="file" disabled="disabled"/>
				                <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
 	                            <small class="desc">* 업로드 용량 : 2MB</small> 
 	                            <p class="img-text">
 	                            	<span>대체텍스트</span><input type="text" name="CMN_FLE_ALT_TXT_OLD" id="CMN_FLE_ALT_TXT_OLD" class="text long" maxlength="300" value="${info.CMN_FLE_ALT_TXT }"/>
					        		<input type="hidden" name="CMN_FLE_ALT_TXT_IDX" value="<c:out value="${info.CMM_FLE_IDX }"/>"/>
 	                            </p>
				            </div>
						</div>
						
	                    <div class="form-group">
	                        <label class="label"><span>제목 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <input type="text" name="BRD_CAR_TITLE" id="BRD_CAR_TITLE" class="text long" value="<c:out value="${info.BRD_CAR_TITLE}" />"/>
	                        </div>
	                    </div>
	
	                    <div class="form-group">
	                        <label class="label"><span>내용 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <textarea class="textarea" name="BRD_CAR_CONTENTS" id="BRD_CAR_CONTENTS" style="height: 500px;"><c:out value="${info.BRD_CAR_CONTENTS}" /></textarea>
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
<ui:editor objId="#BRD_CAR_CONTENTS"/>
<script type="text/javascript">
$(document).ready(function () {
    
	if($("#CMM_FLE_IDX").is(":checked"))
	{
		$("#file").prop("disabled", false);	
	}
	else
	{
		$("#file").prop("disabled", true);	
	}
	
	//유형 변경시
	$(document).on("change","#BRD_CMN_COM_IDX",function(){
		var thisValue = $(this).val();
		var gubunCd = "${row.BRD_CAR_GUBUN_CD}";
		if(thisValue != ""){
			cardBoardTypeCheck(thisValue, $("input[name=BRD_CAR_IDX]").val(),gubunCd);
		}
	});
	
	// 파일 삭제 check box 변경 이벤트
    $(document).on("click", "#CMM_FLE_IDX", function () {
    	if($(this).is(":checked"))
    	{
    		$("#file").prop("disabled", false);	
    	}
    	else
    	{
    		$("#file").prop("disabled", true);	
    	}
    });
	
    // 폼체크
    $("#frm").validate({
        rules: {
        	BRD_CMN_COM_IDX:{required:true}, // 유형
        	BRD_CAR_TITLE:{required:true}, // 제목
            CMN_FLE_ALT_TXT:{required:true} // 대체텍스트
        }
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/cardBoardList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        
        if($frm.valid()){
        	
        	if($("#CMM_FLE_IDX").is(":checked"))
        	{
        		if($("#file").val() == "")
        		{
        			alert("[이미지] 반드시 입력해주세요.");
        			return;
        		}
        	}
        	
        	try { oEditors.getById["BRD_CAR_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ }
            var CONTENTS = stringUtil.getString($.trim($("#BRD_CAR_CONTENTS").val()), "");
            
            if($("input[name='CMN_FLE_ALT_TXT_OLD']").val() == "")
            {
            	alert("[대체텍스트]반드시 입력해주십시오.");
            	$("#CMN_FLE_ALT_TXT_OLD").focus();
            	return;
            }
            
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            	 alert("[내용]반드시 입력해주십시오.");
                $("#BRD_CAR_CONTENTS").focus();
                return;
            }
            
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/cardBoardModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
});

//카드이벤트 안내 유형 중복 체크
function cardBoardTypeCheck(BRD_CMN_COM_IDX, BRD_CAR_IDX, BRD_CAR_GUBUN_CD){
	 $.ajax
     ({
         async : false,
         type : "POST",
         data : {"BRD_CMN_COM_IDX": BRD_CMN_COM_IDX, "BRD_CAR_IDX": BRD_CAR_IDX, "BRD_CAR_GUBUN_CD": BRD_CAR_GUBUN_CD},
         url : "<c:out value="${serverDomain}" />/am/board/cardBoardTypeAjax.do",
         success : function (data) 
         { 
             if(data.cnt > 0){            
            	 alert("이미 등록된 카드입니다.\n다른 카드를 선택해 주십시오.");
            	 $("#BRD_CMN_COM_IDX").val("");
             }
         },
         error : function (err)
         {
             alert("오류가 발생하였습니다.\n[" + err.status + "]");
         }
     });
}
</script>
</body>
</html>