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
                <caption>견적번호, 상품명, 신청일, 상태, MD견적횟수, 확정일로 구성된 견적 상세 정보 테이블입니다.</caption>
                <colgroup>
                    <col style="width: 18%;" />
                    <col style="width: auto;" />
                    <col style="width: 10%;" />
                    <col style="width: 16%;" />
                    <col style="width: 11%;" />
                    <col style="width: 10%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"><span>견적번호</span></th>
                        <th scope="col"><span>상품명</span></th>
                        <th scope="col"><span>신청일</span></th>
                        <th scope="col"><span>상태</span></th>
                        <th scope="col"><span>MD견적횟수</span></th>
                        <th scope="col"><span>확정일</span></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="estimate-number"><c:out value="${info.ESM_MST_CD }" /></td>
                        <td class="subject ac">
                            <a href="javascript:;"><ui:shortTitle title="${info.PRD_MST_NM }" length="40" /></a>
                        </td>
                        <td class="date"><ui:formatDate value="${info.ESM_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
                         <td class="condition">
                        	<c:choose>
                            	<c:when test="${info.MEM_MD_BUY_CNT > 0 }">
                        	<p class="large13 warning">구매승인</p>
                            <p class="large13 warning"><c:if test="${info.STA eq 'ing' }" ><a href="javascript:goPayment('<c:out value="${info.ESM_MST_IDX}"/>');" class="btn_st0 btn_blk777 xsmall"></c:if><c:if test="${info.STA eq 'end'}" ><a href="javascript:alert('바로구매는  견적유효간에만 구매 하실 수 있습니다.');"  class="btn_st0 btn_blk777 xsmall"></c:if><span>바로구매</span></a></p>
                            <p class="small primary">
                                <strong>견적 유효기간</strong><br />
                                <ui:formatDate value="${info.ESM_PCH_EPT_ST_DT }" pattern="yyyy.MM.dd"/><br />~<ui:formatDate value="${info.ESM_PCH_EPT_ED_DT }" pattern="yyyy.MM.dd"/>
                            </p>
                            	</c:when>
                            	<c:when test="${info.MEM_USE_BUY_CNT > 0 }">
                            <p class="large13 primary">구매결정</p>	
                            	</c:when>
                            	<c:when test="${info.MEM_MD_CNT > 0 }">
                            <p class="large13 warning">견적완료</p>	
                            	</c:when>
                            	<c:otherwise>
                            <p class="large13 primary">견적신청</p>
                            	</c:otherwise>
							</c:choose>                            	
                        </td>
                        <td class="count"><c:out value="${info.ESM_PCH_CNT }" /></td>
                        <td class="date"><ui:formatDate value="${info.ESM_PCH_REG_DT }" pattern="yyyy.MM.dd"/></td>
                    </tr>
                </tbody>
                </table><!-- // table-a -->
				
                <h4 class="title">견적 신청 내역 (<span class="warning" id="topCnt">0</span><em class="blind">개</em>)</h4>

                <table class="table-a table-my table-estimate"><!-- table-a -->
                <caption>NO, 상품명, 옵션내용, 수량, 상품가격으로 구성된 견적 신청 내역 목록입니다.</caption>
                <colgroup>
                    <col style="width: 10%;" />
                    <col style="width: 52%;" />
                    <col style="width: 14%;" />
                    <col style="width: 8%;" />
                    <col style="width: 16%;" />
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col"><span>NO</span></th>
                        <th scope="col"><span>상품명</span></th>
                        <th scope="col"><span>옵션내용</span></th>
                        <th scope="col"><span>수량</span></th>
                        <th scope="col"><span>상품가격</span></th>
                    </tr>
                </thead>
                <tfoot>
                    <tr class="price-total">
                        <th scope="row" colspan="3">총합계 </th>
                        <td colspan="2"><fmt:formatNumber value="${info.ESM_MST_ESM_TOT_PRICE }" groupingUsed="true" /></td>
                    </tr>
                    <tr class="price-want">
                        <th scope="row" colspan="3">견적희망가격</th>
                        <td colspan="2"><fmt:formatNumber value="${info.ESM_MST_WSH_TOT_PRICE }" groupingUsed="true" /></td>
                    </tr>
                </tfoot>
                <tbody>
                <c:set var="topListNum" value="0" />
                <c:set var="topPrice" value="0" />
                <c:forEach var="topRow" items="${toplist}" varStatus="topSta">
                	<tr>
                        <td class="number"><c:out value="${topSta.count }" /></td>
                        <td class="subject">
                            <a href="<c:out value="${serverDoamin }" />/pc/product/product.do?prdMstCd=<c:out value="${topRow.PRD_MST_CD }" />"><c:out value="${topRow.PRD_MST_NM }" /></a>
                        </td>
                        <td class="option"><c:out value="${topRow.OPT_DTL_NM }" /></td>
                        <td class="amount"><c:out value="${topRow.ESM_PRD_CNT }" /></td>
                        <td class="price">
                            <strong class="primary large14">-</strong>
                        </td>
                    </tr>
                    <c:set var="topListNum" value="${topSta.count }" />
                </c:forEach>
                
                <c:if test="${not empty toplist}">
                <script type="text/javascript">
                	$("#topCnt").text("<c:out value="${topListNum}" />");
                </script>
                </c:if>
                </tbody>
                </table><!-- // table-a -->
                
				<c:set var="OLD_ESM_PRD_PCH_IDX" value="" />
				<c:set var="listNum" value="1" />
				<c:set var="no" value="${info.ESM_PCH_CNT }" />
				<c:set var="SUM_ESM_PRD_WSH_PRICE" value="" />
				<c:set var="SUM_ESM_PRD_ESM_PRICE" value="" />
				<c:set var="SALE" value="" />
				<c:set var="ESM_PCH_EPT_ST_DT" value="" />
				<c:set var="ESM_PCH_EPT_ED_DT" value="" />
				<c:set var="MEM_MD_BUY_CNT" value="0" />
				<c:set var="MEM_USE_BUY_CNT" value="0" />
				<c:set var="MEM_MD_BUY_CNT" value="0" />
				<c:forEach var="row" items="${list }" varStatus="sta">
					<c:choose>
						<c:when test="${row.ESM_PRD_PCH_IDX ne OLD_ESM_PRD_PCH_IDX}">
							<c:if test="${no ne info.ESM_PCH_CNT }">
							</tbody>
                    </table><!-- // table-b -->                    
                
                <c:if test="${MEM_MD_BUY_CNT > 0 }">
               	<p class="message notice-b mt10">요청하신 견적서의 구매승인이 완료되었습니다.</p>
                <p class="message notice-b">견적 유효기간을 꼭 확인해 주시고, 유효기간 중에 아래 ‘바로구매’를 선택하여 주문해주세요.</p>
                </c:if>
                
                <div class="estimate-price"><!-- estimate-price -->
                    <ul>
                        <li>
                            <span class="tit">상품가격</span>
                            <span class="price"><strong><fmt:formatNumber value="${SUM_ESM_PRD_WSH_PRICE }" groupingUsed="true" /></strong>원</span>
                        </li>
                        <li>
                            <span class="tit">MD견적가</span>
                            <span class="price"><strong class="warning"><fmt:formatNumber value="${SUM_ESM_PRD_ESM_PRICE }" groupingUsed="true" /></strong>원</span>
                        </li>
                    </ul>
                    <p class="sale">
                        <strong><c:out value="${SALE }" /></strong>% 할인
                    </p>
                </div><!-- // estimate-price -->

                <p class="mt10 large13"> 위 견적서로 구매 원하시는 경우 ‘구매결정’을 선택해주세요. MD의 구매승인 후에 바로구매로 구매가 가능합니다.</p>
                </div><!-- // toggle -->    
			</div><!-- // estimate-toggler -->                
				<!-- section-button -->
				<!-- 
                <div class="section-button mt30">
                	<c:if test="${MEM_USE_BUY_CNT > 0}">
                    <a href="javascript:;" class="btn_st2 info xlarge"><span>구매 결정</span></a>
                    </c:if>
                    <c:if test="${MEM_MD_BUY_CNT > 0 }">
                   		<c:if test="${info.STA eq 'ing' }" ><a href="javascript:goPayment('<c:out value="${info.ESM_MST_IDX}"/>');" class="btn_st2 btn_rd xlarge"></c:if>
                   		<c:if test="${info.STA eq 'end'}" ><a href="javascript:alert('바로구매는  견적유효간에만 구매 하실 수 있습니다.');"  class="btn_st2 btn_rd xlarge"></c:if>
                   		<span>바로구매</span></a>
                    <p class="large14 warning mt10">(견적 유효기간 : <ui:formatDate value="${ESM_PCH_EPT_ST_DT }" pattern="yyyy.MM.dd"/><br />~<ui:formatDate value="${ESM_PCH_EPT_ED_DT }" pattern="yyyy.MM.dd"/>) </p>
                    </c:if>
                </div> --><!-- // section-button -->
                
				
							</c:if>
							<!-- listNum 견적서 카운터를 위해 초기화 -->
							<c:set var="listNum" value="1" />
							<div class="estimate-toggler <c:if test="${no eq info.ESM_PCH_CNT }">in</c:if>"><!-- estimate-toggler -->
			                    <div class="ct section-title">
			                        <h5>No.<c:out value="${no }" /> <strong>MD 견적 내역</strong> (<span class="warning"><c:out value="${row.T_ESM_PRD_CNT }" /></span><em class="blind">개</em>)</h5>
			                        <div class="action">
			                        	<c:choose>
			                       	 	<c:when test="${row.MEM_MD_BUY_CNT > 0 }">
										<!-- MD 구매 승인  -->
										<c:if test="${info.STA eq 'ing' }" ><a href="javascript:goPayment('<c:out value="${info.ESM_MST_IDX}"/>');" class="btn_st0 btn_rd small"></c:if><c:if test="${info.STA eq 'end'}" ><a href="javascript:alert('바로구매는  견적유효간에만 구매 하실 수 있습니다.');"  class="btn_st0 btn_rd small"></c:if><span>바로구매</span></a>
										</c:when>
										<c:when test="${row.MEM_USE_BUY_CNT > 0 }">
										<!-- 견적완료  -->
										<span class="standby">승인 대기</span>
										</c:when>
										<c:when test="${row.MEM_MD_CNT > 0 }">
										<!-- 고객 구매 결정  -->
										<a href="javascript:goChoice('<c:out value="${row.ESM_PRD_PCH_IDX }" />');" class="btn_st0 info small"><span>구매 결정</span></a>
										</c:when>
										</c:choose>
			                            <a href="javascript:;" class="more"><span class="blind">MD 견적 내역 테이블 닫기</span></a>
			                        </div>
			                    </div>
								
								<div class="toggle"><!-- toggle -->
				                    <table class="table-b"><!-- table-b -->
				                    <caption>NO, 상품명, 옵션내용, 수량, 상품가격, MD견적가로 구성된 MD 견적 내역 목록입니다.</caption>
				                    <colgroup>
				                        <col style="width: 8%;" />
				                        <col style="width: 44%;" />
				                        <col style="width: 12%;" />
				                        <col style="width: 6%;" />
				                        <col style="width: 15%;" />
				                        <col style="width: 15%;" />
				                    </colgroup>
				                    <thead>
				                        <tr>
				                            <th scope="col"><span>NO</span></th>
				                            <th scope="col"><span>상품명</span></th>
				                            <th scope="col"><span>옵션내용</span></th>
				                            <th scope="col"><span>수량</span></th>
				                            <th scope="col"><span>상품가격</span></th>
				                            <th scope="col"><span>MD견적가</span></th>
				                        </tr>
				                    </thead>
				                    <tfoot>
				                        <tr class="price-total">
				                            <th scope="row" colspan="4">총합계</th>
				                            <td><fmt:formatNumber value="${row.SUM_ESM_PRD_WSH_PRICE }" groupingUsed="true" /></td>
				                            <td class="md">-</td>
				                        </tr>
				                        <tr class="price-md">
				                            <th scope="row" colspan="4">MD 견적합계</th>
				                            <td>&nbsp;</td>
				                            <td><span class="warning"><fmt:formatNumber value="${row.SUM_ESM_PRD_ESM_PRICE }" groupingUsed="true" /></span></td>
				                        </tr>
				                    </tfoot>
				                    <tbody>
				                    <c:set var="no" value="${no - 1 }" />
				                    <c:set var="SUM_ESM_PRD_WSH_PRICE" value="${row.SUM_ESM_PRD_WSH_PRICE }" />
									<c:set var="SUM_ESM_PRD_ESM_PRICE" value="${row.SUM_ESM_PRD_ESM_PRICE }" />
									<c:set var="SALE" value="${row.SALE }" />
									<c:set var="ESM_PCH_EPT_ST_DT" value="${row.ESM_PCH_EPT_ST_DT }" />
									<c:set var="ESM_PCH_EPT_ED_DT" value="${row.ESM_PCH_EPT_ED_DT }" />
									<c:set var="MEM_MD_BUY_CNT" value="${row.MEM_MD_BUY_CNT }" />
									<c:set var="MEM_USE_BUY_CNT" value="${row.MEM_USE_BUY_CNT }" />
									<c:set var="MEM_MD_BUY_CNT" value="${row.MEM_MD_BUY_CNT }" />
						</c:when>
					</c:choose>
										<tr>
				                            <td class="number"><c:out value="${listNum }" /></td>
				                            <td class="subject">
				                                <a href="<c:out value="${serverDoamin }" />/pc/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />"><c:out value="${row.PRD_MST_NM }" /></a>
				                            </td>
				                            <td class="option"><c:out value="${row.OPT_DTL_NM }" /></td>
				                            <td class="amount"><c:out value="${row.ESM_PRD_CNT }" /></td>
				                            <td class="price">
				                                <strong class="primary large14"><fmt:formatNumber value="${row.ESM_PRD_WSH_PRICE }" groupingUsed="true" /></strong>
				                            </td>
				                            <td class="price">
				                                <strong class="primary large14">-</strong>
				                            </td>
					                    </tr>
				                     	<c:if test="${sta.last }">
							</tbody>
	                    </table><!-- // table-b -->  
                    
                
                <c:if test="${row.MEM_MD_BUY_CNT > 0 }">
               	<p class="message notice-b mt10">요청하신 견적서의 구매승인이 완료되었습니다.</p>
                <p class="message notice-b">견적 유효기간을 꼭 확인해 주시고, 유효기간 중에 아래 ‘바로구매’를 선택하여 주문해주세요.</p>
                </c:if>
                
                
                <div class="estimate-price"><!-- estimate-price -->
                    <ul>
                        <li>
                            <span class="tit">상품가격</span>
                            <span class="price"><strong><fmt:formatNumber value="${row.SUM_ESM_PRD_WSH_PRICE}" groupingUsed="true" /></strong>원</span>
                        </li>
                        <li>
                            <span class="tit">MD견적가</span>
                            <span class="price"><strong class="warning"><fmt:formatNumber value="${row.SUM_ESM_PRD_ESM_PRICE  }" groupingUsed="true" /></strong>원</span>
                        </li>
                    </ul>
                    <p class="sale">
                        <strong><c:out value="${row.SALE }" /></strong>% 할인
                    </p>
                </div><!-- // estimate-price -->

                <p class="mt10 large13"> 위 견적서로 구매 원하시는 경우 ‘구매결정’을 선택해주세요. MD의 구매승인 후에 바로구매로 구매가 가능합니다.</p>
				</div><!-- // toggle -->
			</div><!-- // estimate-toggler -->
				<!-- section-button -->
				<!-- 
                <div class="section-button mt30">
                    <c:if test="${row.MEM_USE_BUY_CNT > 0 && row.MEM_MD_BUY_CNT eq 0}">
                    <a href="javascript:;" class="btn_st2 info xlarge"><span>구매 결정</span></a>
                    </c:if>
                    <c:if test="${row.MEM_MD_BUY_CNT > 0 }">
                    <c:if test="${info.STA eq 'ing' }" ><a href="javascript:goPayment('<c:out value="${info.ESM_MST_IDX}"/>');" class="btn_st2 btn_rd xlarge"></c:if><c:if test="${info.STA eq 'end'}" ><a href="javascript:alert('바로구매는  견적유효간에만 구매 하실 수 있습니다.');" class="btn_st2 btn_rd xlarge"></c:if><span>바로구매</span></a>
                    <p class="large14 warning mt10">(견적 유효기간 : <ui:formatDate value="${row.ESM_PCH_EPT_ST_DT }" pattern="yyyy.MM.dd"/><br />~<ui:formatDate value="${row.ESM_PCH_EPT_ED_DT }" pattern="yyyy.MM.dd"/>) </p>
                    </c:if>
                </div>
                 -->
                 <!-- // section-button -->
                
				                     </c:if>
				                     
					<c:set var="listNum" value="${listNum + 1 }" />
					<c:set var="OLD_ESM_PRD_PCH_IDX" value="${row.ESM_PRD_PCH_IDX }" />
				</c:forEach>
				
              	
				
                <div class="comment-write"><!-- comment-write -->
                    <label for="commentBox">댓글</label>
                    <textarea class="textarea" placeholder="200자 이내로 남겨주세요." title="200자 이내로 남겨주세요." id="txt_msg"></textarea>
                    <a href="javascript:;" class="btn_st2 btn_blk large" id="commBtn"><span>댓글 달기</span></a>
                </div><!-- // comment-write -->

                <div class="comment-list"><!-- comment-list -->
                    <table>
                    <caption>번호, 내용, 작성자,작성시간으로 구성된 댓글 목록입니다.</caption>
                    <colgroup>
                        <col style="width: 10%;" />
                        <col style="width: auto;" />
                        <col style="width: 14%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col"><span>번호</span></th>
                            <th scope="col"><span>내용</span></th>
                            <th scope="col"><span>작성자,작성시간</span></th>
                        </tr>
                    </thead>
                    <tbody id="commBody">
                    <c:set var="replyNum" value="${replyTot }" />
                    <c:forEach var="replyRow" items="${replyList }" varStatus="repSta">
                    	<tr>
                            <td class="number"><c:out value="${replyNum }" /></td>
                            <td class="comment">
                                <p class="large13 primary"><c:out value="${replyRow.ESM_REP_CTS }" />
                                    <c:if test="${replyRow.NEW_MARK eq 'Y' }" ><span class="new"><em class="blind">최근댓글</em></span></c:if>
                                </p>
                            </td>
                            <td class="date">
                                <p class="large13 primary"><c:out value="${replyRow.ESM_REP_REG_ID }" /></p>
                                <p><ui:formatDate value="${replyRow.ESM_REP_REG_DT }" pattern="yyyy.MM.dd"/></p>
                            </td>
                        </tr>
                        <c:set var="replyNum" value="${replyNum - 1}" />
                    </c:forEach>
                    </tbody>
                    </table>
                </div><!-- // comment-list -->

                <div class="section-button ar"><!-- section-button -->
                    <a href="javascript:;" class="btn_st2 btn_white large" id="listBtn"><span>목록</span></a>
                </div><!-- // section-button -->

            </div><!-- // #body -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	<<form name="frm" id="frm">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${paging.cPage }" />" />
	<input type="hidden" name="ESM_MST_IDX" id="ESM_MST_IDX" value="" />
	</form> 
	
	<%-- 견적구매용 form --%>
	<form name="paymentform" id="paymentform" method="post"></form>
	
	<!-- #footer S -->
	 <%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<script type="text/javascript">
	$(document).ready(function (){
		numberWithCommas	= function(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		};
	
		$(document).on("click", "#listBtn", function(){
			$("#frm").attr("action", "<c:out value="${serverSslDomain}" />/pc/mypage/myEstimate.do").submit();
		});
		
		$(document).on("keyup", "#txt_msg", function(){
			var maximumCount 	= 200;
			var str 			= $("#txt_msg").val();
			var now 			= calculate_msglen(str);
			
			if(now > maximumCount){
				alert("글자 입력수가 초과하였습니다.");
				$("#txt_msg").val(assert_msglen(str, maximumCount));
				now = calculate_msglen($("#txt_msg").val());
			}
		});
		
		calculate_msglen = function(message) {
			var nbytes = 0;
			
			for (i=0; i<message.length; i++) {
				var ch = message.charAt(i);
				if(escape(ch).length > 4) {
					 //nbytes += 2;
					nbytes += 1;
				} else if (ch == '\n') {
					 if (message.charAt(i-1) != '\r') {
					 nbytes += 1;
			 		}
			 	} else if (ch == '<' || ch == '>') {
			 		//nbytes += 4;
			 		nbytes += 1;
			 	} else {
			 		nbytes += 1;
			 	}
			 }
			 
			return nbytes;
		}
		
	 	assert_msglen = function(message, maximum) {
			 var inc = 0;
			 var nbytes = 0;
			 var msg = "";
			 var msglen = message.length;
			 
			for (i=0; i<msglen; i++) {
				 var ch = message.charAt(i);
				 if (escape(ch).length > 4) {
					 //inc = 2;
					 inc = 1;
				 } else if (ch == '\n') {
				 	if (message.charAt(i-1) != '\r') {
						 inc = 1;
				 	}
				 } else if (ch == '<' || ch == '>') {
				 	//inc = 4;
					 inc = 1;
				 } else {
				 	inc = 1;
				 }
				 
				 if ((nbytes + inc) > maximum) {
				 	break;
				 }
				 nbytes += inc;
				 msg += ch;
			 }
			 return msg;
		}
	 	
	 	$(document).on("click", "#commBtn", function(){
	 		var txtMsgVal = $("#txt_msg").val();
	 		
	 		if( txtMsgVal == ""){
	 			alert("댓글을 입력하세요.");
	 			$("#txt_msg").focus();
	 			return;
	 		}
	 		
	 		if(calculate_msglen(txtMsgVal) > 200){
				alert("메시지는  200글자까지  입력할수있습니다.");
				$("#txt_msg").focus();
				return;
			}
			
			$.ajax({
				
				type	: "POST",
				url		: "/pc/mypage/myEstimateCommentReqAjax.do",
				dataType: "json",
				data	: {	"ESM_MST_IDX" : "<c:out value="${info.ESM_MST_IDX }" />"
						   ,"ESM_REP_CTS" 	: $("#txt_msg").val()
							},
				success : function(data) {
					alert(data.resultMsg);
					// 값 초기화.
					if(data.memLoginYN == 'Y'){
						goCommentList();
					}
				}, error : function(err) {
					window.jquery
						|| console.log('오류가 발생하였습니다: ' + err.status);
				}
			});
	 	});
		
	 	goCommentList			= function(){
	 		$.ajax({
				type	: "POST",
				url		: "/pc/mypage/myEstimateCommentListAjax.do",
				dataType: "json",
				data	: {	"ESM_MST_IDX" : "<c:out value="${info.ESM_MST_IDX }" />"
							},
				success : function(data) {
					var innerHtml	= "";
					
					if(data.totalCount == 0){
						innerHtml = "";
					}else{
						var listNum		= data.totalCount;
						$.each(data.list, function(i,item){
							innerHtml += '<tr>';
							innerHtml += '<td class="number">' + listNum + '</td>';
		                	innerHtml += '<td class="comment">';
		                    innerHtml += '<p class="large13 primary">' + item.ESM_REP_CTS;
		                    if(item.NEW_MARK == 'Y'){
		                    	innerHtml += '<span class="new"><em class="blind">최근댓글</em></span>';	
		                    }
		                    innerHtml += '</p>';
		                	innerHtml += '</td>';
		                	innerHtml += '<td class="date">';
		                    innerHtml += '<p class="large13 primary">' + item.ESM_REP_REG_ID + '</p>';
		                    innerHtml += '<p>' + item.EXP_RPL_REG_DT_CHAR +'</p>';
		                	innerHtml += '</td>';
		            		innerHtml += '</tr>';
							
		            		listNum 	= listNum - 1;
						});
					}
					
					$("#commBody").html(innerHtml);
					$("#txt_msg").val('');
					
				}, error : function(err) {
					window.jquery
						|| console.log('오류가 발생하였습니다: ' + err.status);
				}
			});
	 	};
	 	
	 	goChoice			= function(esm_prd_pch_idx){
	 		
	 		if(confirm("구매 결정 하시겠습니까??")){
	 			
	 			$.ajax({
					type	: "POST",
					url		: "/pc/mypage/myEstimateChoiceAjax.do",
					dataType: "json",
					data	: {	"ESM_PCH_MST_CD" 	: "<c:out value="${info.ESM_MST_CD }" />"
							   ,"ESM_PCH_MST_IDX" 	: esm_prd_pch_idx
								},
					success : function(data) {
						alert(data.resultMsg);
						location.reload();
					}, error : function(err) {
						window.jquery
							|| console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
	 		}
	 	};
	 	
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
<!--// #wrap E -->
</body>
</html>