<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>	

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">포인트</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
			
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				<jsp:useBean id="now" class="java.util.Date" />		
				<c:choose>
					<c:when test="${memSwId != 0 }">
						<!-- 임직원일 경우  -->
						<div class="top_point type2">
							<div class="point_list">
								<ul class="clearboth">
									<li>
										<p class="tit">사용 가능한 통합포인트</p>
										<p class="p_txt"><strong>0</strong> p</p>
									</li>
									<li>
										<p class="tit">사용 가능한 E포인트</p>
										<p class="p_txt"><strong>1,000,000</strong> p</p>
									</li>
									<li>
										<p class="tit">사용 가능한 임직원 포인트</p>
										<p class="p_txt"><strong>0</strong> p</p>
									</li>
								</ul>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<!-- 임직원 아닐 경우  -->
						<c:if test="${myEpointMap != null }">
							<div class="top_point bt_none">
								<div class="point_list type2">
									<ul class="clearboth">
										<li>
											<span class="txt">사용 가능한 통합포인트</span>
											<span class="point"><strong class="purple"><fmt:formatNumber value="${myEpointMap.myTotPoint.MemberPointCheckResult }" type="number"/></strong> p</span>
										</li>
										<li>
											<span class="txt">사용 가능한 E포인트</span>
											<span class="point"><strong class="purple"><fmt:formatNumber value="${myEpointMap.MEM_PIT_TOT_PIT }" type="number"/></strong> p</span>
										</li>
									</ul>
								</div>
							</div>	
						</c:if>
					</c:otherwise>
				</c:choose>													
				<!-- //top_point -->						
				<div class="tab_wrap fix">
					<ul class="tab n2">						
						<li class="${commandMap.formType eq 'tpnForm' ? 'on' : ''}"><a href="#tab1" class="tpn_search">통합 포인트</a></li> 											
						<li class="${commandMap.formType eq 'epointForm' ? 'on' : ''}"><a href="#tab2" class="epoint_search">E포인트</a></li>
					</ul>
					<div class="tab_cont" id="tab1">
						<h4 class="blind">통합 포인트</h4>
						<div class="inquiry_date_wrap clearboth">
							<div class="month_inq">
								<strong class="tit">기간별 조회</strong>
								<span class="month_box clearboth">
									<span class="inline">
										<input type="radio" id="month1" name="month" value="1" class="inp_radio" checked="checked">
										<label for="month1" class="label">
											<em><i class="lato bold">1</i>개월</em>
										</label>
									</span>
									<span class="inline">
										<input type="radio" id="month3" name="month" value="3" class="inp_radio">
										<label for="month3" class="label">
											<em><i class="lato bold">3</i>개월</em>
										</label>
									</span>
									<span class="inline">
										<input type="radio" id="month6" name="month" value="6" class="inp_radio">
										<label for="month6" class="label">
											<em><i class="lato bold">6</i>개월</em>
										</label>
									</span>
									<span class="inline">
										<input type="radio" id="month12" name="month" value="12" class="inp_radio">
										<label for="month12" class="label">
											<em><i class="lato bold">12</i>개월</em>
										</label>
									</span>
								</span>
							</div>
							<!-- <form id="tpnForm"> -->								
							<form id="frm">								
								<div class="day_inq">
									<strong class="tit">일자별 조회</strong>
									<span class="day_box">
										<span class="inline">
											<input type="text" id="beginning" name="fromDate" value="${commandMap.fromDate }" class="inp_txt" title="조회 시작일 입력">
										</span>
										<span class="hyphen"> ~ </span>
										<span class="inline">
											<input type="text" id="finish" name="toDate" value="${commandMap.toDate }" class="inp_txt" title="조회 종료일 입력">
										</span>
										<button type="button" class="${commandMap.formType == 'tpnForm' ? 'btn inp_search tpn_search' : 'btn inp_search epoint_search'}">
											<em class="blind">검색하기</em>
										</button>
										<input type="hidden" value="" name="cPage" />
									</span>
								</div>
							</form>
						</div>
						<!-- //inquiry_date_wrap -->
						<script>
							$(function(){
								$.fn.datePic();
							});
						</script>
					</div>
					<c:choose>
						<c:when test="${commandMap.formType eq 'tpnForm' }">								
							<div class="table_wrap mb95">
								<table class="tb_col">
									<caption>통합 포인트 조회 : 날짜, 상세내역, 적립 포인트, 사용 포인트 출력 표입니다.</caption>
									<colgroup>
										<col style="width:12%;">
										<col>
										<col style="width:25%;">
										<col style="width:25%;">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">날짜</th>
											<th scope="col">상세내역</th>
											<th scope="col">적립 포인트</th>
											<th scope="col">사용 포인트</th>
										</tr>
									</thead>
									<tbody>									
									<c:choose>
										<c:when test="${tpnMapList != null }">
											<c:forEach var="data" items="${tpnMapList }">
												<tr>													
													<td>						
														<fmt:parseDate var="stringDate" value="${data.OCCUR_DATE }" pattern="yyyymmdd" />									
														<fmt:formatDate var="date" value="${stringDate }" pattern="yyyy-MM-dd" />
														<c:out value="${date }" />
													</td>
													<td class="left">														
														${data.OCCUR_NAME }
													</td>
													<td>
														<span class="t_blue">
															<c:if test="${data.OCCUR_POINT != '0' }">
																+
															</c:if>															
															${data.OCCUR_POINT }
														</span>
													</td>
													<td><span class="t_red">														
														0
													</span></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="4">출력할 내용이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>																																				
									</tbody>
								</table>
							</div>											
						</c:when>
						<c:otherwise>						
							<div class="table_wrap mb95">
								<table class="tb_col">
									<caption>E포인트 조회 : 날짜, 상세내역, 적립 포인트, 사용 포인트 출력 표입니다.</caption>
									<colgroup>
										<col style="width:12%;">
										<col>
										<col style="width:25%;">
										<col style="width:25%;">
										<col>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">날짜</th>
											<th scope="col">상세내역</th>
											<th scope="col">적립 포인트</th>
											<th scope="col">사용 포인트</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${pointList != null }">
												<c:forEach var="data" items="${pointList }" varStatus="status">
													<tr>
														<td>																			                                
															<fmt:formatDate var="date" value="${data.MEM_PIT_REG_DT_LABEL }" pattern="yyyy-MM-dd" />
															<c:out value="${date }" />
														</td>
														<td class="left">														
															${data.MEM_PIT_BRK_DWN_NM }
														</td>
														<td><span class="t_blue">
															<c:if test="${data.MEM_PIT_PLS !=0 }">
																+
															</c:if>
															<fmt:formatNumber value="${data.MEM_PIT_PLS }" type="number"/>
														</span></td>
														<td><span class="t_red">
															<c:if test="${data.MEM_PIT_MNS !=0 }">
																-
															</c:if>
															<fmt:formatNumber value="${data.MEM_PIT_MNS }" type="number"/>
														</span></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="4">출력할 내용이 없습니다.</td>
												</tr>
											</c:otherwise>									
										</c:choose>									
									</tbody>
								</table>
							</div>														
						</c:otherwise>
					</c:choose>
					<div class="pagination">
						<ui:frontpaging paging="${paging }" jsFunction="goPage" />
					</div>			
					<!-- //pagination -->					
				</div>

			</div>
			<!-- //sub_content -->
		</div>
	</div>
<script type="text/javascript">
	$(function() {

		$('.tpn_search').click(function() {			
			formSubmit('tpnForm');									
		});
		
		$('.epoint_search').click(function() {			
			formSubmit('epointForm');
		});
		
	})
	
	 // 페이지 이동
    goPage = function (cPage) {
		
		$('input[name="cPage"]').val(cPage);
		
		var className = $('.tpn_search').parent().attr("class");
		if(className == "on") {
			formSubmit('tpnForm');
		}else {
			formSubmit('epointForm');
		}		
    };
	
	//form submit
	formSubmit = function(formType){
		var $frm = $("#frm");
		var formType = $('<input type="hidden" value='+formType+' name="formType">');
		$frm.attr('action','<c:out value="${serverDomain}"/>/pc/mypage/myMileageList.do');			
		$frm.attr('method','POST');			
		$frm.append(formType);
		$frm.submit();
	}

	function numberFormat(inputNumber) {
		return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 날짜 셋팅 - 오늘, 일주일, 15일, 한달, 두달
	function fnDateSet(v_start_name, v_end_name, s_year, s_month, s_day, e_year, e_month, e_day, seperator){
	    $("#"+v_start_name  ).val(getCalculatedDate(s_year, s_month, s_day, seperator));
	    $("#"+v_end_name    ).val(getCalculatedDate(e_year, e_month, e_day, seperator));
	}
	function getCalculatedDate(iYear, iMonth, iDay, seperator){
	    //현재 날짜 객체를 얻어옴.
	    var gdCurDate = new Date();

	    //현재 날짜에 날짜 게산.
	    gdCurDate.setYear ( gdCurDate.getFullYear() + iYear );
	    gdCurDate.setMonth( gdCurDate.getMonth()    + iMonth);
	    gdCurDate.setDate ( gdCurDate.getDate()     + iDay  );

	    //실제 사용할 연, 월, 일 변수 받기.
	    var giYear  = gdCurDate.getFullYear();
	    var giMonth = gdCurDate.getMonth()+1;
	    var giDay   = gdCurDate.getDate();

	    //월, 일의 자릿수를 2자리로 맞춘다.
	    giMonth = "0" + giMonth;
	    giMonth = giMonth.substring(giMonth.length-2,giMonth.length);
	    giDay   = "0" + giDay;
	    giDay   = giDay.substring(giDay.length-2,giDay.length);

	    //display 형태 맞추기.
	    return giYear + seperator + giMonth + seperator +  giDay;
	}
	
	$('input:radio[name="month"]').click(function() {
		fnDateSet('beginning', 'finish', 0, $(this).val() * -1, 0, 0, 0, 0,  '-');
	})
	
	$('input:radio[name="month2"]').click(function() {
		fnDateSet('beginning2', 'finish2', 0, $(this).val() * -1, 0, 0, 0, 0,  '-');
	})
	
</script>
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>