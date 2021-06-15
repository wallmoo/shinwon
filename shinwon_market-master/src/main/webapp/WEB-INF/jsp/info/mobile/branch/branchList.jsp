<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 <!-- #wrap S -->
	<!-- #header S -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %>
 
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>지점안내</h2>
            <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="padder text-center mt20">
            <p class="small">
                <span class="info">내가 원하는 지점을 찾거나 내 주변 가까운 지점을 찾을 수 있습니다. </span>
            </p>
            <p>
                본사고객상담실  <strong class="warning"></strong>
            </p>
        </div>

        <div class="tab-a" data-role="navbar"><!-- tab-a -->
            <ul>
                <li id="goArea" class="active"><a href="javascript:goArea();">지역검색</a><span class="blind">현재위치</span></li>
                <li id="goName"><a href="javascript:goName();">명칭검색</a></li>
            </ul>
        </div><!-- // tab-a -->

        <div id="areaSearch" class="padder branch-search region"><!-- branch-search -->
            <p class="primary">
                원하는 지역을 선택하시면 선택하신 지역 내에 위치한 지점을 확인하실 수 있습니다.
            </p>
            <label for="searchShpMstArea" class="sel_box_st0">
                <select id="searchShpMstArea" class="select" title="시/도">
                    <option value="">시/도</option>
                    <c:forEach var="codeRow" items="${areaCodeList }" varStatus="i">
	                	<option value="<c:out value="${codeRow.CMN_COM_IDX }"/>" <ui:select v="${codeRow.CMN_COM_IDX}" t="${commandMap.SHP_MST_AREA}" g="selected"/> >
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
            <a href="javascript:goSearch2();" class="button primary small"><span>검색</span></a>
        </div><!-- branch-search -->
        
         <div id="nameSearch"  class="padder branch-search name"><!-- branch-search -->
            <input id="searchWord" type="text" class="text" placeholder="명칭으로 검색해주세요." title="명칭으로 검색해주세요." />
            <a href="javascript:goSearch3();" class="button primary small"><span>검색</span></a>
        </div><!-- branch-search -->

        <div id="searchResult" class="padder branch-status"><!-- branch-status -->
         
        </div><!-- // branch-status -->


        <div class="branch-search-list"><!-- branch-search-list -->
            <table border="0" cellpadding="0" cellspacing="0">
            <caption>지점명, 주소  및 연락처로 구성된 지점 검색결과 목록입니다.</caption>
            <colgroup>
                <col style="width: 40%;" />
                <col style="width: auto%;" />
            </colgroup>
            <thead class="blind">
                <tr>
                    <th scope="col">지점명</th>
                    <th scope="col">주소 및 연락처</th>
                </tr>
            </thead>
            <tbody id="mainList" class="_scroll_list_ck">
            </tbody>
            </table>

            <p class="guide">
                <i class="icon branch branch-a"><span class="blind">마켓플랜트  표시는</span></i> 
                마켓플랜트  <span class="blind">매장</span>&nbsp;&nbsp;
                <i class="icon branch branch-b"><span class="blind">마켓플랜트 일반점 표시는</span></i>
                마켓플랜트 일반점 <span class="blind">매장</span>&nbsp;&nbsp;<br />
                <i class="icon branch branch-c"><span class="blind">쿡앤킹 표시는</span></i>
                쿡앤킹 <span class="blind">매장</span>&nbsp;&nbsp;
                <i class="icon branch branch-d"><span class="blind">IN SHOP 표시는</span></i>
                IN SHOP <span class="blind">매장</span>
            </p>
        </div><!-- // branch-search-list -->
    <input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}" />"/>
	</article>
	<!--// #container E -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>

<form name="frm" id="frm">
	<input type="hidden" id="SHP_MST_IDX" name="SHP_MST_IDX" value=""/>
</form>
<form name="searchform" id="searchform">
	<input type="hidden" id="SHP_MST_AREA" name="SHP_MST_AREA" value="<c:out value="${commandMap.SHP_MST_AREA }"/>"/>
	<input type="hidden" id="SHP_MST_AREA_SUB" name="SHP_MST_AREA_SUB" value="<c:out value="${commandMap.SHP_MST_AREA_SUB }"/>"/>
	<input type="hidden" id="SEARCH_WORD" name="SEARCH_WORD" value="<c:out value="${commandMap.SEARCH_WORD }"/>"/>
</form>

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>

$("#nameSearch").hide();

function goArea(){
	$("#areaSearch").show();
	$("#nameSearch").hide();
	$("#goArea").addClass("active");
	$("#goName").removeClass("active");
	//$("#frm").submit();
};
function goName(){
	$("#areaSearch").hide();
	$("#nameSearch").show();
	$("#goArea").removeClass("active");
	$("#goName").addClass("active");
	//$("#frm").submit();
};

$.com.win_scrollList = true;//스크롤 할거야~
function _return_scrollList(_idx, _reNum){
	
	/*
		_idx = 리스트감싸고있는 객체
		_reNum = 리턴 몇번째넘어왔는지
		*/
	//console.log("_reNum : "+_reNum);
	var page = _reNum + 2;
	var totalCount = $("#totalCount").val();
	
	//console.log("_reNum "+_reNum );

	var SHP_MST_AREA = $("#SHP_MST_AREA").val();
	var SHP_MST_AREA_SUB = $("#SHP_MST_AREA_SUB").val();
	var SEARCH_WORD = $("#SEARCH_WORD").val();
	var SEARCH_GB = "1";
	if(parseInt(totalCount) >= (parseInt(page)-1) * 10)
	{	
		$.ajax({
			type		: "POST",
			url			: "/info/mobile/branch/branchListAjax.do",
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
				
				//resultHtml = '<span class="warning">'+data.searchWord+'</span>  (으)로  검색한 결과 총 <span class="warning">'+data.totalCount+'</span> 개의 <br />지점이 있습니다.';
				
				//$("#searchResult").html(resultHtml);
				$("#totalCount").val(data.totalCount);
				
				if(data.totalPageCount == 0){
					innerHtml = "";
				}else{
					
					var listNum		= data.listNum;
					var totalCount  = data.totalCount;
					$.each(data.resultMap.list, function(i,item){

						var SHP_MST_TEL = item.SHP_MST_TEL;
						if(SHP_MST_TEL==null)SHP_MST_TEL="";
						innerHtml += '<tr><td>';
						if(item.SHP_MST_TYPE=="1981")innerHtml += '<i class="icon branch branch-a"><span class="blind">마켓플랜트 </span></i>';
						if(item.SHP_MST_TYPE=="1980")innerHtml += '<i class="icon branch branch-b"><span class="blind">마켓플랜트 일반점</span></i>';
						if(item.SHP_MST_TYPE=="1982")innerHtml += '<i class="icon branch branch-c"><span class="blind">쿡앤킹</span></i>';
						if(item.SHP_MST_TYPE=="1985")innerHtml += '<i class="icon branch branch-d"><span class="blind">IN SHOP</span></i>';  
						 
						innerHtml += ' <a href="javascript:goView('+item.SHP_MST_IDX+')">'+item.SHP_MST_NM+'</a></td>';
						innerHtml += '<td><p>'+item.SHP_MST_ADDR+'</p>';
						innerHtml += '<p>'+SHP_MST_TEL+'</p></td>';
						innerHtml += '</tr>';
						 
						
					});
				 	//$("#mainList").html(innerHtml);
				 	_idx.append(innerHtml);
		 
		            
				}
				//$("#reqCnt").text(data.totalRecordCount);
				
			}, error : function(err) {
				window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	}else
	{
		$.com.win_scrollList = false;//스크롤 할거야~
	}
	
		
}

$(document).ready(function(){

	var sWord = "<c:out value="${commandMap.SEARCH_WORD }"/>";
	var sArea = "<c:out value="${commandMap.SHP_MST_AREA }"/>";

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
        url : "<c:out value="${mobileBrandDomain}" />/info/mobile/branch/getSubCodeAjax.do",
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
          //  com.sel_chg($("#searchShpMstAreaSub"), 'chg');
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
 
 
goSearch2		= function(){
	var searchShpMstArea = $("#searchShpMstArea").val();
	var searchShpMstAreaSub = $("#searchShpMstAreaSub").val();
	
	if(searchShpMstArea == ""){
		alert("시/도를 선택하세요.");
		return;
	}
	
	$("#SHP_MST_AREA").val(searchShpMstArea);
	$("#SHP_MST_AREA_SUB").val(searchShpMstAreaSub);
	$("#SEARCH_WORD").val("");
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
		return false;
	}
	$("#SHP_MST_AREA").val("");
	$("#SHP_MST_AREA_SUB").val("");
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
		url			: "/info/mobile/branch/branchListAjax.do",
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
			
			resultHtml = '<span class="warning">'+data.searchWord+'</span>  (으)로  검색한 결과 총 <span class="warning">'+data.totalCount+'</span> 개의 <br />지점이 있습니다.';
			
			$("#searchResult").html(resultHtml);
			$("#totalCount").val(data.totalCount);
			
			
			if(data.totalPageCount == 0){
				innerHtml = "";
			}else{
				
				var listNum		= data.listNum;
				var totalCount  = data.totalCount;
				$.each(data.resultMap.list, function(i,item){

					var SHP_MST_TEL = item.SHP_MST_TEL;
					if(SHP_MST_TEL==null)SHP_MST_TEL="";
					innerHtml += '<tr><td>';
					if(item.SHP_MST_TYPE=="1981")innerHtml += '<i class="icon branch branch-a"><span class="blind">마켓플랜트 </span></i>';
					if(item.SHP_MST_TYPE=="1980")innerHtml += '<i class="icon branch branch-b"><span class="blind">마켓플랜트 일반점</span></i>';
					if(item.SHP_MST_TYPE=="1982")innerHtml += '<i class="icon branch branch-c"><span class="blind">쿡앤킹</span></i>';
					if(item.SHP_MST_TYPE=="1985")innerHtml += '<i class="icon branch branch-d"><span class="blind">IN SHOP</span></i>';  
					 
					innerHtml += ' <a href="javascript:goView('+item.SHP_MST_IDX+')">'+item.SHP_MST_NM+'</a></td>';
					innerHtml += '<td><p>'+item.SHP_MST_ADDR+'</p>';
					innerHtml += '<p>'+SHP_MST_TEL+'</p></td>';
					innerHtml += '</tr>';
					 
					
				});
			 	$("#mainList").html(innerHtml).data('returnNum',0);
			 	$.com.win_scrollList = true;
	            
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
	$frm.attr({"action":"<c:out value="${mobileBrandDomain}" />/info/mobile/branch/branchView.do", "target":"_self", "method":"post"}).submit();
	
};


	


</script>

</body>
</html>