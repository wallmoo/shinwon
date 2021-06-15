<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>

<body class="page-basket blackyak"><!-- page-list -->

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title-->
	        <h3><span>상품평 작성</span></h3>
	        <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
	        <a href="#more" class="more"><span class="icon"><em>더 보기</em></span></a>
			<div id="more" class="sub">
			    <ul class="reset">
			        <li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileSslDomain}"/>/mobile/mypage/myShoppingList.do','_self');"><span>쇼핑내역</span></a></li>
					<li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myCouponUsableList.do"><span>쿠폰</span></a></li>
					<li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myPointList.do"><span>크라운</span></a></li>
					<li class="active"><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myProductCommentList.do"><span>상품평</span></a></li>
					<li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myProductInquiryList.do"><span>상품 Q&amp;A</span></a></li>
					<li><a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain}" />/mobile/mypage/myInquiryList.do','_self');"><span>1:1 문의</span></a></li>
					<li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/todayViewProductList.do"><span>오늘 본 상품</span></a></li>
					<li><a href="<c:out value="${mobileDomain}" />/mobile/mypage/myDeliveList.do"><span>배송주소록</span></a></li>
			        <li><a href="javascript:memberInfoModify();"><span>회원정보수정</span></a></li>
				    <li><a href="javascript:memberInfoDelete();"><span>회원탈퇴</span></a></li>
			    </ul>
			</div>
		</div><!-- // section-title -->
 
		<div class="container"><!-- container -->
			<div class="wrap gutter"><!-- wrap -->
				<p class="ding-a mt10 mb10">
				   	 본 게시판과 관련이 없거나 광고성, 단순반복성, 저작권침해 등 불건전한 내용을 올리실 경우 통보 없이 임의로 삭제 처리될 수 있습니다.
				</p>

				<p class="mt15">
				    <strong class="warning">* 표시된 항목은 필수 입력 사항입니다.</strong>
				</p>

				<c:if test="${not empty commandMap.pageStatus }">
					<div class="item-basket"><!-- item -->
						<div class="core">
	    					<div class="table">
						        <div class="cell pic">
						            <img src="<c:out value="${cdnDomain }${row.PRD_MST_IMG_URL_PATH }"/>" alt="${row.PRD_MST_NM}" class="thumb99"/>
						        </div>
					        	<div class="cell desc">
						            <div class="options">
						                <p class="name"><c:out value="${row.PRD_MST_NM}" /></p>
					                </div>
					                <div class="">
					                    <strong>작성일: </strong>
					                    <ui:formatDate value="${row.PRD_REV_REG_DT}" pattern="yyyy.MM.dd"/>
					                </div>
					            </div>
	        				</div>
	    				</div>
					</div><!-- // item -->
				</c:if>

				<form id="frm" name="frm" enctype="multipart/form-data">
					<input type="hidden" name="PRD_REV_IDX" value="${commandMap.PRD_REV_IDX}">
					<input type="hidden" id="PRD_ORD_PRD_IDX" name="PRD_ORD_PRD_IDX" value="<c:out value="${commandMap.PRD_ORD_PRD_IDX }"/>"/>
					<input type="hidden" id="PRD_PRD_MST_CD" name="PRD_PRD_MST_CD" value="<c:out value="${commandMap.PRD_PRD_MST_CD }"/>"/>
					<input type="hidden" id="orderCd" name="orderCd" value="<c:out value="${commandMap.ORD_MST_CD }"/>"/>
					<input type="hidden" name="pageStatus" value="${commandMap.pageStatus }"/>
				    <double-submit:preventer/>
					<div class="table table-form"><!-- table -->
					    <div class="row">
					        <div class="cell sbj">
					            만족도
					            <span class="warning ir inline">*<em>필수입력</em></span>
					        </div>
					        <div class="cell fields">
					            <select class="${not empty row.PRD_REV_SCORE_STAR ? 'select js-rate-selector-modify' : 'select js-rate-selector' }" name="PRD_REV_SCORE_STAR" id="PRD_REV_SCORE_STAR">
					                <option value="5" data-rate="5" <c:if test="${(empty row.PRD_REV_SCORE_STAR) || (row.PRD_REV_SCORE_STAR eq '5')}">selected="selected"</c:if>>5점</option>
					                <option value="4" data-rate="4" <c:if test="${row.PRD_REV_SCORE_STAR eq '4'}">selected="selected"</c:if>>4점</option>
					                <option value="3" data-rate="3" <c:if test="${row.PRD_REV_SCORE_STAR eq '3'}">selected="selected"</c:if>>3점</option>
					                <option value="2" data-rate="2" <c:if test="${row.PRD_REV_SCORE_STAR eq '2'}">selected="selected"</c:if>>2점</option>
					                <option value="1" data-rate="1" <c:if test="${row.PRD_REV_SCORE_STAR eq '1'}">selected="selected"</c:if>>1점</option>
					            </select>
					            <span class="star star-5"><em></em></span>					         
					        </div>
					    </div>
					    <div class="row">
					        <div class="cell sbj">
					            사이즈
					            <span class="warning ir inline">*<em>필수입력</em></span>
					        </div>
					        <div class="cell fields">
					            <select name="PRD_REV_SIZE_STAR" id="PRD_REV_SIZE_STAR" class="select">
					                <option value="" <c:if test="${empty row.PRD_REV_SIZE_STAR}">selected="selected"</c:if>>선택</option>
					                <option value="1" <c:if test="${row.PRD_REV_SIZE_STAR eq '1'}">selected="selected"</c:if>>사이즈가 작다</option>
					                <option value="2" <c:if test="${row.PRD_REV_SIZE_STAR eq '2'}">selected="selected"</c:if>>사이즈가 맞다</option>
					                <option value="3" <c:if test="${row.PRD_REV_SIZE_STAR eq '3'}">selected="selected"</c:if>>사이즈가 크다</option>
					            </select>
					        </div>
					    </div>
					    <div class="row">
					        <div class="cell sbj">
					            컬러
					            <span class="warning ir inline">*<em>필수입력</em></span>
					        </div>
					        <div class="cell fields">
					            <select name="PRD_REV_COLOR_STAR" id="PRD_REV_COLOR_STAR" class="select">
					                <option value="" <c:if test="${empty row.PRD_REV_COLOR_STAR}">selected="selected"</c:if>>선택</option>
					                <option value="1" <c:if test="${row.PRD_REV_COLOR_STAR eq '1'}">selected="selected"</c:if>>화면보다 밝다</option>
					                <option value="2" <c:if test="${row.PRD_REV_COLOR_STAR eq '2'}">selected="selected"</c:if>>화면과 같다</option>
					                <option value="3" <c:if test="${row.PRD_REV_COLOR_STAR eq '3'}">selected="selected"</c:if>>화면보다 어둡다</option>
					            </select>
					        </div>
					    </div>
					    <div class="row border-top">
					        <div class="cell sbj">
					            제목
					            <span class="warning ir inline">*<em>필수입력</em></span>
					        </div>
					        <div class="cell fields">
					            <input type="text" class="text xlarge" name="PRD_REV_TITLE" id="PRD_REV_TITLE" value="${row.PRD_REV_TITLE }" maxlength="50" placeholder="제목을 입력해주세요." />
					        </div>
					    </div>
					    <div class="row">
					        <div class="cell sbj">
					            내용
					            <span class="warning ir inline">*<em>필수입력</em></span>
					        </div>
					        <div class="cell fields">
					            <textarea name="PRD_REV_CONTENTS" id="PRD_REV_CONTENTS" cols="30" rows="5" class="textarea xlarge" placeholder="최소 20글자 이상 ,최대 150글자 이하 입력해주세요." maxlength="150">${row.PRD_REV_CONTENTS }</textarea>
					        </div>
					    </div>
					</div><!-- // table -->
				</form>

				<p class="ding-a mb20">
				    이미지 첨부는 PC버전에서만 지원합니다.
				</p>

				<div class="section-button actions"><!-- actions -->
				    <div class="col-1-2 text-right"><a href="javascript:;" id="goList" class="button primary full"><span>취소</span></a></div>
				    <div class="col-1-2"><a href="javascript:;" id="goModify" class="button warning full"><span>확인</span></a></div>
				</div><!-- // actions -->

			</div><!-- // wrap -->
		</div><!-- // container -->
	</div><!-- // contents -->

	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	
	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<script>
	$(function()
	{
		// 수정 이벤트
	    $("#goModify").on("click", function () 
	    {
	    	var $frm = $("#frm");
	    	
	    	if($("#PRD_REV_SIZE_STAR").val() == "")
	    	{
	    		alert("[사이즈]반드시 입력해 주십시오.");
	    		$("#PRD_REV_SIZE_STAR").focus();
	    		return;
	    	}
	    	if($("#PRD_REV_COLOR_STAR").val() == "")
	    	{
	    		alert("[컬러]반드시 입력해 주십시오.");
	    		$("#PRD_REV_COLOR_STAR").focus();
	    		return;
	    	}
	    	if($.trim($("#PRD_REV_TITLE").val()) == "")
	        {
	            alert("[제목]반드시 입력해 주십시오.");
	            $("#PRD_REV_TITLE").focus();
	            return;
	        }
	    	
	    	if($.trim($("#PRD_REV_CONTENTS").val()) == "")
	        {
	            alert("[내용]반드시 입력해 주십시오.");
	            $("#PRD_REV_CONTENTS").focus();
	            return;
	        }
	    	
	        if($("input[name='pageStatus']").val() == "M")
	        {
	        	if (confirm( "수정 하시겠습니까?")) 
		        {
	        		$("#goList").hide();
	        		$("#goModify").hide();
		        	$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/productCommentModify.do", "target":"_self", "method":"post"}).submit();
		        }
	        }
	        else
	        {
	        	if (confirm( "등록 하시겠습니까?")) 
		        {
	        		$("#goList").hide();
	        		$("#goModify").hide();
		        	$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/productCommentRegist.do", "target":"_self", "method":"post"}).submit();
		        }
	        }
	    });
		
	 	// 목록 버튼 클릭 이벤트
	    $(document).on("click", "#goList", function () {
	        $("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myProductCommentList.do", "target":"_self", "method":"post"}).submit();
	    });
	
	});

</script>
</body>
