<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-helpdesk blackyak"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title-->
		    <h3><span>단체주문</span></h3>
		    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		    <a href="#more" class="more"><span class="icon"><em>더 보기</em></span></a>
		    <div id="more" class="sub">
		        <ul class="reset">
		        	<li><a href="<c:out value="${mobileDomain}" />/mobile/customer/faqBoardList.do"><span>FAQ</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/inquiryMain.do"><span>1:1문의</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/noticeBoardList.do"><span>공지사항</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/membershipBenefitNormal.do"><span>멤버십혜택</span></a></li>
		            <li class="active"><a href="javascript:;"><span>단체주문문의</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/utilAgree.do"><span>이용약관</span></a></li>
		            <li><a href="<c:out value="${mobileDomain}" />/mobile/customer/privacyPolicy.do"><span>개인정보취급방침</span></a></li>
		        </ul>
		    </div>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap gutter"><!-- wrap -->

				<ul class="list list-a">
				    <li>단체주문 견적서를 작성하여 신청해주시면 담당자 확인 후 개별 연락드리도록 하겠습니다.</li>
				    <li>상담가능 수량은 다음과 같습니다.</li>
				</ul>

				<table class="table-col table-a" cellspacing="0">
				    <colgroup>
				        <col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
				    </colgroup>
				    <tr>
				        <th><span>납품가기준</span></th>
				        <th><span>티셔츠</span></th>
				        <th><span>자켓</span></th>
				        <th><span>바지</span></th>
				        <th><span>등산화</span></th>
				    </tr>
				    <tr>
				        <td>
				            3,000,000원<br />
				            이상
				        </td>
				        <td>
				            100벌<br />
				            이상
				        </td>
				        <td>
				            50벌<br />
				            이상
				        </td>
				        <td>
				            100벌<br />
				            이상
				        </td>
				        <td>
				            30족<br />
				            이상
				        </td>
				    </tr>
				</table>

				<ul class="list list-a">
				    <li>여러 상품의 견적을 원하시면 견적샘플양식을 다운로드 받아 양식에 맞게 입력하신 후, 파일을 업로드 해주세요</li>
				    <li>견적 샘플 양식 다운로드와 파일 업로드는 PC버전에서만 지원합니다.</li>
				</ul>

				 <h4 class="reset"><span class="large">단체주문 가능상품</span></h4>

                 <div class="grid  group-banners"><!-- group-banners -->
                     <div class="col col-1-2">
                         <div class="module">
                             <a href="http://m.etland.com/mobile/product/product.do?prdMstCd=ABYSHX502300000163" target="_blank"><img src="<c:out value="${cdnDomain}" />/mobile/img/temp/group_banner.png" alt="" /></a>
                         </div>
                     </div>
                     <div class="col col-1-2">
                         <div class="module text-right">
                             <a href="http://m.etland.com/mobile/product/product.do?prdMstCd=ABYSHX550600000196" target="_blank"><img src="<c:out value="${cdnDomain}" />/mobile/img/temp/group_banner_02.png" alt="" /></a>
                         </div>
                     </div>
                 </div><!-- // group-banners -->
                        
				<p class="mt15">
				    <strong class="warning">* 표시된 항목은 필수 입력 사항입니다.</strong>
				</p>
				
				<form id="frm" name="frm" enctype="multipart/form-data">
				<input type="hidden" id="GRP_INQ_CUSTOMER_EMAIL" name="GRP_INQ_CUSTOMER_EMAIL"/>
				<input type="hidden" id="GRP_INQ_CUSTOMER_TEL" name="GRP_INQ_CUSTOMER_TEL"/>
				<double-submit:preventer/>
					<div class="table table-form"><!-- table -->
					    <div class="row">
					        <div class="cell sbj">
					            상품코드
					        </div>
					        <div class="cell fields">
					            <input type="text" class="text large" id="GRP_PRD_MST_CD" name="GRP_PRD_MST_CD" title="상품코드" maxlength="20"/><br/>
					            <span id="resultSpan"></span>
					        </div>
					    </div>
					    <div class="row">
					        <div class="cell sbj">
					            주문수량
					            <span class="warning ir inline">*<em>필수입력</em></span>
					        </div>
					        <div class="cell fields">
					            <input type="text" class="text spinner" id="GRP_INQ_WANT_CNT" name="GRP_INQ_WANT_CNT" title="주문수량" maxlength="8"/>
					        </div> 
					    </div>
					    <div class="row">
					        <div class="cell sbj">
					            단체명
					            <span class="warning ir inline">*<em>필수입력</em></span>
					        </div>
					        <div class="cell fields">
					            <input type="text" class="text large" id="GRP_INQ_GRP_NM" name="GRP_INQ_GRP_NM"  title="단체명" maxlength="20"/>
					        </div>
					    </div>
					    <div class="row">
					        <div class="cell sbj">
					            담당자명
					            <span class="warning ir inline">*<em>필수입력</em></span>
					        </div>
					        <div class="cell fields">
					            <input type="text" class="text" id="GRP_INQ_CUSTOMER_NM" name="GRP_INQ_CUSTOMER_NM" title="담당자명" maxlength="10">
					        </div>
					    </div>
					    <div class="row">
					        <div class="cell sbj">
					            내용
					            <span class="warning ir inline">*<em>필수입력</em></span>
					        </div>
					        <div class="cell fields">
					            <textarea id="GRP_INQ_CONTENTS" name="GRP_INQ_CONTENTS" cols="30" rows="5" class="textarea xlarge" placeholder="최소 20글자 이상,최대 500글자 이하 입력해주세요." maxlength="500"></textarea>
					        </div>
					    </div>
					    <div class="row">
					        <div class="cell sbj">
					            연락처
					            <span class="warning ir inline">*<em>필수입력</em></span>
					        </div>
					        <div class="cell fields">
					            <select id="HP1" class="select small" title="휴대폰 번호 앞자리">
				                    <c:if test="${not empty codes.HP_CODE }">
				                         <c:forEach var="hpRow" items="${codes.HP_CODE }">
				                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
				                         </c:forEach>
				                    </c:if>
						        </select>
					            -
					            <input type="tel" id="HP2" name="HP2" class="text small" title="휴대폰번호 가운데자리" maxlength="4">
					            -
					            <input type="tel" id="HP3" name="HP3" class="text small" title="휴대폰번호 뒷자리" maxlength="4">
					        </div>
					    </div>
					    <div class="row">
					        <div class="cell sbj">
					            통화가능<br />시간
					        </div>
					        <div class="cell fields">
					            <select id="GRP_INQ_AVAIL_STIME" name="GRP_INQ_AVAIL_STIME" class="select small">
									<option value="">선택</option>
									<c:forEach var="hour" begin="0" end="23" step="1">	                                    	
	                                	<option value="<fmt:formatNumber value="${hour }" type="number" pattern="00"/>"><fmt:formatNumber value="${hour }" type="number" pattern="00"/></option>
		                            </c:forEach>
								</select>
					            시 에서
					            <select id="GRP_INQ_AVAIL_ETIME" name="GRP_INQ_AVAIL_ETIME" class="select small">
									<option value="">선택</option>
									<c:forEach var="hour" begin="0" end="23" step="1">	                                    	
	                                	<option value="<fmt:formatNumber value="${hour }" type="number" pattern="00"/>"><fmt:formatNumber value="${hour }" type="number" pattern="00"/></option>
		                            </c:forEach>
								</select>
					            시 까지
					        </div>
					    </div>
					    <div class="row">
					        <div class="cell sbj">
					            이메일
					            <span class="warning ir inline">*<em>필수입력</em></span>
					        </div>
					        <div class="cell fields">
					            <p class="reset">
					            	<input id="EMAIL_ID" name="EMAIL_ID" type="text" class="text email id" title="이메일주소 앞" maxlength="30">
					                @
					                <input id="EMAIL_DOMAIN" name="EMAIL_DOMAIN" type="text" class="text email domain" title="이메일주소 뒤" maxlength="30">
					            </p>
					            <p class="reset">
					                <select id="emailDomainSelectbox" class="select" title="이메일 서비스 도메인 선택">
						                <option value="">직접입력</option>
			                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
			                            	<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
			                                    <option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
			                                </c:forEach>
			                            </c:if>
		                            </select>
					            </p>
					        </div>
					    </div>
					</div><!-- // table -->
				</form>
				<p class="ding-a mb20">
				    파일 첨부는 PC버전에서만 지원합니다.
				</p>

				<div class="section-button actions"><!-- actions -->
				    <div class="col-1-1"><a href="javascript:;" id="goRegist" class="button warning full"><span>저장</span></a></div>
				</div><!-- // actions -->

			</div><!-- // wrap -->
		</div><!-- // container -->
</div><!-- // contents -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<script src="<c:out value="${cdnDomain}" />/mobile/js/jquery.form.js"></script>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
//<![CDATA[
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
	               url:"<c:out value="${mobileDomain}"/>/mobile/customer/productCheckAjax.do",
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
                    $("#GRP_PRD_MST_CD").val($.trim($("#GRP_PRD_MST_CD").val()));//상품코드 공백 제거
                    $("#GRP_INQ_CUSTOMER_EMAIL").val($.trim($("#EMAIL_ID").val()) + "@" + $.trim($("#EMAIL_DOMAIN").val()));
                    $("#GRP_INQ_CUSTOMER_TEL").val($.trim($("#HP1").val()) + "-" + $.trim($("#HP2").val()) + "-" + $.trim($("#HP3").val()));    
                    $("#goRegist").hide();
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
                   	        	}
                   	         },  
            		       	 error:function(err)
            		         {
            		             alert("오류가 발생하였습니다.\n[" + err.status + "]");
            		         }
                   	     };
                    	 $frm.attr("action", "<c:out value="${mobileDomain}"/>/mobile/customer/groupInquiryInsert.do");
                    	 $frm.ajaxSubmit(options);
                }
            }
	    });
	});

//]]>
</script>

</body>
</html>