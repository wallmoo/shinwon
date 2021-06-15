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

            <h2 class="title"><span>제휴사 할인관리</span></h2>

            <h3 class="title"><span>목록</span></h3>

            <form id="searchForm" name="searchForm">
            <input type="hidden" name="pageSize" value="">
            <input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="">
            <input type="hidden" name="searchYn" value="Y">
            <input type="hidden" id="searchDetailY" name="searchDetailY" value="none">
             <input type="hidden" id="searchType" name="searchType" value="">

			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
			<c:set var="cur_year" value="${year}" />
			<c:set var="nxt_year" value="${year + 1}" />
			<c:set var="conn_year" value="${cur_year },${nxt_year }" />

			<c:choose>
	        	<c:when test = "${commandMap.searchType eq 'S_ALL' or empty commandMap.searchType}">
	        		<c:set var="year_list" value="${fn:split(conn_year ,',')}" />
	         	</c:when>
	         	<c:otherwise>
	         		<c:set var="year_list" value="${fn:split(commandMap.searchYear ,',')}" />
	         	</c:otherwise>
	      	</c:choose>
	      	
            <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                <colgroup>
                    <col style="width: 10%;">
                    <col style="width: auto;">
                    <col style="width: 10%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr><!-- row -->
                        <th><span>시즌</span></th>
                        <td>
                        	<span>연도</span>
                            <select class="select" id="searchYear" name="searchYear">
                                <option value="" selected>전체</option>
                                <option value="${cur_year}" <c:if test="${cur_year eq commandMap.searchYear }">selected="selected"</c:if>>${cur_year}</option>
                                <option value="${nxt_year}" <c:if test="${nxt_year eq commandMap.searchYear }">selected="selected"</c:if>>${nxt_year}</option>
                            </select>
                            <span>시즌</span>
                            <select class="select" id="searchSeason" name="searchSeason">
                            <c:forEach var="row" items="${seasons }" varStatus="i">
                                <option value="${row.CMN_COM_IDX}" <c:if test="${row.CMN_COM_IDX eq commandMap.searchSeason }">selected="selected"</c:if>>${row.CMN_COM_NM}</option>
                            </c:forEach>
                            </select>
                        </td>
                        <th><span>품목</span></th>
                        <td>
                            <select class="select" id="searchItemType" name="searchItemType">
                                <option value="T" <c:if test="${'T' eq commandMap.searchItemType }">selected="selected"</c:if>>일반</option>
                                <option value="A" <c:if test="${'A' eq commandMap.searchItemType }">selected="selected"</c:if>>액세서리</option>
                                <option value="G" <c:if test="${'G' eq commandMap.searchItemType }">selected="selected"</c:if>>퍼</option>
                                <option value="G" <c:if test="${'G' eq commandMap.searchItemType }">selected="selected"</c:if>>가죽</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table><!-- // table -->
        </form>
        <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
            <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
            <a href="javascript:search();" class="button small primary"><span>검색</span></a>
        </div>

            <div class="clearfix">

                <!-- https://github.com/jzaefferer/jquery-treeview -->
                <!-- http://bassistance.de/jquery-plugins/jquery-plugin-treeview/ -->

            <div id="main_con">
                <div class="contents-inner"><!-- contents-inner -->
                    <form id="frm" name="frm">
                        <input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="2350">
                        <input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="">
                        <input type="hidden" id="DSP_MST_ENV" name="DSP_MST_ENV" value="P">
                        <input type="hidden" id="searchGubun" name="searchGubun" value="">
						<input type="hidden" id="discountList" name="discountList" value="">

                       <div class="table-a"><!-- col list -->
                            <table class="table-row table-a">
                                <colgroup>
                                    <col style="width: 20%;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody >
                          			
                          			
		                            <c:forEach var="year_items" items="${year_list }">
	                            		<c:forEach var="seasons_items" items="${seasons }" varStatus="status">
	                            			<tr>
	                            			<c:if test="${status.index ne 0}">
	                            				<th>${year_items }&nbsp;${seasons_items.CMN_COM_NM }</th>
	                            				
		                                      	<td>
		                                            <table class="table-row table-a">
		                                                <colgroup>
		                                                    <col style="width:15%;">
		                                                    <col style="width:auto;">
		                                                    <col style="width:15%;">
		                                                    <col style="width:auto;">
		                                                    <col style="width:15%;">
		                                                    <col style="width:auto;">
		                                                </colgroup>
		                                                <tbody>
															
															<c:forEach var="brands_items" items="${brandList }"  varStatus="b_status">
			                                  					<c:if test="${b_status.index % 3 eq 0}">
			                                  						<tr>
			                                  					</c:if>
		                                                        
		                                                        <th>${brands_items.BND_MST_BRAND_NM}</th>
		                                                        
		                                                        <c:set var="discount_val" value="0" />
		                                                        <c:set var="data_brand" value="${brands_items.BND_MST_IDX }" />
		                                                        <c:set var="data_year" value="${year_items }" />
		                                                        <c:set var="data_season" value="${seasons_items.CMN_COM_IDX }" />
		                                                        
		                                                        <c:forEach var="dsc_items" items="${discountList }"  varStatus="d_status">
		                                                        	<c:if test="${dsc_items.BND_MST_IDX eq data_brand
		                                                        				and dsc_items.DSC_MST_YEAR eq data_year
		                                                        				and dsc_items.DSC_MST_SEASON eq data_season}">
			                                                        	<c:set var="discount_val" value="${dsc_items.DSC_MST_RATE}" />
			                                                        	 
		                                                        	</c:if>
		                                                        </c:forEach>
		                                                        
		                                                        <td><input class="discount_cls" type="text" value="${discount_val}" name="txt" placeholder="0"
		                                                        	data-brand="${data_brand}"
		                                                        	data-year="${data_year}"
		                                                        	data-season="${data_season}"
		                                                        > % 할인</td>
		                                                        
			                                  					<c:if test="${b_status.index % 3 eq 2}">
			                                  						</tr>
			                                  					</c:if>
			                                  					
			                                  					<c:if test="${b_status.last eq true and b_status.index % 3 ne 2}">
			                                  						</tr>
			                                  					</c:if>
			                                  					
															</c:forEach>
		                                            
		                                                </tbody>
		                                            </table>
		                                        </td>
	                            			</c:if>
	                            			
	                            			</tr>
	                            		</c:forEach>    
		                                
		                            </c:forEach>
                                </tbody>
                            </table>
                        </div><!-- // col list -->
                    </form>
                    <div class="section-button"><!-- section-button -->
                        <div class="wrap text-center">
                             <a href="javascript:void(0);" id="goRegist" class="button large primary"><span>저장</span></a>
                        </div>
                    </div>
                </div>
            </div>

            </div>

            <p>

            </p>
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
search = function(){
    var $searchForm = $("#searchForm"); 
    
    if($('#searchYear option:selected').val().length > 0) 
    	$('#searchType').val('S_YEAR');
    else
    	$('#searchType').val('S_ALL');
    
    var params = $searchForm.serialize();
    
    $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/partnerDiscountList.do", "target":"_self", "method":"post"}).submit(); 
};

$(function(){
	$('#goRegist').on('click', function(){
		if(confirm('저장하시겠습니까?')) {
			
			var data =  new Array();
			$(".discount_cls").each(function(){
				var object = new Object();
				object.BND_MST_IDX = $(this).data('brand');
				object.DSC_MST_SEASON = $(this).data('season');
				object.DSC_MST_YEAR = $(this).data('year');
				object.DSC_MST_RATE = $(this).val();
				
				if(isNaN (object.DSC_MST_RATE)) object.DSC_MST_RATE = 0; 
				else if(object.DSC_MST_RATE * 1.0 < 0) object.DSC_MST_RATE = 0;
				else if(object.DSC_MST_RATE * 1.0 > 100) object.DSC_MST_RATE = 100;
				data.push(object);                                                    	
			});	
			
			if(data.length <= 0) {
				alert('저장할 데이터가 없습니다.')
			} else {
				console.log(data);
				
				var jsonData = JSON.stringify(data);

				
				$("#discountList").val(jsonData);
				
				return false;
		 		var url = "<c:out value="${serverDomain}"/>/am/product/partnerDiscountRegist.do";
				$("#frm").attr({"action" : url, "target" : "_self", "method" : "post"}).submit();	
			}
		}

	});

});
//-->
</script>

</body>
</html>
