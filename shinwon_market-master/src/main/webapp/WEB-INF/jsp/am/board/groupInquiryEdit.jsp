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
                <span>단체주문 관리</span>
            </div><!-- // breadcrumb -->
    
            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">단체주문 관리</h3>

                <h4 class="title">단체주문 상세보기</h4>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                    <input type="hidden" name="searchGrpInqRegNm" value="<c:out value="${commandMap.searchGrpInqRegNm }"/>"/>
	                    <input type="hidden" name="searchGrpInqCustomerTel" value="<c:out value="${commandMap.searchGrpInqCustomerTel }"/>"/>
	                    <input type="hidden" name="searchGrpInqReplyYn" value="<c:out value="${commandMap.searchGrpInqReplyYn }"/>"/>
	                    <input type="hidden" name="searchRegType" value="<c:out value="${commandMap.searchRegType }"/>"/>
	                    <input type="hidden" name="searchRegTypeKeyword" value="<c:out value="${commandMap.searchRegTypeKeyword }"/>"/>
                    </form>
                    	
	                    <div class="form-group">
	                        <label class="label"><span>단체명</span></label>
	                        <div class="field">
	                        	<c:out value="${row.GRP_INQ_GRP_NM}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>작성자</span></label>
	                        <div class="field">
	                            <a href="javascript:goView('<c:out value="${row.GRP_INQ_REG_ID }" />');">
	                            	<c:out value="${row.GRP_INQ_REG_ID}"/>
		                            <c:if test="${not empty row.GRP_INQ_REG_ID}">
		                            	(<c:out value="${row.GRP_INQ_REG_NM }"/>)
		                            	
		                            </c:if>
		                        </a>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>담당자</span></label>
	                        <div class="field">
	                        	<c:out value="${row.GRP_INQ_CUSTOMER_NM}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>담당자 연락처</span></label>
	                        <div class="field">
	                        	<ui:phonenumber phonenumber="${row.GRP_INQ_CUSTOMER_TEL}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>등록일</span></label>
	                        <div class="field">
	                        	<ui:formatDate value="${row.GRP_INQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>통화시간</span></label>
	                        <div class="field">
	                        	${not empty row.GRP_INQ_AVAIL_STIME ? row.GRP_INQ_AVAIL_STIME : '00'}:00
	                        	 ~
	                        	${not empty row.GRP_INQ_AVAIL_ETIME ? row.GRP_INQ_AVAIL_ETIME : '00'}:00 
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>E-mail</span></label>
	                        <div class="field">
	                        	<c:out value="${row.GRP_INQ_CUSTOMER_EMAIL}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>희망상품코드 / 명</span></label>
	                        <div class="field">
	                        	<c:if test="${not empty row.GRP_PRD_MST_CD }">
                                	<a href="<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.GRP_PRD_MST_CD }"/>" class="thumb-link thumb-link-col" target="_blank" title="새 창 으로 열립니다.">
                                		<c:out value="${row.GRP_PRD_MST_CD }"/>
                                	</a> 
                                	/ 
									<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=${row.GRP_PRD_MST_CD}&ADMIN=Y" target="_blank">
                               			<c:out value="${row.GRP_PRD_MST_NM }"/>
                                	</a>
			                    </c:if>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>주문수량</span></label>
	                        <div class="field">
	                        	<fmt:formatNumber value="${row.GRP_INQ_WANT_CNT}" type="number"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>내용</span></label>
	                        <div class="field">
	                        	<ui:replaceLineBreak content="${row.GRP_INQ_CONTENTS}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
                    	<label class="label"><span>첨부파일</span></label>
                    	<div class="field">      
						<form name="fileForm" id="fileForm">
				            <input type="hidden" name="CMM_FLE_IDX" value=""/>
				            <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
				            <input type="hidden" name="CMM_FLE_ORG_NM" value="" />                    
		                   	
		                    	<c:choose>
		                    		<c:when test="${not empty fileList }"> 
											<c:forEach var="fileRow" items="${fileList }" varStatus="i">
												<c:if test="${fileRow.CMM_FLE_TB_TYPE eq 'U' }">
				                              		<i class="icon-file"></i>
				                              		<a href="javascript:;" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>">
				                                  		<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
				                              		</a>
			                              		</c:if>
			                           		</c:forEach>	
		                    		</c:when>
		                    		<c:otherwise>
		                    			-
		                    		</c:otherwise>
		                    	</c:choose>
	                    	</form> 
	                    	</div>
	                    </div> 
                </div><!-- // section-form-a -->
                
                <h4 class="title">상담내용</h4>

                <p>
                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
                </p>
                
                <div class="section-form"><!-- section-form-a -->
                	<form id="frm" name="frm" enctype="multipart/form-data">
                        <input type="hidden" name="GRP_INQ_IDX" value="<c:out value="${row.GRP_INQ_IDX }"/>" />
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                    <input type="hidden" name="searchRegTypeKeyword" value="<c:out value="${commandMap.searchRegTypeKeyword }"/>"/>
	                    <input type="hidden" name="searchGrpInqCustomerTel" value="<c:out value="${commandMap.searchGrpInqCustomerTel }"/>"/>
	                    <input type="hidden" name="searchGrpInqReplyYn" value="<c:out value="${commandMap.searchGrpInqReplyYn }"/>"/>	                    
	                    <input type="hidden" name="GRP_INQ_REPLY_YN" value="<c:out value="${row.GRP_INQ_REPLY_YN }"/>"/>
	                    <input type="hidden" name="GRP_INQ_GUBUN_CD" value="<c:out value="${row.GRP_INQ_GUBUN_CD }"/>"/>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>상담시간<em class="strong">*</em></span></label>
	                        <div class="field">
	                            <input type="text" name="GRP_INQ_REPLY_TIME_DT" id="GRP_INQ_REPLY_TIME_DT" class="text datepicker p-datepicker" value="<c:out value="${row.GRP_INQ_REPLY_TIME_DT }"/>"/>
	                            <select id="GRP_INQ_REPLY_TIME_SHH" name="GRP_INQ_REPLY_TIME_SHH">
	                            	<option value="">선택</option>
	                            	<c:forEach begin="0" end="23" step="1" varStatus="i">
	                            		<c:set var="hh" value="${i.index}"/>
	                            		<c:if test="${i.index < 10}">
	                            			<c:set var="hh" value="0${i.index}"/>
	                            		</c:if>
	                            		<option value="${hh}" <c:if test="${row.GRP_INQ_REPLY_TIME_SHH eq hh}">selected="selected"</c:if>>${hh}</option>
	                            	</c:forEach>
	                            </select>시
	                            <select id="GRP_INQ_REPLY_TIME_SMI" name="GRP_INQ_REPLY_TIME_SMI">
	                            	<option value="">선택</option>
	                            	<c:forEach begin="0" end="59" step="1" varStatus="i">
	                            		<c:set var="mm" value="${i.index}"/>
	                            		<c:if test="${i.index < 10}">
	                            			<c:set var="mm" value="0${i.index}"/>
	                            		</c:if>
	                            		<option value="${mm}" <c:if test="${row.GRP_INQ_REPLY_TIME_SMI eq mm}">selected="selected"</c:if>>${mm}</option>
	                            	</c:forEach>
	                            </select>분 ~
	                            <select id="GRP_INQ_REPLY_TIME_EHH" name="GRP_INQ_REPLY_TIME_EHH">
	                            	<option value="">선택</option>
	                            	<c:forEach begin="0" end="23" step="1" varStatus="i">
	                            		<c:set var="hh" value="${i.index}"/>
	                            		<c:if test="${i.index < 10}">
	                            			<c:set var="hh" value="0${i.index}"/>
	                            		</c:if>
	                            		<option value="${hh}" <c:if test="${row.GRP_INQ_REPLY_TIME_EHH eq hh}">selected="selected"</c:if>>${hh}</option>
	                            	</c:forEach>
	                            </select>시
	                            <select id="GRP_INQ_REPLY_TIME_EMI" name="GRP_INQ_REPLY_TIME_EMI">
	                            	<option value="">선택</option>
	                            	<c:forEach begin="0" end="59" step="1" varStatus="i">
	                            		<c:set var="mm" value="${i.index}"/>
	                            		<c:if test="${i.index < 10}">
	                            			<c:set var="mm" value="0${i.index}"/>
	                            		</c:if>
	                            		<option value="${mm}" <c:if test="${row.GRP_INQ_REPLY_TIME_EMI eq mm}">selected="selected"</c:if>>${mm}</option>
	                            	</c:forEach>
	                            </select>분
	                            (날짜형식: YYYY-MM-DD)
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>상담내용<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<textarea class="textarea" name="GRP_INQ_REPLY_CONTENTS" id="GRP_INQ_REPLY_CONTENTS">${row.GRP_INQ_REPLY_CONTENTS}</textarea>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group fileDiv">
	                        <label class="label"><span>첨부파일</span></label>
	                        <div class="field">
	                        	                        	
	                        	<input id="file" name="file" type="file" class="file"/>
	                            
		                            <c:forEach items="${fileList}" var="fileRow" varStatus="i">		                            	
	               						<c:if test="${fileRow.CMM_FLE_TB_TYPE eq 'A' }">
		               						<a href="javascript:;" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" class="file-list-title" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"> 
		                            			<c:out value="${fileRow.CMM_FLE_ORG_NM }"/> 
		                         			</a>			 		                                
		                         			<i class="icon-file"></i>    			
		                         			<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX" name="CMM_FLE_IDX" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" /> 
		              						<label for="CMM_FLE_IDX">삭제</label>
										</c:if>
									</c:forEach>
								<small class="desc">* 업로드 가능 파일 : hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf</small>
 	                            <small class="desc">* 업로드 용량 : 20MB</small>
	                        </div>
	                    </div>
                        	
                        <c:if test="${row.GRP_INQ_REPLY_YN eq 'Y' }">	
	                      	<div class="form-group">
			                	<label class="label"><span>작성자</span></label>
			                    <div class="field">
		                    		<c:out value="${row.GRP_INQ_REPLY_UPD_ID }"/>(<c:out value="${row.GRP_INQ_REPLY_UPD_NM}"/>)
			                    </div>
		                   </div>
		                   
		                   <div class="form-group">
		                        <label class="label"><span>등록일</span></label>
		                        <div class="field">
									<ui:formatDate value="${row.GRP_INQ_REPLY_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
		                        </div>
		                    </div>
                    	</c:if>	
	                    
                    </form>
                </div>

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
<script type="text/javascript">
$(document).ready(function () {
	 // 회원정보 상세 팝업페이지 호출
    goView = function (custId)
    {
        popup("<c:out value="${serverDomain}"/>/am/member/infoMemberPopup.do?CUST_ID="+custId, "800", "500", "yes", "memberView");
    };
    
    // 폼체크
    $("#frm").validate({
        rules: {
        	GRP_INQ_REPLY_TIME_DT:{required:true}, // 상담일
        	GRP_INQ_REPLY_TIME_SHH:{required:true}, // 상담시작시간
        	GRP_INQ_REPLY_TIME_SMI:{required:true}, // 상담시작분
        	GRP_INQ_REPLY_TIME_EHH:{required:true}, // 상담끝시간
        	GRP_INQ_REPLY_TIME_EMI:{required:true}, //상담끝분
        	GRP_INQ_REPLY_CONTENTS:{required:true}
        }
    });
    
    // 첨부파일 있는경우 파일첨부 비활성화 초기화
    if($(":checkbox[name='CMM_FLE_IDX']").val() != undefined)
    {
    	$("input[name='file']").prop("disabled", true);
    }
    
    // 첨부파일 삭제 체크박스 클릭한 경우 파일 첨부 활성화    
    $(document).on("click", ":checkbox[name='CMM_FLE_IDX']", function () 
    {
    	if($(this).is(":checked"))
        {
           	$("input[name='file']").prop("disabled", false);
        }
    	else
    	{
    		$("input[name='file']").prop("disabled", true);
    		$("input[name='file']").val("");
    	}
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/groupInquiryList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
       
        if($frm.valid()){
        	var $stime = parseInt($("#GRP_INQ_REPLY_TIME_SHH").val()+$("#GRP_INQ_REPLY_TIME_SMI").val());
        	var $etime = parseInt($("#GRP_INQ_REPLY_TIME_EHH").val()+$("#GRP_INQ_REPLY_TIME_EMI").val());
        	
        	if($stime > $etime)
        	{
        		alert("[상담시간]이 잘못 입력되었습니다. \n 다시 입력해 주십시오.");
        		$("#GRP_INQ_REPLY_TIME_SHH").focus();
        		return false;
        	}
        	
            if($("#GRP_INQ_REPLY_CONTENTS").val() == "")
            {
                alert("[내용]반드시 입력해 주십시오.");
                tinyMCE.get("GRP_INQ_REPLY_CONTENTS").focus();
                return;
            } 
           
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/groupInquiryModify.do", "target":"_self", "method":"post"}).submit();
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
 	
 	// 회원정보 상세 팝업페이지 호출
    goView = function (memMstWebId)
    {
    	goMemberViewPopup("<c:out value="${serverDomain}"/>", memMstWebId);
    };
 	
});
</script>
</body>
</html>