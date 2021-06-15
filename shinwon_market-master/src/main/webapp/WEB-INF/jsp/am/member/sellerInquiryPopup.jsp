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

				<h2 class="title">
					<span>셀러문의</span>
				</h2>

				
				
                <c:choose>
                    <c:when test="${memberInfo.MEM_MST_MEM_GBN == Code.COMMON_COMP_MEMBER_GRADE }">
                        <%@ include file="/WEB-INF/jsp/am/member/infoCompMemberTabInc.jsp" %>           
                    </c:when>
                    <c:otherwise>
                        <%@ include file="/WEB-INF/jsp/am/member/infoMemberTabInc.jsp" %>
                    </c:otherwise>
                </c:choose>
				
                <%@ include file="/WEB-INF/jsp/am/member/infoSummary.jsp" %>

                <h3 class="title"><span>목록</span></h3>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value=""/>
                    <input type="hidden" name="searchYn" value="Y" />
                    <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>   

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
                                <th><span>입점사명</span></th>
                                <td>
                                    <select class="select" name='searchVdrMstIdx'  id='searchVdrMstIdx' >
                                        <option value='' >전체</option>
                                        <option value='55' >VIKY</option>
                                        <option value='54' >BESTIBELLI</option>
                                        <option value='53' >MarkM</option>
                                        <option value='58' >ISABEY</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span>제목</span></th>
                                <td>
                                    <input type="text" name="searchBrdInqTitle" id="searchBrdInqTitle" placeholder="제목 입력" class="text large" value="${commandMap.searchBrdInqTitle }">
                                </td>
                            </tr>
                            <tr>
                                <th><span>답변상태</span></th>
                                <td colspan="7">
                                    <input type="radio" name="searchBrdInqReplyCd" id="stateA" class="radio" value="" checked="checked"/>
                                    <label for="stateA">전체</label>
                                    <input type="radio" name="searchBrdInqReplyCd" id="stateB" class="radio" value="N"/>
                                    <label for="stateB">답변대기</label>
                                    <input type="radio" name="searchBrdInqReplyCd" id="stateC" class="radio" value="Y" />
                                    <label for="stateC">답변완료</label>
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
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
							<span class="pages">
								(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
							</span>
						</div>	
						
							                
	                    <!--  
	                    <div class="col-1-2 text-left">
	                        <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
	                        <span class="pages">
	                            (총 <strong class="em">1</strong>건, 1 of 1 page)
	                        </span>
	                    </div>
	                    -->
	
	                    <div class="col-1-2 text-right">
	                        <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
	                    </div>
	                </div><!-- // 목록 상단 버튼 -->

	                <table cellspacing="0" class="table-col table-b"><!-- table -->
	                    <colgroup>
	                        <col style="width: 5%;" />
	                        <col style="width: 10%;" />
	                        <col style="width: auto;" />
	                        <col style="width: 10%" />
	                        <col style="width: 10%;" />
	                        <col style="width: 10%;" />
	                        <col style="width: 10%;" />
	                    </colgroup>
	                    <thead>
							<tr>
	                            <th>번호</th>
	                            <th>입점사명</th>
	                            <th>제목</th>
	                            <th>등록일</th>
	                            <th>답변상태</th>
	                            <th>답변일</th>
	                            <th>답변자명</th>
	                        </tr>
	                    </thead>
	                    
	                    <tbody id="list-field">
						<c:choose>
							<c:when test="${not empty list }">
								<c:forEach var="list" items="${list }" varStatus="i">
									<tr>
										<td><c:out value="${i.count }"/></td>
										<td>
	        			                  	<a href="javascript:goEdit('<c:out value="${list.VDR_MST_IDX }"/>');" class="list-title">
	                    			      		<c:out value="${list.VDR_MST_NM}"/>
	                          				</a>										
										</td>
										<td><a href="javascript:goView('${list.BRD_INQ_IDX }')"><c:out value="${list.BRD_INQ_TITLE }"/></a></td>
										<td><ui:formatDate value="${list.BRD_INQ_REG_DT}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td>
											<c:choose>
												<c:when test="${list.BRD_INQ_REPLY_CD eq 'Y' }">
													답변완료
												</c:when>
												<c:otherwise>
													답변미완료
												</c:otherwise>
											</c:choose>
										</td>
										<td><ui:formatDate value="${list.BRD_INQ_REPLY_DT}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
										<td><c:out value="${list.BRD_INQ_REPLY_NM }"/><br>(<c:out value="${list.BRD_INQ_REPLY_ID }"/>)</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="td_no_result">셀러문의 목록이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
	                    </tbody>
	                </table>
	                

                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                <input type="hidden" name="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>                    
	                <input type="hidden" name="searchBrdInqTitle" value="<c:out value="${commandMap.searchBrdInqTitle }"/>"/>
	                <input type="hidden" name="searchBrdInqReplyCd" value="<c:out value="${commandMap.searchBrdInqReplyCd }"/>"/>
	                <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>                    
	                <input type="hidden" name="BRD_INQ_IDX" value="<c:out value="${commandMap.BRD_INQ_IDX }"/>"/>                    
	                
                    <div class="section-pagination"><!-- section pagination -->
                        <h4 class="sr-only">목록 페이징</h4>
                        <div class="wrap">
                            <ui:paging paging="${paging }" jsFunction="goPage" />
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
			
			
			
		    // 검색
		    goSearch = function() 
		    {
		        var $searchForm = $("#searchForm"); 
		        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/sellerInquiryPopup.do", "target":"_self", "method":"post"}).submit(); 
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
		        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/sellerInquiryPopup.do", "target":"_self", "method":"post"}).submit();
		    };
		    
			
			$('#excelDown').on('click',function(){
				goDownload();
			});
			
			
			goDownload = function()
			{
				var $searchForm = $("#searchForm"); 
				//$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
				$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/sellerInquiryPopupExcelDown.do", "target":"_self", "method":"post"}).submit();
				
			};
			
			
			//셀러문의 상세페이지 이동
			goView = function(brdInqIdx)
			{
				var $frm = $("#frm");
				
				$frm.find("input[name='BRD_INQ_IDX']").val(brdInqIdx);
				$frm.attr({"action":"<c:out value="${serverDomain }"/>/am/member/sellerInquiryDetailPopup.do", "target":"_self", "method":"post"}).submit();
			}
			
			
			//셀러 목록 조회 
			getSellerList = function( targetSelectId ){
				$.ajax({
					type:"post",
					url : "<c:out value="${serverDomain}" />/am/member/getSellerListAjax.do",
					dataType : "json",
					async : false,
					success : function(data){
						var selectedIdx = "${commandMap.searchVdrMstIdx}";
						$("#"+targetSelectId).html("<option value=\"\">전체</option>");
						if(data.sellerList.length > 0){
							$.each(data.sellerList, function(idx, item){
								var selected = item.VDR_MST_IDX == selectedIdx ? "selected" : ""; //기존 선택된 회원구분이 있는 경우 selected
								$("#"+targetSelectId).append("<option value=\""+ item.VDR_MST_IDX +"\" "+ selected +">"+ item.VDR_MST_NM +"</option>");
							});
						}
					},
					error : function(err){
						alert("오류가 발생하였습니다.\n[" + err.status + "]");
					}
				});
			};
			
		    // 상호/법인명 클릭 시 수정 페이지 이동
		    goEdit = function (idx)
		    {
		    	/*
		    	var $frm = $("#frm");
		    	$frm.find("input[name='VDR_MST_IDX']").val(idx);
		    	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/vendorManagerEdit.do", "target":"_self", "method":"post"}).submit();
		    	*/
		        popup("<c:out value="${serverDomain}" />/am/site/vendorManagerEdit.do?VDR_MST_IDX="+ idx, "1200", "800", "yes", "ootdBoardEdit");
		    	
		    };			
			
			
			
	
		});
		//]]>
		
		$(document).ready(function () {
			
			getSellerList( "searchVdrMstIdx");
		    //$('#searchVdrMstIdx').val( '<c:out value="${commandMap.searchVdrMstIdx }"/>' );
		    $("input:radio[name='searchBrdInqReplyCd']:radio[value='<c:out value="${commandMap.searchBrdInqReplyCd }"/>']").prop('checked', true); 
			    
		});
		
	</script>
</body>
</html>
