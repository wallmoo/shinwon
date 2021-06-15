<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-detail blackyak"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->

     <div id="contents"><!-- contents -->

                <div class="section-title"><!-- section-title-->
                    <h3><span>상품 Q&amp;A 수정</span></h3>
                    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
                </div><!-- // section-title -->
                
				<form id="frm" name="frm">
					<input type="hidden" id="prdMstCd"    name="prdMstCd" value="${commandMap.PRD_MST_CD}" />
					<input type="hidden" id="BRD_INQ_IDX" name="BRD_INQ_IDX" value="${commandMap.BRD_INQ_IDX}" />
					<double-submit:preventer/> 
	 			<div class="container"><!-- container -->
                    <div class="wrap gutter"><!-- wrap -->
 
                        <p class="ding-a mt10 mb10">
                            본 게시판과 관련이 없거나 광고성, 단순반복성, 저작권침해 등 불건전한 내용을 올리실 경우 통보 없이 임의로 삭제 처리될 수 있습니다.
                        </p>

                        <div class="table table-form"><!-- table -->
                            <div class="row">
                                <div class="cell sbj">
                                    제목
                                    <span class="warning ir inline">*<em>필수입력</em></span>
                                </div>
                                <div class="cell fields">
                                    <input type="text" class="text xlarge" name="qna-title" id="qna-title" placeholder="제목을 입력해주세요." maxlength="100" value="${qnaInfo.BRD_INQ_TITLE}"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="cell sbj">
                                    내용
                                    <span class="warning ir inline">*<em>필수입력</em></span>
                                </div>
                                <div class="cell fields">
                                    <textarea cols="30" rows="5" name="qna-comment" id="qna-comment" class="textarea xlarge" placeholder="최소 20글자 이상 입력해주세요.">${qnaInfo.BRD_INQ_CONTENTS}</textarea>
                                </div>
                            </div>
                        </div><!-- // table -->

                        <p class="ding-a mb20">
                            이미지 첨부는 PC버전에서만 지원합니다.
                        </p>

                        <div class="section-button actions"><!-- actions -->
                            <div class="col-1-2 text-right"><a href="<c:out value="${mobileDomain}"/>/mobile/product/productQnaList.do?prdMstCd=${productInfo.PRD_MST_CD}" class="button primary full"><span>취소</span></a></div>
                            <div class="col-1-2"><a href="javascript:writeQna();" class="button warning full"><span>확인</span></a></div>
                        </div><!-- // actions -->

                    </div><!-- // wrap -->
                </div><!-- // container -->
				</form>
            </div><!-- // inner -->

	
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
$.params = ($.params !== undefined) ? $.params : [];

$(function(){
	
	writeQna = function()
	{
		if($.trim($("#qna-title").val()) == "")
		{
			alert("상품문의 제목을 입력해주세요.");
			$("#qna-title").focus();
			return;
		}
		
		if($.trim($("#qna-comment").val()).length < 20)
		{
			alert("상품문의 내용은 최소 20글자 이상 입력해주세요.");
			$("#qna-comment").focus();
			return;
		}
		else if($.trim($("#qna-comment").val()).length > 500)
		{
			alert("상품문의 내용은 최대 500자까지 등록 가능합니다.");
			$("#qna-comment").focus();
			return;
		}
		
		var $frm = $("#frm");
    	if(confirm("상품문의를 수정하시겠습니까?"))
        {
			$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/product/productQnaUpdate.do", "target":"_self", "method":"post"}).submit();
        }
    };
		
});

</script>
</body>
</html>    