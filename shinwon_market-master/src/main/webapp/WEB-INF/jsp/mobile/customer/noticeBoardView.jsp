<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/topNotice.jsp" %>
<!-- #container -->
        <div id="container">
        <form id="frm" name="frm" enctype="multipart/form-data">
			<input type="hidden" name="BRD_NTS_IDX" value="" />
			<input type="hidden" name="BRD_NTS_TOP_YN" value="${row.BRD_NTS_TOP_YN}" />
			<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
			<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>" />
			<input type="hidden" name="tabId" value="<c:out value="${commandMap.tabId }"/>"/>
			<input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
            <!-- #content_area -->
            <div id="content_area">
                <!-- 게시판 상세 -->
                <div class="board_detail">
                    <div class="bd_title">
                        <p class="tit"><c:out value="${row.BRD_NTS_TITLE }"/></p>
                        <div class="inf">
                            <span><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy.MM.dd"/></span>
                            <span><fmt:formatNumber value="${row.BRD_NTS_READ_CNT}" groupingUsed="true"/></span>
                        </div>
                    </div>
                    <div class="bd_cont">
                       <c:out value="${row.BRD_NTS_CONTENTS}" escapeXml="false"/>
                    </div>
                    <div class="file_bx">
                        <p class="tit">첨부파일</p>
                        	<c:if test="${not empty fileList }">
                        		<c:forEach items="${fileList}" var="fileRow" varStatus="i">
                        			<a href="javascript:;" class="file-list-title" id="fileIdx_<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_idx="<c:out value="${fileRow.CMM_FLE_IDX }"/>" data-cmm_fle_save_path="<c:out value="${fileRow.CMM_FLE_SAVE_PATH }"/>"><c:out value="${fileRow.CMM_FLE_ORG_NM }"/></a>
                        		</c:forEach>
                        	</c:if>
                    </div>
                </div>
                <div class="btn_area">
                    <button type="button" class="btn black" id="goList">목록</button>
                </div>
                <!-- // 게시판 상세 -->

            </div>
            <!-- // #content_area -->
            </form>
        </div>
        <!-- // #container -->
        <!-- 파일 다운로드용 폼 -->
		<form name="fileForm" id="fileForm">
			<input type="hidden" name="CMM_FLE_IDX" value=""/>
			<input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
			<input type="hidden" name="CMM_FLE_ORG_NM" value="" />
		</form>  
    
    <!-- // #wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
        $(".ootd_list").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true
            }
        });
        
        
        $(function(){
    		//목록
    		$(document).on("click","#goList",function(){
    			$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/noticeBoardList.do", "target":"_self", "method":"get"}).submit();
    		});
    		
    		// 파일 다운로드
    	    $(document).on("click", ".file-list-title", function (){
    	        var $fileForm = $("#fileForm");
    	        var $this = $(this);
    	        $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
    	        $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
    	        $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
    	        $fileForm.attr({"action":"<c:out value="${frontDomain}"/>/pc/common/commonFileDownload.do", "target":"_self", "method":"get"}).submit();
    	    });
        });
</script>