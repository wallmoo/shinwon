<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-helpdesk"><!-- page class : main -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->
		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
	         <div id="breadcrumb" class="wrap">
	             <div class="holder">
	                 <span>홈</span>
	                 <span class="gt">&gt;</span>
	                 <span>고객센터</span>
	                 <span class="gt">&gt;</span>
	                 <strong class="warning">단체주문문의</strong>
	             </div>
	         </div>
	    </div><!-- // breadcrumb -->

		<div class="container visual-wrap"><!-- visual -->
		    <div class="wrap">
		        <img src="<c:out value="${cdnDomain}"/>/pc/img/custom/visual_helpdesk.png" alt="" />
		    </div>
		</div><!-- // visual -->


		<div class="container"><!-- container -->
		<div class="wrap"><!-- wrap -->

		<div id="lnb"><!-- lnb -->
		    <ul class="reset">
		        <li><a href="<c:out value="${frontDomain}" />/pc/customer/faqBoardList.do">FAQ</a></li>
		        <li><a href="<c:out value="${frontDomain}" />/pc/customer/inquiryMain.do">1:1문의</a></li>
		        <li><a href="<c:out value="${frontDomain}" />/pc/customer/noticeBoardList.do">공지사항</a></li>
		        <li><a href="<c:out value="${frontDomain}" />/pc/customer/membershipBenefit.do">멤버십혜택</a></li>
		        <li class="active"><a href="<c:out value="${frontDomain}" />/pc/customer/groupInquiryForm.do">단체주문문의</a></li>
		        <li><a href="<c:out value="${frontDomain}" />/pc/customer/utilAgree.do">이용약관</a></li>
			    <li><a href="<c:out value="${frontDomain}" />/pc/customer/privacyPolicy.do">개인정보취급방침</a></li>
		    </ul>
		</div><!-- // lnb -->

		<div id="internal"><!-- internal -->

		<h3 class="title"><span>단체주문문의</span></h3>

		<div class="frame frame-b bulk-order-guide"><!-- frame -->
		<ul class="list list-a">
		    <li>단체주문 견적서를 작성하여 신청해주시면 담당자 확인 후 개별 연락드리도록 하겠습니다.</li>
		    <li>상담가능 수량은 다음과 같습니다.
		
		        <table class="table-col table-c mt20 mb20" cellspacing="0">
		        <colgroup>
		            <col style="width: auto;" />
		         <col style="width: auto;" />
		         <col style="width: auto;" />
		         <col style="width: auto;" />
		         <col style="width: auto;" />
		        </colgroup>
		        <thead>
		            <tr>
		                <th><span>납품가 기준</span></th>
		                <th><span>티셔츠</span></th>
		                <th><span>자켓</span></th>
		                <th><span>바지</span></th>
		                <th><span>등산화</span></th>
		            </tr>
		        </thead>
		        <tbody>
		            <tr>
		                <td>3,000,000원 이상</td>
		                <td>100벌 이상</td>
		                <td>50벌 이상</td>
		                <td>100벌 이상</td>
		                <td>30족 이상</td>
		        </tbody>
		        </table>
		    </li>
		    <li>여러 상품의 견적을 원하시면 견적샘플양식을 다운로드 받아 양식에 맞게 입력하신 후, 파일을 업로드 해주세요</li>
		</ul>

		<div class="section-button text-left"><!-- section button -->
		 <a href="javascript:;" id="sampleDownload" class="button success large" data-file_name="INC_ONLINE_groupInquirySample.xls"><span><span class="icon down"><!-- icon --></span>견적서 샘플 양식 다운로드</span></a>
		</div><!-- // section button -->
		</div><!-- frame -->

		<input type="hidden" id="productCheckYn" name="productCheckYn" value="N" />
		
		<h4 class="title"><span>단체주문 가능상품</span></h4>

        <div class="grid group-banners"><!-- group-banners -->
            <div class="col col-1-2">
                <div class="module">
                    <a href="http://www.etland.com/pc/product/product.do?prdMstCd=ABYSHX502300000163" target="_blank"><img src="<c:out value="${cdnDomain}" />/pc/img/temp/group_banner.png" alt="단체주문 가능상품" /></a>
                </div>
            </div>
            <div class="col col-1-2">
                <div class="module">
                    <a href="http://www.etland.com/pc/product/product.do?prdMstCd=ABYSHX550600000196" target="_blank"><img src="<c:out value="${cdnDomain}" />/pc/img/temp/group_banner_02.png" alt="단체주문 가능상품" /></a>
                </div>
            </div>
        </div><!-- // group-banners -->
        
		<div class="pos-relative">
		    <p class="warning">
		        표시된 항목은 필수 입력 사항입니다
		    </p>
		    <a href="javascript:;" class="guide-link pos-absolute" style="top: 0px; right: 0px;">상품코드 확인하는 방법</a>
		</div>

		<form id="frm" name="frm" enctype="multipart/form-data">
		<input type="hidden" id="GRP_INQ_CUSTOMER_EMAIL" name="GRP_INQ_CUSTOMER_EMAIL"/>
		<input type="hidden" id="GRP_INQ_CUSTOMER_TEL" name="GRP_INQ_CUSTOMER_TEL"/>
		<double-submit:preventer/>
			<table class="bbs-form fixed" cellspacing="0"><!-- bbs-form -->
			<caption></caption>
			<colgroup>
				<col style="width: 135px;" />
				<col style="width: auto;" />
			</colgroup>
		    <tbody>
		        <tr>
		            <th><span>상품코드</span></th>
		            <td>
		                <input type="text" class="text large" id="GRP_PRD_MST_CD" name="GRP_PRD_MST_CD" title="상품코드" maxlength="20">&nbsp;
		                <span id="resultSpan"></span>
		            </td>
		        </tr>
		        <tr>
		            <th><span>주문수량<span class="icon require"><em>필수입력</em></span></span></th>
		            <td>
		                <input type="text" class="text" id="GRP_INQ_WANT_CNT" name="GRP_INQ_WANT_CNT" maxlength="8" title="주문수량"> 개  
		            </td>
		        </tr>
		        <tr>
		            <th><span>단체명<span class="icon require"><em>필수입력</em></span></span></th>
		            <td>
		                <input type="text" class="text xlarge"  id="GRP_INQ_GRP_NM" name="GRP_INQ_GRP_NM"  title="단체명" maxlength="20">
		            </td>
		        </tr>
		        <tr>
		            <th><span>담당자명<span class="icon require"><em>필수입력</em></span></span></th>
		            <td>
		                <input type="text" class="text" id="GRP_INQ_CUSTOMER_NM" name="GRP_INQ_CUSTOMER_NM" title="담당자명" maxlength="10">
		            </td>
		        </tr>
		        <tr>
		            <th><span>내용<span class="icon require"><em>필수입력</em></span></span></th>
		            <td>
		                <textarea class="textarea" id="GRP_INQ_CONTENTS" name="GRP_INQ_CONTENTS" maxlength="500"></textarea>
		            </td>
		        </tr>
		        <tr>
		            <th><span>연락처<span class="icon require"><em>필수입력</em></span></span></th>
		            <td>
		                <select id="HP1" class="select" title="휴대폰 번호 앞자리">
	                    <c:if test="${not empty codes.HP_CODE }">
	                         <c:forEach var="hpRow" items="${codes.HP_CODE }">
	                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
	                         </c:forEach>
	                    </c:if>
				        </select> - 
						<input id="HP2" name="HP2" type="text" class="text small" title="휴대폰번호 가운데자리" maxlength="4"> - 
						<input id="HP3" name="HP3" type="text" class="text small" title="휴대폰번호 뒷자리" maxlength="4">		
		            </td>
		        </tr>
		        <tr>
		            <th><span>통화가능시간</span></th>
		            <td>
		                <select id="GRP_INQ_AVAIL_STIME" name="GRP_INQ_AVAIL_STIME" class="select">
							<option value="">선택</option>
							<c:forEach var="hour" begin="0" end="23" step="1">	                                    	
                                      <option value="<fmt:formatNumber value="${hour }" type="number" pattern="00"/>"><fmt:formatNumber value="${hour }" type="number" pattern="00"/></option>
                                  </c:forEach>
						</select> 시 에서
		                <select id="GRP_INQ_AVAIL_ETIME" name="GRP_INQ_AVAIL_ETIME" class="select">
							<option value="">선택</option>
							<c:forEach var="hour" begin="0" end="23" step="1">	                                    	
                                      <option value="<fmt:formatNumber value="${hour }" type="number" pattern="00"/>"><fmt:formatNumber value="${hour }" type="number" pattern="00"/></option>
                                  </c:forEach>
						</select> 시 까지
		            </td>
		        </tr>
		        <tr>
		            <th><span>이메일 주소<span class="icon require"><em>필수입력</em></span></span></th>
		            <td>
		                <input id="EMAIL_ID" name="EMAIL_ID" type="text" class="text email id" title="이메일주소 앞" maxlength="30">
		                @
		                <input id="EMAIL_DOMAIN" name="EMAIL_DOMAIN" type="text" class="text email domain" title="이메일주소 뒤" maxlength="30">
		                <select id="emailDomainSelectbox" class="select" title="이메일 서비스 도메인 선택">
			                <option value="">직접입력</option>
                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
                            	<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
                                    <option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
                                </c:forEach>
                            </c:if>
                           </select>
		            </td>
		        </tr>
		        <tr>
		            <th><span>파일 첨부</span></th>
		            <td id="fileTd">
		                <input type="file" id="file" name="file" class="file" />
		                <p class="message">
                          	10MB 이하의 파일만 업로드 가능합니다<br/>
                          	업로드 가능한 파일형식은 [hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf] 입니다. 
                        </p>
		            </td>
		        </tr>
		    </tbody>
			</table>
		</form><!-- // bbs-form -->

		<div class="section-button"><!-- section button -->
		    <a href="javascript:;" id= "goRegist" class="button primary large"><span>저장</span></a>
		</div><!-- // section button -->
		
		</div><!-- internal -->
		
		<!-- 파일 다운로드용 폼 -->
	    <form name="fileForm" id="fileForm">
	         <input type="hidden" name="fileName" value="" />
	    </form>
	    
		</div><!-- wrap -->
		</div><!-- // container -->

		<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

	</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<script src="<c:out value="${cdnDomain}" />/pc/js/jquery.form.js"></script>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script>
	$(function()
	{
		// 상품코드 keydown 이벤트
	    $(document).on("keydown", "#GRP_PRD_MST_CD", function () 
	    {
	        $("#productCheckYn").val("N");
	    });
		
		// 상품코드 입력시 유효성 체크
		$(document).on("keyup blur","#GRP_PRD_MST_CD",function()
		{
			var $obj = $("#GRP_PRD_MST_CD");
	        var value = $.trim($obj.val());
	        
	        if(value != "")
	        {
	           $.ajax({
	               type:"POST",
	               async:true,
	               url:"<c:out value="${frontDomain}"/>/pc/customer/productCheckAjax.do",
	               data : {"PRD_MST_CD":value},
	               success:function(data)
	               {
	                   if(data.resultYn == "N")
	                   {
	                       $("#resultSpan").html("<font color=\"red\">해당 상품코드의 상품 정보가 존재하지 않습니다.</font>");
	                       $("#productCheckYn").val("N");
	                   }
	                   else
	                   {
	                	   $("#resultSpan").html("상품명 : "+data.PRD_MST_NM + "\n확인되었습니다.");
	                       $("#productCheckYn").val("Y");
	                       $("#GRP_INQ_BRAND_CD").val(data.PRD_MST_BRAND_CD);
	                   }
	               },
	               error:function(err)
	               {
	                   alert("오류가 발생하였습니다.\n[" + err.status + "]");
	               }
	           }); 
	        }
	        else
			{
	        	$("#resultSpan").html("");
			}
		});
		
		// 이메일 도메인 select box 변경 이벤트
	    $(document).on("change", "#emailDomainSelectbox", function () 
	    {
	        var $obj = $("#EMAIL_DOMAIN");
	        if($(this).val() == "")
	        {
	            $obj.prop("readonly", false);
	            $obj.val("");
	        }
	        else
	        {
	            $obj.prop("readonly", true);
	            $obj.val($(this).val());
	        }
	    });
		
		// 폼체크
	    $("#frm").validate({
	        rules: {	        	
	        	GRP_INQ_WANT_CNT:{required:true, number:true}, // 납품수량
	        	GRP_INQ_GRP_NM:{required:true}, // 단체명
	        	GRP_INQ_CUSTOMER_NM:{required:true}, // 담당자명
	        	EMAIL_ID:{required:true, emailId:true}, // 이메일 아이디
	            EMAIL_DOMAIN:{required:true, emailDomain:true}, // 이메일 도메인
	        	HP2:{required:true, number:true}, // 핸드폰번호 중간자리
	        	HP3:{required:true, number:true}, // 핸드폰번호 뒷자리
	        	GRP_INQ_CONTENTS:{required:true} //문의사항
	        },
	        messages :{	        	
	        	GRP_INQ_WANT_CNT: {required:"[주문수량]을 입력해주십시오.", number:"[주문수량]을 숫자로 입력해주십시오."},
	        	GRP_INQ_GRP_NM: {required:"[단체명]을 입력해주십시오."},
	        	GRP_INQ_CUSTOMER_NM: {required:"[담당자명]을 입력해주십시오."},
	        	EMAIL_ID : {required:"[이메일]아이디를 반드시 입력해 주십시오.", emailId:"[이메일]아이디 형식을 올바르게 입력해 주십시오."},
	            EMAIL_DOMAIN : {required:"[이메일]도메인을 반드시 입력해 주십시오.", emailDomain:"[이메일]도메인 형식을 올바르게 입력해 주십시오."},
	            HP2 : {required:"[핸드폰번호]가운데 자리를 입력해주십시오.", number:"[핸드폰번호]가운데 자리를 숫자로 입력해주십시오."},
	            HP3 : {required:"[핸드폰번호]뒷자리를 입력해주십시오.", number:"[핸드폰번호]뒷자리를 숫자로 입력해주십시오."},
	            GRP_INQ_CONTENTS : {required:"[문의사항]을 반드시 입력해 주십시오."}
	        }
	    });
		
		// 등록 버튼 클릭 이벤트
	    $(document).on("click", "#goRegist", function () {
            var $frm = $("#frm");
            if($frm.valid())
            {
            	//상품코드가 공백이 아닌경우 코드확인 여부 체크
            	if($.trim($("#GRP_PRD_MST_CD").val()) != ""){
            		if($("#productCheckYn").val() == "N"){
            			alert("상품코드를 확인해주십시오.");
            			$("#GRP_PRD_MST_CD").focus();
            			return;
            		}
            	}
				
            	var $stime = parseInt($("#GRP_INQ_AVAIL_STIME").val());
            	var $etime = parseInt($("#GRP_INQ_AVAIL_ETIME").val());
            	
            	if($stime > $etime)
            	{
            		alert("[통화가능시간]이 잘못 선택되었습니다. \n 확인하신 후 다시 선택해주십시오.");
            		$("#GRP_INQ_AVAIL_STIME").focus();
            		return false;
            	}
            	
                if (confirm( "단체주문 견적을 요청하시겠습니까?"))
                {
                	$.showOverlay(true, {
			            isIndicator: true
			        });
                	
                    $("#GRP_PRD_MST_CD").val($.trim($("#GRP_PRD_MST_CD").val()));//상품코드 공백 제거
                    $("#GRP_INQ_CUSTOMER_EMAIL").val($.trim($("#EMAIL_ID").val()) + "@" + $.trim($("#EMAIL_DOMAIN").val()));
                    $("#GRP_INQ_CUSTOMER_TEL").val($.trim($("#HP1").val()) + "-" + $.trim($("#HP2").val()) + "-" + $.trim($("#HP3").val()));    
                    
                    var options = {
                   	    	type:"POST",
                   	   		dataType:"json",       	        
                   	        success: function(data) {
                   	        	if(data.isSuccessYn == "Y")
                   	        	{
                   	        		alert(data.resultMsg);
                   	        		location.reload();
                   	        	}
                   	        	else
                   	        	{
                   	        		alert(data.resultMsg);
                   	        		$("#fileTd").empty();
                   	        		$("#fileTd").append("<input type=\"file\" name=\"file\" class=\"file\" id=\"file\"/>");
                   	        		$("#fileTd").append("<p class=\"message\">10MB 이하의 파일만 업로드 가능합니다<br/>업로드 가능한 파일형식은 [hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf] 입니다.</p>");
                   	        		$.showOverlay(false, {
							            isIndicator: true
							        });
                   	        	}
                   	         },  
            		       	 error:function(err)
            		         {
            		             alert("오류가 발생하였습니다.\n[" + err.status + "]");
            		             $.showOverlay(false, {
						            isIndicator: true
						       	 });
            		         }
                   	     };
                    	 $frm.attr("action", "<c:out value="${frontDomain}"/>/pc/customer/groupInquiryInsert.do");
                    	 $frm.ajaxSubmit(options);
                }
            }
	    });
	    
	 	// 파일 다운로드
	    $(document).on("click", "#sampleDownload", function () 
	    {
	        var $fileForm = $("#fileForm");
	        var $this = $(this);
	        $fileForm.find("input[name='fileName']").val($this.data("file_name"));
	        $fileForm.attr({"action":"<c:out value="${frontDomain}"/>/pc/common/sampleFileDownload.do", "target":"_self", "method":"post"}).submit();
	    });
		
		// 상품코드 확인방법 클릭 이벤트
		$(document).on("click", ".pos-absolute" , function(){
			window.open("<c:out value="${frontDomain}" />/pc/customer/productCdHelpPopup.do","test","width=620, height=540, scrollbars=no");
		});
	});
</script>
<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>