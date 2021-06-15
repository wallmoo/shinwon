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
            <h2>반품신청</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <h4 class="title">반품상품정보</h4>
        
        <form id="frm" name="frm">
	        <input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="${commandMap.ORD_MST_CD }" />
	        <input type="hidden" id="ORD_PRD_ORD_STATE" name="ORD_PRD_ORD_STATE" value="${commandMap.ORD_PRD_ORD_STATE }" />
	        <input type="hidden" id="ORD_PRD_IDX_ARR" name="ORD_PRD_IDX_ARR" value="${commandMap.ORD_PRD_IDX_ARR }"/>

        <table class="table-a table-col" border="0" cellpadding="0" cellspacing="0"><!-- table-a -->
        <caption>상품정보, 총결제금액, 진행현황으로 구성된 반품상품정보목록입니다.</caption>
        <colgroup>
            <col style="width: auto;">
            <col style="width: 22%;">
            <col style="width: 20%;">
        </colgroup>
        <thead>
            <tr>
                <th scope="col">상품정보</th>
                <th scope="col">총결제금액</th>
                <th scope="col">진행현황</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="row" items="${orderProductList }">
        		<tr>
	                <td class="text-left">
	                    <c:out value="${row.PRD_MST_NM}" />
	                    <c:if test="${not empty row.OPT_DTL_NM or not empty row.subPrdList}">
							<p class="mt10">
								옵션 :
								<c:if test="${not empty row.optionList}">
									<c:out value="${row.OPT_DTL_NM}" />
									<c:if test="${not empty row.subPrdList}">
										&nbsp;/&nbsp;
									</c:if>
								</c:if>
								
								<%-- 선택옵션 상품 리스트 --%>
								<c:if test="${not empty row.subPrdList}">
									<c:forEach var="subPrd" items="${row.subPrdList}" varStatus="i">
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
	                <td><fmt:formatNumber value="${row.ORD_PRD_ORD_PRC + row.SUM_SUB_OPTION_ADD_PRC}" type="number" />원</td>
	                <td><c:out value="${row.ORD_PRD_ORD_STATE_NM }" /></td>
	            </tr>
        	</c:forEach>
        </tbody>
        </table><!-- // table-a -->
    
        <div class="padder mt10">
            <p class="info">
                주문상품 중 일부 상품만 반품하실 경우에는 [고객센터] 또는 [1:1문의]를 통해 문의해 주시기 바랍니다.
            </p>
        </div>

        <h4 class="title">반품사유 (<span class="essential"><em class="blind">필수입력 항목은</em></span> 필수선택 )</h4>

        <table class="table-b table-row" border="0" cellpadding="0" cellspacing="0"><!-- table-b -->
        <caption>사유, 상세사유로 구성된 반품사유 입력 테이블입니다.</caption>
        <colgroup>
            <col style="width: 22%;">
            <col style="width: auto;">
        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><label for="SELECT_REASON">사유 <span class="essential"><em class="blind">필수입력</em></span></label></th>
                <td>
                    <label for="case" class="sel_box_st0">
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
                <th scope="row"><label for="caseDetail">상세사유</label></th>
                <td>
                    <textarea name="ORD_PRD_DSC" id="ORD_PRD_DSC" onkeyup="getStrByte(this,'#byte', 400, 2);" class="textarea" placeholder="200자 이내로 입력하세요" title="200자 이내로 입력하세요"></textarea>
                </td>
            </tr>
        </tbody>
        </table><!-- // table-b -->

		<c:if test="${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000' and (orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW)}">
	        <h4 class="title">환불계좌 (<span class="essential"><em class="blind">필수입력 항목은</em></span> 필수선택 )</h4>
	
	        <table class="table-c table-row" border="0" cellpadding="0" cellspacing="0"><!-- table-b -->
	        <caption>환불방식, 환불은행, 계좌번호, 예금주명으로 구성된 환불계좌 입력 테이블입니다.</caption>
	        <colgroup>
	            <col style="width: 25%;">
	            <col style="width: auto;">
	        </colgroup>
	        <tbody>
	            <tr>
	                <th scope="row">환불방식</th>
	                <td>무통장입금</td>
	            </tr>
	            <tr>
	                <th scope="row"><label for="ORD_MST_RFD_CD">환불은행 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                <td>
	                	<label for="ORD_MST_RFD_CD" class="sel_box_st0">
		                    <select id="ORD_MST_RFD_CD" name="ORD_MST_RFD_CD" class="select">
		                        <option value="">선택</option>
		                        <c:forEach var="item" items="${depositBankList }">
									<option value="${item.CMN_COM_ETC1 }">${item.CMN_COM_NM }</option>
								</c:forEach>
		                    </select>
	                    </label>
	                </td>
	            </tr>
	            <tr>
	                <th scope="row"><label for="ORD_MST_RFD_ACT">계좌번호 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                <td>
	                	<input type="text" id="ORD_MST_RFD_ACT" name="ORD_MST_RFD_ACT" class="text full" maxlength="20"/>
	                </td>
	            </tr>
	            <tr>
	                <th scope="row"><label for="ORD_MST_RFD_HDR">예금주명 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                <td>
	                    <input type="text" id="ORD_MST_RFD_HDR" name="ORD_MST_RFD_HDR" class="text full" value="<c:out value="${orderPayInfo.ORD_MST_ORD_NM }"/>"/>
	                </td>
	            </tr>
	        </tbody>
	        </table><!-- // table-b -->
        </c:if>
        
        </form>

        <div class="section-button"><!-- section-button -->
            <a href="javascript:;" id="goConfirm" class="button warning"><span>반품신청</span></a>
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

            <div class="section" data-role="collapsible" data-collapsed="true">
                <h3>
                    <strong>결제수단별 환불안내</strong>
                    <i><!-- icon --></i>
                </h3>

                <div class="toggle-box">
                    <h4>신용카드</h4>

                    <div class="holder">
                        <ul class="list list-a">
                            <li>승인취소 : 신용카드 승인취소는 매입이 되기 전이기 때문에 승인한 당일 취소됩니다.</li>
                            <li>매입취소 : 카드사로 매입취소 신청을 하면 카드사에서 취소처리를 하는데 1~2주 정도 소요 됩니다.<br />
                              (카드사별 취소 반영이 차이가 있습니다. 각 카드사 홈페이지에서 확인 가능합니다.)
                            </li>
                        </ul>
                    </div>

                    <h4>실시간계좌이체</h4>

                    <div class="holder">
                        <ul class="list list-a">
                            <li>익일에 실시간 계좌이체가 진행된 고객님의 계좌로 직접 환불됩니다.</li>
                        </ul>
                    </div>

                    <h4>무통장입금</h4>

                    <div class="holder">
                        <ul class="list list-a">
                            <li>고객센터 해피콜 이후, 고객님의 취소신청 시 입력된 환불계좌로 2~3일 이내 환불됩니다. </li>
                        </ul>
                    </div>

                    <h4>OK캐쉬백 포인트</h4>

                    <div class="holder">
                        <ul class="list list-a">
                            <li>전액환불 : OK캐쉬백 포인트를 사용하신 주문이 전체취소시 즉시 환불됩니다. </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div><!-- // order-guide -->
			
	</article>
	<!--// #container E -->
	
	<!-- 모바일인 경우 필요한 정보 시작 -->
    <form name="searchForm" id="searchForm">
    	 <input type="hidden" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD}"/>"/><!-- 주문번호 -->
		 <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
	     <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
	     <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
	     <input type="hidden" name="searchCancelBack" value="<c:out value="${commandMap.searchCancelBack }"/>"/>
	     <input type="hidden" name="searchState" value="<c:out value="${commandMap.searchState }"/>"/>
    </form>
	<!-- 모바일인 경우 필요한 정보 끝 -->

	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
</section>
<!--// #wrap E -->

<script>
$(function() {
	
    // 폼체크
    $("#frm").validate({
        rules: {
            SELECT_REASON:{required:true} // 사유
            //,ORD_PRD_DSC :{required:true} // 상세사유
            ,ORD_MST_RFD_CD :{required:true} // 환불은행
            ,ORD_MST_RFD_ACT :{required:true, number:true} // 계좌번호
            ,ORD_MST_RFD_HDR :{required:true} // 예금주명
        },
        messages :{
            SELECT_REASON : {required:"사유를 선택해 주십시오."}
            //, ORD_PRD_DSC : {required:"상세사유를 입력해 주십시오."}
            ,ORD_MST_RFD_CD :{required:"환불은행을 입력해 주십시오."} // 환불은행
            ,ORD_MST_RFD_ACT :{required:"계좌번호를 입력해 주십시오.",number:"계좌번호는 숫자만 입력해 주십시오."} // 계좌번호
            ,ORD_MST_RFD_HDR :{required:"예금주명을 입력해 주십시오."} // 예금주명
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

    // 확인 버튼 클릭 이벤트
    $(document).on("click", "#goConfirm", function () {
    	
    	var value = $("#ORD_MST_CD").val();
    	var $frm = $("#frm");
        
        if(value != "")
        {
            if($frm.valid())
            {
            	if(confirm("반품 신청하시겠습니까?")){
            		$.ajax({
                		type: "post",
                		url : "<c:out value="${mobileSslDomain}"/>/mobile/mypage/orderStateProcAjax.do",
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
        }
        else
        {
            alert("[주문취소]선택된 주문번호가 없습니다.");
        }
    });
});
</script>

</body>
</html>    