<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

<!-- Content -->
	
			
    <div id="container">
        <div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">고객센터</h2>
            </div>
            <!--// Title -->
            
            <form id="frm" name="frm" enctype="multipart/form-data">
			<input type="hidden" name="BRD_NTS_IDX" value="" />
			<input type="hidden" name="BRD_NTS_TOP_YN" value="${row.BRD_NTS_TOP_YN}" />
			<input type="hidden" name="BRD_DTL_IDX" value="${row.BRD_DTL_IDX }"/>
			<input type="hidden" name="BRD_DTL_TOP_YN" value="${row.BRD_DTL_TOP_YN}" />
			<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
			<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>" />
			<input type="hidden" name="tabId" value="<c:out value="${commandMap.tabId }"/>"/>
			<input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>

            <div class="sub_content">
                <div class="tab_wrap notice">
                    <ul class="tab n4"> 
                        <li		id="faqTab"			<c:if test="${commandMap.tabId == 'faqTab' }" > class="on" </c:if>>
                        	<a href="#faqTab"				onclick="moveTab('faqTab');">FAQ</a>
                        </li>
                        <li 	id="noticeTab"	class="on"	<c:if test="${commandMap.tabId == 'noticeTab' }" >class="on"</c:if>>
                        	<a href="#noticeTab"			onclick="moveTab('noticeTab');">공지사항</a>
                        </li>
                        <li		id="answerTab"		<c:if test="${commandMap.tabId == 'answerTab' }" >class="on"</c:if>>
                        	<a href="#answerTab" class="link"	onclick="moveTab('answerTab');">1:1문의</a>
                        </li>
                        <li		id="informationTab"	<c:if test="${commandMap.tabId == 'informationTab' }" >class="on"</c:if>>
                        	<a href="#informationTab" class="link"	onclick="moveTab('informationTab');">입점안내</a>
                        </li>
                    </ul>
                    
                    <div class="tab_cont" id="tab">
                        <div class="bbs_view_wrap">
                        	
                            <div class="bbs_title">
                                <strong><c:out value="${row.BRD_NTS_TITLE }"/></strong>
                                <div class="info">
                                    <span>작성일</span> <ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy-MM-dd"/>
                                    <span>조회수</span> <fmt:formatNumber value="${row.BRD_NTS_READ_CNT}" groupingUsed="true"/>
                                </div>
                            </div>
                            <div class="bbs_view">
                                <c:out value="${row.BRD_NTS_CONTENTS}" escapeXml="false"/>
                            </div>
                            <c:if test="${not empty fileList }">
                            <div class="bbs_attach">
                    				<c:forEach items="${fileList}" var="fileRow" varStatus="i">
		                                <div class="item">
		                                    <a href="javascript:;" class="file-list-title" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"><c:out value="${fileRow.CMM_FLE_ORG_NM }"/></a>
		                                </div>
                                	</c:forEach>
                                	
                                <!-- <div class="item">
                                    <a href="#">착샷.JPG</a>
                                    <span>15.3KB</span>
                                </div> -->
                            </div>
                            </c:if>
                            <div class="btn_wrap">
                                <button type="button" class="btn_large" id="goList">목록</button>
                            </div>
                            <div class="prev_next_paging">
                                <ul>
                                    <li>
                                        <strong>이전글</strong>
                                    	<c:choose>
                                    		<c:when test="${not empty row.PRE_TITLE_IDX}">
                                        		<a href="javascript:;" class="subject2" data-brd_dtl_idx="<c:out value="${row.PRE_TITLE_IDX }"/>" data-brd_dtl_top_yn="${row.BRD_NTS_TOP_YN}"><c:out value="${row.PRE_TITLE }"/></a>
                                        	</c:when>
                                        	<c:otherwise>
                                        	<a href="#" ><c:out value="${empty row.PRE_TITLE_IDX ? '이전 글이 없습니다.' : row.PRE_TITLE }"/></a>
                  							</c:otherwise>
                  						</c:choose>
                                    </li>
                                    
                                    <li>
                                        <strong>다음글</strong>
                                        <c:choose>
                                    		<c:when test="${not empty row.NEXT_TITLE_IDX}">
                                        		<a href="javascript:;" class="subject2" data-brd_dtl_idx="<c:out value="${row.NEXT_TITLE_IDX }"/>" data-brd_dtl_top_yn="${row.BRD_NTS_TOP_YN}"><c:out value="${row.NEXT_TITLE }"/></a>
                                        	</c:when>
                                        	<c:otherwise>
                                        	<a href="#" ><c:out value="${empty row.NEXT_TITLE_IDX ? '다음 글이 없습니다.' : row.NEXT_TITLE }"/></a>
                  							</c:otherwise>
                  						</c:choose>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="tab_cont" id="tab3">1:1문의</div>
                    <div class="tab_cont" id="tab4">입점안내</div> -->
                </div>
            </div>
        </div>
    </div>
    <!--// Content -->
	</form>
	
	<form id="frm" name="frm">
		<input type="hidden" name="BRD_DTL_IDX" value="" />
		<input type="hidden" name="BRD_DTL_TOP_YN" value="${row.BRD_DTL_TOP_YN}" />
		<input type="hidden" name="BRD_MST_IDX" value="<c:out value="${commandMap.BRD_MST_IDX }"/>"/>  
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
		<input type="hidden" name="BRD_MST_TYPE" value="<c:out value="${commandMap.BRD_MST_TYPE }"/>"/>
	</form>   
	
	 <!-- 파일 다운로드용 폼 -->
	<form name="fileForm" id="fileForm">
	     <input type="hidden" name="CMM_FLE_IDX" value=""/>
	     <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
	     <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
	</form>  
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>


<!-- 임시적용, 실적용X -->
<script>
   /*  $(function(){
        $('.tab_wrap li:first').removeClass('on');
        $('.tab_wrap').find('.tab_cont:first').hide();
        $('.tab_wrap>.tab').each(function(){
            var idx = $(this).find(".on").index();
            console.log( $('.tab li').eq(idx) );
            var name = $('.tab li').eq(idx).children().attr('href');
            $(name).show();
        });
    }); */
    
    $(function(){
		//목록
		$(document).on("click","#goList",function(){
			$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/noticeBoardList.do", "target":"_self", "method":"get"}).submit();
		});
		
		
		// 파일 다운로드
	    $(document).on("click", ".file-list-title", function (){
	        var $fileForm = $("#fileForm");
	        var $this = $(this);
	        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
	        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
	        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
	        $fileForm.attr({"action":"<c:out value="${frontDomain}"/>/pc/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
	    });
		
	 	// 탭이동
	    moveTab = function (tabId) 
	    {
			
	    	var $frm = $("#frm");
	    		$frm.find("input[name='cPage']").val(1);
	    		$frm.find("input[name='tabId']").val(tabId);
	    		$frm.find("input[name='searchWord']").val("");
	    		
	    	var actionUrl = "";
	    	
	    	if(tabId == "faqTab" ){
		    		actionUrl ="<c:out value="${frontDomain}"/>/pc/customer/faqBoardList.do";
		    	}else if(tabId == "noticeTab"){
		    		actionUrl ="<c:out value="${frontDomain}"/>/pc/customer/noticeBoardList.do";
		    	}else if(tabId == "answerTab"){
		    		actionUrl ="<c:out value="${frontDomain}"/>/pc/mypage/myInquiryForm.do";
		    	}else if(tabId == "informationTab"){
		    		actionUrl ="<c:out value="${frontDomain}"/>/pc/business/businessMain.do";
		    	}else{
		    		alert("올바르지 않은 접근입니다.");
		    		return false;
		    	}
   		        
   		    $frm.attr({"action":actionUrl, "target":"_self", "method":"get"}).submit();
	        
	    };
	    
	    //상세보기 클릭 이벤트
		$(document).on("click", ".subject2", function () 
			    {
			        var $frm = $("#frm");
			        $frm.find("input[name='BRD_NTS_IDX']").val($(this).data("brd_dtl_idx"));
			        $frm.find("input[name='BRD_NTS_TOP_YN']").val($(this).data("brd_dtl_top_yn"));
			        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/noticeBoardView.do", "target":"_self", "method":"get"}).submit();
			    });
	    
	});
</script>
<!--//임시적용, 실적용X -->