<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->

			 <div class="title-nav">
                <h3 class="title-nav">나의 정보조회</h3>
                <a href="javascript:history.back(); return false;"><span class="sr-only">뒤로가기</span></a>
            </div>

            <form id="frm" name="frm">
				<input type="hidden" name="PASSWORD" value=""/>
			</form>

                <div class="padder info-login"><!-- padder -->

                    <div class="list-b guide">
                        <ul>
                            <li>개인정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</li>
                            <li>개인정보 보호를 위해 주기적으로 비밀번호를 변경해주시고, 타인에게 비밀번호가 노출되지 않도록 주의해주세요.</li>
                            <li>궁금하신 내용이나 불편사항은 고객센터 전화 02-6925-1160 으로 문의하여 주시기 바랍니다.</li>
                        </ul>
                    </div>

                    <div class="section-list info-login-form"><!-- section-list -->

                        <div class="article"><!-- article -->
                            <ul class="table"><!-- table -->
                                <li class="user-id">
                                    <strong class="th">아이디</strong>
                                    <span class="td">
                                        <c:out value="${sessionUser.MEM_MST_MEM_ID }" />
                                    </span>
                                </li>
                                <li class="user-pw">
                                    <strong class="th">비밀번호</strong>
                                    <span class="td">
                                        <input id="password" type="password" class="text" maxlength="15" />
                                    </span>
                                </li>
                            </ul><!-- // table -->
                        </div><!-- article -->
                    </div><!-- // section-list -->

                </div><!-- // padder -->

                <div class="section-button mt20"><!-- 더 보기 -->
                    <a href="javascript:;" id="goSubmit" onclick="goPwdChk();" class="button primary large"><span>확인</span></a>
                </div><!-- // 더 보기 -->

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>


<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
//<![CDATA[
$(function(){
	 //엔터 이벤트 
    $(document).on("keydown", "#password", function (e) {
        if(e.keyCode == 13){
            $("#goSubmit").trigger("click");
            return false;
        }
    });
});

//비밀번호 체크
function goPwdChk(){
	if($.trim($("#password").val()) == ""){
		alert("비밀번호를 입력해주세요.");
		$("#password").focus();
		return;
	}
	$("input[name=PASSWORD]").val($.trim($("#password").val()));
	$("#frm").attr({"action":"<c:out value="${mobileSslDomain}"/>/mobile/mypage/myInfoPwChkProc.do", "target":"_self", "method":"post"}).submit();
}
//]]>
</script>

</body>
</html>