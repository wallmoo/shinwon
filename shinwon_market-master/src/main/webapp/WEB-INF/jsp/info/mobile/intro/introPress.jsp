<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 <!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
<%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %>
 
<!-- #container S -->
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>보도자료</h2>
            <%@ include file="/WEB-INF/jsp/info/mobile/include/topMenu.jsp" %>
        </div>
		<!--// .section-title E -->

        <div class="padder mt20">
            <ul class="list list-a">
                <li>마켓플랜트 의 보도자료입니다.</li>
            </ul>
        </div>

        <table class="bbs-list mt20" border="0" cellpadding="0" cellspacing="0"><!-- bbs-list -->
        <caption>제목, 조회수로 구성된 보도자료 목록입니다.</caption>
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
             
        </tbody>
        </table><!-- // bbs-list -->

        <div class="section-pagination" id="press_pg">
			<ui:frontpaging paging="${paging }" jsFunction="goPage" />
		</div>
	</article>
	<!--// #container E -->


<form name="frm" id="frm">
	<input type="hidden" id="PRS_RLS_IDX" name="PRS_RLS_IDX" value=""/>
</form>
<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>
<script>
goPage		= function(page){
//	alert("goReqPage");
	
	$.ajax({
		type		: "POST",
		url			: "/info/mobile/intro/introPressListAjax.do",
		dataType	: "json",
		data		: {	"cPage": page
						},
		success : function(data) {
			var innerHtml	= '';
			
			if(data.totalPageCount == 0){
				innerHtml = "";
			}else{
				
				var listNum		= data.listNum;
				var totalCount  = data.totalCount;
				$.each(data.resultMap.list, function(i,item){
					
 
// <tr>
//                 <td class="text-left">
//                     <a href="javascript:;">2015년 11월 카드 이벤트 혜택안내</a>
//                     <p class="date">
//                         <span class="blind">등록일</span>
//                         2015.11.01
//                     </p>
//                 </td>
//                 <td>1,234</td>
//             </tr>
					
					innerHtml += '<tr';
					if(item.PRS_RLS_TOP_YN=="Y") innerHtml += ' class="notice" ';
					innerHtml += '><td class="text-left">';
					innerHtml += '<a href="javascript:goView('+item.PRS_RLS_IDX+');">';
					if(item.PRS_RLS_TOP_YN=="Y")innerHtml += '[공지]';
					innerHtml += item.PRS_RLS_TITLE+'</a><p class="date">';
					innerHtml += '<span class="blind">등록일</span>'+item.PRS_RLS_REG_DT+'</p>';
					innerHtml += '<td>'+item.PRS_RLS_READ_CNT+'</td>';
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
	            	
	            $("#press_pg").html(innerHtml);
	            
			}
			//$("#reqCnt").text(data.totalRecordCount);
			
		}, error : function(err) {
			window.jquery
				|| console.log('오류가 발생하였습니다: ' + err.status);
		}
	});
}; // goPage end

function goView(PRS_RLS_IDX){
	var $frm = $("#frm");
	$("#PRS_RLS_IDX").val(PRS_RLS_IDX);
	$frm.attr({"action":"<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introPressView.do", "target":"_self", "method":"post"}).submit();
	
};

goPage(1);
</script>

</body>
</html>