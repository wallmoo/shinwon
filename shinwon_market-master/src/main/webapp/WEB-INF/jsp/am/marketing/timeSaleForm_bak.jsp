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

                <h2 class="title"><span>게릴라세일</span></h2>

                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm" name="searchForm">
					<input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	                <input type="hidden" name="searchTimeSaleUseYn" value="<c:out value="${commandMap.searchTimeSaleUseYn }"/>"/>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
				</form>
                
                <form id="frm" name="frm" enctype="multipart/form-data"> 
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr>
	                    		<th><label class="label"><span>게릴라세일상품<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
		                    		<input type="text" class="text" id="PRD_MST_CD" name="PRD_MST_CD" style="width:20%" readonly/>&nbsp;
									<input type="text" class="text" id="PRD_MST_NM" name="PRD_MST_NM" style="width:50%" readonly/>
									<a href="#none" class="button small primary search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
	                    		</td>
	                        </tr>
	                        <tr>
	                            <th><label class="label"><span>적용일자/시간<i class="require"><em>필수입력</em></i></span></label></th>
	                            <td>
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="TIM_SAL_ST_DT" name="TIM_SAL_ST_DT" readonly="readonly" data-target-end="#TIM_SAL_ED_DT"/>
	                               	<select id="TIM_SAL_ST_HH" name="TIM_SAL_ST_HH" >
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }">${hour }</option>
									</c:forEach>
									</select> 시
									<select id="TIM_SAL_ST_MM" name="TIM_SAL_ST_MM" >
									<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }">${minute }</option>
									</c:forEach>
									</select> 분 ~
									<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
									<input type="text" class="text" id="TIM_SAL_ED_DT" name="TIM_SAL_ED_DT"  readonly="readonly" data-target-start="#TIM_SAL_ST_DT"/>
									<select id="TIM_SAL_ED_HH" name="TIM_SAL_ED_HH" >
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }" <c:if test="${status.last}">selected</c:if>>${hour }</option>
									</c:forEach>
									</select> 시
									<select id="TIM_SAL_ED_MM" name="TIM_SAL_ED_MM" >
									<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }" <c:if test="${status.last}">selected</c:if>>${minute }</option>
									</c:forEach>
									</select> 분
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>상품재고</span></label></th>
	                    		<td>
	                    			<input type="text" class="text short" id="TIM_SAL_PRD_CNT" name="TIM_SAL_PRD_CNT" readonly/>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>표시재고<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="number" class="text number short" id="TIM_SAL_DSP_CNT" name="TIM_SAL_DSP_CNT"/>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>게릴라세일제목<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" class="text long" id="TIM_SAL_NM" name="TIM_SAL_NM" style="width:80%;" maxlength="30"/> (30자이내)
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>게릴라세일내용<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<textarea class="textarea" name="TIM_SAL_CTS" id="TIM_SAL_CTS" style="width:80%; height: 40px;"  maxlength="60"></textarea> (60자이내)
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>사용유무<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<select id="TIM_SAL_USE_YN" name="TIM_SAL_USE_YN" class="select" title="사용유무">
			    						<option value="Y" selected="selected">사용</option>
			    						<option value="N">미사용</option>
	    							</select>
	                    		</td>
	                        </tr>
	                      
	                    </tbody>
                	</table><!-- // table -->
                </form>
               	<div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
						<a href="#none" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button --> 

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
	// 폼체크
    $("#frm").validate({
        rules: {
        	PRD_MST_CD : { required:true },
        	TIM_SAL_NM : { required:true },
        	TIM_SAL_ST_DT : { required:true },
        	TIM_SAL_ST_HH : { required:true },
        	TIM_SAL_ST_MM : { required:true },
        	TIM_SAL_ED_DT : { required:true },
        	TIM_SAL_ED_HH : { required:true },
        	TIM_SAL_ED_MM : { required:true },
        	TIM_SAL_CTS : { required:true },
        	TIM_SAL_PRD_CNT : { required:true },
        	TIM_SAL_DSP_CNT : { required:true }
        }
    });

    // 저장 이벤트
    $(document).on("click", "#goRegist", function () 
    {
        var $frm = $("#frm"); 
        if($frm.valid()){
        	
            if (confirm( "저장 하시겠습니까?")) {              	 
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/timeSaleRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
  
    
    // 목록 이벤트
    $(document).on("click", "#goList", function () 
    {
        var $frm = $("#searchForm"); 
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/timeSaleList.do", "target":"_self", "method":"post"}).submit();
    });
    
    $(document).on("click", ".search-product-popup", function () {
	    popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    });
	
    fnResultProduct = function(params){
    	$.each(params, function(index,item){
    		$("#PRD_MST_CD").val(item.PRD_MST_CD);
    		$("#PRD_MST_NM").val(item.PRD_MST_NM);
    		$("#TIM_SAL_PRD_CNT").val(item.PRD_MST_SEL_CNT);
    		
        });
    	
    	return true;
    };
});
//-->
</script>

</body>
</html>
