<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-login page-join -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
        <!-- .cate_gnb S -->
	
	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>회원탈퇴</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="padder mt20">
	            <ul class="list list-a">
	                <li>그 동안 마켓플랜트를 이용해 주셔서 감사합니다. </li>
	                <li>사이트 이용시 불편했거나 부족했던 부분을 알려주시면, 더 좋은 모습으로 찾아 뵙기 위해 노력하겠습니다.</li>
	            </ul>
	        </div>
	
	        <h3 class="title-breakaway"><span class="large">회원탈퇴안내</span></h3>
	        
	        <div class="breakaway-guide"><!-- breakaway-guide -->
	            <div class="padder mt20">
	                <p>
	                    회원 탈퇴는 본 서비스에 대한 이용 해지를 의미합니다.<br />
	                    자사가 제공하는 광고성 이메일 및 SMS의 경우 회원탈퇴 접수 후 24시간 이내 발송이 중지됩니다.
	                </p>
	            </div>
	            
	            <div class="frame-a mt20">
	                <p class="warning gray">
	                    다만 데이터처리상의 이유로, 탈퇴처리가 지연될 수 있습니다.
	                </p>
	                <p class="warning gray">
	                    탈퇴신청 이후 48시간이 지난 후에도 이메일 및 SMS를 받으시는 경우 당사 고객센터(02-6925-1160)로 연락 주시기 바랍니다. 
	                </p>
	            </div>
	        
	            <div class="padder mt20">
	                <ol class="list list-ol">
	                    <li>회원탈퇴시,소유하고 있는 포인트/크라운/쿠폰 등은 자동으로 소멸되며, 재가입하더라도 복구되지 않습니다.<br >
	                       (OK멤버십 탈퇴는 OK캐쉬백 사이트에서 가능합니다.)
	                    </li>
	                    <li>주문내역, 찜상품 등 기타 서비스 이용 내용이 모두 삭제되며, 재가입하더라도 복구되지 않습니다.</li>
	                    <li>상품주문 및 취소/교환/반품 처리가 진행중일 경우에는 탈퇴처리가 이루어지지 않습니다.</li>
	                </ol>
	            </div>
				
	            <table class="table-b table-row mt30" border="0" cellpadding="0" cellspacing="0"><!-- table-b -->
	            <caption>회원 탈퇴 범위로 구성된 회원 탈퇴 범위안내 테이블입니다.</caption>
	            <colgroup>
	                <col style="width: 30%;">
	                <col style="width: auto;">
	            </colgroup>
	            <tbody>
	                <tr>
	                    <th scope="row" rowspan="2">회원 탈퇴 범위</th>
	                    <td>
	                        마켓플랜트 온라인 쇼핑몰 회원 탈퇴
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        오프라인 매장 회원 탈퇴
	                    </td>
	                </tr>
	            </tbody>
	            </table><!-- // table-b -->
				
				<c:if test="${summaryMap.MEM_MST_MEM_GBN ne Code.COMMON_COMP_MEMBER_GRADE }">   
		            <table class="table-b table-row mt10" border="0" cellpadding="0" cellspacing="0"><!-- table-b -->
		            <caption>현재 사용가능 포인트, 현재 보유 크라운, 현재 보유 쿠폰으로 구성된 사용가능한 혜택 테이블입니다.</caption>
		            <colgroup>
		                <col style="width: 30%;">
		                <col style="width: auto;">
		            </colgroup>
		            <tbody>
		                <c:if test="${summaryMap.MEM_MST_MEM_GBN ne Code.MEMBER_TYPE_SIMPLE }">
			                <tr>
			                    <th scope="row">현재 사용가능<br />포인트</th>
			                    <td class="text-center">
			                        <strong><span class="warning"><fmt:formatNumber value="${summaryMap.SOLUBLE_MILEAGE}" groupingUsed="true" /></span> M</strong>
			                    </td>
			                </tr>
			                <tr>
			                    <th scope="row">현재 보유<br />크라운</th>
			                    <td class="text-center">
			                        <strong>
			                        	<span class="warning">
			                        		<fmt:formatNumber value="${not empty summaryMap.MEM_PIT_TOT_PIT ? summaryMap.MEM_PIT_TOT_PIT : 0 }" groupingUsed="true"/>
			                        	</span> C
			                        </strong>
			                    </td>
			                </tr>
		                </c:if>
		                <tr>
		                    <th scope="row">현재 보유 쿠폰</th>
		                    <td class="text-center">
		                        <strong><span class="warning"><fmt:formatNumber value="${not empty summaryMap.MEM_CPN_CNT ? summaryMap.MEM_CPN_CNT : 0 }" groupingUsed="true"/></span> 장</strong>
		                    </td>
		                </tr>
		            </tbody>
		            </table><!-- // table-b -->
	            </c:if>
	        </div><!-- // breakaway-guide -->
	
	        <h3 class="title-breakaway"><span class="large">탈퇴회원 정보 보존기간,파기절차 및 시점</span></h3>
	        
	        <div class="breakaway-guide"><!-- breakaway-guide -->
	            <div class="padder mt20">
	                <p>
	                    회원에 대하여 수집한 개인정보는 마켓플랜트 쇼핑몰 탈퇴 신청이 완료된 이후, 보관기간 및 이용기간에 따라 해당 정보를 지체없이 파기합니다. 파기 절차, 방법, 시점은 다음과 같습니다. 
	                </p>
	
	                <ol class="list list-ol mt20">
	                    <li>파기절차 및 시점 고객이 서비스 가입 등을 위해 기재한 개인정보는 서비스 해지 등 이용목적이 달성된 후 내부 방침 및 기타 관련 법령에 의한 정보보호 사유(위 개인정보의 보유 및 이용기간 참조)에 따른 보유기간이 경과한 후에 삭제되거나 파기합니다.<br />
	                        주문정보는 교환/반품/환불 및 사후처리(A/S) 등을 위하여 &lsquo;전자상거래등에서의 소비자보호에 관한 법률&rsquo;에 의거한 개인정보보호정책에 따라 5년간 보관됩니다.<br />
	                        일반적으로 잔존하는 채권-채무 관계가 없는 경우 당사 회원가입시 수집되어 전자적 파일형태로 관리하는 개인정보는 회원 탈퇴 시점에 바로 삭제 됩니다.
	                    </li>
	                    <li>파기방법 종이에 출력된 개인정보는 분쇄기로 분쇄 또는 소각하거나 화학약품 처리를 하여 용해하여 파기하고, 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</li>
	                </ol>
	            </div>
	        </div><!-- // breakaway-guide -->
	
	        <h3 class="title-breakaway"><span class="large">회원 탈퇴 사유</span></h3>
	        
	        <form id="frm" name="frm" method="post">
				<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
		        <div class="breakaway-case"><!-- breakaway-case -->
		            <div class="padder">
		                <ul class="ct">
		                    <c:if test="${not empty secReasonList }">
		                    	<c:forEach var="secReasonRow" items="${secReasonList }" varStatus="i">
			                        <c:if test="${secReasonRow.CMN_COM_IDX ne Code.SEC_REASON_AUTH }">
				                    	<li>
					                        <p class="chk_st0">
					                            <input type="radio" name="MEM_MST_LEV_RSN_CD" id="MEM_MST_LEV_RSN_CD_${secReasonRow.CMN_COM_IDX }" 
						                                class="radio" value="<c:out value="${secReasonRow.CMN_COM_IDX }"/>"/>
					                            <label for="MEM_MST_LEV_RSN_CD_${secReasonRow.CMN_COM_IDX }"><c:out value="${secReasonRow.CMN_COM_NM }"/></label>
					                        </p>
					                    </li>
					                </c:if>
					            </c:forEach>
		                    </c:if>
		                </ul>
		            </div>
		        </div><!-- // breakaway-case -->
		    </form>
	        
	        <div class="section-button"><!-- section-button -->
	            <a href="javascript:goDelete();" class="button warning _pg_link"><span>탈퇴하기</span></a>
	            <a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain }"/>/mobile/mypage/myPageMain.do','_self');" class="button primary _pg_link"><span>취소하기</span></a>
	        </div><!-- // section-button -->
	            
	    </article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	var $frm = $("#frm");
	
 	// 탈퇴하기 버튼 클릭 이벤트
    goDelete = function () {
 		
 		if($("input[name='MEM_MST_LEV_RSN_CD']:checked").length == 0){
 			alert("회원 탈퇴 사유를 선택해주세요.");
 			return;
 		}
 		
 		// 탈퇴 여부 체크
   		var deleteCheckFlag = false;
       		
   		// 탈퇴하려는 회원에 대한 현재 주문이 있는지 체크
   		$.ajax({
             async : false,
             type : "POST",
             data : {"MEM_MST_MEM_ID":"${commandMap.MEM_MST_MEM_ID}"},
             url : "<c:out value="${mobileSslDomain}" />/mobile/mypage/checkOrderAjax.do",
             success : function (data) {
                 if(data.successYn == "Y"){
                     if(data.resultYn == "Y"){
                 		alert("상품주문 및 취소/교환/반품 처리가 진행중일 경우에는 탈퇴처리가 이루어지지 않습니다.\n상품 주문 진행상태를 확인해주세요.");
            			return;
                     }
                     else if(data.resultYn == "N"){
                    	 deleteCheckFlag = true;
                     }
                 }
                 else
                 {
                     alert("데이터 전송중 데이터가 누락 되었습니다.\n다시 시도해 주십시오.");
                     return;
                 }
             },
             error : function () {
                 alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
                 return;
             }
        });

		if(deleteCheckFlag){
			if(confirm( "회원탈퇴를 하시겠습니까?")) {
	  		   //com.laypop('show');//팝업 show
	           $frm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/mypage/deleteMyInfo.do", "target":"_self", "method":"post"}).submit();
	        }				
		}
	};
});
//]]>
</script>
</body>
</html>