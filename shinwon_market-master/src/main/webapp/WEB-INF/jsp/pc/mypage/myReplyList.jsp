<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">댓글 관리</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
			
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				
				<form id = "frm" name = "frm">
				<input type="hidden" name="cPage" id="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
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
								<input type="text" id="beginning" name = "startDt" class="inp_txt" title="조회 시작일 입력" value="${startDt}">
							</span>
							<span class="hyphen"> ~ </span>
							<span class="inline">
								<input type="text" id="finish" name = "endDt" class="inp_txt" title="조회 종료일 입력" value="${endDt}">
							</span>
							<button type="button" class="btn inp_search">
								<em class="blind">검색하기</em>
							</button>
						</span>
					</div>
				</div>
				<script>
				$(function(){
					$.fn.datePic();
				});
				</script>

				<div class="table_wrap mb95">
					<table class="tb_col">
						<caption>댓글 관리 정보 : 댓글, 등록일 출력 표입니다.</caption>
						<colgroup>
							<col>
							<col style="width:16%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">댓글</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty replyList }">
									<c:forEach var="reply" items="${replyList }" >
										<tr>
											<td class="left bb_none">
												<p class="tit_reply">${reply.OTD_RPL_CTS }</p>
											</td>
											<td rowspan="2"><ui:formatDate value="${reply.OTD_RPL_REG_DT}" pattern="yyyy-MM-dd"/>
											<br><ui:formatDate value="${reply.OTD_RPL_REG_DT}" pattern="HH:mm:ss"/>
										</tr>
										<tr>
											<td class="prod_link">
												<a href="/pc/ootd/ootdView.do?CNT_MST_IDX=${reply.CNT_OTD_ID}" target="_blank" class="btn_prod">
													<span class="pro_img"><img src="${cdnDomain}${reply.CMM_FLE_ATT_PATH}${reply.CMM_FLE_SYS_NM}" alt=""></span>
													<span class="pro_tit">${reply.CNT_MST_TITLE }</span>
												</a>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
										<tr class="no_data">
											<td colspan="4">
												<div class="box">
													<span class="txt">등록하신 댓글이 없습니다</span>
												</div>
											</td>
										</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
					<div class="pagination">
						<ui:frontpaging paging="${paging }" jsFunction="goPage" />
					</div>
					<!-- //pagination -->
	
					<div class="attention_list_wrap mt95">
						<strong class="tit">유의사항</strong>
						<ul>
							<li>댓글 수정, 삭제는 등록하신 OOTD 컨텐츠 페이지에서 하실 수 있습니다.</li>
						</ul>
					</div>
				</form>
			</div>
			<!-- //sub_content -->
		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
$(function(){
	
	goPage = function (cPage){
		var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myReplyList.do", "target":"_self", "method":"post"}).submit();
    };
	
	$('.inp_search').click(function() {
		var $frm = $("#frm");
		$("input[name='cPage']").val(1);
		$frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myReplyList.do", "target":"_self", "method":"post"}).submit();
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
	
	$('#beginning, #finish').change(function() {
		$('.month_box').eq(0).find('input[type="radio"]').removeAttr('checked');
	})
	
	Date.prototype.yyyymmdd = function() {
	    var yyyy = this.getFullYear().toString();
	    var mm = (this.getMonth() + 1).toString();
	    var dd = this.getDate().toString();
	    return  yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
	}

});

</script>




