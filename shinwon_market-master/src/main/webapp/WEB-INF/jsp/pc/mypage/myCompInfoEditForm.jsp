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
	        <form id="frm" name="frm" method="post">
				<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${memberInfo.MEM_MST_MEM_ID }"/>"/>
				<input type="hidden" name="MEM_MST_ERP_ID" id="MEM_MST_ERP_ID" value="<c:out value="${memberInfo.MEM_MST_ERP_ID }"/>"/>
				<input type="hidden" name="MEM_CPR_NO1" id="MEM_CPR_NO1" value="<c:out value="${memberInfo.MEM_CPR_NO1 }"/>"/>
				<input type="hidden" name="MEM_CPR_NO2" id="MEM_CPR_NO2" value="<c:out value="${memberInfo.MEM_CPR_NO2 }"/>"/>
				<input type="hidden" name="MEM_CPR_NO3" id="MEM_CPR_NO3" value="<c:out value="${memberInfo.MEM_CPR_NO3 }"/>"/>
				<input type="hidden" name="MEM_MST_REG_DT" id="MEM_MST_REG_DT" value="<c:out value="${memberInfo.MEM_MST_REG_DT }"/>"/>
            	<double-submit:preventer/>
	        
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
		                            
		                <table class="table-a table-form mt0"><!-- table-a -->
		                <caption>기업명, 사업자등록번호, 아이디, 업종/업태, 대표자명, 대표전화, 팩스번호, 주소로 구성된 회원정보수정 기본정보 입력 테이블입니다.</caption>
		                <colgroup>
		                    <col style="width: 170px;" />
		                    <col style="width: auto;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="row">기업명</th>
		                        <td><c:out value="${memberInfo.MEM_CPR_NM }"/></td>
		                    </tr>
		                    <tr>
		                        <th scope="row">사업자등록번호</th>
		                        <td>
		                        	<c:out value="${memberInfo.MEM_CPR_NO1 }"/> -
		                            <c:out value="${memberInfo.MEM_CPR_NO2 }"/> -
		                            <c:out value="${memberInfo.MEM_CPR_NO3 }"/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row">아이디</th>
		                        <td><c:out value="${memberInfo.MEM_MST_MEM_ID }"/></td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="ceo">대표자명<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                        <td>
		                            <input type="text" id="MEM_CPR_CEO_NM" name="MEM_CPR_CEO_NM" class="text" 
		                            		maxlength="10" value="<c:out value="${memberInfo.MEM_CPR_CEO_NM }"/>" data-err_msg_id="ceoNm"  />
		                            <p class="message" id="ceoNm"></p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="business">업종/업태</label></th>
		                        <td>
		                            <input type="text" id="MEM_CPR_TYPE" name="MEM_CPR_TYPE" class="text" title="업태" 
	                            			maxlength="10" value="<c:out value="${memberInfo.MEM_CPR_TYPE }"/>"/>
		                            <input type="text" id="MEM_CPR_STUS" name="MEM_CPR_STUS" class="text" title="업종" 
		                            		maxlength="10" value="<c:out value="${memberInfo.MEM_CPR_STUS }"/>"/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="tel1">대표전화</label></th>
		                        <td>
		                            <select class="sel_chg" id="MEM_CPR_TEL1" name="MEM_CPR_TEL1" title="대표전화 앞자리">
		                                <option value="">선택</option>
		                                <c:if test="${not empty codes.TEL_CODE }">
			                                <c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
			                                    <option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${telRow.CMN_COM_NM eq memberInfo.MEM_CPR_TEL1 }">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
			                                </c:forEach>
		                                </c:if>
		                            </select> -
		                            <input type="text" class="text small number" name="MEM_CPR_TEL2" id="MEM_CPR_TEL2" maxlength="4" 
		                            		title="대표전화 중간자리" value="<c:out value="${memberInfo.MEM_CPR_TEL2 }"/>" /> -
		                            <input type="text" class="text small number" name="MEM_CPR_TEL3" id="MEM_CPR_TEL3" maxlength="4" 
		                            		title="대표전화 끝자리" value="<c:out value="${memberInfo.MEM_CPR_TEL3 }"/>"/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="fax">팩스번호</label></th>
		                        <td>
		                            <select class="sel_chg" id="MEM_CPR_FAX1" name="MEM_CPR_FAX1" title="팩스번호 앞자리">
		                                <option value="">선택</option>
		                                <c:if test="${not empty codes.TEL_CODE }">
			                                <c:forEach var="faxRow" items="${codes.TEL_CODE }" varStatus="i">
			                                    <option value="<c:out value="${faxRow.CMN_COM_NM }"/>" <c:if test="${faxRow.CMN_COM_NM eq memberInfo.MEM_CPR_FAX1 }">selected="selected"</c:if>><c:out value="${faxRow.CMN_COM_NM }"/></option>
			                                </c:forEach>
		                                </c:if>
		                            </select> -
		                            <input type="text" class="text small number" name="MEM_CPR_FAX2" id="MEM_CPR_FAX2" maxlength="4" 
		                            		title="팩스번호 중간자리" value="<c:out value="${memberInfo.MEM_CPR_FAX2 }"/>" /> -
		                            <input type="text" class="text small number" name="MEM_CPR_FAX3" id="MEM_CPR_FAX3" maxlength="4" 
		                            		title="팩스번호 끝자리" value="<c:out value="${memberInfo.MEM_CPR_FAX3 }"/>"/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="zip1">주소<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                        <td>
		                            <p>
		                                <input type="text" id="MEM_CPR_ZIP_CDE5" name="MEM_CPR_ZIP_CDE5" class="text small number" maxlength="5" 
		                                		title="우편번호"  data-err_msg_id="zip" value="<c:out value="${memberInfo.MEM_CPR_ZIP_CDE5 }"/>"/>
		                                <a href="javascript:;" id="zipCheck" class="btn_st0 btn_blk777 small" title="새 창 열림"><span>우편번호 찾기</span></a>
		                            </p>
		                            <p class="message" id="zip"></p>
		                            <p>
		                                <input type="text" class="text xlarge" name="MEM_CPR_DRO_ADR1" id="MEM_CPR_DRO_ADR1" maxlength="100" title="도로명 주소"  
		                                		placeholder="도로명 주소"  data-err_msg_id="doro" value="<c:out value="${memberInfo.MEM_CPR_DRO_ADR1 }"/>"/>
		                            </p>
		                            <p>
		                                <input type="text" class="text xlarge" name="MEM_CPR_JBN_ADR1" id="MEM_CPR_JBN_ADR1" maxlength="100" title="지번 주소" 
		                                		placeholder="지번 주소"  data-err_msg_id="jibun" value="<c:out value="${memberInfo.MEM_CPR_JBN_ADR1 }"/>"/>
		                            </p>
		                            <p>
		                                <input type="text" class="text address" name="MEM_CPR_ADR2" id="MEM_CPR_ADR2" title="상세 주소" placeholder="상세 주소"
		                                		maxlength="100" data-err_msg_id="addrDetail" value="<c:out value="${memberInfo.MEM_CPR_DRO_ADR2 }"/>" />
		                            </p>
		                            <p class="message" id="doro"></p>
		                            <p class="message" id="jibun"></p>
		                            <p class="message" id="addrDetail"></p>
		                        </td>
		                    </tr>
		                </tbody>
		                </table><!-- // table-a -->
		
		                <h4 class="title">선택정보</h4>
		                            
		                <table class="table-a table-form"><!-- table-a -->
		                <caption>담당자이름, 이메일, 일반전화, 휴대폰 번호, 정보수신, 추천인 ID로 구성된 회원정보수정 선택정보 입력 테이블입니다.</caption>
		                <colgroup>
		                    <col style="width: 170px;" />
		                    <col style="width: auto;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="row"><label for="name">담당자이름<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                        <td>
		                            <input type="text" class="text" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" maxlength="10" data-err_msg_id="memNm" 
		                            		value="<c:out value="${memberInfo.MEM_MST_MEM_NM }"/>" />
		                            <p class="message" id="memNm"></p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="email">이메일<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                        <td>
		                            <input type="text" class="text large" name="MEM_MST_MAIL" id="MEM_MST_MAIL" maxlength="50" data-err_msg_id="memEmail" 
		                            		value="<c:out value="${memberInfo.MEM_MST_MAIL }"/>"/> 
		                            <p class="message" id="memEmail"></p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="tel2">일반전화<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                        <td>
		                            <select class="sel_chg" id="MEM_MST_TEL1" name="MEM_MST_TEL1" title="일반전화 앞자리" data-err_msg_id="memTel1">
		                                <option value="">선택</option>
		                                <c:if test="${not empty codes.TEL_CODE }">
			                                <c:forEach var="mngTelRow" items="${codes.TEL_CODE }" varStatus="i">
			                                    <option value="<c:out value="${mngTelRow.CMN_COM_NM }"/>" <c:if test="${mngTelRow.CMN_COM_NM eq memberInfo.MEM_MST_TEL1 }">selected="selected"</c:if>><c:out value="${mngTelRow.CMN_COM_NM }"/></option>
			                                </c:forEach>
		                                </c:if>
		                            </select> -
		                            <input type="text" class="text small number" name="MEM_MST_TEL2" id="MEM_MST_TEL2" maxlength="4" 
		                            		title="일반전화 중간자리" data-err_msg_id="memTel2" value="<c:out value="${memberInfo.MEM_MST_TEL2 }"/>" /> -
		                            <input type="text" class="text small number" name="MEM_MST_TEL3" id="MEM_MST_TEL3" maxlength="4" 
		                            		title="일반전화 끝자리" data-err_msg_id="memTel3" value="<c:out value="${memberInfo.MEM_MST_TEL3 }"/>"/>
		                            <p class="message" id="memTel1"></p>
		                            <p class="message" id="memTel2"></p>
		                            <p class="message" id="memTel3"></p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="phone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                        <td>
		                            <select class="sel_chg" id="MEM_MST_HP1" name="MEM_MST_HP1" title="휴대폰 번호 앞자리" data-err_msg_id="memHp1">
		                                <option value="">선택</option>
		                                <c:if test="${not empty codes.HP_CODE }">
		                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
		                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${hpRow.CMN_COM_NM eq memberInfo.MEM_MST_HP1 }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }"/></option>
		                                    </c:forEach>
		                                </c:if>
		                            </select> -
		                            <input type="text" class="text small number" name="MEM_MST_HP2" id="MEM_MST_HP2" maxlength="4" 
		                            		title="휴대폰 번호 중간자리" data-err_msg_id="memHp2" value="<c:out value="${memberInfo.MEM_MST_HP2 }"/>" /> -
		                            <input type="text" class="text small number" name="MEM_MST_HP3" id="MEM_MST_HP3" maxlength="4" 
		                            		title="휴대폰 번호 끝자리" data-err_msg_id="memHp3" value="<c:out value="${memberInfo.MEM_MST_HP3 }"/>"/>
		                            <p class="message" id="memHp1"></p>
		                            <p class="message" id="memHp2"></p>
		                            <p class="message" id="memHp3"></p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="sms1">정보수신</label></th>
		                        <td>
		                            <label for="TRM_YN0001" class="js-checkbox <c:if test="${memberInfo.SMS_YN eq 'Y' }">on</c:if>">
		                                <input type="checkbox" id="TRM_YN0001" name="TRM_YN0001" value="Y" 
		                                		<c:if test="${memberInfo.SMS_YN eq 'Y' }">checked="checked"</c:if>/>
		                                SMS 수신
		                            </label>
		                            <label for="TRM_YN0004" class="js-checkbox <c:if test="${memberInfo.EMAIL_YN eq 'Y' }">on</c:if>">
		                                <input type="checkbox" id="TRM_YN0004" name="TRM_YN0004" value="Y" 
		                                		<c:if test="${memberInfo.EMAIL_YN eq 'Y' }">checked="checked"</c:if>/>
		                               	이메일 수신
		                            </label>
		                            <label for="TRM_YN0003" class="js-checkbox <c:if test="${memberInfo.DM_YN eq 'Y' }">on</c:if>">
		                                <input type="checkbox" id="TRM_YN0003" name="TRM_YN0003" value="Y" 
		                                		<c:if test="${memberInfo.DM_YN eq 'Y' }">checked="checked"</c:if>/>
		                                DM(우편) 수신
		                            </label>
		                            <label for="TRM_YN0002" class="js-checkbox l <c:if test="${memberInfo.TM_YN eq 'Y' }">on</c:if>">
		                                <input type="checkbox" id="TRM_YN0002" name="TRM_YN0002" value="Y" 
		                                		<c:if test="${memberInfo.TM_YN eq 'Y' }">checked="checked"</c:if>/>
		                                TM(전화) 수신
		                            </label>
		                            <p class="desc">
		                                이벤트 및 다양한 정보를 받으실 수 있습니다.<br />
		                                수신 동의와 상관없이 공지사항, 비밀번호 찾기, 주문/배송 관련 SMS/메일은 발송 됩니다.
		                            </p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row">추천인 ID</th>
		                        <td><c:out value="${memberInfo.MEM_MST_RCM_ID }"/></td>
		                    </tr>
		                </tbody>
		                </table><!-- // table-a -->
		
		                <div class="section-button mt30"><!-- section-button -->
		                    <a href="javascript:goModify();" class="btn_st1 btn_rd xlarge"><span>수정</span></a>
		                    <a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do" class="btn_st1 btn_blk777 xlarge"><span>취소</span></a>
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
			</form>
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
		
	 	// 우편번호 찾기 클릭 이벤트
	    $(document).on("click","#zipCheck",function(){
	    	window.open("<c:out value="${serverSslDomain}"/>/pc/common/commonZipCodePopup.do","commonCodePopup","width=550,height=650,scrollbars=yes,target=_blank");
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
		                    
	 			// 비밀번호와 아이디가 같은지 체크
//            		if($("#MEM_MST_MEM_ID").val() == $("#MEM_MST_PW").val()){
//            			$("#memPwCheck").html("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
//            			$("#MEM_MST_PW").focus();
//            			return;
//            		}
	 			
// 				var pwCheckFlag = false;
           		
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
// 	                }
// 	            });
           		
//            		if(pwCheckFlag){
           			if (confirm( "저장 하시겠습니까?")) {
               			com.laypop('show');//팝업 show
       	                $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/myCompInfoModify.do", "target":"_self", "method":"post"}).submit();
                    }           		
//            		}
	 		}
	    };
	    
	 	// 아이디 및 비밀번호의 체크 메세지 초기화
// 	    deleteCheckMsg = function(){
// 	    	$("#memPwCheck").html("");
// 	    };
	    
	});
</script>
</body>
</html>