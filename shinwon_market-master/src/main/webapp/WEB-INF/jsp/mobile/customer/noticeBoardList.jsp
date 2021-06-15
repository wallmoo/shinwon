<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/topNotice.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
            	<form method="post" name="frm" id="frm"		>
					<input type="hidden" name="BRD_NTS_IDX" value="<c:out value="${commandMap.BRD_CMN_COM_IDX}" />" />
					<input type="hidden" name="BRD_NTS_TOP_YN" value="<c:out value="${commandMap.BRD_CMN_COM_UP_IDX}" />" />
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
					<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>" />
					<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}" />"/>
					
					
                <!-- 게시판 검색 -->
                <div class="search_bar">
                    <div class="srch_bx">
                        <input type="text" title="검색어 입력" placeholder="검색어 입력" id="searchWord" name="searchWord" value="<c:out value="${commandMap.searchWord }" />">
                        <button  class="b_srch" id="searchBtn">검색</button>
                    </div>
                </div>
                <!-- //게시판 검색 -->
                <!-- 게시판 목록 -->
                <div class="board_list">
                    <ul>
                    	<c:if test="${empty topList}">
			                <div class="no_data">
			                    <p>조회 내용이 없습니다.</p>
			                </div>
		                </c:if>
                    	<c:if test="${not empty topList }">
                    		<c:forEach var="row" items="${topList }" varStatus="i">
		                        <li class="rowNum">
		                            <a href="javascript:;" data-brd_nts_top_yn="Y" 	data-brd_nts_idx="<c:out value="${row.BRD_NTS_IDX }"/>">
		                                <span class="num"><c:out value="${row.BRD_NTS_IDX }"/></span>
		                                <p class="tit"><c:out value="${row.BRD_NTS_TITLE }"/></p>
		                                <div class="inf">
		                                    <span><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy.MM.dd"/></span>
		                                    <span><fmt:formatNumber value="${row.BRD_NTS_READ_CNT}" groupingUsed="true"/></span>
		                                </div>
		                            </a>
		                        </li>
                        	</c:forEach>
                        </c:if>
                        <c:if test="${empty topList}">
			                <div class="no_data">
			                    <p>조회 내용이 없습니다.</p>
			                </div>
		                </c:if>
                        <c:if test="${not empty list }">
                        	<c:forEach var="row" items="${list }" varStatus="i">
                        		<li class="rowNum">
		                            <a href="javascript:;" data-brd_nts_top_yn="N" 	data-brd_nts_idx="<c:out value="${row.BRD_NTS_IDX }"/>">
		                                <span class="num"><c:out value="${row.BRD_NTS_IDX }"/></span>
		                                <p class="tit"><c:out value="${row.BRD_NTS_TITLE }"/></p>
		                                <div class="inf">
		                                    <span><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy.MM.dd"/></span>
		                                    <span><fmt:formatNumber value="${row.BRD_NTS_READ_CNT}" groupingUsed="true"/></span>
		                                </div>
		                            </a>
		                        </li>
                        	</c:forEach>
                        </c:if>
                    </ul>
                </div>
                <!-- // 게시판 목록 -->
			</form>
            </div>
            
            <!-- // #content_area -->
        </div>
        <form id="searchFrm">
			<input type="hidden" name="searchWord" id="searchWord" />
		</form>
        
		
        <!-- // #container -->
        
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
        $(".ootd_list").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true
            }
        });
        
        
      //검색창
   	 $(document).on("click", "#searchBtn", function(){
   			if($("#searchWord").val() == ""){
   				alert("검색어를 입력하세요");
   				$("#searchWord").focus();
   				return;
   			}else{
   				//goPage(1);
   				$("#frm").attr("action", "<c:out value="${mobileDomain }" />/mobile/customer/noticeBoardList.do").submit();
   			}
   		});
      
  // 상세보기 제목 클릭 이벤트
	    $(document).on("click", ".rowNum", function () 
	    {
	        var $frm = $("#frm");
	        $frm.find("input[name='BRD_NTS_IDX']").val($(this).children('a').data("brd_nts_idx"));
	        $frm.find("input[name='BRD_NTS_TOP_YN']").val($(this).children('a').data("brd_nts_top_yn"));	        
	        $frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/customer/noticeBoardView.do", "target":"_self", "method":"get"}).submit();
	    });
  
	    function goSearch(){
        	var $frm = $("#searchFrm");
        	$("#searchWord").val(searchWord);
        	//$("#frm").attr("action", "/mobile/customer/faqBoardList.do").submit();
        	$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/customer/faqSearchList.do", "target":"_self", "method":"post" }).submit();
        	//$("#frm").submit();
        };
   	
</script>
    
    