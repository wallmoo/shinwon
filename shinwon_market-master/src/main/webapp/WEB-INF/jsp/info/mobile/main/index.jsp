<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">

	<header id="header" class="header" data-role="header">
		<div class="btn_l">
            <a href="<c:out value="${mobileBrandDomain}" />/info/mobile/branch/branchList.do" class="shop"><span class="blind">마켓플랜트 매장</span></a>
		</div>
		
		<h1 class="logo"><a href="javascript:;"><span class="ir">마켓플랜트 price KING</span></a></h1>
		
		<div class="btn_r">
            <a href="#infoGnb" class="nav-view js-toggler"><i class="icon"><span class="blind">마켓플랜트소개 메뉴 <em>열기</em></span></i></a>
		</div>

        <div id="infoGnb"><!-- #infoGnb -->
            <div class="gnb-wrap" data-role="collapsible-set">
                <div class="section" data-role="collapsible" data-collapsed="true">
                    <h3>마켓플랜트 소개<i><!-- icon --></i></h3>
                    <ul>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/intro/introCompany') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introCompany.do">브랜드 스토리</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/intro/introBI') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introBI.do">BI소개</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/intro/introPrize') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introPrize.do">수상내역</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/intro/introPress') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introPress.do">보도자료</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/intro/introPosition') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introPosition.do">본사위치</a></li>
                    </ul>
                </div>
                <div class="section" data-role="collapsible" data-collapsed="true">
                    <h3>지점안내<i><!-- icon --></i></h3>
                     <ul>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/branch/branchList') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/branch/branchList.do">지점안내</a></li>
                    </ul>
                </div>
                <div class="section" data-role="collapsible" data-collapsed="true">
                    <h3>멤버십가이드<i><!-- icon --></i></h3>
                    <ul>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/membership/membershipGuide') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/membership/membershipGuide.do">멤버십안내</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/membership/membershipGrade') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/membership/membershipGrade.do">등급별혜택</a></li>
                    </ul>
                </div>
                <div class="section" data-role="collapsible" data-collapsed="true">
                    <h3>고객지원센터<i><!-- icon --></i></h3>
                    <ul>
                         <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/support/supportNotice') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportNotice.do">공지사항</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/support/supportPraise') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportPraise.do">마켓플랜트 칭찬하기</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/support/supportCounsel') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportCounsel.do">상담하기</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/support/supportFAQ') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportFAQ.do">FAQ</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/support/supportAS') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportAS.do">A/S센터 안내</a></li>
                    </ul>
                </div>
                <div class="section" data-role="collapsible" data-collapsed="true">
                    <h3>채용정보<i><!-- icon --></i></h3>
                    <ul>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/recruit/recruitModel') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/recruit/recruitModel.do">인재상</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/recruit/recruitWelfare') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/recruit/recruitWelfare.do">인사/복리후생</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/recruit/recruitJob') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/recruit/recruitJob.do">직무소개</a></li>
                    </ul>
                </div>
            </div>
            <div class="overlay"><!-- overlay --></div>
        </div><!-- // #infoGnb -->
	</header>
	<!--// #header E -->
	
	<article id="container" class="container" data-role="content">

        <div class="main-visual"><!-- main-visual -->
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
            		<img src="<c:out value="${cdnDomain}" />/mobile/img/custom/info_main_a.png" alt="" />
				</c:otherwise>
			</c:choose>
        </div><!-- // main-visual -->

        <div class="main-slide"><!-- main-slide -->
            <ul id="slider">
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
        </div><!-- // main-slide -->

        <div class="main-banner"><!-- main-banner -->
            <a href="<c:out value="${mobileBrandDomain}" />/info/mobile/membership/membershipGuide.do"><img src="<c:out value="${cdnDomain}" />/mobile/img/custom/info_main_membership.jpg" alt="" /></a>
        </div><!-- // main-banner -->

        <div class="main-branch"><!-- main-branch -->
            <div class="desc">
               	<img src="<c:out value="${cdnDomain}" />/mobile/img/custom/info_main_branch.jpg" alt="" />
            </div>
            <div class="core">
                <h4 class="title">지역검색</h4>
                <div class="search-form-a">
                    <label for="searchShpMstArea" class="sel_box_st0">
                        <select id="searchShpMstArea" class="select" title="시/도">
                            <option value="">시/도</option>
                            <c:forEach var="codeRow" items="${areaCodeList }" varStatus="i">
	                    		<option value="<c:out value="${codeRow.CMN_COM_IDX }"/>">
	                        		<c:out value="${codeRow.CMN_COM_NM }"/>
	                         	</option>
	                        </c:forEach>
                        </select>
                    </label>
                    <label for="searchShpMstAreaSub" class="sel_box_st0">
                        <select id="searchShpMstAreaSub" class="select" title="구/군">
                            <option value="">구/군</option>
                        </select>
                    </label>
                    <a href="javascript:goBranch('zone');" class="button primary small"><span>검색하기</span></a>
                </div>
                <h4 class="title">명칭검색</h4>
                <div class="search-form-b">
                    <input type="text" id="searchWord" name="searchWord" class="text" placeholder="명칭으로 검색해주세요." title="명칭으로 검색해주세요.">
                    <a href="javascript:goBranch('name');" class="button primary small"><span>검색하기</span></a>
                </div>
            </div>
        </div><!-- // main-branch -->

        <div class="main-notice"><!-- main-notice -->
            <h3 class="reset"><span class="large18">공지사항</span></h3>
            <ul class="reset">
	            <c:forEach var="row" items="${noticeList }" varStatus="i">
	            	<li>
	                	<a href="javascript:goNotice(<c:out value="${row.DRT_NTS_IDX}" />)"><c:out value="${row.DRT_NTS_TITLE}" /></a>
	                    <p class="reset date"><c:out value="${row.DRT_NTS_REG_DT}" /></p>
	                </li>
	            </c:forEach>
            </ul>
            <a href="<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportNotice.do" class="button primary small"><span>MORE</span></a>
        </div><!-- // main-notice -->

        <div class="main-links"><!-- main-links -->
            <div class="col recruit">
                <a href="http://www.epasscni.com" target="_blank" title="새 창 열림">
                    <i class="icon"><!-- icon --></i>
                    <p class="large16">마켓플랜트와 함께할<br /><span class="warning">인재</span>를 찾습니다.</p>
                </a>
            </div>
            
            <div class="col customer">
                <i class="icon"><!-- icon --></i>
                <p><strong>마켓플랜트 직영점 고객센터</strong></p>
                <p><a href="#" class="link_tel"><strong class="warning large16"></strong></a></p>
                <p class="small">평일 09:30 ~18:30 토/일/공휴일 09:30 ~17:30</p>
            </div>
        </div><!-- // main-links -->
			
	</article>
	<!--// #container E -->
    <form name="searchform" id="searchform">
		<input type="hidden" id="SHP_MST_AREA" name="SHP_MST_AREA" />
		<input type="hidden" id="SHP_MST_AREA_SUB" name="SHP_MST_AREA_SUB"/>
		<input type="hidden" id="SEARCH_WORD" name="SEARCH_WORD"/>
		<input type="hidden" id="DRT_NTS_IDX" name="DRT_NTS_IDX"/>
	</form>
 
<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>
</section>
<!--// #wrap E -->
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){

    // slide
    $('#slider').bxSlider({
		controls: false
    });
	
    <c:if test="${midTotalCount eq 1}">
    $.each($('#slider'), function(i){
    	$(this).parent().next('.bx-controls').css('display', 'none');  
    });
    </c:if>
});

getSubCodeList = function(code)
{
	var $frm = $("#frm");
	$.ajax({
        type	: "POST",
        url : "<c:out value="${mobileBrandDomain}" />/info/mobile/branch/getSubCodeAjax.do",
        data	:  { "code":code},
        dataType : "JSON",
        async   : false,
        success	: function(data)
        {
        	var selected = "";
        	var html	= "";
            //$("#searchShpMstAreaSub").empty().append("<option value=''>구/군</option>");
            html	= "<option value=''>구/군</option>";
            $.each(data.list, function(i,item) 
            {  
             	//$("#searchShpMstAreaSub").append("<option value='"+item.CMN_COM_NM+"'>"+item.CMN_COM_NM+"</option>");
             	html += '<option value="'+item.CMN_COM_NM+'">'+item.CMN_COM_NM+'</option>';
            	 
            });
            $("#searchShpMstAreaSub").html(html);
            //com.sel_chg($("#searchShpMstAreaSub"), 'chg');
        },
        error   : function(xhr,status,error)
        {    
            alert("코드 호출 중 에러가 발생하였습니다.");
            //alert("code:"+xhr.status); 
        }
    });

};

$(document).on("change", "#searchShpMstArea", function (){
 	var code = $("#searchShpMstArea").val();
	getSubCodeList(code);
	$("#searchShpMstAreaSub").val("").change();
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
	
	$frm.attr({"action":"<c:out value="${mobileBrandDomain}" />/info/mobile/branch/branchList.do", "target":"_self", "method":"post"}).submit();
	
};


$(document).on("keydown", "#searchWord", function (e) {
    if(e.keyCode == 13){
    	goBranch();
    }
});

function goNotice(DRT_NTS_IDX){
	var $frm = $("#searchform");
	$("#DRT_NTS_IDX").val(DRT_NTS_IDX);
	
	if(DRT_NTS_IDX=="107"){
		alert("사진 다운로드는 PC에서만 가능합니다.");
		
	}else
	{
		$frm.attr({"action":"<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportNoticeView.do", "target":"_self", "method":"post"}).submit();
	
	}
	
	
	
};
</script>
</body>
</html>