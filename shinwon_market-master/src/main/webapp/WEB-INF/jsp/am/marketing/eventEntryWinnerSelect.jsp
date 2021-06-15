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
                <a href="#none">프로모션관리</a>
                &gt;
                <span>이벤트관리</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">이벤트관리</h3>

                <div class="tab-a justified" style="margin-top: 20px;"><!-- tab -->
                    <ul class="tab">
                        <li><a href="#none" id="goBiasicEdit">이벤트정보</a></li>
                        <li class="active"><a href="#none" id="goEventEntryList">응모자확인&당첨자 선정</a></li>
                        <li><a href="#none" id="goEventEntryWinnerList">당첨자발표</a></li>
                    </ul>
                </div><!-- // tab -->
                <h4 class="title">당첨자 선정하기</h4>
                <div class="section-button"><!-- section button -->
					<a href="#none" id="goPopup" class="button button-a"><span>당첨자제외회원보기</span></a>
				</div>
		        <div class="table-a">
	               	<table class="core">
	               		<colgroup>
			               	<col style="width: 20%;" />
			                <col style="width: 15%;" />
			                <col style="width: 30%;" />
			                <col style="width: 35%;" />
			            </colgroup>
		            	<tbody>
		              		<tr>
		               			<td>이벤트명</td>
		               			<td colspan="3" class="left"><c:out value="${info.EVT_MST_TITLE }"/></td>
		               		</tr>
		               		<tr>
		               			<td rowspan="2">선정방법</td>
		               			<td class="left">
		               				<input type="radio" id="lotGbA" name="lotGb" class="radio lotGb" checked="checked" value="A"/>
		               				<label for="lotGbA">자동추첨(1회)</label>
		               			</td>
		               			<td class="left">
		               				<input type="hidden" id="EVT_SVY_CNT" value="<c:out value="${info.EVT_SVY_CNT }"/>"/>
		               				총 응모인원 <b><font color="#EB0000"><c:out value="${info.EVT_SVY_CNT }"/></font></b> 명 중에서 
				                	<input type="number" name="lotCount" id="lotCount" class="number short" value=""/>
				                	명
		               			</td>
		               			<td  class="left">
		               				<a href="javascript:;" id="goExcelDownA" class="button button-a goExcelDown"><span>당첨자 엑셀 다운로드</span></a>
		               			</td>
		               		</tr>
		               		<tr>
		               			<td class="left">
		               				<input type="radio" id="lotGbM" name="lotGb" class="radio lotGb" value="M"/>
		               				<label for="lotGbM">수동추첨</label>
		               			</td>
		             			<td></td>
		               			<td  class="left"><a href="javascript:;" id="goExcelDownM" class="button button-b goExcelDown"><span>응모자 엑셀 다운로드</span></a></td>
		               		</tr>	
		               	</tbody>
	               	</table>
	            </div>
		        <form name="tabForm" id="tabForm">
                	<input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
                    <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPageBasic }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
                </form>
                <form id="frm" name="frm">
		      		<input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
		            <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/>
		            <input type="hidden" name="cPageEntry" value="<c:out value="${commandMap.cPageEntry }"/>"/>
		            <input type="hidden" name="cPageBasic" value="<c:out value="${commandMap.cPageBasic }"/>"/>
		            <input type="hidden" name="pageSizeBasic" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
		            <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
		            <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
		            <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
		            <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
		            <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
		            <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
		            <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
		        </form>
		        <form name="excelForm" id="excelForm">
		        	<input type="hidden" name="lotGb" id="lotGb" value="" />
		        	<input type="hidden" name="lotCnt" id="lotCnt" value="0" />
		        	<input type="hidden" name="lotTotalCnt" id="lotTotalCnt" value="<c:out value="${info.EVT_SVY_CNT }"/>" />
                    <input type="hidden" name="EVT_MST_IDX" value="<c:out value="${commandMap.EVT_MST_IDX }"/>" />
                    <input type="hidden" name="EVT_MST_TYPE" value="<c:out value="${commandMap.EVT_MST_TYPE }"/>"/>
                </form>
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
    
    // 목록버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventList.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 기본정보 탭 클릭 이벤트
    $(document).on("click", "#goBiasicEdit", function () {
        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/eventEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 응모자 탭 클릭 이벤트
    $(document).on("click", "#goEventEntryList", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryList.do", "target" : "_self", "method" : "post"}).submit();
    });
    
 // 당첨자 탭 클릭 이벤트
    $(document).on("click", "#goEventEntryWinnerList", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventEntryWinnerList.do", "target" : "_self", "method" : "get"}).submit();
    });
    
    // 페이지 이동
    $(document).on("click", ".goExcelDown", function () {
    	var lotGb = $("input[name='lotGb']:checked").val();
    	var lotCount = $("#lotCount").val();
    	var EVT_SVY_CNT = parseInt($("#EVT_SVY_CNT").val());
    	var lotCountNum = 0;
    	if(parseInt(EVT_SVY_CNT) == 0)
    	{
    		alert("응모자가 0입니다.");
			return;
    	}
    	
    	if(lotGb == "A")
    	{
    		if(lotCount == "")
    		{
    			alert("추첨인원을 입력해 주십시오.");
    			$("#lotCount").focus();
    			return;
    		}
    		else
    		{
    			lotCountNum = parseInt($("#lotCount").val());	
    			if(lotCountNum > EVT_SVY_CNT)
    			{
    				alert("응모인수 보다 추첨인수가 더 많습니다.");
        			$("#lotCount").focus();
        			return;
    			}
    		}
    	}
     	
    	$("#lotGb").val(lotGb);
    	$("#lotCnt").val(lotCount);
    	
    	
    	$("#excelForm").attr({"action": "<c:out value="${serverDomain}" />/am/marketing/eventEntryListExcelDownload.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    $(document).on("click", "#goPopup", function () {
		popup("<c:out value="${serverDomain}" />/am/marketing/eventExceptMemberPopup.do", "800", "800", "yes", "eventExceptMember");
	});
    
    $(document).on("click", ".lotGb", function () {
    	var lotGb = $("input[name='lotGb']:checked").val();
    	if(lotGb=="A")
    	{
    		$("#goExcelDownA").show();
    		$("#goExcelDownM").hide();
    	}else
    	{
    		$("#goExcelDownA").hide();
    		$("#goExcelDownM").show();
    	}
    	
	});
    
    $("#goExcelDownM").hide();
    
    
});
</script>
</body>
</html>