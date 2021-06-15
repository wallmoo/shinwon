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
            <h2>공지사항</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <table class="bbs-list" border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
        <caption>제목, 등록일, 조회수로 구성된 공지사항 목록입니다.</caption>
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
	        <c:forEach var="row" items="${topList }" varStatus="i">
		            <tr>
		                <td class="text-left">
		                    <a href="javascript:goDtl('<c:out value="${row.BRD_NTS_IDX}" />');"><c:out value="${row.BRD_NTS_TITLE}" /></a>
		                </td>
		                <td><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy.MM.dd"/></td>
		                <td><fmt:formatNumber value="${row.BRD_NTS_READ_CNT }" groupingUsed="true" /></td>
		            </tr>
        	</c:forEach>
        	<c:forEach var="row" items="${list }" varStatus="i">
	            <tr>
	                <td class="text-left">
	                    <a href="javascript:goDtl('<c:out value="${row.BRD_NTS_IDX}" />');"><c:out value="${row.BRD_NTS_TITLE}" /></a>
	                </td>
	                <td><ui:formatDate value="${row.BRD_NTS_REG_DT }" pattern="yyyy.MM.dd"/></td>
	                <td><fmt:formatNumber value="${row.BRD_NTS_READ_CNT }" groupingUsed="true" /></td>
	            </tr>
        	</c:forEach>
        </tbody>
        </table><!-- // table-a -->
		<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}" />"/>
		<form id="frm">
			<input type="hidden" name="BRD_NTS_IDX" id="BRD_NTS_IDX" />
		</form>
	</article>
	<!--// #container E -->


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
			url			: "/mobile/customer/noticeBoardListAjax.do",
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
						var BRD_NTS_READ_CNT = 0;
						if(item.BRD_NTS_READ_CNT!="")BRD_NTS_READ_CNT =setComma(item.BRD_NTS_READ_CNT);
						
						var BRD_NTS_REG_DT =  item.BRD_NTS_REG_DT;
						BRD_NTS_REG_DT = BRD_NTS_REG_DT.substr(0,4)+'.'+BRD_NTS_REG_DT.substr(4,2)+'.'+BRD_NTS_REG_DT.substr(6,2);
							
						innerHtml += '<tr>';
						innerHtml += '<td class="text-left">';
						innerHtml += '<a href="javascript:goDtl("'+item.BRD_NTS_IDX+'")">'+item.BRD_NTS_TITLE+'</a>';
						innerHtml += '</td>';
						innerHtml += '<td>'+BRD_NTS_REG_DT+'</td>';
						innerHtml += '<td>'+BRD_NTS_READ_CNT+'</td>';
						innerHtml += '</tr>';
						
					});
					//_idx.append(innerHtml).collapsibleset('refresh');
					_idx.append(innerHtml);
			 		
				}
					
			}
			 
		});
	}
	
		
}
function goDtl(BRD_NTS_IDX){
	var $frm = $("#frm");
	$("#BRD_NTS_IDX").val(BRD_NTS_IDX);
	//$("#frm").attr("action", "/mobile/customer/faqBoardList.do").submit();
	$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/customer/noticeBoardView.do", "target":"_self", "method":"post"}).submit();
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