<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

            <div class="container">

                <h2 class="title"><span>상품문의</span></h2>
					 
                <h3 class="title"><span>목록</span></h3>
                
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
             		<c:if test="${not empty commandMap.searchVdrMstIdx }"><%-- 입점업체 관리자일 경우 --%>
               			<input type="hidden" name="searchVdrMstIdx" id="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
               		</c:if>
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr><!-- row -->
	                        	
	                            <th><span>등록일</span></th>
	                            <td colspan="5">
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="searchStartDate" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }" />"   readonly="readonly" data-target-end="#searchEndDate"/> ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="searchEndDate" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }" />"  readonly="readonly" data-target-start="#searchStartDate"/>
									<a href="javascript:fnDateReset('searchEndDate', 'searchStartDate');" class="button button-a xsmall"><span>전체</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
		                            <a href="javascript:fnDateSet('searchEndDate', 'searchStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
	                            </td>
	                        </tr>
	                        <tr>
	                        	<th><span>상품명/상품코드</span></th>
	                            <td>
	                            	<input type="text" class="text serach-text" name="searchPrdMstNm" id="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
	                            	/
	                        		<input type="text" class="text serach-text" name="searchPrdMstCd" id="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	                            </td>
	                        	<th><span>작성자/ID</span></th>
	                            <td>
	                            	<input type="text" class="text serach-text" name="searchRegNm" id="searchRegNm" value="<c:out value="${commandMap.searchRegNm }"/>"/>
	                            	/
	                        		<input type="text" class="text serach-text" name="searchRegId" id="searchRegId" value="<c:out value="${commandMap.searchRegId }"/>"/>
	                            </td>
	                            <th><span>키워드</span></th>
	                            <td>
	                               	<%-- <input type="text" class="text serach-text xlarge" name="searchBrdInqContents" id="searchBrdInqContents" value="<c:out value="${commandMap.searchBrdInqContents }"/>" placeholder="제목 또는 질문과 답변 내용에서 찾으시는 단어를 입력하세요."/> --%>
	                               	<input type="text" class="text serach-text large" name="searchKeyword" id="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>" placeholder="제목 또는 질문과 답변 내용에서 찾으시는 단어를 입력하세요."/>
	                            </td>
	                        </tr>
	                        <tr>    
	                            <th><span>답변상태</span></th>
	                            <td>
									<input type="radio" name="searchBrdInqReplyCd" id="stateA" class="radio" value="" <c:if test="${empty commandMap.searchBrdInqReplyCd }">checked="checked"</c:if>/>
									<label for="stateA">전체</label>
									<input type="radio" name="searchBrdInqReplyCd" id="stateB" class="radio" value="N"<c:if test="${commandMap.searchBrdInqReplyCd eq 'N'}">checked="checked"</c:if>/>
									<label for="stateB">답변미완료</label>
									<input type="radio" name="searchBrdInqReplyCd" id="stateC" class="radio" value="Y" <c:if test="${commandMap.searchBrdInqReplyCd eq 'Y'}">checked="checked"</c:if>/>
									<label for="stateC">답변완료</label>
		                      	</td>
	                            <th><span>사용여부</span></th>
	                            <td colspan="3">
	                            	<input type="radio" name="searchBrdInqUseYn" id="searchBrdInqUseYnA" class="radio" value="" <c:if test="${empty commandMap.searchBrdInqUseYn }">checked="checked"</c:if>/>
									<label for="searchBrdInqUseYnA">전체</label>
									<input type="radio" name="searchBrdInqUseYn" id="searchBrdInqUseYnB" class="radio" value="Y" <c:if test="${commandMap.searchBrdInqUseYn eq 'Y'}">checked="checked"</c:if>/>
									<label for="searchBrdInqUseYnB">사용</label>
									<input type="radio" name="searchBrdInqUseYn" id="searchBrdInqUseYnC" class="radio" value="N" <c:if test="${commandMap.searchBrdInqUseYn eq 'N'}">checked="checked"</c:if>/>
									<label for="searchBrdInqUseYnC">미사용</label>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
                </form>
                
                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                    <a href="#none" id="search" class="button small primary"><span>검색</span></a>
                </div>
                
                <form id="frm" name="frm"> 
	                <input type="hidden" name="BRD_INQ_IDX" value="" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchRegNm" value="<c:out value="${commandMap.searchRegNm }"/>"/>
                    <input type="hidden" name="searchRegId" value="<c:out value="${commandMap.searchRegId }"/>"/>
                    <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <%-- <input type="hidden" name="searchBrdInqContents" value="<c:out value="${commandMap.searchBrdInqContents }"/>"/> --%>
                    <input type="hidden" name="searchBrdInqReplyCd" value="<c:out value="${commandMap.searchBrdInqReplyCd }"/>"/>                    
                    <input type="hidden" name="searchBrdInqUseYn" value="<c:out value="${commandMap.searchBrdInqUseYn }"/>"/>
                    <input type="hidden" name="searchVdrMstIdx" id="searchVdrMstIdx" value="<c:out value="${commandMap.searchVdrMstIdx }"/>"/>
                    <input type="hidden" name="searchPrdMstErpCd" id="searchPrdMstErpCd" value="" />
	                
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                 		<div class="col-1-2 text-left">
	                 		<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                        <span class="pages">
	                        	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                        </span>
						</div>		
                	</div><!-- // 목록 상단 버튼 -->
			 		
	                <table cellspacing="0" class="table-col table-b"><!-- table -->
						<colgroup>
							<col style="width: 5%;" />
                            <col style="width: 15%;" />
                            <col style="width: 8%;" />
							<col style="width: 15%;" />
                            <col style="width: auto;" />
                            <col style="width: 15%;" />
                            <col style="width: 10%;" />
                            <col style="width: 5%;" />
                            <col style="width: 8%;" />
						</colgroup>
						<thead>
							<tr>
								<th>NO</th>
                                <th>상품코드</th>
                                <th>이미지</th>
                                <th>상품명</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>등록일</th>
                                <th>사용여부</th>
                                <th>답변상태</th>
							</tr>
						</thead>
						<tbody id="productInqList">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
			                                <td><c:out value="${listNum }"/></td>
			                                <td>
			                                	<a href="<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.BRD_PRD_MST_CD }"/>" class="thumb-link thumb-link-col" target="_blank" title="새 창 으로 열립니다.">
													<c:out value="${row.BRD_PRD_MST_CD }" />
			                                	</a>
			                                	 <br/><a href="javascript:goErpPrdDetail('<c:out value="${row.PRD_MST_ERP_CD }" />');"><c:out value="${row.PRD_MST_ERP_CD }" /></a>
			                                </td>
			                                <td><span class="thumbnail_img"><img src="<c:out value="${cdnDomain}" />${row.PRD_MST_REF_IMG_URL }"></span></td>
			                                <td>
												<%-- <a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=${row.BRD_PRD_MST_CD}&ADMIN=Y" target="_blank"> --%>
												<a href="<c:out value="${serverDomain}"/>/am/product/basicProductEdit.do?PRD_MST_CD=<c:out value="${row.BRD_PRD_MST_CD }"/>" class="thumb-link thumb-link-col" target="_blank" title="새 창 으로 열립니다.">
			                                        <c:out value="${row.BRD_PRD_MST_NM }"/>
			                                    </a>
			                                </td>
			                                <td class="left">
			                                    <a href="javascript:;" class="ellipsis preview" data-brd_inq_idx="<c:out value="${row.BRD_INQ_IDX }" />" data-brd_inq_reply_cd="<c:out value="${row.BRD_INQ_REPLY_CD }"/>">
			                                        <c:out value="${row.BRD_INQ_TITLE }"/>
			                                    </a>
			                                </td>
			                                <td>
				                                <c:choose>
													<c:when test="${not empty commandMap.searchVdrMstIdx }"><%-- 입점업체 관리자일 경우 --%>
					                            		<c:out value="${row.BRD_INQ_REG_ID }" />(<c:out value="${row.BRD_INQ_REG_NM }" />)
					                            	</c:when>
					                            	<c:otherwise>
					                            		<a href="javascript:goView('<c:out value="${row.BRD_INQ_REG_ID }" />');">
						                                    <c:out value="${row.BRD_INQ_REG_ID }" />(<c:out value="${row.BRD_INQ_REG_NM }" />)
						                                </a>
					                            	</c:otherwise>
					                        	</c:choose>
			                                </td>
			                                <td><ui:formatDate value="${row.BRD_INQ_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
			                                <td>
			                                	<c:out value="${row.BRD_INQ_USE_YN eq 'Y' ? '사용' : '미사용' }"/>
			                               	</td>
			                                <td>
			                                	<c:out value="${row.BRD_INQ_REPLY_CD eq 'Y' ? '답변완료' : '답변대기' }"/>
		                                	</td>
			                            </tr>
			                            <c:set var="listNum" value="${listNum-1}" />     
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr><td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td></tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
					</table>
						
					<div class="section-pagination"><!-- section pagination -->
	                    <h4 class="sr-only">목록 페이징</h4>
	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
	                        <ui:paging paging="${paging }" jsFunction="goPage" />
	                    </div>
	                </div><!-- // section pagination -->
				</form>		
				
            </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>


<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
$(function(){
	 // 제목 a Tag 클릭 이벤트
    $(document).on("click", "#productInqList .preview", function () {
    	var $frm = $("#frm");
        $frm.find("input[name='BRD_INQ_IDX']").val($(this).data("brd_inq_idx"));
        if($(this).data("brd_inq_reply_cd") == "Y")
        {
            $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/productInquiryEdit.do", "target":"_self", "method":"post"}).submit();
        }
        else
        {
            $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/productInquiryForm.do", "target":"_self", "method":"post"}).submit();    
        }
    	
    	
    	/* var brd_inq_idx = $(this).data("brd_inq_idx");
    	var thisTr = $(this).parents("tr");
    	var replyYn = $(this).data("brd_inq_reply_cd");
    	
    	//기존 열려있는 answerForm과 brd_inq_idx가 다른 경우에만 answerForm 생성
    	var thisAnswerFormTrLen = $("#tr_"+brd_inq_idx).length;
    	
    	//기존 열려있는 answerForm 삭제
    	$(".answerFormTr").remove();
    	
    	if(thisAnswerFormTrLen == 0){
    		$.ajax({
        		type: "post",
        		url : "${serverDomain}/am/board/inquiryFormJson.do",
        		data : {BRD_INQ_IDX : brd_inq_idx},
        		dataType : "json",
        		async : false,
        		success : function(result){
        			if(result.successYn == "Y") {
        				var htmlStr = "";
        				htmlStr += "<tr class=\"answerFormTr\"><td>Q</td><td class=\"left\" colspan=\"5\">";
        				
        				//상품 정보
        				if(result.row.PRD_MST_IMG_URL_PATH != null){
        					htmlStr += "<a href=\"${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD="+ result.row.BRD_PRD_MST_CD +"\" class=\"thumb-link thumb-link-co\" target=\"_blank\" title=\"새 창 으로 열립니다.\">";
        					htmlStr += "<span class=\"thumb\" data-thumb=\"50/50\">";
        					htmlStr += "<img src=\""+result.row.PRD_MST_IMG_URL_PATH+"\" onerror=\"this.src='${img_domain}/fr/img/common/noimage_64.gif'\" alt=\"\" />";
        					htmlStr += "</span>";
        					htmlStr += "<strong class=\"subject\">"+ result.row.BRD_PRD_MST_NM +"</strong></a><br/>";        					
        				}
        				
        				htmlStr += result.row.BRD_INQ_CONTENTS;
        				
        				//첨부파일 이미지
        				$.each(result.fileList, function (i) {
        					htmlStr += "<br/><img src=\"${img_domain}"+ result.fileList[i].CMM_FLE_ATT_PATH + result.fileList[i].CMM_FLE_SYS_NM +"\"/>";
        				});	
        				
        				htmlStr += "</td></tr>";
        				
        				
        				htmlStr += "<tr class=\"answerFormTr\" id=\"tr_"+ brd_inq_idx +"\"><td>A</td><td id=\"td_"+brd_inq_idx+"\" class=\"left\" colspan=\"5\">";
        				
        				if(replyYn == "Y"){
        					htmlStr += result.row.BRD_INQ_REPLY_CONTENTS;
        				}else{
        					htmlStr += "답변 미등록 상태입니다. <a class=\"button button-a xsmall\" href=\"javascript:addAnswerForm('"+ brd_inq_idx +"','"+ result.row.BRD_CMN_COM_IDX +"')\"><span>답변하기</span></a>";
        				}
        				
        				htmlStr += "</td></tr>";
        				thisTr.after(htmlStr);
        			}    			
        		},
        		error : function(){
        			alert("에러 발생");
        		}    		
        	});
    	} */
    });
    
    // 검색 엔터 이벤트 
    $(document).on("keydown", ".serach-text", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}"/>/am/board/productInquiryList.do", "target":"_self", "method":"post"}).submit(); 
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
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/board/productInquiryList.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 회원정보 상세 팝업페이지 호출
    goView = function (memMstWebId)
    {
    	goMemberViewPopup("<c:out value="${serverDomain}"/>", memMstWebId);
    };
    
  //erp 상품 상세페이지 팝업
    goErpPrdDetail = function (erpMstCd)
    {
        var $frm = $("#frm");
        $frm.find("input[name=searchPrdMstErpCd]").val(erpMstCd);
        popup('',"1100","800","no","_ErpMstPrdDetailPopup");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/legacyErpProductDetailPopup.do", "target":"popup_ErpMstPrdDetailPopup", "method":"post"}).submit();
    };
});
//-->
</script>

</body>
</html>
