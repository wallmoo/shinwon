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
            <strong>고객지원센터</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/support/supportNotice.do" class="home"><span>고객지원센터</span></a>
            <span class="gt">&gt;</span>
            <strong>A/S센터안내</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">
        <div id="contents" class="cs_con_d mb50"><!-- #contents -->

            <h3 class="title">고객지원센터</h3>
			<ul class="tab_d">
				<li class="f"><a href="<c:out value="${brandDomain}" />/info/support/supportNotice.do#cs_con_d"><span>공지사항</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportPraise.do#cs_con_d"><span>마켓플랜트 칭찬하기</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportCounsel.do#cs_con_d"><span>상담하기</span><i class="ico_ar"></i></a></li>
				<li><a href="<c:out value="${brandDomain}" />/info/support/supportFAQ.do#cs_con_d"><span>FAQ</span><i class="ico_ar"></i></a></li>
				<li class="l on"><a href="<c:out value="${brandDomain}" />/info/support/supportAS.do#cs_con_d"><span>A/S 센터안내</span><i class="ico_ar"></i></a></li>
			</ul>

			 <p class="ti_history">
				사용하시던 제품에 문제가 생기셨나요?<br/>
				브랜드 A/S 센터에서 바로 해결하세요!
			</p>

            <table class="table-a table-col mt30 table_as" border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
            <caption>분류, 브랜드, 대표전화, 홈페이지로 구성된 A/S센터 목록입니다.</caption>
            <colgroup>
                <col style="width: 12%;" />
                <col style="width: 25%;" />
                <col style="width: 25%;" />
                <col style="width: auto;" />
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">분류</th>
                    <th scope="col">브랜드</th>
                    <th scope="col">대표전화</th>
                    <th scope="col">홈페이지</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th socpe="row" rowspan="3">상품</th>
                    <td>마켓플랜트</td>
                    <td>02-1111-1111</td>
                    <td></td>
                </tr>
            </tbody>
            </table><!-- // table-a -->
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->

 
<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>
<script type="text/javascript">
$(document).ready(function(){

    // faq
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

});
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
