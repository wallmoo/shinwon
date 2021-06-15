<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>입점신청 업체 검색</span></h3>
            </div><!-- // push-guide -->
            
            <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	        
		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 20%;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr><!-- row -->
		                    <th><span>입점업체명</span></th>
		                    <td>
		                        <input type="text" class="text" id="searchVdrReqNm" name="searchVdrReqNm" value="<c:out value="${commandMap.searchVdrReqNm }"/>" maxlength="20"/>
		                    </td>
		                </tr>
		                <tr>
		                	<th><span>사업자등록번호</span></th>
		                    <td>
		                        <input type="text" class="text large number" id="searchVdrReqBusi" name="searchVdrReqBusi" value="<c:out value="${commandMap.searchVdrReqBusi }"/>" maxlength="13" />
		                    </td>
		                </tr>
		            </tbody>
		        </table><!-- // table -->
		    </form>
		    
		    <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                <a href="javascript:search();" class="button small primary"><span>검색</span></a>
            </div><!-- // 검색 하단 버튼 -->
            
            <form id="frm" name="frm">
            	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
	            <input type="hidden" name="searchVdrReqNm" value="<c:out value="${commandMap.searchVdrReqNm }"/>"/>
	            <input type="hidden" name="searchVdrReqBusi" value="<c:out value="${commandMap.searchVdrReqBusi }"/>"/>
	            
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
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th>번호</th>
							<th>입점업체명</th>
							<th>사업자등록번호</th>
							<th>대표자명</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
						    <c:when test="${not empty list}">
						    	<c:set var="listNum" value="${paging.listNum}" />
						    	<c:forEach var="item" items="${list }" varStatus="status">
								<tr>
									<td><c:out value="${listNum }"/></td>
									<td>
										<a href="javascript:goParent('<c:out value="${item.VDR_REQ_NM }"/>','<c:out value="${item.VDR_REQ_ERP_ID }"/>',
													'<c:out value="${item.VDR_REQ_BUSI1 }"/>','<c:out value="${item.VDR_REQ_BUSI2 }"/>','<c:out value="${item.VDR_REQ_BUSI3 }"/>',
													'<c:out value="${item.VDR_REQ_CEO_NM }"/>','<c:out value="${item.VDR_REQ_BUSI_CDT }"/>','<c:out value="${item.VDR_REQ_BUSI_TYPE }"/>',
													'<c:out value="${item.VDR_REQ_POST5 }"/>','<c:out value="${item.VDR_REQ_DR_ADDR1 }"/>','<c:out value="${item.VDR_REQ_DR_ADDR2 }"/>',
													'<c:out value="${item.VDR_REQ_JB_ADDR1 }"/>','<c:out value="${item.VDR_REQ_JB_ADDR2 }"/>','<c:out value="${item.VDR_REQ_TEL1 }"/>',
													'<c:out value="${item.VDR_REQ_TEL2 }"/>','<c:out value="${item.VDR_REQ_TEL3 }"/>','<c:out value="${item.VDR_REQ_FAX1 }"/>',
													'<c:out value="${item.VDR_REQ_FAX2 }"/>','<c:out value="${item.VDR_REQ_FAX3 }"/>','<c:out value="${item.VDR_REQ_BANK_CD }"/>',
													'<c:out value="${item.VDR_REQ_ACT_NO }"/>','<c:out value="${item.VDR_REQ_ACT_HDR }"/>','<c:out value="${item.VDR_REQ_CST_CD }"/>'
													,'<c:out value="${item.VDR_REQ_SUB_BUSI }"/>' ,'<c:out value="${item.VDR_REQ_HP1 }"/>' ,'<c:out value="${item.VDR_REQ_HP2 }"/>','<c:out value="${item.VDR_REQ_HP3 }"/>'
													,'<c:out value="${item.VDR_REQ_REF_TEL1 }"/>' ,'<c:out value="${item.VDR_REQ_REF_TEL2 }"/>' ,'<c:out value="${item.VDR_REQ_REF_TEL3 }"/>'
													,'<c:out value="${item.VDR_REQ_MNG_NM }"/>' ,'<c:out value="${item.VDR_REQ_MAIL }"/>'  );" title="해당 업체를 선택합니다">
											<c:out value="${item.VDR_REQ_NM }"/>
										</a>
									</td>
									<td>
										<c:out value="${item.VDR_REQ_BUSI1 }"/>-<c:out value="${item.VDR_REQ_BUSI2 }"/>-<c:out value="${item.VDR_REQ_BUSI3 }"/>
									</td>
									<td><c:out value="${item.VDR_REQ_CEO_NM }"/></td>
								</tr>
								<c:set var="listNum" value="${listNum-1}" />
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
						    	<tr>
									<td colspan="4">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
						    </c:otherwise>
						</c:choose>
	                </tbody>
	            </table><!-- // table -->
		    </form>

            <div class="section-pagination"><!-- section pagination -->
                <h4 class="sr-only">목록 페이징</h4>
                <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div>
            </div><!-- // section pagination -->
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
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
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/searchVendorPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/site/searchVendorPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 입점업체 선택 
    goParent = function (vdrNm,vdrErpId,vdrBusi1,vdrBusi2,vdrBusi3,vdrCeoNm,vdrBusiCdt,vdrBusiType,vdrPost5,vdrDrAddr1,vdrDrAddr2,vdrJbAddr1,vdrJbAddr2,vdrTel1,vdrTel2,vdrTel3,vdrFax1,vdrFax2,vdrFax3,vdrBankCd,vdrActNo,vdrActHdr,vdrCstCd, vdrReqSubBusi ,vdrReqHp1, vdrReqHp2, vdrReqHp3, vdrReqRefTel1 , vdrReqRefTel2, vdrReqRefTel3, vdrReqRefMngNm, vdrReqMail)
    {
    	window.opener.fnResultErpVendor(vdrNm,vdrErpId,vdrBusi1,vdrBusi2,vdrBusi3,vdrCeoNm,vdrBusiCdt,vdrBusiType,vdrPost5,vdrDrAddr1,vdrDrAddr2,vdrJbAddr1,vdrJbAddr2,vdrTel1,vdrTel2,vdrTel3,vdrFax1,vdrFax2,vdrFax3,vdrBankCd,vdrActNo,vdrActHdr,vdrCstCd, vdrReqSubBusi ,vdrReqHp1, vdrReqHp2, vdrReqHp3, vdrReqRefTel1 , vdrReqRefTel2, vdrReqRefTel3, vdrReqRefMngNm, vdrReqMail);
    	self.close();    	
    };
    
    // 닫기 버튼 클릭
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});      
        
});

</script>
</body>
</html>
