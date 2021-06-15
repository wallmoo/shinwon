<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
			
			<form method="post" name="frm" id="frm"		>
			<input type="hidden" name="BRD_NTS_IDX" value="" />
			<input type="hidden" name="BRD_NTS_TOP_YN" value="" />
			<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
			<input type="hidden" name="searchBrdCmnComIdx" value="<c:out value="${commandMap.searchBrdCmnComIdx }"/>" />
			<input type="hidden" name="tabId" value="<c:out value="${commandMap.tabId }"/>"/>
			
            <div class="sub_content">
                <div class="tab_wrap notice">
                    <ul class="tab n4"> 
                        <li		id="faqTab"			<c:if test="${commandMap.tabId == 'faqTab' }" ></c:if>>
                        	<a href="#faqTab"	class="moveTab"			onclick="moveTab('faqTab');">FAQ</a>
                        </li>
                        <li 	id="noticeTab"	class="on"	<c:if test="${commandMap.tabId == 'noticeTab' }" ></c:if>>
                        	<a href="#noticeTab"	class="moveTab"		onclick="moveTab('noticeTab');">공지사항</a>
                        </li>
                        <li		id="answerTab"		<c:if test="${commandMap.tabId == 'answerTab' }" ></c:if>>
                        	<a href="#answerTab" class="link"	onclick="moveTab('answerTab');">1:1문의</a>
                        </li>
                        <li		id="informationTab"	<c:if test="${commandMap.tabId == 'informationTab' }" ></c:if>>
                        	<a href="#informationTab" class="link"	onclick="moveTab('informationTab');">입점안내</a>
                        </li>
                    </ul>
                    
                    <script>
					/* $(".moveTab").on("click", function(){
						$(".tab.n4").find("li").removeClass("on");
						$(this).parent().addClass("on");
					}); */
					</script>
					
                    <!-- <div class="tab_cont" id="tab1">FAQ</div> -->
                    <div class="tab_cont" id="tab">
                        <div class="word_search">
                            <div class="search">
                                <input type="text" id="searchWord" name="searchWord" placeholder="검색어 입력" value="<c:out value="${commandMap.searchWord }" />" />
                                <button id="searchBtn" type="button" class="btn inp_search" >
                                    <em class="blind">검색하기</em>
                                </button>
                            </div>
                        </div>
                        <div class="table_wrap mb100">
                            <table class="tb_col type02">
                                <caption>공지사항 - 번호, 제목, 작성일, 조회수 출력 표입니다.</caption>
                                <colgroup>
                                    <col style="width:9.17%">
                                    <col style="width:auto">
                                    <col style="width:12%">
                                    <col style="width:10.5%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">번호</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">조회수</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:if test="${not empty topList }">
                						<c:forEach var="row" items="${topList }" varStatus="i">
		                                    <tr>
		                                        <td><span class="ico_noti">공지</span></td>
		                                        <td class="left"><a href="javascript:;" data-brd_nts_idx="<c:out value="${row.BRD_NTS_IDX }"/>" data-brd_nts_top_yn="Y"><c:out value="${row.BRD_NTS_TITLE }"/></a></td>
		                                        <td><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy-MM-dd"/></td>
		                                        <td><fmt:formatNumber value="${row.BRD_NTS_READ_CNT}" groupingUsed="true"/></td>
		                                    </tr>
		                                </c:forEach>
		                            </c:if>
		                            <c:choose>
	                					<c:when test="${not empty list }">
	                    					<c:set var="listNum" value="${paging.listNum}" />
	                    						<c:forEach var="row" items="${list }" varStatus="i">	       
				                                    <tr>
				                                        <td><c:out value="${listNum }"/></td>
				                                        <td class="left"><a href="javascript:;" data-brd_nts_idx="<c:out value="${row.BRD_NTS_IDX }"/>" data-brd_nts_top_yn="N"><c:out value="${row.BRD_NTS_TITLE }"/></a></td>
				                                        <td><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy-MM-dd"/></td>
			                        					<td><fmt:formatNumber value="${row.BRD_NTS_READ_CNT}" groupingUsed="true"/></td>
				                                    </tr>
				                                    <c:set var="listNum" value="${listNum-1}" />
				                                </c:forEach>
				                        </c:when>
				                        <c:otherwise>
		                                    <tr class="no_data">
		                                        <td colspan="3">
		                                            <div class="box">
		                                                <span class="txt">조회 내용이 없습니다.</span>
		                                            </div>
		                                        </td>
		                                    </tr>
				                        </c:otherwise>
				                    </c:choose>            
                                  
                                </tbody>
                            </table>
                            
                        </div>
                        
                        
                        <!-- section pagination -->
			             <div class="pagination">
							<ui:frontpaging paging="${paging }" jsFunction="goPage" />
			             </div>
			             <!-- // section pagination -->
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
    <!--// Content -->
    


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<!-- 임시적용, 실적용X -->
<script>
    /* $(function(){
        $('.tab_wrap li:first').removeClass('on');
        $('.tab_wrap').find('.tab_cont:first').hide();
        $('.tab_wrap>.tab').each(function(){
            var idx = $(this).find(".on").index();
            console.log( $('.tab li').eq(idx) );
            var name = $('.tab li').eq(idx).children().attr('href');
            $(name).show();
        });
    }); */
    
    
    $(function()
   		{
   			// 상세보기 제목 클릭 이벤트
   		    $(document).on("click", ".left", function () 
   		    {
   		        var $frm = $("#frm");
   		        $frm.find("input[name='BRD_NTS_IDX']").val($(this).children('a').data("brd_nts_idx"));
   		        $frm.find("input[name='BRD_NTS_TOP_YN']").val($(this).children('a').data("brd_nts_top_yn"));	        
   		        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/noticeBoardView.do", "target":"_self", "method":"get"}).submit();
   		    });
   			
   			// 페이지 이동
   		    goPage = function (cPage) 
   		    {
   		        var $frm = $("#frm");
   		        $frm.find("input[name='cPage']").val(cPage);
   		        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/noticeBoardList.do", "target":"_self", "method":"get"}).submit();
   		    };
   		    
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
   		});
    	
	    $(document).on("click", "#searchBtn", function(){
			if($("#searchWord").val() == ""){
				alert("검색어를 입력하세요");
				$("#searchWord").focus();
				return;
			}else{
				//goPage(1);
				$("#frm").attr("action", "<c:out value="${frontDomain }" />/pc/customer/noticeBoardList.do").submit();
			}
		});
		
		
		// 내용 검색 필드 엔터 이벤트 
	    $(document).on("keydown", "#searchWord", function (e) 
	    {
	        if(e.keyCode == 13)
	        {
	            $("#searchBtn").trigger("click");
	            return false;
	        }
	    });
    	
	
</script>