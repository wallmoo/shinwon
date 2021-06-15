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
	            
	            <c:if test="${(memberInfo.MEM_MST_MEM_GBN == Code.COMMON_PRI_MEMBER_GRADE || memberInfo.MEM_MST_MEM_GBN == Code.MEMBER_TYPE_SIMPLE) && memberInfo.MEM_MST_JOI_RTE == Code.JOIN_TYPE_ONLINE}">
		            <div class="frame-b mt15">
		                <ul class="list list-b">
		                    <li>마켓플랜트는 통합 회원 전환 서비스를 진행하고 있습니다.</li>
		                    <li>통합회원은 하나의 ID로 온라인, 오프라인 서비스를 이용하실 수 있습니다.</li>
		                </ul>
		
		                <div class="section-button"><!-- section-button -->
		                    <div class="ui-grid-a">
		                        <div class="ui-block-a">
		                             <a href="<c:out value="${mobileDomain }"/>/mobile/event/memberBenefit.do" class="button primary full _pg_link" target="_self"><span>통합회원 혜택보기</span></a>
		                        </div>
		                        <div class="ui-block-b">
		                            <a href="javascript:goChange();" class="button warning full _pg_link" target="_self"><span>통합회원으로 전환하기</span></a>
		                        </div>
		                    </div>
		                </div><!-- // section-button -->
		            </div>
	            </c:if>
	        </div>
	        
	        <div class="ct title-my-info first-child">
	            <h3 class="fl"><span class="large">기본정보</span></h3>
	            <p class="fr small">
	                <span class="essential"><em class="blind">필수입력</em></span> 는 필수 입력사항 입니다.
	            </p>
	        </div>
	
			<form id="frm" name="frm" method="post"> 
               	<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
				<input type="hidden" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" value="<c:out value="${memberInfo.MEM_MST_MEM_NM }"/>"/>
				<input type="hidden" name="MEM_MST_MEM_GBN" id="MEM_MST_MEM_GBN" value="<c:out value="${memberInfo.MEM_MST_MEM_GBN }"/>"/>
				<input type="hidden" name="MEM_MST_REG_DT" id="MEM_MST_REG_DT" value="<c:out value="${memberInfo.MEM_MST_REG_DT }"/>"/>
				<input type="hidden" name="MEM_MST_RCM_ID" id="MEM_MST_RCM_ID" value="<c:out value="${memberInfo.MEM_MST_RCM_ID }"/>"/>
				<input type="hidden" name="MEM_MST_OCB_NO" id="MEM_MST_OCB_NO" value="<c:out value="${memberInfo.MEM_MST_OCB_NO }"/>"/>
				<input type="hidden" name="TRM_YN0005" id="TRM_YN0005" value="<c:out value="${memberInfo.SK_YN }"/>"/>
				<input type="hidden" name="TRM_YN0006" id="TRM_YN0006" value="<c:out value="${memberInfo.S_CARD_YN }"/>"/>
				<input type="hidden" name="TRM_YN0007" id="TRM_YN0007" value="<c:out value="${memberInfo.S_ELEC_YN }"/>"/>
				<input type="hidden" name="TRM_YN0008" id="TRM_YN0008" value="<c:out value="${memberInfo.LG_YN }"/>"/>
				<input type="hidden" name="MEM_MST_JOI_RTE" id="MEM_MST_JOI_RTE" value="<c:out value="${summaryMap.MEM_MST_JOI_RTE }"/>"/>
				<input type="hidden" name="MEM_MST_ERP_ID" id="MEM_MST_ERP_ID" value="<c:out value="${summaryMap.MEM_MST_ERP_ID }"/>"/>
				<input type="hidden" name="MEM_MST_ERP_YN" id="MEM_MST_ERP_YN" value="<c:out value="${summaryMap.MEM_MST_ERP_YN }"/>"/>
				<c:if test="${memberInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE}">
					<input type="hidden" name="MEM_MST_MAIL" id="simpleMail" value="${memberInfo.MEM_MST_MAIL }"/>
				</c:if>
				<input type="hidden" name="MEM_MST_ENC_PW" id="MEM_MST_ENC_PW" />
		        <ul class="form-a form-my-info"><!-- form-a -->
		            <li>
		                <div class="tit">이름</div>
		                <div class="field">
		                    <strong>
		                    	<c:out value="${memberInfo.MEM_MST_MEM_NM }"/>
		                    	<c:if test="${memberInfo.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE && not empty memberInfo.MEM_IPN_SEX }">
									(<c:out value="${memberInfo.MEM_IPN_SEX eq 'M' ? '남자':'여자'}"/>)											
								</c:if>
								<c:if test="${memberInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE && not empty memberInfo.MEM_MST_SEX }">
									(<c:out value="${memberInfo.MEM_MST_SEX eq 'M' ? '남자':'여자'}"/>)											
								</c:if>
		                    </strong>
		                </div>
		            </li>
		            <li>
		                <div class="tit">아이디</div>
		                <div class="field">
		                    <strong><c:out value="${memberInfo.MEM_MST_MEM_ID }"/></strong>
		                </div>
		            </li>
		            <c:if test="${memberInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE}">
			            <li>
			                <div class="tit">이메일<span class="essential"><em class="blind">필수입력</em></span></div>
			                <div class="field">
			                    <strong id="simpleMemMail"><c:out value="${memberInfo.MEM_MST_MAIL }"/></strong>
			                    <p class="desc">
			                        <input type="checkbox" id="changeMailYn" name="changeMailYn" value="Y" class="checkbox"/>
			                        <label for="changeMailYn">이메일  변경 신청</label>
			                        <a href="javascript:$.com.util.layPop('open', $('#mailGuide'));" class="guide"><span class="blind">이메일 변경신청 안내</span></a>
			                    </p>
			                </div>
			            </li>
			            <li class="certification change-mail" style="display:none;">
			            	<input type="hidden" name="emailCheck" id="emailCheck"/>
							<input type="hidden" name="emailCheckYn" id="emailCheckYn"/>
			                <div class="tit">
			                    <label for="MEM_CTF_MAIL">변경할 이메일<br />주소</label>
			                </div>
			                <div class="field">
			                    <input type="text" id="MEM_CTF_MAIL" name="MEM_CTF_MAIL" class="text" maxlength="50" 
	                                  		data-err_msg_id="ctfMail" onkeydown="javascript:deleteCheckMsg();"/>
			                    <a href="javascript:mailCertify();" class="button small"><span>인증번호 받기</span></a>
			                    <p class="message" id="ctfMail"></p>
			                </div>
			            </li>
			            <li class="certification change-number" style="display:none;">
			                <div class="tit">
			                    <label for="MEM_CTF_NO">인증번호</label>
			                </div>
			                <div class="field">
			                    <input type="text" id="MEM_CTF_NO" name="MEM_CTF_NO" class="text" maxlength="10" data-err_msg_id="ctfNo"/>
			                    <a href="javascript:goCert();" class="button small"><span>인증 확인</span></a>
			                    <p class="warning">
			                        <span class="warning">인증번호 유효기간은 4시간입니다.</span>
			                    </p>
			                    <p class="message" id="ctfNo"></p>
			                </div>
			            </li>
		            </c:if>
		            <c:if test="${memberInfo.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
			            <li>
			                <div class="tit">
			                    <label for="mail">이메일<span class="essential"><em class="blind">필수입력</em></span></label>
			                </div>
			                <div class="field">
			                    <input type="text" id="email" name="MEM_MST_MAIL" id="MEM_MST_MAIL" value="<c:out value="${memberInfo.MEM_MST_MAIL }"/>" 
		                            		class="text" maxlength="50" data-err_msg_id="memEmail"/>
		                        <p class="message" id="memEmail"></p>
			                </div>
			            </li>
		            </c:if>
		            <li class="tel">
		                <div class="tit">
		                    <label for="tel">전화번호</label>
		                </div>
		                <div class="field">
		                    <label for="MEM_MST_TEL1" class="sel_box_st0">
		                        <select id="MEM_MST_TEL1" name="MEM_MST_TEL1" class="select"  title="전화번호 앞자리">
		                            <option value="">선택</option>
	                                <c:if test="${not empty codes.TEL_CODE }">
		                                <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
		                                    <option value="<c:out value="${telRow.CMN_COM_NM }"/>" 
		                                    		<c:if test="${telRow.CMN_COM_NM eq memberInfo.MEM_MST_TEL1 }">selected="selected"</c:if>>
		                                    	<c:out value="${telRow.CMN_COM_NM }"/>
		                                    </option>
		                                </c:forEach>
	                                </c:if>
		                        </select>
		                    </label> -
		                    <input type="text" class="text number" name="MEM_MST_TEL2" id="MEM_MST_TEL2" 
		                            		value="<c:out value="${memberInfo.MEM_MST_TEL2 }"/>" maxlength="4" title="전화번호 중간자리" /> -
		                    <input type="text" class="text number" name="MEM_MST_TEL3" id="MEM_MST_TEL3" 
		                            		value="<c:out value="${memberInfo.MEM_MST_TEL3 }"/>" maxlength="4" title="전화번호 끝자리" />
		                </div>
		            </li>
		            <li class="tel">
		                <div class="tit">
		                    <label for="phone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <label for="MEM_MST_HP1" class="sel_box_st0" >
		                        <select id="MEM_MST_HP1" name="MEM_MST_HP1" class="select" title="휴대폰 번호 앞자리" data-err_msg_id="memHp1">
		                            <option value="">선택</option>
	                                <c:if test="${not empty codes.HP_CODE }">
	                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
	                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" 
	                                        		<c:if test="${hpRow.CMN_COM_NM eq memberInfo.MEM_MST_HP1 }">selected="selected"</c:if>>
	                                        	<c:out value="${hpRow.CMN_COM_NM }"/>
	                                        </option>
	                                    </c:forEach>
	                                </c:if>
		                        </select>
		                    </label> -
		                    <input type="text" class="text number" id="MEM_MST_HP2" name="MEM_MST_HP2" 
		                            		value="<c:out value="${memberInfo.MEM_MST_HP2 }"/>" maxlength="4" title="휴대폰 번호 중간자리" data-err_msg_id="memHp2"/> -
		                    <input type="text" class="text number" id="MEM_MST_HP3" name="MEM_MST_HP3" 
		                            		value="<c:out value="${memberInfo.MEM_MST_HP3 }"/>" maxlength="4" title="휴대폰 번호 끝자리" data-err_msg_id="memHp3"/>
		                    <p class="message" id="memHp1"></p>
                            <p class="message" id="memHp2"></p>
                            <p class="message" id="memHp3"></p>
		                </div>
		            </li>
		            <li class="address">
		                <div class="tit">
		                    <label for="address">주소<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <p class="zip">
		                        <input type="text" id="MEM_MST_ZIP_CDE5" name="MEM_MST_ZIP_CDE5" class="text number" maxlength="5" 
                           				title="우편번호" readonly="readonly" data-err_msg_id="zip" value="<c:out value="${memberInfo.MEM_MST_ZIP_CDE5 }"/>"/>
		                        <a href="javascript:$.com.util.layPop('open', $('#layZipcode'), true)" class="button small"><span>우편번호 찾기</span></a>
		                    </p>
		                    <p class="message" id="zip"></p>
		                    <p>
		                        <input type="text" name="MEM_MST_DRO_ADR1" id="MEM_MST_DRO_ADR1" class="text" title="도로명 주소" placeholder="도로명 주소" 
                                		maxlength="100" readonly="readonly" data-err_msg_id="doro" value="<c:out value="${memberInfo.MEM_MST_DRO_ADR1 }"/>"/>
		                    </p>
		                    <p>
		                        <input type="text" name="MEM_MST_JBN_ADR1" id="MEM_MST_JBN_ADR1" class="text" title="지번 주소" placeholder="지번 주소" 
                                		maxlength="100" readonly="readonly" data-err_msg_id="jibun" value="<c:out value="${memberInfo.MEM_MST_JBN_ADR1 }"/>"/>
		                    </p>
		                    <p>
		                        <input type="text" name="MEM_MST_ADR2" id="MEM_MST_ADR2" class="text" title="상세 주소" placeholder="상세 주소" 
                                		maxlength="100" data-err_msg_id="addrDetail" value="<c:out value="${memberInfo.MEM_MST_DRO_ADR2 }"/>"/>
		                    </p>
		                    <p class="message" id="doro"></p>
                            <p class="message" id="jibun"></p>
                            <p class="message" id="addrDetail"></p>
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
		        </ul><!-- // form-a -->
		    </form>
	        
	        <c:if test="${memberInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE}">
		        <section id="mailGuide" data-role="popup" data-overlay-theme="a" class="popup_st0 no_title"><!-- #mailGuide -->
		            <div class="ui-content">
		                <h4>이메일 변경 신청</h4>
		                <a href="javascript:$.com.util.layPop('close', $('#mailGuide'));" class="btn_close"><span class="blind">팝업 닫기</span></a>
		                <ul class="list list-a mt10">
		                    <li>선택시 이메일 변경 가능</li>
		                    <li>해제시 이메일 변경 취소</li>
		                </ul>
		            </div>
        		</section><!--// #mailGuide -->
        	</c:if>
        
	        <div class="ct title-my-info">
	            <h3 class="fl"><span class="large">선택정보</span></h3>
	        </div>
	
	        <ul class="form-a form-my-info"><!-- form-a -->
	            <li>
	                <div class="tit">추천인 ID</div>
	                <div class="field">
	                    <strong><c:out value="${memberInfo.MEM_MST_RCM_ID }"/></strong>
	                </div>
	            </li>
	        </ul><!-- // form-a -->
        
	        <div class="section-button"><!-- section-button -->
	            <a href="javascript:goModify();" class="button warning _pg_link"><span>수정</span></a>
	            <c:choose>
                   	<c:when test="${memberInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE}">
                   		<a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain }"/>/mobile/mypage/myPageMain.do','_self');" id="goCancel" class="button primary _pg_link"><span>취소</span></a>
                   	</c:when>
                   	<c:otherwise>
                   		<a href="javascript:callJavascriptLoginUrl('<c:out value="${mobileDomain }"/>/mobile/mypage/myPageMain.do','_self');" class="button primary _pg_link"><span>취소</span></a>
                   	</c:otherwise>
                </c:choose>
	        </div><!-- // section-button -->
	        
	        <%@ include file="/WEB-INF/jsp/mobile/common/zipcode/zipcodeLayer.jsp" %>
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->
	
	<form id="changeFrm" name="changeFrm">
		<input type="hidden" name="gubun" id="gubun" value="ONLINE<c:out value="${memberInfo.MEM_MST_MEM_GBN }"/>"/>
		<input type="hidden" name="type" id="type" value="m."/>
		<input type="hidden" name="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
	</form>

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script>
	$.com.win_scrollList = true;//스크롤 할거야~
	function _return_scrollList(_idx, _reNum){
	    /*
	        _idx = 리스트감싸고있는 객체
	        _reNum = 리턴 몇번째넘어왔는지
	    */
	    
	    if(_reNum <= 2){
	        var _list_html = _idx.html();
	        //리스트 추가!
	        _idx.append('<li style="float: left;background-color: #f00;color: #fff;text-align: center;width: 100%;padding: 10px 0;font-weight: bold;">'+_reNum+'</li>'+_list_html); 
	        //console.log('_reNum = '+_reNum);
	    }else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
	}
</script>
<script type="text/javascript">
//<![CDATA[
	$(function(){
		var $frm = $("#frm");
	
		// 폼체크
	    $frm.validate(
	    {
	        rules: 
	        {
	            MEM_MST_MAIL:{required:true, email:true},	// 이메일
	            MEM_MST_HP1:{required:true},	// 핸드폰번호 앞자리
	            MEM_MST_HP2:{required:true, number:true, minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
	        	MEM_MST_HP3:{required:true, number:true, minlength:4 , maxlength:4}, // 핸드폰번호 뒷자리
	        	MEM_MST_ZIP_CDE5:{required:true, number:true}, // 우편번호
	        	MEM_MST_DRO_ADR1:{required:true}, // 도로명 본주소
	        	MEM_MST_JBN_ADR1:{required:true}, // 지번 본주소
	        	MEM_MST_ADR2:{required:true}  // 상세주소
	        },
	        messages :
	        {
	        	MEM_MST_MAIL : {required:"[이메일]은 필수 정보입니다.", email:"이메일을 올바르게 입력해 주십시오."},
	        	MEM_MST_HP1: {required:"[휴대폰번호 앞자리]는 필수 정보입니다."},
	        	MEM_MST_HP2: {required:"[휴대폰번호 중간자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[휴대폰번호 중간자리]는 최대 4글자입니다."},
	        	MEM_MST_HP3: {required:"[휴대폰번호 뒷자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[휴대폰번호 뒷자리]는 최대 4글자입니다."},
	        	MEM_MST_ZIP_CDE5: {required:"[우편번호]는 필수 정보입니다."},
	        	MEM_MST_DRO_ADR1: {required:"[도로명 주소]는 필수 정보입니다."},
	        	MEM_MST_JBN_ADR1: {required:"[지번 주소]는 필수 정보입니다."},
	        	MEM_MST_ADR2: {required:"[상세 주소]는 필수 정보입니다."}
	        }
	    });
		
	 	// 우편번호 callback 함수
		zipcodeCallback = function (zip,doroAddr,jibunAddr)
		{
			$('#MEM_MST_ZIP_CDE5').val(zip);
			$('#MEM_MST_DRO_ADR1').val(doroAddr);
			$('#MEM_MST_JBN_ADR1').val(jibunAddr);
			$('#zip').html("");
			$('#doro').html("");
			$('#jibun').html("");
			$('#MEM_MST_ADR2').val("");
		};
			
	 	// 수정 버튼 클릭 이벤트
	    goModify = function () {
			if($frm.valid()){
       			if (confirm( "저장 하시겠습니까?")) {
           			//com.laypop('show');//팝업 show
   	                $frm.attr({"action":"<c:out value="${mobileSslDomain}" />/mobile/mypage/myInfoModify.do", "target":"_self", "method":"post"}).submit();
                }           			
			}
		};
	    
	    // 인증메일관련 체크 메세지 초기화
	    deleteCheckMsg = function(){
	    	$("#ctfMail").html("");
	    };
	    
	    // 간편회원의 경우, 이메일 주소 변경 클릭 이벤트
	    $(document).on("change","input[name='changeMailYn']",function(){
	
	    	var $this = $(this);
	        
	    	if($this.is(":checked")){
	    		$this.prop('checked', true).parent().addClass('on');
	    		$(".certification").css("display","block");
	    	}
	    	else{
	    		$this.prop('checked', false).parent().removeClass('on');
	    		$(".certification").css("display","none");
	    		
	    		if($("#emailCheckYn").val() == "Y"){
	    			$.ajax({
		               async : false,
		               type : "POST",
		               data : {"MEM_CTF_MAIL":$("#MEM_CTF_MAIL").val()},
		               url : "<c:out value="${mobileSslDomain}" />/mobile/mypage/deleteCtfEmailAjax.do",
		               success : function (data) {
		                   if(data.successYn == "Y")
		                   {
		                		$("#MEM_CTF_MAIL").val("");
		                		$("#ctfMail").html("");
		                		$("#emailCheckYn").val("");
		                		$("#MEM_CTF_NO").val("");
		                		$("#ctfNo").html("");
		                   }
		               },
		               error : function () {
		                   alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
		               }
		           });
	    		}
	    		else{
	    			$("#MEM_CTF_MAIL").val("");
	        		$("#ctfMail").html("");
	        		$("#MEM_CTF_NO").val("");
	        		$("#ctfNo").html("");
	    		}
	    	}
	    	
	    });
	    
	 	// 인증번호 받기 클릭 이벤트
	    mailCertify = function(){
	 		
	    	var pattern = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	 		var value = $.trim($("#MEM_CTF_MAIL").val());
	    	
	 		if(value == ""){
	 			$("#ctfMail").html("[이메일]은 필수 정보입니다.");
				$("#MEM_CTF_MAIL").focus();
				return;
	 		}
	 		
	 		if(!pattern.test(value)){
	 			$("#ctfMail").html("[이메일]형식에 맞지 않습니다.");
	 			$("#MEM_CTF_MAIL").focus();
	            return;
	 		}
	 		
			$("#emailCheck").val(value);	// 인증번호 받은 이메일
			
			$.ajax({
	           async : false,
	           type : "POST",
	           data : {"MEM_CTF_MAIL":value,"MEM_MST_MEM_GBN":"${memberInfo.MEM_MST_MEM_GBN}","MEM_MST_MEM_NM":"${memberInfo.MEM_MST_MEM_NM}"},
	           url : "<c:out value="${mobileSslDomain}" />/mobile/mypage/checkCtfEmailAjax.do",
	           success : function (data) {
	               
	        	   $("#ctfNo").html("");
	        	   
	        	   if(data.successYn == "Y")
	               {
	                   if(data.resultYn == "Y"){
	              	   	   $("#ctfMail").html("인증번호가 발송되었습니다.");
	              	   	   $("#MEM_CTF_NO").focus();
	                   }
	                   else{
	                	   $("#ctfMail").html("이미 사용중인 이메일입니다.");
	                	   $("#MEM_CTF_MAIL").focus();
	                   }
	                   
	                   $("#emailCheckYn").val(data.resultYn);
	                   return;
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
		};
		
		// 인증번호 확인 클릭 이벤트
		goCert = function(){
	
			var pattern = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	 		var value = $.trim($("#MEM_CTF_MAIL").val());
	    	
			if(value == ""){
	 			$("#ctfMail").html("[이메일]은 필수 정보입니다.");
				$("#MEM_CTF_MAIL").focus();
				return;
	 		}
	 		
	 		if(!pattern.test(value)){
	 			$("#ctfMail").html("[이메일]형식에 맞지 않습니다.");
	 			$("#MEM_CTF_MAIL").focus();
	            return;
	 		}
			
// 			var $chkObj = $("#emailCheckYn");
	        //var $obj = $("#emailCheck");
// 	        if($chkObj.val() == "Y")	// 중복체크 성공
// 	        {
	        	$("#ctfMail").html("");
	        	
	        	if($("#MEM_CTF_NO").val() == ""){
					$("#ctfNo").html("[인증번호]는 필수 정보입니다.");
					$("#MEM_CTF_NO").focus();
					return;
				}
	        	
// 	        	if($("#emailCheck").val() == value){		// 1. 중복체크 값과 email필드 값이 같은 경우
	        		
	        		$.ajax({
		                async : false,
		                type : "POST",
		                data : {"MEM_CTF_NO":$("#MEM_CTF_NO").val(),"MEM_CTF_MAIL":value},
		                url : "<c:out value="${mobileSslDomain}" />/mobile/mypage/checkCtfNoAjax.do",
		                success : function (data) {
		                    
		                	if(data.resultYn == "Y"){
		                    	updateMemMail();
		                    }
		                	else if(data.resultYn == "O"){
		                		$("#ctfNo").html("인증 유효기간이 지났습니다.\n인증번호를 다시 발급받으시길바랍니다.");
    	                    	return;
    	                    }
    	                    else if(data.resultYn == "N"){
    	                    	$("#ctfNo").html("이메일 인증번호을 발급받으셔야 합니다.\n인증번호 받기를 눌러주세요.");
    	 	            		$("#MEM_CTF_MAIL").focus();
    	 	                    return;
    	                    }
    	                    else
    	                    {
    	                    	$("#ctfNo").html("인증번호가 틀렸습니다.\n다시 확인 하신 후 입력바랍니다.");
								$("#MEM_CTF_NO").focus();
								return;
    	                    }
		                },
		                error : function () {
		                    alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
		                }
		            });
// 	        	}   
// 	        	else{
// 	        		$("#ctfMail").html("인증한 이메일과 입력하신 이메일이 일치하지않습니다.");
// 	        		$("#MEM_CTF_MAIL").focus();
// 	                return;
// 	        	}
// 	        }
// 	        else
// 	        {
// 	        	$("#ctfMail").html("인증번호를 발급받아주시기 바랍니다.");
// 	            return;
// 	        }
		};
		
		// 본인인증 완료 후 이메일 update
		updateMemMail = function(){
			
			$.ajax({
	           async : false,
	           type : "POST",
	           data : {"MEM_CTF_MAIL":$("#MEM_CTF_MAIL").val(),"MEM_MST_MEM_ID":"${memberInfo.MEM_MST_MEM_ID}","MEM_MST_MEM_GBN":"${memberInfo.MEM_MST_MEM_GBN}"},
	           url : "<c:out value="${mobileSslDomain}" />/mobile/mypage/updateMemEmailAjax.do",
	           success : function (data) {
	               if(data.successYn == "Y")
	               {
	            	    $("#simpleMail").val($("#MEM_CTF_MAIL").val());
						$("#simpleMemMail").html($("#MEM_CTF_MAIL").val());
						$("#changeMailYn").prop('checked', false).parent().removeClass('on');
						$(".certification").css("display","none");
						$("#emailCheckYn").val("");
						$("#MEM_CTF_MAIL").val("");
						$("#ctfMail").html("");
						$("#MEM_CTF_NO").val("");
						$("#ctfNo").html("");
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
		};
		
		// 통합회원 전환하기 버튼 클릭 이벤트
		goChange = function(){
			$("#changeFrm").attr({"action":"<c:out value="${mobileSslDomain }"/>/mobile/manager/changeOnlineMemCert.do", "target":"_self", "method":"post"}).submit();
		};
		
		// 비밀번호 변경 버튼 클릭 이벤트
		changePwd = function(){
			$("#changeFrm").attr({"action":"<c:out value="${mobileSslDomain }"/>/mobile/mypage/changePwd.do", "target":"_self", "method":"post"}).submit();
		};
		
		// 간편회원의 취소 경우		
		$("#goCancel").on("click",function(){
			if($("#emailCheckYn").val() == "Y"){
    			$.ajax({
   	               async : false,
   	               type : "POST",
   	               data : {"MEM_CTF_MAIL":$("#MEM_CTF_MAIL").val()},
   	               url : "<c:out value="${mobileSslDomain}" />/mobile/mypage/deleteCtfEmailAjax.do",
   	               success : function (data) {
   	                   
   	               },
   	               error : function () {
   	                   alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
   	               }
   	           });
    		}	
		});
		
	});
//]]>
</script>
</body>
</html>