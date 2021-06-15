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

                <h4 class="title">등록</h4>

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
	                    
                    	<div class="form-group">
	                        <label class="label"><span>상태</span></label>
	                        <div class="field">
	                            <input type="radio" name="BRD_CAR_USE_YN" id="stateA" value="Y" class="radio" checked="checked"/>
	                            <label for="stateA">사용</label>
	                            <input type="radio" name="BRD_CAR_USE_YN" id="stateB" value="N" class="radio" />
	                            <label for="stateB">미사용</label>
	                        </div>
	                    </div>
                    	
                    	<div class="form-group">
	                        <label class="label"><span>유형 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <select class="select" name="BRD_CMN_COM_IDX" id="BRD_CMN_COM_IDX">
                                    <option value="">선택</option>
                                    <c:if test="${not empty codeList }">
                                        <c:forEach var="codeRow" items="${codeList }" varStatus="i">
                                            <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>">
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
					            <input type="file" name="file" id="file" class="file"/>
					            <input type="hidden" name="CMM_FLE_TB_TYPE" value="I" />
					            <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
 	                            <small class="desc">* 업로드 용량 : 2MB</small> 
 	                            <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT" id="CMN_FLE_ALT_TXT" class="text long" maxlength="300"/>
                                </p>
					        </div>
					    </div>
					    
<!-- 					    <div class="form-group"> -->
<!-- 					        <label class="label"><span>이미지 설명 <em class="strong">*</em></span></label> -->
<!-- 					        <div class="field"> -->
<!-- 					        	<input type="text" name="CMN_FLE_ALT_TXT" id="CMN_FLE_ALT_TXT" class="text long" maxlength="300"/> -->
<!-- 					        </div> -->
<!-- 					    </div> -->
	
	                    <div class="form-group">
	                        <label class="label"><span>제목 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <input type="text" name="BRD_CAR_TITLE" id="BRD_CAR_TITLE" class="text long" maxlength="50" />
	                        </div>
	                    </div>
	
	                    <div class="form-group">
	                        <label class="label"><span>내용 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <textarea class="textarea" name="BRD_CAR_CONTENTS" id="BRD_CAR_CONTENTS" style="height: 500px;"></textarea>
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
	
	//유형 변경시
	$(document).on("change","#BRD_CMN_COM_IDX",function(){
		var thisValue = $(this).val();
		var gubunCd = $("#BRD_CAR_GUBUN_CD option:selected").val();
		if(thisValue != ""){
			cardBoardTypeCheck(thisValue, gubunCd);
		}
	});
    
    // 폼체크
    $("#frm").validate({
        rules: {
        	BRD_CMN_COM_IDX:{required:true}, // 유형
        	BRD_CAR_TITLE:{required:true}, // 제목        	
        	file:{required:true} // 배너            
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
        	try { oEditors.getById["BRD_CAR_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ }
            var CONTENTS = stringUtil.getString($.trim($("#BRD_CAR_CONTENTS").val()), "");
            
            if($("input[name='CMN_FLE_ALT_TXT']").val() == "")
            {
            	alert("[대체텍스트]반드시 입력해주십시오.");
                $("#CMN_FLE_ALT_TXT").focus();
                return;
            }
            
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            	 alert("[내용]반드시 입력해주십시오.");
                $("#BRD_CAR_CONTENTS").focus();
                return;
            }
            
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/cardBoardRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
});

//카드 이벤트 안내 유형 중복 체크
function cardBoardTypeCheck(BRD_CMN_COM_IDX, BRD_CAR_GUBUN_CD){
	 $.ajax
     ({
         async : false,
         type : "POST",
         data : {"BRD_CMN_COM_IDX": BRD_CMN_COM_IDX , "BRD_CAR_GUBUN_CD": BRD_CAR_GUBUN_CD},
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