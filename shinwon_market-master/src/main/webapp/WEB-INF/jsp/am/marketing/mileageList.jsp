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
                <a href="#none">마케팅 관리</a>
                &gt;
                <a href="#none">포인트내역조회</a>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">포인트내역조회</h3>

                <div class="title-box">
                    <h4 class="title">검색</h4>

                    
                </div>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
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
	                                <a href="javascript:fnDateSet('searchMileageEdDt', 'searchMileageStDt', 0, 0, 0, 0, -2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a>
	                            </div>
							</div>
                        </div>
 	                    <div class="form-group">                
							<div class="col">
	                            <label class="label"><span>회원아이디<em class="strong">*</em></span></label>
	                               <input type="text" name="searchMemMstMemId" id="searchMemMstMemId" class="text middle" value="<c:out value="${commandMap.searchMemMstMemId }"/>">
							</div>
                        </div>
 	                    
                        <div class="form-group">       
							<div class="col">
	                            <label class="label"><span>포인트 구분/내역</span></label>
	                            <div class="field">
			                       	<select id="searchMlgUseGb" name="searchMlgUseGb" class="select" title="포인트 구분">
										<option value="" <c:if test="${commandMap.searchMlgUseGb eq ''}">selected="selected"</c:if>>전체</option>
										<option value="A" <c:if test="${commandMap.searchMlgUseGb eq 'A'}">selected="selected"</c:if>>적립</option>
										<option value="C" <c:if test="${commandMap.searchMlgUseGb eq 'C'}">selected="selected"</c:if>>사용취소</option>
										<option value="D" <c:if test="${commandMap.searchMlgUseGb eq 'D'}">selected="selected"</c:if>>소멸</option>
										<option value="J" <c:if test="${commandMap.searchMlgUseGb eq 'J'}">selected="selected"</c:if>>적립취소</option>
										<option value="U" <c:if test="${commandMap.searchMlgUseGb eq 'U'}">selected="selected"</c:if>>사용</option> 
	 									 
						           </select>
						          	<select id="searchMlgKndGb" name="searchMlgKndGb" class="select" title="포인트 내역">
										<option value="" <c:if test="${commandMap.searchMlgKndGb eq ''}">selected="selected"</c:if>>전체</option>
									 	<option value="00" <c:if test="${commandMap.searchMlgKndGb eq '00'}">selected="selected"</c:if>>포인트 사용</option>
										<option value="01" <c:if test="${commandMap.searchMlgKndGb eq '01'}">selected="selected"</c:if>>일반적립</option>
										<option value="02" <c:if test="${commandMap.searchMlgKndGb eq '02'}">selected="selected"</c:if>>기념일_본인생일</option>
										<option value="03" <c:if test="${commandMap.searchMlgKndGb eq '03'}">selected="selected"</c:if>>특별행사</option>
										<option value="04" <c:if test="${commandMap.searchMlgKndGb eq '04'}">selected="selected"</c:if>>특별행사(쇼핑몰)</option>
										<option value="05" <c:if test="${commandMap.searchMlgKndGb eq '05'}">selected="selected"</c:if>>재구매고객</option>
										<option value="06" <c:if test="${commandMap.searchMlgKndGb eq '06'}">selected="selected"</c:if>>연계고객</option>
										<option value="07" <c:if test="${commandMap.searchMlgKndGb eq '07'}">selected="selected"</c:if>>신규구매</option>
										<option value="08" <c:if test="${commandMap.searchMlgKndGb eq '08'}">selected="selected"</c:if>>이관포인트</option>
										<option value="09" <c:if test="${commandMap.searchMlgKndGb eq '09'}">selected="selected"</c:if>>회원사용소감</option>
										<option value="10" <c:if test="${commandMap.searchMlgKndGb eq '10'}">selected="selected"</c:if>>서비스입금포인트</option>
										<option value="11" <c:if test="${commandMap.searchMlgKndGb eq '11'}">selected="selected"</c:if>>연회비포인트</option>
										<option value="12" <c:if test="${commandMap.searchMlgKndGb eq '12'}">selected="selected"</c:if>>추천고객매출 1%</option>
										<option value="13" <c:if test="${commandMap.searchMlgKndGb eq '13'}">selected="selected"</c:if>>포인트 부정적립건</option>
										<option value="14" <c:if test="${commandMap.searchMlgKndGb eq '14'}">selected="selected"</c:if>>포인트 당첨적립</option>
										<option value="15" <c:if test="${commandMap.searchMlgKndGb eq '15'}">selected="selected"</c:if>>특별적립(G)</option>
										<option value="16" <c:if test="${commandMap.searchMlgKndGb eq '16'}">selected="selected"</c:if>>에누리쿠폰</option>
										<option value="17" <c:if test="${commandMap.searchMlgKndGb eq '17'}">selected="selected"</c:if>>소멸</option>
										<option value="18" <c:if test="${commandMap.searchMlgKndGb eq '18'}">selected="selected"</c:if>>재적립</option>
										<option value="19" <c:if test="${commandMap.searchMlgKndGb eq '19'}">selected="selected"</c:if>>방문포인트</option>
										<option value="20" <c:if test="${commandMap.searchMlgKndGb eq '20'}">selected="selected"</c:if>>기념일_배우자생일</option>
										<option value="21" <c:if test="${commandMap.searchMlgKndGb eq '21'}">selected="selected"</c:if>>기념일_결혼기념일</option>
										<option value="22" <c:if test="${commandMap.searchMlgKndGb eq '22'}">selected="selected"</c:if>>기념일_자녀생일1</option>
										<option value="23" <c:if test="${commandMap.searchMlgKndGb eq '23'}">selected="selected"</c:if>>기념일_자녀생일2</option>
										<option value="24" <c:if test="${commandMap.searchMlgKndGb eq '24'}">selected="selected"</c:if>>누락포인트</option>
										<option value="25" <c:if test="${commandMap.searchMlgKndGb eq '25'}">selected="selected"</c:if>>금액승급</option>
										<option value="26" <c:if test="${commandMap.searchMlgKndGb eq '26'}">selected="selected"</c:if>>고객추천 감사 5000크라운 적립</option>
										<option value="27" <c:if test="${commandMap.searchMlgKndGb eq '27'}">selected="selected"</c:if>>신규고객</option>
										<option value="28" <c:if test="${commandMap.searchMlgKndGb eq '28'}">selected="selected"</c:if>>크라운충전</option>
										<option value="29" <c:if test="${commandMap.searchMlgKndGb eq '29'}">selected="selected"</c:if>>홍보대사(본인구매)</option>
										<option value="30" <c:if test="${commandMap.searchMlgKndGb eq '30'}">selected="selected"</c:if>>홍보대사(추천고객구매)</option>
										<option value="31" <c:if test="${commandMap.searchMlgKndGb eq '31'}">selected="selected"</c:if>>홍보대사추천고객(인증일7일이전구매)</option>
										<option value="32" <c:if test="${commandMap.searchMlgKndGb eq '32'}">selected="selected"</c:if>>포인트정리(정보전략)</option>
										<option value="33" <c:if test="${commandMap.searchMlgKndGb eq '33'}">selected="selected"</c:if>>고객탈퇴</option>
										<option value="34" <c:if test="${commandMap.searchMlgKndGb eq '34'}">selected="selected"</c:if>>크라운전환(쇼핑몰)</option>
						           </select>
			                    </div>
							</div>
                        </div>
	                       
                    </form>
                </div><!-- // section-form-a -->
				<div class="section-button search">
                	<a href="#none" id="search" class="button button-b submit"><span>검색</span></a>
                    <a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                </div>

                <h4 class="title">목록</h4>
                <div class="right">
                    <a href="#none" id="goForm" class="button button-b"><span>포인트 적립/차감</span></a>
                    <a href="javascript:goExcelDown()" id="goExcel" class="button button-b"><span>엑셀다운로드</span></a>
                </div>
                </div>
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 15%;" />
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: 15%;" />
                            <col style="width: 15%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>이름</th>
                                <th>구분</th>
                                <th>지점구분</th>
                                <th>유형</th>
                                <th>내역</th>
                                <th>포인트</th>
                                <th>잔여포인트</th>                                
                                <th>적립/차감/소멸일시</th>
                                <th>주문번호</th>
                            </tr>
                        </thead>
                        <tbody id="list-field">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td><c:out value="${listNum }"/></td>
			                                <td><c:out value="${row.MEM_MST_MEM_NM }"/>(<c:out value="${row.MEM_MST_MEM_ID }"/>)</td>
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
		                               			<c:choose>
		                               				<c:when test="${row.MLG_SHP_GB eq 'ON'}">온라인</c:when>
		                               				<c:when test="${row.MLG_SHP_GB eq 'OFF'}">매장</c:when>
		                               			</c:choose>
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
		                               			<fmt:formatNumber value="${row.MLG_ERP_MLG}" type="number"/>
 		                               		</td>
		                               		<td>
		                               			<fmt:formatNumber value="${row.MLG_CUR_MLG}" type="number"/>
		                               		</td>
		                               		<td>
		                               			<ui:formatDate value="${row.MLG_ERP_DT }" pattern="yyyy-MM-dd"/>
		                               		</td>
		                               		<td>
		                               			<c:out value="${row.MLG_ORDER_CD }"/>
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

                <div class="pagination"><!-- pagination -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->

                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchMileageStDt" value="<c:out value="${commandMap.searchMileageStDt }"/>"/>
                    <input type="hidden" name="searchMileageEdDt" value="<c:out value="${commandMap.searchMileageEdDt }"/>"/>
                    <input type="hidden" name="searchMemMstMemId" value="<c:out value="${commandMap.searchMemMstMemId }"/>"/>
                    <input type="hidden" name="searchMlgUseGb" value="<c:out value="${commandMap.searchMlgUseGb }"/>"/>
                    <input type="hidden" name="searchMlgKndGb" value="<c:out value="${commandMap.searchMlgKndGb }"/>"/>
	                <div class="bbs-status"><!-- bbs status -->
                        <div class="page">
                            총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
                        </div>
	                    <div class="sort">
	                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                    </div>
	                </div>
                </form>

            </div><!-- // contents-inner -->

        </section><!-- // contents -->

    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    
   
    // 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/mileageForm.do", "target":"_self", "method":"post"}).submit();
    });
    
   
    // 검색 엔터 이벤트 
    $(document).on("keydown", "#searchWord", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        if($("#searchMemMstMemId").val() == "")
    	{
    		alert("회원아이디를 입력해 주십시오.");
            $("#searchMemMstMemId").focus();
            return;	
    	}
      	
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
	    $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/mileageList.do", "target":"_self", "method":"post"}).submit();
      
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/mileageList.do", "target":"_self", "method":"post"}).submit();
    };
    goExcelDown = function () 
    {
    	if("${paging.totalRecordCount}" > 10000){
    		alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
    		return;
    	}else if("${paging.totalRecordCount}" == 0){
    		alert("저장할 내역이 없습니다.");
    		return;
    	}
    	
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/marketing/mileageListExcel.do", "target":"_self", "method":"post"}).submit();
    };
    
});
</script>
</body>
</html>