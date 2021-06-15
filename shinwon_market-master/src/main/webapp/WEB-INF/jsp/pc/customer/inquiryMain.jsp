<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-customer"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<article id="container" class="container">
        <div class="minW contents"><!-- contents S -->

            <dl class="loc">
                <dt class="blind">현제 카테고리 경로</dt>
                <dd class="f"><a href="javascript:void(0)" class="ico_home"><span class="ir">홈</span></a></dd>
                <dd><a href="javascript:void(0)"><span>고객센터</span></a></dd>
                <dd class="l"><a href="javascript:void(0)"><span>1:1 문의</span></a></dd>
            </dl>

            <%@ include file="/WEB-INF/jsp/pc/include/customer/aside.jsp" %>
            
            <div id="body"><!-- #body -->

                <h3 class="title">1:1 문의</h3> 

                <p class="bbs-form-guide"><!-- bbs-form-guide -->
                    <span class="essential"><em class="blind">필수입력</em></span>표시된 항목은 필수 입력 사항입니다.
                </p><!-- // bbs-form-guide -->

                <table class="table-c table-col table-one-one"><!-- table-c -->
                <caption>고객명, 휴대폰 번호, 이메일 주소, 문의유형, 주문번호, 상품코드, 제목, 내용, 답변 희망형태, 파일첨부로 구성된 일대일문의 입력 테이블입니다.</caption>
                <colgroup>
                    <col style="width: 170px;" />
                    <col style="width: auto;" />
                </colgroup>
                <form id="frm" name="frm" enctype="multipart/form-data">
				<input type="hidden" id="MEM_ADV_MAIL" name="MEM_ADV_MAIL"/>
                <tbody>
                    <tr>
                        <th scope="row">고객명</th>
                        <td><c:out value="${commandMap.MEM_MST_MEM_NM }" /></td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="phone">휴대폰 번호</label></th>
                        <td>
                            <select class="sel_chg" id="MEM_ADV_HP1" name="MEM_ADV_HP1" title="휴대폰 번호 앞자리">
                            	<c:forEach items="${codes.HP_CODE }" var="row" >
                            		<option value="<c:out value="${row.CMN_COM_NM}" />"  <c:if test="${row.CMN_COM_NM eq userInfo.MEM_MST_HP1 }">selected</c:if> ><c:out value="${row.CMN_COM_NM}" /></option>
                            	</c:forEach>
                            </select> -
                            <input type="text" class="text small" maxlength="4" title="휴대폰 번호 중간자리" id="MEM_ADV_HP2" name="MEM_ADV_HP2" value="<c:out value="${userInfo.MEM_MST_HP2 }" />" /> -
                            <input type="text" class="text small" maxlength="4" title="휴대폰 번호 끝자리" id="MEM_ADV_HP3" name="MEM_ADV_HP3" value="<c:out value="${userInfo.MEM_MST_HP3 }" />" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="email">이메일 주소</label></th>
                        <td>
                            <input id="EMAIL_ID" name="EMAIL_ID" type="text" class="text" title="이메일 아이디" value="<c:out value="${email1 }" />" /> @
                            <input id="EMAIL_DOMAIN" name="EMAIL_DOMAIN" type="text" class="text" title="이메일 도메인"  value="<c:out value="${email2 }" />"/>
                            <select class="sel_chg" title="이메일 도메인 선택" id="emailDomainSelectbox">
                                <option value="">직접입력</option>
                                <c:forEach items="${codes.EMAIL_DOMAIN_CODE }" var="emailRow">
                                	<option value="<c:out value="${emailRow.CMN_COM_NM}" />" ><c:out value="${emailRow.CMN_COM_NM}" /></option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="category">문의유형<span class="essential"><em class="blind">필수입력</em></span></label></th>
                        <td>
                            <select id="MEM_ADV_QST_TYPE_UP" name="MEM_ADV_QST_TYPE_UP" data-width="160" class="sel_chg" title="문의 유형 첫번째 카테고리" onchange="test();">
                            	<option value="">전체</option>
                            	<c:if test="${not empty inqTypeCodeList }">
								    <c:forEach var="inqTypeCodeRow" items="${inqTypeCodeList }" varStatus="i" >
								        <option value="<c:out value="${inqTypeCodeRow.CMN_COM_IDX }"/>">
								            <c:out value="${inqTypeCodeRow.CMN_COM_NM }"/>
								        </option>
								    </c:forEach>
								</c:if>
                            </select>
                            <select id="MEM_ADV_QST_TYPE" name="MEM_ADV_QST_TYPE" data-width="150" class="sel_chg" title="문의 유형 두번째 카테고리">
                                <option value="">전체</option>
                            </select>
                        </td>
                    </tr>
                    <tr id="orderTr" style="display:none;">
                        <th scope="row"><label for="orderNumber">주문번호</label></th>
                        <td>
                            <input type="text" id="ORD_MST_CD" name="ORD_MST_CD" class="text" readonly/>
                            <a href="javascript:;" class="btn_st0 btn_blk777 small" id="orderBtn"><span>검색</span></a>
                        </td>
                    </tr>
                    <tr id="productTr" style="display:none;">
                        <th scope="row"><label for="code">상품코드</label></th>
                        <td>
                            <input type="text" id="MEM_ADV_MDL_NO" name="MEM_ADV_MDL_NO" class="text" readonly/>
                            <a href="javascript:;" class="btn_st0 btn_blk777 small" id="productBtn"><span>검색</span></a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="subject">제목<span class="essential"><em class="blind">필수입력</em></span></label></th>
                        <td>
                            <input type="text" id="MEM_ADV_TITLE" name="MEM_ADV_TITLE" class="text xlarge" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="letter">내용<span class="essential"><em class="blind">필수입력</em></span></label></th>
                        <td>
                            <textarea class="textarea" id="MEM_ADV_CONTENTS" name="MEM_ADV_CONTENTS" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="answerType1">답변 희망형태</label></th>
                        <td>
                            <label for="answerType1" class="js-radio on">
                                <input type="radio" name="MEM_ADV_MAIL_YN" id="MEM_ADV_MAIL_YN" value="Y" checked="checked" />
                                이메일
                            </label>
                            <label for="answerType2" class="js-radio">
                                <input type="radio" name="MEM_ADV_MAIL_YN" id="MEM_ADV_MAIL_YN" value="T" />
                                전화상담
                            </label>
                            <label for="answerType3" class="js-radio">
                                <input type="radio" name="MEM_ADV_MAIL_YN" id="MEM_ADV_MAIL_YN" value="N" />
                                받지않음(마이페이지에서 확인) 
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><label for="file">파일첨부</label></th>
                        <td>
                            <input type="file" id="file" name="file" class="text file" />
                            <a href="javascript:;" class="btn_st0 btn_white small" id="fileDelBtn"><span>파일지우기</span></a>
                        </td>
                    </tr>
                </tbody>
                </form>
                </table><!-- // table-c -->

                <div class="section-button ar"><!-- section-button -->
                    <a href="javascript:;" class="btn_st1 btn_rd" id="goRegist"><span>저장</span></a>
                    
                </div><!-- // section-button -->

            </div><!-- // #body -->

		</div><!--// .contents E -->
	</article>
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<script src="<c:out value="${cdnDomain}" />/pc/js/jquery.form.js"></script>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script type="text/javascript">

	$(function(){
	
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
	    		url : "<c:out value="${frontDomain}" />/pc/customer/getSubCodeAjax.do",
	    		success : function(data){
	    			$("#MEM_ADV_QST_TYPE").empty().append("<option value=''>전체</option>");
	                $.each(data.list, function(i,item){  
	                 	$("#MEM_ADV_QST_TYPE").append("<option value='"+item.CMN_COM_IDX+"'>"+item.CMN_COM_NM+"</option>");
	                });
	                com.sel_chg($("#MEM_ADV_QST_TYPE"), 'chg');
	    		}, error: function(xhr,status,error){
	    			//console.log('오류가 발생하였습니다: ' + err.status);
	            }
	    	});
	    	
	 	 });
	 	 	
	 	// 주문 내역 검색 클릭 이벤트
	 	$(document).on("click","#orderBtn", function(){
	 		window.open("<c:out value="${frontDomain}" />/pc/customer/orderInfoPopup.do","orderSearchPop","width=1000, height=627, scrollbars=yes");
	 	});
	 	
	 	//상품 내역 검색 클릭 이벤트
	 	$(document).on("click","#productBtn", function(){
	 		window.open("<c:out value="${frontDomain}" />/pc/product/searchProductPopup.do","productSearchPop","width=1000, height=627, scrollbars=yes");
	 	});
	 	
	 	// 답변 이메일 수신 클릭 이벤트
	 	$("#MEM_ADV_MAIL_YN").on("change",function(){
 			if(this.value == 'Y' && ($("#EMAIL_ID").val() == "" || $("#EMAIL_DOMAIN").val() == "")){
	 			alert("이메일을 입력해주세요.");
	 			$("#EMAIL_ID").focus();
	 			return false;
	 		}	
	 	});
	 	
	 	// 파일 지우기
	 	$(document).on("click", "#fileDelBtn", function(){
	 		$("#file").val('');
	 	});
	 	
		// 등록 버튼 클릭 이벤트
	    $(document).on("click", "#goRegist", function (){
			var $frm = $("#frm");
			var code = $("#MEM_ADV_QST_TYPE_UP").val();
			
            if($("#MEM_ADV_QST_TYPE").val() == ""){
            	alert("문의 유형을 선택하세요.");
            	return;
            }
            
            if(code == "107"){
	    		if($("#MEM_ADV_MDL_NO").val() == ""){
	    			alert("상품코드를 검색하세요.");
	    			$("#productBtn").trigger("click");
	    			return;
	    		}
            }
            
	    	if(code == "108"){
	    		if($("#ORD_MST_CD").val() == ""){
	    			alert("주문 번호를 검색하세요.");
	    			$("#orderBtn").trigger("click");
	    			return;
	    		}
	    	}
            
            if($("#MEM_ADV_TITLE").val() == ""){
            	alert("제목을 입력하세요");
            	$("#MEM_ADV_TITLE").focus();
            	return;
            }
            if($("#MEM_ADV_CONTENTS").val() == ""){
            	alert("내용을 입력하세요");
            	$("#MEM_ADV_CONTENTS").focus();
            	return;
            }
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
	           	        		location.reload();
	           	        	}else{
	           	        		alert(data.resultMsg);	
	           	        		$("#fileTd").empty();
	           	        		$("#fileTd").append("<input type=\"file\" name=\"file\" class=\"file\" id=\"file\"/>");
	           	        		$("#fileTd").append("<p class=\"message\">10MB 이하의 파일만 업로드 가능합니다<br/>업로드 가능한 파일형식은 [hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf] 입니다.</p>");
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
				$frm.attr("action", "<c:out value="${frontDomain}"/>/pc/customer/inquiryInsert.do");
	            $frm.ajaxSubmit(options);
            }
	    });
	});
	
	//목록
	$(document).on("click","#goList",function(){
		$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/inquiryMain.do", "target":"_self", "method":"get"}).submit();
	});
	
	resultOrderCd		= function(ordMstCd){
		$("#ORD_MST_CD").val(ordMstCd);
	};
	
	fnResultProduct		= function(obj){
		$("#MEM_ADV_MDL_NO").val(obj.PRD_MST_CD);
	};
	
</script>

<!--  <script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>-->
</html>