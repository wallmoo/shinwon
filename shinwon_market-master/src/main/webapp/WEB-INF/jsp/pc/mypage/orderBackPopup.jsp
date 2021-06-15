<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="page-popup">

<div id="popContainer"><!-- popContainer -->

    <h1 class="title">반품신청 </h1>

    <div id="popWrapper" class="order-change"><!-- popWrapper -->

        <h2 class="title">반품상품정보</h2>
        
        <form id="frm" name="frm">
	        <input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="${commandMap.ORD_MST_CD }" />
	        <input type="hidden" id="ORD_PRD_ORD_STATE" name="ORD_PRD_ORD_STATE" value="${commandMap.ORD_PRD_ORD_STATE }" />
	        <input type="hidden" id="ORD_PRD_IDX_ARR" name="ORD_PRD_IDX_ARR" value="${commandMap.ORD_PRD_IDX_ARR }"/>

        <table class="table-product"><!-- table-product -->
        <caption>상품정보, 총결제금액, 진행현황으로 구성된 주문상품 목록입니다.</caption>
        <colgroup>
            <col style="width: auto;" />
            <col style="width: 100px;" />
            <col style="width: 100px;" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col"><span>상품정보</span></th>
                <th scope="col"><span>결제금액</span></th>
                <th scope="col"><span>진행현황</span></th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="row" items="${orderProductList }">
	            <tr>
	                <td class="product">
	                    <div class="item">
	                        <div class="thumb">
	                        	<a href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');">
									<img src="<c:out value="${cdnDomain }${row.PRODUCT_THUM_IMG}"/>"
									class="thumb84" alt="${row.PRD_IMAGE_ALT}" />
								</a>
	                        </div>
	                        <div class="core">
	                            <p class="subject">
	                                <a href="javascript:goProductView('<c:out value="${row.ORD_PRD_MST_CD }" />');;"><c:out value="${row.PRD_MST_NM}" /></a>
	                            </p>
		                        <c:if test="${not empty row.OPT_DTL_NM or not empty row.subPrdList}">
									<div class="option dotum">
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
									</div>
								</c:if>
	                        </div>
	                    </div>
	                </td>
	                <td class="price">
	                    <p><span><fmt:formatNumber value="${row.ORD_PRD_ORD_PRC + row.SUM_SUB_OPTION_ADD_PRC}" type="number" /></span>원</p>
	                </td>
	                <td class="step">
	                    <p><c:out value="${row.ORD_PRD_ORD_STATE_NM }" /></p>
	                </td>
	            </tr>
            </c:forEach>
        </tbody>
        </table><!-- // table-product -->

        <p class="message notice-b mt10">
            주문상품 중 일부 상품만 반품하실 경우에는 [고객센터] 또는 [1:1문의]를 통해 문의해 주시기 바랍니다.
        </p>

        <h2 class="title">반품사유( <span class="essential"><em class="blind">필수입력 표시는</em></span> 필수선택 )</h2>

        <table class="table-a table-col"><!-- table-a -->
        <caption>사유, 결제금액, 상세사유로 구성된 취소사유 정보 입력 테이블입니다.</caption>
        <colgroup>
            <col style="width: 140px;" />
            <col style="width: auto;" />
        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><label for="SELECT_REASON">사유 <span class="essential"><em class="blind">필수입력</em></span></label></th>
                <td>
                	<select id="SELECT_REASON" name="SELECT_REASON" class="sel_chg">
                        <option value="">사유를 선택해 주세요</option>
                        <c:if test="${not empty codes.ORDER_CANCEL_RETURN_REASON }">
                            <c:forEach var="row" items="${codes.ORDER_CANCEL_RETURN_REASON }">
                                <option value="<c:out value="${row.CMN_COM_IDX }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
                            </c:forEach>
                        </c:if>
                    </select>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="ORD_PRD_DSC">상세사유</label></th>
                <td>
                    <textarea name="ORD_PRD_DSC" id="ORD_PRD_DSC" class="textarea" onkeyup="getStrByte(this,'#byte', 400, 2);" style="height: 80px;" placeholder="200자 이내로 입력하세요" title="200자 이내로 입력하세요"></textarea>
                </td>
            </tr>
        </tbody>
        </table><!-- // table-a -->
		
		<c:if test="${orderPayInfo.ORD_MST_PAY_DT ne '00000000000000' and (orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_DEPOSIT or orderPayInfo.ORD_MST_PAY_TYPE eq Code.PAY_ESCROW)}">
	        <h2 class="title">환불계좌( <span class="essential"><em class="blind">필수입력 표시는</em></span> 필수선택 )</h2>
	
	        <table class="table-a table-col"><!-- table-a -->
	        <caption>환불방식, 환불은행, 계좌번호, 예금주명으로 구성된 환불계좌정보 입력 테이블입니다.</caption>
	        <colgroup>
	            <col style="width: 140px;" />
	            <col style="width: auto;" />
	        </colgroup>
	        <tbody>
	            <tr>
	                <th scope="row">환불방식 <span class="essential"><em class="blind">필수입력</em></span></th>
	                <td>무통장입금</td>
	            </tr>
	            <tr>
	                <th scope="row"><label for="ORD_MST_RFD_CD">환불은행 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                <td>
	                    <select id="ORD_MST_RFD_CD" name="ORD_MST_RFD_CD" class="sel_chg">
	                        <option value="">선택</option>
	                        <c:forEach var="item" items="${depositBankList }">
								<option value="${item.CMN_COM_ETC1 }">${item.CMN_COM_NM }</option>
							</c:forEach>
	                    </select>
	                </td>
	            </tr>
	            <tr>
	                <th scope="row"><label for="ORD_MST_RFD_ACT">계좌번호 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                <td>
	                    <input type="text" id="ORD_MST_RFD_ACT" name="ORD_MST_RFD_ACT" class="text large" maxlength="20"/>
	                </td>
	            </tr>
	            <tr>
	                <th scope="row"><label for="ORD_MST_RFD_HDR">예금주명 <span class="essential"><em class="blind">필수입력</em></span></label></th>
	                <td>
	                    <input type="text" id="ORD_MST_RFD_HDR" name="ORD_MST_RFD_HDR" class="text" value="<c:out value="${orderPayInfo.ORD_MST_ORD_NM }"/>"/>
	                </td>
	            </tr>
	        </tbody>
	        </table><!-- // table-a -->
        </c:if>
        </form>

        <div class="section-button"><!-- section-button -->
            <a href="javascript:;" id="goConfirm" class="btn_st1 btn_blk large"><span>반품신청</span></a>
            <a href="javascript:self.close();" class="btn_st1 btn_white large"><span>취소</span></a>
        </div><!-- // section-button -->

        <h3 class="title">교환/반품 이용안내</h3>

        <ul class="list list-a small">
            <li>교환/반품 사유가 구매자 책임인 경우 최초 발송 비용을 포함한 왕복 배송비가 부과될 수 있습니다.</li>
        </ul>

        <table class="table-a table-col mt20"><!-- table-a -->
        <caption>교환/반품비용 구매자 부담, 교환/반품비용 쇼핑몰 부담으로 구성된 교환/반품 이용안내 테이블입니다.</caption>
        <colgroup>
            <col style="width: 50%;" />
            <col style="width: auto;" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col"><span>교환/반품비용 구매자 부담</span></th>
                <th scope="col"><span>교환/반품비용 쇼핑몰 부담</span></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <ul class="list list-b small">
                        <li>상품에 이상은 없으나 구매의사 없음</li>
                        <li>옵션을 잘못 선택함</li>
                    </ul>
                </td>
                <td>
                    <ul class="list list-b small">
                        <li>상품에 결함이 있음</li>
                        <li>도착한 상품이 상품상세 정보와 다름</li>
                    </ul>
                </td>
            </tr>
        </tbody>
        </table><!-- // table-a -->

    </div><!-- // popWrapper -->
</div><!-- // popContainer -->

<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>

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
            		$frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/orderStateProc.do", "target":"_self", "method":"post"}).submit();
            	}
            }
        }
        else
        {
            alert("[주문취소]선택된 주문번호가 없습니다.");
        }
    });
    
  //간편보기
	goProductView = function(prdMstCd){
		if(prdMstCd != ""){
			popup('<c:out value="${frontDomain}"/>/pc/product/productSimpleView.do?prdMstCd='+prdMstCd,"1030","900","no","productViewPopup");
		}else{
			alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
			return;
		}
	};
});
</script>
</body>
</html>