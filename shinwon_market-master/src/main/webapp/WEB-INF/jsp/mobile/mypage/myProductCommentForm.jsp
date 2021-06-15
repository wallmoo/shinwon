<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-mypage -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>상품후기 작성</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="product-info"><!-- product-info -->
	            <span class="thumb"><img src="<c:out value="${cdnDomain}${productMap.PRD_IMG}"/>" class="thumb140" alt="<c:out value="${productMap.PRD_MST_NM }"/>" /></span>
	            <span class="subject"><c:out value="${productMap.PRD_MST_NM }"/></span>
	        </div><!-- product-info -->
	
			<form id="frm" name="frm" enctype="multipart/form-data">
				<input type="hidden" id="PRD_ORD_PRD_IDX" name="PRD_ORD_PRD_IDX" value="<c:out value="${commandMap.PRD_ORD_PRD_IDX }"/>"/>
				<input type="hidden" id="PRD_PRD_MST_CD" name="PRD_PRD_MST_CD" value="<c:out value="${commandMap.PRD_PRD_MST_CD }"/>"/>
				<input type="hidden" id="PIT_MST_GBN" name="PIT_MST_GBN" value="P"/>
				<input type="hidden" id="MEM_PIT_TOT_PIT" name="MEM_PIT_TOT_PIT" value="<c:out value="${summaryMap.MEM_PIT_TOT_PIT }"/>"/>
				<input type="hidden" id="PRD_REV_IDX" name="PRD_REV_IDX" value="<c:out value="${productCommentInfoMap.PRD_REV_IDX }"/>"/>
				<input type="hidden" id="MEM_MST_MEM_GBN" name="MEM_MST_MEM_GBN" value="<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>"/>
		        <div class="padder review-write"><!-- review-write -->
		            <ul class="score"><!-- score -->
		                <li>
		                    <span class="tit">기능</span>
		                    <input type="radio" name="PRD_REV_FNC_STAR" id="PRD_REV_FNC_STAR5" value="5" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '5'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_FNC_STAR5"><i class="ico_star0"><i class="star_50"><span class="blind">별점 5점 만점 중 5점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_FNC_STAR" id="PRD_REV_FNC_STAR4" value="4" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '4'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_FNC_STAR4"><i class="ico_star0"><i class="star_40"><span class="blind">별점 5점 만점 중 4점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_FNC_STAR" id="PRD_REV_FNC_STAR3" value="3" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '3'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_FNC_STAR3"><i class="ico_star0"><i class="star_30"><span class="blind">별점 5점 만점 중 3점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_FNC_STAR" id="PRD_REV_FNC_STAR2" value="2" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '2'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_FNC_STAR2"><i class="ico_star0"><i class="star_20"><span class="blind">별점 5점 만점 중 2점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_FNC_STAR" id="PRD_REV_FNC_STAR1" value="1" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '1'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_FNC_STAR1"><i class="ico_star0"><i class="star_1"><span class="blind">별점 5점 만점 중 1점</span></i></i></label>
		                </li>
		                <li>
		                    <span class="tit">가격</span>
		                    <input type="radio" name="PRD_REV_PRC_STAR" id="PRD_REV_PRC_STAR5" value="5" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '5'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_PRC_STAR5"><i class="ico_star0"><i class="star_50"><span class="blind">별점 5점 만점 중 5점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_PRC_STAR" id="PRD_REV_PRC_STAR4" value="4" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '4'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_PRC_STAR4"><i class="ico_star0"><i class="star_40"><span class="blind">별점 5점 만점 중 4점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_PRC_STAR" id="PRD_REV_PRC_STAR3" value="3" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '3'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_PRC_STAR3"><i class="ico_star0"><i class="star_30"><span class="blind">별점 5점 만점 중 3점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_PRC_STAR" id="PRD_REV_PRC_STAR2" value="2" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '2'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_PRC_STAR2"><i class="ico_star0"><i class="star_20"><span class="blind">별점 5점 만점 중 2점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_PRC_STAR" id="PRD_REV_PRC_STAR1" value="1" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '1'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_PRC_STAR1"><i class="ico_star0"><i class="star_1"><span class="blind">별점 5점 만점 중 1점</span></i></i></label>
		                </li>
		                <li>
		                    <span class="tit">만족도</span>
		                    <input type="radio" name="PRD_REV_SCORE_STAR" id="PRD_REV_SCORE_STAR5" value="5" class="radio" 
	                            		<c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '5'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_SCORE_STAR5"><i class="ico_star0"><i class="star_50"><span class="blind">별점 5점 만점 중 5점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_SCORE_STAR" id="PRD_REV_SCORE_STAR4" value="4" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '4'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_SCORE_STAR4"><i class="ico_star0"><i class="star_40"><span class="blind">별점 5점 만점 중 4점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_SCORE_STAR" id="PRD_REV_SCORE_STAR3" value="3" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '3'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_SCORE_STAR3"><i class="ico_star0"><i class="star_30"><span class="blind">별점 5점 만점 중 3점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_SCORE_STAR" id="PRD_REV_SCORE_STAR2" value="2" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '2'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_SCORE_STAR2"><i class="ico_star0"><i class="star_20"><span class="blind">별점 5점 만점 중 2점</span></i></i></label>
		                    <input type="radio" name="PRD_REV_SCORE_STAR" id="PRD_REV_SCORE_STAR1" value="1" class="radio"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '1'}">checked="checked"</c:if>/>
		                    <label for="PRD_REV_SCORE_STAR1"><i class="ico_star0"><i class="star_1"><span class="blind">별점 5점 만점 중 1점</span></i></i></label>
		                </li>
		            </ul><!-- // score -->
		
					<c:if test="${summaryMap.MEM_MST_MEM_GBN == Code.COMMON_PRI_MEMBER_GRADE}">
			            <p class="review-guide">
		                	상품후기 작성하면 <span class="warning">200</span>C 적립 / 포토후기 작성하면 <span class="warning">500</span>C 적립
			            </p>
		            </c:if>
		            
		            <div class="form-b"><!-- form-b -->
		                <p class="bbs-guide">
		                    <span class="essential"><em class="blind">필수입력 항목은</em></span> 필수 입력
		                </p>
		                
		                <ul>
		                    <li>
		                        <div class="tit">
		                            <label for="subject">제목 <span class="essential"><em class="blind">필수입력</em></span></label>
		                        </div>
		                        <div class="field">
		                            <input type="text" id="PRD_REV_TITLE" name="PRD_REV_TITLE" class="text" placeholder="50자 이내" 
	                    					title="50자 이내 입력하세요" maxlength="50" value="<c:out value="${productCommentInfoMap.PRD_REV_TITLE }"/>"/>
		                        </div>
		                    </li>
		                    <li>
		                        <div class="tit">
		                            <label for="reviewText">상품후기 <span class="essential"><em class="blind">필수입력</em></span></label>
		                        </div>
		                        <div class="field">
		                            <textarea id="PRD_REV_CONTENTS" name="PRD_REV_CONTENTS" class="textarea" style="height: 100px;" placeholder="1000자 이내" title="1000자 이내로 입력하세요" maxlength="1000">${productCommentInfoMap.PRD_REV_CONTENTS }</textarea>
		                        </div>
		                    </li>
		                </ul>
		            </div><!-- // form-b -->
		            
		            <p class="warning gray mt20">
	                	파일 첨부는 PC용 사이트에서만 지원합니다.
		            </p>
		            <p class="warning gray">
	                	구매한 상품과 관계가 없는 내용이나 비방성 글은 등록자에게 사전 동의 없이 임의로 삭제될 수 있습니다.
		            </p>
		            <p class="warning gray">
	                	배송, 상품문의는 고객센터&gt;1:1 문의를 이용해주세요.
		            </p>
		        </div><!-- // review-write -->
		    </form>
	            
	        <div class="section-button"><!-- section-button -->
	        	<c:choose>
	            	<c:when test="${not empty commandMap.PRD_REV_IDX }">
	            		<a href="javascript:goModify();" class="button _pg_link"><span>수정</span></a>
	            	</c:when>
	            	<c:otherwise>
						<a href="javascript:goRegist();" class="button _pg_link"><span>등록</span></a>	            	
	            	</c:otherwise>
	            </c:choose>
	        </div><!-- // section-button -->
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script src="<c:out value="${cdnDomain}" />/pc/js/jquery.form.js"></script>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	var $frm = $("#frm");

	// 폼체크
    $frm.validate(
    {
        rules: 
        {
            PRD_REV_TITLE:{required:true}, // 제목
            PRD_REV_CONTENTS:{required:true} // 내용  
        },
        messages :
        {
        	PRD_REV_TITLE: {required:"제목을 입력해주세요."},
        	PRD_REV_CONTENTS: {required:"내용을 입력해주세요."}
        }
        ,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
        ,onkeyup:false
	    ,onclick:false
	    ,onfocusout:false
        ,showErrors:function(errorMap, errorList){
 	       if(this.numberOfInvalids()) { 
	    	   //var caption = $(errorList[0].element).attr('caption') || $(errorList[0].element).attr('id');
	    	   //alert('[' + caption + '] ' + errorList[0].message);
	    	   var errorOobjId = $(errorList[0].element).attr('id');
	    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
	    	   caption = caption.replace('*','').replace(/\s/gi,'');
	    	   if(caption != null && caption != "") 
	    	   {
	    	       alert('[' + caption + '] ' + errorList[0].message);
	    	   }
	    	   else
	    	   {
	    	       alert(errorList[0].message);
	    	   }
	    	   $(errorList[0].element).focus();
	       }
	   }
    });
	
	// 등록 버튼 클릭 이벤트
	goRegist = function(){
		
		// 기능
		if($("input[name='PRD_REV_FNC_STAR']:checked").length == 0){
			alert("기능을 선택해주세요.");
			return;
		}
		
		// 가격
		if($("input[name='PRD_REV_PRC_STAR']:checked").length == 0){
			alert("가격을 선택해주세요.");
			return;
		}
		
		// 만족도
		if($("input[name='PRD_REV_SCORE_STAR']:checked").length == 0){
			alert("만족도를 선택해주세요.");
			return;
		}
		
		if($frm.valid()){
			
			// 금칙어 체크
			var banWordCheck = false;
			
			$.ajax({
                async : false,
                type : "POST",
                data : {"PRD_REV_TITLE":$("#PRD_REV_TITLE").val(),"PRD_REV_CONTENTS":$("#PRD_REV_CONTENTS").val()},
                url : "<c:out value="${mobileDomain}" />/mobile/mypage/checkBanWordAjax.do",
                success : function (data) {
                	if(data.resultYn == "Y")
	    			{
						banWordCheck = true;							
	    			}else{
	    				alert("입력하신 상품평에 금칙어가 포함되어있습니다.");
	    				return;
	    			}
                },
                error : function () {
                    alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
                }
            });
			
			if(banWordCheck){
				if (confirm( "상품후기를 등록하시겠습니까?"))
                {
					//com.laypop('show');//팝업 show
					
					var options = {
               	    	type:"POST",
               	   		dataType:"json",       	        
               	        success: function(data) {
               	        	if(data.isSuccessYn == "Y"){
               	        		alert(data.resultMsg);
               	        		location.href="<c:out value="${mobileDomain}"/>/mobile/mypage/myWrittenProductCommentList.do";
               	        	}
               	        	else{
               	        		alert(data.resultMsg);
               	        		location.href="<c:out value="${mobileDomain}"/>/mobile/mypage/myPageMain.do";
               	        	}
               	         },  
	        		     error:function(err){
	        		        	alert("오류가 발생하였습니다.\n[" + err.status + "]");
       		         	 }
               	     };
                	 
               	     $frm.attr("action", "<c:out value="${mobileDomain}"/>/mobile/mypage/insertMyProductComment.do");
                	 $frm.ajaxSubmit(options);
               	}
			}					
		}
	};
	
	// 수정 이벤트
    goModify = function () 
    {
    	var $frm = $("#frm");
    	
    	if($frm.valid()){
    		
    		// 금칙어 체크
			var banWordCheck = false;
			
			$.ajax({
                async : false,
                type : "POST",
                data : {"PRD_REV_TITLE":$("#PRD_REV_TITLE").val(),"PRD_REV_CONTENTS":$("#PRD_REV_CONTENTS").val()},
                url : "<c:out value="${mobileDomain}" />/mobile/mypage/checkBanWordAjax.do",
                success : function (data) {
                	if(data.resultYn == "Y")
	    			{
						banWordCheck = true;							
	    			}else{
	    				alert("입력하신 상품평에 금칙어가 포함되어있습니다.");
	    				return;
	    			}
                },
                error : function () {
                    alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
                }
            });
			
			if(banWordCheck)
			{
				if (confirm( "상품후기를 저장하시겠습니까?")) 
                {
                	//com.laypop('show');//팝업 show
                	
               		var options = {
               	    	type:"POST",
               	   		dataType:"json",       	        
               	        success: function(data) {
               	        	if(data.isSuccessYn == "Y"){
               	        		alert(data.resultMsg);
               	        		location.href="<c:out value="${mobileDomain}"/>/mobile/mypage/myWrittenProductCommentList.do";
               	        	}
               	        	else{
               	        		alert(data.resultMsg);
               	        		location.href="<c:out value="${mobileDomain}"/>/mobile/mypage/myPageMain.do";
               	        	}
               	         },  
          		       	 error:function(err){
         		             	alert("오류가 발생하였습니다.\n[" + err.status + "]");
       		             }
             	     };
               		
                   	 $frm.attr("action", "<c:out value="${mobileDomain}"/>/mobile/mypage/updateProductComment.do");
                   	 $frm.ajaxSubmit(options);
                }
			}
    	}
    };	   
});
//]]>
</script>
</body>
</html>