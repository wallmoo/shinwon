<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
<style>
	.price-after .discount {
		position: fixed!important;
	    top: -1000em !important;
	    left: 0;
	    display: block;
	    overflow: hidden;
	}
</style>
</head>
<body class="page-estimate">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>나만의 맞춤견적서</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <div class="bbs-status"><!-- bbs-status -->
            총 <span class="warning"><c:out value="${totalCount }" /></span>개의 상품이 맞춤견적서에 담겨 있습니다.
        </div><!-- // bbs-status -->
		<form name="frm" id="frm" method="post">
	    <input type="hidden" name="ESM_MST_WSH_TOT_PRICE" id="ESM_MST_WSH_TOT_PRICE" value="" />
        <div class="padder">
            <div class="product-list-wrap estimate"><!-- product-list-wrap -->
                <ul class="product-list">
                <c:set var="price" value="0" />
                <c:forEach items="${list }" var="row" varStatus="sta">
                <input type="hidden" name="PRD_MST_CDs" id="PRD_MST_CDs" value="<c:out value="${row.PRD_MST_CD }" />" />
                	<li>
                        <div class="module">
                            <p class="action-delete">
                                <a href="javascript:goDelete('<c:out value="${row.PRD_MST_CD }" />');" class="delete"><i><span class="blind">{상품명} 삭제</span></i></a>
                            </p>
                            <a href="javascript:;">
                                <span class="thumb"><img data-original="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG }" />" src="<c:out value="${cdnDomain }" />/mobile/img/lay/grey.gif" alt="" height="160"/></span>
                                <span class="subject"><c:out value="${row.PRD_MST_NM }" /></span>
                            </a>
                            <p class="price-after">
                                <span class="blind">판매가</span><strong class="large"><fmt:formatNumber value="${row.PRD_MST_DSP_PRC }" groupingUsed="true" /></strong>원
                                <em class="discount">
                                    <span class="blind">할인률</span>
                                    <strong class="tx_num"><c:out value="${row.SALE }" /></strong>%
                                </em>
                            </p>
                            <p class="option" style="display:none;">
                                <a href="javascript:$.com.util.layPop('open', $('#<c:out value="${row.PRD_MST_CD }" />'));" class="small primary"><c:if test="${row.ESM_CRT_CNT > 0}" />본품 <c:out value="${row.ESM_CRT_CNT }" />개 <c:if test="${row.ESM_CRT_SLT_CNT > 0 }">옵션 <c:out value="${row.ESM_CRT_SLT_CNT }" />개</c:if></a>
                                <a href="javascript:optlayer2('<c:out value="${row.PRD_MST_CD }" />', '<c:out value="${row.PRD_MST_DSP_PRC }" />');" class="button small"><span>변경</span></a>
                            </p>
                        </div>
                    </li>
                    <c:set var="price" value="${price + (row.PRD_MST_DSP_PRC * row.ESM_CRT_CNT)}" />
                </c:forEach>                    
                </ul>
            </div><!-- // product-list-wrap -->
			
			<c:set var="optPrice" value="0" />
			<c:forEach var="row" items="${list }">  
	        <section id="<c:out value="${row.PRD_MST_CD}" />" data-role="popup" data-overlay-theme="a" class="popup_st0 no_title"><!-- #option -->
	            <dl class="ui-content">
	                <dt>
	                    <h2>선택된 옵션</h2>
	                    <a href="javascript:$.com.util.layPop('close', $('#<c:out value="${row.PRD_MST_CD}" />'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
	                </dt>
	                <dd class="tx_list">
	                	<c:set var="listNum" value="1"/>
	                	<c:forEach var="optRow" items="${optList}" varStatus="optSta">
						<c:if test="${optRow.MEM_PRD_MST_CD eq row.PRD_MST_CD }">
							<c:if test="${optRow.OPTCHK > 0 }">
						<p><c:out value="${optRow.OPT_DTL_NM }"/> / <c:out value="${optRow.ESM_CRT_CNT }" />개</p>		
							</c:if>
							<c:if test="${optRow.OPTCHK eq 0 }">
								<c:if test="${listNum eq 1 }">
	                    <ol class="list list-ol mt20">
	                    		</c:if>
	                        <li><c:out value="${optRow.OPT_DTL_NM }" /> / (<c:out value="${optRow.OPT_DTL_ADD_PRC }" />원)/<c:out value="${optRow.ESM_CRT_CNT }" />개</li>"
								<c:if test="${listNum eq row.ESM_CRT_SLT_CNT }">                                                
	                    </ol>
	                    		</c:if>
	                    	</c:if>
	                    	<c:set var="listNum" value="${listNum + 1 }"/>
	                    </c:if>
	                    <c:set var="optPrice" value="${optPrice + optRow.OPT_DTL_ADD_PRC * optRow.ESM_CRT_CNT}" />
	                    </c:forEach>
	                </dd>
	            </dl>
	        </section><!-- // #option -->
	        </c:forEach>
	        <div id="optlayer"></div>

            <div class="estimate-form"><!-- estimate-form -->
                <p class="warning gray">
                    &lsquo;답변 이메일로 받기&rsquo;를 선택하시면 기재하신 이메일로 견적 신청 결과를 빠르게 받아 보실 수 있습니다.
                </p>

                <ul class="form-a">
                    <li class="name">
                        <div class="tit">
                            <label for="name">이름 <span class="essential"><em class="blind">필수입력</em></span></label>
                        </div>
                        <div class="field">
                            <input type="text" id="ESM_MST_MEM_NM" name="ESM_MST_MEM_NM" class="text">
                        </div>
                    </li>
                    <li class="tel">
                        <div class="tit">
                            <label for="phone">휴대폰<span class="essential"><em class="blind">필수입력</em></span></label>
                        </div>
                        <div class="field">
                            <label for="phone" class="sel_box_st0">
                                <select id="ESM_MST_HP1" name="ESM_MST_HP1" class="select" title="휴대폰 번호 앞자리">
                                <c:forEach items="${codes.HP_CODE }" var="row" >
                            		<option value="<c:out value="${row.CMN_COM_NM}" />" ><c:out value="${row.CMN_COM_NM}" /></option>
                            	</c:forEach>
                                </select>
                            </label> -
                            <input type="text" class="text" maxlength="4" title="휴대폰 번호 중간자리" id="ESM_MST_HP2" name="ESM_MST_HP2"> -
                            <input type="text" class="text"  maxlength="4" title="휴대폰 번호 끝자리" id="ESM_MST_HP3" name="ESM_MST_HP3">
                        </div>
                    </li>
                    <li>
                        <div class="tit">
                            <label for="email">이메일</label>
                        </div>
                        <div class="field">
                            <p>
                                <input type="text" id="ESM_MST_MAIL" name="ESM_MST_MAIL" class="text">
                            </p>
                            <p class="desc">
                                <input type="checkbox" id="ESM_MST_CALL_YN" name="ESM_MST_CALL_YN" class="checkbox" value="Y">
                                <label for="mailY">답변 이메일로 받기</label>
                            </p>
                        </div>
                    </li>
                    <li class="message">
                        <div class="tit">
                            <label for="message">문의내용</label>
                        </div>
                        <div class="field">
                            <textarea class="textarea" id="ESM_MST_QST" name="ESM_MST_QST" placeholder="요청사항이나 문의사항이 있으신 경우 기재해주세요."></textarea>
                        </div>
                    </li>
                    <li>
                        <div class="tit">
                            <label for="item">상품대체<span class="essential"><em class="blind">필수입력</em></span></label>
                        </div>
                        <div class="field">
                            <label for="item" class="sel_box_st0">
                                <select id="ESM_MST_PRD_CHANGE_YN" name="ESM_MST_PRD_CHANGE_YN" class="select">
                                    <option value="">선택</option>
                                    <option value="Y">YES</option>
                                    <option value="N">NO</option>
                                </select>
                            </label>
                        </div>
                    </li>
                </ul>

                <p class="bbs-guide">
                    <span class="essential"><em class="blind">필수입력 항목은</em></span> 필수 입력
                </p>
            </div><!-- // estimate-form -->
            
            <div class="estimate-price pr_info_d"><!-- estimate-price -->
                <ul class="form-a">
                    <li class="total">
                        <div class="tit">선택 상품 합계</div>
                        <div class="field">
                            <strong class="xxlarge"><fmt:formatNumber value="${price + optPrice }" groupingUsed="true"/></strong>
                            <span class="won">원</span>
                        </div>
                    </li>
                    <li class="want">
                        <div class="tit">
                            <label for="priceWant"><span class="xlarge">희망금액</span></label>
                        </div>
                        <div class="field">
                            <p>
                                <input type="text" id="ESM_MST_WSH_TOT_PRICE_INP" name="ESM_MST_WSH_TOT_PRICE_INP" class="text">
                                <span class="won">원</span>
                            </p>
                            <p>
                                <span class="small">견적 원하는 금액을 입력해주세요.</span>
                            </p>
                        </div>
                    </li>
                </ul>
            </div><!-- // estimate-price -->
			
            <div class="agreement accordion mt15" data-role="collapsible-set"><!-- estimate-guide -->
            	<div class="check-wrap">
                    <input type="checkbox" id="agreement" class="checkbox">
                    <label for="agreement"><strong><span class="warning">(필수)</span> 개인정보 수집/이용에 동의합니다.</strong></label>
                </div>
                <div class="section" data-role="collapsible" data-collapsed="true">
                    <h3>
                        <i><!-- icon --></i>
                    </h3>

                    <div class="padder toggle-box">
                        <pre>맞춤&대량견적 개인정보 수집ㆍ이용 동의

마켓플랜트는 고객님의 개인정보를 보호하기 위하여 「정보통신망 이용 촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」 등 관련 법령상의 개인정보 보호 규정을 준수하고 있으며, 다음과 같이 개인정보를 수집ㆍ이용합니다. 보다 자세한 내용은 『개인정보 취급방침』을 확인하여 주시기 바랍니다.

1. 개인정보 수집 및 이용목적
① 게시물 작성자 정보 확보
② 견적 서비스 제공
③ 맞춤정보 제공 및 통계 분석 등

2. 개인정보 수집항목
① 필수정보 : 성명, 휴대폰 번호, 이메일, 희망금액, 상품대체 여부, 선택한 상품
② 선택정보 : 문의내용

3. 개인정보의 보유 및 이용기간
고객님의 개인정보는 수집목적 또는 제공받은 목적이 달성되거나, 마켓플랜트 쇼핑몰 이용약관에 표명한 절차에 따라 탈퇴를 요청한 경우, 지체없이 파기합니다. 단, 관련 법령에  명시된 아래의 사유에 해당하는 경우에는 해당 기간 종료시까지 개인정보를 보유합니다. 
① 계약 또는 청약철회 등에 관한 기록 : 5년
② 대금결제 및 재화 등의 공급에 관한 기록 : 5년
③ 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
④ 접속에 관한 기록보존 : 3개월
						</pre>
                    </div>
                </div>
            </div><!-- // estimate-guide -->
            <input type="hidden" name="ESM_MST_ESM_TOT_PRICE" id="ESM_MST_ESM_TOT_PRICE" value="<c:out value="${price + optPrice }"/>" />
			
        </div>
        </form>
		
            
        <div class="fixed_btnBox_b" style="display:none;"><!-- fixed_btnBox_b-->
            <a href="javascript:goProcess();" class="button warning full"><span>견적 신청하기</span></a>
        </div><!-- // fixed_btnBox_b-->
			
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
<script type="text/javascript">
	
	goDelete			= function(prd_mst_cd){
		if(confirm("견적 장바구니의 상품을 삭제하시겠습니까?")){
			$.ajax({
				type	: "POST",
    			url		: "/mobile/product/myEstimateDelAjax.do",
    			data	: {"PRD_MST_CDs" : prd_mst_cd},
    			dataType: "json",
    			success : function(data) {
    				alert(data.resultMsg);
    				location.reload();
    			},error : function(err) {
    				window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
    			}
			});
		}
	};
	
	goProcess		= function(){
		<c:choose>
			<c:when test="${totalCount > 0}">
			
		if($("#ESM_MST_MEM_NM").val() == ""){
			alert("이름을 입력하세요.");
			$("#ESM_MST_MEM_NM").focus();
			return;
		}
		
		if($("#ESM_MST_HP2").val() == ""){
			alert("폰 번호를 입력하세요");
			$("#ESM_MST_HP2").focus();
			return;
		}
		
		if($("#ESM_MST_HP3").val() == ""){
			alert("폰 번호를 입력하세요");
			$("#ESM_MST_HP3").focus();
			return;
		}
		
		if($("#ESM_MST_PRD_CHANGE_YN").val() == ""){
			alert("상품대체 가능 여부를 선택하세요.");
			return;
		}
		
		if($("#ESM_MST_MAIL").val() == ""){
			alert("이메일을 입력하세요.");
			$("#ESM_MST_MAIL").focus();
			return;
		}else{
			if(!validateEmail($("#ESM_MST_MAIL").val())){
				alert("유효하지 않은 이메일입니다.");
				$("#ESM_MST_MAIL").focus();
				return;
			}
		}
		
		if($("#ESM_MST_ESM_TOT_PRICE").val() == "" || $("#ESM_MST_ESM_TOT_PRICE").val() == 0){
			alert("선택 된 상품의 값이 0원입니다.");
			return;
		}
		
		if($("#ESM_MST_WSH_TOT_PRICE_INP").val() == ''){
			alert("희망금액을 입력하세요.");
			$("#ESM_MST_WSH_TOT_PRICE_INP").fucus();
			return;
		}
		
		if($("#ESM_MST_WSH_TOT_PRICE").val() == 0){
			alert("희망금액은 0원보다 많아야 합니다.");
			$("#ESM_MST_WSH_TOT_PRICE").fucus();
			return;
		}
		
		if(Number($("#ESM_MST_WSH_TOT_PRICE").val()) > Number($("#ESM_MST_ESM_TOT_PRICE").val())){
			alert("희망금액이 선택 상품 가격보다 많습니다.");
			$("#ESM_MST_WSH_TOT_PRICE").fucus();
			return;
		}
		
		if($("input:checkbox[id='agreement']").is(":checked") == false){
			alert("개인정보 수집에 동의 하셔야 합니다.");
			return;
		}
		
		$("#frm").attr("action", "/mobile/product/myEstimateProcess.do").submit();
			</c:when>
			<c:otherwise>
				alert("견적서에 담긴 상품이 없습니다.");
				return;
			</c:otherwise>
		</c:choose>
	};
	
	$("#ESM_MST_HP2").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
    		var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi,''));
		}

	});

	$("#ESM_MST_HP3").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			$(this).val(inputVal.replace(/[^0-9]/gi,'')); 
		}
	});
		
	$("#ESM_MST_WSH_TOT_PRICE_INP").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			
			var inputVal = $(this).val();
			var inputValRep	= inputVal.replace(/[^0-9]/gi,'');
			
			if(inputValRep <= 0){
				$(this).val('');
    			$("#ESM_MST_WSH_TOT_PRICE").val('');
			}else{
				$(this).val(comma(inputValRep));
    			$("#ESM_MST_WSH_TOT_PRICE").val(inputValRep);	
			}
		}
	});
	
	function validateEmail(email) {
	    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    return re.test(email);
	}
	
	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	pr_list_h	= function(){
		var _li = $('.padder .product-list > li'),
			_h = 0;
		_li.height('');
		$.each(_li, function(i){
			console.log("::::>" + $(this).html());
			var _this_h = $(this).height();
			if(_h < _this_h) _h = _this_h;
		});
		_li.height(_h);
	};//pr_list_h: function(){
		
	$(document).ready(function(){
		//pr_list_h();
	});
	
</script>
<%@ include file="/WEB-INF/jsp/mobile/include/productOptPop.jsp" %>