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
                <span>쇼핑가이드 관리</span>
            </div><!-- // breadcrumb -->
    
            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">쇼핑가이드 관리</h3>

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
	                    <input type="hidden" name="searchBrdShgTitle" value="<c:out value="${commandMap.searchBrdShgTitle }"/>"/>
	                    <input type="hidden" name="searchBrdShgContents" value="<c:out value="${commandMap.searchBrdShgContents }"/>"/>
	                    <input type="hidden" name="searchBrdShgTitleAndContents" value="<c:out value="${commandMap.searchBrdShgTitleAndContents }"/>"/>
	                    <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
	                    <input type="hidden" name="serachBrdShgUseYn" value="<c:out value="${commandMap.serachBrdShgUseYn }"/>"/>
                    </form>
                    <form id="frm" name="frm" enctype="multipart/form-data" method="post">
                        <input type="hidden" name="BRD_SHG_IDX" value="<c:out value="${row.BRD_SHG_IDX }"/>" />
                        <input type="hidden" name="BRD_SHG_GUBUN_CD" value="<c:out value="${row.BRD_SHG_GUBUN_CD }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                    <input type="hidden" name="searchBrdShgTitle" value="<c:out value="${commandMap.searchBrdShgTitle }"/>"/>
	                    <input type="hidden" name="searchBrdShgContents" value="<c:out value="${commandMap.searchBrdShgContents }"/>"/>
	                    <input type="hidden" name="searchBrdShgTitleAndContents" value="<c:out value="${commandMap.searchBrdShgTitleAndContents }"/>"/>
	                    <input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>"/>
	                    <input type="hidden" name="serachBrdShgUseYn" value="<c:out value="${commandMap.serachBrdShgUseYn }"/>"/>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>상태</span></label>
	                        <div class="field">
	                            <input type="radio" name="BRD_SHG_USE_YN" id="stateA" value="Y" class="radio" <c:if test="${row.BRD_SHG_USE_YN eq 'Y' }">checked="checked"</c:if>/>
	                            <label for="stateA">사용</label>
	                            <input type="radio" name="BRD_SHG_USE_YN" id="stateB" value="N" class="radio" <c:if test="${row.BRD_SHG_USE_YN eq 'N' }">checked="checked"</c:if>/>
	                            <label for="stateB">미사용</label>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>작성자</span></label>
	                        <div class="field">
	                            <c:out value="${row.BRD_SHG_REG_ID }"/>(<c:out value="${row.BRD_SHG_REG_NM }"/>)
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>유형 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <select class="select" name="BRD_CMN_COM_IDX" id="BRD_CMN_COM_IDX">
                                    <option value="">선택</option>
                                    <c:if test="${not empty codeList }">
                                        <c:forEach var="codeRow" items="${codeList }" varStatus="i">
                                            <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <c:if test="${row.BRD_CMN_COM_IDX eq codeRow.CMN_COM_IDX}">selected="selected"</c:if>>
                                                <c:out value="${codeRow.CMN_COM_NM }"/>
                                            </option>
                                        </c:forEach>
                                    </c:if>
                                </select>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group fileDiv" style="display:none;">
	                        <label class="label"><span>아이콘 <em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<input id="file" name="file" type="file" class="file"/>
	                            <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
 	                            <small class="desc">* 업로드 용량 : 2MB</small>  
	                            
	                            <input type="hidden" value="${fn:length(fileList)}" id="fileListLen"/>
	                            <c:forEach items="${fileList}" var="fileRow" varStatus="i">	
	                            	<c:set var="cmnFleAltTxt" value="${fileRow.CMN_FLE_ALT_TXT }"/>
									<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
                                        <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
                                    </a>
                                    <input type="hidden" name="OLD_CMN_FLE_ALT_TXT" value="<c:out value="${fileRow.CMN_FLE_ALT_TXT }"/>"/>
                                    <input type="hidden" name="OLD_CMN_FLE_ALT_TXT_IDX" value="<c:out value="${fileRow.CMM_FLE_IDX}"/>"/>                                    
								</c:forEach>
								
								<br/>대체텍스트 <input type="text" name="CMN_FLE_ALT_TXT" id="CMN_FLE_ALT_TXT" class="text" value="${cmnFleAltTxt}" placeholder="20자 이내로 입력하세요." maxlength="100" style="width: 60%;"/>
																		
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>제목 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <input type="text" name="BRD_SHG_TITLE" id="BRD_SHG_TITLE" class="text long" value="<c:out value="${row.BRD_SHG_TITLE }"/>" maxlength="40"/>
	                        </div>
	                    </div>
	
	                    <div class="form-group">
	                        <label class="label"><span>내용 <em class="strong">*</em></span></label>
	                        <div class="field">
	                            <textarea class="textarea" name="BRD_SHG_CONTENTS" id="BRD_SHG_CONTENTS" style="height: 500px;"><c:out value="${row.BRD_SHG_CONTENTS }"/></textarea>
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
        
        <!-- 파일 다운로드용 폼 -->
        <form name="fileForm" id="fileForm">
             <input type="hidden" name="CMM_FLE_IDX" value=""/>
             <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
             <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
        </form>

    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<ui:editor objId="#BRD_SHG_CONTENTS"/>
<script type="text/javascript">
$(document).ready(function () {
	var thisCmnComIdx = "${row.BRD_CMN_COM_IDX}";
	if(thisCmnComIdx == "${Code.COMMON_SHOPPING_GUIDE_PRODUCT_TECHINFO}" || thisCmnComIdx == "${Code.COMMON_SHOPPING_GUIDE_EQUIPMENT_KEEP}" || thisCmnComIdx == "${Code.COMMON_SHOPPING_GUIDE_USE_MENUAL}" )
	{
		getSubCategory();
	}

	//유형 변경시
	$(document).on("change","#BRD_CMN_COM_IDX",function(){
		var thisValue = $(this).val();
		var gubunCd = "{row.BRD_SHG_GUBUN_CD}";	
		$(".fileDiv").hide(); //파일 첨부 비활성화
		$(".file").prop("disabled", true);
		//상품기술정보,장비유지팁,사용메뉴얼 및 공백이 아닌 것들만 체크함.
		if(thisValue == "${Code.COMMON_SHOPPING_GUIDE_PRODUCT_TECHINFO}" || thisValue == "${Code.COMMON_SHOPPING_GUIDE_EQUIPMENT_KEEP}" || thisValue == "${Code.COMMON_SHOPPING_GUIDE_USE_MENUAL}")
		{
			getSubCategory(thisValue);
		}
		else
		{
			shoppingGuideTypeCheck(thisValue, $("input[name=BRD_SHG_IDX]").val(),gubunCd);
		}
	});
	
    // 폼체크
    $("#frm").validate({
        rules: {
            BRD_SHG_USE_YN:{required:true}, // 사용 유무
            BRD_CMN_COM_IDX:{required:true}, // 유형
//             BRD_CMN_COM_SUB_IDX:{required:{depends:function(){
//                 if($("#BRD_CMN_COM_IDX").val() != "" && $("#BRD_CMN_COM_IDX").val() == "${Code.COMMON_SHOPPING_GUIDE_PRODUCT_TECHINFO}") return true;
//                 else return false;
// 	        }}}, //유형2
	        file:{required:{depends:function(){
                if($("#BRD_CMN_COM_IDX").val() != "" && ($("#BRD_CMN_COM_IDX").val() == "${Code.COMMON_SHOPPING_GUIDE_PRODUCT_TECHINFO}" || $("#BRD_CMN_COM_IDX").val() == "${Code.COMMON_SHOPPING_GUIDE_EQUIPMENT_KEEP}" || $("#BRD_CMN_COM_IDX").val() == "${Code.COMMON_SHOPPING_GUIDE_USE_MENUAL}" ) && $("#fileListLen").val() == "0") return true;
                else return false;
	        }}}, //아이콘 
	        CMN_FLE_ALT_TXT:{required:{depends:function(){
                if($("#BRD_CMN_COM_IDX").val() != "" && ($("#BRD_CMN_COM_IDX").val() == "${Code.COMMON_SHOPPING_GUIDE_PRODUCT_TECHINFO}" || $("#BRD_CMN_COM_IDX").val() == "${Code.COMMON_SHOPPING_GUIDE_EQUIPMENT_KEEP}" || $("#BRD_CMN_COM_IDX").val() == "${Code.COMMON_SHOPPING_GUIDE_USE_MENUAL}" )) return true;
                else return false;
	        }}}, //아이콘 대체텍스트
            BRD_SHG_TITLE:{required:true} // 제목
        },
        messages :{
        	file: {required:"등록해주십시오."},
        	CMN_FLE_ALT_TXT: {required:"[대체텍스트]를 입력해주십시오."}
        }
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/shoppingGuideBoardList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        
        if($frm.valid()){
        	try { oEditors.getById["BRD_SHG_CONTENTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ }
            var CONTENTS = stringUtil.getString($.trim($("#BRD_SHG_CONTENTS").val()), "");
            if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
            	 alert("[내용]반드시 입력해주십시오.");
                $("#BRD_SHG_CONTENTS").focus();
                return;
            }
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/shoppingGuideBoardModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
    
 	// 파일 다운로드
    $(document).on("click", ".file-list-title", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
});

//쇼핑가이드 유형 중복 체크
function shoppingGuideTypeCheck(BRD_CMN_COM_IDX, BRD_SHG_IDX ,BRD_SHG_GUBUN_CD){
	 $.ajax
     ({
         async : false,
         type : "POST",
         data : {"BRD_CMN_COM_IDX": BRD_CMN_COM_IDX, "BRD_SHG_IDX": BRD_SHG_IDX,"BRD_SHG_GUBUN_CD": BRD_SHG_GUBUN_CD},
         url : "<c:out value="${serverDomain}" />/am/board/shoppingGuideTypeAjax.do",
         success : function (data) 
         { 
             if(data.cnt > 0){            
            	 alert("이미 등록된 쇼핑가이드 유형입니다.\n다른 유형을 선택해 주십시오.");
            	 $("#BRD_CMN_COM_IDX").val("");
             }
         },
         error : function (err)
         {
             alert("오류가 발생하였습니다.\n[" + err.status + "]");
         }
     });
}

//상품 기술정보 이미지 업로드 활성화 
function getSubCategory(){  
	
    $(".fileDiv").show(); //파일 첨부 활성화
    $(".file").prop("disabled", false);
}
</script>
</body>
</html>