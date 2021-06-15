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

            <div class="container"><!-- container -->

                <h2 class="title"><span>배송업체 관리</span></h2>

                <h3 class="title"><span>수정</span></h3>
                
                <p>
                    <i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
                </p>

                <form id="searchForm">
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                 	<input type="hidden" name="searchDlvCpnNm" value="<c:out value="${commandMap.searchDlvCpnNm }"/>"/>
                 	<input type="hidden" name="searchDlvCpnOnYn" value="<c:out value="${commandMap.searchDlvCpnOnYn }"/>"/>
                 	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>
 
                <form id="frm" name="frm" >
                	<input type="hidden" name="DLV_CPN_IDX" value="<c:out value="${row.DLV_CPN_IDX }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchDlvCpnNm" value="<c:out value="${commandMap.searchDlvCpnNm }"/>"/>
                    <input type="hidden" name="searchDlvCpnOnYn" value="<c:out value="${commandMap.searchDlvCpnOnYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>배송업체명 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="DLV_CPN_NM" id="DLV_CPN_NM" class="text" value="<c:out value="${row.DLV_CPN_NM }"/>" maxlength="30"/>
                                </td>
                            </tr>  
                            <tr>
                                <th><span>안내 전화번호 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="DLV_CPN_TEL" id="DLV_CPN_TEL" class="text number large" value="<c:out value="${row.DLV_CPN_TEL }"/>" maxlength="15"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>배송추적 URL <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="DLV_CPN_URL" id="DLV_CPN_URL" class="text large" value="<c:out value="${row.DLV_CPN_URL }"/>" maxlength="200" style="width:90%;"/>
                                </td>
                            </tr>
                            <tr>  
                                <th><span>상태 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" id="stateA" name="DLV_CPN_ON_YN" value="Y" class="radio" <c:if test="${row.DLV_CPN_ON_YN eq 'Y' }">checked="checked"</c:if>/>
	                                <label for="stateA">사용</label>
	                                <input type="radio" id="stateB" name="DLV_CPN_ON_YN" value="N" class="radio" <c:if test="${row.DLV_CPN_ON_YN eq 'N' }">checked="checked"</c:if>/>
	                                <label for="stateB">미사용</label>
                                </td>
                            </tr>
                            <tr>
                            	<th><span class="in_block">배송사코드<i class="require"><em>필수입력</em></i></span>
                                    <div class="tooltip-area">
                                    	<button type="button" class="tooltip-open" title="툴팁"><span>?</span></button>
                                    		<!-- TOOLTIP -->
                                    		<div class="tooltip-layer left top">
                                    			<div class="tooltip-con mt10">
                                    				<table class="table-row table-a">
														<thead>
															<tr>
																<th>코드</th>
																<th>택배사</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>DC01</td>
																<td>대한통운</td>
															</tr>
															<tr>
																<td>DC02</td>
																<td>CJGLS</td>
															</tr>
															<tr>
																<td>DC03</td>
																<td>SC로지스</td>
															</tr>
															<tr>
																<td>DC04</td>
																<td>옐로우캡</td>
															</tr>
															<tr>
																<td>DC05</td>
																<td>로젠택배</td>
															</tr>
															<tr>
																<td>DC06</td>
																<td>동부익스프레스택배</td>
															</tr>
															<tr>
																<td>DC07</td>
																<td>우체국택배</td>
															</tr>
															<tr>
																<td>DC08</td>
																<td>한진택배</td>
															</tr>
															<tr>
																<td>DC09</td>
																<td>현대택배</td>
															</tr>
															<tr>
																<td>DC10</td>
																<td>KGB택배</td>
															</tr>
															<tr>
																<td>DC11</td>
																<td>하나로택배</td>
															</tr>
															<tr>
																<td>DC13</td>
																<td>기타</td>
															</tr>
														</tbody>
													</table>
                                    			</div>
                                    		</div>
                                    		<!-- //TOOLTIP -->
                                    	</div>
                                    </th>
                            	<td>
                            		<input type="text" name="DLV_CPN_ESC_CD" id="DLV_CPN_ESC_CD" class="text" maxlength="4" value=""/>	
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
                
            </div><!-- // container -->

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
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>

<script>    
$(function(){  
        
	// 폼체크
    $("#frm").validate({
        rules:{
            DLV_CPN_NM:{required:true }, // 배송업체 명
            DLV_CPN_URL:{required:true, url:true }, // 배송업체 URL
            DLV_CPN_ON_YN:{required:true }, // 사용 유무
            DLV_CPN_ESC_CD:{required:true } // KICC 배송사 코드
        }
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/delivCompanyList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        if($frm.valid()){
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/delivCompanyModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
    
    // tooltip 
    $(".tooltip-open").click(function (){
      	$(".tooltip-layer").toggle();
      });
    
});
</script>

</body>
</html>
