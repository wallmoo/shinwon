<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">환불계좌 관리</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">

				<%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				<form name="frm", method="POST">
				<div class="table_wrap mb90">
					<p class="required_txt"><span>필수입력사항</span></p>
					<table class="tb_row">
						<caption>환불계좌 관리 : 은행명, 계좌번호, 예금주 입력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 은행명
								</th>
								<td>
									<span class="select">
										<select id="select1" class="w310">
											<option selected="selected">은행명 선택</option>
											<option></option>
											<option value="039">경남은행</option>
					                        <option value="034">광주은행</option>
					                        <option value="004">KB국민은행</option>
					                        <option value="003">IBK기업은행</option>
					                        <option value="011">NH농협</option>
					                        <option value="031">대구은행</option>
					                        <option value="032">부산은행</option>
					                        <option value="002">KDB산업은행</option>
					                        <option value="045">새마을금고</option>
					                        <option value="007">SH수협</option>
					                        <option value="088">신한은행</option>
					                        <option value="020">우리은행</option>
					                        <option value="071">우체국</option>
					                        <option value="037">전북은행</option>
					                        <option value="035">제주은행</option>
					                        <option value="090">카카오뱅크</option>
					                        <option value="089">케이뱅크</option>
					                        <option value="081">하나은행</option>
					                        <option value="027">한국씨티은행</option>
					                        <option value="054">HSBC은행</option>
					                        <option value="023">SC제일은행</option>
										</select>
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 계좌번호
								</th>
								<td>
									<input type="text" name="" placeholder="하이픈(-)없이 입력" class="w100p" value="${myRefundAccountMap.MEM_MST_RFD_ACT	 }">
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 예금주
								</th>
								<td>
									<input type="text" name="" placeholder="이름 입력" class="w100p" value="${myRefundAccountMap.MEM_MST_RFD_HDR }">
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 데이터 출력 테스트
								</th>
								<td>
									commandMap : ${commandMap }<br><br>
									summaryMap : ${summaryMap }<br><br>
									myRefundAccountMap : ${myRefundAccountMap }<br><br>
									myRefundAccountUpdateMap : ${myRefundAccountUpdateMap }<br><br>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn_wrap">
					<!-- <button type="button" class="btn_large">취소</button> -->
					<button type="button" id="save" class="btn_large ok">저장</button>
				</div>
			</form>
			</div>
			<!-- //sub_content -->



		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
//저장 버튼 클릭 이벤트
$(document).on("click", "#save", function () {
    $("#frm").attr({"action":"<c:out value="${serverDomain}" />/pc/mypage/myRefundAccountListUpdate.do", "target":"_self", "method":"post"}).submit();
});
</script>