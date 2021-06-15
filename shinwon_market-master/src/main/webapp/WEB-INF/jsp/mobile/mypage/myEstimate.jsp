<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-mypage">
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
            <h2>MY견적</h2>
            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!-- // section-title -->

        <div class="padder mt20">
            <ul class="list list-a mt10">
                <li>회원님께서 요청하신 나의 맞춤견적, 대량견적 내역을 확인하실 수 있습니다.</li>
            </ul>
        </div>

        <table class="table-d table-col my-estimate" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
        <caption>견적정보, 상태, MD견적횟수로 구성된 나의 견적 목록입니다.</caption>
        <colgroup>
            <col style="width: auto;">
            <col style="width: 22%;">
            <col style="width: 17%;">
        </colgroup>
        <thead>
            <tr>
                <th scope="col">견적정보</th>
                <th scope="col">상태</th>
                <th scope="col">MD<br />견적횟수</th>
            </tr>
        </thead>
        <tbody>
        <c:choose>
			<c:when test="${empty list }">
            <tr>
                <td colspan="3">
                    <p class="no-more">
                        신청한 견적 내역이 없습니다.
                    </p>
                </td>
            </tr>
            </c:when>
            <c:otherwise>
            <c:forEach var="row" items="${list }">
            <tr>
                <td class="text-left">
                	<c:if test="${row.ESM_MST_REG_ID ne row.ESM_MST_MEM_ID  }">
                    <p><span class="label-md">MD추천견적</span></p>
                    </c:if>
                    <p><a href="javascript:;" id="detail" data-esm_mst_idx="<c:out value="${row.ESM_MST_IDX }" />" ><c:out value="${row.ESM_MST_CD }" /></a> / <ui:formatDate value="${row.ESM_MST_REG_DT }" pattern="yyyy.MM.dd"/></p>
                    <p class="subject"><c:out value="${row.PRD_MST_NM }" /></p>
                    <p class="price"><strong>희망금액 : <span class="warning"><fmt:formatNumber value="${row.ESM_MST_WSH_TOT_PRICE }" groupingUsed="true" /></span> 원</strong></p>
                </td>
                <c:choose>
					<c:when test="${row.MEM_MD_BUY_CNT > 0 }">
					<td>
                    	<p><span class="warning">구매승인</span></p>
                    	<p><ui:formatDate value="${row.ESM_PCH_EPT_ST_DT }" pattern="yyyy.MM.dd"/>~<ui:formatDate value="${row.ESM_PCH_EPT_ED_DT }" pattern="yyyy.MM.dd"/></p>
                    	<p><a href="javascript:goPayment('<c:out value="${row.ESM_MST_IDX}"/>');" class="button primary small"><span>바로구매</span></a></p>
                	</td>
                	</c:when>
                	<c:when test="${row.MEM_USE_BUY_CNT > 0 }">
                	<td>
	                    <p>구매결정</p>
	                </td>
                	</c:when>
                	<c:when test="${row.MEM_MD_CNT > 0 }">
                	<td>
	                    <p><span class="warning">견적완료</span></p>
	                </td>
                	</c:when>
                	<c:otherwise>
	                <td>
	                    <p>견적신청</p>
	                </td>
					</c:otherwise>		                
                </c:choose>	
                <td><c:out value="${row.ESM_PCH_CNT }" /></td>
            </tr>
            </c:forEach>
            </c:otherwise>
		</c:choose>
        </tbody>
        </table><!-- // table-d -->

        <form id="frm" name="frm">
       	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
       	<input type="hidden" name="ESM_MST_IDX" id="ESM_MST_IDX" value="" />
			<div class="section-pagination"><!-- section pagination -->
				<ui:frontpaging paging="${paging }" jsFunction="goPage" />
			</div><!-- // section pagination -->
		</form>
			
	</article>
	<!--// #container E -->
	
	<%-- 견적구매용 form --%>
	<form name="paymentform" id="paymentform" method="post"></form>
	
	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->

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
        console.log('_reNum = '+_reNum);
    }else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
}

$(document).ready(function () {
	goPage			= function(cPage){
		$("#cPage").val(cPage);
		$("#frm").attr("action", "<c:out value="${serverSslDomain}" />/mobile/mypage/myEstimate.do").submit();
	};
	
	$(document).on("click", "#detail", function(){
		var esm_mst_idx	= $(this).data("esm_mst_idx");
		$("#ESM_MST_IDX").val(esm_mst_idx);
		$("#frm").attr("action", "<c:out value="${serverSslDomain}" />/mobile/mypage/myEstimateDetail.do").submit();
	});
	
	// 견적상품 바로구매
	function goPayment(esmMstIdx){
        
        $('#paymentform').empty();
		
        if(confirm("견적 주문하시겠습니까?")){
        	$.ajax
            ({
                async : false,
                type : "POST",
                data : {"ESM_MST_IDX" : esmMstIdx},
                url : "<c:out value="${mobileSslDomain}" />/mobile/mypage/insertEstimateOrderAjax.do",
                success : function (data) 
                { 
    				switch (data.result) {
    				case 1:
    					$('#paymentform').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
    					$('#paymentform').attr('action','<c:out value="${mobileSslDomain}" />/mobile/cart/cartpayment.do').submit();
    					break;
    				default :
    					alert(data.resultMsg);
    					break;
    				}
                },
                error : function (err)
                {
                    alert("오류가 발생하였습니다.\n[" + err.status + "]");
                    window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
                }
    		});
        }
	};
});
</script>
</body>
</html>