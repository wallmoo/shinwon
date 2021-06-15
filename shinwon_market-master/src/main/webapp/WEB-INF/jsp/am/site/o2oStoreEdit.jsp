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

            <h2 class="title"><span>O2O매장 상세</span></h2>
			
            <h3 class="title"><span>상세</span></h3>

            <form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
            	<input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
            </form>
            <form id="searchForm" name="searchForm">
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	           	<input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
	           	<input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
	           	<input type="hidden" name="searchUseYn" value="<c:out value="${commandMap.searchUseYn }"/>"/>
	           	<input type="hidden" name="searchArea" value="<c:out value="${commandMap.searchArea }"/>"/>
	           	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
            </form>
            <form name="frm" id="frm" enctype="multipart/form-data">
            	<input type="hidden" name="PART_DIV" value="${storeInfo.PART_DIV }" />
               	<input type="hidden" name="PART_NO" value="${storeInfo.PART_NO }" />
               	<input type="hidden" name="BRAND" value="${storeInfo.BRAND }" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
                
            <div class="section-form"><!-- section-form-a -->
            	

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>매장명</span></th>
                            <td><c:out value="${storeInfo.PART_DIV }"/><c:out value="${storeInfo.PART_NO }"/><c:out value="${storeInfo.BRAND }"/></td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>지역</span></label></th>
                            <td><c:out value="${storeInfo.STATE }"/></td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>전화번호</span></label></th>
                            <td><c:out value="${storeInfo.PART_PHONE_NO }"/></td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>매장주소</span></label></th>
                            <td><c:out value="${storeInfo.ZIP_NO }"/><br/><c:out value="${storeInfo.ADDR }"/></td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>구글지도 URL</span></label></th>
                            <td><input type="text" name="MAP_URL" value="<c:out value="${storeInfo.MAP_URL }"/>"/> <a href="#none" id="showMapPopup" class="button small"><span>지도보기</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>매장 운영시간</span></label></th>
                            <td>
                            	<select  id="ERP_SHP_ST_HH" name="ERP_SHP_ST_HH" class="select">
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }" <ui:select v="${ storeInfo.ERP_SHP_ST_HH  }" t="${hour }" g="selected"/>>${hour }</option>
									</c:forEach>
                                </select>시
                                <select  id="ERP_SHP_ST_MM" name="ERP_SHP_ST_MM" class="select">
									<c:forEach begin="00" end="30" step="30" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }" <ui:select v="${ storeInfo.ERP_SHP_ST_MM  }" t="${minute }" g="selected"/>>${minute }</option>
									</c:forEach>
								</select> 분   ~  
								<select  id="ERP_SHP_ED_HH" name="ERP_SHP_ED_HH" class="select">
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }" <ui:select v="${ storeInfo.ERP_SHP_ED_HH  }" t="${hour }" g="selected"/>>${hour }</option>
									</c:forEach>
                                </select>시
                                <select  id="ERP_SHP_ED_MM" name="ERP_SHP_ED_MM" class="select">
									<c:forEach begin="0" end="30" step="30" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }" <ui:select v="${ storeInfo.ERP_SHP_ED_MM  }" t="${minute }" g="selected"/>>${minute }</option>
									</c:forEach>
								</select> 분 
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>방문 가능시간</span></label></th>
                            <td>
                            	<select  id="ERP_SHP_PCK_ST_HH" name="ERP_SHP_PCK_ST_HH" class="select">
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }" <ui:select v="${ storeInfo.ERP_SHP_PCK_ST_HH  }" t="${hour }" g="selected"/>>${hour }</option>
									</c:forEach>
                                </select>시
                                <select  id="ERP_SHP_PCK_ST_MM" name="ERP_SHP_PCK_ST_MM" class="select">
									<c:forEach begin="0" end="30" step="30" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }" <ui:select v="${ storeInfo.ERP_SHP_PCK_ST_MM  }" t="${minute }" g="selected"/>>${minute }</option>
									</c:forEach>
								</select> 분   ~  
								<select  id="ERP_SHP_PCK_ED_HH" name="ERP_SHP_PCK_ED_HH" class="select">
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }" <ui:select v="${ storeInfo.ERP_SHP_PCK_ED_HH  }" t="${hour }" g="selected"/>>${hour }</option>
									</c:forEach>
                                </select>시
                                <select  id="ERP_SHP_PCK_ED_MM" name="ERP_SHP_PCK_ED_MM" class="select">
									<c:forEach begin="0" end="30" step="30" var="i" varStatus="status">
										<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }" <ui:select v="${ storeInfo.ERP_SHP_PCK_ED_MM  }" t="${minute }" g="selected"/>>${minute }</option>
									</c:forEach>
								</select> 분 
                            </td>
                        </tr>
                        	
                        
                    </tbody>
                </table><!-- // table -->
            </div>

            <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                	<a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                    <a href="#none" id="goList" class="button large"><span>목록</span></a>
                </div>
            </div><!-- // section-button -->

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
	
	$(document).on("click","#showMapPopup",function(){
		var mapUrl = '<c:out value="${storeInfo.MAP_URL }"/>';
		popup(mapUrl,1024,764,'mapPopup');
	});
	//등록이벤트
	$(document).on("click", "#goRegist", function () {
        var $frm = $("#frm");
        var $stime = parseInt($("#ERP_SHP_ST_HH").val()+$("#ERP_SHP_ST_MM").val());
		var $etime = parseInt($("#ERP_SHP_ED_HH").val()+$("#ERP_SHP_ED_MM").val());
		var $sptime = parseInt($("#ERP_SHP_PCK_ST_HH").val()+$("#ERP_SHP_PCK_ST_MM").val());
		var $eptime = parseInt($("#ERP_SHP_PCK_ED_HH").val()+$("#ERP_SHP_PCK_ED_MM").val());
		
        if($frm.valid()){
        	if ($stime > $etime) {
        		alert("[매장운영시간]이 잘못 입력되었습니다.\n다시 입력해 주십시오.");
				$("#ERP_SHP_ST_HH").focus();
				return false;
            }
        	if ($sptime > $eptime) {
        		alert("[방문가능시간]이 잘못 입력되었습니다.\n다시 입력해 주십시오.");
				$("#ERP_SHP_PCK_ST_HH").focus();
				return false;
            }
        	
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/o2oStoreModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
	
	// 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/o2oStoreList.do", "target":"_self", "method":"post"}).submit(); 
    });

});
//-->
</script>

</body>
</html>
