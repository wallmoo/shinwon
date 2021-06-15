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
        
            <h2 class="title"><span>매장등록</span></h2>
			
			<form id="searchForm" name="searchForm">
				<input type="hidden" name="SEL_SHP_IDX" value="<c:out value="${row.SEL_SHP_IDX }"/>"/>
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
				<input type="hidden" name="searchAreaCode" value="<c:out value="${commandMap.searchAreaCode }"/>"/>
				<input type="hidden" name="searchKeywordType" value="<c:out value="${commandMap.searchKeywordType }"/>"/>
				<input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
				<input type="hidden" name="searchStoreUseYN" value="<c:out value="${commandMap.searchStoreUseYN }"/>"/>
	           	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
            </form>
            <form name="frm" id="frm" enctype="multipart/form-data">
            	<input type="hidden" name="SEL_SHP_IDX" value="<c:out value="${row.SEL_SHP_IDX }"/>"/>
            	<input type="hidden" name="searchAreaCode" value="<c:out value="${commandMap.searchAreaCode }"/>"/>
				<input type="hidden" name="searchKeywordType" value="<c:out value="${commandMap.searchKeywordType }"/>"/>
				<input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
				<input type="hidden" name="searchStoreUseYN" value="<c:out value="${commandMap.searchStoreUseYN }"/>"/>
            	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
			<table class="table-row table-a">
				<colgroup>
					<col style="width: 15%;">
					<col style="width: 85%;">
				</colgroup>
				<tbody>
					<tr>
						<th><label for="">매장명<i class="require"><em>필수입력</em></i></label></th>
						<td><input type="text" name="SEL_SHP_NM" id="SEL_SHP_NM" value="${row.SEL_SHP_NM }" class="text large"></td>
					</tr>
					<tr>
						<th><label for="">지역<i class="require"><em>필수입력</em></i></label></th>
						<td>
							<select name="SEL_SHP_STATE" id="SEL_SHP_STATE" class="select">
								<c:if test="${not empty codes.AREA_CD }">
								    <c:forEach var="areaRow" items="${ codes.AREA_CD }" varStatus="i">
                                        <option value="<c:out value="${areaRow.CMN_COM_IDX }"/>" <c:if test="${row.SEL_SHP_STATE eq areaRow.CMN_COM_IDX }">selected="selected"</c:if>>
								            <c:out value="${areaRow.CMN_COM_NM }"/>
                                        </option>
								    </c:forEach>
								</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<th><span>전화번호<i class="require"><em>필수입력</em></i></span></th>
						<td>
							<select name="SEL_SHP_TEL1" id="SEL_SHP_TEL1" class="select">
								<c:if test="${not empty codes.TEL_CODE }">
                                    <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
                                        <option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${row.SEL_SHP_TEL1 eq telRow.CMN_COM_NM }">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
                                    </c:forEach>
                                </c:if>
							</select>
							<span>-</span>
							<input type="text" name="SEL_SHP_TEL2" id="SEL_SHP_TEL2" value="${row.SEL_SHP_TEL2 }" class="text">
							<span>-</span>
							<input type="text" name="SEL_SHP_TEL3" id="SEL_SHP_TEL3" value="${row.SEL_SHP_TEL3 }" class="text">
						</td>
					</tr>
					<tr>
						<th><span>매장주소<i class="require"><em>필수입력</em></i></span></th>
						<td>
							<div class="tbl_line">
								<input type="text" name="SEL_SHP_ZIP_NO" id="SEL_SHP_ZIP_NO" value="${row.SEL_SHP_ZIP_NO }" class="text" readonly="readonly">
								<a href="javascript:;" id="zipCheck" class="button button-a"><span>우편번호 찾기</span></a>
							</div>
							<div class="tbl_line">
								<input type="text" name="SEL_SHP_ADDR1" id="SEL_SHP_ADDR1" value="${row.SEL_SHP_ADDR1 }" class="text half" readonly="readonly">
								<input type="text" name="SEL_SHP_ADDR2" id="SEL_SHP_ADDR2" value="${row.SEL_SHP_ADDR2 }" class="text large" placeholder="나머지 주소 입력">
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="">매장 운영시간<i class="require"><em>필수입력</em></i></label></th>
						<td>
							<select id="SHP_ST_HH" name="SHP_ST_HH" class="select">
								<c:forEach begin="11" end="20" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="hour" />
									<option value="${hour }" <c:if test="${row.SHP_ST_HH eq hour}">selected="selected"</c:if> >${hour }</option>
								</c:forEach>
							</select>시
							<select id="SHP_ST_MM" name="SHP_ST_MM" class="select">
								<c:forEach begin="00" end="00" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="minute" />
									<option value="${minute }" <c:if test="${row.SHP_ST_MM eq minute}">selected="selected"</c:if>>${minute }</option>
								</c:forEach>
							</select> 분   ~  
							<select  id="SHP_ED_HH" name="SHP_ED_HH" class="select">
								<c:forEach begin="11" end="20" step="1" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="hour" />
									<option value="${hour }" <c:if test="${row.SHP_ED_HH eq hour}">selected="selected"</c:if>>${hour }</option>
								</c:forEach>
							</select>시
							<select  id="SHP_ED_MM" name="SHP_ED_MM" class="select">
								<c:forEach begin="00" end="00" var="i" varStatus="status">
									<fmt:formatNumber pattern="00" value="${i }" var="minute" />
									<option value="${minute }" <c:if test="${row.SHP_ED_MM eq minute}">selected="selected"</c:if>>${minute }</option>
								</c:forEach>
							</select> 분 
						</td>
					</tr>
					<tr>
						<th><span>사용설정<i class="require"><em>필수입력</em></i></span></th>
						<td>
							<ul class="form_radio_check_list">
								<li>
									<input type="radio" name="SEL_SHP_USE_YN" id="stateA" value="Y" <c:if test="${row.SEL_SHP_USE_YN eq 'Y' }">checked="checked"</c:if> class="radio" checked="checked">
									<label for="stateA">사용</label>
								</li>
								<li>
									<input type="radio" name="SEL_SHP_USE_YN" id="stateB" value="N" <c:if test="${row.SEL_SHP_USE_YN eq 'N' }">checked="checked"</c:if> class="radio">
									<label for="stateB">미사용</label>
								</li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>

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
<link rel="stylesheet" type="text/css" href="<c:out value="${serverDomain}" />/am/css/postAddr.css">
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.blockUI.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/postAddr.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	
	//폼 체크
	$("#frm").validate({
        rules: {
        	SEL_SHP_NM:{required:true},
        	SEL_SHP_STATE:{required:true}, 
        	SEL_SHP_TEL1:{required:true},
        	SEL_SHP_TEL2:{required:true, number:true, minlength:3, maxlength:4},
        	SEL_SHP_TEL3:{required:true, number:true, minlength:3, maxlength:4},
        	SHP_ST_HH : {required:true},
        	SHP_ST_MM : {required:true},
        	SHP_ED_HH : {required:true},
        	SHP_ED_MM : {required:true},
        	SEL_SHP_USE_YN : {required:true}
        },
        messages :{
        	SEL_SHP_NM : {required:"[매장명]은 필수입력 사항입니다."},
        	SEL_SHP_STATE : {required:"[지역]은 필수입력 사항입니다."},
        	SEL_SHP_TEL1 : {required:"[전화번호 앞자리]는 필수 선택사항입니다."},
        	SEL_SHP_TEL2 : {required:"[전화번호 중간자리]는 필수 입력사항입니다."},
        	SEL_SHP_TEL3 : {required:"[전화번호 뒷자리]는 필수 입력사항입니다."},
        	SHP_ST_HH : {required:"[매장 운영시간]은 필수 선택사항입니다."},
        	SHP_ST_MM : {required:"[매장 운영시간]은 필수 선택사항입니다."},
        	SHP_ED_HH : {required:"[매장 운영시간]은 필수 선택사항입니다."},
        	SHP_ED_MM : {required:"[매장 운영시간]은 필수 선택사항입니다."},
        	SEL_SHP_USE_YN : {required:"[사용설정]은 필수 선택사항입니다."}

        }
    });
	
	//등록이벤트
	$(document).on("click", "#goRegist", function () {
        var $frm = $("#frm");
        var $stime = parseInt($("#SHP_ST_HH").val()+$("#SHP_ST_MM").val());
		var $etime = parseInt($("#SHP_ED_HH").val()+$("#SHP_ED_MM").val());

        if($frm.valid()){
        	if ($stime > $etime) {
        		alert("[매장운영시간]이 잘못 입력되었습니다.\n다시 입력해 주십시오.");
				$("#SHP_ST_HH").focus();
				return false;
            }
        	
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/sellerStoreModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
	
	// 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/display/sellerStoreList.do", "target":"_self", "method":"post"}).submit(); 
    });
	
	 // 우편번호 찾기 클릭 이벤트
    $(document).on("click","#zipCheck",function(){
    	daumPost();
    });
 	
});

function daumPost() {
	new daum.Postcode({
		oncomplete : function(data) {
            document.getElementById('SEL_SHP_ZIP_NO').value = data.zonecode;
            document.getElementById("SEL_SHP_ADDR1").value = data.roadAddress;
		}
	}).open();
}
       

//-->
</script>

</body>
</html>
