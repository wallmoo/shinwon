<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">회원탈퇴</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				
				<div class="tab_wrap fix mb100">
				    <ul class="tab n2">
				        <li class="on"><a href="#tab1">회원탈퇴안내</a></li>
				        <li id="check_tab2"><a href="#tab2">탈퇴회원 정보 보존기간, 파기절차 및 시점</a></li>
				    </ul>
				    <div class="tab_cont" id="tab1">
				    	<h4 class="blind">회원탈퇴안내</h4>
				    	<div class="message_withdraw">
				    		<p>회원 탈퇴는 본 서비스에 대한 이용 해지를 의미합니다.<br>자사가 제공하는 광고성 이메일 및 SMS의 경우 회원탈퇴 접수 후 24시간 이내 발송이 중지됩니다.</p>
							<p>다만 데이터처리상의 이유로, 탈퇴처리가 지연될 수 있습니다.<br>탈퇴신청 이후 48시간이 지난 후에도 이메일 및 SMS를 받으시는 경우 당사 고객센터(1661-2585)로 연락 주시기 바랍니다.</p>
				    	</div>

				    	<div class="note_wrap">
				    		<strong class="tit">[회원 탈퇴 신청에 앞서 아래의 사항을 반드시 확인하여 주세요]</strong>
				    		<ul>
				    			<li><em>회원탈퇴 시, 소유하고 있는 포인트/쿠폰 등은 자동으로 소멸</em>되며, 재가입하더라도 복구되지 않습니다.</li>
				    			<li>주문내역, 좋아요 등 기타 서비스 이용 내용이 모두 삭제되며, 재가입하더라도 복구되지 않습니다.</li>
				    			<li>회원탈퇴 후 당사 사이트에 입력하신 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없으므로 게시물 편집 및 삭제 처리가 원천적으로 불가능 합니다.<br>게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제 하신 후, 탈퇴를 신청하시기 바랍니다.</li>
				    			<li>상품 주문/배송 및 취소/교환/반품 처리가 진행중일 경우에는 모든 처리가 완료된 후에 탈퇴가 가능합니다.</li>
				    			<li>회원탈퇴 후 재가입시에는 신규가입으로 처리되며, <em>탈퇴시점 후 로부터 30일 후 재 가입 가능합니다.</em></li>
				    		</ul>
				    	</div>

						<c:if test="${summaryMap.MEM_MST_MEM_GBN ne Code.COMMON_COMP_MEMBER_GRADE }">            
					    	<table class="tb_row">
					    		<caption>회원탈퇴안내 : 현재 보유 통합포인트, 현재 보유 E포인트, 현재 보유 할인쿠폰</caption>
					    		<colgroup>
					    			<col style="width:20%;">
					    			<col>
					    		</colgroup>
					    		<tbody>
					    			<!-- TODO 보유보인트 수정중 -->
					    			<c:if test="${summaryMap.MEM_MST_MEM_GBN ne Code.MEMBER_TYPE_SIMPLE }">
						    			<tr>
						    				<th scope="row">현재 보유 통합포인트</th>
						    				<td><em class="em lato bold"><fmt:formatNumber value="${not empty summaryMap.SOLUBLE_MILEAGE ? summaryMap.SOLUBLE_MILEAGE : 0 }" groupingUsed="true" /></em>p</td>
						    			</tr>
						    			<tr>
						    				<th scope="row">현재 보유 E포인트</th>
						    				<td><em class="em lato bold"><fmt:formatNumber value="${not empty summaryMap.MEM_PIT_TOT_PIT ? summaryMap.MEM_PIT_TOT_PIT : 0 }" groupingUsed="true" /></em>p</td>
						    			</tr>
						    			<tr>
						    				<th scope="row">현재 보유 할인쿠폰</th>
						    				<td><em class="em lato bold"><fmt:formatNumber value="${not empty summaryMap.MEM_CPN_CNT ? summaryMap.MEM_CPN_CNT : 0 }" groupingUsed="true" /></em>장</td>
						    			</tr>
					    			</c:if>
					    		</tbody>
					    	</table>
						</c:if>
				    </div>
				    <!-- //tab1 -->

				    <div class="tab_cont" id="tab2">
				    	<h4 class="blind">탈퇴회원 정보 보존기간, 파기절차 및 시점</h4>
				    	<div class="message_withdraw">
				    		<p>회원에 대하여 수집한 개인정보는 신원 쇼핑몰 탈퇴 신청이 완료된 이후,<br>
				    		보관기간 및 이용기간에 따라 해당 정보를 지체없이 파기합니다. 파기 절차, 방법, 시점은 다음과 같습니다.</p>
				    	</div>

				    	<div class="note_wrap">
				    		<ul>
				    			<li>
				    				파기절차 및 시점 고객이 서비스 가입 등을 위해 기재한 개인정보는 서비스 해지 등 이용목적이 달성된 후 내부 방침 및 기타 관련 법령에 의한 정보보호 사유(위 개인정보의 보유 및 이용기간 참조)에 따른<br> 보유기간이 경과 한 후에 삭제되거나 파기합니다. 주문정보는 교환/반품/환불 및 사후처리(A/S) 등을 위하여 ‘전자상거래등에서의 소비자보호에 관한 법률’에 의거한 개인정보보호정책에 따라 5년간 보관됩니다.<br>일반적으로 잔존하는 채권-채무 관계가 없는 경우 당사 회원가입시 수집되어 전자적 파일형태로 관리하는 개인정보는 회원 탈퇴 시점에 바로 삭제 됩니다.
				    			</li>
				    			<li>파기방법 종이에 출력된 개인정보는 분쇄기로 분쇄 또는 소각하거나 화학약품 처리를 하여 용해하여 파기하고, 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</li>
				    		</ul>
				    	</div>
				    </div>
					<!-- //tab2 -->
				</div>

				<div class="con_tit_wrap">
					<h3 class="con_tit">회원 탈퇴 사유</h3>
				</div>

				<div class="withdraw_reason">
					<form id="frm" name="frm" method="post">
						<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
						<ul>
							<c:if test="${not empty secReasonList }">
								<c:forEach var="secReasonRow" items="${secReasonList }" varStatus="i">
									<c:if test="${secReasonRow.CMN_COM_IDX ne Code.SEC_REASON_AUTH }">
										<c:choose>
											<c:when test="${secReasonRow.CMN_COM_IDX ne '1849' }">
												<li>
													<input type="radio" id="MEM_MST_LEV_RSN_CD_${secReasonRow.CMN_COM_IDX }" name="MEM_MST_LEV_RSN_CD" value='<c:out value="${secReasonRow.CMN_COM_IDX }" />'>
													<label for="MEM_MST_LEV_RSN_CD_${secReasonRow.CMN_COM_IDX }"><span class="icon"></span><c:out value="${secReasonRow.CMN_COM_NM }" /></label>
												</li>
											</c:when>
											<c:when test="${secReasonRow.CMN_COM_IDX eq '1849' }">
												<li>
													<input type="radio" id="MEM_MST_LEV_RSN_CD_${secReasonRow.CMN_COM_IDX }" name="MEM_MST_LEV_RSN_CD" value='<c:out value="${secReasonRow.CMN_COM_IDX }" />'>
													<label for="MEM_MST_LEV_RSN_CD_${secReasonRow.CMN_COM_IDX }"><span class="icon"></span><c:out value="${secReasonRow.CMN_COM_NM }" /></label>
													<input type="text" name="MEM_MST_LEV_RSN">
												</li>
											</c:when>
										</c:choose>
									</c:if>
								</c:forEach>
							</c:if>
						</ul>
					</form>
				</div>

				<div class="btn_wrap">
					<button onclick="goCancle()" type="button" class="btn_large">취소</button>
					<button onclick="goDelete()" type="button" class="btn_large ok">회원탈퇴</button>
				</div>

			</div>
			<!-- //sub_content -->

		</div>
	</div>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
$(function(){
	
	var $frm = $("#frm");
	
	goCancle = function(){
		location.href = "<c:out value="${frontDomain}" />/pc/mypage/myPageMain.do";
	}
	
	goDelete = function(){
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
             url : "<c:out value="${serverSslDomain}" />/pc/mypage/checkOrderAjax.do",
             success : function (data) {
                 if(data.successYn == "Y"){
                     if(data.resultYn == "Y"){
                 		alert("상품주문 및 취소/교환/반품 처리가 진행중일 경우에는 탈퇴처리가 이루어지지 않습니다.\n상품 주문 진행상태를 확인해주세요.");
            			return;
                     }
                     else if(data.resultYn == "N"){
                    	 deleteCheckFlag = true;
                     }
                 } else {
                     alert("데이터 전송중 데이터가 누락 되었습니다.\n다시 시도해 주십시오.");
                     return;
                 }
             },
             error : function () {
                 alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
                 return;
             }
        });
		
		if(!getCheckPoint() && !$("#check_tab2").hasClass("on")){
			if(confirm("탈퇴 시 소유하고 있는 포인트/할인쿠폰은 자동으로 소멸됩니다. 그래도 회원탈퇴를 하시겠습니까?")) {
	           $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/deleteMyInfo.do", "target":"_self", "method":"post"}).submit();
			}
		} else if(deleteCheckFlag){
			if(confirm("회원탈퇴를 하시겠습니까?")) {
	  		   //com.laypop('show');//팝업 show
	           $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/deleteMyInfo.do", "target":"_self", "method":"post"}).submit();
			}
		}
	}
	
	getCheckPoint = function(){
		// TODO 보유 포인트 확인 수정 필요
		var checkPoint = ["0", "100", "0"];
		
		return checkPoint.every(function(elem){ return elem == 0;});
	}
})
</script>