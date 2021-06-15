<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-prDt">

<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

	<!-- 이하 페이지별 개별 컨텐츠 삽입 -->

				
		<!-- .pr_basic S -->
		<article id="container" class="container">
			<div class="minW contents"><!-- contents S -->
	            
	            <div class="main-refusal"><!-- main-refusal -->
	
	                <div class="title">
	                    <div class="holder">마켓플랜트 <span class="warning">이메일 수신거부</span></div>
	                </div>
	
	                <p class="mt50 core">
	                    마켓플랜트 쇼핑몰 이메일을<br />
	                    구독해 주셔서 감사합니다.
	                </p>
	
	                <p class="mt20">
	                    이메일 수신을 거부하시면<br />
	                    마켓플랜트의 다양한 할인혜택 및 이벤트/기획전 정보를 받아보실 수 없습니다.
	                </p>
	
	                <p class="mt10">
	                    마켓플랜트 이메일을 수신거부 하시겠습니까?
	                </p>
	
	                <p class="mt20">
	                    이메일 주소 : <span class="mail">${emailMemberInfo.CON_MEM_MST_MAIL}</span>
	                </p>
	
	                <div class="section-button"><!-- section-button -->
	                    <a href="javascript:rejectReceive('Y');" class="btn_st2 btn_rd large"><span>예</span></a>
	                    <a href="javascript:rejectReceive('N');" class="btn_st2 btn_blk777 large"><span>아니오</span></a>
	                </div><!-- // section-button -->
	            </div><!-- // main-refusal -->
	
			</div><!--// .contents E -->
		</article>
		<!--// .pr_basic E -->
		<form id="frm" name="frm">
			<input type="hidden" id="MAILMEMID" name="MAILMEMID" value="${emailMemberInfo.MEM_MST_MEM_ID}" />
			<double-submit:preventer/> 
		</form>

	<!--// #container E -->
	<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->
	
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
</section>

<!-- 파일 다운로드용 폼 -->
<form name="fileForm" id="fileForm">
     <input type="hidden" name="CMM_FLE_IDX" value=""/>
     <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
     <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
</form>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script src="<c:out value="${cdnDomain}" />/pc/js/vendor/jquery.tmpl.min.js"></script>
<script>
$(function(){
	
	rejectReceive = function(txt){
		if(txt == "N"){
			location.href = "<c:out value="${serverSslDomain}" />/pc/main/index.do";
		}else if(txt == "Y"){
			
			// 확인 클릭 이벤트
    		$.ajax({
                async : false,
                type : "POST",
                data : {"MAILMEMID":$("#MAILMEMID").val()},
                url : "<c:out value="${serverSslDomain}" />/pc/email/memberEmailYnModifyAjax.do",
                success : function (data) {
                    if(data.successYn == "Y"){
                        if(data.resultYn == "N"){
                        	alert("올바른 접근이 아닙니다.");
                        	return;
                        }
                        else{
                        	alert("수신거부 되었습니다.");
                        	$("#frm").attr({"action":"<c:out value="${serverSslDomain}" />/pc/main/index.do", "target":"_self", "method":"post"}).submit();
                        }
                    }else{
                        alert("데이터 전송중 데이터가 누락 되었습니다.\n다시 시도해 주십시오.");
                        return;
                    }
                },
                error : function () {
                    alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
                }
            });
		}
	};
	
});
</script>
</body>
</html>