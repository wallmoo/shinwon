<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/myInquiryTop.jsp" %>

		<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="tab_wrap pd_reset qna_pd on">
                    <ul class="tab st3 n2">
                        <li class="on"><a href="#tab1">답변대기</a></li>
                        <li><a href="#tab2">답변완료</a></li>
                    </ul>
                    <div class="tab_cont" id="tab1">
                        <div class="inner">
                            <div class="stab_wrap">
                                <ul class="stab n4">
                                    <li><a href="#n">1개월</a></li>
                                    <li><a href="#n">3개월</a></li>
                                    <li><a href="#n">6개월</a></li>
                                    <li><a href="#n">12개월</a></li>
                                </ul>
                            </div>
                            <div class="btn_resist">
                                <button type="button" class="btn mid purple full" id="qustionBtn">문의하기</button>
                            </div>
                            <div class="prod_qna_wrap">
                                <ul>
                                	<c:if test="${not empty list }">
                                		<c:forEach var="list" items="${list }" varStatus="i">
                                			<c:if test="${list.MEM_ADV_RPL_YN eq 'N' }">
			                                    <li>
			                                        <a href="javascript:goInquiryEdit('${list.MEM_ADV_IDX }');" class="question">
			                                            <p class="tit"><c:out value="${list.MEM_ADV_TITLE }"/></p>
			                                            <div class="cont">
			                                                <span class="set"><c:out value="${list.MEM_ADV_QST_TYPE_NM }"/></span><span class="date"><ui:formatDate pattern="yyyy-MM-dd" value="${list.MEM_ADV_REG_DT }"/></span>
			                                            </div>
			                                            <%-- <div class="answer_wp">
			                                                <div class="txt_bx">
			                                                    <div class="txt">
			                                                        <span class="label">Q</span>
			                                                        <c:out value="${list.MEM_ADV_CONTENTS }" />
			                                                    </div>
			                                                </div>
			                                                <div class="txt_bx">
			                                                    <div class="txt">
			                                                        <span class="label">A</span>
			                                                        고객님, 많이 당황하셨어요??<br>주문후 배송까지는 보통 1~3일이 소요됩니다.
			                                                    </div>
			                                                    <p class="date"></p>
			                                                </div>
			                                            </div> --%>
			                                        </a>
			                                    </li>
                                    	</c:if>
                                    	</c:forEach>
                                    </c:if>
                                </ul>
                            </div>
                            <div class="more_area">
                                <button type="button" class="btn_more"><span>더보기</span></button>
                            </div>
                        </div>
                    </div><!-- //tab_cont -->
                    <div class="tab_cont" id="tab2">
                        <div class="inner">
                            <div class="stab_wrap">
                                <ul class="stab n4">
                                    <li><a href="#n">1개월</a></li>
                                    <li><a href="#n">3개월</a></li>
                                    <li><a href="#n">6개월</a></li>
                                    <li><a href="#n">12개월</a></li>
                                </ul>
                            </div>
                            <div class="prod_qna_wrap link">
                                <ul>
                                	<c:if test="${not empty list }">
                                		<c:forEach var="list" items="${list }" varStatus="i">
                                			<c:if test="${list.MEM_ADV_RPL_YN eq 'Y' }">
			                                    <li>
			                                        <a href="javascript:goInquiryDetail('<c:out value="${list.MEM_ADV_IDX }" />')" class="question">
			                                            <p class="tit"><c:out value="${list.MEM_ADV_TITLE }"/></p>
			                                            <div class="cont">
			                                                <span class="set"><c:out value="${list.MEM_ADV_QST_TYPE_NM }"/></span><span class="date"><ui:formatDate pattern="yyyy-MM-dd" value="${list.MEM_ADV_REG_DT }"/></span>
			                                            </div>
			                                        </a>
			                                    </li>
	                                    	</c:if>
                                    	</c:forEach>
                                    </c:if>
                                </ul>
                            </div>
                            <div class="more_area">
                                <button type="button" class="btn_more"><span>더보기</span></button>
                            </div>
                        </div>
                    </div><!-- //tab_cont -->
                </div><!-- //tab_wrap -->
                <script type="text/javascript">
                    $('.tab a').on('click',function(){
                        var idx = $(this).parent('li').index();
                        if(idx == 0) $('.tab_wrap.qna_pd').addClass('on');
                        else $('.tab_wrap.qna_pd').removeClass('on');
                    })
                </script>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
	<form id="pageForm" name="pageForm">
		<input type="hidden" name="cPage" value="${commandMap.cPage }"/>
	</form>
	<form id="detailForm" name="detailForm">
		<input type="hidden" id="MEM_ADV_IDX" name="MEM_ADV_IDX" value="<c:out value="${commandMap.MEM_ADV_IDX }"/>">
		<input type="hidden" id="cPage" name="cPage" value="<c:out value="${commandMap.cPage }"/>">
	</form>
        
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>   
</section>     
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
     $(".ootd_list").mCustomScrollbar({
         axis:"x",
         advanced:{
             autoExpandHorizontalScroll:true
         }
     });
     
	$(function () {
		
	     //문의하기
	     $("#qustionBtn").on("click", function () {
			location.href = "<c:out value="${mobileDomain}" />/mobile/mypage/myInquiryForm.do"
		});
	     
	 	 // 1:1문의 상세화면 이동
	    goInquiryEdit= function(memAdvIdx){
			var $detailForm = $("#detailForm");
			
			$detailForm.find("input[name='MEM_ADV_IDX']").val(memAdvIdx);
			$detailForm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/myInquiryEdit.do", "target":"_self", "method":"post"}).submit();
	    };
	    
	    goInquiryDetail = function(memAdvIdx){
			var $detailForm = $("#detailForm");
			
			$detailForm.find("input[name='MEM_ADV_IDX']").val(memAdvIdx);
			$detailForm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/myInquiryView.do", "target":"_self", "method":"post"}).submit();
	    };
     
     
	});
     
     
     
 </script>