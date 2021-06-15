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
            <h2>공지사항</h2>
             <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="padder mt20">
            <ul class="list list-a">
                <li>마켓플랜트 의 새로운 소식입니다.</li>
            </ul>
        </div>

        <div class="tab-a item-4 tab-notice" data-role="navbar"><!-- tab-a -->
            <ul>
                <li id="tab1" class="active"><a href="javascript:goTab(1);">일반공지</a><span class="blind">현재위치</span></li>
                <li id="tab2"><a href="javascript:goTab(2);">혜택</a></li>
                <li id="tab3"><a href="javascript:goTab(3);">이벤트</a></li>
                <li id="tab4"><a href="javascript:goTab(4);">당첨자발표</a></li>
            </ul>
        </div><!-- // tab-a -->

        <table class="bbs-list notice-list" border="0" cellpadding="0" cellspacing="0"><!-- bbs-list -->
        <caption>제목, 조회수로 구성된 공지사항 목록입니다.</caption>
        <colgroup>
            <col style="width: auto;">
            <col style="width: 20%;">
        </colgroup>
        <thead class="blind">
            <tr>
                <th scope="col">제목</th>
                <th scope="col">조회수</th>
            </tr>
        </thead>
        <tbody id="mainList">
            <tr>
                <td class="text-left">
                    <a href="javascript:;">2015년 11월 카드 이벤트 혜택안내</a>
                    <p class="date">
                        <span class="blind">등록일</span>
                        2015.11.01
                    </p>
                </td>
                <td>1,234</td>
            </tr>
            <tr>
                <td class="text-left">
                    <a href="javascript:;">2015년 11월 카드 이벤트 혜택안내</a>
                    <p class="date">
                        <span class="blind">등록일</span>
                        2015.11.01
                    </p>
                </td>
                <td>1,234</td>
            </tr>
        </tbody>
        </table><!-- // bbs-list -->

        <div class="section-pagination" id="notice_pg"><!-- section pagination -->
            <ui:frontpaging paging="${paging }" jsFunction="goPage" />
        </div><!-- // section pagination -->
        
	</article>
	<form name="frm" id="frm">
		<input type="hidden" id="DRT_NTS_IDX" name="DRT_NTS_IDX" value=""/>
		<input type="hidden" id="searchDrtCmnComIdx" name="searchDrtCmnComIdx" value=""/>
	</form>
	<!--// #container E -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>
<script>
function goTab(index){
	if(index==1)
	{
		$("#tab1").addClass("active");
		$("#tab2").removeClass("active");
		$("#tab3").removeClass("active");
		$("#tab4").removeClass("active");
		$("#searchDrtCmnComIdx").val("2029");
	}
	if(index==2)
	{
		$("#tab1").removeClass("active");
		$("#tab2").addClass("active");
		$("#tab3").removeClass("active");
		$("#tab4").removeClass("active");
		$("#searchDrtCmnComIdx").val("2026");
	}
	if(index==3)
	{
		$("#tab1").removeClass("active");
		$("#tab2").removeClass("active");
		$("#tab3").addClass("active");
		$("#tab4").removeClass("active");
		$("#searchDrtCmnComIdx").val("2027");
	}
	if(index==4)
	{
		$("#tab1").removeClass("active");
		$("#tab2").removeClass("active");
		$("#tab3").removeClass("active");
		$("#tab4").addClass("active");
		$("#searchDrtCmnComIdx").val("2028");
	}
	goPage(1);
	
};

goPage		= function(page){
//	alert("goReqPage");
	var searchDrtCmnComIdx =  $("#searchDrtCmnComIdx").val();
	$.ajax({
		type		: "POST",
		url			: "/info/mobile/support/supportNoticeListAjax.do",
		dataType	: "json",
		data		: {	"searchDrtCmnComIdx": searchDrtCmnComIdx
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
					
 
//                      <tr>
//                 <td class="text-left">
//                     <a href="javascript:;">2015년 11월 카드 이벤트 혜택안내</a>
//                     <p class="date">
//                         <span class="blind">등록일</span>
//                         2015.11.01
//                     </p>
//                 </td>
//                 <td>1,234</td>
//             </tr>
					
					innerHtml += '<tr><td class="text-left"><a href="javascript:goView('+item.DRT_NTS_IDX+');">';
					if(item.DRT_NTS_TOP_YN=="Y")innerHtml += '[공지]';
					innerHtml +=  item.DRT_NTS_TITLE+'</a>';
					innerHtml += '<p class="date">'+item.DRT_NTS_REG_DT+'</p></td>';
					innerHtml += '<td>'+item.DRT_NTS_READ_CNT+'</td>';
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
	            	
	            $("#notice_pg").html(innerHtml);
	            
			}
			//$("#reqCnt").text(data.totalRecordCount);
			
		}, error : function(err) {
			window.jquery
				|| console.log('오류가 발생하였습니다: ' + err.status);
		}
	});
}; // goPage end

function goView(DRT_NTS_IDX){
	var $frm = $("#frm");
	$("#DRT_NTS_IDX").val(DRT_NTS_IDX);
	
	if(DRT_NTS_IDX=="107"){
		alert("사진 다운로드는 PC에서만 가능합니다.");
		
	}else
	{
		$frm.attr({"action":"<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportNoticeView.do", "target":"_self", "method":"post"}).submit();	
	}
	
	
	
};

$("#searchDrtCmnComIdx").val("2029");
goPage(1);
</script>

</body>
</html>