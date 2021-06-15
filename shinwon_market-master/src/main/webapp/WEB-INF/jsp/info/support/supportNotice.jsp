<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/include/head.jsp" %>
</head>
<body class="page-service">
<div id="skipNavigation"><!-- #skipNavigation -->
    <a href="#contents">컨텐츠 바로가기</a>
</div><!-- #skipNavigation -->
 
<%@ include file="/WEB-INF/jsp/info/include/top.jsp" %>

<div id="container"><!-- #container -->
    
    <h2 class="semantic">컨텐츠 영역</h2>

    <div id="visual"><!-- #visual -->
        <div class="wrap">
            <strong>고객지원센터</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/support/supportNotice.do" class="home"><span>고객지원센터</span></a>
            <span class="gt">&gt;</span>
            <strong>공지사항</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">
		<div id="contents"class="cs_con_d mb50"><!-- #contents -->
     
        <h3 class="title">고객지원센터</h3>
			<ul class="tab_d">
				<li class="f on"><a href="<c:out value="${brandDomain}" />/info/support/supportNotice.do#cs_con_d"><span>공지사항</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportPraise.do#cs_con_d"><span>마켓플랜트 칭찬하기</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportCounsel.do#cs_con_d"><span>상담하기</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportFAQ.do#cs_con_d"><span>FAQ</span><i class="ico_ar"></i></a></li>
				<li class="l"><a href="<c:out value="${brandDomain}" />/info/support/supportAS.do#cs_con_d"><span>A/S 센터안내</span><i class="ico_ar"></i></a></li>
			</ul>

			<p class="mt50 large16">마켓플랜트 의 새로운 소식입니다.</p>

            <div class="tab-c"><!-- tab-c -->
                <ul class="tab">
                    <li id="tab1" class="<c:if test="${empty commandMap.searchDrtCmnComIdx}">active</c:if> <c:if test="${commandMap.searchDrtCmnComIdx eq '2029'}">active</c:if>"><a href="javascript:goTab(1);"><span>일반공지</span></a><span class="semantic">현재위치</span></li>
                    <li id="tab2" class="<c:if test="${commandMap.searchDrtCmnComIdx eq '2026'}">active</c:if>"><a href="javascript:goTab(2);"><span>혜택</span></a></li>
                    <li id="tab3" class="<c:if test="${commandMap.searchDrtCmnComIdx eq '2027'}">active</c:if>"><a href="javascript:goTab(3);"><span>이벤트</span></a></li>
                    <li id="tab4" class="<c:if test="${commandMap.searchDrtCmnComIdx eq '2028'}">active</c:if>"><a href="javascript:goTab(4);"><span>당첨자 발표</span></a></li>
                </ul>
            </div><!-- // tab-c -->

            <table class="bbs-list mt20" border="0" cellpadding="0" cellspacing="0"><!-- bbs-list -->
            <caption>번호, 제목, 등록일, 조회수로 구성된 공지사항 목록입니다.</caption>
            <colgroup>
                <col style="width: 10%;" />
                <col style="width: auto%;" />
                <col style="width: 15%;" />
                <col style="width: 10%;" />
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">등록일</th>
                    <th scope="col">조회수</th>
                </tr>
            </thead>
            <tbody id="mainList">
                
            </tbody>
            </table><!-- // bbs-list -->
			
			<div class="section-pagination" id="notice_pg">
				<ui:frontpaging paging="${paging }" jsFunction="goPage" />
			</div>
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->
<form name="frm" id="frm">
	<input type="hidden" id="DRT_NTS_IDX" name="DRT_NTS_IDX" value=""/>
	<input type="hidden" id="searchDrtCmnComIdx" name="searchDrtCmnComIdx" value="<c:out value="${commandMap.searchDrtCmnComIdx}"/>"/>
	<input type="hidden" id="cPage" name="cPage" value="<c:out value="${commandMap.cPage}"/>"/>
</form>
<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
<script>
function goTab(index){
	if(index==1)
	{
		$("#tab1").attr("class","active");
		$("#tab2").attr("class","");
		$("#tab3").attr("class","");
		$("#tab4").attr("class","");
		$("#searchDrtCmnComIdx").val("2029");
	}
	if(index==2)
	{
		$("#tab1").attr("class","");
		$("#tab2").attr("class","active");
		$("#tab3").attr("class","");
		$("#tab4").attr("class","");
		$("#searchDrtCmnComIdx").val("2026");
	}
	if(index==3)
	{
		$("#tab1").attr("class","");
		$("#tab2").attr("class","");
		$("#tab3").attr("class","active");
		$("#tab4").attr("class","");
		$("#searchDrtCmnComIdx").val("2027");
	}
	if(index==4)
	{
		$("#tab1").attr("class","");
		$("#tab2").attr("class","");
		$("#tab3").attr("class","");
		$("#tab4").attr("class","active");
		$("#searchDrtCmnComIdx").val("2028");
	}
	goPage(1);
	
};

goPage		= function(page){
//	alert("goReqPage");
	var searchDrtCmnComIdx =  $("#searchDrtCmnComIdx").val();
	$("#cPage").val(page);
	$.ajax({
		type		: "POST",
		url			: "/info/support/supportNoticeListAjax.do",
		dataType	: "json",
		data		: {	"searchDrtCmnComIdx": searchDrtCmnComIdx
						,"cPage": page
						},
		success : function(data) {
			var innerHtml	= '';
			
			if(data.totalCount == 0){
				innerHtml = "<tr><td colspan='4'><p class='message no-more'>등록된 게시물이 없습니다.</p></td></tr>";
				$("#mainList").html(innerHtml);
			}else{
				
				var listNum		= data.listNum;
				var totalCount  = data.totalCount;
				$.each(data.resultMap.list, function(i,item){
					
// 					<tr>
// 	                    <td>공지</td>
// 	                    <td class="subject"><a href="javascript:;">2015년 11월 카드 이벤트 혜택안내</a></td>
// 	                    <td>2015-10-30</td>
// 	                    <td>1,234</td>
// 	                </tr>\ <tr>
                     
					
					innerHtml += '<tr>';
					if(item.DRT_NTS_TOP_YN=="Y")innerHtml += '<td>공지</td>';
					else innerHtml += '<td>'+((totalCount+1) - item.RNUM)+'</td>';
					innerHtml += '<td class="subject"><a href="javascript:goView('+item.DRT_NTS_IDX+');">'+item.DRT_NTS_TITLE+'</a></td>';
					innerHtml += '<td>'+item.DRT_NTS_REG_DT+'</td>';
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
	$frm.attr({"action":"<c:out value="${brandDomain}" />/info/support/supportNoticeView.do", "target":"_self", "method":"post"}).submit();
	
};

var searchDrtCmnComIdx = '<c:out value="${commandMap.searchDrtCmnComIdx}"/>';
if(searchDrtCmnComIdx=="")searchDrtCmnComIdx="2029";
$("#searchDrtCmnComIdx").val(searchDrtCmnComIdx);

var cPage = '<c:out value="${commandMap.cPage}"/>';
if(cPage=="")cPage=1;
 
goPage(cPage);

</script>

</body>
</html>
<script>
com.search = {
	hash: function(){
		var query = window.location.hash,
			vars = query.split('#');
		return vars[1];
	},//com.search.hash : function(){
	scroll: function(){		
		//scroll이동
		var _hash = com.search.hash(),
			_offset_t = $('.'+_hash).offset().top;
		$('body').scrollTop(_offset_t);
	}//com.search.scroll : function(){
};

$(document).ready(function(){
	com.search.scroll();
});
</script>