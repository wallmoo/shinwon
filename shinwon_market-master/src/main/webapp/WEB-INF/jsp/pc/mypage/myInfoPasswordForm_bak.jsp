<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-mypage">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">
	
		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
	    <article id="container" class="container">
	        <div class="minW contents"><!-- contents S -->
	
	            <dl class="loc">
	                <dt class="blind">현재 카테고리 경로</dt>
	                <dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="ico_home"><span class="ir">홈</span></a></dd>
	                <dd><a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do"><span>마이페이지</span></a></dd>
	                <dd><a href="javascript:void(0)"><span>회원정보</span></a></dd>
	                <dd class="l"><a href="javascript:void(0)"><span>회원정보수정</span></a></dd>
	            </dl>
	
	            <%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
	
	            <div id="body"><!-- #body -->
	
	                <h3 class="title">회원정보수정</h3>
	
	                <div class="my-info-guide"><!-- my-info-guide -->
	                    <div class="holder">
	                        <ul class="list list-a">
	                            <li>회원님의 정보를 중 변경된 내용이 있는 경우, 아래에서 수정해주세요.</li>
	                            <li>회원정보는 개인정보취급방침에 따라 안전하게 보호됩니다.</li>
	                        </ul> 
	                    </div>
	                </div><!-- // my-info-guide -->
	
					<form id="frm" name="frm">
		                <div class="my-info-pw"><!-- my-info-pw -->
		                    <label for="password">비밀번호</label>
	                    	<input type="hidden" name="memType" id="memType" value="<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>"/> 
	                    	<input type="password" id="MEM_MST_PW" name="MEM_MST_PW" class="text" maxlength="15" />
	                    	<input type="text" id="hidden" style="display:none;"/>
		                </div><!-- // my-info-pw -->
	                </form>
	
	                <div class="section-button"><!-- section-button -->
	                    <a href="javascript:goRegist();" class="btn_st2 btn_rd xlarge"><span>확인</span></a>
	                </div><!-- // section-button -->
	
	            </div><!-- // #body -->
	
	        </div><!--// .contents E -->
	    </article>
	    <!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->
		
		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	</section>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	$(function(){
		
		var $frm = $("#frm");
		
		$frm.find("#MEM_MST_PW").keydown(function (e) 
	    {
	        if(e.keyCode == 13)
	        {
	            goRegist();
	        }
	    });
		
		// 폼체크
	    $frm.validate(
	    {
	        rules: 
	        {
	        	MEM_MST_PW:{required:true, minlength:6, maxlength:15} // 비밀번호
	        	/* MEM_MST_PW:{required:true, minlength:6, maxlength:15, etlandPw:true} // 비밀번호 */
	        },
	        messages :
	        {
	        	/* MEM_MST_PW: {required:"비밀번호를 입력해주세요.",minlength:"비밀번호는 최소 6글자 이상입니다.", maxlength:"비밀번호는 최대 15글자입니다.", etlandPw:"올바르지 않은 비밀번호 입니다. \n다시한번 입력해 주세요."} */
	        	MEM_MST_PW: {required:"비밀번호를 입력해주세요.",minlength:"비밀번호는 최소 6글자 이상입니다.", maxlength:"비밀번호는 최대 15글자입니다."}
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
		
		// 확인 클릭 이벤트
	    goRegist = function(){
			if($frm.valid()){
	    		$.ajax({
	                async : false,
	                type : "POST",
	                data : {"MEM_MST_PW":$("#MEM_MST_PW").val(),"MEM_MST_MEM_ID":"${commandMap.MEM_MST_MEM_ID}"},
	                url : "<c:out value="${serverSslDomain}" />/pc/mypage/checkPwAjax.do",
	                success : function (data) {
	                    if(data.successYn == "Y")
	                    {
	                        if(data.resultYn == "N")
	                        {
	                        	alert("올바르지 않은 비밀번호 입니다. \n다시한번 입력해 주세요.");
	                        	$("#MEM_MST_PW").focus();
	                        	return;
	                        }
	                        else
	                        {
	                        	$frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/myInfoEditForm.do", "target":"_self", "method":"post"}).submit();
	                        }
	                    }
	                    else
	                    {
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