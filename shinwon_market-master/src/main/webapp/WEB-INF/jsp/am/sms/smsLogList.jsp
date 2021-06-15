<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
	<a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

	<aside id="navigation"><!-- navigation -->
		<nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
		</nav>
	</aside><!-- // navigation -->

	<div id="body"><!-- body -->

		<section id="contents"><!-- contents -->

			<div id="breadcrumb"><!-- breadcrumb -->
				<a href="#none"><i class="icon-home em"></i> HOME</a>
				&gt;
				<a href="#none">SMS 발송내역</a>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">SMS 발송내역</h3>

				<div class="title-box">
					<h4 class="title">검색</h4>

					<div class="right">
						<a href="javascript:search();" class="button button-b"><span>검색</span></a>
						<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
					</div>
				</div>

				<div class="section-form"><!-- section-form-a -->

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
					<div class="form-group">
						<label class="label"><span>발송일</span></label>
						<div class="field">
							<select class="select" name="searchSendYear" ID="searchSendYear" title="년">
                            <c:forEach begin="2014" end="${commandMap.END_SEARCH_SEND_YEAR}" var="year">
                                <option value="<fmt:formatNumber pattern="00" value="${year}" />" <c:if test="${commandMap.searchSendYear eq  year}">selected="selected"</c:if>><fmt:formatNumber pattern="00" value="${year}" /></option>
                            </c:forEach>
                            </select>
                            	년
                            <select class="select" name="searchSendMonth" ID="searchSendMonth" title="월">
                            <c:forEach begin="1" end="12" var="month">
                                <option value="<fmt:formatNumber pattern="00" value="${month}" />" <c:if test="${commandMap.searchSendMonth eq  month}">selected="selected"</c:if>><fmt:formatNumber pattern="00" value="${month}" /></option>
                            </c:forEach>
                            </select>
                            	월
                            <select class="select" name="searchSendDay" ID="searchSendDay" title="일">
                            <option value="">선택</option>
                            <c:forEach begin="1" end="31" var="day">
                                <option value="<fmt:formatNumber pattern="00" value="${day}" />" <c:if test="${commandMap.searchSendDay eq  day}">selected="selected"</c:if>><fmt:formatNumber pattern="00" value="${day}" /></option>
                            </c:forEach>
                            </select>
                            	일			
						</div>
						
						<div class="form-group">
				             <label class="label"><span>발송형태</span></label>
				             <div class="field">
				            	 <input type="radio" id="lms" name="searchSendType" value="lms" <c:if test="${empty commandMap.searchSendType or commandMap.searchSendType eq 'lms'}">checked="checked"</c:if>/><label for="lms">LMS</label>
				             	<input type="radio" id="sms" name="searchSendType" value="sms" <c:if test="${commandMap.searchSendType eq  'sms'}">checked="checked"</c:if>/><label for="sms">SMS</label>
				             </div>
				         </div>
						
						<div class="form-group">
							<label class="label"><span>수신번호</span></label>
							<div class="field">
								<input type="text" class="text" id="searchPhoneNo" name="searchPhoneNo" value="<c:out value="${commandMap.searchPhoneNo }"/>" />
							</div>
						</div>
						
						<div class="form-group" style="display: none;">
							<label class="label"><span>문자종류</span></label>
							<div class="field">
								<input type="radio" id="searchEtcY" name="searchEtc" value="Y" checked="checked"/><label for="searchEtcY">직접보낸것</label>
								<input type="radio" id="searchEtcAll" name="searchEtc" value="ALL" <c:if test="${commandMap.searchEtc eq 'ALL'}">checked="checked"</c:if>/><label for="searchEtcAll">전체</label>
							</div>
						</div>
					</div>

				</form>
				
				</div><!-- // section-form-a -->

				<h4 class="title">리스트</h4>

				<div class="table-a"><!-- col list -->
					<table class="core">
						<colgroup>
							<col style="width: 15%;" />
							<col style="width: 15%;" />
							<col style="width: auto;" />
							<col style="width: 15%;" />
							<col style="width: 15%;" />
						</colgroup>
						<thead>
							<tr>
								<th>상담원</th>
								<th>수신번호</th>
								<th>발송내용</th>
								<th>발송일</th>
								<th>결과코드</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
						    <c:when test="${not empty list}">
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td>
										<c:choose>
											<c:when test="${not empty item.REG_ID}">
												<c:out value="${item.REG_ID }" />(<c:out value="${item.REG_NM }" />)
											</c:when>
											<c:otherwise>
												-
											</c:otherwise>
										</c:choose>
									</td>
									<td><c:out value="${item.PHONE_NO }" /></td>
									<td>${fn:substring(item.CONTENTS, 0, 90) }<c:if test="${fn:length(item.CONTENTS) > 90}">...</c:if></td>
								    <td><ui:formatDate value="${item.SEND_DATE}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
								    <td><c:out value="${item.RESULT_CODE }" /></td>
								</tr>
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
								<c:if test="${commandMap.searchYn eq 'Y'}">
								<tr>
								<td colspan="5">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
								</c:if>
								<c:if test="${commandMap.searchYn ne 'Y'}">
								<tr>
								<td colspan="5">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
								</tr>
								</c:if>
						    </c:otherwise>
						</c:choose>
						</tbody>
					</table>
				</div><!-- // col list -->

                <form id="frm" name="frm">
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
                <input type="hidden" name="searchYn" value="Y" />
                <input type="hidden" name="searchSendYear" value="<c:out value="${commandMap.searchSendYear }"/>" />
                <input type="hidden" name="searchSendMonth" value="<c:out value="${commandMap.searchSendMonth }"/>" />
                <input type="hidden" name="searchSendDay" value="<c:out value="${commandMap.searchSendDay }"/>" />
                <input type="hidden" name="searchSendType" value="<c:out value="${commandMap.searchSendType }"/>"/>
                <input type="hidden" name="searchPhoneNo" value="<c:out value="${commandMap.searchPhoneNo }"/>"/>
                
				<div class="pagination"><!-- pagination -->
				    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->

				<div class="bbs-status"><!-- bbs status -->
					<div class="page">
						총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
					</div>
					<div class="sort">
						<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
					</div>
				</div><!-- // bbs status -->

                </form>
                
			</div><!-- // contents-inner -->
			
			<div>
				<h4>MMS 결과코드</h4>
				1000 :
				성공<br/>
				2000 :
				포맷 에러<br/>
				2001 :
				잘못된 번호<br/>
				2002 :
				컨텐츠 사이즈 및 개수 초과<br/>
				2003 :
				잘못된 컨텐츠<br/>
				3000 :
				기업형 MMS 미지원 단말기<br/>
				3001 :
				단말기 메시지 저장개수 초과<br/>
				3002 :
				전송시간 초과<br/>
				3004 :
				전원 꺼짐<br/>
				3005 :
				음영지역<br/>
				3006 :
				기타<br/>
				4000 :
				서버문제로 인한 접수 실패<br/>
				4001 :
				단말기 일시 서비스 정지<br/>
				4002 :
				통신사 내부 실패(무선망단)<br/>
				4003 :
				서비스의 일시적인 에러<br/>
				4101 :
				계정 차단<br/>
				4102 :
				허용되지 않은 IP 접근<br/>
				4104 :
				건수 부족<br/>
				4201 :
				국제 MMS 발송 권한이 없음<br/>
				5000 :
				번호이동에러<br/>
				5001 :
				선불발급 발송건수 초과<br/>
				5003 :
				스팸<br/>
				5201 :
				중복된 키 접수 차단<br/>
				5202 :
				중복된 수신번호 접수 차단<br/>
				9001 :
				발송 미허용 시간 때 발송 실패
				(환경 파일의 co.start_time ~ co.end_time 시간 이 외에 발송 시 실패 처리)<br/>
				9002 :
				폰 넘버 에러<br/>
				9003 :
				스팸 번호(스팸 테이블 사용시)<br/>
				9004 :
				이통사에서 응답 없음<br/>
				9005 :
				파일크기 오류<br/>
				9006 :
				지원되지 않는 파일<br/>
				9007 :
				파일오류<br/>
				9008 :
				MMS_MSG의 MSG_TYPE 값이 잘못되었음<br/>
				9009 :
				환경설정파일의 mms.dup.check.seconds 에 적용 시간(초) 이내에 수신자번호+메시지내용 이 중복인 경우 실패처리<br/>
				9010 :
				재전송 횟수 초과로 실패.<br/>
				9011 :
				발송 지연으로 인한 실패
				(환경파일의 mms.submit_timeout.minute에 설정된 시간 보다 발송 요청 시간이 초과한 경우)
				
				<h4>SMS 결과코드</h4>
				00 :
				결과 수신 대기 (현재 사용안함 사용안함 )<br/>
				01 :
				시스템 장애<br/>
				02 :
				인증실패 , 직후 연결을 끊음<br/>
				03 :
				메시지 형식 오류<br/>
				04 :
				BIND BIND BIND BIND BIND 안됨<br/>
				05 :
				착신가입자 없음 (미등록 ) ( ) (현재 사용안함 )<br/>
				06 :
				전송 성공<br/>
				07 :
				비가입자 ,결번 ,서비스정지<br/>
				08 :
				단말기 PowerPower Power-off off off off 상태<br/>
				09 :
				음영<br/>
				10 :
				단말기 메시지 FULLFULLFULL<br/>
				11 :
				타임아웃<br/>
				14 :
				무선망에러<br/>
				17 :
				CallbackURL CallbackURL CallbackURL CallbackURL CallbackURL CallbackURL CallbackURL CallbackURL 사용자 아님<br/>
				18 :
				메시지 중복 발송<br/>
				19 :
				월 송신 건수 초과<br/>
				20 :
				기타에러<br/>
				21 :
				착신번호 에러 (자리수에러 )<br/>
				22 :
				착신번호 에러 (없는 국번 )<br/>
				23 :
				수신거부 메시지 없음<br/>
				24 :
				21 시 이후 광고<br/>
				25 :
				성인광고 , 대출광고 등 기타 제한<br/>
				26 :
				데이콤 스팸 필터링<br/>
				27 :
				야간발송차단<br/>
				40 :
				단말기착신거부 (스팸등 )<br/>
				91 :
				발송 미허용 시간 때 발송 실패 처리<br/>
				99 :
				환경설정파일의 sms.dup.check.seconds 에 적용 시간(초) 이내에 수신자번호+메시지내용 이 중복인 경우 실패처리.<br/>
			</div> 

		</section><!-- // contents -->

	</div><!-- // body -->

	<footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
	</footer><!-- // footer -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {

    // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });

    // 검색
    search = function() 
    {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/sms/smsLogList.do", "target":"_self", "method":"get"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/sms/smsLogList.do", "target":"_self", "method":"get"}).submit();
    };
        
});
</script>
</body>
</html>