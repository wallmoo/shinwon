<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/include/head.jsp" %>
</head>
<body class="page-branch">
<div id="skipNavigation"><!-- #skipNavigation -->
    <a href="#contents">컨텐츠 바로가기</a>
</div><!-- #skipNavigation -->
 
<%@ include file="/WEB-INF/jsp/info/include/top.jsp" %>

<div id="container"><!-- #container -->
    
    <h2 class="semantic">컨텐츠 영역</h2>

    <div id="visual"><!-- #visual -->
        <div class="wrap">
            <strong>지점안내</strong>
        </div>
    </div><!-- // #visual -->

   <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <strong>지점안내</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">
        <div id="contents"><!-- #contents -->

             <h3 class="title">지점안내</h3>
                
            <hr class="hr-a" />

            <p class="ti_history">
				<span class="warning">전국 어디서나 마켓플랜트 을 만날 수 있습니다.<br/></span>
				<span class="large18">원하는 지점을 찾거나 내 주변 가까운 지점을 찾아주세요.</span>
			</p>

			<div class="map_d">
				<div class="tel_time">
					<p class="tx_tel">
						<span>마켓플랜트 직영점 고객센터</span>
						<strong></strong>
					</p>
					<p class="tx_time">
						<span>평일</span>
						<span>09:30 ~ 18:30</span>
					</p>
					<p class="tx_time">
						<span>토/일/공휴일</span>
						<span>09:30 ~ 17:30</span>
					</p>
				</div>


            <div class="grid branch-wrap"><!-- branch-wrap -->
                <div class="col region">
                    <div class="module">
                        <h4 class="title">원하는 지역 선택</h4>
                        <div class="map">

                            <div class="module" id="mapDiv">
                                <img src="<c:out value="${cdnDomain}" />/pc/img/info/spacer.gif" usemap="#map"  alt="" class="spacer" />
                                <span class="seoul">서울</span>
                                <span class="incheon">인천</span>
                                <span class="gyeonggi">경기도</span>
                                <span class="kangwon">강원도</span>
                                <span class="chungnam">충청남도</span>
                                <span class="chungbuk">충청북도</span>
                                <span class="daejeon">대전</span>
                                <span class="gyeongbuk">경상북도</span>
                                <span class="jeonbuk">전라북도</span>
                                <span class="daegu">대구</span>
                                <span class="gwangju">광주</span>
                                <span class="jeonnam">전라남도</span>
                                <span class="gyeongnam">경상남도</span>
                                <span class="ulsan">울산</span>
                                <span class="busan">부산</span>
                                <span class="jeju">제주도</span>
                                <map id="map" name="map">
                                    <area alt="제주도" data-code="2409" class="jeju" href="javascript:;" shape="poly" coords="91,305,83,308,70,308,52,317,51,326,63,330,78,330,96,320,98,313,92,305"/>
                                    <area alt="광주" data-code="2401" class="gwangju" href="javascript:;" shape="poly" coords="102,237,95,230,81,235,81,242,95,247,100,243,102,238"/>
                                    <area alt="전라남도" data-code="2404" class="jeonnam" href="javascript:;" shape="poly" coords="103,230,111,228,116,229,130,226,132,238,142,249,143,263,142,271,135,275,125,272,127,277,128,284,125,287,120,282,116,283,114,287,111,287,103,295,88,291,84,297,79,293,66,291,63,286,60,290,51,290,53,298,46,297,43,303,36,303,35,289,44,278,43,274,36,270,36,263,44,250,46,246,41,238,47,236,53,239,60,238,58,234,60,230,66,218,70,223,71,229,85,222,87,234,83,235,80,233,80,240,83,244,95,248,98,247,103,236,99,233,94,231,88,233,86,221,86,219,89,218,101,222,103,230"/>
                                    <area alt="경상남도" data-code="2402" class="gyeongnam" href="javascript:;" shape="poly" coords="134,223,129,226,133,239,141,250,144,264,149,264,155,268,160,259,171,259,172,265,189,268,197,248,192,245,184,251,178,247,180,242,192,239,198,240,199,234,219,221,207,214,209,207,205,206,198,211,189,212,182,207,167,209,164,207,162,197,143,190,131,206,131,213,134,223"/>
                                    <area alt="부산" data-code="2398" class="busan" href="javascript:;" shape="poly" coords="221,229,221,236,205,245,201,245,197,249,192,245,185,251,178,247,180,242,192,239,198,240,199,234,217,222,221,228"/>
                                    <area alt="울산" data-code="2400" class="ulsan" href="javascript:;" shape="poly" coords="223,208,219,200,209,205,207,214,219,221,217,223,222,229,227,227,228,218,232,216,233,206,228,204,223,208"/>
                                    <area alt="전라북도" data-code="2405" class="jeonbuk" href="javascript:;" shape="poly" coords="89,183,82,186,72,185,71,189,77,193,75,200,68,206,70,213,66,219,71,224,72,228,88,217,100,223,103,230,111,228,117,229,134,224,131,211,131,206,143,189,143,183,132,181,132,185,125,188,121,183,115,178,103,183,102,181,100,174,93,176,89,183"/>
                                    <area alt="대구" data-code="2399" class="daegu" href="javascript:;" shape="poly" coords="181,202,175,207,182,207,186,210,185,205,191,203,196,196,195,190,190,187,184,192,180,192,177,196,181,202"/>
                                    <area alt="대전" data-code="2635" class="daejeon" href="javascript:;" shape="poly" coords="128,163,124,167,124,173,115,173,112,169,113,162,117,156,125,157,128,163"/>
                                    <area alt="충청남도" data-code="2406" class="chungnam" href="javascript:;" shape="poly" coords="122,137,117,131,106,125,92,129,71,118,58,121,47,140,50,146,55,141,59,152,56,159,71,167,69,177,76,182,76,186,88,184,93,175,100,175,102,183,114,178,118,179,124,187,132,185,134,181,132,180,130,171,125,170,125,172,116,173,113,171,112,161,115,156,120,156,119,151,112,145,116,138,122,137"/>
                                    <area alt="충청북도" data-code="2407" class="chungbuk" href="javascript:;" shape="poly" coords="174,134,175,125,182,119,170,115,163,109,156,111,150,108,144,115,138,114,118,130,123,136,122,138,116,138,112,145,120,151,120,155,126,157,127,163,123,168,124,169,131,171,132,179,135,182,145,183,150,175,157,172,142,165,144,160,146,154,141,146,156,133,165,131,173,135,174,134"/>
                                    <area alt="경상북도" data-code="2403" class="gyeongbuk" href="javascript:;" shape="poly" coords="230,183,236,177,236,189,231,204,226,203,223,207,221,200,211,202,208,205,200,207,199,210,190,211,185,208,187,205,192,203,198,196,193,187,190,187,184,190,178,191,176,196,179,202,175,207,168,208,164,207,164,199,162,196,143,189,143,184,146,183,151,175,158,172,143,164,147,154,143,147,156,134,165,131,173,136,175,133,176,124,183,119,185,117,192,118,196,115,198,119,206,116,215,118,220,111,224,112,227,119,227,129,229,143,227,146,230,160,226,166,226,172,226,181,230,183"/>
                                    <area alt="인천" data-code="2397" class="incheon" href="javascript:;" shape="poly" coords="81,82,78,87,74,87,73,79,74,74,67,67,62,70,56,70,56,77,52,80,52,84,61,88,61,94,66,100,61,103,47,101,42,101,38,109,42,113,58,114,65,108,72,108,71,102,68,100,76,95,83,100,88,94,81,82"/>
                                    <area alt="서울" data-code="2395" class="seoul" href="javascript:;" shape="poly" coords="102,79,89,88,84,87,88,94,93,98,108,96,109,89,103,84,103,80,102,79"/>
                                    <area alt="경기도" data-code="2396" class="gyeonggi" href="javascript:;" shape="poly" coords="105,44,109,51,118,56,125,60,128,68,125,80,132,85,141,87,140,94,141,99,139,106,138,114,117,130,106,125,92,128,84,125,84,119,77,112,83,106,83,100,89,95,93,98,108,96,109,89,104,84,104,79,101,78,90,87,84,87,82,82,79,87,74,87,73,79,75,74,85,71,82,64,83,62,88,63,92,58,84,52,86,50,89,52,93,48,100,47,103,44,105,44"/>
                                    <area alt="강원도" data-code="2408" class="kangwon" href="javascript:;" shape="poly" coords="171,26,167,29,166,38,158,35,153,40,156,43,131,45,128,38,118,43,106,43,110,50,126,59,128,68,126,80,133,85,142,86,140,94,142,99,139,107,139,113,144,115,150,107,156,111,163,108,170,115,181,118,185,116,191,118,196,114,198,118,206,116,215,117,219,111,223,111,209,90,208,81,192,67,190,59,175,37,172,26"/>
                                </map>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col search">
                    <div class="module">
                        <h4 class="title">지역이나 명칭으로 검색</h4>
                        <div class="search-form search-form-a">
                            <h5 class="reset"><span class="large16">지역검색</span></h5>
                            <div class="module">
                                <select id="searchShpMstArea" class="sel_chg" title="시/도" >
                                    <option value="">시/도</option>
                                    <c:forEach var="codeRow" items="${areaCodeList }" varStatus="i">
	                    	            <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <ui:select v="${codeRow.CMN_COM_IDX}" t="${commandMap.SHP_MST_AREA}" g="selected"/> >
	                        	            <c:out value="${codeRow.CMN_COM_NM }"/>
	                                    </option>
	                                </c:forEach>
                                </select>
                                <select id="searchShpMstAreaSub" class="sel_chg" title="구/군">
                                    <option value="">구/군</option>
                                </select>
                                <a href="javascript:goSearch2();" class="button primary small"><span>검색</span></a>
                                <p class="primary">
                                    <span class="small">원하는 지역을 선택하시면 선택하신 지역 내에 위치한 지점을 확인하실 수 있습니다.</span>
                                </p>
                            </div>
                        </div>

                        <div class="search-form search-form-b">
                            <h5 class="reset"><span class="large16">명칭검색</span></h5>
                            <div class="module">
                                <input type="text" class="text" id="searchWord" placeholder="명칭으로 검색해주세요." title="명칭으로 검색해주세요." value="<c:out value="${commandMap.SEARCH_WORD }"/>"/>
                                <a href="javascript:goSearch3();" class="button primary small"><span>검색</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            

            <p id="searchResult" class="clearfix">
           
            </p>

            <table class="bbs-list branch-list" border="0" cellpadding="0" cellspacing="0"><!-- bbs-list -->
            <caption>지점명, 주소, 전화번호로 구성된 지점 검색 결과 목록입니다.</caption>
            <colgroup>
                <col style="width: 25%;" />
                <col style="width: auto%;" />
                <col style="width: 18%;" />
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">지점명</th>
                    <th scope="col">주소</th>
                    <th scope="col">전화번호</th>
                </tr>
            </thead>
            <tbody id="mainList">
                 
            </tbody>
            </table><!-- // bbs-list -->
			<div class="section-pagination" id="branch_pg">
				<ui:frontpaging paging="${paging }" jsFunction="goPage" />
			</div>
			</div><!-- // branch-wrap -->
             
            </div><!-- // map_d -->
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->
<form name="frm" id="frm">
	<input type="hidden" id="SHP_MST_IDX" name="SHP_MST_IDX" value=""/>
</form>
<form name="searchform" id="searchform">
	<input type="hidden" id="SHP_MST_AREA" name="SHP_MST_AREA" value="<c:out value="${commandMap.SHP_MST_AREA }"/>"/>
	<input type="hidden" id="SHP_MST_AREA_SUB" name="SHP_MST_AREA_SUB" value="<c:out value="${commandMap.SHP_MST_AREA_SUB }"/>"/>
	<input type="hidden" id="SEARCH_WORD" name="SEARCH_WORD" value="<c:out value="${commandMap.SEARCH_WORD }"/>"/>
</form>
<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
<script>

$(document).ready(function(){

	var sWord = "<c:out value="${commandMap.SEARCH_WORD }"/>";
	var sArea = "<c:out value="${commandMap.SHP_MST_AREA }"/>";
	
	if(sArea != ""){
		$("#mapDiv area").each(function(i, item){
			if($(this).data("code") == sArea){
				$("#mapDiv").attr("class", $(this).attr('class'));
			}
		});
	}
	
	if(sWord == ""&& sArea=="")goPage(1,0);
	else 
	{
		getSubCodeList(sArea);
		goPage(1,1);
		
	}

});

getSubCodeList = function(code)
{
	var $frm = $("#frm");
    var SHP_MST_AREA_SUB = $("#SHP_MST_AREA_SUB").val();
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
            	if(item.CMN_COM_NM == SHP_MST_AREA_SUB)
            	{
            		$("#searchShpMstAreaSub").append("<option value='"+item.CMN_COM_NM+"' selected='selected'>"+item.CMN_COM_NM+"</option>");
            	}
            	else
            	{
            		$("#searchShpMstAreaSub").append("<option value='"+item.CMN_COM_NM+"'>"+item.CMN_COM_NM+"</option>");	
            	}
             	
            	 
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
 	
 	$("#mapDiv area").each(function(i, item){
		if($(this).data("code") == code){
			$("#mapDiv").attr("class", $(this).attr('class'));
		}
	});
 	
	getSubCodeList(code);
});

$(document).on("click", "#mapDiv area", function (){
	
	//e.preventDefault();

	var $this = $(this),
	_area = $this.attr('class'),
    _map = $this.parent().parent();

 	_map.removeAttr('class').addClass(_area);
	
 	var code = $(this).data("code");
 	
 	$("#SHP_MST_AREA").val(code);
	$("#SHP_MST_AREA_SUB").val('');
	$("#SEARCH_WORD").val('');
	$("#searchWord").val('');
 	$("#searchShpMstArea").val(code);
 	$("#searchShpMstAreaSub").val('');
 	
 	com.sel_chg($("#searchShpMstArea"), 'chg');
 	getSubCodeList(code);
 	//com.sel_chg($("#searchShpMstAreaSub"), 'chg');
	goPage(1,1);
});
 
goSearch2		= function(){
	var searchShpMstArea = $("#searchShpMstArea").val();
	var searchShpMstAreaSub = $("#searchShpMstAreaSub").val();
	
	$("#SHP_MST_AREA").val(searchShpMstArea);
	$("#SHP_MST_AREA_SUB").val(searchShpMstAreaSub);
	$("#SEARCH_WORD").val("");
	$("#searchWord").val('');
	goPage(1,2);
}

$(document).on("keydown", "#searchWord", function (e) {
    if(e.keyCode == 13){
    	goSearch3();
    }
});

goSearch3		= function(){
	var searchWord = $("#searchWord").val();
	if(searchWord=="")
	{
		alert("검색어를 입력해 주시기 바랍니다.");
		$("#searchWord").focus();
		return;
	}
	$("#SHP_MST_AREA").val("");
	$("#SHP_MST_AREA_SUB").val("");
	$("#mapDiv").attr("class", "module");
	$("#searchShpMstArea").val('');
 	$("#searchShpMstAreaSub").val('');
 	
 	com.sel_chg($("#searchShpMstArea"), 'chg');
 	com.sel_chg($("#searchShpMstAreaSub"), 'chg');
	
	$("#SEARCH_WORD").val(searchWord);
	
	goPage(1,3);
}

goPage		= function(page, SEARCH_GB){
//	alert("goReqPage");
	var SHP_MST_AREA = $("#SHP_MST_AREA").val();
	var SHP_MST_AREA_SUB = $("#SHP_MST_AREA_SUB").val();
	var SEARCH_WORD = $("#SEARCH_WORD").val();
	
	$.ajax({
		type		: "POST",
		url			: "/info/branch/branchListAjax.do",
		dataType	: "json",
		data		: {	"SHP_MST_AREA" : SHP_MST_AREA
						,"SHP_MST_AREA_SUB" : SHP_MST_AREA_SUB
						,"SEARCH_GB" : SEARCH_GB
						,"SEARCH_WORD" : SEARCH_WORD
						,"cPage": page
						},
		success : function(data) {
			var innerHtml	= '';
			var resultHtml = "";
			//<strong><span class="warning">서울특별시 &gt; 용산구</span>  (으)로  검색한 결과 총 <span class="warning">서울특별시 &gt; 용산구</span> 개의 지점이 있습니다.</strong>
			
			resultHtml = '<strong><span class="warning">'+data.searchWord+'</span>  (으)로  검색한 결과 총 <span class="warning">'+data.totalCount+'</span> 개의 지점이 있습니다.</strong>';
			$("#searchResult").html(resultHtml);
			
			if(data.totalCount == 0){
				innerHtml = "<tr><td colspan='3' style='text-align:center;'>검색된 지점이 없습니다.</td></tr>";
				$("#mainList").html(innerHtml);
			}else{
				
				var listNum		= data.listNum;
				var totalCount  = data.totalCount;
				$.each(data.resultMap.list, function(i,item){
					var SHP_MST_TEL = item.SHP_MST_TEL;
					if(SHP_MST_TEL==null)SHP_MST_TEL="";
					innerHtml += '<tr><td>';
					if(item.SHP_MST_TYPE=="1981")innerHtml += '<i class="icon branch branch-a"><em>마켓플랜트 </em></i>';
					if(item.SHP_MST_TYPE=="1980")innerHtml += '<i class="icon branch branch-b"><em>마켓플랜트 일반점</em></i>';
					if(item.SHP_MST_TYPE=="1982")innerHtml += '<i class="icon branch branch-c"><em>쿡앤킹</em></i>';
					if(item.SHP_MST_TYPE=="1985")innerHtml += '<i class="icon branch branch-d"><em>IN SHOP</em></i>';  
					 
					innerHtml += ' <a href="javascript:goView('+item.SHP_MST_IDX+')">'+item.SHP_MST_NM+'</a></td>';
					innerHtml += '<td>'+item.SHP_MST_ADDR+'</td>';
					innerHtml += '<td class="tel">'+SHP_MST_TEL+'</td>';
					innerHtml += '</tr>';
					 
					
				});
			 	$("#mainList").html(innerHtml);
				
				var firstPageNo 				= data.firstPageNo;
	            var firstPageNoOnPageList 		= data.firstPageNoOnPageList;
	            var totalPageCount 				= data.totalPageCount;
	            var lastPageNoOnPageList 		= data.lastPageNoOnPageList;
	            var cPage 						= data.cPage;
	            var lastPageNo 					= data.lastPageNo;
	            var pageSize 					= data.pageSize;
	            var pagingSize 					= data.pagingSize;
	            
	            innerHtml 	= "";
	            
	            if(totalPageCount > pagingSize){
	            	if(firstPageNoOnPageList > pagingSize){  
	            		innerHtml += '<a class="nav first" href="javascript:goPage(' + firstPageNo + ');" ><span class="blind">처음 페이지</span></a>';
	            		innerHtml += '<a class="nav prev" href="javascript:goPage(' + (firstPageNoOnPageList - 1) + ');" ><span class="blind">이전 페이지</span></a>';
	            	}else{
	            		innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
	            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
	            	}
	            }else{
	            	innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
	            }
	            
	            
	            if (lastPageNoOnPageList > totalPageCount){
	                lastPageNoOnPageList = totalPageCount;
	            }
            	
            	for(var i=firstPageNoOnPageList; i<= lastPageNoOnPageList; i++){
            		
	                if(i==cPage){
	                	innerHtml +='<a href="javascript:void(0)" class="num active" style="margin-left:3px;">' + i + '</a>';
	                }else{
	                	innerHtml +='<a href="javascript:goPage(' + i + ')" class="num" style="margin-left:3px;">' + i + '</a>';
	                }
	            }
	            	
            	if(totalPageCount > pagingSize){
	                if(lastPageNoOnPageList < totalPageCount){
	                	innerHtml +='<a class="nav next" href="javascript:goPage('+ (lastPageNoOnPageList + 1) + ')"><span class="blind">다음페이지</span></a>';
	                	innerHtml +='<a class="nav last" href="javascript:goPage('+ lastPageNo +')" ><span class="blind">끝 페이지</span></a>';
	                }else {
	                	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
	                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
	                }
	            } else {
	            	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
	            }
	            	
	            $("#branch_pg").html(innerHtml);
	            
			}
			//$("#reqCnt").text(data.totalRecordCount);
			
		}, error : function(err) {
			window.jquery
				|| console.log('오류가 발생하였습니다: ' + err.status);
		}
	});
}; // goPage end

function goView(SHP_MST_IDX){
	var $frm = $("#frm");
	$("#SHP_MST_IDX").val(SHP_MST_IDX);
	$frm.attr({"action":"<c:out value="${brandDomain}" />/info/branch/branchView.do", "target":"_self", "method":"post"}).submit();
	
};


</script>

</body>
</html>