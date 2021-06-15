<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-customer"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>당첨자발표</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <table class="bbs-list" border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
        <caption>제목, 등록일, 조회수로 구성된 당첨자발표 목록입니다.</caption>
        <colgroup>
            <col style="width: auto;">
            <col style="width: 22%;">
            <col style="width: 20%;">
        </colgroup>
        <thead>
            <tr>
                <th scope="col">제목</th>
                <th scope="col">등록일</th>
                <th scope="col">조회수</th>
            </tr>
        </thead>
        <tbody class="_scroll_list_ck">
        	<c:choose>
        		<c:when test="${not empty list }">
        			<c:forEach var="row" items="${list }" varStatus="i">
			            <tr>
			                <td class="text-left">
			                    <a href="javascript:goDtl('<c:out value="${row.EVT_WIN_IDX}" />');"><c:out value="${row.EVT_WIN_NM}" /> </a>
			                    <c:if test="${row.NEWMARK eq 'Y'}">
			                    	<span class="new">new<em class="blind">최근 게시글</em></span>
			                    </c:if>
			                </td>
			                <td><ui:formatDate value="${row.EVT_WIN_REG_DT }" pattern="yyyy.MM.dd"/></td>
			                <td>
			                	<c:if test="${not empty row.EVT_WIN_CNT}"> <fmt:formatNumber value="${row.EVT_WIN_CNT }" groupingUsed="true" /></c:if>
			                	<c:if test="${empty row.EVT_WIN_CNT}">0</c:if>
			                </td>
			            </tr>
		        	</c:forEach>
        		</c:when>
        		<c:otherwise>
        			<tr>
        				<td colspan="3" style="align:center;">게시글이 없습니다.</td>
        			</tr>
        		</c:otherwise>
        	</c:choose>
        	
        </tbody>
        </table><!-- // table-a -->
        <input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}" />"/>
		<form id="frm">
			<input type="hidden" name="EVT_WIN_IDX" id="EVT_WIN_IDX" />
		</form>
			
	</article>

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script src="<c:out value="${mobileDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
 
$.com.win_scrollList = true;//스크롤 할거야~
function _return_scrollList(_idx, _reNum){
	 
	/*
		_idx = 리스트감싸고있는 객체
		_reNum = 리턴 몇번째넘어왔는지
		*/
	//console.log("_reNum : "+_reNum);
	var page = _reNum + 2;
	var totalCount = $("#totalCount").val();
	
	if(parseInt(totalCount) >= (parseInt(page)-1) * 20)
	{	
		$.ajax({
			type		: "POST",
			url			: "/mobile/customer/eventWinListAjax.do",
			dataType	: "json",
			async       : false,
			data		: {	"cPage": page
							},
			success : function(data) {
				var innerHtml	= '';
				
				if(data.totalPageCount == 0){
					innerHtml = "";
				}else{
					var listNum		= data.listNum;
					$.each(data.resultMap.list, function(i,item){
						var EVT_WIN_CNT = 0;
						if(item.EVT_WIN_CNT!="")EVT_WIN_CNT =setComma(item.EVT_WIN_CNT);
						
						var EVT_WIN_REG_DT =  item.EVT_WIN_REG_DT;
						EVT_WIN_REG_DT = EVT_WIN_REG_DT.substr(0,4)+'.'+EVT_WIN_REG_DT.substr(4,2)+'.'+EVT_WIN_REG_DT.substr(6,2);
							
						
						 
						innerHtml += '<tr>';
						innerHtml += '<td class="text-left">';
						innerHtml += '<a href="javascript:goDtl("'+item.EVT_WIN_IDX+'");">'+item.EVT_WIN_NM+'</a>';
						if(item.NEWMARK=="Y")
						{
							innerHtml += '<span class="new">new<em class="blind">최근 게시글</em></span>';
						}
						innerHtml += '</td>';
						innerHtml += '<td>'+EVT_WIN_REG_DT+'</td>';
						innerHtml += '<td>'+EVT_WIN_CNT+'</td>';
						innerHtml += '</tr>';
						
					});
					//_idx.append(innerHtml).collapsibleset('refresh');
					_idx.append(innerHtml);
			 		
				}
					
			}
			 
		});
	}
	
		
}
function goDtl(EVT_WIN_IDX){
	var $frm = $("#frm");
	$("#EVT_WIN_IDX").val(EVT_WIN_IDX);
	//$("#frm").attr("action", "/mobile/customer/faqBoardList.do").submit();
	$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/customer/eventWinView.do", "target":"_self", "method":"post"}).submit();
	//$("#frm").submit();
};

function goSearch(){
	var $frm = $("#searchFrm");
	var searchWord = $("#faqSearch").val();
	$("#searchWord").val(searchWord);
	//$("#frm").attr("action", "/mobile/customer/faqBoardList.do").submit();
	$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/customer/faqSearchList.do", "target":"_self", "method":"post" }).submit();
	//$("#frm").submit();
};

 
 
//]]>
</script>
</body>
</html>