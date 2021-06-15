<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-customer"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>1:1문의</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <div class="padder mt10">
            <p class="text-right">
                <span class="essential"><em class="blind">필수입력 항목은</em></span> 필수 입력 입니다.
            </p>
        </div>
		<form id="frm" name="frm">
			<input type="hidden" id="MEM_ADV_MAIL" name="MEM_ADV_MAIL"/>
	        <ul class="form-a one-write"><!-- form-a -->
	            <li class="name">
	                <div class="tit">고객명</div>
	                <div class="field">
	                    <strong><c:out value="${commandMap.MEM_MST_MEM_NM}"/> </strong>
	                </div>
	            </li>
	            <li class="tel">
	                <div class="tit">
	                    <label for="phone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <label for="MEM_ADV_HP1" class="sel_box_st0">
	                    	<select id="MEM_ADV_HP1" name="MEM_ADV_HP1" class="select" title="휴대폰 번호 앞자리">
		                        <c:forEach items="${codes.HP_CODE}" var="data">
			                      	<option value="<c:out value="${data.CMN_COM_NM}"/>" >
			                           	<c:out value="${data.CMN_COM_NM}"/>
			                        </option> 
			                    </c:forEach>
		                    </select>
	                    </label> -
	                    <input type="text" class="text" maxlength="4" title="휴대폰 번호 중간자리" id="MEM_ADV_HP2" name="MEM_ADV_HP2"> -
	                    <input type="text" class="text"  maxlength="4" title="휴대폰 번호 끝자리" id="MEM_ADV_HP3" name="MEM_ADV_HP3">
	                    <p class="desc">
	                        <input type="checkbox" id="MEM_ADV_MBL_YN" name="MEM_ADV_MBL_YN" class="checkbox" value="Y">
	                        <label for="MEM_ADV_MBL_YN">SMS 알림요청</label><br />
	                        <span class="small">(SMS로 답변 등록 여부를체크하시면 알려드립니다.)</span>
	                    </p>
	                </div>
	            </li>
	            <li class="mail">
	                <div class="tit">
	                    <label for="mail">이메일 주소</label>
	                </div>
	                <div class="field">
	                    <p>
	                        <input type="text" id="EMAIL_ID" name="EMAIL_ID" class="text" title="이메일 아이디"> @
	                        <input type="text" id="EMAIL_DOMAIN" name="EMAIL_DOMAIN" class="text" title="이메일 도메인">
	                    </p>
	                    <p>
	                        <label for="emailDomainSelectbox" class="sel_box_st0">
	                            <select id="emailDomainSelectbox" class="select">
	                                <option value="">직접입력</option>
	                                <c:forEach items="${codes.EMAIL_DOMAIN_CODE}" var="data">
		                      			<option value="<c:out value="${data.CMN_COM_NM}"/>" >
		                           	<c:out value="${data.CMN_COM_NM}"/>
		                        </option> 
		                    </c:forEach>
	                            </select>
	                        </label>
	                    </p>
	                </div>
	            </li>
	            <li class="type">
	                <div class="tit">
	                    <label for="bbsType">문의유형<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <label for="MEM_ADV_QST_TYPE_UP" class="sel_box_st0">
	                        <select id="MEM_ADV_QST_TYPE_UP" name="MEM_ADV_QST_TYPE_UP" class="select" title="문의유형 첫번째 카테고리">
	                            <option value="">선택</option>
	                            <c:if test="${not empty inqTypeCodeList }">
								    <c:forEach var="inqTypeCodeRow" items="${inqTypeCodeList }" varStatus="i" >
								        <option value="<c:out value="${inqTypeCodeRow.CMN_COM_IDX }"/>">
								            <c:out value="${inqTypeCodeRow.CMN_COM_NM }"/>
								        </option>
								    </c:forEach>
								</c:if>
	                        </select>
	                    </label>
	                    <label for="MEM_ADV_QST_TYPE" class="sel_box_st0">
	                        <select id="MEM_ADV_QST_TYPE" name="MEM_ADV_QST_TYPE" class="select" title="문의유형 두번째 카테고리">
	                            <option value="">선택</option>
	                        </select>
	                    </label>
	                </div>
	            </li>
	            <li class="search" id="orderTr">
	                <div class="tit">
	                    <label for="orderNumber">주문번호</label>
	                </div>
	                <div class="field">
	                    <input type="text" id="ORD_MST_CD" name="ORD_MST_CD" class="text" readonly>
	                    <a href="javascript:;" class="button primary small"><span>검색</span></a>
	                </div>
	            </li>
	            <li class="search" id="productTr">
	                <div class="tit">
	                    <label for="code">상품코드</label>
	                </div>
	                <div class="field">
	                    <input type="text"  id="MEM_ADV_MDL_NO" name="MEM_ADV_MDL_NO" class="text" readonly>
	                    <a href="javascript:;" class="button primary small"><span>검색</span></a>
	                </div>
	            </li>
	            <li class="subject">
	                <div class="tit">
	                    <label for="subject">제목<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <input type="text" id="MEM_ADV_TITLE" name="MEM_ADV_TITLE" class="text">
	                </div>
	            </li>
	            <li class="message">
	                <div class="tit">
	                    <label for="dearNotice">내용<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <textarea class="textarea" id="MEM_ADV_CONTENTS" name="MEM_ADV_CONTENTS"></textarea>
	                </div>
	            </li>
	            <li class="answer">
	                <div class="tit">
	                    <label for="answerType">답변 희망형태</label>
	                </div>
	                <div class="field">
	                    <p>
	                        <input type="radio" id="answerType1" name="MEM_ADV_MAIL_YN" class="radio" value="Y" checked="checked" >
	                        <label for="answerType1">이메일</label>
	                    </p>
	                    <p>
	                        <input type="radio" id="answerType2" name="MEM_ADV_MAIL_YN" class="radio" value="T">
	                        <label for="answerType2">전화상담</label>
	                    </p>
	                    <p>
	                        <input type="radio" id="answerType3" name="MEM_ADV_MAIL_YN" class="radio" value="N">
	                        <label for="answerType3">받지않음(마이페이지에서 확인)</label>
	                    </p>
	                </div>
	            </li>
	        </ul><!-- // form-a -->
	        <input type="hidden" name="MEM_MST_MEM_ID" id= "MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
	        <input type="hidden" name="MEM_MST_MEM_NM" id= "MEM_MST_MEM_NM" value="<c:out value="${commandMap.MEM_MST_MEM_NM }"/>"/>
    	</form>
        <div class="padder mt10">
            <p class="warning gray">
                파일 첨부는 PC용 사이트에서만 지원합니다.
            </p>
        </div>
            
        <div class="section-button"><!-- section-button -->
            <a id="goRegist" href="javascript:;" class="button primary"><span>문의하기</span></a>
            <a data-ajax="false" href="<c:out value="${mobileDomain}" />/mobile/customer/customerMain.do" class="button"><span>목록</span></a>
        </div><!-- // section-button -->
			
	</article>
	<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script src="<c:out value="${mobileDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${mobileDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/jquery.form.js"></script>
<script type="text/javascript">
$(function(){
	// 폼체크
    $("#frm").validate({
        rules:{
        	MEM_ADV_QST_TYPE_UP:{required:true}, // 질문유형
        	MEM_ADV_TITLE:{required:true}, // 제목
        	MEM_ADV_CONTENTS:{required:true}, // 내용  
            EMAIL_ID:{required:{depends:function(){
            	if($("#EMAIL_DOMAIN").val() != "") return true;
                else return false;
            }}, emailId:true}, // 이메일 아이디
            EMAIL_DOMAIN:{required:{depends:function(){
            	if($("#EMAIL_ID").val() != "") return true;
                else return false;
            }}, emailDomain:true} // 이메일 도메인
        },messages :{
        	MEM_ADV_QST_TYPE_UP: {required:"[문의유형]을 선택해주십시오."},
        	MEM_ADV_TITLE: {required:"[제목]을 입력해주십시오."},
        	MEM_ADV_CONTENTS: {required:"[내용]을 입력해주십시오."},
        	EMAIL_ID : {required:"[이메일]아이디를 입력해주십시오.", emailId:"[이메일]아이디 형식을 올바르게 입력해 주십시오."},
            EMAIL_DOMAIN : {required:"[이메일]도메인을 입력해주십시오.", emailDomain:"[이메일]도메인 형식을 올바르게 입력해 주십시오."}
        }
    });
	
 	// 이메일 도메인 select box 변경 이벤트
    $(document).on("click", "#emailDomainSelectbox", function (){
        var $obj = $("#EMAIL_DOMAIN");
        if($(this).val() == ""){
            $obj.prop("readonly", false);
            $obj.val("");
        }else{
            $obj.prop("readonly", true);
            $obj.val($(this).val());
        }
    });
	
 	// 1:1문의 유형 변경 이벤트
 	 $(document).on("click", "#MEM_ADV_QST_TYPE_UP", function (){
    	var code = $("#MEM_ADV_QST_TYPE_UP").val();
    	
    	// 상품일 경우
    	if(code == "107"){
    		$("#ORD_MST_CD").val('');
    		$("#orderTr").hide();
    		$("#productTr").show();
    	}else if(code == "108"){
    		$("#MEM_ADV_MDL_NO").val('');
    		$("#orderTr").show();
    		$("#productTr").hide();
    	}else{
    		$("#ORD_MST_CD").val('');
    		$("#MEM_ADV_MDL_NO").val('');
    		$("#orderTr").hide();
    		$("#productTr").hide();
    	}
    	
    	$.ajax({
    		type : "POST", 
    		data : {"CMN_COM_IDX" : code},
    		dateType : "JSON",
    		async : false,
    		url : "<c:out value="${mobileDomain}" />/mobile/customer/getSubCodeAjax.do",
    		success : function(data){
    			$("#MEM_ADV_QST_TYPE").empty().append("<option value=''>전체</option>");
                $.each(data.list, function(i,item){  
                 	$("#MEM_ADV_QST_TYPE").append("<option value='"+item.CMN_COM_IDX+"'>"+item.CMN_COM_NM+"</option>");
                });
                com.sel_chg($("#MEM_ADV_QST_TYPE"), 'chg');
    		}, error: function(xhr,status,error){
    			console.log('오류가 발생하였습니다: ' + err.status);
            }
    	});
    	
 	 });
 	 	
 	// 주문 내역 검색 클릭 이벤트
 	$(document).on("click","#orderBtn", function(){
 		window.open("<c:out value="${mobileDomain}" />/mobile/customer/orderInfoPopup.do","orderSearchPop","width=1000, height=627, scrollbars=yes");
 	});
 	
 	//상품 내역 검색 클릭 이벤트
 	$(document).on("click","#productBtn", function(){
 		window.open("<c:out value="${mobileDomain}" />/mobile/customer/orderInfoPopup.do","productSearchPop","width=1000, height=627, scrollbars=yes");
 	});
 	
 	// 답변 이메일 수신 클릭 이벤트
 	$("#MEM_ADV_MAIL_YN").on("change",function(){
			if(this.value == 'Y' && ($("#EMAIL_ID").val() == "" || $("#EMAIL_DOMAIN").val() == "")){
 			alert("이메일을 입력해주세요.");
 			$("#EMAIL_ID").focus();
 			return false;
 		}	
 	});
 	

	// 등록 버튼 클릭 이벤트
    $(document).on("click", "#goRegist", function (){
    	
		var $frm = $("#frm");
            
        if($frm.valid()){
            if (confirm( "1:1문의를 등록하시겠습니까?")){
            	/*$.showOverlay(true, {
		            isIndicator: true
		        });*/
            	
                $("#MEM_ADV_MAIL").val($.trim($("#EMAIL_ID").val()) + "@" + $.trim($("#EMAIL_DOMAIN").val()));
                
                var options = {
               	    	type:"POST",
               	   		dataType:"json",       	        
               	        success: function(data) {
               	        	if(data.isSuccessYn == "Y"){
               	        		alert(data.resultMsg);
               	        		location.href="<c:out value="${mobileDomain}" />/mobile/customer/inquiryMain.do"
               	        	}else{
               	        		alert(data.resultMsg);	
               	        		/*$.showOverlay(false, {
						            isIndicator: true
						        });*/
               	        	}
               	         },error:function(err){
        		             alert("오류가 발생하였습니다.\n[" + err.status + "]");
        		             /*$.showOverlay(false, {
					            isIndicator: true
					       	 });*/
        		         }
               	     };
                	 $frm.attr("action", "<c:out value="${mobileDomain}"/>/mobile/customer/inquiryInsert.do");
                	 $frm.ajaxSubmit(options);
            }
        }
    });

});
//목록

 
</script>
</body>
</html>