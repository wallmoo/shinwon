<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-main"><%-- page class : main, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<h1>장바구니 테스트</h1>

<h1>사용자 상태 :
<c:if test="${ empty __MALL_USER_SESSION_INFO__ }"> 비회원 </c:if>
<c:if test="${ not empty __MALL_USER_SESSION_INFO__ }">
	회원 - 
	<c:if test="${ __MALL_USER_SESSION_INFO__.MEM_MST_MEMBER_GRADE eq 'ZK00' }">일반</c:if>
	<c:if test="${ __MALL_USER_SESSION_INFO__.MEM_MST_MEMBER_GRADE eq 'ZK13' }">임직원</c:if>
	<c:if test="${ __MALL_USER_SESSION_INFO__.MEM_MST_MEMBER_GRADE eq 'ZK14' }">계열사</c:if>
	<c:if test="${ __MALL_USER_SESSION_INFO__.MEM_MST_MEMBER_GRADE eq 'ZK15' }">VIP</c:if>
</c:if>
</h1><br/>

<form name="cartForm" id="cartForm">

PS / W LITE WALK 2(YUNA14)  / LSPW0MW13F102 / 
<select class="prd_opt" data-mem_prd_mst_cd="PW0MW13F102">
<option value="">선택하세요</option>
<option value="13070">250</option>
<option value="24416">255</option>
<option value="16898">260</option>
<option value="20678">265</option>
<option value="13071">270</option>
<option value="24417">275</option>
<option value="9382">280</option>
<option value="28188">285</option>
</select><br/><br/>

SK / 남녀공용 기능성 스트레치소재 트레이닝 하의(슬림 핏) / LSSS3UN14S811 /
<select class="prd_opt" data-mem_prd_mst_cd="SS3UN14S811">
<option value="">선택하세요</option>
<option value="28196">065</option>
<option value="24426">070</option>
<option value="24427">085</option>
<option value="9399">090</option>
<option value="20685">095</option>
</select><br/><br/>

PS / 여자 등산 장갑 OG-S022  / PW5OG14S022 /
<select class="prd_opt" data-mem_prd_mst_cd="PW5OG14S022">
<option value="">선택하세요</option>
<option value="5806">00S</option>
<option value="1976">00M</option>
</select><br/><br/>

<br/>

<p style="margin-top:30px;">
선택상품 : [상품코드] <input type="text" name="MEM_PRD_MST_CD" id="MEM_PRD_MST_CD" value=""/> 
[옵션코드] <input type="text" name="MEM_PRD_OPT_IDX" id="MEM_PRD_OPT_IDX" value=""/>
</p>

수량 : <select name="MEM_CRT_CNT" id="MEM_CRT_CNT"><c:forEach begin="1" end="99" var="i"><option value="<c:out value="${i}"/>"><c:out value="${i}"/></option></c:forEach></select><p style="margin-top:30px;"><input type="button" value="장바구니" class="add_cart_btn"/></p>

</form>


<textarea style="margin-top:30px;width:600px;height:250px;">로그인 정보 : <c:out value="${__MALL_USER_SESSION_INFO__}"/></textarea>
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<!-- 장바구니 관련 스크립트 -->
<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){
	
	$('.prd_opt').change(function(){
		var MEM_PRD_MST_CD = $(this).data('mem_prd_mst_cd');
		var MEM_PRD_OPT_IDX = $(this).val();
		var MEM_CRT_CNT = $('#MEM_CRT_CNT').val();
		window.jquery || console.log('MEM_PRD_MST_CD: ' + MEM_PRD_MST_CD);
		window.jquery || console.log('MEM_PRD_OPT_IDX: ' + MEM_PRD_OPT_IDX);
		window.jquery || console.log('MEM_CRT_CNT: ' + MEM_CRT_CNT);
		
		$('#MEM_PRD_MST_CD').val(MEM_PRD_MST_CD);
		$('#MEM_PRD_OPT_IDX').val(MEM_PRD_OPT_IDX);
	});
	
	$('.add_cart_btn').click(function(){
		
		if($('#MEM_PRD_OPT_IDX').val()==''){
			alert('사이즈를 선택해주세요.');
			return;
		}
		
		$.ajax
        ({
            async : false,
            type : "POST",
            data : {"MEM_PRD_MST_CD":$('#MEM_PRD_MST_CD').val(),"MEM_PRD_OPT_IDX":$('#MEM_PRD_OPT_IDX').val(),"MEM_CRT_CNT":$('#MEM_CRT_CNT').val()},
            url : "/mobile/cart/insertCartAjax.do",
            success : function (data) 
            { 
            	window.jquery || console.log('장바구니 등록 결과: ' + data.result);

            	// 0 : 장바구니 등록 성공
            	// 1 : 판매불가 상품 (등록대기/미판매 등)
            	// 2 : 재고수량 부족
            	// 3 : 품절상품(재고:0)
            	
            	switch(data.result){
            	case '0':
            		if(confirm('해당 상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?')){
            			$('#_blank_form').attr({'action':'<c:out value="/mobile/cart/cartlist.do','method':'get'}).submit();
            		}
            		break;
            	case '-1':
            		alert('해당 상품은 판매가 중지되었습니다.');
            		break;
            	case '-2':
            		alert('선택하신 옵션의 재고수량이 부족합니다.');
            		break;
            	case '-3':
            		alert('선택하신 옵션은 품절되었습니다.');
            		break;
            	}
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
            }
		});
	});
});
//]]>
</script>

</body>
</html>