<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

	<div class="modal">
		<!-- modal -->

		<div class="modal-wrapper">
			<!-- modal-wrapper -->

			<div class="modal-inner">
				<!-- modal-inner -->

				<h2 class="title">
					<span>OOTD</span>
				</h2>


				<div class="tab-list">
					<!-- tab -->
					<ul>
						<c:choose>
							<c:when test="${memberInfo.MEM_MST_LEV_YN eq 'N' }">
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberPopup.do') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">회원정보</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberOrderPopup.do') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberOrderPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">주문내역</a>
								</li>
								<li
									class="">active</c:if>
					">
									<a
									href="#">쿠폰</a>
								</li>
								<li
									class="">active</c:if>
					">
									<a
									href="#">포인트</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberEventPopup.do') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberEventPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">이벤트</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberReviewPopup.do') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberReviewPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">상품후기</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberQna') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberQnaPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">상품Q&A</a>
								</li>
								<li
									class="
					<c:if test="${fn:indexOf(requestUrl,'/am/member/infoMemberInq') > -1}">active</c:if>
					">
									<a
									href="<c:out value="${serverDomain}" />/am/member/infoMemberInqPopup.do?MEM_MST_MEM_ID=<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>">1:1 고객문의</a>
								</li>
								<li
									class="">active</c:if>
					">
									<a
									href="#">셀러문의</a>
								</li>
								<li
									class="">active</c:if>
					">
									<a
									href="#">장바구니</a>
								</li>
								<li
									class="">active</c:if>
					">
									<a
									href="#">OOTD</a>
								</li>
								<li
									class="">active</c:if>
					">
									<a
									href="#">댓글</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<!-- // tab -->

				<table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;">
                        <col style="width: auto;">
                        <col style="width: 10%;">
                        <col style="width: auto;">
                        <col style="width: 10%;">
                        <col style="width: auto;">
                        <col style="width: 10%;">
                        <col style="width: auto;">
                        </colgroup>
                    <tbody>
                        <tr>
                            <th><span>아이디(이름)</span></th>
                            <td>
                                Never11(홍길동)
                            </td>
                            <th><span>닉네임</span></th>
                            <td>
                                헨젤과그랬데
                            </td>
                            <th><span>프로필사진</span></th>
                            <td>
                                <p class="profile_img"><img src="profile.jpg" alt=""></p>
                            </td>
                            <th><span>회원가입 유형</span></th>
                            <td>
                                일반회원
                            </td>
                        </tr>
                    </tbody>
                </table>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="" />
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="MEM_MST_MEM_ID" value="ttearless01"/>

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>등록일자</span></th>
                                <td colspan="7">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchStartDate" id="searchStartDate" class="text" value="2019-12-18" readonly="readonly" data-target-end="#searchEndDate"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="2020-01-17" readonly="readonly" data-target-start="#searchStartDate"/>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>제목</span></th>
                                <td>
                                    <input type="text" name="searchBrdInqContents" id="searchBrdInqContents" class="text large" value="">
                                </td>
                            </tr>
                            <tr>
                                <th><span>상태</span></th>
                                <td colspan="4">
                                    <input type="radio" name="searchBrdInqReplyCd" id="stateA" class="radio" value="" checked="checked"/>
                                    <label for="stateA">전체</label>
                                    <input type="radio" name="searchBrdInqReplyCd" id="stateB" class="radio" value="N"/>
                                    <label for="stateB">사용</label>
                                    <input type="radio" name="searchBrdInqReplyCd" id="stateC" class="radio" value="Y" />
                                    <label for="stateC">미사용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                </form>
                <div class="grid section-button-search">
                    <a href="javascript:searchClear('searchForm');"class="button small"><span>검색 조건 초기화</span></a>
                    <a href="javascript:goSearch();" class="button small primary datepicker"><span>검색</span></a>
                </div>

                <form id="frm" name="frm">

                    <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                        <div class="col-1-2 text-left">
                            <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                            <span class="pages">
                                (총 <strong class="em">1</strong>건, 1 of 1 page)
                            </span>
                        </div>

                        <div class="col-1-2 text-right">
                            <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // 목록 상단 버튼 -->

                   <table cellspacing="0" class="table-col table-b"><!-- table -->
                       <colgroup>
                           <col style="width: 5%;" />
                           <col style="width: auto;" />
                           <col style="width: 10%;" />
                           <col style="width: 10%" />
                           <col style="width: 10%;" />
                       </colgroup>
                       <thead>
                           <tr>
                               <th>번호</th>
                               <th>제목</th>
                               <th>등록일</th>
                               <th>댓글수</th>
                               <th>상태</th>
                           </tr>
                       </thead>
                        <tbody id="list-field">
                            <tr>
                                <td>1</td>
                                <td class="text-left"><span class="thumbnail_img"><img src="profile.jpg"></span> <a href="">오랜만에 OOTD(feat.여행가는 날)</a></td>
                                <td>2019-12-02 09:05:22</td>
                                <td>200</td>
                                <td>사용</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td class="text-left"><span class="thumbnail_img"><img src="profile.jpg"></span> <a href="">심플 브이넥 스트라이프 자켓 내 스타일이 완성시켜주는 나만의 스타일</a></td>
                                <td>2019-12-02 09:05:22</td>
                                <td>150</td>
                                <td>미사용</td>
                            </tr>
                        </tbody>
                   </table>

                   <input type="hidden" name="cPage" value=""/>
                   <input type="hidden" name="searchStartDate" value="2019-12-18"/>
                   <input type="hidden" name="searchEndDate" value="2020-01-17"/>
                   <input type="hidden" name="searchPrdMstCd" value=""/>
                   <input type="hidden" name="searchPrdMstNm" value=""/>
                   <input type="hidden" name="searchBrdInqContents" value=""/>
                   <input type="hidden" name="searchBrdInqReplyCd" value=""/>
                   <input type="hidden" name="MEM_MST_MEM_ID" value="ttearless01"/>
                   <input type="hidden" name="BRD_INQ_IDX" value=""/>

                   <div class="section-pagination"><!-- section pagination -->
                       <h4 class="sr-only">목록 페이징</h4>
                       <div class="wrap">
                           <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1</span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
                        </div>
                   </div><!-- // section pagination -->

               </form>


			</div>
			<!-- //modal-inner -->

		</div>
		<!-- //modal-wrapper -->

	</div>
	<!-- //modal -->

	<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
	<script
		src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

	<script>
		//<![CDATA[
		$(function() {

		});
		//]]>
	</script>
</body>
</html>
