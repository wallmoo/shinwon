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
            <strong>FAQ</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">
        
        <div id="contents" class="cs_con_d mb50"><!-- #contents -->
			<h3 class="title">고객지원센터</h3>
			<ul class="tab_d">
				<li class="f"><a href="<c:out value="${brandDomain}" />/info/support/supportNotice.do#cs_con_d"><span>공지사항</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportPraise.do#cs_con_d"><span>마켓플랜트 칭찬하기</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportCounsel.do#cs_con_d"><span>상담하기</span><i class="ico_ar"></i></a></li>
				<li class="on"><a href="<c:out value="${brandDomain}" />/info/support/supportFAQ.do#cs_con_d"><span>FAQ</span><i class="ico_ar"></i></a></li>
				<li class="l"><a href="<c:out value="${brandDomain}" />/info/support/supportAS.do#cs_con_d"><span>A/S 센터안내</span><i class="ico_ar"></i></a></li>
			</ul>
		 	<div class="sh_box"><!--  .sh_box s -->
	            <div class="faq-search"><!-- faq-search -->
	                <label for="SEARCH_WORD" class="large20">FAQ 검색</label>
	                <input type="text" class="text" id="SEARCH_WORD" name="SEARCH_WORD"/>
	                <a href="javascript:goPage(1);" class="button primary"><span>검색</span></a>
	            </div><!-- // faq-search -->
	
	            <div class="faq-tab"><!-- faq-tab -->
	                <a id="tab0" href="javascript:goSearch(0);" class="all active"><span>전체보기</span></a>
	                <ul class="tab">
	                    <li><a id="tab1" class="" href="javascript:goSearch(1);"><span>배송/설치</span></a></li>
	                    <li><a id="tab4" class="" href="javascript:goSearch(4);"><span>제품교환</span></a></li>
	                    <li><a id="tab3" class="" href="javascript:goSearch(3);"><span>A/S</span></a></li>
	                    <li><a id="tab2" class="" href="javascript:goSearch(2);"><span>폐가전</span></a></li>
	                    <li><a id="tab5" class="" href="javascript:goSearch(5);"><span>회원정보/멤버십</span></a></li>
	                    <li><a id="tab6" class="" href="javascript:goSearch(6);"><span>캐쉬백/포인트</span></a></li>
	                    <li><a id="tab7" class="" href="javascript:goSearch(7);"><span>이벤트혜택</span></a></li>
	                    <li><a id="tab8" class="" href="javascript:goSearch(8);"><span>기타</span></a></li>
	                </ul>
	            </div><!-- // faq-tab -->
            </div>
			<input type="hidden" id="DRT_CMN_COM_IDX" name="DRT_CMN_COM_IDX"/>
            <div class="faq-list"><!-- faq-list -->
                <ul class="reset" id="mainList">
                </ul>
            </div><!-- // faq-list -->
			<div class="section-pagination" id="pg_nav">
				<ui:frontpaging paging="${paging }" jsFunction="goPage" />
			</div>
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->
<form name="frm" id="frm">
	<input type="hidden" id="DRT_NTS_IDX" name="DRT_NTS_IDX" value=""/>
	<input type="hidden" id="searchDrtCmnComIdx" name="searchDrtCmnComIdx" value=""/>
</form>
<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
<script>
function goSearch(index){
 	for(var i=0;i<9;i++)
	{
 		
		if(i==index)
		{
			$("#tab"+i).attr("class","active");
			if(i==0)$("#tab"+i).addClass("all");	
		}
		else
		{
			$("#tab"+i).attr("class","");
			if(i==0)$("#tab"+i).attr("class","all");	
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
			var innerHtml = ""; 
			
			if(data.totalCount == 0){
				innerHtml = "<tr><td colspan='4'><p class='message no-more'>등록된 게시물이 없습니다.</p></td></tr>";
			}else{
				
				var listNum		= data.listNum;
				var totalCount  = data.totalCount;
				console.log("listNum::>" + data.listNum);
				console.log("listNum::>" + data.listNum);
				
				$.each(data.resultMap.list, function(i,item){
					
// 					<li>
// 	                    <div class="question">
// 	                        <span class="type"><em class="semantic">질문</em></span>
// 	                        <a href="#!">구매가능 여부를 알고 싶어요 <span class="semantic">답변<em>열기</em></span></a>
// 	                    </div>
// 	                    <div class="answer">
// 	                        <span class="type"><em class="semantic">답변</em></span>
// 	                        비회원이신 경우에 로그인 창에서 비회원으로 주문을 클릭 후 주문이 가능합니다.<br />
// 	                        ※마켓플랜트 쇼핑몰의 회원으로 가입후 주문하시면 마켓플랜트 쇼핑몰에서 제공하는 할인쿠폰 및 적립금 혜택, 이벤트등 각종 혜택을 받을 수 있습니다.
// 	                    </div>
// 	                </li>

					innerHtml += '<li><div class="question"><span class="num">'+ (listNum - i) +'</span>';
				 	innerHtml += '<a href="#!">'+item.DRT_FAQ_TITLE+' <span class="semantic">답변<em>열기</em></span></a></div>';
					innerHtml += '<div class="answer"><span class="type"><em class="semantic">답변</em></span>';
					innerHtml += item.DRT_FAQ_CONTENTS;
					innerHtml += '</div></li>';

				});
				
			 	$("#mainList").html(innerHtml);
			 	//com.accordion($('.question a'), '.question');
			 	$('.faq-list .question a').on('click', function(e) {
			        e.preventDefault();

			        var $this = $(this),
			            _col = $this.parents('li');

			        _col.toggleClass('in');
			        _col.siblings().removeClass('in').find('a em').text('열기');

			        if (_col.hasClass('in')) {
			            $this.find('em').text('닫기');
			        } else {
			            $this.find('em').text('열기');
			        }
			    });
			 	
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
