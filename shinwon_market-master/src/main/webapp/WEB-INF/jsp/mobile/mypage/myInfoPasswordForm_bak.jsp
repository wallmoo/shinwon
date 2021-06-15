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
	            <h2>회원정보수정</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <div class="padder mt20">
	            <ul class="list list-a">
	                <li>고객님의 개인정보를 안전하게 취급하며, 회원님의 동의 없이는 회원정보를 공개 및 변경하지 않습니다.</li>
	                <li>회원님의 개인정보 보호를 위해 비밀번호를 다시 입력해 주세요.</li>
	            </ul>
	
				<form id="frm" name="frm">
		            <div class="my-info-pw"><!-- my-info-pw -->
		                <label for="password"><strong class="large">비밀번호</strong></label>
		                <input type="hidden" name="memType" id="memType" value="<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>"/> 
		                <div class="input-wrap">
			                <input type="password" id="MEM_MST_PW" name="MEM_MST_PW" class="text" maxlength="15" />
			                <input type="text" id="hidden" style="display:none;"/>
		                </div>
		            </div><!-- // my-info-pw -->
	            </form>
	        </div>
	
	        <div class="section-button"><!-- section-button -->
	            <a href="javascript:goRegist();" class="button primary"><span>확인</span></a>
	        </div><!-- // section-button -->
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

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
	        	MEM_MST_PW:{required:true, minlength:6, maxlength:15} // 비밀번호
	        	//MEM_MST_PW:{required:true, minlength:6, maxlength:15, etlandPw:true} // 비밀번호
	        },
	        messages :
	        {
	        	MEM_MST_PW: {required:"비밀번호를 입력해주세요.",minlength:"비밀번호는 최소 6글자 이상입니다.", maxlength:"비밀번호는 최대 15글자입니다."}
	        	//MEM_MST_PW: {required:"비밀번호를 입력해주세요.",minlength:"비밀번호는 최소 6글자 이상입니다.", maxlength:"비밀번호는 최대 15글자입니다."}
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
	                url : "<c:out value="${mobileSslDomain}" />/mobile/mypage/checkPwAjax.do",
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
	                        	$frm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/mypage/myInfoEditForm.do", "target":"_self", "method":"post"}).submit();
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
//]]>
</script>
</body>
</html>