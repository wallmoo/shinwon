<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/topFaq.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
            	<form method="post" name="frm" id="frm"		>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
					<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>" />
				
                <!-- 게시판 검색 -->
                <div class="search_bar">
                    <div class="srch_bx">
                        <input type="text" title="검색어 입력" placeholder="검색어 입력" id="searchWord" name="searchWord" value="<c:out value="${commandMap.searchWord }" />">
                        <button type="button" class="b_srch" id="searchBtn">검색</button>
                    </div>
                    <div class="select">
	                	<select title="분류 선택" name="select" onchange="location.href=this.value">
                   			<option value="/mobile/customer/faqBoardList.do" selected="selected">전체</option>
    		                	<c:if test="${empty commandMap.CMN_COM_UP_IDX }">
            	        			<c:forEach  var="item" items="${fqaCodeList}" varStatus="i">
		        		                <option value="<c:if test="${commandMap.CMN_COM_UP_IDX ne null and commandMap.CMN_COM_UP_IDX eq item.CMN_COM_IDX}"/>/mobile/customer/faqBoardList.do?CMN_COM_UP_IDX=<c:out value="${item.CMN_COM_IDX}" />" ><c:out value="${item.CMN_COM_NM}"/>
		                		        </option>
                        			</c:forEach>
                        		</c:if>
		                 </select>
                    </div>
                </div>
                <!-- //게시판 검색 -->
                <!-- FAQ 목록 -->
                <div class="faq_list">
                    <ul>
		            	<c:if test="${empty list}">
			                <div class="no_data">
			                    <p>조회 내용이 없습니다.</p>
			                </div>
		                </c:if>
		                <c:forEach var="item" items="${list}" >
	                        <li>
	                            <a href="#n" class="tit"><p><c:out value="${item.BRD_FAQ_TITLE }"/></p></a>
	                            <div class="answer"><c:out value="${item.BRD_FAQ_CONTENTS }" escapeXml="false"></c:out>
	                            </div>
	                        </li>
                        </c:forEach>
                    </ul>
                </div>
                <!-- // FAQ 목록 -->
                

            </div>
            </form>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
        <form id="frm">
			<input type="hidden" name="BRD_CMN_COM_IDX" id="BRD_CMN_COM_IDX" value="<c:out value="${commandMap.BRD_CMN_COM_IDX}" />"/>
			<input type="hidden" name="BRD_CMN_COM_UP_IDX" id="BRD_CMN_COM_UP_IDX" value="<c:out value="${commandMap.BRD_CMN_COM_UP_IDX}" />"/>
		</form>
		<form id="searchFrm">
			<input type="hidden" name="searchWord" id="searchWord" />
		</form>
		<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}" />"/>

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

 <script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
 <script>
 	//검색창
	 $(document).on("click", "#searchBtn", function(){
			if($("#searchWord").val() == ""){
				alert("검색어를 입력하세요");
				$("#searchWord").focus();
				return;
			}else{
				//goPage(1);
				$("#frm").attr("action", "<c:out value="${mobileDomain }" />/mobile/customer/faqBoardList.do").submit();
			}
		});
	 
 /* 	function go_url(url)
	 {
	     if(url != '')   window.open(url,'_self');
	     //self.location.href=this.value
	 }; */
 	
</script>
<script type="text/javascript">
        $(".ootd_list").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true
            }
        });
        
</script>
