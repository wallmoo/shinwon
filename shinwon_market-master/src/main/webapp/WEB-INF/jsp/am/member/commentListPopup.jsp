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
						<span>댓글</span>
					</h2>
					
					
	                <c:choose>
	                    <c:when test="${memberInfo.MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE }">
	                        <%@ include file="/WEB-INF/jsp/am/member/infoCompMemberTabInc.jsp" %>           
	                    </c:when>
	                    <c:otherwise>
	                        <%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>
	                    </c:otherwise>
	                </c:choose>
	
					<div class="tab-a justified" style="margin-top: 20px;"><!-- tab -->
	             <ul class="tab">
	                 <!--  
	                 <li class="${(empty commandMap.searchTab || commandMap.searchTab eq 'warning') ? ' active' : ''}"><a href="<c:out value="${serverDomain}" />/am/member/changeDetailListPopup.do?searchTab=warning&MEM_MST_MEM_ID=${commandMap.MEM_MST_MEM_ID}"><span>경고 내역</span></a></li>
	                 <li class="${commandMap.searchTab eq 'stopAndClear' ? ' active' : ''}"><a href="<c:out value="${serverDomain}" />/am/member/changeDetailListPopup.do?searchTab=stopAndClear&MEM_MST_MEM_ID=${commandMap.MEM_MST_MEM_ID}"><span>정지/해제 내역</span></a></li>
	                 -->
	             </ul>
	        </div><!-- // tab -->

                <%@ include file="/WEB-INF/jsp/am/member/infoSummary.jsp" %>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="" />
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>

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
                                    <input type="text" name="searchStartDate" id="searchStartDate" class="text" value="<c:out value="${commandMap.searchStartDate }"/>" readonly="readonly" data-target-end="#searchEndDate"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="searchEndDate" id="searchEndDate" class="text" value="<c:out value="${commandMap.searchEndDate }"/>" readonly="readonly" data-target-start="#searchStartDate"/>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>키워드 검색</span></th>
                                <td>
                                    <select class="select" name='searchCommentType' id='searchCommentType'  >
                                        <option value=''   >전체         </option>
                                        <option value='TIT'>OOTD 제목</option>
                                        <option value='RPL'>댓글        </option>
                                    </select>
                                    <input type="text" class="text large"  name='searchContent' id='searchContent' value="<c:out value="${commandMap.searchContent }"/>"  >
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
                            <col style="width: 10%;" />
                            <col style="width: 55px;" />
                            <col style="width: auto;" />
                            <col style="width: 20%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th colspan='2' >댓글</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody id="list-field">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                    
										<tr>
											<td rowspan="2"><c:out value="${row.RNUM}"/></td>
                                            <td rowspan="2"><span class="thumbnail_img"><img src="${cdnDomain}${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="${row.CMN_FLE_ALT_TXT}" style="border:1px solid #ccc;width:50px;height:50px;"></span> </td>											
											<td class="text-left"><c:out value="${row.OTD_RPL_CTS}"/></td>
											<td rowspan="2"><ui:formatDate value="${row.OTD_RPL_REG_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
										</tr>
										<tr>
											<td class="border-left text-left">
											  <a href="javascript:;" class="list-title" data-ootd_idx="<c:out value="${row.CNT_MST_IDX }"/>">
												<c:out value="${row.CNT_MST_TITLE }" />
											  </a>   
											</td>
										</tr>                                    
                                        <c:set var="listNum" value="${listNum-1}" />
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="3">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
                                    </tr>
                                </c:otherwise>   
                            </c:choose>
                        </tbody>                        
                        
                        <!--  
						<tbody id="list-field">
							<tr>
								<td rowspan="2">1</td>
								<td class="text-left">너무 멋진거 같아요*^^*</td>
								<td rowspan="2">2019-12-02 09:05:22</td>
							</tr>
							<tr>
								<td class="border-left text-left"><span class="thumbnail_img"><img src="profile.jpg"></span> <a href="#">심플 브이넥 스트라이프 자켓 내 스타일이 완성시켜주는 나마느이 스타일</a> </td>
							</tr>
							<tr>
								<td rowspan="2">2</td>
								<td class="text-left">어쩜 옷도, 모델도 너무 이쁘네요!!</td>
								<td rowspan="2">2019-12-02 09:05:22</td>
							</tr>
							<tr>
								<td class="border-left text-left"><span class="thumbnail_img"><img src="profile.jpg"></span> <a href="#">8월의 Christmas</a> </td>
							</tr>
						</tbody>
						-->
                    </table>


                    <input type="hidden" name="CNT_MST_IDX" value="" />                
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchCommentType" value="<c:out value="${commandMap.searchCommentType }"/>"/>
                    <input type="hidden" name="searchContent" value="<c:out value="${commandMap.searchContent }"/>"/>
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }" />" />

					<div class="section-pagination"><!-- section pagination -->
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
							<ui:paging paging="${paging }" jsFunction="goPage" />
						</div>
					</div><!-- // section pagination -->

                    <!--  
                    <div class="section-pagination">
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap">
                            <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1</span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a>
                        </div>
                    </div>
                    -->

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
			
			
		    // 검색
		    goSearch = function() 
		    {
		        var $searchForm = $("#searchForm"); 
		        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/commentListPopup.do", "target":"_self", "method":"post"}).submit(); 
		    };
		    
		    // 검색 엔터 이벤트 
		    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
		    {
		        if(e.keyCode == 13)
		        {
		            goSearch();
		        }
		    });
		    
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
		        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/commentListPopup.do", "target":"_self", "method":"post"}).submit();
		    };


			$('#excelDown').on('click',function(){
				goDownload();
			});
			
			
			goDownload = function()
			{
				var $searchForm = $("#searchForm"); 
				//$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
				$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/commentListPopupExcelDown.do", "target":"_self", "method":"post"}).submit();
				
			};
			
			
		    $(document).on("click", ".list-title", function () {
		        var $frm = $("#frm");
		        $frm.find("input[name='CNT_MST_IDX']").val($(this).data("ootd_idx"));
		        //$frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/ootdBoardEdit.do", "target":"_self", "method":"post"}).submit();
		        popup("<c:out value="${serverDomain}" />/am/board/ootdBoardEdit.do?CNT_MST_IDX="+ $(this).data("ootd_idx"), "1200", "800", "yes", "ootdBoardEdit");
		    });				
			
			

		});
		//]]>
		
		
		$(document).ready(function () {
		    //Paging count select 박스 적용
		    var vPageSize = '<c:out value="${commandMap.pageSize }"/>';
		    if ( vPageSize != '' )
		      $('#pageSize').val( vPageSize );
		    
		    $('#searchCommentType').val( '<c:out value="${commandMap.searchCommentType }"/>' ) ;
			    
		});		
		
	</script>
</body>
</html>
