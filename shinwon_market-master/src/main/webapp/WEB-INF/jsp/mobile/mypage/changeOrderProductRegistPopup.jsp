<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
	<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		<!-- .cate_gnb S -->

        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>교환신청</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <h4 class="title">교환신청정보</h4>
        
        <form name="frm" id="frm">
		<!-- 기존상품 정보 시작 -->
		<input type="hidden" name="ORD_PRD_IDX" value="<c:out value="${commandMap.ORD_PRD_IDX}"/>"/><!-- 기존상품 ORD_PRD_IDX -->
		<input type="hidden" name="ORD_MST_CD" value="<c:out value="${orderInfo.ORD_MST_CD}"/>"/><!-- 주문번호 -->
		<input type="hidden" name="ORD_PRD_MST_CD" value="<c:out value="${changeOrderProductInfo.ORD_PRD_MST_CD}"/>"/><!-- 주문상품 ORD_PRD_MST_CD -->
		<input type="hidden" name="ORD_MST_ORD_NM" value="<c:out value="${orderInfo.ORD_MST_ORD_NM}"/>"/><!-- 주문자 이름 -->
		<input type="hidden" name="ORD_MST_MAIL" value="<c:out value="${orderInfo.ORD_MST_MAIL}"/>"/><!-- 주문자 email -->
		<input type="hidden" name="ORD_MST_ORD_ID" value="<c:out value="${orderInfo.ORD_MST_ORD_ID}"/>"/><!-- 주문자 아이디 -->
		<!-- 기존상품 정보 끝 -->

        <table class="table-a table-col" border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
        <caption>상품정보, 총결제금액, 진행현황으로 구성된 교환신청상품목록입니다.</caption>
        <colgroup>
            <col style="width: auto;">
            <col style="width: 22%;">
        </colgroup>
        <thead>
            <tr>
                <th scope="col">상품정보</th>
                <th scope="col">주문수량</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="text-left">
                    <c:out value="${changeOrderProductInfo.PRD_MST_NM}"></c:out>
                    
                    <c:if test="${not empty changeOrderProductInfo.OPT_DTL_NM or not empty changeOrderProductInfo.subPrdList}">
						<p class="mt10">
							옵션 :
							<c:if test="${not empty changeOrderProductInfo.optionList}">
								<c:out value="${changeOrderProductInfo.OPT_DTL_NM}" />
								<c:if test="${not empty changeOrderProductInfo.subPrdList}">
									&nbsp;/&nbsp;
								</c:if>
							</c:if>
							
							<%-- 선택옵션 상품 리스트 --%>
							<c:if test="${not empty changeOrderProductInfo.subPrdList}">
								<c:forEach var="subPrd" items="${changeOrderProductInfo.subPrdList}" varStatus="i">
									${subPrd.OPT_DTL_NM}
									(
																			<c:if test="${subPrd.OPT_DTL_ADD_PRC gt 0 }">
																				+<fmt:formatNumber value="${subPrd.OPT_DTL_ADD_PRC}" type="number" /> / 
																			</c:if>
																		<fmt:formatNumber value="${subPrd.ORD_PRD_ORD_CNT}" type="number" />개 )
									${i.last ? '' : '/&nbsp;'}	
								</c:forEach>
							</c:if>
						</p>
					</c:if>
                </td>
                <td><fmt:formatNumber value="${changeOrderProductInfo.ORD_PRD_ORD_CNT}" type="number"/></td>
            </tr>
        </tbody>
        </table><!-- // table-a -->
    
        <div class="padder mt10">
            <p class="info">
                주문상품과 동일한 상품/옵션으로  교환가능하며, 다른 상품(옵션)으로 교환 시에는 [고객센터] 또는 [1:1문의]를 통해 문의해 주시기 바랍니다.
            </p>
        </div>

        <h4 class="title">교환사유 (<span class="essential"><em class="blind">필수입력 항목은</em></span> 필수선택 )</h4>

        <table class="table-b table-row" border="0" cellpadding="0" cellspacing="0"><!-- table-b -->
        <caption>사유, 상세사유로 구성된 교환사유 입력 테이블입니다.</caption>
        <colgroup>
            <col style="width: 22%;">
            <col style="width: auto;">
        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><label for="case">사유 <span class="essential"><em class="blind">필수입력</em></span></label></th>
                <td>
                    <label for="SELECT_REASON" class="sel_box_st0">
                        <select id="SELECT_REASON" name="SELECT_REASON" class="select">
	                        <option value="">사유를 선택해 주세요</option>
	                        <c:if test="${not empty codes.ORDER_CANCEL_RETURN_REASON }">
	                            <c:forEach var="row" items="${codes.ORDER_CANCEL_RETURN_REASON }">
	                                <option value="<c:out value="${row.CMN_COM_IDX }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
	                            </c:forEach>
	                        </c:if>
	                    </select>
                    </label>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="ORD_PRD_DSC">상세사유</label></th>
                <td>
                    <textarea name="ORD_PRD_DSC" id="ORD_PRD_DSC" class="textarea" onkeyup="getStrByte(this,'#byte', 400, 2);" placeholder="200자 이내로 입력하세요" title="200자 이내로 입력하세요"></textarea>
                </td>
            </tr>
        </tbody>
        </table><!-- // table-b -->

        <div class="section-button"><!-- section-button -->
            <a href="javascript:;" id="goRegist" class="button warning"><span>교환신청</span></a>
            <a href="javascript:history.back(); return false;" class="button primary"><span>취소</span></a>
        </div><!-- // section-button -->


        <div class="order-guide accordion mt30" data-role="collapsible-set"><!-- order-guide -->
            <div class="section" data-role="collapsible" data-collapsed="false">
                <h3>
                    <strong>교환/반품 이용안내</strong>
                    <i><!-- icon --></i>
                </h3>

                <div class="toggle-box">

                    <div class="holder">
                        <p>
                            <strong>교환/반품 사유가 구매자 책임인 경우 최초 발송 비용을 포함한 왕복 배송비가 부과될 수 있습니다.</strong>
                        </p>
                    </div>

                    <h4>교환/반품비용 구매자 부담</h4>

                    <div class="holder">
                        <ul class="list list-a">
                            <li>상품에 이상은 없으나 구매의사 없음</li>
                            <li>옵션을 잘못 선택함</li>
                        </ul>
                    </div>

                    <h4>교환/반품비용 쇼핑몰 부담</h4>

                    <div class="holder">
                        <ul class="list list-a">
                            <li>상품에 결함이 있음</li>
                            <li>도착한 상품이 상품상세 정보와 다름</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div><!-- // order-guide -->
        
        </form>
        
        <!-- 모바일인 경우 필요한 정보 시작 -->
        <form name="searchForm" id="searchForm">
        	<input type="hidden" name="ORD_MST_CD" value="<c:out value="${orderInfo.ORD_MST_CD}"/>"/><!-- 주문번호 -->
			<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
	        <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
	        <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	        <input type="hidden" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
	        <input type="hidden" name="searchState" value="<c:out value="${commandMap.searchState }"/>"/>
        </form>
		<!-- 모바일인 경우 필요한 정보 끝 -->
			
	</article>
	<!--// #container E -->

	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
</section>
<!--// #wrap E -->

<script>
//<![CDATA[
$(document).ready(function () {
	var $frm = $("#frm"); 
	
	// 폼체크
    $("#frm").validate({
        rules: {
            SELECT_REASON:{required:true} // 사유
            //,ORD_PRD_DSC :{required:true} // 상세사유
        },
        messages :{
            SELECT_REASON : {required:"사유를 선택해 주십시오."}
            //, ORD_PRD_DSC : {required:"상세사유를 입력해 주십시오."}
        }
     	//,ignore: ":hidden"
        ,onkeyup:false
 	    ,onclick:false
 	    ,onfocusout:false
        ,showErrors:function(errorMap, errorList){
 	       if(this.numberOfInvalids()) { 
 	    	   //var caption = $(errorList[0].element).attr('caption') || $(errorList[0].element).attr('id');
 	    	   //alert('[' + caption + '] ' + errorList[0].message);
 	    	   var errorOobjId = $(errorList[0].element).attr('id');
 	    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
 	    	   caption = caption.replace('*','').replace(/\s/gi,'');
 	    	   if(caption != null && caption != "") 
 	    	   {
 	    	       alert('[' + caption + '] ' + errorList[0].message);
 	    	   }
 	    	   else
 	    	   {
 	    	       alert(errorList[0].message);
 	    	   }
 	    	   $(errorList[0].element).focus();
 	       }
 	   }
    });
	
	// 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        if($frm.valid()){
            if (confirm( "교환신청 하시겠습니까?")) {
            	$.ajax({
            		type: "post",
            		url : "<c:out value="${mobileSslDomain}"/>/mobile/mypage/changeOrderProductProcAjax.do",
            		data : $frm.serialize(),
            		dataType : "json",
            		async : false,
            		success : function(data){    			
            			// 0 이상 : 성공
            			alert(data.resultMsg);
            		
            			if(data.result > 0){
            				location.replace("<c:out value="${mobileSslDomain}"/>/mobile/mypage/myShoppingInfo.do?"+$("#searchForm").serialize());
            			}
            		},
            		error : function(error){
            			alert(error);
            		}
            	});
            }
        }
    });
	
});
//]]>
</script>

</body>
</html>    