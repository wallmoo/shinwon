<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/include/head.jsp" %>
</head>
<body class="page-info-main">

<div id="skipNavigation"><!-- #skipNavigation -->
    <a href="#contents">컨텐츠 바로가기</a>
</div><!-- #skipNavigation -->

<%@ include file="/WEB-INF/jsp/info/include/top.jsp" %>



<div id="container"><!-- #container -->
    
    <h2 class="semantic">컨텐츠 영역</h2>

    <div id="visual"><!-- #visual -->
    	<div class="slider"><!-- slider -->
			<ul>
				<c:choose>
    				<c:when test="${not empty top }">
    					<c:forEach var="row" items="${top }">
    						<c:if test="${row.BNR_MST_TGT eq 'D'}">
    							<li><img src="<c:out value="${cdnDomain}${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"></li>
    						</c:if>
    						<c:if test="${row.BNR_MST_TGT eq 'S'}">
    							<li><a href="<c:out value="${row.BNR_MST_URL }" />"><img src="<c:out value="${cdnDomain}${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"></a></li>
    						</c:if>
    						<c:if test="${row.BNR_MST_TGT eq 'N'}">
    							<li><a href="<c:out value="${row.BNR_MST_URL }" />" target="_blank"><img src="<c:out value="${cdnDomain}${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"></a></li>
    						</c:if>
    					</c:forEach>
    				</c:when>
    				<c:otherwise>
        				<li><img src="<c:out value="${cdnDomain}" />/pc/img/info/visual_main.jpg" alt="마켓플랜트"></li>
        			</c:otherwise>
        		</c:choose>
			</ul>
		</div><!-- // slider -->
    </div><!-- // #visual -->

    <div class="wrap">

        <div class="contents-main"><!-- section-a -->
            <div class="grid">
                <div class="col col-1-3 nth-child-1 branch"><!-- branch -->
                    <div class="module">
                        <div class="desc">
                            <h3 class="reset"><span class="large24">가까운 지점 찾기</span></h3>
                            <p class="reset mt10">
                                마켓플랜트는 전국 100여개의 지점을<br />
                                운영하고 있습니다.<br />
                                가까운 지점을  찾아보세요!
                            </p>
                            <i class="icon"><!-- icon --></i>
                        </div>
                        <div class="core">
                            <h4 class="title">지역검색</h4>
                            <div class="search-form-a">
                                <select id="searchShpMstArea" class="sel_chg" title="시/도">
                                    <option value="">시/도</option>
                                    <c:forEach var="codeRow" items="${areaCodeList }" varStatus="i">
	                    	            <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>">
	                        	            <c:out value="${codeRow.CMN_COM_NM }"/>
	                                    </option>
	                                </c:forEach>
                                </select>
                                <select id="searchShpMstAreaSub" class="sel_chg" title="구/군">
                                    <option value="">구/군</option>
                                </select>
                                <a href="javascript:goBranch('zone');" class="button primary"><span>검색하기</span></a>
                            </div>
                            <h4 class="title">명칭검색</h4>
                            <div class="search-form-b">
                                <input type="text" class="text" id="searchWord"placeholder="명칭으로 검색해주세요." title="명칭으로 검색해주세요.">
                                <a href="javascript:goBranch('name');" class="button primary small"><span>검색</span></a>
                            </div>
                        </div>
                    </div>
                </div><!-- // branch -->
                <div class="col col-1-3 nth-child-2">
                    <div class="module">
                        <div class="slider"><!-- slider -->
                            <ul class="tab">
                            	<c:forEach var="row" items="${mid }">
		    						<c:if test="${row.BNR_MST_TGT eq 'D'}">
		    							<li><img src="<c:out value="${cdnDomain}${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"></li>
		    						</c:if>
		    						<c:if test="${row.BNR_MST_TGT eq 'S'}">
		    							<li><a href="<c:out value="${row.BNR_MST_URL }" />"><img src="<c:out value="${cdnDomain}${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"></a></li>
		    						</c:if>
		    						<c:if test="${row.BNR_MST_TGT eq 'N'}">
		    							<li><a href="<c:out value="${row.BNR_MST_URL }" />" target="_blank"><img src="<c:out value="${cdnDomain}${row.FILE_NM }" />" alt="<c:out value="${row.CMN_FLE_ALT_TXT }" />"></a></li>
		    						</c:if>
		    					</c:forEach>
                            </ul>
                        </div><!-- // slider -->

                        <div class="notice"><!-- notice -->
                            <h3 class="reset">공지사항</h3>
                            <ul class="reset">
                            <c:forEach var="row" items="${noticeList }" varStatus="i">
                                <li>
                                    <a href="<c:out value="${brandDomain}" />/info/support/supportNoticeView.do?DRT_NTS_IDX=<c:out value="${row.DRT_NTS_IDX}" />"><c:out value="${row.DRT_NTS_TITLE}" /></a>
                                    <p class="reset date"><c:out value="${row.DRT_NTS_REG_DT}" /></p>
                                </li>
                            </c:forEach>
                            
                            </ul>
                            <a href="<c:out value="${brandDomain}" />/info/support/supportNotice.do" class="button primary small"><span>more</span></a>
                        </div><!-- // notice -->
                    </div>
                </div>
                <div class="col col-1-3 nth-child-3">
                    <div class="module">
                        <div class="banner"><!-- banner -->
                            <a href="<c:out value="${brandDomain}" />/info/membership/membershipGuide.do"><img src="<c:out value="${cdnDomain}" />/pc/img/info/main_c.png" alt="마켓플랜트  멤버십안내 마켓플랜트  고객만을 위한 차별화된 프리미엄 혜택!" /></a>
                        </div><!-- // banner -->

                        <div class="links"><!-- links -->
                            <ul class="reset">
                                <li class="nth-child-1">
                                    <a href="http://www.epasscni.com" target="_blank" title="새 창 열림">
                                        <i class="icon"><!-- icon --></i>
                                        <p class="large16">마켓플랜트와 함께하실<br />비즈니스 파트너를 찾습니다.</p>
                                    </a>
                                </li>
                                <li class="nth-child-2">
                                    <a href="http://www.epasscni.com" target="_blank" title="새 창 열림">
                                        <i class="icon"><!-- icon --></i>
                                        <p class="large16">마켓플랜트와 함께할<br />인재를 찾습니다.</p>
                                    </a>
                                </li>
                                <li class="nth-child-3">
                                    <i class="icon"><!-- icon --></i>
                                    <p class="large16">마켓플랜트 직영점 고객센터</p>
                                    <p class="large20"><span class="warning"></span></p>
                                    <p class="small">
                                        평일 09:30 ~ 18:30<br />
                                        토/일/공휴일 09:30 ~ 17:30
                                    </p>
                                </li>
                            </ul>
                        </div><!-- // links -->
                    </div>
                </div>
            </div>
        </div><!-- // section-a -->

    </div>
    <form name="searchform" id="searchform">
		<input type="hidden" id="SHP_MST_AREA" name="SHP_MST_AREA" />
		<input type="hidden" id="SHP_MST_AREA_SUB" name="SHP_MST_AREA_SUB"/>
		<input type="hidden" id="SEARCH_WORD" name="SEARCH_WORD"/>
	</form>
	    
</div><!-- // #container -->
 
<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function(){

	 // slide
    var _slider = $('.slider ul');
    
    $(_slider).bxSlider({
            mode:'fade',
            controls: false,
            auto:true,
            speed: 1000,
            pause: 3000
    });

    $.each(_slider, function(i){
    	if($(this).find('li').length <= 1)  $(this).parent().next('.bx-controls').css('display', 'none');  
    });

});

getSubCodeList = function(code)
{
	var $frm = $("#frm");
   
	$.ajax({
        type	: "POST",
        url : "<c:out value="${brandDomain}" />/info/branch/getSubCodeAjax.do",
        data	:  { "code":code},
        dataType : "JSON",
        async   : false,
        success	: function(data)
        {
        	var selected = "";
            $("#searchShpMstAreaSub").empty().append("<option value=''>구/군</option>");
            $.each(data.list, function(i,item) 
            {  
             	$("#searchShpMstAreaSub").append("<option value='"+item.CMN_COM_NM+"'>"+item.CMN_COM_NM+"</option>");
            	 
            });
            com.sel_chg($("#searchShpMstAreaSub"), 'chg');
        },
        error   : function(xhr,status,error)
        {    
            alert("코드 호출 중 에러가 발생하였습니다.");
            //alert("code:"+xhr.status); 
        }
    });

};

$(document).on("click", "#searchShpMstArea", function (){
 	var code = $("#searchShpMstArea").val();
 	$("#searchShpMstAreaSub").val("").change();
	getSubCodeList(code);
});

function goBranch(type){
	var $frm = $("#searchform");
	
	var searchShpMstArea = $("#searchShpMstArea").val();
	var searchShpMstAreaSub = $("#searchShpMstAreaSub").val();
	var searchWord = $("#searchWord").val();
	
	if(type == 'zone'){
		if(searchShpMstArea == ""){
			alert("시/도를 선택하세요.");
			return;
		}
		if(searchShpMstAreaSub == ""){
			alert("구/군을 선택하세요.");
			return;
		}
	}else{
		if(searchWord == ""){
			alert("명침을 입력하세요.");
			return;
		}
	}
	
	$("#SHP_MST_AREA").val(searchShpMstArea);
	$("#SHP_MST_AREA_SUB").val(searchShpMstAreaSub);
	$("#SEARCH_WORD").val(searchWord);
	
	$frm.attr({"action":"<c:out value="${brandDomain}" />/info/branch/branchList.do", "target":"_self", "method":"post"}).submit();
	
};

$(document).on("keydown", "#searchWord", function (e) {
    if(e.keyCode == 13){
    	goBranch();
    }
});
</script>
</body>
</html>