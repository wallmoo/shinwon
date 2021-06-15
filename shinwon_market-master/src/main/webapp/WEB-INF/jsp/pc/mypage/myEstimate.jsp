<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-mypage">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
    <!-- #header S -->
   	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
    <!--// #header S -->
    
    <!-- #container S -->
    <article id="container" class="container">
        <div class="minW contents"><!-- contents S -->

            <dl class="loc">
                <dt class="blind">현제 카테고리 경로</dt>
	            <dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="ico_home"><span class="ir">홈</span></a></dd>
	            <dd><a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do"><span>마이페이지</span></a></dd>
                <dd><a href="javascript:void(0)"><span>쇼핑활동</span></a></dd>
                <dd class="l"><a href="<c:out value="${serverSslDomain }"/>/pc/mypage/myEstimate.do"><span>MY견적</span></a></dd>
            </dl>

            <%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>

            <div id="body"><!-- #body -->

                <h3 class="title">MY견적</h3>

                <p class="message notice-b mt30">
                    회원님께서 요청하신 나의 맞춤견적, 대량견적 내역을 확인하실 수 있습니다.
                </p>

                <table class="table-a table-my mt10 "><!-- table-a -->
                <caption>견적번호, 상품명, 희망금액, 신청일, 상태, MD견적횟수, 최종 확정일로 구성된 MY견적 목록입니다.</caption>
                <colgroup>
                    <col style="width: 18%;" />
                    <col style="width: auto;" />
                    <col style="width: 14%;" />
                    <col style="width: 10%;" />
                    <col style="width: 10%;" />
                    <col style="width: 12%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"><span>견적번호</span></th>
                        <th scope="col"><span>상품명</span></th>
                        <th scope="col"><span>희망금액</span></th>
                        <th scope="col"><span>신청일</span></th>
                        <th scope="col"><span>상태</span></th>
                        <th scope="col"><span>MD견적횟수</span></th>
                        <th scope="col"><span>최종 확정일</span></th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
                	<c:when test="${empty list }">
                	<tr>
                        <td colspan="7">
                            <p class="message no-more">요청하신 견적이 없습니다.</p>
                        </td>
                    </tr>
                	</c:when>
                	<c:otherwise>
                    <c:forEach var="row" items="${list }">
                    <tr>
                        <td class="estimate-number">
                        	<c:if test="${row.ESM_MST_REG_ID ne row.ESM_MST_MEM_ID  }">
                            <p>
                                <span class="badge md">MD추천견적</span>
                            </p>
                            </c:if>
                            <a href="javascript:;" id="detail" data-esm_mst_idx="<c:out value="${row.ESM_MST_IDX }" />" ><c:out value="${row.ESM_MST_CD }" /></a>
                        </td>
                        <td class="subject ac">
                            <a href="javascript:void(0)"><ui:shortTitle title="${row.PRD_MST_NM }" length="40" /></a>
                        </td>
                        <td class="price">
                            <p class="primary"><strong class="warning large14"><fmt:formatNumber value="${row.ESM_MST_WSH_TOT_PRICE }" groupingUsed="true" /></strong>원</p>
                        </td>
                        <td class="date"><ui:formatDate value="${row.ESM_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
                        <td class="condition">
                        	<c:choose>
                            	<c:when test="${row.MEM_MD_BUY_CNT > 0 }">
                        	<p class="large13 warning">구매승인</p>
                            <p class="large13 warning"><a href="javascript:goPayment('<c:out value="${row.ESM_MST_IDX}"/>');" class="btn_st0 btn_blk777 xsmall"><span>바로구매</span></a></p>
                            <p class="small primary">
                                <strong>견적 유효기간</strong><br />
                                <ui:formatDate value="${row.ESM_PCH_EPT_ST_DT }" pattern="yyyy.MM.dd"/><br />~<ui:formatDate value="${row.ESM_PCH_EPT_ED_DT }" pattern="yyyy.MM.dd"/>
                            </p>
                            	</c:when>
                            	<c:when test="${row.MEM_USE_BUY_CNT > 0 }">
                            <p class="large13 primary">구매결정</p>	
                            	</c:when>
                            	<c:when test="${row.MEM_MD_CNT > 0 }">
                            <p class="large13 warning">견적완료</p>	
                            	</c:when>
                            	<c:otherwise>
                            <p class="large13 primary">견적신청</p>
                            	</c:otherwise>
							</c:choose>                            	
                        </td>
                        <td class="count"><c:out value="${row.ESM_PCH_CNT }" /></td>
                        <td class="date"><ui:formatDate value="${row.ESM_PCH_REG_DT }" pattern="yyyy.MM.dd"/></td>
                    </tr>
                    </c:forEach>
                    </c:otherwise>
                </c:choose>
                
                </tbody>
                </table><!-- // table-a -->

                <div class="section-pagination"><!-- section pagination -->
                   <ui:frontpaging paging="${paging }" jsFunction="goPage" />
                </div><!-- // section pagination -->

            </div><!-- // #body -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	
	<%-- 견적구매용 form --%>
	<form name="paymentform" id="paymentform" method="post"></form>

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	<form name="frm" id="frm">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${paging.cPage }" />" />
	<input type="hidden" name="ESM_MST_IDX" id="ESM_MST_IDX" value="" />
	</form>
	<script type="text/javascript">
	
		goPage			= function(cPage){
			$("#cPage").val(cPage);
			$("#frm").attr("action", "<c:out value="${serverSslDomain}" />/pc/mypage/myEstimate.do").submit();
		};
		
		$(document).on("click", "#detail", function(){
			var esm_mst_idx	= $(this).data("esm_mst_idx");
			$("#ESM_MST_IDX").val(esm_mst_idx);
			$("#frm").attr({"action": "<c:out value="${serverSslDomain}" />/pc/mypage/myEstimateDetail.do", "target": "_self" , "method" : "post"}).submit();
			//$("#frm").attr("action", "<c:out value="${frontDomain}" />/pc/mypage/myEstimateDetail.do").submit();
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
	                url : "<c:out value="${serverSslDomain}" />/pc/mypage/insertEstimateOrderAjax.do",
	                success : function (data) 
	                { 
	    				switch (data.result) {
	    				case 1:
	    					$('#paymentform').append("<input type=\"hidden\" name=\"ORD_MST_CD\" value=\""+ data.ORD_MST_CD +"\">");
	    					$('#paymentform').attr('action','<c:out value="${serverSslDomain}" />/pc/cart/cartpayment.do').submit();
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
	</script>
</section>
<!--// #wrap E -->
</body>
</html>