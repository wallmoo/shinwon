<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<script>
window.history.forward(); 
</script>

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
	                        <c:if test="${(memberInfo.MEM_MST_MEM_GBN == Code.COMMON_PRI_MEMBER_GRADE || memberInfo.MEM_MST_MEM_GBN == Code.MEMBER_TYPE_SIMPLE) && memberInfo.MEM_MST_JOI_RTE == Code.JOIN_TYPE_ONLINE}">
								<ul class="list list-c small">
		                            <li>마켓플랜트는 통합 회원 전환 서비스를 진행하고 있습니다.</li>
		                            <li>통합회원은 하나의 ID로 온라인, 오프라인 서비스를 이용하실 수 있습니다.</li>
		                        </ul>
		                        <div class="action">
		                            <a href="<c:out value="${frontDomain }"/>/pc/event/memberBenefit.do" class="btn_st2 btn_blk large"><span>통합회원 혜택보기</span></a>
		                            <a href="javascript:goChange();" class="btn_st2 btn_rd large"><span>통합회원으로 전환하기</span></a>
		                        </div>	                        
	                        </c:if>
	                    </div>
	                </div><!-- // my-info-guide -->
	
	                <div class="my-info-tab"><!-- my-info-tab -->
	                    <h4 class="title">
	                        기본정보
	                        <span class="guide">(<span class="essential warning"><em class="blind">필수입력 표시된 항목은 </em></span>
	                            필수 입력사항 입니다.)
	                        </span>
	                    </h4>
	
	                    <ul class="tab-a item-2"><!-- tab-a -->
	                        <li class="active"><a href="javascript:;"><span>기본정보</span></a><span class="blind">현재위치</span></li>
	                        <li><a href="<c:out value="${serverSslDomain }"/>/pc/mypage/changePwd.do"><span>비밀번호 변경</span></a></li>
	                    </ul><!-- // tab-a -->
	                </div><!-- // my-info-tab -->
	                
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
		                <double-submit:preventer/>
	                            
		                <table class="table-a table-form mt0"><!-- table-a -->
		                <caption>이름, 아이디, 이메일, 전화번호, 휴대폰 번호, 주소, 정보수신으로 구성된 회원정보수정 기본정보 입력 테이블입니다.</caption>
		                <colgroup>
		                    <col style="width: 170px;" />
		                    <col style="width: auto;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="row">이름</th>
		                        <td>
		                        	<c:out value="${memberInfo.MEM_MST_MEM_NM }"/>
		                        	<c:if test="${memberInfo.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE && not empty memberInfo.MEM_IPN_SEX }">
										(<c:out value="${memberInfo.MEM_IPN_SEX eq 'M' ? '남자':'여자'}"/>)											
									</c:if>
									<c:if test="${memberInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE && not empty memberInfo.MEM_MST_SEX }">
										(<c:out value="${memberInfo.MEM_MST_SEX eq 'M' ? '남자':'여자'}"/>)											
									</c:if>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row">아이디</th>
		                        <td><c:out value="${memberInfo.MEM_MST_MEM_ID }"/></td>
		                    </tr>
		                    <c:if test="${memberInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE}">
			                    <tr>
			                        <th scope="row">이메일<span class="essential"><em class="blind">필수입력</em></span></th>
			                        <td>
			                            <span id="simpleMemMail"><c:out value="${memberInfo.MEM_MST_MAIL }"/></span>
			                            &nbsp;&nbsp;&nbsp;&nbsp;
			                            <label for="changeMailYn" class="js-checkbox-b" id="changeMailToggle">
			                                <input type="checkbox" id="changeMailYn" name="changeMailYn" value="Y" />
	                                		이메일 변경 신청
			                            </label>
			                            <div class="mail-change" style="display:none;"><!-- mail-change -->
			                            	<input type="hidden" name="emailCheck" id="emailCheck"/>
											<input type="hidden" name="emailCheckYn" id="emailCheckYn"/>
			                                <p>
			                                    <label for="mail">변경할 이메일 주소</label>
			                                    <input type="text" id="MEM_CTF_MAIL" name="MEM_CTF_MAIL" class="text" maxlength="50" 
			                                    		data-err_msg_id="ctfMail" onkeydown="javascript:deleteCheckMsg();"/>
			                                    <a href="javascript:mailCertify();" class="btn_st0 btn_white small"><span>인증번호 받기</span></a>
			                                </p>
			                                <p class="message" id="ctfMail"></p>
			                                <p id="certNo">
			                                    <label for="code">인증번호</label>
			                                    <input type="text" id="MEM_CTF_NO" name="MEM_CTF_NO" class="text" maxlength="10" data-err_msg_id="ctfNo"/>
			                                    <a href="javascript:goCert();" class="btn_st0 btn_white small"><span>인증 확인</span></a>
			                                </p>
			                                <p class="dotum desc">
	                                			! 인증번호 유효기간은 4시간입니다. 
	                            			</p>
			                                <p class="message" id="ctfNo"></p>
			                            </div><!-- // mail-change -->
			                        </td>
			                    </tr>
		                    </c:if>
		                    <c:if test="${memberInfo.MEM_MST_MEM_GBN eq Code.COMMON_PRI_MEMBER_GRADE }">
			                    <tr>
			                        <th scope="row"><label for="email">이메일<span class="essential"><em class="blind">필수입력</em></span></label></th>
			                        <td>
			                            <input type="text" id="email" name="MEM_MST_MAIL" id="MEM_MST_MAIL" value="<c:out value="${memberInfo.MEM_MST_MAIL }"/>" 
			                            		class="text large" maxlength="50" data-err_msg_id="memEmail"/>
			                            <p class="message" id="memEmail"></p> 
			                        </td>
			                    </tr>
		                    </c:if>
		                    <tr>
		                        <th scope="row"><label for="tel">전화번호</label></th>
		                        <td>
		                            <select class="sel_chg" id="MEM_MST_TEL1" name="MEM_MST_TEL1" title="전화번호 앞자리">
		                                <option value="">선택</option>
		                                <c:if test="${not empty codes.TEL_CODE }">
			                                <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
			                                    <option value="<c:out value="${telRow.CMN_COM_NM }"/>" 
			                                    		<c:if test="${telRow.CMN_COM_NM eq memberInfo.MEM_MST_TEL1 }">selected="selected"</c:if>>
			                                    	<c:out value="${telRow.CMN_COM_NM }"/>
			                                    </option>
			                                </c:forEach>
		                                </c:if>
		                            </select> -
		                            <input type="text" class="text small number" name="MEM_MST_TEL2" id="MEM_MST_TEL2" 
		                            		value="<c:out value="${memberInfo.MEM_MST_TEL2 }"/>" maxlength="4" title="전화번호 중간자리" /> -
		                            <input type="text" class="text small number" name="MEM_MST_TEL3" id="MEM_MST_TEL3" 
		                            		value="<c:out value="${memberInfo.MEM_MST_TEL3 }"/>" maxlength="4" title="전화번호 끝자리" />
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="phone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                        <td>
		                            <select class="sel_chg" id="MEM_MST_HP1" name="MEM_MST_HP1" title="휴대폰 번호 앞자리" data-err_msg_id="memHp1">
		                                <option value="">선택</option>
		                                <c:if test="${not empty codes.HP_CODE }">
		                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
		                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" 
		                                        		<c:if test="${hpRow.CMN_COM_NM eq memberInfo.MEM_MST_HP1 }">selected="selected"</c:if>>
		                                        	<c:out value="${hpRow.CMN_COM_NM }"/>
		                                        </option>
		                                    </c:forEach>
		                                </c:if>
		                            </select> -
		                            <input type="text" class="text small number" id="MEM_MST_HP2" name="MEM_MST_HP2" 
		                            		value="<c:out value="${memberInfo.MEM_MST_HP2 }"/>" maxlength="4" title="휴대폰 번호 중간자리" data-err_msg_id="memHp2"/> -
		                            <input type="text" class="text small number" id="MEM_MST_HP3" name="MEM_MST_HP3" 
		                            		value="<c:out value="${memberInfo.MEM_MST_HP3 }"/>" maxlength="4" title="휴대폰 번호 끝자리" data-err_msg_id="memHp3"/>
		                            <p class="message" id="memHp1"></p>
		                            <p class="message" id="memHp2"></p>
		                            <p class="message" id="memHp3"></p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="zip1">주소<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                        <td>
		                            <p>
		                                <input type="text" id="MEM_MST_ZIP_CDE5" name="MEM_MST_ZIP_CDE5" class="text small number" maxlength="5" 
		                                		title="우편번호" readonly="readonly" data-err_msg_id="zip" value="<c:out value="${memberInfo.MEM_MST_ZIP_CDE5 }"/>"/>
		                                <a href="javascript:;" id="zipCheck" class="btn_st0 btn_blk777 small" title="새 창 열림"><span>우편번호 찾기</span></a>
		                            </p>
		                            <p class="message" id="zip"></p>
		                            <p>
		                                <input type="text" name="MEM_MST_DRO_ADR1" id="MEM_MST_DRO_ADR1" class="text xlarge" title="도로명 주소" placeholder="도로명 주소" 
		                                		maxlength="100" readonly="readonly" data-err_msg_id="doro" value="<c:out value="${memberInfo.MEM_MST_DRO_ADR1 }"/>"/>
		                            </p>
		                            <p>
		                                <input type="text" name="MEM_MST_JBN_ADR1" id="MEM_MST_JBN_ADR1" class="text xlarge" title="지번 주소" placeholder="지번 주소" 
		                                		maxlength="100" readonly="readonly" data-err_msg_id="jibun" value="<c:out value="${memberInfo.MEM_MST_JBN_ADR1 }"/>"/>
		                            </p>
		                            <p>
		                                <input type="text" name="MEM_MST_ADR2" id="MEM_MST_ADR2" class="text address" title="상세 주소" placeholder="상세 주소" 
		                                		maxlength="100" data-err_msg_id="addrDetail" value="<c:out value="${memberInfo.MEM_MST_DRO_ADR2 }"/>"/>
		                            </p>
		                            <p class="message" id="doro"></p>
		                            <p class="message" id="jibun"></p>
		                            <p class="message" id="addrDetail"></p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="sms1">정보수신</label></th>
		                        <td>
		                            <label for="TRM_YN0001" class="js-checkbox <c:if test="${memberInfo.SMS_YN eq 'Y' }">on</c:if>">
		                                <input type="checkbox" id="TRM_YN0001" name="TRM_YN0001" value="Y" 
		                                		<c:if test="${memberInfo.SMS_YN eq 'Y' }">checked="checked"</c:if> />
		                                SMS 수신
		                            </label>
		                            <label for="TRM_YN0004" class="js-checkbox <c:if test="${memberInfo.EMAIL_YN eq 'Y' }">on</c:if>">
		                                <input type="checkbox" id="TRM_YN0004" name="TRM_YN0004" value="Y" 
		                                		<c:if test="${memberInfo.EMAIL_YN eq 'Y' }">checked="checked"</c:if> />
		                               	 이메일 수신
		                            </label>
		                            <label for="TRM_YN0003" class="js-checkbox <c:if test="${memberInfo.DM_YN eq 'Y' }">on</c:if>">
		                                <input type="checkbox" id="TRM_YN0003" name="TRM_YN0003" value="Y" 
		                                		<c:if test="${memberInfo.DM_YN eq 'Y' }">checked="checked"</c:if> />
		                                DM(우편) 수신
		                            </label>
		                            <label for="TRM_YN0002" class="js-checkbox l <c:if test="${memberInfo.TM_YN eq 'Y' }">on</c:if>">
		                                <input type="checkbox" id="TRM_YN0002" name="TRM_YN0002" value="Y" 
		                                		<c:if test="${memberInfo.TM_YN eq 'Y' }">checked="checked"</c:if> />
		                                TM(전화) 수신
		                            </label>
		                            <p class="desc">
			                        	이벤트 및 다양한 정보를 받으실 수 있습니다.<br />
					                              수신 동의와 상관없이 공지사항, 비밀번호 찾기, 주문/배송 관련 SMS/메일은 발송 됩니다.
		                            </p>
		                        </td>
		                    </tr>
		                </tbody>
		                </table><!-- // table-a -->
	
		                <h4 class="title">선택정보</h4>
		                            
		                <table class="table-a table-form"><!-- table-a -->
		                <caption>추천인 ID로 구성된 회원정보수정 선택정보 입력 테이블입니다.</caption>
		                <colgroup>
		                    <col style="width: 170px;" />
		                    <col style="width: auto;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="row">추천인 ID</th>
		                        <td><c:out value="${memberInfo.MEM_MST_RCM_ID }"/></td>
		                    </tr>
		                </tbody>
		                </table><!-- // table-a -->
					</form>
					
	                <div class="section-button mt30"><!-- section-button -->
	                    <a href="javascript:goModify();" class="btn_st1 btn_rd xlarge"><span>수정</span></a>
	                    <c:choose>
	                    	<c:when test="${memberInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE}">
								<a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do" id="goCancel" class="btn_st1 btn_blk777 xlarge"><span>취소</span></a>	                    	
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do" class="btn_st1 btn_blk777 xlarge"><span>취소</span></a>
	                    	</c:otherwise>
	                    </c:choose>
	                </div><!-- // section-button -->
	
	            </div><!-- // #body -->
	            
	            <div id="laypop" class="laypop" data-idx="0" >
					<ul class="laypop_con loading"><!-- 여기에 class주셔서 내용 제어하시면 됩니다.ex) comMem_pop -->
						<li class="con">
							<img src="<c:out value="${cdnDomain }"/>/pc/img/lay/loading.gif" alt="로딩중입니다." />
						</li>
					</ul>
				</div>
	
	        </div><!--// .contents E -->
	    </article>
	    <!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	</section>
	
	<form id="changeFrm" name="changeFrm">
		<input type="hidden" name="gubun" id="gubun" value="ONLINE<c:out value="${memberInfo.MEM_MST_MEM_GBN }"/>"/>
	</form>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	$(function(){
		
		var $frm = $("#frm");
		
		// 폼체크
	    $frm.validate(
	    {
	        rules: 
	        {
	            MEM_MST_PW:{required:true, minlength:6, maxlength:15, etlandPw:true}, // 비밀번호
	            MEM_MST_PW_RE:{required:true, minlength:6, maxlength:15, equalTo:"#MEM_MST_PW"}, // 비밀번호 확인
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
	        	MEM_MST_PW: {required:"[비밀번호]는 필수 정보입니다.",minlength:"[비밀번호]는 최소 6글자 이상입니다.", maxlength:"[비밀번호]는 최대 15글자입니다."},
	        	MEM_MST_PW_RE: {required:"[비밀번호 확인]은 필수 정보입니다.",minlength:"[비밀번호 확인]은 최소 6글자 이상입니다.", maxlength:"[비밀번호 확인]은 최대 15글자입니다.",equalTo: "비밀번호를 잘못 입력 하셨습니다. \n 다시 입력해주시기 바랍니다."},
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
		
	 	// 우편번호 찾기 클릭 이벤트
	    $(document).on("click","#zipCheck",function(){
	    	window.open("<c:out value="${serverSslDomain}"/>/pc/common/commonZipCodePopup.do","commonCodePopup","width=550,height=650,scrollbars=yes,target=_blank");
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
		};
 		
	 	// 수정 버튼 클릭 이벤트
	    goModify = function () {
	    	
 			if($frm.valid()){
 				
           		// 비밀번호와 아이디가 같은지 체크
//            		if($("#MEM_MST_MEM_ID").val() == $("#MEM_MST_PW").val()){
//            			$("#memPwCheck").html("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
//            			$("#MEM_MST_PW").focus();
//            			return;
//            		}
           		
//            		var pwCheckFlag = false;
           		
//            		// 현재비밀번호와 변경할 비밀번호가 같은지 체크
//            		$.ajax({
// 	                async : false,
// 	                type : "POST",
// 	                data : {"MEM_MST_PW":$("#MEM_MST_PW").val(),"MEM_MST_MEM_ID":"${memberInfo.MEM_MST_MEM_ID}"},
// 	                url : "<c:out value="${serverSslDomain}" />/pc/mypage/checkPwAjax.do",
// 	                success : function (data) {
// 	                    if(data.successYn == "Y"){
// 	                        if(data.resultYn == "Y"){
// 	                        	$("#memPwCheck").html("현재 비밀번호와 동일한 비밀번호는 사용하실 수 없습니다.");
// 	                   			$("#MEM_MST_PW").focus();
// 	                   			return;
// 	                        }
// 	                        else if(data.resultYn == "N"){
// 	                        	pwCheckFlag = true;
// 	                        }
// 	                    }
// 	                    else
// 	                    {
// 	                        alert("데이터 전송중 데이터가 누락 되었습니다.\n다시 시도해 주십시오.");
// 	                        return;
// 	                    }
// 	                },
// 	                error : function () {
// 	                    alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
// 	                    return;
// 	                }
// 	            });

//            		if(pwCheckFlag){
           			if (confirm( "저장 하시겠습니까?")) {
               			//com.laypop('show');//팝업 show
       	                $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/myInfoModify.do", "target":"_self", "method":"post"}).submit();
                    }           			
//            		}
 			}
    	};
	    
	    // 비밀번호의 체크 메세지 초기화
	    deleteCheckMsg = function(){
	    	//$("#memPwCheck").html("");
	    	$("#ctfMail").html("");
	    };
	    
	    // 간편회원의 경우, 이메일 주소 변경 클릭 이벤트
	    $(document).on("click","#changeMailToggle",function(){

	    	var $this = $(this);
	    	
	    	$this.toggleClass('on');
	        
	    	if($this.hasClass('on') || $this.find('input[type="checkbox"]').is(":checked")){
	    		//$this.prop('checked', true).parent().addClass('on');
	    		$this.addClass('on');
	    		$(".mail-change").show();
	    	}
	    	else{
	    		//$this.prop('checked', false).parent().removeClass('on');
	    		$this.removeClass('on');
	    		$(".mail-change").hide();

	    		if($("#emailCheckYn").val() == "Y"){
	    			$.ajax({
    	               async : false,
    	               type : "POST",
    	               data : {"MEM_CTF_MAIL":$("#MEM_CTF_MAIL").val()},
    	               url : "<c:out value="${serverSslDomain}" />/pc/mypage/deleteCtfEmailAjax.do",
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
	 		
			//$("#emailCheck").val(value);	// 인증번호 받은 이메일
			
			$.ajax({
               async : false,
               type : "POST",
               data : {"MEM_CTF_MAIL":value,"MEM_MST_MEM_GBN":"${memberInfo.MEM_MST_MEM_GBN}","MEM_MST_MEM_NM":"${memberInfo.MEM_MST_MEM_NM}"},
               url : "<c:out value="${serverSslDomain}" />/pc/mypage/checkCtfEmailAjax.do",
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
			
			//var $chkObj = $("#emailCheckYn");
            //var $obj = $("#emailCheck");
//             if($chkObj.val() == "Y")	// 중복체크 성공
//             {
            	$("#ctfMail").html("");
            	
            	if($("#MEM_CTF_NO").val() == ""){
    				$("#ctfNo").html("[인증번호]는 필수 정보입니다.");
    				$("#MEM_CTF_NO").focus();
    				return;
    			}
            	
//             	if($("#emailCheck").val() == value){		// 1. 중복체크 값과 email필드 값이 같은 경우
            		
            		$.ajax({
    	                async : false,
    	                type : "POST",
    	                data : {"MEM_CTF_NO":$("#MEM_CTF_NO").val(),"MEM_CTF_MAIL":value},
    	                url : "<c:out value="${serverSslDomain}" />/pc/mypage/checkCtfNoAjax.do",
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
//             	}   
//             	else{
//             		$("#ctfMail").html("인증한 이메일과 입력하신 이메일이 일치하지않습니다.");
//             		$("#MEM_CTF_MAIL").focus();
//                     return;
//             	}
//             }
//             else
//             {
//             	$("#ctfMail").html("인증번호를 발급받아주시기 바랍니다.");
//                 return;
//             }
		};
		
		// 본인인증 완료 후 이메일 update
		updateMemMail = function(){
			
			$.ajax({
               async : false,
               type : "POST",
               data : {"MEM_CTF_MAIL":$("#MEM_CTF_MAIL").val(),"MEM_MST_MEM_ID":"${memberInfo.MEM_MST_MEM_ID}","MEM_MST_MEM_GBN":"${memberInfo.MEM_MST_MEM_GBN}"},
               url : "<c:out value="${serverSslDomain}" />/pc/mypage/updateMemEmailAjax.do",
               success : function (data) {
                   if(data.successYn == "Y")
                   {
                	    $("#simpleMail").val($("#MEM_CTF_MAIL").val());
						$("#simpleMemMail").html($("#MEM_CTF_MAIL").val());
						$("#changeMailYn").prop('checked', false).parent().removeClass('on');
						$(".mail-change").css("display","none");
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
			$("#changeFrm").attr({"action":"<c:out value="${serverSslDomain }"/>/pc/manager/changeOnlineMemCert.do", "target":"_self", "method":"post"}).submit();
		};
		
		// 간편회원의 취소 경우		
		$("#goCancel").on("click",function(){
			if($("#emailCheckYn").val() == "Y"){
    			$.ajax({
   	               async : false,
   	               type : "POST",
   	               data : {"MEM_CTF_MAIL":$("#MEM_CTF_MAIL").val()},
   	               url : "<c:out value="${serverSslDomain}" />/pc/mypage/deleteCtfEmailAjax.do",
   	               success : function (data) {
   	                   
   	               },
   	               error : function () {
   	                   alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
   	               }
   	           });
    		}	
		});
	});
</script>
</body>
</html>