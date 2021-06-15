<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title"><c:out value="${memberInfo.MEM_MST_MEM_ID }" />(<c:out value="${memberInfo.MEM_MST_MEM_NM }" />)님의 포인트<c:if test="${memberInfo.MEM_MST_LEV_YN ne 'N' }"> - <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,0,4)}"/>년 <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,4,6)}"/>월 <c:out value="${fn:substring(memberInfo.MEM_MST_LEV_DT,6,8)}"/>일 <c:out value="${memberInfo.MEM_MST_LEV_YN eq 'Y' ? '탈퇴한' : '직권 탈퇴된' }"/> 회원 입니다</c:if></h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

	<div id="contents"><!-- contents -->

		<%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>
		
		<div class="table-a"><!-- col list -->
			<table class="core">
            	<colgroup>
                	<col style="width: 25%;" />
                    <col style="width: 25%;" />
                    <col style="width: 25%;" />
                    <col style="width: 25%;" />
                </colgroup>
            	<tbody>
                	<tr>
                    	<td rowspan="2">가용포인트</td>
                        <td rowspan="2">
                        	<c:if test="${empty mileageSum.SOLUBLE_MILEAGE }">0</c:if>
                        	<c:if test="${not empty mileageSum.SOLUBLE_MILEAGE }"><fmt:formatNumber value="${mileageSum.SOLUBLE_MILEAGE}" type="number"/></c:if>
                        </td>
                        <td>총 적립 포인트</td>
                        <td>
                        	<c:if test="${empty mileageSum.TOTAL_MILEAGE }">0</c:if>
                        	<c:if test="${not empty mileageSum.TOTAL_MILEAGE }"><fmt:formatNumber value="${mileageSum.TOTAL_MILEAGE}" type="number"/></c:if>
                        </td>
                    </tr>
                    <tr>
                    	<td>총 사용 포인트</td>
                        <td>
                        	<c:if test="${empty mileageSum.USE_MILEAGE }">0</c:if>
                        	<c:if test="${not empty mileageSum.USE_MILEAGE }"><fmt:formatNumber value="${mileageSum.USE_MILEAGE}" type="number"/></c:if>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
		
		<div class="title-box">
			<h4 class="title">검색</h4>
		</div>

		<div class="section-form"><!-- section-form-a -->

        <form id="searchForm" name="searchForm">
            <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />        
            <input type="hidden" name="searchYn" value="Y" />
            <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
            
			<div class="form-group">                    
				<div class="col">
	            	<label class="label"><span>기간검색</span></label>
	                <div class="field">
	                	<input type="text" name="searchMileageStDt" id="searchMileageStDt" class="text datepicker s-datepicker" value="<c:out value="${commandMap.searchMileageStDt }"/>"/> ~
	                    <input type="text" name="searchMileageEdDt" id="searchMileageEdDt" class="text datepicker e-datepicker" value="<c:out value="${commandMap.searchMileageEdDt }"/>"/>
	                    	<a href="javascript:fnDateSet('searchMileageEdDt', 'searchMileageStDt', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
	                        <a href="javascript:fnDateSet('searchMileageEdDt', 'searchMileageStDt', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                        <a href="javascript:fnDateSet('searchMileageEdDt', 'searchMileageStDt', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
	                        <a href="javascript:fnDateSet('searchMileageEdDt', 'searchMileageStDt', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                </div>
				</div>
            </div>
			
			<div class="form-group">
				<div class="col">
					<label class="label"><span>주문번호</span></label>
					<div class="field">
						<input type="text" class="text" name="searchMlgOrdNo" value="<c:out value="${commandMap.searchMlgOrdNo}"/>"/> 
					</div>
				</div>					
			</div>
			
			<div class="form-group">
				<div class="col">
					<label class="label"><span>구분</span></label>
					<div class="field">
						<select id="searchMlgUseGb" name="searchMlgUseGb" class="select" title="포인트 구분">
							<option value="" <c:if test="${commandMap.searchMlgUseGb eq ''}">selected="selected"</c:if>>전체</option>
							<option value="A" <c:if test="${commandMap.searchMlgUseGb eq 'A'}">selected="selected"</c:if>>적립</option>
							<option value="C" <c:if test="${commandMap.searchMlgUseGb eq 'C'}">selected="selected"</c:if>>사용취소</option>
							<option value="D" <c:if test="${commandMap.searchMlgUseGb eq 'D'}">selected="selected"</c:if>>소멸</option>
							<option value="J" <c:if test="${commandMap.searchMlgUseGb eq 'J'}">selected="selected"</c:if>>적립취소</option>
							<option value="U" <c:if test="${commandMap.searchMlgUseGb eq 'U'}">selected="selected"</c:if>>사용</option> 
	 					</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col">
					<label class="label"><span>내역</span></label>
					<div class="field">
						<input type="text" class="text" name="searchMlgMlgCts" value="<c:out value="${commandMap.searchMlgMlgCts}"/>"/> 
					</div>
				</div>					
			</div>
					
		</form>

		</div><!-- // section-form-a -->
		
		<div class="section-button search">
			<a href="javascript:search();" class="button button-b"><span>검색</span></a>
			<a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
		</div>

		<div class="title-box">
			<h4 class="title">목록</h4>
		</div>

		<form id="frm" name="frm">
			<div class="table-a"><!-- col list -->
				<table class="core">
            		<colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>지점구분</th>
                                <th>구분</th>
                                <th>적립/차감/소멸일시</th>
                                <th>유형</th>
                                <th>내역</th>
                                <th>주문번호</th>
                                <th>포인트</th>
                                <th>잔여포인트</th>     
                            </tr>
                        </thead>
                        <tbody id="list-field">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td><c:out value="${listNum }"/></td>
			                                <td>
		                               			<c:choose>
		                               				<c:when test="${row.MLG_SHP_GB eq 'ON'}">온라인</c:when>
		                               				<c:when test="${row.MLG_SHP_GB eq 'OFF'}">매장</c:when>
		                               			</c:choose>
		                               		</td>
		                               		<td>
		                               			<c:choose>
		                               				<c:when test="${row.MLG_USE_GB eq 'A'}">적립</c:when>
		                               				<c:when test="${row.MLG_USE_GB eq 'C'}">사용취소</c:when>
		                               				<c:when test="${row.MLG_USE_GB eq 'D'}">소멸</c:when>
		                               				<c:when test="${row.MLG_USE_GB eq 'J'}">적립취소</c:when>
		                               				<c:when test="${row.MLG_USE_GB eq 'U'}">사용</c:when>
		                               			</c:choose>
		                               		</td>
		                               		<td>
		                               			<ui:formatDate value="${row.MLG_ERP_DT }" pattern="yyyy-MM-dd"/>
		                               		</td>
		                               		<td>
		                               			<c:choose>
		                               				<c:when test="${row.MLG_KND_GB eq '00'}">포인트 사용</c:when>
													<c:when test="${row.MLG_KND_GB eq '01'}">일반적립</c:when>
													<c:when test="${row.MLG_KND_GB eq '02'}">기념일_본인생일</c:when>
													<c:when test="${row.MLG_KND_GB eq '03'}">특별행사</c:when>
													<c:when test="${row.MLG_KND_GB eq '04'}">특별행사(쇼핑몰)</c:when>
													<c:when test="${row.MLG_KND_GB eq '05'}">재구매고객</c:when>
													<c:when test="${row.MLG_KND_GB eq '06'}">연계고객</c:when>
													<c:when test="${row.MLG_KND_GB eq '07'}">신규구매</c:when>
													<c:when test="${row.MLG_KND_GB eq '08'}">이관포인트</c:when>
													<c:when test="${row.MLG_KND_GB eq '09'}">회원사용소감</c:when>
													<c:when test="${row.MLG_KND_GB eq '10'}">서비스입금포인트</c:when>
													<c:when test="${row.MLG_KND_GB eq '11'}">연회비포인트</c:when>
													<c:when test="${row.MLG_KND_GB eq '12'}">추천고객매출 1%</c:when>
													<c:when test="${row.MLG_KND_GB eq '13'}">포인트 부정적립건</c:when>
													<c:when test="${row.MLG_KND_GB eq '14'}">포인트 당첨적립</c:when>
													<c:when test="${row.MLG_KND_GB eq '15'}">특별적립(G)</c:when>
													<c:when test="${row.MLG_KND_GB eq '16'}">에누리쿠폰</c:when>
													<c:when test="${row.MLG_KND_GB eq '17'}">소멸</c:when>
													<c:when test="${row.MLG_KND_GB eq '18'}">재적립</c:when>
													<c:when test="${row.MLG_KND_GB eq '19'}">방문포인트</c:when>
													<c:when test="${row.MLG_KND_GB eq '20'}">기념일_배우자생일</c:when>
													<c:when test="${row.MLG_KND_GB eq '21'}">기념일_결혼기념일</c:when>
													<c:when test="${row.MLG_KND_GB eq '22'}">기념일_자녀생일1</c:when>
													<c:when test="${row.MLG_KND_GB eq '23'}">기념일_자녀생일2</c:when>
													<c:when test="${row.MLG_KND_GB eq '24'}">누락포인트</c:when>
													<c:when test="${row.MLG_KND_GB eq '25'}">금액승급</c:when>
													<c:when test="${row.MLG_KND_GB eq '26'}">고객추천 감사 5000크라운 적립</c:when>
													<c:when test="${row.MLG_KND_GB eq '27'}">신규고객</c:when>
													<c:when test="${row.MLG_KND_GB eq '28'}">크라운충전</c:when>
													<c:when test="${row.MLG_KND_GB eq '29'}">홍보대사(본인구매)</c:when>
													<c:when test="${row.MLG_KND_GB eq '30'}">홍보대사(추천고객구매)</c:when>
													<c:when test="${row.MLG_KND_GB eq '31'}">홍보대사추천고객(인증일7일이전구매)</c:when>
													<c:when test="${row.MLG_KND_GB eq '32'}">포인트정리(정보전략)</c:when>
													<c:when test="${row.MLG_KND_GB eq '33'}">고객탈퇴</c:when>
													<c:when test="${row.MLG_KND_GB eq '34'}">크라운전환(쇼핑몰)</c:when>
		                               			</c:choose>
		                               		</td>
		                               		<td>
		                               			<c:out value="${row.MLG_MLG_CTS }"/>
		                               		</td>
		                               		<td>
		                               			<p><a href="javascript:goOrderView('<c:out value="${row.MLG_ORDER_CD }" />');" title="새 창 으로 열립니다."><c:out value="${row.MLG_ORDER_CD}"/></a></p>
		                               		</td>
		                               		<td>
		                               			<fmt:formatNumber value="${row.MLG_ERP_MLG}" type="number"/>
 		                               		</td>
		                               		<td>
		                               			<fmt:formatNumber value="${row.MLG_CUR_MLG}" type="number"/>
		                               		</td>
		                               		
                                        <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
			</div><!-- // col list -->
		
	        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	        <input type="hidden" name="searchMileageStDt" value="<c:out value="${commandMap.searchMileageStDt }"/>"/>
	        <input type="hidden" name="searchMileageEdDt" value="<c:out value="${commandMap.searchMileageEdDt }"/>"/>
	        <input type="hidden" name="searchMlgOrdNo" value="<c:out value="${commandMap.searchMlgOrdNo }"/>"/>
	        <input type="hidden" name="searchMlgUseGb" value="<c:out value="${commandMap.searchMlgUseGb }"/>"/>
	        <input type="hidden" name="searchMlgMlgCts" value="<c:out value="${commandMap.searchMlgMlgCts }"/>"/>
	  		<input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>		
		
		<div class="pagination"><!-- pagination -->
			<ui:paging paging="${paging}" jsFunction="goPage" />
        </div><!-- // pagination -->

		<div class="bbs-status"><!-- bbs status -->
			<div class="sort">
				<ui:pageSizeBox value="${paging.pageSize}" name="pageSize" type="" jsFunction="goPage"/>
			</div>
			<div class="page">
				총 <strong class="em">${paging.totalRecordCount}</strong>건, ${paging.cPage} of ${paging.totalPageCount} page
			</div>
		</div><!-- // bbs status -->
		
		</form>
	
	</div><!-- // contents -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
//<![CDATA[
$(document).ready(function () 
{
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoMemberMileagePopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () 
    {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoMemberMileagePopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 주문정보 상세 팝업페이지 호출
    goOrderView = function (ordMstCd)
    {
    	goOrderViewPopup("<c:out value="${serverDomain}"/>", ordMstCd);
    };

    // 배송조회 팝업페이지 호출
    goDeliveryView = function (url)
    {
    	//goSearchDelivery(url);
        popup(url, "550", "700", "yes", "deliveryView");
    };
});      
//]]>
</script>
</body>
</html>
