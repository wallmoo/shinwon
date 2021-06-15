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

                <h2 class="title"><span>타임세일</span></h2>

                <h3 class="title"><span>
                	<c:if test="${commandMap.COPY_YN eq 'N'}">수정</c:if>
	               	<c:if test="${commandMap.COPY_YN eq 'Y'}">복사등록</c:if>
                </span></h3>
                
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm" name="searchForm">
					<input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	                <input type="hidden" name="searchOneDayUesYn" value="<c:out value="${commandMap.searchAdMstDplYn }"/>"/>
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>
				</form>
                
               <form id="frm" name="frm" enctype="multipart/form-data"> 
					<input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNm }"/>" />
	                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	                <input type="hidden" name="searchOneDayUesYn" value="<c:out value="${commandMap.searchAdMstDplYn }"/>"/>
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>"/>    
                	<input type="hidden" id="ONE_DAY_IDX" name="ONE_DAY_IDX" value="<c:out value="${info.ONE_DAY_IDX }"/>" />
                	<input type="hidden" name="COPY_YN"  id="COPY_YN" value="<c:out value="${commandMap.COPY_YN }"/>" />
			  		
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>타임세일구분<i class="require"><em>필수입력</em></i></span></span></label></th>
	                    		<td>
	                    			<input type="radio" class="radio" name="timesale1">
	                    			<label for="">일반</label>
	                    			<input type="radio" class="radio" name="timesale1">
	                    			<label for="">타임세일</label>
	                    		</td>
	                        </tr>
	                    	<tr>
	                    		<th><label class="label"><span>타임세일상품<i class="require"><em>필수입력</em></i></span></span></label></th>
	                    		<td>
	                    		<input type="text" class="text" id="PRD_MST_CD" name="PRD_MST_CD" style="width:20%" value="<c:out value="${info.PRD_MST_CD }"/>" readonly/>&nbsp;
								<input type="text" class="text" id="PRD_MST_NM" name="PRD_MST_NM" style="width:50%" value="<c:out value="${info.PRD_MST_NM }"/>" readonly/>
								<a href="#none" class="button small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
								<div class="grid section-button-search left"><!-- section button -->
			                            <a href="#none" id="goSpcCategoryDelete_P" class="button button-a small"><span>선택삭제</span></a>
			                            <a href="#none" class="button small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
			                        </div><!-- // section button -->
			
			                        <table class="table-row table-a" id="tableCategory">
			                            <colgroup>
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                                <col style="width: auto;">
			                            </colgroup>
			                            <thead>
			                                <tr>
			                                    <th rowspan="2"><input type="checkbox" class="checkbox checkAllSpec_P"></th>
			                                    <th rowspan="2">상품코드</th>
			                                    <th rowspan="2">이미지</th>
			                                    <th rowspan="2">상품명</th>
			                                    <th rowspan="2">브랜드</th>
			                                    <th>할인율</th>
			                                    <th>상품재고</th>
			                                    <th rowspan="2">전시순서</th>
			                                </tr>
			                                <tr>
			                                    <th>판매가</th>
			                                    <th>전시상태</th>
			                                </tr>
			                            </thead>
			                            <tbody id="applyproductOptionList">
			                                <tr>
			                                    <td rowspan="2"><input type="checkbox"></td>
			                                    <td rowspan="2"><a href="#">S0011935</a></td>
			                                    <td rowspan="2"><span class="thumbnail_img"><img src="../profile.jpg"></span></td>
			                                    <td rowspan="2"><a href="#">라쿤 퍼 다운구스 패딩</a></td>
			                                    <td rowspan="2">NIKE</td>
			                                    <td>
			                                        <select class="select">
			                                            <option value="">정율(%)</option>
			                                            <option value="">정액(%)</option>
			                                        </select>
			                                        <input type="text" class="text">
			                                    </td>
			                                    <td>1,234</td>
			                                    <td rowspan="2">
			                                        <a href="#none" class="row-sort" data-sort_type="up">△ </a>
			    		                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
			                                    </td>
			                                </tr>
			                                <tr>
			                                    <td><input type="text" class="text xlarge" disabled></td>
			                                    <td>전시</td>
			                                </tr>
			                            </tbody>
			                        </table>
	                    		</td>
	                        </tr>
	                        <tr>
	                            <th><label class="label"><span>적용일자/시간<i class="require"><em>필수입력</em></i></span></label></th>
	                            <td>
	                            	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
	                               	<input type="text" class="text" id="ONE_DAY_ST_DT" name="ONE_DAY_ST_DT" readonly="readonly" value="<ui:formatDate value="${info.ONE_DAY_ST_DT }" pattern="yyyy-MM-dd"/>"/>
	                              	<select id="ONE_DAY_ST_HH" name="ONE_DAY_ST_HH" >
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }" <ui:select v="${ info.ONE_DAY_ST_HH  }" t="${hour }" g="selected"/> >${hour }</option>
									</c:forEach>
									</select> 시
									<select id="ONE_DAY_ST_MM" name="ONE_DAY_ST_MM" >
									<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }" <ui:select v="${ info.ONE_DAY_ST_MM  }" t="${minute }" g="selected"/> >${minute }</option>
									</c:forEach>
									</select> 분 ~
									<select id="ONE_DAY_ED_HH" name="ONE_DAY_ED_HH" >
									<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="hour" />
										<option value="${hour }" <ui:select v="${ info.ONE_DAY_ED_HH  }" t="${hour }" g="selected"/>>${hour }</option>
									</c:forEach>
									</select> 시
									<select id="ONE_DAY_ED_MM" name="ONE_DAY_ED_MM" >
									<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="minute" />
										<option value="${minute }" <ui:select v="${ info.ONE_DAY_ED_MM  }" t="${minute }" g="selected"/>>${minute }</option>
									</c:forEach>
									</select> 분
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>상품가격</span></label></th>
	                    		<td>
	                    			<span id="PRD_MST_PRC"><fmt:formatNumber value="${info.PRD_MST_PRC }" groupingUsed="true" /></span>원 / <span id="PRD_MST_ORD_PRC"><fmt:formatNumber value="${info.PRD_MST_ORD_PRC }" groupingUsed="true" /></span>원
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>할인율<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<select class="select">
	                    				<option>정률(%)</option>
	                    				<option>정액(%)</option>
	                    			</select>
	                    			<input type="text" class="text large"> 
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>판매가</span></label></th>
	                    		<td>
	                    			<span id="PRD_MST_PRC2"><fmt:formatNumber value="${info.ERP_MST_SELL_PRC }" groupingUsed="true" /></span>원 / <span id="PRD_MST_ORD_PRC"><fmt:formatNumber value="${info.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /></span>원
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>상품재고</span></label></th>
	                    		<td>
	                    			<span id="PRD_MST_SEL_CNT"><c:out value="${info.PRD_MST_SEL_CNT }"/></span>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>타임세일제목<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" class="text xlarge" id="ONE_DAY_NM" name="ONE_DAY_NM" style="width:80%;" value="<c:out value="${info.ONE_DAY_NM }"/>" maxlength="20"/> (20자이내)
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>사용유무<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<select id="ONE_DAY_USE_YN" name="ONE_DAY_USE_YN" class="select" title="사용유무">
			    						<option value="Y" <ui:select v="${ info.ONE_DAY_USE_YN  }" t="Y" g="selected"/>>사용</option>
			    						<option value="N" <ui:select v="${ info.ONE_DAY_USE_YN  }" t="N" g="selected"/>>미사용</option>
			    					</select>
	                    		</td>
	                        </tr>
	                        <!-- 
	                        <tr>
	                    		<th><label class="label"><span>최종변경일/처리자명</span></label></th>
	                    		<td>
	                    			<ui:formatDate value="${info.ONE_DAY_UPD_DT }" pattern="yyyy.MM.dd"/>/<c:out value="${info.ONE_DAY_UPD_ID }"/>(<c:out value="${info.ONE_DAY_UPD_NM }"/>)
	                    		</td>
	                        </tr> -->
	                    </tbody>
                	</table><!-- // table -->
                </form>
                
                <h3 class="title"><span>태그설정</span></h3>
                
                <form name="frm" enctype="multipart/form-data">
                    <div class="section-form"><!-- section-form-a -->
                        <input type="hidden" name="PLN_PRD_CTG_TOP_NM" value="" />

    			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
    	                    <colgroup>
    	                        <col style="width: 15%;" />
    	                        <col style="width: auto;" />
    	                    </colgroup>
    	                    <tbody>
    	                    	<tr>
    	                    		<th><label class="label"><span>일반 TAG<i class="require"><em>필수입력</em></i></span></label></th>
    	                    		<td>
                                        <ul class="tag_list tag_box">
                                            <li>#오버핏<button type="button" class="btn_del">X</button></li>
                                            <li>#신상품<button type="button" class="btn_del">X</button></li>
                                            <li>#빈티지<button type="button" class="btn_del">X</button></li>
                                            <li>#거울셀카<button type="button" class="btn_del">X</button></li>
                                            <li>#streetstyle<button type="button" class="btn_del">X</button></li>
                                            <li>#루즈핏<button type="button" class="btn_del">X</button></li>
                                            <li>#고상한<button type="button" class="btn_del">X</button></li>
                                            <li>#신상품1<button type="button" class="btn_del">X</button></li>
                                            <li>#가을신상<button type="button" class="btn_del">X</button></li>
                                            <li>#데일리룩<button type="button" class="btn_del">X</button></li>
                                            <li>#ootd<button type="button" class="btn_del">X</button></li>
                                            <li>#비오는날<button type="button" class="btn_del">X</button></li>
                                            <li>#상큼한<button type="button" class="btn_del">X</button></li>
                                            <li>#가을여행<button type="button" class="btn_del">X</button></li>
                                            <li>#오버핏1<button type="button" class="btn_del">X</button></li>
                                            <li>#신상품2<button type="button" class="btn_del">X</button></li>
                                            <li>#빈티지1<button type="button" class="btn_del">X</button></li>
                                            <li>#거울셀카1<button type="button" class="btn_del">X</button></li>
                                            <li>#streetstyle1<button type="button" class="btn_del">X</button></li>
                                            <li>#루즈핏1<button type="button" class="btn_del">X</button></li>
                                            <li>#고상한1<button type="button" class="btn_del">X</button></li>
                                            <li>#신상품3<button type="button" class="btn_del">X</button></li>
                                            <li>#가을신상<button type="button" class="btn_del">X</button></li>
                                            <li>#데일리룩1<button type="button" class="btn_del">X</button></li>
                                            <li>#ootd<button type="button" class="btn_del">X</button></li>
                                            <li>#비오는날1<button type="button" class="btn_del">X</button></li>
                                            <li>#상큼한<button type="button" class="btn_del">X</button></li>
                                            <li>#가을여행<button type="button" class="btn_del">X</button></li>
                                        </ul>
                                        <div class="section-button btn_Regist"><!-- section button -->
                                            <a href="#none" id="goRegist" class="button button-b"><span>선택</span></a>
                                        </div><!-- // section button -->
    	                    		</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label"><span>대표 TAG<i class="require"><em>필수입력</em></i></span></label></th>
    	                    		<td>
                                        <select class="select">
                                            <option value="">선택</option>
                                        </select>
    	                    		</td>
    	                        </tr>
    	                    </tbody>
                    	</table><!-- // table -->
                    </div>
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
var copy_yn = $("#COPY_YN").val();
	
	if(copy_yn=="Y")
	{
		$("#ONE_DAY_ST_DT").val("");
		$("#ONE_DAY_ST_HH").val("");
		$("#ONE_DAY_ST_MM").val("");
		$("#ONE_DAY_ED_HH").val("");
		$("#ONE_DAY_ED_MM").val("");
	}
	
	$(document).on("click", ".search-product-popup", function () {
	    popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    });
	
    fnResultProduct = function(params){
    	$.each(params, function(index,item){
    		$("#PRD_MST_CD").val(item.PRD_MST_CD);
    		$("#PRD_MST_NM").val(item.PRD_MST_NM);
    		$("#PRD_MST_PRC").text(setComma(item.PRD_MST_PRC));
    		$("#PRD_MST_PRC2").text(setComma(item.PRD_MST_PRC));
    		$("#PRD_MST_ORD_PRC").text(setComma(item.PRD_MST_PRC));
    		$("#PRD_MST_SEL_CNT").text(setComma(item.PRD_MST_SEL_CNT));
    		
    		
        });
    	return true;
    };
	
    // 폼체크
    $("#frm").validate({
    	    rules: {
    	    	PRD_MST_CD : { required:true },
            	ONE_DAY_NM : { required:true },
            	ONE_DAY_ST_DT : { required:true },
            	ONE_DAY_ST_HH : { required:true },
            	ONE_DAY_ST_MM : { required:true },
            	ONE_DAY_ED_HH : { required:true },
            	ONE_DAY_ED_MM : { required:true },
            	ONE_DAY_CTS : { required:true }
            }
    });

    // 저장 이벤트
    $(document).on("click", "#goRegist", function () 
    {
    	var $frm = $("#frm"); 
        if($frm.valid()){
        	if(copy_yn=="Y")
        	{
	        	var dt = $("#ONE_DAY_ST_DT").val()+$("#ONE_DAY_ST_HH").val()+$("#ONE_DAY_ST_MM").val();
	        	
	        	var today = getToday();
	     
	        	if(dt < today)
	        	{
	        		alert("적용일자시간은 현재시간 이후여야 합니다.");
	    			$("#ONE_DAY_ST_DT").focus();
	    			return;
	            	
	        	}
        	}
        	var sthhmm = $("#ONE_DAY_ST_HH").val()+$("#ONE_DAY_ST_MM").val();
        	var edhhmm = $("#ONE_DAY_ED_HH").val()+$("#ONE_DAY_ED_MM").val();
        	
        	if(sthhmm >= edhhmm)
        	{
        		alert("적용 종료시간은 시작시간보다 커야 합니다.");
    			$("#ONE_DAY_ED_HH").focus();
    			return;
        	}
            if (confirm( "저장 하시겠습니까?")) {
            	
            	
            	if(copy_yn=="Y")
            	{
            		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/oneDayRegist.do", "target":"_self", "method":"post"}).submit();
            	}
            	else
            	{
            		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/oneDayModify.do", "target":"_self", "method":"post"}).submit();
            	}
            }
        }
    });
        
    // 목록 이벤트
    $(document).on("click", "#goList", function () 
    {
        var $frm = $("#searchForm"); 
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/oneDayList.do", "target":"_self", "method":"post"}).submit();
    });
    
    getToday = function ()
    {
    	var dateObj = new Date();
    	var year = dateObj.getFullYear();
    	var month = dateObj.getMonth()+1;
    	if(month < 10)month = "0"+month;
    	var day = dateObj.getDate();
    	if(day < 10)day = "0"+day;	
    	
    	var hour = dateObj.getHours();
    	if(hour < 10)hour = "0"+hour;	
    	var min = dateObj.getMinutes();
    	if(min < 10)min = "0"+min;	
    	
    	var today = year +"-"+ month +"-"+ day+hour+min;
    	return today;
    };
});
//-->
</script>

</body>
</html>
