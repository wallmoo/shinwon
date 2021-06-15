<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
    <a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

    <aside id="navigation"><!-- navigation -->
        <nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
        </nav>
    </aside><!-- // navigation -->

    <div id="body"><!-- body -->

        <section id="contents"><!-- contents -->

            <div id="breadcrumb"><!-- breadcrumb -->
                <a href="#none"><i class="icon-home em"></i> HOME</a>
                &gt;
                <a href="#none">고객센터</a>
                &gt;
                <span>매장개설문의 관리</span>
            </div><!-- // breadcrumb -->
    
            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">매장개설문의 관리</h3>

                <h4 class="title">상세보기</h4>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
	                    <input type="hidden" name="searchRegType" value="<c:out value="${commandMap.searchRegType }"/>"/>
	                    <input type="hidden" name="searchRegTypeKeyword" value="<c:out value="${commandMap.searchRegTypeKeyword }"/>"/>
	                    <input type="hidden" name="searchShpReqReplyYn" value="<c:out value="${commandMap.searchShpReqReplyYn }"/>"/>
                    </form>
                    	
	                    <div class="form-group">
	                        <label class="label" style="width:100%;"><span style="padding-left:50%;">경영주 인적사항</span></label>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>담당자<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_MEMBER_NM}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>생년월일<em class="strong">*</em></span></label>
	                        <div class="field">
	                            <c:out value="${row.SHP_REQ_BIRTH_YEAR}"/>년
	                            <c:out value="${row.SHP_REQ_BIRTH_MONTH}"/>월
	                            <c:out value="${row.SHP_REQ_BIRTH_DAY}"/>일
	                            (${row.SHP_REQ_BIRTH eq 'Y' ? '양력' : '음력'})
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>이메일<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_SEC_EMAIL}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>전화</span></label>
	                        <div class="field">
	                        	<ui:phonenumber phonenumber="${row.SHP_REQ_TEL}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>핸드폰번호</span></label>
	                        <div class="field">
	                        	<ui:phonenumber phonenumber="${row.SHP_REQ_HP}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>재산</span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_ASSET}"/>
	                        </div>
	                    </div>
	                    
	                   	<div class="form-group">
	                        <label class="label"><span>사업목적<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_OBJECT eq 'new' ? '신규창업' : '업종전환'}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>주요경력<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<ui:replaceLineBreak content="${row.SHP_REQ_CAREER}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label" style="width:100%;"><span style="padding-left:50%;">개설 예정지 정보</span></label>
	                    </div>
	                    
						<div class="form-group">
	                        <label class="label"><span>매장<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_SHOP_NM}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>전화</span></label>
	                        <div class="field">
	                        	<ui:phonenumber phonenumber="${row.SHP_REQ_SHOP_TEL}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>주소<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	[<c:out value="${fn:substring(row.SHP_REQ_POST,0,3)}" />-<c:out value="${fn:substring(row.SHP_REQ_POST,3,6)}" />]&nbsp;&nbsp;<c:out value="${row.ADDR }"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>영업면적<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_AREA}"/>평
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>창고면적<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_STORAGE}"/>평
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>전면너비<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_WIDTH}"/>m
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>천정높이<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_HEIGHT}"/>m
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>주차장 확보<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<c:if test="${row.SHP_REQ_PARKING eq 'N'}">무</c:if>
	                        	<c:if test="${row.SHP_REQ_PARKING eq 'Y'}">
	                        	유 / 가능대수 : <c:out value="${row.SHP_REQ_PAK_NUM }"/>
	                        	</c:if>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>사업장형태</span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_BSN_TYPE}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>주 고객층</span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_MAIN_CUST}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>소득 수준</span></label>
	                        <div class="field">
	                        	<c:out value="${row.SHP_REQ_INCOME}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>성장전망 및 지역 특이사항<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<ui:replaceLineBreak content="${row.SHP_REQ_UNUSUAL}"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>주변업체구분 입점현황<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<ui:replaceLineBreak content="${row.SHP_REQ_LANUCHING}"/>
	                        </div>
	                    </div>
                </div><!-- // section-form-a -->
                
                <h4 class="title">상담내용</h4>

                <p>
                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
                </p>
                
                <div class="section-form"><!-- section-form-a -->
                	<form id="frm" name="frm">
                        <input type="hidden" name="SHP_REQ_IDX" value="<c:out value="${row.SHP_REQ_IDX }"/>" />
	                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
	                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
	                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>                    
	                    <input type="hidden" name="searchShpReqReplyYn" value="<c:out value="${commandMap.searchShpReqReplyYn }"/>"/>
	                    <input type="hidden" name="searchRegTypeKeyword" value="<c:out value="${commandMap.searchRegTypeKeyword }"/>"/>
	                    <input type="hidden" name="SHP_REQ_COUNSEL_YN" value="<c:out value="${row.SHP_REQ_COUNSEL_YN }"/>"/>
	                    <input type="hidden" name="SHP_REQ_COUNSEL_ST_DT" value=""/>
	                    <input type="hidden" name="SHP_REQ_COUNSEL_ED_DT" value=""/>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>상담시간<em class="strong">*</em></span></label>
	                        <div class="field">
	                            <input type="text" name="SHP_REQ_COUNSEL_DT" id="SHP_REQ_COUNSEL_DT" class="text datepicker p-datepicker" value="<c:out value="${row.SHP_REQ_COUNSEL_DT }"/>"/>
	                            <select id="SHP_REQ_COUNSEL_ST_DT_hh" name="SHP_REQ_COUNSEL_ST_DT_hh">
	                            	<option value="">선택</option>
	                            	<c:forEach begin="0" end="23" step="1" varStatus="i">
	                            		<c:set var="hh" value="${i.index}"/>
	                            		<c:if test="${i.index < 10}">
	                            			<c:set var="hh" value="0${i.index}"/>
	                            		</c:if>
	                            		<option value="${hh}" <c:if test="${fn:substring(row.SHP_REQ_COUNSEL_ST_DT, 0, 2) eq hh}">selected="selected"</c:if>>${hh}</option>
	                            	</c:forEach>
	                            </select>시
	                            <select id="SHP_REQ_COUNSEL_ST_DT_mm" name="SHP_REQ_COUNSEL_ST_DT_mm">
	                            	<option value="">선택</option>
	                            	<c:forEach begin="0" end="59" step="1" varStatus="i">
	                            		<c:set var="mm" value="${i.index}"/>
	                            		<c:if test="${i.index < 10}">
	                            			<c:set var="mm" value="0${i.index}"/>
	                            		</c:if>
	                            		<option value="${mm}" <c:if test="${fn:substring(row.SHP_REQ_COUNSEL_ST_DT, 2, 4) eq mm}">selected="selected"</c:if>>${mm}</option>
	                            	</c:forEach>
	                            </select>분 ~
	                            <select id="SHP_REQ_COUNSEL_ED_DT_hh" name="SHP_REQ_COUNSEL_ED_DT_hh">
	                            	<option value="">선택</option>
	                            	<c:forEach begin="0" end="23" step="1" varStatus="i">
	                            		<c:set var="hh" value="${i.index}"/>
	                            		<c:if test="${i.index < 10}">
	                            			<c:set var="hh" value="0${i.index}"/>
	                            		</c:if>
	                            		<option value="${hh}" <c:if test="${fn:substring(row.SHP_REQ_COUNSEL_ED_DT, 0, 2) eq hh}">selected="selected"</c:if>>${hh}</option>
	                            	</c:forEach>
	                            </select>시
	                            <select id="SHP_REQ_COUNSEL_ED_DT_mm" name="SHP_REQ_COUNSEL_ED_DT_mm">
	                            	<option value="">선택</option>
	                            	<c:forEach begin="0" end="59" step="1" varStatus="i">
	                            		<c:set var="mm" value="${i.index}"/>
	                            		<c:if test="${i.index < 10}">
	                            			<c:set var="mm" value="0${i.index}"/>
	                            		</c:if>
	                            		<option value="${mm}" <c:if test="${fn:substring(row.SHP_REQ_COUNSEL_ED_DT, 2, 4) eq mm}">selected="selected"</c:if>>${mm}</option>
	                            	</c:forEach>
	                            </select>분
	                            (날짜형식: YYYY-MM-DD)
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>상담내용<em class="strong">*</em></span></label>
	                        <div class="field">
	                        	<textarea class="textarea" name="SHP_REQ_COUNSEL_CONTENTS" id="SHP_REQ_COUNSEL_CONTENTS">${row.SHP_REQ_COUNSEL_CONTENTS}</textarea>
	                        </div>
	                    </div>
	                    
	                    <c:if test="${row.SHP_REQ_COUNSEL_YN eq 'Y' }">
	                    	<div class="form-group">
		                        <label class="label"><span>작성자</span></label>
		                        <div class="field">
	                        		<c:out value="${row.SHP_REQ_UPD_ID }"/>(<c:out value="${row.SHP_REQ_UPD_NM}"/>)
		                        </div>
	                    	</div>
	                    
		                    <div class="form-group">
		                        <label class="label"><span>등록일</span></label>
		                        <div class="field">
									<ui:formatDate value="${row.SHP_REQ_UPD_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
		                        </div>
		                    </div>
	                    </c:if>
                    </form>
                </div>

                <div class="section-button"><!-- section button -->
                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
                    <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
                </div><!-- // section button -->    

            </div><!-- // contents-inner -->

        </section><!-- // contents -->

    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    
    // 폼체크
    $("#frm").validate({
        rules: {
        	SHP_REQ_COUNSEL_DT:{required:true}, // 상담일
        	SHP_REQ_COUNSEL_ST_DT_hh:{required:true}, // 상담시작시간
        	SHP_REQ_COUNSEL_ST_DT_mm:{required:true}, // 상담시작분
        	SHP_REQ_COUNSEL_ED_DT_hh:{required:true}, // 상담끝시간
        	SHP_REQ_COUNSEL_ED_DT_mm:{required:true}, //상담끝분
        	SHP_REQ_REPLY_CONTENTS:{required:true}
        }
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/shopOpenList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        
    	$("input[name='SHP_REQ_COUNSEL_ST_DT']").val($("#SHP_REQ_COUNSEL_ST_DT_hh option:selected").val() + $("#SHP_REQ_COUNSEL_ST_DT_mm option:selected").val());
    	$("input[name='SHP_REQ_COUNSEL_ED_DT']").val($("#SHP_REQ_COUNSEL_ED_DT_hh option:selected").val() + $("#SHP_REQ_COUNSEL_ED_DT_mm option:selected").val());
    	
        if($frm.valid()){
        	var $stime = parseInt($("#SHP_REQ_COUNSEL_ST_DT_hh").val()+$("#SHP_REQ_COUNSEL_ST_DT_mm").val());
        	var $etime = parseInt($("#SHP_REQ_COUNSEL_ED_DT_hh").val()+$("#SHP_REQ_COUNSEL_ED_DT_mm").val());

        	if($stime > $etime)
        	{
        		alert("[상담시간]이 잘못 입력되었습니다. \n 다시 입력해 주십시오.");
        		$("#SHP_REQ_COUNSEL_ST_DT_hh").focus();
        		return false;
        	}
        	
        	if($("#SHP_REQ_COUNSEL_CONTENTS").val() == "")
            {
                alert("[내용]반드시 입력해 주십시오.");
                tinyMCE.get("SHP_REQ_COUNSEL_CONTENTS").focus();
                return;
            } 
        	
			if (confirm( "저장 하시겠습니까?")) 
			{
				$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/board/shopOpenModify.do", "target":"_self", "method":"post"}).submit();
			}
        }
    });
});
</script>
</body>
</html>