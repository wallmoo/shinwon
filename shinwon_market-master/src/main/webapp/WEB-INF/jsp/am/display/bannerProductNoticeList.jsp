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

                <h2 class="title"><span><c:out value="${noticeStateNm }" /></span></h2>
					 
                <h3 class="title"><span>목록</span></h3>
                
                 <form id="searchForm" name="searchForm">
	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	                    <colgroup>
	                        <col style="width: 10%;" />
	                        <col style="width: auto;" />
	                       
	                    </colgroup>
	                    <tbody>
	                        <tr><!-- row -->
	                            <th><span>구분</span></th>
	                            <td>
	                              	<input type="radio" id="stateB" name="searchGubun" class="radio" <c:if test="${empty commandMap.seachGubun or commandMap.searchGubun eq 'P' }">checked="checked"</c:if> value="P"/>
		                            <label for="stateB">PC</label>
		                            <input type="radio" id="stateC" name="searchGubun" class="radio" <c:if test="${commandMap.searchGubun eq 'M' }">checked="checked"</c:if> value="M"/>
		                            <label for="stateC">MOBILE</label>
	                            </td>
	                          
	                        </tr>
	                      
	                    </tbody>
	                </table><!-- // table -->
	                
	                
	                <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
	                    <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
	                    <a href="#none;" id="search" class="button small primary"><span>검색</span></a>
                	</div>
	                
	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
						 <c:choose>
                        <c:when test="${BNR_MST_GBN eq 'D' }">
                            <c:if test="${not empty bnrCatList[0].CMN_COM_ETC3 }">
                                <span style="padding-left:5px;">(배너사이즈 : ${bnrCatList[0].CMN_COM_ETC3 })</span>
                            </c:if>
                            <div class="text-right">
                            	<span style="padding-left:10px;">
                                <select name="BND_MST_IDX" id="BND_MST_IDX" class="select">
                                    <option value="" >선택</option>
                                    <c:if test="${not empty basicBrandList }">
                                        <c:forEach var="basicBrandList" items="${basicBrandList }" varStatus="i">
                                            <option value="<c:out value="${basicBrandList.BND_MST_IDX }"/>" <c:if test="${commandMap.BND_MST_IDX eq basicBrandList.BND_MST_IDX}">selected="selected"</c:if>><c:out value="${basicBrandList.BND_MST_BRAND_NM }"/></option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                                </span>
                                <a href="#none" id="searchDetail" class="button small"><span>조회</span></a>
                                <a href="javascript:goForm();" class="button small primary"><span>등록</span></a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${not empty bnrCatList[0].CMN_COM_ETC3 }">
                                <span style="padding-left:5px;">(배너사이즈 : ${bnrCatList[0].CMN_COM_ETC3 })</span>
                            </c:if>
                            <div class="text-right">
                                <span style="padding-left:10px;">
                                <select name="ADM_MST_ID" id="ADM_MST_ID" class="select">
                                    <option value="" >선택</option>
                                    <c:if test="${not empty basicMdList }">
                                        <c:forEach var="basicMdList" items="${basicMdList }" varStatus="i">
                                            <option value="<c:out value="${basicMdList.ADM_MST_ID }"/>" <c:if test="${commandMap.ADM_MST_ID eq basicMdList.ADM_MST_ID}">selected="selected"</c:if>><c:out value="${basicMdList.ADM_MST_NM }"/></option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                                </span>
                                <a href="#none" id="searchDetail" class="button small"><span>조회</span></a>
                                <a href="javascript:goForm();" class="button small primary"><span>등록</span></a>
                            </div>
                        </c:otherwise>
                    </c:choose>
	                    
                	</div><!-- // 목록 상단 버튼 -->
                	
                </form>
                
                <table cellspacing="0" class="table-col table-b"><!-- table -->
					<colgroup>
						<col style="width: 7%;" />
						<col style="width: 10%;" />
						<col style="width: auto;" />
						<col style="width: 20%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<c:choose>
								<c:when test="${BNR_MST_GBN eq 'D' }">
									<th>브랜드</th>
								</c:when>
								<c:otherwise>
									<th>MD</th>
								</c:otherwise>
							</c:choose>
							<th>제목</th>
							<th>전시기간</th>
							<th>잔여기간</th>
							<th>등록일</th>
							<th>진행여부</th>
							<th>보기</th>
						</tr>
					</thead>
					<tbody class="sort-target">
						<c:choose>
						    <c:when test="${not empty list}">
						    	<c:forEach var="row" items="${list }" varStatus="i">
								<tr>
								    <td class="col-sort" data-bnr_dtl_idx="<c:out value="${row.BNR_MST_IDX }"/> ">${row.BNR_MST_SRT }</td>
								    <c:choose>
										<c:when test="${BNR_MST_GBN eq 'D' }">
											<td><c:out value="${row.BND_MST_NM }" /></td>
										</c:when>
										<c:otherwise>
											<td><c:out value="${row.ADM_MST_NM }" /></td>
										</c:otherwise>
									</c:choose>
								    <td>
									    <a href="javascript:goView('<c:out value="${row.BNR_MST_IDX }" />');">
									        <c:out value="${row.BNR_MST_TITLE }" />
									    </a>
								    </td>
								    <td>
									    <ui:formatDate value="${row.BNR_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ 
									    <ui:formatDate value="${row.BNR_MST_ED_DT }" pattern="yyyy.MM.dd"/>
								    </td>
								    <td><c:out value="${row.BNR_MST_MOD_DT < 1 ? 0 : row.BNR_MST_MOD_DT }" /></td>
								    <td><ui:formatDate value="${row.BNR_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
								    <td><c:out value="${row.BNR_MST_STATE }" /></td>
								    <td>
			        					<a href="javascript:goShowImg(<c:out value="${row.BNR_MST_IDX }" />);" class="button small primary"><span>배너보기</span></a>
								    </td>
								</tr>
						    	</c:forEach>
						    </c:when>
						    <c:otherwise>
								<tr>
									<td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
						    </c:otherwise>
						</c:choose>
						</tbody>
					</table>
				  	<form id="frm" name="frm">
	                	<input type="hidden" name="BNR_MST_IDX" value="" />
				        <input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="<c:out value="${CMN_COM_IDX }"/>" />
				        <input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="<c:out value="${searchGubun }"/>" />
				        <input type="hidden" id="BNR_MST_GBN" name="BNR_MST_GBN" value="<c:out value="${BNR_MST_GBN }"/>" />
				        <input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${searchGubun }"/>" />
				        <input type="hidden" id="path" name="path" value="<c:out value="${path }"/>" />
				        
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
	
	
	// 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        var path = $("#path").val();
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/bannerProduct"+path+"NoticeList.do", "target":"_self", "method":"post"}).submit(); 
    });
 	
 	// 조회 버튼 클릭 이벤트
    $(document).on("click", "#searchDetail", function () {
    	var $searchForm = $("#searchForm"); 
        var path = $("#path").val();
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/display/bannerProduct"+path+"NoticeList.do", "target":"_self", "method":"post"}).submit(); 
    });
 	
 	// 전시배너관리 등록페이지 이동
    goForm = function (){
        var $frm = $("#frm");
        var path = $("#path").val();
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/bannerProduct"+path+"NoticeForm.do", "target":"_self", "method":"post"}).submit();
    };
    
 	// 전시배너관리 상세페이지 이동
    goView = function (bnrMstIdx)
    {
        var $frm = $("#frm");
        var path = $("#path").val();
        $frm.find("input[name='BNR_MST_IDX']").val(bnrMstIdx);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/display/bannerProduct"+path+"NoticeEdit.do", "target":"_self", "method":"post"}).submit();
    };
    
 	// 전시배너관리 이미지 미리보기
    goShowImg = function (bnrMstIdx)
    {
        var $frm = $("#frm");
        $frm.find("input[name='BNR_MST_IDX']").val(bnrMstIdx);
        popup('',"1925","600","no","_BannerShowImagePopup");
    	$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/bannerDisplayImagePopup.do", "target":"popup_BannerShowImagePopup", "method":"post"}).submit();
    };
	
	
});
//-->
</script>

</body>
</html>
