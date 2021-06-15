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
            <h2>FAQ</h2>
            <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="padder mt20">
            <ul class="list list-a">
                <li>자주 문의하시는 질문과 답변입니다.</li>
            </ul>
        </div>

        <div class="faq-search"><!-- faq-search -->
            <label for="SEARCH_WORD" class="xlarge">FAQ 검색</label>
            <input type="text" id="SEARCH_WORD" name="SEARCH_WORD" class="text">
            <a href="javascript:goPage(1);" class="button primary"><span>검색</span></a>
        </div><!-- // faq-search -->

        <div class="faq-tab"><!-- faq-tab -->
            <ul class="ui-grid-b">
                <li class="ui-block-a"><a id="tab0" href="javascript:goSearch(0);" class="active"><span>전체보기</span></a></li>
                <li class="ui-block-b"><a id="tab1" href="javascript:goSearch(1);" ><span>배송/설치</span></a></li>
                <li class="ui-block-c"><a id="tab2" href="javascript:goSearch(2);"><span>폐가전</span></a></li>
                <li class="ui-block-a"><a id="tab3" href="javascript:goSearch(3);"><span>A/S</span></a></li>
                <li class="ui-block-b"><a id="tab4" href="javascript:goSearch(4);"><span>제품교환</span></a></li>
                <li class="ui-block-c"><a id="tab5" href="javascript:goSearch(5);"><span>회원정보/멤버십</span></a></li>
                <li class="ui-block-a"><a id="tab6" href="javascript:goSearch(6);"><span>캐쉬백/마일리지</span></a></li>
                <li class="ui-block-b"><a id="tab7" href="javascript:goSearch(7);"><span>이벤트혜택</span></a></li>
                <li class="ui-block-c"><a id="tab8" href="javascript:goSearch(8);"><span>기타</span></a></li>
            </ul>
        </div><!-- // faq-tab -->
		<input type="hidden" id="DRT_CMN_COM_IDX" name="DRT_CMN_COM_IDX"/>
        <div id="mainList" class="faq-list" data-role="collapsible-set"><!-- faq-list -->
             
        </div><!-- // faq-list -->
        
        <div class="section-pagination" id="pg_nav">
			<ui:frontpaging paging="${paging }" jsFunction="goPage" />
		</div>
        
	</article>
	<!--// #container E -->

<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>
<form name="frm" id="frm">
	<input type="hidden" id="DRT_NTS_IDX" name="DRT_NTS_IDX" value=""/>
	<input type="hidden" id="searchDrtCmnComIdx" name="searchDrtCmnComIdx" value=""/>
</form>
 
<script>
function goSearch(index){
 	for(var i=0;i<9;i++)
	{
 		
		if(i==index)
		{
			$("#tab"+i).addClass("active");
		}
		else
		{
			$("#tab"+i).removeClass("active");
		}
		
	}
 	
 	if(index==0)$("#DRT_CMN_COM_IDX").val("");
	if(index==1)$("#DRT_CMN_COM_IDX").val("1948");
	if(index==2)$("#DRT_CMN_COM_IDX").val("1950");
	if(index==3)$("#DRT_CMN_COM_IDX").val("1951");
	if(index==4)$("#DRT_CMN_COM_IDX").val("1952");
	if(index==5)$("#DRT_CMN_COM_IDX").val("1953");
	if(index==6)$("#DRT_CMN_COM_IDX").val("1954");
	if(index==7)$("#DRT_CMN_COM_IDX").val("1957");
	if(index==8)$("#DRT_CMN_COM_IDX").val("1959");
	
	goPage(1);
	
};

goPage		= function(page){
//	alert("goReqPage");
	var DRT_CMN_COM_IDX =  $("#DRT_CMN_COM_IDX").val();
	var SEARCH_WORD  =  $("#SEARCH_WORD").val();
	$.ajax({
		type		: "POST",
		url			: "/info/support/supportFaqListAjax.do",
		dataType	: "json",
		data		: {	"SEARCH_WORD": SEARCH_WORD
			            ,"DRT_CMN_COM_IDX": DRT_CMN_COM_IDX
						,"cPage": page
						},
		success : function(data) {
			var innerHtml	= '';
			
			if(data.totalPageCount == 0){
				innerHtml = "";
			}else{
				
				var listNum		= data.listNum;
				var totalCount  = data.totalCount;
				$.each(data.resultMap.list, function(i,item){
					
					innerHtml += '<div class="section" data-role="collapsible" data-collapsed="true"><h3>';
					innerHtml += '<i class="type question"><span class="blind">질문</span></i>';
					innerHtml += '<strong><span class="blind">하위 카테고리</span>'+item.DRT_CMN_COM_IDX_NM+'</strong>';
				 	innerHtml += '<span>'+item.DRT_FAQ_TITLE+' </span><i class="more"></i></h3>';
					innerHtml += '<div class="toggle-box"><i class="type answer"><span class="blind">답변</span></i>';
					innerHtml += item.DRT_FAQ_CONTENTS;
					innerHtml += '</div></div>';
					
				});
			 	$("#mainList").html(innerHtml).collapsibleset('refresh');
			 	
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
	            	
	            $("#pg_nav").html(innerHtml);
	            
			}
			//$("#reqCnt").text(data.totalRecordCount);
			
		}, error : function(err) {
			window.jquery
				|| console.log('오류가 발생하였습니다: ' + err.status);
		}
	});
}; // goPage end

goPage(1);
</script>

</body>
</html>