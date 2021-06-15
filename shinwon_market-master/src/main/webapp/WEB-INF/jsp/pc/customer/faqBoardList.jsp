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
               <li		id="faqTab"	 class="on"		<c:if test="${commandMap.tabId == 'faqTab' }" ></c:if>>
               	<a href="#faqTab"				onclick="moveTab('faqTab');">FAQ</a>
               </li>
               <li 	id="noticeTab"		<c:if test="${commandMap.tabId == 'noticeTab' }" ></c:if>>
               	<a href="#noticeTab"			onclick="moveTab('noticeTab');">공지사항</a>
               </li>
               <li		id="answerTab"		<c:if test="${commandMap.tabId == 'answerTab' }" ></c:if>>
               	<a href="#answerTab" class="link"	onclick="moveTab('answerTab');">1:1문의</a>
               </li>
               <li		id="informationTab"	<c:if test="${commandMap.tabId == 'informationTab' }" ></c:if>>
               	<a href="#informationTab" class="link"	onclick="moveTab('informationTab');">입점안내</a>
               </li>
           </ul>
          <div class="tab_cont" id="tab1">
            <div class="word_search">
                <div class="search">
                    <input type="text" id="searchWord" name="searchWord" placeholder="검색어 입력" value="<c:out value="${commandMap.searchWord }" />" />
                    <button id="searchBtn" type="button" class="btn inp_search" >
                        <em class="blind">검색하기</em>
                    </button>
                </div>
            </div>
            <!--<c:out value="${empty commandMap.CMN_COM_UP_IDX }"></c:out>-->
            <div class="stab_wrap">
              <ul class="stab n7">
              	<li <c:if test="${empty commandMap.CMN_COM_UP_IDX }">class="on"</c:if>><a href="/pc/customer/faqBoardList.do">전체</a></li>
              	<c:forEach  var="item" items="${fqaCodeList}" varStatus="i">
              		<li <c:if test="${commandMap.CMN_COM_UP_IDX ne null and commandMap.CMN_COM_UP_IDX eq item.CMN_COM_IDX}">class="on"</c:if>><a href="/pc/customer/faqBoardList.do?CMN_COM_UP_IDX=<c:out value="${item.CMN_COM_IDX}" />"><c:out value="${item.CMN_COM_NM}"/></a></li>
              	</c:forEach>
              </ul>
               <div class="tab_cont">
                <div class="faq_list">
                  <ul>
                  	<c:if test="${empty list }">
                  		조회 내용이 없습니다.
                  	</c:if>
                  	<c:forEach var="item" items="${list}" >
                  		<li>
	                      <a href="#none"><c:out value="${item.BRD_FAQ_TITLE }"/></a>
	                      <div class="answer"><c:out value="${item.BRD_FAQ_CONTENTS }" escapeXml="false"></c:out>
	                      </div>
	                    </li>
                  	</c:forEach>
                  </ul>
                </div>
              </div>
            </div>
          </div>
                  <div class="pagination"><!-- section pagination -->
					<ui:frontpaging paging="${paging }" jsFunction="goPage" />
                </div><!-- // section pagination -->
                  <!-- //pagination -->
          <div class="tab_cont" id="tab2">공지사항</div>
          <div class="tab_cont" id="tab3">1:1문의</div>
          <div class="tab_cont" id="tab4">입점안내</div>
        </div>
      </div>
    </div>
  </div>
  <!--// Content -->

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>

	$(function()
   		{
   			// 상세보기 제목 클릭 이벤트
   		    $(document).on("click", ".left", function () 
   		    {
   		        var $frm = $("#frm");
   		        $frm.find("input[name='BRD_NTS_IDX']").val($(this).data("brd_nts_idx"));
   		        $frm.find("input[name='BRD_NTS_TOP_YN']").val($(this).data("brd_nts_top_yn"));	        
   		        $frm.attr({"action":"<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do", "target":"_self", "method":"get"}).submit();
   		    });
   			
   			// 페이지 이동
   		    goPage = function (cPage) 
   		    {
   		        var $frm = $("#frm");
   		        $frm.find("input[name='cPage']").val(cPage);
   		        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/faqBoardList.do", "target":"_self", "method":"get"}).submit();
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
				$("#frm").attr("action", "<c:out value="${frontDomain }" />/pc/customer/faqBoardList.do").submit();
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