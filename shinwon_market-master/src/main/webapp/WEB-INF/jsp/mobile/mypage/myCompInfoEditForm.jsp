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
	
	        <div class="tab-a" data-role="navbar"><!-- tab-a -->
	            <ul>
	                <li class="active"><a href="javascript:;">기본정보 변경</a><span class="blind">현재위치</span></li>
	                <li><a href="javascript:changePwd();" class="_pg_link" target="_self">비밀번호 변경</a></li>
	            </ul>
	        </div><!-- // tab-a -->
	        
	        <div class="padder mt20">
	            <ul class="list list-a">
	                <li>회원님의 정보를 중 변경된 내용이 있는 경우, 아래에서 수정해주세요.</li>
	                <li>회원정보는 개인정보취급방침에 따라 안전하게 보호됩니다.</li>
	            </ul>
	        </div>
	        
	        <form id="frm" name="frm" method="post">
				<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
				<input type="hidden" name="MEM_MST_ERP_ID" id="MEM_MST_ERP_ID" value="<c:out value="${memberInfo.MEM_MST_ERP_ID }"/>"/>
				<input type="hidden" name="MEM_CPR_NO1" id="MEM_CPR_NO1" value="<c:out value="${memberInfo.MEM_CPR_NO1 }"/>"/>
				<input type="hidden" name="MEM_CPR_NO2" id="MEM_CPR_NO2" value="<c:out value="${memberInfo.MEM_CPR_NO2 }"/>"/>
				<input type="hidden" name="MEM_CPR_NO3" id="MEM_CPR_NO3" value="<c:out value="${memberInfo.MEM_CPR_NO3 }"/>"/>
				<input type="hidden" name="MEM_MST_REG_DT" id="MEM_MST_REG_DT" value="<c:out value="${memberInfo.MEM_MST_REG_DT }"/>"/>
		       
		        <div class="ct title-my-info first-child">
		            <h3 class="fl"><span class="large">기본정보</span></h3>
		            <p class="fr small">
		                <span class="essential"><em class="blind">필수입력</em></span> 는 필수 입력사항 입니다.
		            </p>
		        </div>
			
		        <ul class="form-a form-my-info"><!-- form-a -->
		            <li>
		                <div class="tit">기업명</div>
		                <div class="field">
		                    <strong><c:out value="${memberInfo.MEM_CPR_NM }"/></strong>
		                </div>
		            </li>
		            <li>
		                <div class="tit">사업자등록번호</div>
		                <div class="field">
		                    <strong>
		                    	<c:out value="${memberInfo.MEM_CPR_NO1 }"/>-<c:out value="${memberInfo.MEM_CPR_NO2 }"/>-<c:out value="${memberInfo.MEM_CPR_NO3 }"/>
		                    </strong>
		                </div>
		            </li> 
		            <li>
		                <div class="tit">아이디</div>
		                <div class="field">
		                    <strong><c:out value="${memberInfo.MEM_MST_MEM_ID }"/></strong>
		                </div>
		            </li>
		            <li>
		                <div class="tit">
		                    <label for="ceo">대표자명<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <input type="text" id="MEM_CPR_CEO_NM" name="MEM_CPR_CEO_NM" class="text" 
                            		maxlength="10" value="<c:out value="${memberInfo.MEM_CPR_CEO_NM }"/>" data-err_msg_id="ceoNm"  />
                            <p class="message" id="ceoNm"></p>
		                </div>
		            </li>
		            <li class="business-type">
		                <div class="tit">
		                    <label for="businessType">업종/업태</label>
		                </div>
		                <div class="field">
		                    <input type="text" id="MEM_CPR_TYPE" name="MEM_CPR_TYPE" class="text" title="업태" 
                           			maxlength="10" value="<c:out value="${memberInfo.MEM_CPR_TYPE }"/>"/>
                            <input type="text" id="MEM_CPR_STUS" name="MEM_CPR_STUS" class="text" title="업종" 
                            		maxlength="10" value="<c:out value="${memberInfo.MEM_CPR_STUS }"/>"/>
		                </div>
		            </li>
		            <li class="tel">
		                <div class="tit">
		                    <label for="MEM_CPR_TEL">대표전화</label>
		                </div>
		                <div class="field">
		                    <label for="MEM_CPR_TEL1" class="sel_box_st0">
		                        <select id="MEM_CPR_TEL1" name="MEM_CPR_TEL1" class="select" title="대표전화 앞자리">
		                            <option value="">선택</option>
	                                <c:if test="${not empty codes.TEL_CODE }">
		                                <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
		                                    <option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${telRow.CMN_COM_NM eq memberInfo.MEM_CPR_TEL1 }">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
		                                </c:forEach>
	                                </c:if>
		                        </select>
		                    </label> -
		                    <input type="text" class="text number" name="MEM_CPR_TEL2" id="MEM_CPR_TEL2" maxlength="4" 
                            		title="대표전화 중간자리" value="<c:out value="${memberInfo.MEM_CPR_TEL2 }"/>" /> -
		                    <input type="text" class="text number" name="MEM_CPR_TEL3" id="MEM_CPR_TEL3" maxlength="4" 
                            		title="대표전화 끝자리" value="<c:out value="${memberInfo.MEM_CPR_TEL3 }"/>"/>
		                </div>
		            </li>
		            <li class="tel">
		                <div class="tit">
		                    <label for="MEM_CPR_FAX">팩스번호</label>
		                </div>
		                <div class="field">
		                    <label for="MEM_CPR_FAX1" class="sel_box_st0">
		                        <select id="MEM_CPR_FAX1" name="MEM_CPR_FAX1" class="select" title="대표전화 앞자리">
		                            <option value="">선택</option>
	                                <c:if test="${not empty codes.TEL_CODE }">
		                                <c:forEach var="faxRow" items="${codes.TEL_CODE }" varStatus="i">
		                                    <option value="<c:out value="${faxRow.CMN_COM_NM }"/>" <c:if test="${faxRow.CMN_COM_NM eq memberInfo.MEM_CPR_FAX1 }">selected="selected"</c:if>><c:out value="${faxRow.CMN_COM_NM }"/></option>
		                                </c:forEach>
	                                </c:if>
		                        </select>
		                    </label> -
		                    <input type="text" class="text number" name="MEM_CPR_FAX2" id="MEM_CPR_FAX2" maxlength="4" 
                            		title="팩스번호 중간자리" value="<c:out value="${memberInfo.MEM_CPR_FAX2 }"/>" /> -
		                    <input type="text" class="text number" name="MEM_CPR_FAX3" id="MEM_CPR_FAX3" maxlength="4" 
                            		title="팩스번호 끝자리" value="<c:out value="${memberInfo.MEM_CPR_FAX3 }"/>"/>
		                </div>
		            </li>
		            <li class="address">
		                <div class="tit">
		                    <label for="address">주소<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <p class="zip">
		                        <input type="text" id="MEM_CPR_ZIP_CDE5" name="MEM_CPR_ZIP_CDE5" class="text number" maxlength="5" 
                                		title="우편번호"  data-err_msg_id="zip" value="<c:out value="${memberInfo.MEM_CPR_ZIP_CDE5 }"/>"/>
		                        <a href="javascript:$.com.util.layPop('open', $('#layZipcode'), true)" class="button small"><span>우편번호 찾기</span></a>
		                    </p>
		                    <p class="message" id="zip"></p>
		                    <p>
		                        <input type="text" class="text" name="MEM_CPR_DRO_ADR1" id="MEM_CPR_DRO_ADR1" maxlength="100" title="도로명 주소"  
                                		placeholder="도로명 주소"  data-err_msg_id="doro" value="<c:out value="${memberInfo.MEM_CPR_DRO_ADR1 }"/>"/>
		                    </p>
		                    <p>
		                        <input type="text" class="text" name="MEM_CPR_JBN_ADR1" id="MEM_CPR_JBN_ADR1" maxlength="100" title="지번 주소" 
                                		placeholder="지번 주소"  data-err_msg_id="jibun" value="<c:out value="${memberInfo.MEM_CPR_JBN_ADR1 }"/>"/>
		                    </p>
		                    <p>
		                        <input type="text" class="text" name="MEM_CPR_ADR2" id="MEM_CPR_ADR2" title="상세 주소" placeholder="상세 주소"
                                		maxlength="100" data-err_msg_id="addrDetail" value="<c:out value="${memberInfo.MEM_CPR_DRO_ADR2 }"/>" />
		                    </p>
		                    <p class="message" id="doro"></p>
                            <p class="message" id="jibun"></p>
                            <p class="message" id="addrDetail"></p>
		                </div>
		            </li>
		        </ul><!-- // form-a -->
	        
		        <div class="ct title-my-info">
		            <h3 class="fl"><span class="large">담당자 정보</span></h3>
		        </div>
	
		        <ul class="form-a form-my-info"><!-- form-a -->
		            <li>
		                <div class="tit">
		                    <label for="name">담당자이름<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <input type="text" class="text" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" maxlength="10" data-err_msg_id="memNm" 
                            		value="<c:out value="${memberInfo.MEM_MST_MEM_NM }"/>" />
                            <p class="message" id="memNm"></p>
		                </div>
		            </li>
		            <li>
		                <div class="tit">
		                    <label for="mail">이메일<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <input type="text" class="text" name="MEM_MST_MAIL" id="MEM_MST_MAIL" maxlength="50" data-err_msg_id="memEmail" 
                            		value="<c:out value="${memberInfo.MEM_MST_MAIL }"/>"/> 
                            <p class="message" id="memEmail"></p>
		                </div>
		            </li>
		            <li class="tel">
		                <div class="tit">
		                    <label for="MEM_MST_TEL">일반전화<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <label for="MEM_MST_TEL1" class="sel_box_st0">
		                        <select id="MEM_MST_TEL1" name="MEM_MST_TEL1" class="select" title="일반전화 앞자리" data-err_msg_id="memTel1">
		                            <option value="">선택</option>
	                                <c:if test="${not empty codes.TEL_CODE }">
		                                <c:forEach var="mngTelRow" items="${codes.TEL_CODE }" varStatus="i">
		                                    <option value="<c:out value="${mngTelRow.CMN_COM_NM }"/>" <c:if test="${mngTelRow.CMN_COM_NM eq memberInfo.MEM_MST_TEL1 }">selected="selected"</c:if>><c:out value="${mngTelRow.CMN_COM_NM }"/></option>
		                                </c:forEach>
	                                </c:if>
		                        </select>
		                    </label> -
		                    <input type="text" class="text number" name="MEM_MST_TEL2" id="MEM_MST_TEL2" maxlength="4" 
                            		title="일반전화 중간자리" data-err_msg_id="memTel2" value="<c:out value="${memberInfo.MEM_MST_TEL2 }"/>" /> -
                            <input type="text" class="text number" name="MEM_MST_TEL3" id="MEM_MST_TEL3" maxlength="4" 
                            		title="일반전화 끝자리" data-err_msg_id="memTel3" value="<c:out value="${memberInfo.MEM_MST_TEL3 }"/>"/>
                            <p class="message" id="memTel1"></p>
                            <p class="message" id="memTel2"></p>
                            <p class="message" id="memTel3"></p>
		                </div>
		            </li>
		            <li class="tel">
		                <div class="tit">
		                    <label for="MEM_MST_HP">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <label for="phone" class="sel_box_st0">
		                        <select class="select" id="MEM_MST_HP1" name="MEM_MST_HP1" title="휴대폰 번호 앞자리" data-err_msg_id="memHp1">
		                            <option value="">선택</option>
	                                <c:if test="${not empty codes.HP_CODE }">
	                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
	                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${hpRow.CMN_COM_NM eq memberInfo.MEM_MST_HP1 }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }"/></option>
	                                    </c:forEach>
	                                </c:if>
		                        </select>
		                    </label> -
		                    <input type="text" class="text number" name="MEM_MST_HP2" id="MEM_MST_HP2" maxlength="4" 
                            		title="휴대폰 번호 중간자리" data-err_msg_id="memHp2" value="<c:out value="${memberInfo.MEM_MST_HP2 }"/>" /> -
                            <input type="text" class="text number" name="MEM_MST_HP3" id="MEM_MST_HP3" maxlength="4" 
                            		title="휴대폰 번호 끝자리" data-err_msg_id="memHp3" value="<c:out value="${memberInfo.MEM_MST_HP3 }"/>"/>
                            <p class="message" id="memHp1"></p>
                            <p class="message" id="memHp2"></p>
                            <p class="message" id="memHp3"></p>
		                </div>
		            </li>
		            <li class="receive">
		                <div class="tit">
		                    <label for="MEM_AGR_TRM_YN">정보수신</label>
		                </div>
		                <div class="field">
		                    <ul class="ct">
		                        <li>
		                            <input type="checkbox" id="TRM_YN0001" name="TRM_YN0001" value="Y" class="checkbox"
		                                		<c:if test="${memberInfo.SMS_YN eq 'Y' }">checked="checked"</c:if> />
		                            <label for="TRM_YN0001">SMS수신</label>
		                        </li>
		                        <li>
		                            <input type="checkbox" id="TRM_YN0004" name="TRM_YN0004" value="Y" class="checkbox"
		                                		<c:if test="${memberInfo.EMAIL_YN eq 'Y' }">checked="checked"</c:if> />
		                            <label for="TRM_YN0004">이메일 수신</label>
		                        </li>
		                        <li>
		                            <input type="checkbox" id="TRM_YN0003" name="TRM_YN0003" value="Y" class="checkbox"
		                                		<c:if test="${memberInfo.DM_YN eq 'Y' }">checked="checked"</c:if> />
		                            <label for="TRM_YN0003">DM(우편) 수신</label>
		                        </li>
		                        <li>
		                            <input type="checkbox" id="TRM_YN0002" name="TRM_YN0002" value="Y" class="checkbox"
		                                		<c:if test="${memberInfo.TM_YN eq 'Y' }">checked="checked"</c:if> />
		                            <label for="TRM_YN0002">TM(전화) 수신</label>
		                        </li>
		                    </ul>
		                    <p class="warning gray mt10">
	                        	이벤트 및 다양한 정보를 받으실 수 있습니다.
		                    </p>
		                    <p class="warning gray">
	                        	수신 동의와 상관없이 비밀번호 찾기, 주문/배송 관련 SMS/메일은 발송 됩니다.
		                    </p>
		                </div>
		            </li>
		            <li>
		                <div class="tit">추천인 ID</div>
		                <div class="field">
		                    <strong><c:out value="${memberInfo.MEM_MST_RCM_ID }"/></strong>
		                </div>
		            </li>
		        </ul><!-- // form-a -->
		    </form>
	        
	        <div class="section-button"><!-- section-button -->
	            <a href="javascript:goModify();" class="button warning _pg_link"><span>수정</span></a>
	            <a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain }"/>/mobile/mypage/myPageMain.do','_self');" class="button primary _pg_link"><span>취소</span></a>
	        </div><!-- // section-button -->
	           
	        <%@ include file="/WEB-INF/jsp/mobile/common/zipcode/zipcodeLayer.jsp" %>    
	    </article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->
	
	<form id="changeFrm" name="changeFrm">
		<input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
	</form>

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
            MEM_CPR_CEO_NM:{required:true},	// 대표자명 
        	MEM_CPR_ZIP_CDE5:{required:true, number:true}, // 우편번호
        	MEM_CPR_DRO_ADR1:{required:true}, // 도로명 본주소
        	MEM_CPR_JBN_ADR1:{required:true}, // 지번 본주소
        	MEM_CPR_ADR2:{required:true},  // 상세주소
        	MEM_MST_MEM_NM:{required:true},	// 담당자 이름
        	MEM_MST_MAIL:{required:true, email:true},	// 이메일
            MEM_MST_TEL1:{required:true},	// 일반전화 앞자리
            MEM_MST_TEL2:{required:true, number:true , minlength:3 , maxlength:4}, // 일반전화 중간자리
            MEM_MST_TEL3:{required:true, number:true , minlength:4 , maxlength:4}, // 일반전화 뒷자리
            MEM_MST_HP1:{required:true},	// 핸드폰번호 앞자리
            MEM_MST_HP2:{required:true, number:true , minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
        	MEM_MST_HP3:{required:true, number:true , minlength:4 , maxlength:4} // 핸드폰번호 뒷자리
        },
        messages :
        {
        	MEM_CPR_CEO_NM: {required:"[대표자명]은 필수 정보입니다."},
        	MEM_CPR_ZIP_CDE5: {required:"[우편번호]는 필수 정보입니다."},
        	MEM_CPR_DRO_ADR1: {required:"[도로명]본 주소는 필수 정보입니다."},
        	MEM_CPR_JBN_ADR1: {required:"[지번]본 주소는 필수 정보입니다."},
        	MEM_CPR_ADR2: {required:"상세 주소는 필수 정보입니다."},
        	MEM_MST_MEM_NM: {required:"[담당자 이름]은 필수 정보입니다."},
        	MEM_MST_MAIL : {required:"[이메일]은 필수 정보입니다."},
        	MEM_MST_TEL1: {required:"[일반전화 앞자리]는 필수 정보입니다."},
        	MEM_MST_TEL2: {required:"[일반전화 중간자리]는 필수 정보입니다.",minlength:"[일반전화 중간자리]는 최소 3글자 이상입니다." , maxlength:"[일반전화 중간자리]는 최대 4글자입니다."},
        	MEM_MST_TEL3: {required:"[일반전화 뒷자리]는 필수 정보입니다." ,minlength:"[일반전화 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[일반전화 뒷자리]는 최대 4글자입니다."},
        	MEM_MST_HP1: {required:"[휴대폰번호 앞자리]는 필수 정보입니다."},
        	MEM_MST_HP2: {required:"[휴대폰번호 중간자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[휴대폰번호 중간자리]는 최대 4글자입니다."},
        	MEM_MST_HP3: {required:"[휴대폰번호 뒷자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[휴대폰번호 뒷자리]는 최대 4글자입니다." }
        }
    });
 	
 	// 우편번호 callback 함수
	zipcodeCallback = function (zip,doroAddr,jibunAddr)
	{
		$('#MEM_CPR_ZIP_CDE5').val(zip);
		$('#MEM_CPR_DRO_ADR1').val(doroAddr);
		$('#MEM_CPR_JBN_ADR1').val(jibunAddr);
		$('#zip').html("");
		$('#doro').html("");
		$('#jibun').html("");
	};
		
 	// 등록 버튼 클릭 이벤트
    goModify = function () {
 		
 		if($frm.valid()){
      		if (confirm( "저장 하시겠습니까?")) {
          			//com.laypop('show');//팝업 show
  	                $frm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/mypage/myCompInfoModify.do", "target":"_self", "method":"post"}).submit();
            }           		
 		}
    };
    
 	// 비밀번호 변경 버튼 클릭 이벤트
	changePwd = function(){
		$("#changeFrm").attr({"action":"<c:out value="${mobileSslDomain }"/>/mobile/mypage/changePwd.do", "target":"_self", "method":"post"}).submit();
	};
});
//]]>
</script>
</body>
</html>