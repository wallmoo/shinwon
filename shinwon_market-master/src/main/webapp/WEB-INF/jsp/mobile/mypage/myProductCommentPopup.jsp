<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/include/head.jsp" %>

<style type="text/css">
.searchPane {display:none;}
</style>

</head>
<body class="popup mypage-comment" data-size="450x520"><!-- page class : main, 팝업창 크기 -->

<h1 class="sr-only">blackyak Mall Popup</h1>

<div id="popupContainer" class="popup-container"><!-- popup-container -->
    
    <h3 class="title">상품평 작성</h3>

    <div class="wrap"><!-- padder -->

        <div class="border-top-thick border-bottom-thick form"><!-- form -->

            <div class="clearfix product">
                <div class="logo">
                    <img src="${cdnDomain}${BI}" alt="<ui:brand brandCD="${row.PRD_MST_BRAND_CD }"/>" />
                </div>
                <div class="text">
                    <p>
                        <strong><c:out value="${row.PRD_MST_NM }"/></strong>
                        <span>${productCategory.PRD_CTG_NM } / 상품코드 <c:out value="${row.PRD_PRD_MST_CD }"/></span>
                    </p>
                </div>
            </div>

            <div class="guide">
                <p>
                    - 상품평은 상품을 구매한 회원만 작성 가능합니다.<br />
                    - 상품에 대한 문의는 상품 Q&amp;A를 이용해주세요.<br />
                    - 상품평과 관련없는 글은 관리자가 임의로 삭제합니다.
                </p>
            </div>

			<form id="frm" name="frm" enctype="multipart/form-data" method="post">
			<input type="hidden" name="PRD_REV_IDX" value="${commandMap.PRD_REV_IDX}">
			<input type="hidden" name="PRD_PRD_MST_CD" value="${commandMap.PRD_PRD_MST_CD}">
			<input type="hidden" name="PRD_ORD_PRD_IDX" value="${commandMap.PRD_ORD_PRD_IDX}">
			<input type="hidden" id="pageStatus" name="pageStatus" value="${commandMap.pageStatus}">
			<double-submit:preventer/>
            <div class="panel">
                <p>
                    <label for="design1">디자인 평점</label>
                    <input id="design1" name="PRD_REV_DESIGN_STAR" type="radio" class="radio" value="1" <c:if test="${row.PRD_REV_DESIGN_STAR eq 1}">checked="checked"</c:if>/>
                    <label for="design1" class="inline"><span class="star star-1"><em>별 1개</em></span></label>
                    <input id="design2" name="PRD_REV_DESIGN_STAR" type="radio" class="radio" value="2" <c:if test="${row.PRD_REV_DESIGN_STAR eq 2}">checked="checked"</c:if>/>
                    <label for="design2" class="inline"><span class="star star-2"><em>별 2개</em></span></label>
                    <input id="design3" name="PRD_REV_DESIGN_STAR" type="radio" class="radio" value="3" <c:if test="${row.PRD_REV_DESIGN_STAR eq 3}">checked="checked"</c:if>/>
                    <label for="design3" class="inline"><span class="star star-3"><em>별 3개</em></span></label>
                    <input id="design4" name="PRD_REV_DESIGN_STAR" type="radio" class="radio" value="4" <c:if test="${row.PRD_REV_DESIGN_STAR eq 4}">checked="checked"</c:if>/>
                    <label for="design4" class="inline"><span class="star star-4"><em>별 4개</em></span></label>
                    <input id="design5" name="PRD_REV_DESIGN_STAR" type="radio" class="radio" value="5" <c:if test="${row.PRD_REV_DESIGN_STAR eq 5 || empty row.PRD_REV_DESIGN_STAR}">checked="checked"</c:if>/>
                    <label for="design5" class="inline"><span class="star star-5"><em>별 5개</em></span></label>
                </p>
                <p>
                    <label for="quality1">품질 평점</label>
                    <input id="quality1" name="PRD_REV_QUALITY_STAR" type="radio" class="radio" value="1" <c:if test="${row.PRD_REV_QUALITY_STAR eq 1}">checked="checked"</c:if>/>
                    <label for="quality1" class="inline"><span class="star star-1"><em>별 1개</em></span></label>
                    <input id="quality2" name="PRD_REV_QUALITY_STAR" type="radio" class="radio" value="2" <c:if test="${row.PRD_REV_QUALITY_STAR eq 2}">checked="checked"</c:if>/>
                    <label for="quality2" class="inline"><span class="star star-2"><em>별 2개</em></span></label>
                    <input id="quality3" name="PRD_REV_QUALITY_STAR" type="radio" class="radio" value="3" <c:if test="${row.PRD_REV_QUALITY_STAR eq 3}">checked="checked"</c:if>/>
                    <label for="quality3" class="inline"><span class="star star-3"><em>별 3개</em></span></label>
                    <input id="quality4" name="PRD_REV_QUALITY_STAR" type="radio" class="radio" value="4" <c:if test="${row.PRD_REV_QUALITY_STAR eq 4}">checked="checked"</c:if>/>
                    <label for="quality4" class="inline"><span class="star star-4"><em>별 4개</em></span></label>
                    <input id="quality5" name="PRD_REV_QUALITY_STAR" type="radio" class="radio" value="5" <c:if test="${row.PRD_REV_QUALITY_STAR eq 5 || empty row.PRD_REV_QUALITY_STAR}">checked="checked"</c:if>/>
                    <label for="quality5" class="inline"><span class="star star-5"><em>별 5개</em></span></label>
                </p>
                <p>
                    <label for="size1">사이즈 평점</label>
                    <input id="size1" name="PRD_REV_SIZE_STAR" type="radio" class="radio" value="1" <c:if test="${row.PRD_REV_SIZE_STAR eq 1}">checked="checked"</c:if> />
                    <label for="size1" class="inline"><span class="star star-1"><em>별 1개</em></span></label>
                    <input id="size2" name="PRD_REV_SIZE_STAR" type="radio" class="radio" value="2" <c:if test="${row.PRD_REV_SIZE_STAR eq 2}">checked="checked"</c:if>/>
                    <label for="size2" class="inline"><span class="star star-2"><em>별 2개</em></span></label>
                    <input id="size3" name="PRD_REV_SIZE_STAR" type="radio" class="radio" value="3" <c:if test="${row.PRD_REV_SIZE_STAR eq 3}">checked="checked"</c:if>/>
                    <label for="size3" class="inline"><span class="star star-3"><em>별 3개</em></span></label>
                    <input id="size4" name="PRD_REV_SIZE_STAR" type="radio" class="radio" value="4" <c:if test="${row.PRD_REV_SIZE_STAR eq 4}">checked="checked"</c:if>/>
                    <label for="size4" class="inline"><span class="star star-4"><em>별 4개</em></span></label>
                    <input id="size5" name="PRD_REV_SIZE_STAR" type="radio" class="radio" value="5" <c:if test="${row.PRD_REV_SIZE_STAR eq 5 || empty row.PRD_REV_SIZE_STAR}">checked="checked"</c:if>/>
                    <label for="size5" class="inline"><span class="star star-5"><em>별 5개</em></span></label>
                </p>
                <p>
                    <label for="comment2">제목</label>
                    <input id="comment2" name="PRD_REV_TITLE" type="text" class="text xlarge" title="제목" value="<c:out value="${row.PRD_REV_TITLE }"/>" maxlength="50" placeholder="제목을 입력하세요. 최대 20자까지 입력가능합니다."/>
                </p>
                <p>
                    <label for="comment3">내용</label>
                    <textarea class="textarea" name="PRD_REV_CONTENTS" id="comment3" cols="30" rows="10" placeholder="상품에 대한 요청이나 아이디어, 사용 후 느낀점 등을 적어주세요. 더 나은 상품을 위해 고객님의 소중한 정보를 적극 반영하도록 하겠습니다."></textarea>
                </p>
            </div><!-- // panel -->
            </form>
        </div><!-- // form -->

        <div class="clearfix section-button"><!-- buttons -->
            <a href="javascript:;" onclick="goSubmit();" class="button large primary"><span>상품평 등록</span></a>
            <a href="javascript:;" class="button large js-close"><span>취소</span></a>
        </div><!-- // buttons -->
        
        <!-- 파일 다운로드용 폼 -->
        <form name="fileForm" id="fileForm">
             <input type="hidden" name="CMM_FLE_IDX" value=""/>
             <input type="hidden" name="CMM_FLE_SAVE_PATH" value="" />
             <input type="hidden" name="CMM_FLE_ORG_NM" value="" />
        </form>

    </div><!-- // wrap -->

</div><!-- // popup-container -->

<script src="<c:out value="${cdnDomain}" />/mobile/js/plugins.js" charset="utf-8"></script>
<!--[if (gt IE 8)|!(IE)]> <!--> <script src="<c:out value="${cdnDomain}" />/mobile/js/plugins/jquery.touchSwipe.1.3.3.min.js" charset="utf-8"></script> <!--<![endif]-->
<script src="<c:out value="${cdnDomain}" />/mobile/js/base.js" charset="utf-8"></script>
<script src="<c:out value="${cdnDomain}" />/mobile/js/main.js" charset="utf-8"></script>
<!--
<script>document.write('<script src="<c:out value="${cdnDomain}" />/pc/js/main.js?timeStamp='+Math.floor(+new Date()/1000)+'" charset="utf-8"><\/script>');</script>
-->
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/defer.js" charset="utf-8" defer></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/jquery.validate.js"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/mobile/js/common.js"></script>
<script>
//<![CDATA[
$(function() {
	//내용 <br/>태그 치환
	var textarea = "${row.PRD_REV_CONTENTS }";
	textarea = textarea.replace(/\<br\/\>/gi, "\r\n");  
	//console.log("내용==="+textarea);
	$("textarea[name=PRD_REV_CONTENTS]").val(textarea);
	
	// 파일 다운로드
	$(document).on("click", ".file-list-title", function () {
	    var $fileForm = $("#fileForm");
	    var $this = $(this);
	    $fileForm.find("input[name='CMM_FLE_IDX']").val($this.data("cmm_fle_idx"));
	    $fileForm.find("input[name='CMM_FLE_SAVE_PATH']").val($this.data("cmm_fle_save_path"));
	    $fileForm.find("input[name='CMM_FLE_ORG_NM']").val($.trim($this.text()));
	    $fileForm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/common/commonFileDownload.do", "target":"_self", "method":"post"}).submit();
	});
});

//상품평 등록/수정
function goSubmit(){
	if($.trim($("#comment2").val()) == ""){
		alert("제목을 입력해주세요.");
		$("#comment2").focus();
		return;
	}
	
	if($.trim($("#comment3").val()) == ""){
		alert("내용을 입력해주세요.");
		$("#comment3").focus();
		return;
	}
	
	var pageStatus = $("#pageStatus").val();
	if(pageStatus == "N"){
		if(confirm("상품평을 등록하시겠습니까?")){
			$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myProductCommentInsert.do", "target":"_self"}).submit();						
		}
	}else if(pageStatus == "M"){
		if(confirm("상품평을 수정하시겠습니까?")){
			$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myProductCommentModify.do", "target":"_self"}).submit();						
		}
	}
}
//]]>
</script>
</body>
</html>