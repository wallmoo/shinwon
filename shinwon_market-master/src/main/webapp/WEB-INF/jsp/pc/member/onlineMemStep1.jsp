<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<article id="container" class="container">
			<div class="contents"><!-- .contents S -->
				
				<dl class="join_top"><!-- .join_top S -->
					<dt><h2>마켓플랜트 통합 회원 전환</h2></dt>
					<dd class="tx_sub">
						<p>마켓플랜트는 통합 회원 전환으로 보다 나은 서비스를 제공하고자 합니다.<br/>
							통합회원은 하나의 ID로 온라인, 오프라인 서비스를 이용하실 수 있는 서비스입니다.</p>
					</dd>
					<dd class="nv stp_4">
						<ol>
							<li class="f on"><strong><span>01</span>가입정보확인</strong></li>
							<li><strong><span>02</span>전환 약관동의</strong></li>
							<li><strong><span>03</span>가입정보 재입력</strong></li>
							<li class="l "><strong><span>04</span>전환완료</strong></li>
						</ol>
					</dd>
				</dl><!--// .join_top E -->
				
				<form id="frm" name="frm">
					<input type="hidden" name="MEM_IPN_BIR_DT" id="MEM_IPN_BIR_DT" value="<c:out value="${commandMap.MEM_IPN_BIR_DT }"/>"/>
					<input type="hidden" name="MEM_IPN_CI" id="MEM_IPN_CI" value="<c:out value="${commandMap.MEM_IPN_CI }"/>"/>
					<input type="hidden" name="MEM_IPN_DI" id="MEM_IPN_DI" value="<c:out value="${commandMap.MEM_IPN_DI }"/>"/>
					<input type="hidden" name="MEM_IPN_SEX" id="MEM_IPN_SEX" value="<c:out value="${commandMap.MEM_IPN_SEX }"/>"/>
					<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
					<input type="hidden" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" value="<c:out value="${commandMap.MEM_MST_MEM_NM }"/>"/>
					<input type="hidden" name="MEM_MST_MAIL"   id="MEM_MST_MAIL" value="<c:out value="${commandMap.MEM_MST_MAIL }"/>"/>
					<input type="hidden" name="MEM_MST_RCM_ID" id="MEM_MST_RCM_ID" value="<c:out value="${commandMap.MEM_MST_RCM_ID }"/>"/>
					<input type="hidden" name="MEM_MST_TEL1" id="MEM_MST_TEL1" value="<c:out value="${commandMap.MEM_MST_TEL1 }"/>"/>
					<input type="hidden" name="MEM_MST_TEL2" id="MEM_MST_TEL2" value="<c:out value="${commandMap.MEM_MST_TEL2 }"/>"/>
					<input type="hidden" name="MEM_MST_TEL3" id="MEM_MST_TEL3" value="<c:out value="${commandMap.MEM_MST_TEL3 }"/>"/>
					<input type="hidden" name="MEM_MST_HP1" id="MEM_MST_HP1" value="<c:out value="${commandMap.MEM_MST_HP1 }"/>"/>
					<input type="hidden" name="MEM_MST_HP2" id="MEM_MST_HP2" value="<c:out value="${commandMap.MEM_MST_HP2 }"/>"/>
					<input type="hidden" name="MEM_MST_HP3" id="MEM_MST_HP3" value="<c:out value="${commandMap.MEM_MST_HP3 }"/>"/>
					<input type="hidden" name="MEM_MST_BIR_DT" id="MEM_MST_BIR_DT" value="<c:out value="${commandMap.MEM_MST_BIR_DT }"/>"/>
					<input type="hidden" name="MEM_MST_ZIP_CDE5" id="MEM_MST_ZIP_CDE5" value="<c:out value="${commandMap.MEM_MST_ZIP_CDE5 }"/>"/>
					<input type="hidden" name="MEM_MST_DRO_ADR1" id="MEM_MST_DRO_ADR1" value="<c:out value="${commandMap.MEM_MST_DRO_ADR1 }"/>"/>
					<input type="hidden" name="MEM_MST_DRO_ADR2" id="MEM_MST_DRO_ADR2" value="<c:out value="${commandMap.MEM_MST_DRO_ADR2 }"/>"/>
					<input type="hidden" name="MEM_MST_JBN_ADR1" id="MEM_MST_JBN_ADR1" value="<c:out value="${commandMap.MEM_MST_JBN_ADR1 }"/>"/>
					<input type="hidden" name="MEM_MST_JBN_ADR2" id="MEM_MST_JBN_ADR2" value="<c:out value="${commandMap.MEM_MST_JBN_ADR2 }"/>"/>
					<input type="hidden" name="MEM_MST_REG_DT" id="MEM_MST_REG_DT" value="<c:out value="${commandMap.MEM_MST_REG_DT }"/>"/>
					<input type="hidden" name="MEM_MST_ERP_ID" id="MEM_MST_ERP_ID" value="<c:out value="${commandMap.MEM_MST_ERP_ID }"/>"/>
					<input type="hidden" name="TRM_YN0001" id="TRM_YN0001" value="<c:out value="${commandMap.TRM_YN0001 }"/>"/>
					<input type="hidden" name="TRM_YN0002" id="TRM_YN0002" value="<c:out value="${commandMap.TRM_YN0002 }"/>"/>
					<input type="hidden" name="TRM_YN0003" id="TRM_YN0003" value="<c:out value="${commandMap.TRM_YN0003 }"/>"/>
					<input type="hidden" name="TRM_YN0004" id="TRM_YN0004" value="<c:out value="${commandMap.TRM_YN0004 }"/>"/>
					<input type="hidden" name="TRM_YN0005" id="TRM_YN0005" value="<c:out value="${commandMap.TRM_YN0005 }"/>"/>
					<input type="hidden" name="TRM_YN0006" id="TRM_YN0006" value="<c:out value="${commandMap.TRM_YN0006 }"/>"/>
					<input type="hidden" name="TRM_YN0007" id="TRM_YN0007" value="<c:out value="${commandMap.TRM_YN0007 }"/>"/>
					<input type="hidden" name="TRM_YN0008" id="TRM_YN0008" value="<c:out value="${commandMap.TRM_YN0008 }"/>"/>
					<input type="hidden" name="erpInfoYn" id="erpInfoYn" value="<c:out value="${commandMap.erpInfoYn }"/>"/>
					<input type="hidden" name="membershipYn" id="membershipYn" value="<c:out value="${commandMap.membershipYn }"/>"/>
					
					<ul class="join_con info_ck_con"><!-- .join_con S -->
						<li class="info_ck">
							<div class="con">
								<h3>귀하는 온라인 회원으로 다음과 같이 가입되어 있습니다.<br/>가입정보를 확인해주세요.</h3>
								<table class="table_st3">
									<caption></caption>
									<colgroup>
									</colgroup>
									<tbody>
										<tr>
											<th><span>온라인 가입일</span></th>
											<td><span><ui:formatDate pattern="yyyy.MM.dd" value="${commandMap.MEM_MST_REG_DT }"/></span></td>
										</tr>
										<tr>
											<th><span>아이디</span></th>
											<td><span><c:out value="${commandMap.maskingId }"/></span></td>
										</tr>
									</tbody>
								</table>
								<p class="tx_ex">
									<strong>통합회원으로 전환 하시겠습니까?</strong>
									<span class="co_red">※ 가입 정보에 대한 문의는 02-6925-1160 으로 문의해주세요.</span>
								</p>
							</div>
						</li>
						<li class="btn_box">
							<a href="javascript:goChangeAgree();" class="btn_st2 btn_rd"><span>동의</span></a>
						</li>
					</ul><!--// .join_con E -->
				</form>
	
			</div><!--// .contents E -->
		</article>
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	
	</section>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	$(function(){
		
		// 전환 동의 버튼 클릭 시
		goChangeAgree = function(){
			$("#frm").attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/onlineMemStep2.do", "target":"_self", "method":"post"}).submit();
		};
	    
	});
</script>
</body>
</html>