<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<aside id="aside"><!-- #aside -->

	    <div class="service"><!-- service -->
	        <h2>
	            <strong>고객센터</strong>
	            <span>Customer Service</span>
	        </h2>
	        <p class="tel">
	            02-6925-1160
	        </p>
	        <ul>
	            <li><span>평일</span> 09:30 ~ 18:00</li>
	            <li><span>토요일</span> 09:30 ~ 18:00</li>
	        </ul>
	    </div><!-- // service -->
	
	
	
	    <nav id="lnb"><!-- #lnb -->
	        <ul class="d1">
	            <li class="d1 <c:if test="${boardType eq 'faq' }">active</c:if>" >
	                <a href="javascript:;" class="d1"><span>자주 묻는 질문 (FAQ)</span></a>
	                <ul class="d2">
	                	<c:choose>
	                		<c:when test="${not empty fqaCodeList }">
	                			<c:forEach items="${fqaCodeList }" var="code">
	                				<li class="d2 <c:if test="${commandMap.CMN_COM_IDX eq code.CMN_COM_IDX }">active</c:if>"><a href="javascript:;" class="d2" data-cmn_com_idx="<c:out value="${code.CMN_COM_IDX }" />" ><span><c:out value="${code.CMN_COM_NM }" /></span></a></li>		
	                			</c:forEach>
	                		</c:when>
	                	</c:choose>
	                </ul>
	            </li>
	            <li class="d1 <c:if test="${boardType eq 'noti' }">active</c:if>" ><a href="javascript:;" class="d1" id="notiLink"><span>공지사항</span></a></li>
	            <li class="d1 <c:if test="${boardType eq 'eveWin' }">active</c:if>" ><a href="javascript:;" class="d1" id="eveWinLink"><span>당첨자발표</span></a></li>
	            <li class="d1 <c:if test="${boardType eq 'inq' }">active</c:if>" ><a href="javascript:;" class="d1" id="inqLink"><span>1:1문의</span></a></li>
	            <li class="d1 <c:if test="${boardType eq 'branch' }">active</c:if>" ><a href="javascript:;" class="d1" id="branchLink" target="_blank"><span>지점안내</span></a></li>
	        </ul>
	    </nav><!--// #lnb -->
	    
	    <form method="get" name="lnbfrm" id="lnbfrm">
		<input type="hidden" name="CMN_COM_IDX" id="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }" />" />
		<input type="hidden" name="CMN_COM_UP_IDX" id="CMN_COM_UP_IDX" value="<c:out value="${commandMap.CMN_COM_UP_IDX }" />" />
		<input type="hidden" name="BRD_FAQ_IDX" id="BRD_FAQ_IDX" value="" />
		<input type="hidden" name="cPage" id="cPage" value="" />
		</form>
		
		<script type="text/javascript">
			$(function(){
				// 좌측 lnb 클릭 이벤트
			    $(document).on("click", "li.d2 a", function (){
			    	$("#lnbfrm #CMN_COM_IDX").val($(this).data("cmn_com_idx"));
			    	$("#lnbfrm #CMN_COM_UP_IDX").val("");
			    	$("#lnbfrm #BRD_FAQ_IDX").val($(this).data(''));
			    	$("#lnbfrm").attr("action", "<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do").submit();
			    });
				
			    $(document).on("click" , "#faq", function(){
					var cmnComUpIdx = $(this).data("cmn_com_up_idx");
					$("#lnbfrm #CMN_COM_UP_IDX").val(cmnComUpIdx);
					$("#lnbfrm #CMN_COM_IDX").val($(this).data("cmn_com_idx"));
					$("#lnbfrm #BRD_FAQ_IDX").val($(this).data("brd_faq_idx"));
					$("#lnbfrm").attr("action", "<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do").submit();
				});
			    
				// FAQ 하위 유형 선택시 검색
				$(document).on("click" , "#cate", function(){
					var cmnComUpIdx = $(this).data("cmn_com_up_idx");
					$("#lnbfrm #CMN_COM_UP_IDX").val(cmnComUpIdx);
					$("#lnbfrm #BRD_FAQ_IDX").val($(this).data(''));
					$("#lnbfrm").attr("action", "<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do").submit();
				});
				
				$(document).on("click", "#notiLink", function(){
					location.href = "<c:out value="${frontDomain}" />/pc/customer/noticeBoardList.do";
				});
				
				$(document).on("click", "#eveWinLink", function(){
					location.href = "<c:out value="${frontDomain}" />/pc/customer/eventWinList.do";
				});
				
				$(document).on("click", "#inqLink", function(){
					location.href = "<c:out value="${frontDomain}" />/pc/customer/inquiryMain.do";
				});
				
				$(document).on("click", "#branchLink", function(){
					var openNewWindow = window.open("about:blank");

					openNewWindow.location.href = "<c:out value="${frontDomain}" />/info/branch/branchList.do";
					//location.href = "<c:out value="${frontDomain}" />/info/branch/branchList.do"
				});
			});
		</script>	
	</aside><!-- // #aside -->