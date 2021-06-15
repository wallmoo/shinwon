<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	
	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<div class="pg_tit_wrap">
				<h2 class="pg_tit">할인쿠폰</h2>
			</div>

			<div class="sub_content">
			
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->

				<div class="my_coupon_wrap">
					<ul class="clearboth">
						<li>
							<p class="txt">홍길동 님의<br>회원등급은 <strong class="purple">${summaryMap.MEM_GRD_NM }</strong>입니다.</p>
							<!-- 2020.06.16 전체다운로드 기획확인받음. 삭제  -->
							<%-- <button class="btn_coupon">${summaryMap.MEM_GRD_NM } 쿠폰 전체 다운</button> --%>
						</li>
						<li>
							<p class="txt">쿠폰이 필요하신가요?<br>이달의 <strong class="purple">쇼핑혜택</strong>을 확인해보세요.</p>
							<button class="btn_coupon">이달의 쇼핑혜택 바로가기 </button>
						</li>
					</ul>
				</div>

				<div class="coupon_register">
					<p class="tit">쿠폰 등록하기</p>
					<div class="form clearboth">
						<input type="text" id="CPN_PTN_SHP_NO" name="CPN_PTN_SHP_NO" title="쿠폰 번호 입력" placeholder=" - 쿠폰번호를 입력해주세요.">
						<button class="btn b_register" id="register">등록</button>
					</div>
				</div>

				<div class="tab_wrap fix">
					<ul class="tab n2">
						<li class="on" ><a href="#poing_tab1" class="done coupon_tab" data-index="0">사용 가능 쿠폰</a></li>
						<li ><a href="#poing_tab2" class="coupon_tab" data-index="1">지난 쿠폰</a></li>
					</ul>
					<form id="frm">
					<input type="hidden" id="coupon_tab" name="coupon_tab" value="${commandMap.coupon_tab }"/>
					<input type="hidden" id="cPage1" name="cPage1" value="${commandMap.cPage1 }">
					<input type="hidden" id="cPage2" name="cPage2" value="${commandMap.cPage2 }">
					<div class="tab_cont" id="poing_tab1">
						<h4 class="blind">사용 가능 쿠폰</h4>
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
							<div class="day_inq">
								<strong class="tit">일자별 조회</strong>
								<span class="day_box">
									<span class="inline">
										<input type="text" id="beginning" name="startDt1" class="inp_txt" title="조회 시작일 입력" value="${startDt1 }">
									</span>
									<span class="hyphen"> ~ </span>
									<span class="inline">
										<input type="text" id="finish" name="endDt1" class="inp_txt" title="조회 종료일 입력" value="${endDt1 }">
									</span>
									<button type="button" class="btn inp_search" id="btnUsable">
										<em class="blind">검색하기</em>
									</button>
								</span>
							</div>
						</div>
						<!-- //inquiry_date_wrap -->
						<script>
							$(function(){
								$.fn.datePic();
							});
						</script>

						<div class="table_wrap mb95">
							<table class="tb_col">
								<caption>사용 가능 쿠폰 목록 : 쿠폰번호, 상세내역, 적립 포인트, 사용 포인트 출력 표입니다.</caption>
								<colgroup>
									<col style="width:12%;">
									<col>
									<col style="width:16%;">
									<col style="width:19%;">
									<col style="width:16%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">쿠폰번호</th>
										<th scope="col">쿠폰명</th>
										<th scope="col">사용혜택</th>
										<th scope="col">사용기간</th>
										<th scope="col">사용조건</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list}">
										<tr><td colspan="5">사용 가능한 쿠폰이 없습니다.</td></tr>
									</c:if>
									<c:forEach items="${list }" var="data">
										<tr>
											<td>${data.CPN_MST_IDX }</td>
											<td class="left">${data.CPN_MST_TITLE }</td>
											<td>
												<c:if test="${data.CPN_MST_GBN ne 'F'}">
													<fmt:formatNumber pattern="###,###,###">${data.CPN_MST_SAL_PRC }</fmt:formatNumber>
													<c:if test="${data.CPN_MST_SAL_GBN eq 'A'}">% 할인</c:if>
													<c:if test="${data.CPN_MST_SAL_GBN eq 'B'}">원 할인</c:if>
													<c:if test="${data.CPN_MST_SAL_GBN eq 'C'}">포인트</c:if>
												</c:if>
												<c:if test="${data.CPN_MST_GBN eq 'F'}">
													<c:if test="${data.CPN_MST_DLV_GBN eq 'A'}">무료배송</c:if>
													<c:if test="${data.CPN_MST_DLV_GBN eq 'B'}">무료교환</c:if>
													<c:if test="${data.CPN_MST_DLV_GBN eq 'C'}">무료반품</c:if>
												</c:if>
											</td>
											<td>${data.CPN_MST_USE_ST_DT } <br/>~ ${data.CPN_MST_USE_ED_DT }</td>
											<td class="price">
												<c:if test="${data.CPN_MST_SML_PRC > 0}">${data.CPN_MST_SML_PRC }</c:if>
												<c:if test="${data.CPN_MST_SML_PRC == '' or data.CPN_MST_SML_PRC == 0}">-</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="pagination">
							<ui:frontpaging paging="${paging }" jsFunction="goPage" />
						</div>
						<!-- //pagination -->
					</div>
					<div class="tab_cont" id="poing_tab2">
						<h4 class="blind">지난 쿠폰</h4>
						<div class="inquiry_date_wrap clearboth">
							<div class="month_inq">
								<strong class="tit">기간별 조회</strong>
								<span class="month_box clearboth">
									<span class="inline">
										<input type="radio" id="month1-1" name="month2" value="1" class="inp_radio" checked="checked">
										<label for="month1-1" class="label">
											<em><i class="lato bold">1</i>개월</em>
										</label>
									</span>
									<span class="inline">
										<input type="radio" id="month3-1" name="month2" value="3" class="inp_radio">
										<label for="month3-1" class="label">
											<em><i class="lato bold">3</i>개월</em>
										</label>
									</span>
									<span class="inline">
										<input type="radio" id="month6-1" name="month2" value="6" class="inp_radio">
										<label for="month6-1" class="label">
											<em><i class="lato bold">6</i>개월</em>
										</label>
									</span>
									<span class="inline">
										<input type="radio" id="month12-1" name="month2" value="12" class="inp_radio">
										<label for="month12-1" class="label">
											<em><i class="lato bold">12</i>개월</em>
										</label>
									</span>
								</span>
							</div>
							<div class="day_inq">
								<strong class="tit">일자별 조회</strong>
								<span class="day_box">
									<span class="inline">
										<input type="text" id="beginning2" name="startDt2" class="inp_txt" title="조회 시작일 입력" value="${startDt2 }">
									</span>
									<span class="hyphen"> ~ </span>
									<span class="inline">
										<input type="text" id="finish2" name="endDt2" class="inp_txt" title="조회 종료일 입력" value="${endDt2 }">
									</span>
									<button type="button" class="btn inp_search" id="btnUsed">
										<em class="blind">검색하기</em>
									</button>
								</span>
								
							</div>
						</div>
						<!-- //inquiry_date_wrap -->
						<script>
							$(function(){
								$.fn.datePic();
							});
						</script>

						<div class="table_wrap mb95">
							<table class="tb_col">
								<caption>지난 쿠폰 목록 : 쿠폰번호, 상세내역, 적립 포인트, 사용 포인트 출력 표입니다.</caption>
								<colgroup>
									<col style="width:12%;">
									<col>
									<col style="width:16%;">
									<col style="width:19%;">
									<col style="width:16%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">쿠폰번호</th>
										<th scope="col">쿠폰명</th>
										<th scope="col">사용혜택</th>
										<th scope="col">사용기간</th>
										<th scope="col">사용조건</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty list2 }">
										<tr><td colspan="5">조회된 내용이 없습니다.</td></tr>
									</c:if>
									<c:forEach items="${list2 }" var="data">
										<tr>
											<td>${data.CPN_MST_IDX }</td>
											<td class="left">${data.CPN_MST_TITLE }</td>
											<td>
												<c:if test="${data.CPN_MST_GBN ne 'F'}">
													<fmt:formatNumber pattern="###,###,###">${data.CPN_MST_SAL_PRC }</fmt:formatNumber>
													<c:if test="${data.CPN_MST_SAL_GBN eq 'A'}">% 할인</c:if>
													<c:if test="${data.CPN_MST_SAL_GBN eq 'B'}">원 할인</c:if>
													<c:if test="${data.CPN_MST_SAL_GBN eq 'C'}">포인트</c:if>
												</c:if>
												<c:if test="${data.CPN_MST_GBN eq 'F'}">
													<c:if test="${data.CPN_MST_DLV_GBN eq 'A'}">무료배송</c:if>
													<c:if test="${data.CPN_MST_DLV_GBN eq 'B'}">무료교환</c:if>
													<c:if test="${data.CPN_MST_DLV_GBN eq 'C'}">무료반품</c:if>
												</c:if>
											</td>
											<td>
												${data.CPN_MST_USE_ST_DT } <br/>~ ${data.CPN_MST_USE_ED_DT }
												<c:if test="${not empty data.CPN_MEM_USE_DT}"><br />사용완료(${data.CPN_MEM_USE_DT })</c:if>
											</td>
											<td class="price">
												<c:if test="${data.CPN_MST_SML_PRC > 0}">${data.CPN_MST_SML_PRC }</c:if>
												<c:if test="${data.CPN_MST_SML_PRC == '' or data.CPN_MST_SML_PRC == 0}">-</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="pagination">
							<ui:frontpaging paging="${paging2 }" jsFunction="goPage" />
						</div>
						<!-- //pagination -->
					</div>
					</form>
				</div>

			</div>
			<!-- //sub_content -->
		</div>
	</div>
<script type="text/javascript">
	$(function() {
		
		$('.coupon_tab').eq("${commandMap.coupon_tab}").trigger('click');
		$('.coupon_tab').click(function() {
			$('#coupon_tab').val($(this).data('index'));
		})
		
		// 페이지 이동
	    goPage = function (cPage){
	        var $frm = $("#frm");
	        $frm.find("#cPage" + ($('#coupon_tab').val() * 1 + 1)).val(cPage);
	        $frm.attr({"action":"${serverDomain}/pc/mypage/myCouponUsableList.do", "target":"_self", "method":"get"}).submit();
	    };
		
		// 리스트 출력
		$('.price').each(function() {
			let price = $(this).text().trim();
			if(price != ''){
				$(this).text(numberFormat(price) + '원 이상');
			}
			console.log(price)
		})
		
		// 검색
		$('.inp_search').click(function() {
			$("#cPage" + ($('#coupon_tab').val() * 1 + 1)).val(1);
			$('#frm').attr('action', '/pc/mypage/myCouponUsableList.do').submit();
		})
		
		// 쿠폰 등록
		$('#register').click(function() {
			let idx = $('#CPN_PTN_SHP_NO').val().trim();
			if(idx == ''){
				alert("쿠폰 번호를 입력해주세요.");
				return;
			}
			$.ajax({
				url:'/pc/mypage/dwnCouponAjax.do'
				,data: 'CPN_PTN_SHP_NO=' + idx
				,dataType: 'json'
			}).done(function(data) {
				console.log(data.result);
				if(data.result == 'success'){
					alert(data.msg);
					location.reload();
				}else{
					alert(data.msg);					
				}
			}).fail(function() {
				alert('서버와의 통신 중 오류가 발생했습니다.')
			})
		})
	})

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
	
	$('#beginning, #finish').change(function() {
		$('.month_box').eq(0).find('input[type="radio"]').removeAttr('checked');
	})
	$('#beginning2, #finish2').change(function() {
		$('.month_box').eq(1).find('input[type="radio"]').removeAttr('checked');
	})
	
	Date.prototype.yyyymmdd = function() {
	    var yyyy = this.getFullYear().toString();
	    var mm = (this.getMonth() + 1).toString();
	    var dd = this.getDate().toString();
	    return  yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
	}

	
</script>
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>