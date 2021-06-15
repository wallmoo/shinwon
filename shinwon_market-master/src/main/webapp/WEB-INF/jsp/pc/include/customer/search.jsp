<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="faq-search"><!-- faq-search -->
	    <span class="icon"><!-- icon --></span>
	    <label for="searchFaq"><span class="blind">FAQ 검색</span></label>
	    <p class="message">
	        <span class="blind">무엇을 도와드릴까요?</span>
	    </p>
	    <form method="post" name="sfrm" id="sfrm">
	    <div class="form">
	        <input type="text" id="searchFaq" name="searchWord" class="text" value="<c:out value="${commandMap.searchWord }" />" />
	        <a href="javascript:;" id="searchBtn"><span class="blind">검색</span></a>
	    </div>
	    </form>
	    <p class="desc">
	        검색 결과가 충분하지 못하면 1:1문의를 이용하세요.
	        <a href="<c:out value="${frontDomain }" />/pc/customer/inquiryMain.do" class="btn_st0 btn_blk777 xsmall"><span>1:1 문의하기</span></a>
	    </p>
	</div><!-- // faq-search -->
	<script type="text/javascript">
		$(document).on("click", "#searchBtn", function(){
			if($("#searchFaq").val() == ""){
				alert("검색어를 입력하세요");
				$("#searchFaq").focus();
				return;
			}else{
				$("#sfrm").attr("action", "<c:out value="${frontDomain }" />/pc/customer/faqBoardList.do").submit();
			}
		});
	</script>