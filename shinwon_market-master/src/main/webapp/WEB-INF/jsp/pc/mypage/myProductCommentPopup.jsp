<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="page-popup">

<div id="popContainer"><!-- popContainer -->

    <h1 class="title">상품후기 작성</h1>

	<form id="frm" name="frm" enctype="multipart/form-data">
		<input type="hidden" id="PRD_ORD_PRD_IDX" name="PRD_ORD_PRD_IDX" value="<c:out value="${commandMap.PRD_ORD_PRD_IDX }"/>"/>
		<input type="hidden" id="PRD_PRD_MST_CD" name="PRD_PRD_MST_CD" value="<c:out value="${commandMap.PRD_PRD_MST_CD }"/>"/>
		<input type="hidden" id="PIT_MST_GBN" name="PIT_MST_GBN" value="P"/>
		<input type="hidden" id="MEM_PIT_TOT_PIT" name="MEM_PIT_TOT_PIT" value="<c:out value="${summaryMap.MEM_PIT_TOT_PIT }"/>"/>
		<input type="hidden" id="PRD_REV_IDX" name="PRD_REV_IDX" value="<c:out value="${productCommentInfoMap.PRD_REV_IDX }"/>"/>
		<input type="hidden" id="MEM_MST_MEM_GBN" name="MEM_MST_MEM_GBN" value="<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>"/>
		<double-submit:preventer/>
	    
	    <div id="popWrapper" class="review-write"><!-- popWrapper -->
	
	        <div class="score-panel"><!-- score-panel -->
	            <div class="holder">
	                <span class="thumb">
	                	<img src="<c:out value="${cdnDomain}${productMap.PRD_IMG}"/>" class="thumb140" alt="<c:out value="${productMap.PRD_MST_NM }"/>" />
	                </span>
	                <p class="subject">
	                    <strong class="large14 primary"><c:out value="${productMap.PRD_MST_NM }"/></strong>
	                </p>
	                <ul>
	                	<li>
	                        <label class="tit" for="PRD_REV_FNC_STAR5">기능</label>
	                        <label for="PRD_REV_FNC_STAR5" class="nth-child-1 js-radio <c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '5'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_FNC_STAR" id="PRD_REV_FNC_STAR5" value="5" 
	                            		<c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '5'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 5점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_FNC_STAR4" class="nth-child-2 js-radio <c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '4'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_FNC_STAR" id="PRD_REV_FNC_STAR4" value="4"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '4'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 4점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_FNC_STAR3" class="nth-child-3 js-radio <c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '3'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_FNC_STAR" id="PRD_REV_FNC_STAR3" value="3"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '3'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 3점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_FNC_STAR2" class="nth-child-4 js-radio <c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '2'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_FNC_STAR" id="PRD_REV_FNC_STAR2" value="2"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '2'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 2점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_FNC_STAR1" class="nth-child-5 js-radio <c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '1'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_FNC_STAR" id="PRD_REV_FNC_STAR1" value="1"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_FNC_STAR eq '1'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 1점</span></i></i>
	                        </label>
	                    </li>
	                    <li>
	                        <label class="tit" for="PRD_REV_PRC_STAR5">가격</label>
	                        <label for="PRD_REV_PRC_STAR5" class="nth-child-1 js-radio <c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '5'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_PRC_STAR" id="PRD_REV_PRC_STAR5" value="5" 
	                            		<c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '5'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 5점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_PRC_STAR4" class="nth-child-2 js-radio <c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '4'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_PRC_STAR" id="PRD_REV_PRC_STAR4" value="4"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '4'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 4점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_PRC_STAR3" class="nth-child-3 js-radio <c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '3'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_PRC_STAR" id="PRD_REV_PRC_STAR3" value="3" 
	                            		<c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '3'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 3점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_PRC_STAR2" class="nth-child-4 js-radio <c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '2'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_PRC_STAR" id="PRD_REV_PRC_STAR2" value="2"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '2'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 2점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_PRC_STAR1" class="nth-child-5 js-radio <c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '1'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_PRC_STAR" id="PRD_REV_PRC_STAR1" value="1"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_PRC_STAR eq '1'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 1점</span></i></i>
	                        </label>
	                    </li>
	                    <li>
	                        <label class="tit" for="PRD_REV_SCORE_STAR5">만족도</label>
	                        <label for="PRD_REV_SCORE_STAR5" class="nth-child-1 js-radio <c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '5'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_SCORE_STAR" id="PRD_REV_SCORE_STAR5" value="5"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '5'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 5점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_SCORE_STAR4" class="nth-child-2 js-radio <c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '4'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_SCORE_STAR" id="PRD_REV_SCORE_STAR4" value="4"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '4'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 4점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_SCORE_STAR3" class="nth-child-3 js-radio <c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '3'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_SCORE_STAR" id="PRD_REV_SCORE_STAR3" value="3"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '3'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 3점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_SCORE_STAR2" class="nth-child-4 js-radio <c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '2'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_SCORE_STAR" id="PRD_REV_SCORE_STAR2" value="2"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '2'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 2점</span></i></i>
	                        </label>
	                        <label for="PRD_REV_SCORE_STAR1" class="nth-child-5 js-radio <c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '1'}">on</c:if>">
	                            <input type="radio" name="PRD_REV_SCORE_STAR" id="PRD_REV_SCORE_STAR1" value="1"
	                            		<c:if test="${productCommentInfoMap.PRD_REV_SCORE_STAR eq '1'}">checked="checked"</c:if>/>
	                            <i class="ico_star2"><i style="width: 100%;"><span class="ir">5점 만점 중 1점</span></i></i>
	                        </label>
	                    </li>
	                </ul>
	            </div>
	        </div><!-- // score-panel -->
	
	        <div class="status" style="min-height: 20px;"><!-- status -->
	            <c:if test="${summaryMap.MEM_MST_MEM_GBN == Code.COMMON_PRI_MEMBER_GRADE}">
		            <p>
		               	상품후기 200C 적립 / 포토후기 500C 적립
		            </p>
	            </c:if>
	            <p class="desc">
	                <span class="essential"><em class="blind">필수입력 표시는</em></span>
	               	필수입력
	            </p>
	        </div><!-- // status -->
	
	        <table class="table-a table-col"><!-- table-a -->
	        <caption>제목, 상품후기, 이미지로 구성된 상품후기 입력 테이블입니다.</caption>
	        <colgroup>
	            <col style="width: 140px;" />
	            <col style="width: auto;" />
	        </colgroup>
	        <tbody>
	            <tr>
	                <th scope="row"><label for="PRD_REV_TITLE">제목 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                <td>
	                    <input type="text" id="PRD_REV_TITLE" name="PRD_REV_TITLE" class="text xlarge" placeholder="50자 이내" 
	                    		title="50자 이내 입력하세요" maxlength="50" value="<c:out value="${productCommentInfoMap.PRD_REV_TITLE }"/>"/>
	                </td>
	            </tr>
	            <tr>
	                <th scope="row"><label for="PRD_REV_CONTENTS">상품후기 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                <td>
	                    <textarea id="PRD_REV_CONTENTS" name="PRD_REV_CONTENTS" class="textarea" style="height: 100px;" placeholder="1000자 이내" title="1000자 이내로 입력하세요" maxlength="1000">${productCommentInfoMap.PRD_REV_CONTENTS }</textarea>
	                </td>
	            </tr>
	            <tr>
	                <th scope="row"><label for="file">이미지</label></th>
	                <td id="fileTd">
	                    <input type="file" id="file" name="file" class="text file xlarge"/>
	                    <a href="javascript:goDeleteFile();" class="btn_st0 btn_blk777 small"><span>파일지우기</span></a>
	                    <p class="file">
	                        <c:if test="${not empty fileList }">
				                <c:forEach items="${fileList}" var="fileRow" varStatus="i">
		                        	<span class="large13 primary">
		                        		<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
		                        	</span>
			                        <input type="checkbox" id="CMM_FLE_IDX" name="CMM_FLE_IDX" class="checkbox cmmFleIdx" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>"/>
			                        <label for="CMM_FLE_IDX">삭제</label>
			                    </c:forEach>
			                </c:if>
	                    </p>
	                    <p>첨부파일 형식 : JPG, JPEG, GIF, PNG, BMP</p>
	                    <p>용량 : 10MB이하</p>
	                </td>
	            </tr>
	        </tbody>
	        </table><!-- // table-a -->
	
	        <ul class="list list-b small mt20">
	            <li>구매한 상품과 관계가 없는 내용이나 비방성 글은 등록자에게 사전 동의 없이 임의로 삭제될 수 있습니다.</li>
	            <li>배송, 상품문의는 고객센터 > 1:1 문의를 이용해주세요.</li>
	            <li>최초 1회 등록시 크라운 적립</li>
	        </ul>
	
	        <div class="section-button"><!-- section-button -->
	            <c:choose>
	            	<c:when test="${not empty commandMap.PRD_REV_IDX }">
	            		<a href="javascript:goModify();" class="btn_st1 btn_rd large"><span>수정</span></a>
	            	</c:when>
	            	<c:otherwise>
						<a href="javascript:goRegist();" class="btn_st1 btn_rd large"><span>등록</span></a>	            	
	            	</c:otherwise>
	            </c:choose>
	            <a href="javascript:self.close();" class="btn_st1 btn_white large"><span>취소</span></a>
	        </div><!-- // section-button -->
	        
	    </div><!-- // popWrapper -->
    </form>
    
    <div id="laypop" class="laypop" data-idx="0" style="display: none; width: 1136px; height: 995px;">
		<ul class="laypop_con loading"><!-- 여기에 class주셔서 내용 제어하시면 됩니다.ex) comMem_pop -->
			<li class="con">
				<img src="<c:out value="${cdnDomain }"/>/pc/img/lay/loading.gif" alt="로딩중입니다." />
			</li>
		</ul>
	</div>
</div><!-- // popContainer -->

<script src="<c:out value="${cdnDomain}"/>/pc/js/jquery.validate.js"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/jquery.form.js"></script>
<script>
//<![CDATA[
	$(function() 
	{
		var $frm = $("#frm");
		
		//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
		$(".cmmFleIdx").each(function(){	       
	        $("#file").prop("disabled", true);	       
		});
		
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
		
		// 파일지우기 클릭 이벤트
		goDeleteFile = function(){		
			if(!$("#file").prop("disabled")){
				$("#fileTd").find("input[type=file]").remove();
		    	$("#fileTd").prepend('<input type="file" id="file" name="file" class="text file xlarge" />');		
			}
		};
		
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
                    url : "<c:out value="${frontDomain}" />/pc/mypage/checkBanWordAjax.do",
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
						com.laypop('show');//팝업 show
						
						var options = {
	               	    	type:"POST",
	               	   		dataType:"json",       	        
	               	        success: function(data) {
	               	        	if(data.isSuccessYn == "Y"){
	               	        		alert(data.resultMsg);
	               	        		opener.location.reload(true);
	               	        		window.close();
	               	        	}
	               	        	else{
	               	        		alert(data.resultMsg);	
	               	        		$("#fileTd").find("input").remove();
	               	        		$("#fileTd").prepend("<input type=\"file\" name=\"file\" class=\"text file xlarge\" id=\"file\"/>");  
	               	        	}
	               	         },  
		        		     error:function(err){
		        		        	alert("오류가 발생하였습니다.\n[" + err.status + "]");
	       		         	 }
	               	     };
	                	 
	               	     $frm.attr("action", "<c:out value="${frontDomain}"/>/pc/mypage/insertMyProductComment.do");
	                	 $frm.ajaxSubmit(options);
	               	}
				}					
			}
		};
		
		// 삭제 체크박스 클릭 이벤트
		$("#CMM_FLE_IDX").on("click", function(){
			if($(this).is(":checked"))
			{
				$("#file").prop("disabled", false);	
			}
			else
			{
				goDeleteFile();
				$("#file").prop("disabled", true);
			}
		});
		
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
                    url : "<c:out value="${frontDomain}" />/pc/mypage/checkBanWordAjax.do",
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
	                	com.laypop('show');//팝업 show
	                	
	               		var options = {
	               	    	type:"POST",
	               	   		dataType:"json",       	        
	               	        success: function(data) {
	               	        	if(data.isSuccessYn == "Y"){
	               	        		alert(data.resultMsg);
	               	        		opener.location.reload(true);
	               	        		window.close();
	               	        	}
	               	        	else{
	               	        		alert(data.resultMsg);
	               	        		$("#fileTd").find("#file").remove();
	               	        		$("#fileTd").prepend("<input type=\"file\" name=\"file\" class=\"text file xlarge\" id=\"file\"/>");  
	               	        		if($("#CMM_FLE_IDX").is(":checked")){
	               	        			$("#CMM_FLE_IDX").prop("checked",false);
	                	 					$("#file").prop("disabled", true);	
	                	 				}
	               	        	}
	               	         },  
	          		       	 error:function(err){
	         		             	alert("오류가 발생하였습니다.\n[" + err.status + "]");
	       		             }
	             	     };
	               		
	                   	 $frm.attr("action", "<c:out value="${frontDomain}"/>/pc/mypage/updateProductComment.do");
	                   	 $frm.ajaxSubmit(options);
	                }
				}
        	}
        };	   
	});
//]]>
</script>
<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script> --%>
</body>
</html>