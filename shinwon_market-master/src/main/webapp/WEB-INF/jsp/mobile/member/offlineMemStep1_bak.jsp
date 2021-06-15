<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-login page-join"><!-- page class : page-login page-join -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		
			<!-- .section-title S -->
			<div class="section-title _hd_fix">
	            <h2>통합 회원 전환</h2>
	            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div>
			<!--// .section-title E -->
	
			<!-- .combineMem S -->
			<section class="combineMem">
				<form id="frm" name="frm">
					<input type="hidden" name="MEM_IPN_BIR_DT" id="MEM_IPN_BIR_DT" value="<c:out value="${commandMap.MEM_IPN_BIR_DT }"/>"/>
					<input type="hidden" name="MEM_IPN_CI" id="MEM_IPN_CI" value="<c:out value="${commandMap.MEM_IPN_CI }"/>"/>
					<input type="hidden" name="MEM_IPN_DI" id="MEM_IPN_DI" value="<c:out value="${commandMap.MEM_IPN_DI }"/>"/>
					<input type="hidden" name="MEM_IPN_SEX" id="MEM_IPN_SEX" value="<c:out value="${commandMap.MEM_IPN_SEX }"/>"/>
					<input type="hidden" name="MEM_MST_ERP_ID" id="MEM_MST_ERP_ID" value="<c:out value="${commandMap.MEM_MST_ERP_ID }"/>"/>
					<input type="hidden" name="MEM_MST_OCB_NO" id="MEM_MST_OCB_NO" value="<c:out value="${commandMap.MEM_MST_OCB_NO }"/>"/>
					<input type="hidden" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" value="<c:out value="${commandMap.MEM_MST_MEM_NM }"/>"/>
					<input type="hidden" name="MEM_MST_MAIL"   id="MEM_MST_MAIL" value="<c:out value="${commandMap.MEM_MST_MAIL }"/>"/>
					<input type="hidden" name="MEM_MST_ZIP_CDE6" id="MEM_MST_ZIP_CDE6" value="<c:out value="${commandMap.MEM_MST_ZIP_CDE6 }"/>"/>
					<input type="hidden" name="MEM_MST_ZIP_CDE5" id="MEM_MST_ZIP_CDE5" value="<c:out value="${commandMap.MEM_MST_ZIP_CDE5 }"/>"/>
					<input type="hidden" name="MEM_MST_DRO_ADR1" id="MEM_MST_DRO_ADR1" value="<c:out value="${commandMap.MEM_MST_DRO_ADR1 }"/>"/>
					<input type="hidden" name="MEM_MST_DRO_ADR2" id="MEM_MST_DRO_ADR2" value="<c:out value="${commandMap.MEM_MST_DRO_ADR2 }"/>"/>
					<input type="hidden" name="MEM_MST_JBN_ADR1" id="MEM_MST_JBN_ADR1" value="<c:out value="${commandMap.MEM_MST_JBN_ADR1 }"/>"/>
					<input type="hidden" name="MEM_MST_JBN_ADR2" id="MEM_MST_JBN_ADR2" value="<c:out value="${commandMap.MEM_MST_JBN_ADR2 }"/>"/>
					<input type="hidden" name="MEM_MST_TEL1" id="MEM_MST_TEL1" value="<c:out value="${commandMap.MEM_MST_TEL1 }"/>"/>
					<input type="hidden" name="MEM_MST_TEL2" id="MEM_MST_TEL2" value="<c:out value="${commandMap.MEM_MST_TEL2 }"/>"/>
					<input type="hidden" name="MEM_MST_TEL3" id="MEM_MST_TEL3" value="<c:out value="${commandMap.MEM_MST_TEL3 }"/>"/>
					<input type="hidden" name="MEM_MST_HP1" id="MEM_MST_HP1" value="<c:out value="${commandMap.MEM_MST_HP1 }"/>"/>
					<input type="hidden" name="MEM_MST_HP2" id="MEM_MST_HP2" value="<c:out value="${commandMap.MEM_MST_HP2 }"/>"/>
					<input type="hidden" name="MEM_MST_HP3" id="MEM_MST_HP3" value="<c:out value="${commandMap.MEM_MST_HP3 }"/>"/>
					<input type="hidden" name="MEM_MST_BIR_DT" id="MEM_MST_BIR_DT" value="<c:out value="${commandMap.MEM_MST_BIR_DT }"/>"/>
					<input type="hidden" name="MEM_MST_RCM_ID" id="MEM_MST_RCM_ID" value="<c:out value="${commandMap.MEM_MST_RCM_ID }"/>"/>
					<input type="hidden" name="TRM_YN0001" id="TRM_YN0001" value="<c:out value="${commandMap.TRM_YN0001 }"/>"/>
					<input type="hidden" name="TRM_YN0002" id="TRM_YN0002" value="<c:out value="${commandMap.TRM_YN0002 }"/>"/>
					<input type="hidden" name="TRM_YN0003" id="TRM_YN0003" value="<c:out value="${commandMap.TRM_YN0003 }"/>"/>
					<input type="hidden" name="TRM_YN0004" id="TRM_YN0004" value="<c:out value="${commandMap.TRM_YN0004 }"/>"/>
					<input type="hidden" name="membershipYn" id="membershipYn" value="<c:out value="${commandMap.membershipYn }"/>"/>
					<input type="hidden" name="P8E1CTDG" id="P8E1CTDG" value="<c:out value="${commandMap.P8E1CTDG }"/>"/>
					<dl>
						<dt>
							<h3>마켓플랜트 통합 회원 전환</h3>
							<p class="sub_tx">
								<span>마켓플랜트는 통합 회원 전환으로 보다 나은 서비스를 제공하고자 합니다.</span>
								<span>통합회원은 하나의 ID로 온라인, 오프라인 서비스를 이용하실 수 있는 서비스입니다.</span>
							</p>
						</dt>
						<dd class="dd_tabMn">
							<ol class="ui-grid-c">							
								<li class="ui-block-a on">
									<p>
										<span>STEP 01</span>
										<strong>가입정보<br/>확인</strong>
									</p>
								</li>
								<li class="ui-block-b">
									<p>
										<span>STEP 02</span>
										<strong>약관동의</strong>
									</p>
								</li>
								<li class="ui-block-c">
									<p>
										<span>STEP 03</span>
										<strong>정보확인</strong>
									</p>
								</li>
								<li class="ui-block-d">
									<p>
										<span>STEP 04</span>
										<strong>전환완료</strong>
									</p>
								</li>
							</ol>
						</dd>
						<dd class="dd_SubsInfo">
							<p class="tx_msg">
								<span class="co_blu">귀하는 오프라인회원으로 다음과 같이 가입되어 있습니다. 가입정보를 확인해주세요.</span>
							</p>
							<table>
								<caption>가입정보확인에 오프라인 가입일, 멤버십 번호, 총 포인트, 당월 소멸 예정 포인트로 구성된 표</caption>
								<colgroup>
								<col style="width:45%" />
								<col />
								</colgroup>
								<tbody>
									<tr>
										<th><strong>오프라인 가입일</strong></th>
										<td>
											<c:if test="${not empty commandMap.offRegDt || commandMap.offRegDt != 0 }">
												<ui:formatDate pattern="yyyy.MM.dd" value="${commandMap.offRegDt}"/>
											</c:if>
										</td>
									</tr>
									<tr>
										<th><strong>멤버십 번호</strong></th>
										<td>
											<c:if test="${not empty commandMap.MEM_MST_OCB_NO }">
												<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 0, 4) }"/> -
												<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 4, 8) }"/> -
												<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 8, 12) }"/> -
												<c:out value="${fn:substring(commandMap.MEM_MST_OCB_NO, 12, 16) }"/>
											</c:if> 
										</td>
									</tr>
									<tr>
										<th><strong>총 포인트</strong></th>
										<td>
											<c:if test="${commandMap.SOLUBLE_MILEAGE != 0}">
												<fmt:formatNumber value="${commandMap.SOLUBLE_MILEAGE}" groupingUsed="true" />M
											</c:if>
										</td>
									</tr>
									<tr>
										<th><strong>당월 소멸 예정 포인트</strong></th>
										<td>
											<c:if test="${not empty commandMap.EXMILEGE }">
												<fmt:formatNumber value="${commandMap.EXMILEGE}" groupingUsed="true" />M
											</c:if>
										</td>
									</tr>
								</tbody>
							</table>
		
							<div class="combine_chk">
								<h3>통합회원으로 <strong class="co_red">전환</strong> 하시겠습니까?</h3>
								<a href="javascript:goChangeAgree();" class="btn_red"><strong>동의</strong></a>
								<p class="tx_ex">
									가입 정보에 대한 문의는 <a href="tel:02-6925-1160">02-6925-1160</a> 으로 문의해주세요
								</p>
							</div>
						</dd>
					</dl>
				</form>
			</section>
			<!--// .combineMem E -->
				
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
	// 전환 동의 버튼 클릭 시
	goChangeAgree = function(){
		$("#frm").attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/member/offlineMemStep2.do", "target":"_self", "method":"post"}).submit();
	};
});
//]]>
</script>
</body>
</html>