<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">재입고 알림</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				<form name="frm" id="frm"		>
					<input type="hidden" name="cPage" value="1"/>  
                    
				<div class="table_wrap mb95">
					<table class="tb_col">
						<caption>재입고 알림 : 상품정보, 판매가, 신청일, 발송일, 알림현황, 선택 출력 표입니다.</caption>
						<colgroup>
							<col>
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:12%;">
							<col style="width:13%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품정보</th>
								<th scope="col">판매가</th>
								<th scope="col">신청일</th>
								<th scope="col">발송일</th>
								<th scope="col">알림현황</th>
								<th scope="col">선택</th>
							</tr>
						</thead>
						<tbody>
									<c:choose>
										<c:when test="${not empty restockNotificationList }">
											<c:forEach var="data" items="${restockNotificationList }" varStatus="status">
						
							<tr>
								<td class="left">
									<div class="product_info clearboth">
										<div class="img">
											<a href="<c:out value="${frontDomain }"/>/pc/product/productView.do?PRD_CTG_IDX=<c:out value="${data.MEM_RIP_CTG_IDX }" />&PRD_MST_CD=<c:out value="${data.PRD_MST_CD }" />" class="product_thumb">
												<img src="<c:out value="${data.PRD_MST_REF_IMG_URL }"/>" alt="제품 이미지">
											</a>
										</div>
										<div class="txt">
											<span class="brand"><c:out value="${data.VDR_MST_NM }"/></span>
											<a href="#" class="item_name"><c:out value="${data.PRD_MST_NM }"/></a>
										</div>
									</div>
								</td>
								<td><c:out value="${data.PRD_MST_PRC }"/></td>
								<td><c:out value="${data.MEM_RIP_REQ_DT }"/></td>
								<td><c:out value="${data.MEM_RIP_PUS_DT }"/></td>
								<td><c:out value="${data.MEM_RIP_PRD_STS }"/></td>
								<td>
									<button type="button" class="btn_delete" onclick="javascript:goReDelInput('<c:out value="${data.PRD_MST_CD }" />');">삭제</button>
								</td>
							</tr>
											</c:forEach>
										</c:when>
									</c:choose>							
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<ui:frontpaging paging="${paging }" jsFunction="goPage" />
				</div>
             </form>
				<!-- //pagination -->

				<div class="attention_list_wrap mt47">
					<ul>
						<li>신청 후 30일 내에 상품이 재입고되면 1회 알림이 발송됩니다.</li>
						<li>소량 입고되거나 동시 구매가 이루어질 경우 등 알림 후에도 품절이 발생할 수 있습니다.</li>
						<li>알림 신청 시의 상품 옵션 및 가격 등의 상품정보가 재입고 시 변동될 수 있습니다.</li>
						<li>알림 신청 후 30일이 지난 상품, 판매 종료된 상품은 알림이 불가능합니다.</li>
						<li>알림 내역에서 알림 삭제 시, 알림 신청이 취소됩니다.</li>
						<li>회원정보에 등록된 휴대폰 번호로 카카오 알림톡으로 안내드리며(혹은 SMS문자), 변경 희망 시 회원정보 수정 필요합니다.</li>
					</ul>
				</div>

			</div>
			<!-- //sub_content -->



		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>



<script>
//페이지 이동
goPage = function (cPage){
	$frm.find("input[name='cPage']").val(cPage);
    $frm.attr({"action":"<c:out value="${serverSslDomain}"/>/pc/mypage/restockNotificationList.do", "target":"_self", "method":"get"}).submit();
};


//재입고알림삭제
goReDelInput = function(prdCd){
	
	$.ajax({
			type: "get",
			url: "<c:out value="${serverDomain}"/>/pc/mypage/myPageReInputDelAjax.do",
			data: {"PRD_MST_CD": prdCd},
			async: false,
			success: function(data)
			{
				if(data.result == "success" )
				{
					document.location.reload(true);
				}
			},
			error : function (err)
			{
		      	alert("오류가 발생하였습니다.\n[" + err.status + "]");
			}
		});		
};
</script>