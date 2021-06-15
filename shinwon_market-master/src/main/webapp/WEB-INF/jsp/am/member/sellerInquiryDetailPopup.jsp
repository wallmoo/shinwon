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
					<span>셀러문의 상세</span>
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

            <h3 class="title"><span>상세정보</span></h3>
            
            <form id="frm" name="frm">
            	<input type="hidden" name="cPage" value="${commandMap.cPage }"/>
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                <input type="hidden" name="searchBrdInqContents" value=""/>
                <input type="hidden" name="searchBrdInqReplyCd" value=""/>
                <input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
                <input type="hidden" name="BRD_INQ_IDX" value="<c:out value="${commandMap.BRD_INQ_IDX }"/>"/>

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
              			<tr>
	                        <th><span>입점사 명</span></th>
	                    	<!-- TODO 입점사명 데이터 필요 (수정) -->
	                        <td>
 			                  	<a href="javascript:goEdit('<c:out value="${sellserDetail.VDR_MST_IDX }"/>');" class="list-title">
             			      		<c:out value="${sellserDetail.VDR_MST_NM}"/>
                   				</a>		                        
	                        </td>
                        </tr>
                        <tr>
                            <th><span>제목</span></th>
                            <td><c:out value="${sellserDetail.BRD_INQ_TITLE }"/></td>
                        </tr>
                        <tr>
                            <th><span>내용</span></th>
                            <td><ui:replaceLineBreak content="${sellserDetail.BRD_INQ_CONTENTS }"/></td>
                        </tr>
                        <tr>
                            <th><span>등록일</span></th>
                            <td><ui:formatDate value="${sellserDetail.BRD_INQ_REG_DT}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        </tr>
                    </tbody>
                </table><!-- // table -->

            </form>

            <h3 class="title"><span>답변하기</span></h3>

			<table cellspacing="0" class="table-row table-a"><!-- table -->
			    <colgroup>
			        <col style="width: 10%;" />
			        <col style="width: auto;" />
			    </colgroup>
			    <tbody>
			        <tr>
			            <th><span>사용여부</span></th>
			            <td>
			            	<c:choose>
			            		<c:when test="${sellserDetail.BRD_INQ_USE_YN eq 'Y'}">
			            			사용
			            		</c:when>
			            		<c:otherwise>
			            			미사용
			            		</c:otherwise>
			            	</c:choose>
			            </td>
			        </tr>
			        <tr>
			            <th><span>답변상태</span></th>
			            <td>
						<c:choose>
							<c:when test="${sellserDetail.BRD_INQ_REPLY_CD eq 'Y' }">
								답변완료
							</c:when>
							<c:otherwise>
								답변미완료
							</c:otherwise>
						</c:choose>
						</td>
                 	</tr>
					<tr>
						<th><span>답변내용</span></th>
						<td><ui:replaceLineBreak content="${sellserDetail.BRD_INQ_REPLY_CONTENTS }"/></td>
	        		</tr>
			        <tr>
			            <th><span>답변일</span></th>
			            <td><ui:formatDate value="${sellserDetail.BRD_INQ_REPLY_DT}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			        </tr>
			        <tr>
			            <th><span>답변자</span></th>
			            <td><c:out value="${sellserDetail.BRD_INQ_REPLY_ID }"/>(<c:out value="${sellserDetail.BRD_INQ_REPLY_NM }"/>)</td>
			        </tr>
		    	</tbody>
			</table><!-- // table -->


            <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="#none" id="goList" class="button large"><span>목록</span></a>
                </div>
            </div><!-- // section-button -->

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
			
			//목록 이동
			$(document).on("click", "#goList", function(){
				var $frm = $("#frm");
				$frm.attr({"action":"<c:out value="${serverDomain }"/>/am/member/sellerInquiryPopup.do", "target":"_self", "method":"post"}).submit();
			});
			
			
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
	</script>
</body>
</html>
