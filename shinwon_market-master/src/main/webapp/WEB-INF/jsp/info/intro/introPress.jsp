<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/include/head.jsp" %>
</head>
<body class="page-about">
<div id="skipNavigation"><!-- #skipNavigation -->
    <a href="#contents">컨텐츠 바로가기</a>
</div><!-- #skipNavigation -->
 
<%@ include file="/WEB-INF/jsp/info/include/top.jsp" %>

<div id="container"><!-- #container -->
    
    <h2 class="semantic">컨텐츠 영역</h2>

    <div id="visual"><!-- #visual -->
        <div class="wrap">
            <strong>보도자료</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/intro/introCompany.do" class="home"><span>마켓플랜트 소개</span></a>
            <span class="gt">&gt;</span>
            <strong>보도자료</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">
	
        

        <div id="contents" class="mb50"><!-- #contents -->
        
        	<h3 class="title">보도자료</h3>

            <table class="bbs-list" border="0" cellpadding="0" cellspacing="0"><!-- bbs-list -->
            <caption>번호, 제목, 등록일, 조회수로 구성된 보도자료 목록입니다.</caption>
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
            <div class="section-pagination" id="press_pg">
				<ui:frontpaging paging="${paging }" jsFunction="goPage" />
			</div>
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->
<form name="frm" id="frm">
	<input type="hidden" id="PRS_RLS_IDX" name="PRS_RLS_IDX" value=""/>
	<input type="hidden" id="cPage" name="cPage" value="<c:out value="${commandMap.cPage}"/>"/>
</form>
<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
<script>
goPage		= function(page){
//	alert("goReqPage");
	$("#cPage").val(page);
	$.ajax({
		type		: "POST",
		url			: "/info/intro/introPressListAjax.do",
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
					
// 					<tr>
// 	                    <td>공지</td>
// 	                    <td class="subject"><a href="javascript:;">2015년 11월 카드 이벤트 혜택안내</a></td>
// 	                    <td>2015-10-30</td>
// 	                    <td>1,234</td>
// 	                </tr>
					
					innerHtml += '<tr>';
					if(item.PRS_RLS_TOP_YN=="Y")innerHtml += '<td><span class="warning">공지</span></td>';
					else innerHtml += '<td>'+((totalCount+1) - item.RNUM)+'</td>';
					innerHtml += '<td class="subject"><a href="javascript:goView('+item.PRS_RLS_IDX+');">'+item.PRS_RLS_TITLE;
					if (item.NEWMARK == 'Y'){
						innerHtml += '<i class="ico_new"><span class="blind">new</span></i>';
					}
					innerHtml += '</a></td>';
					innerHtml += '<td>'+item.PRS_RLS_REG_DT+'</td>';
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
	$frm.attr({"action":"<c:out value="${brandDomain}" />/info/intro/introPressView.do", "target":"_self", "method":"post"}).submit();
	
};

var cPage = '<c:out value="${commandMap.cPage}"/>';
if(cPage=="")cPage=1;
goPage(cPage);

</script>

</body>
</html>