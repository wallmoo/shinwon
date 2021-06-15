<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-display marmot"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>STORE</span></h3>
		    <a href="javascript:;" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<form name="frm" id="frm">
			<input type="hidden" id="SHP_REQ_SEC_EMAIL" name="SHP_REQ_SEC_EMAIL"/>
			<input type="hidden" id="SHP_REQ_BIRTH" name="SHP_REQ_BIRTH"/>
			<input type="hidden" id="SHP_REQ_POST" name="SHP_REQ_POST"/>
			<double-submit:preventer/>
			<div class="wrap"><!-- warp -->

				<div class="tab-b"><!-- tab-b -->
				    <ul class="tab">
				        <li><a href="<c:out value="${mobileDomain }"/>/mobile/brand/brandStoreIntroMarmot.do"><span>매장안내</span></a></li>
				        <li class="active"><a href="javascript:;"><span>매장개설문의</span></a></li>
				    </ul>
				</div><!-- // tab-b -->

				<h4 class="title mt15"><span>1. 경영주 인적사항</span></h4>

				<div class="gap"><!-- gap -->
					<p class="mt15">
					    <span class="warning"><span class="icon require"><em>필수입력</em></span>표시된 항목은 필수 입력 사항입니다.</span>
					</p>
						<div class="table table-form"><!-- table-form -->
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="name">성명<span class="icon require"><em>필수입력</em></span></label>
							    </div>
							    <div class="cell fields">
							        <input type="text" id="SHP_REQ_MEMBER_NM" name="SHP_REQ_MEMBER_NM" class="text" maxlength="6"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="birthday">생년월일<span class="icon require"><em>필수입력</em></span></label>
							    </div>
							    <div class="cell fields">
							        <p class="reset">
							            <input type="text" class="text small number" maxlength="4" id="SHP_REQ_BIRTH_YEAR" name="SHP_REQ_BIRTH_YEAR"/> 년
							            <input type="text" class="text small number" maxlength="2" id="SHP_REQ_BIRTH_MONTH" name="SHP_REQ_BIRTH_MONTH"/> 월
							            <input type="text" class="text small number" maxlength="2" id="SHP_REQ_BIRTH_DAY" name="SHP_REQ_BIRTH_DAY"/> 일
							        </p>
							        <p class="reset">
							            <label for="solar">
							                <span class="radio-wrap">
							                    <input type="radio" id="solar" class="radio" name="SHP_REQ_BIRTH_YN" value="Y" checked="checked" />
							                    <span class="fake-radio"></span>
							                    양력
							                </span>
							            </label>
							            <label for="lunar">
							                <span class="radio-wrap">
							                    <input type="radio" id="lunar" class="radio" name="SHP_REQ_BIRTH_YN" value="N" />
							                    <span class="fake-radio"></span>
							                    음력
							                </span>
							            </label>
							        </p>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="email">이메일<span class="icon require"><em>필수입력</em></span></label>
							    </div>
							    <div class="cell fields">
							        <p class="reset">
							            <input type="text" class="text" id="EMAIL_ID" name="EMAIL_ID" maxlength="50"/>
							            @
							            <input type="text" class="text" id="EMAIL_DOMAIN" name="EMAIL_DOMAIN" maxlength="50"/>
							        </p>
							        <p class="reset">
							            <select id="emailDomainSelectbox" class="select">
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
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="telNumber">전화번호</label>
							    </div>
							    <div class="cell fields">
							        <select name="SHP_REQ_TEL1" class="select small">
							            <c:if test="${not empty codes.TEL_CODE }">
					                        <c:forEach var="telRow" items="${codes.TEL_CODE }">
					                             <option value="<c:out value="${telRow.CMN_COM_NM }"/>"><c:out value="${telRow.CMN_COM_NM }"/></option>
					                        </c:forEach>
				                    	</c:if>
							        </select> -
							        <input type="tel" class="text small" id="SHP_REQ_TEL2" name="SHP_REQ_TEL2" maxlength="4"/> -
							        <input type="tel" class="text small" id="SHP_REQ_SEC_TEL3" name="SHP_REQ_SEC_TEL3" maxlength="4"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="cellNumber">휴대폰번호<span class="icon require"><em>필수입력</em></span></label>
							    </div>
							    <div class="cell fields">
							        <select name="SHP_REQ_HP1" class="select small">
							            <c:if test="${not empty codes.HP_CODE }">
					                        <c:forEach var="hpRow" items="${codes.HP_CODE }">
					                            <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
					                        </c:forEach>
				                    	</c:if>
							        </select> -
							        <input type="tel" class="text small" id="SHP_REQ_HP2" name="SHP_REQ_HP2" maxlength="4"/> -
							        <input type="tel" class="text small" id="SHP_REQ_SEC_HP3" name="SHP_REQ_SEC_HP3" maxlength="4"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
								<div class="cell sbj">
								    재산
								</div>
								<div class="cell fields">
								    <p class="reset">
								    	<input type="text" class="text" id="SHP_REQ_ASSET" name="SHP_REQ_ASSET" value="부동산: / 동산: " maxlength="20"/>
									</p>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        사업목적<span class="icon require"><em>필수입력</em></span>
							    </div>
							    <div class="cell fields">
							        <label for="createBusiness">
							            <span class="radio-wrap">
							                <input type="radio" class="radio" id="createBusiness" name="SHP_REQ_OBJECT" value="new" />
							                <span class="fake-radio"></span>
							                신규창업
							            </span>
							        </label>
							        <label for="changeBusiness">
							            <span class="radio-wrap">
							                <input type="radio" class="radio" id="changeBusiness" name="SHP_REQ_OBJECT" value="change" />
							                <span class="fake-radio"></span>
							                업종전환
							            </span>
							        </label>
							    </div>
							</div>
							<div class="row"><!-- row -->
						        <div class="cell sbj">
						            <label for="majorCareer">주요경력<span class="icon require"><em>필수입력</em></span></label>
						        </div>
						        <div class="cell fields">
						            <textarea id="SHP_REQ_CAREER" name="SHP_REQ_CAREER" cols="30" rows="5" class="textarea xlarge" maxlength="100"></textarea>
						        </div>
						    </div>
						</div><!-- // table-form -->
					</div><!-- // gap -->
	
					<h4 class="title mt20"><span>2. 개설예정지 정보</span></h4>
	
					<div class="gap"><!-- gap -->
						<p class="mt15">
						    <span class="warning"><span class="icon require"><em>필수입력</em></span>표시된 항목은 필수 입력 사항입니다.</span>
						</p>
						<div class="table table-form"><!-- table-form -->
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="shopName">매장<span class="icon require"><em>필수입력</em></span></label>
							    </div>
							    <div class="cell fields">
							        <input type="text" class="text" id="SHP_REQ_SHOP_NM" name="SHP_REQ_SHOP_NM" maxlength="10"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="shopTelNumber">전화번호</label>
							    </div>
							    <div class="cell fields">
							        <select name="SHP_REQ_SHOP_TEL1" class="select small">
							            <c:if test="${not empty codes.TEL_CODE }">
					                         <c:forEach var="telRow" items="${codes.TEL_CODE }">
					                             <option value="<c:out value="${telRow.CMN_COM_NM }"/>"><c:out value="${telRow.CMN_COM_NM }"/></option>
					                         </c:forEach>
					                    </c:if>
							        </select>
							        -
							        <input type="tel" id="SHP_REQ_SHOP_TEL2" name="SHP_REQ_SHOP_TEL2" maxlength="4" class="text small" />
							        -
							        <input type="tel" id="SHP_REQ_SEC_SHOP_TEL3" name="SHP_REQ_SEC_SHOP_TEL3" maxlength="4" class="text small" />
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="address">우편번호<span class="icon require"><em>필수입력</em></span></label>
							    </div>
							    <div class="cell fields">
							        <p class="reset">
							            <span class="section-button actions">
					                    	<a href="javascript:;" class="button primary small search-zipcode" 
	                                       	data-post1_id="POST1"
					                    	data-post2_id="POST2"
					                    	data-addr1_id="SHP_REQ_ADDRESS1"
					                    	data-addr2_id="SHP_REQ_ADDRESS2"
	                                       ><span>우편번호 찾기</span></a>
							            </span>
							        </p>
							        <p class="reset">
							        	<input type="text" id="POST1" name="POST1" class="text small" maxlength="3"/>
							            -
							            <input type="text" class="text small" id="POST2" name="POST2" maxlength="3"/>
							        </p>
							    </div>
							</div>
							</div>
							<%-- [BEGIN] 우편번호 api 스크립트 --%>
							<%@ include file="/WEB-INF/jsp/mobile/include/zipcode.jsp" %>
							<%-- [END] 우편번호 api 스크립트 --%>
							<div class="table table-form" style="border-top: 0;">
							<div class="row"><!-- row -->
								<div class="cell sbj">
									<label for="address">주소<span class="icon require"><em>필수입력</em></span></label>
								</div>
                   				<div class="cell fields">
									<p class="reset">
							            <input type="text" class="text xlarge" id="SHP_REQ_ADDRESS1" name="SHP_REQ_ADDRESS1" maxlength="60"/>
							        </p>
							        <p class="reset">
							            <input type="text" class="text xlarge" id="SHP_REQ_ADDRESS2" name="SHP_REQ_ADDRESS2" maxlength="60"/>
							        </p>
								</div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="businessArea">영업면적<span class="icon require"><em>필수입력</em></span></label>
							    </div>
							    <div class="cell fields">
							        <input type="text" id="SHP_REQ_AREA" name="SHP_REQ_AREA" class="text xlarge number" maxlength="8"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="storageArea">창고면적<span class="icon require"><em>필수입력</em></span></label>
							    </div>
							    <div class="cell fields">
							        <input type="text" id="SHP_REQ_STORAGE" name="SHP_REQ_STORAGE" class="text xlarge number" maxlength="8"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="frontWidth">전면너비<span class="icon require"><em>필수입력</em></span></label>
							    </div>
							    <div class="cell fields">
							        <input type="text" id="SHP_REQ_WIDTH" name="SHP_REQ_WIDTH" class="text xlarge number" maxlength="8"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="ceilingHeight">천정높이<span class="icon require"><em>필수입력</em></span></label>
							    </div>
							    <div class="cell fields">
							        <input type="text" id="SHP_REQ_HEIGHT" name="SHP_REQ_HEIGHT" class="text xlarge number" maxlength="8"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        주차장 확보<span class="icon require"><em>필수입력</em></span>
							    </div>
							    <div class="cell fields">
							        <label for="parkingPossible">
							            <span class="radio-wrap">
							                <input type="radio" id="parkingPossible" name="SHP_REQ_PARKING" value="Y" class="radio" />
							                <span class="fake-radio"></span>
							                유
							            </span>
							        </label>
							        <label for="parkingImpossible">
							            <span class="radio-wrap">
							                <input type="radio" id="parkingImpossible" name="SHP_REQ_PARKING" value="N" class="radio" />
							                <span class="fake-radio"></span>
							                무
							            </span>
							        </label>
							        <label for="parkingNumber">가능대수</label>
							        <input type="text" class="text small number" id="SHP_REQ_PAK_NUM" name="SHP_REQ_PAK_NUM" maxlength="8"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="businessForm">사업장형태</label>
							    </div>
							    <div class="cell fields">
							        <input type="text" class="text xlarge" id="SHP_REQ_BSN_TYPE" name="SHP_REQ_BSN_TYPE" maxlength="30"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="majorCustomer">주 고객층</label>
							    </div>
							    <div class="cell fields">
							        <input type="text" class="text xlarge" id="SHP_REQ_MAIN_CUST" name="SHP_REQ_MAIN_CUST" maxlength="30"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="incomeLevel">소득 수준</label>
							    </div>
							    <div class="cell fields">
							        <input type="text" class="text xlarge" id="SHP_REQ_INCOME" name="SHP_REQ_INCOME" maxlength="30"/>
							    </div>
							</div>
							<div class="row"><!-- row -->
							    <div class="cell sbj">
							        <label for="growthProspect">성장전망 및 <br />지역 특이사항<span class="icon require"><em>필수입력</em></span></label>
							    </div>
							    <div class="cell fields">
							        <textarea rows="5" cols="30" id="SHP_REQ_UNUSUAL" name="SHP_REQ_UNUSUAL" class="textarea xlarge" maxlength="100"></textarea>
							    </div>
							</div>
							<div class="row"><!-- row -->
						        <div class="cell sbj">
						            <label for="surroundingsBrand">주변 브랜드 <br />입점현황<span class="icon require"><em>필수입력</em></span></label>
						        </div>
						        <div class="cell fields">
						            <textarea rows="5" cols="30" id="SHP_REQ_LANUCHING" name="SHP_REQ_LANUCHING" class="textarea xlarge" maxlength="100"></textarea>
						        </div>
						    </div>
						</div><!-- // table-form -->
					</form>
					<div class="grid section-button actions"><!-- section-button -->
					    <div class="col-1-1">
					        <a href="javascript:;" id="goRegist" class="button warning full"><span>저장</span></a>
					    </div>
					</div><!-- // section-button -->
				</div><!-- // gap -->
				

				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- // warp -->
		</div><!-- // container -->

	</div><!-- // contents -->
	
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">

	$(function()
	{
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
	    $("#frm").validate
	    ({
	        rules: 
	        {	        	
	        	SHP_REQ_MEMBER_NM:{required:true}, // 성명
	        	SHP_REQ_BIRTH_YEAR:{required:true, number:true}, // 생년
	        	SHP_REQ_BIRTH_MONTH:{required:true, number:true}, // 월
	        	SHP_REQ_BIRTH_DAY:{required:true, number:true}, // 일
	        	EMAIL_ID:{required:true}, // 이메일 아이디
	            EMAIL_DOMAIN:{required:true, emailDomain:true}, // 이메일 도메인
	            SHP_REQ_HP2:{required:true, number:true}, // 핸드폰번호 중간자리
	            SHP_REQ_SEC_HP3:{required:true, number:true}, // 핸드폰번호 뒷자리
	        	SHP_REQ_CAREER:{required:true}, //주요경력
	        	SHP_REQ_SHOP_NM:{required:true}, // 매장이름
	        	POST1:{required:true, number:true}, // 우편번호 앞자리
	        	POST2:{required:true, number:true}, // 우편번호 뒷자리
	        	SHP_REQ_ADDRESS1:{required:true}, // 주소 앞자리
	        	SHP_REQ_ADDRESS2:{required:true}, // 주소 뒷자리
	        	SHP_REQ_AREA:{required:true, number:true}, // 영업면적
	        	SHP_REQ_STORAGE:{required:true, number:true}, // 창고면적
	        	SHP_REQ_WIDTH:{required:true, number:true}, // 전면너비
	        	SHP_REQ_HEIGHT:{required:true, number:true}, // 천정높이
	        	SHP_REQ_UNUSUAL:{required:true}, // 성장전망
	        	SHP_REQ_LANUCHING:{required:true} // 입점현황
	        },
	        messages :
	        {	        	
	        	SHP_REQ_MEMBER_NM: {required:"[성명]을 입력해주십시오."},
	        	SHP_REQ_BIRTH_YEAR: {required:"[생년]을 입력해주십시오.", number:"[생년]을 숫자로 입력해주십시오."},
	        	SHP_REQ_BIRTH_MONTH: {required:"[월]을 입력해주십시오.", number:"[월]을 숫자로 입력해주십시오."},
	        	SHP_REQ_BIRTH_DAY: {required:"[일]을 입력해주십시오.", number:"[일]을 숫자로 입력해주십시오."},
	        	EMAIL_ID : {required:"[이메일]아이디를 반드시 입력해주십시오."},
	            EMAIL_DOMAIN : {required:"[이메일]도메인을 반드시 입력해주십시오.", emailDomain:"[이메일]도메인 형식을 올바르게 입력해주십시오."},
	            SHP_REQ_HP2 : {required:"[핸드폰번호]가운데 자리를 입력해주십시오.", number:"[핸드폰번호]가운데 자리를 숫자로 입력해주십시오."},
	            SHP_REQ_SEC_HP3 : {required:"[핸드폰번호]뒷자리를 입력해주십시오.", number:"[핸드폰번호]뒷자리를 숫자로 입력해주십시오."},
	            SHP_REQ_CAREER : {required:"[주요경력]을 입력해주십시오."},
	            SHP_REQ_SHOP_NM : {required:"[매장이름]을 입력해주십시오."},
	            POST1 : {required:"[우편번호]앞자리를 입력해주십시오.", number:"[우편번호]앞자리를 숫자로 입력해주십시오."},
	            POST2 : {required:"[우편번호]뒷자리를 입력해주십시오.", number:"[우편번호]뒷자리를 숫자로 입력해주십시오."},
	            SHP_REQ_ADDRESS1 : {required:"[주소]앞자리을 입력해주십시오."},
	            SHP_REQ_ADDRESS2 : {required:"[주소]뒷자리을 입력해주십시오."},
	            SHP_REQ_AREA : {required:"[영업면적]을 입력해주십시오.", number:"[영업면적]을 숫자로 입력해주십시오."},
	            SHP_REQ_STORAGE : {required:"[창고면적]을 입력해주십시오.", number:"[창고면적]을 숫자로 입력해주십시오."},
	            SHP_REQ_WIDTH: {required:"[전면너비]을 입력해주십시오.", number:"[전면너비]을 숫자로 입력해주십시오."},
	            SHP_REQ_HEIGHT: {required:"[천정높이]을 입력해주십시오.", number:"[천정높이]을 숫자로 입력해주십시오."},
	            SHP_REQ_UNUSUAL : {required:"[성장전망]을 입력해주십시오."},
	            SHP_REQ_LANUCHING : {required:"[입점현황]을 입력해주십시오."}
	        }
	    });
		
		// 등록 이벤트
	    $(document).on("click", "#goRegist", function() 
	    {
	    	var $frm = $("#frm");

	    	if($frm.valid())
            {
	    		var SHP_REQ_BIRTH = $.trim($("#SHP_REQ_BIRTH_YEAR").val()) + $.trim($("#SHP_REQ_BIRTH_MONTH").val()) + $.trim($("#SHP_REQ_BIRTH_DAY").val());
	    		
	    		if(! /[12][0-9]{3}[0-9]{2}[0-9]{2}/.test(SHP_REQ_BIRTH))
	    		{
	    			alert("생년월일은 yyyy.MM.dd 형식으로 입력해주십시오. ");
	    			$("#SHP_REQ_BIRTH_YEAR").focus();
	    			return;
	    		}
	    		
	    		if($("input[name='SHP_REQ_OBJECT']:checked").length == 0)
	    		{
	    			alert("[사업목적]을 선택해주십시오.");
	    			$("input[name='SHP_REQ_OBJECT']").eq(0).focus();
	    			return;
	    		}

	    		if($("input[name='SHP_REQ_PARKING']:checked").length == 0)
	    		{
	    			alert("[주차장 확보]를 선택해주십시오.");
	    			$("input[name='SHP_REQ_PARKING']").eq(0).focus();	
	    			return;
	    		}
	    		
	    		if($("input[name='SHP_REQ_PARKING']:checked").val() == "Y")
	    		{
	    			if($("#SHP_REQ_PAK_NUM").val() == "")
	    			{
	    				alert("[주차장 가능 대수]를 입력해주십시오.");
	    				$("#SHP_REQ_PAK_NUM").focus();
	    				return;
	    			}
	    		}
	    		
	    		if (confirm("매장개설문의서를 제출하시겠습니까?"))
                {
	    			$("#SHP_REQ_POST").val($.trim($("#POST1").val()) + $.trim($("#POST2").val()));
	    			$("#SHP_REQ_BIRTH").val(SHP_REQ_BIRTH);
                    $("#SHP_REQ_SEC_EMAIL").val($.trim($("#EMAIL_ID").val()) + "@" + $.trim($("#EMAIL_DOMAIN").val()));              
                    $("#frm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/brand/brandStoreOpenRegist.do", "target":"_self", "method":"post"}).submit();
                }
            }
	    	
	    });
	});

</script>

</body>
</html>