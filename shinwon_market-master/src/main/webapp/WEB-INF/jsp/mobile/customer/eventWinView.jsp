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

        <h3 class="bbs-title"><c:out value="${row.EVT_WIN_NM}" /></h3>

        <div class="ct bbs-desc"><!-- bbs-desc -->
            <div class="fl date">
                <span class="blind">등록 날짜</span><ui:formatDate value="${row.EVT_WIN_REG_DT }" pattern="yyyy.MM.dd"/>
            </div>
            <div class="fr hit">
                조회수 <fmt:formatNumber value="${row.EVT_WIN_CNT }" groupingUsed="true" />
            </div>
        </div><!-- // bbs-desc -->

        <div class="bbs-winner-view"><!-- bbs-winner-view -->
            <div class="object">
                <img src="<c:out value="${cdnDomain}" />/mobile/img/custom/winner_obj.png" alt="당첨자 발표" />
            </div>
            <div class="title">
                <span class="xlarge"><c:out value="${row.EVT_WIN_SUB_CPY}" /></span><br />
                <strong class="xxlarge"><c:out value="${row.EVT_WIN_MAN_CPY}" /></strong>
            </div>
            <div class="check-form">
                <p><label for="winnerSearch">휴대폰번호 뒷자리를 검색해보세요.</label></p>
                <div class="mt10">
                    <input type="text" id="winnerSearch" class="text" />
                    <a href="javascript:searchWin();" class="button primary small"><span>검색</span></a>
                </div>
            </div>
            <div class="copy">
                <span class="small">
                    ${row.EVT_WIN_ATN}
                </span>
            </div>
        </div><!-- // bbs-winner-view -->

        <div class="winner-list"><!-- winner-list -->
        <c:forEach var="infRow" items="${infList }" varStatus="i">
            <h4><c:out value="${infRow.WIN_INF_NM}" /></h4>
            <div class="list">
                <ul class="ct">
                <c:forEach var="winRow" items="${winList }" varStatus="i">
                	<c:if test="${infRow.WIN_INF_NM eq winRow.WIN_INF_NM}">
                    	<li><c:out value="${winRow.WIN_INF_MEM_NM}" />(<c:out value="${winRow.WIN_INF_MEM_HP3}" />)</li>
                    </c:if>
                </c:forEach>
                </ul>
            </div>
        </c:forEach>
        </div><!-- // winner-list -->
			
	</article>

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script src="<c:out value="${mobileDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(function(){
	searchWin 	= function(){
		
		if($("#winnerSearch").val() == ""){
			alert("휴대폰 뒷자리를 입력하세요");
			return;
		}
	    //검색 찾는 로직 구현
	    $.ajax({
	    	async 	: false,
	    	type 	: "POST",
	    	data	: {
	    		"EVT_MST_IDX" 	: "<c:out value="${row.EVT_MST_IDX}" />",
	    		"SEARCHKEY"		:  $("#winnerSearch").val()
	    	},
	    	url		: "<c:out value="${mobileDomain}" />/mobile/customer/eventWinSearchAjax.do",
			success : function(data) {
				alert(data.strResultMsg);
			},
			error 	: function(err) {
				//alert("오류가 발생하였습니다.\n[" + err.status + "]");
				window.jquery
						|| console
								.log('오류가 발생하였습니다: ' + err.status);
			}
	    });
	};
	
	$(document).on("keyup", "#winnerSearch", function(key){
		if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
            searchWin();
        }else{
        	$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
        }
	});
	
});

</script>
</body>
</html>