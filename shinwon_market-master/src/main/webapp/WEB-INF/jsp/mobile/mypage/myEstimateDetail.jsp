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

        <table class="table-d table-col estimate-info" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
        <caption>견적번호, 신청일, 상태, MD견적횟수, 확정일로 구성된 나의 견적 상세 정보 테이블입니다.</caption>
        <colgroup>
            <col style="width: auto;">
            <col style="width: 20%;">
            <col style="width: 21%;">
            <col style="width: 10%;">
            <col style="width: 20%;">
        </colgroup>
        <thead>
            <tr>
                <th>견적번호</th>
                <th>신청일</th>
                <th>상태</th>
                <th>MD<br />견적<br />횟수</th>
                <th>확정일</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><c:out value="${info.ESM_MST_CD }" /></td>
                <td><ui:formatDate value="${info.ESM_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
                <c:choose>
					<c:when test="${info.MEM_MD_BUY_CNT > 0 }">
						<td>구매승인
                    		<p><span class="warning">(유효기간<br /><ui:formatDate value="${info.ESM_PCH_EPT_ST_DT }" pattern="yyyy.MM.dd"/><br />~<ui:formatDate value="${info.ESM_PCH_EPT_ED_DT }" pattern="yyyy.MM.dd"/>)</span></p>
                		</td>
					</c:when>
					<c:when test="${info.MEM_USE_BUY_CNT > 0 }">
						<td>구매결정</td>
					</c:when>
					<c:when test="${info.MEM_MD_CNT > 0 }">
						<td>견적완료</td>
					</c:when>
					<c:otherwise>
						<td>견적신청</td>
					</c:otherwise>
				</c:choose>
                <td><c:out value="${info.ESM_PCH_CNT }" /></td>
                <td><ui:formatDate value="${info.ESM_PCH_REG_DT }" pattern="yyyy.MM.dd"/></td>
            </tr>
        </tbody>
        </table><!-- // table-d -->

        <div class="bbs-status"><!-- bbs-status -->
            견적 신청 상품 (<span class="warning" id="topCnt">0</span>개) 
        </div><!-- // bbs-status -->

        <table class="table-d table-col estimate-detail mb20" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
        <caption>상품명, 옵션내용, 수량, 상품가격으로 구성된 견적 신청 상품 목록입니다.</caption>
        <colgroup>
            <col style="width: auto;">
            <col style="width: 22%;">
            <col style="width: 10%;">
            <col style="width: 20%;">
        </colgroup>
        <thead>
            <tr>
                <th scope="col">상품명</th>
                <th scope="col">옵션내용</th>
                <th scope="col">수량</th>
                <th scope="col">상품가격</th>
            </tr>
        </thead>
        <tfoot>
            <tr class="price-total">
                <th scope="row" colspan="2">총합계 </th>
                <td colspan="2"><fmt:formatNumber value="${info.ESM_MST_ESM_TOT_PRICE }" groupingUsed="true" /></td>
            </tr>
            <tr class="price-want">
                <th scope="row" colspan="2">견적희망가격</th>
                <td colspan="2"><span class="warning"><fmt:formatNumber value="${info.ESM_MST_WSH_TOT_PRICE }" groupingUsed="true" /></span></td>
            </tr>
        </tfoot>
        <tbody>
        	<c:set var="topListNum" value="0" />
			<c:set var="topPrice" value="0" />
			<c:forEach var="topRow" items="${toplist}" varStatus="topSta">
            <tr>
                <td class="text-left">
                    <a href="javascript:;"><c:out value="${topRow.PRD_MST_NM }" /></a>
                </td>
                <td><c:out value="${topRow.OPT_DTL_NM }" /></td>
                <td><c:out value="${topRow.ESM_PRD_CNT }" /></td>
                <td><fmt:formatNumber value="${topRow.ESM_PRD_WSH_PRICE }" groupingUsed="true" /></td>
            </tr>
			<c:set var="topListNum" value="${topSta.count }" />
            </c:forEach>
            
			<c:if test="${not empty toplist}">
			<script type="text/javascript">
				$("#topCnt").text("<c:out value="${topListNum}" />");
			</script>
            </c:if>
        </tbody>
        </table><!-- // table-d -->
		
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
            </div>
		</div><!-- // estimate-toggler -->            
            <div class="padder">
	            <div class="estimate-price"><!-- estimate-price -->
	                <ul>
	                    <li>
	                        <div class="tit">상품가격</div>
	                        <div class="price"><fmt:formatNumber value="${SUM_ESM_PRD_WSH_PRICE }" groupingUsed="true" />원</div>
	                    </li>
	                    <li>
	                        <div class="tit">MD견적가</div>
	                        <div class="price"><span class="warning"><fmt:formatNumber value="${SUM_ESM_PRD_ESM_PRICE }" groupingUsed="true" />원</span></div>
	                    </li>
	                </ul>
	                <p class="sale">
	                    <strong><c:out value="${SALE }" /></strong>% 할인
	                </p>
	            </div><!-- // estimate-price -->
	            
				<c:if test="${MEM_USE_BUY_CNT > 0}">
					<p class="warning gray"><!-- 구매결정 -->
		               	견적 상품 및 수량 확인 중입니다.  구매승인 후에 구매 가능합니다.
		            </p>
				</c:if>
				
				<c:if test="${MEM_MD_BUY_CNT > 0 }">
					<p class="warning gray"><!-- 구매승인 -->
	                	요청하신 견적서의 구매승인이 완료되었습니다. 
	            	</p>
	            	<p class="warning gray"><!-- 구매승인 -->
	                	견적 유효기간을 꼭 확인해 주시고, 유효기간 중에 아래 &lsquo;바로구매&rsquo;를선택하여 주문해주세요.
	            	</p>	
				</c:if>
				
				<c:if test="${MEM_USE_BUY_CNT eq 0 && MEM_MD_BUY_CNT eq 0 }">
		            <p class="warning gray"><!-- 견적완료 -->
	                	위 견적서로 구매 원하시는 경우 &lsquo;구매결정&rsquo;을 선택해주세요.<br />
	                	MD의 구매승인 후에 바로구매로 구매가 가능합니다.
	            	</p>
				</c:if>
				
        	</div>
            
            <c:if test="${MEM_USE_BUY_CNT > 0 }">
	        <div class="section-button"><!-- section-button -->
	            <a href="goChoice('<c:out value="${row.ESM_PRD_PCH_IDX }" />');" class="button warning full"><span>구매결정</span></a>
	        </div><!-- // section-button -->
	        </c:if>
			
			<c:if test="${MEM_MD_BUY_CNT > 0 }">
	        <div class="section-button"><!-- section-button -->
	        	<c:if test="${info.STA eq 'ing' }" ><a href="javascript:goPayment('<c:out value="${info.ESM_MST_IDX}"/>');" class="button warning full estimate" ></c:if>
	        	<c:if test="${info.STA eq 'end'}" ><a href="javascript:alert('바로구매는  견적유효간에만 구매 하실 수 있습니다.');" class="button warning full estimate"></c:if>
	            <span>바로 구매<span class="small">(견적 유효기간  <ui:formatDate value="${ESM_PCH_EPT_ST_DT }" pattern="yyyy.MM.dd"/>~<ui:formatDate value="${ESM_PCH_EPT_ED_DT }" pattern="yyyy.MM.dd"/>)</span></span></a>
	        </div><!-- // section-button -->
	        </c:if>
	        
            </c:if>
            
            <!-- listNum 견적서 카운터를 위해 초기화 -->
		<c:set var="listNum" value="1" />   
        <div class="estimate-toggler"><!-- estimate-toggler -->
            <div class="upper">
                <h3><strong>No<c:out value="${no }" />. MD견적 상품</strong> (<span class="warning"><c:out value="${row.T_ESM_PRD_CNT }" /></span>개)</h3>
                <c:choose>
                	<c:when test="${row.MEM_MD_BUY_CNT > 0 }">
                		<c:if test="${info.STA eq 'ing' }" ><a href="javascript:goPayment('<c:out value="${info.ESM_MST_IDX}"/>');" class="button primary small"></c:if><c:if test="${info.STA eq 'end'}" ><a href="javascript:alert('바로구매는  견적유효간에만 구매 하실 수 있습니다.');"  class="button primary small"></c:if><span>바로구매</span></a>
                	</c:when>
                	<c:when test="${row.MEM_USE_BUY_CNT > 0 }">
                		<a href="javascript:;" class="button primary small"><span>승인 대기</span></a>
                	</c:when>
                	<c:when test="${row.MEM_MD_CNT > 0 }">
                		<a href="javascript:goChoice('<c:out value="${row.ESM_PRD_PCH_IDX }" />');" class="button primary small"><span>구매 결정</span></a>
                	</c:when>
                </c:choose>
                <a href="#estimateMd<c:out value="${no }" />" class="js-toggler up-down large"><span class="blind">MD견적 상품<em>열기</em></span></a>
            </div>
            
            <div id="estimateMd<c:out value="${no }" />" class="downer">
                <table class="table-d table-col estimate-detail" border="0" cellpadding="0" cellspacing="0"><!-- table-d -->
                <caption>상품명, 옵션내용, 수량, 상품가격, MD견적가로 구성된 견적상품 목록입니다.</caption>
                <colgroup>
                    <col style="width: auto;">
                    <col style="width: 20%;">
                    <col style="width: 6%;">
                    <col style="width: 19%;">
                    <col style="width: 19%;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">상품명</th>
                        <th scope="col">옵션<br />내용</th>
                        <th scope="col">수<br />량</th>
                        <th scope="col">상품가격</th>
                        <th scope="col">MD견적가</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr class="price-total">
                        <th scope="row" colspan="3">총합계 </th>
                        <td colspan="2"><fmt:formatNumber value="${row.SUM_ESM_PRD_WSH_PRICE }" groupingUsed="true" /></td>
                    </tr>
                    <tr class="price-md">
                        <th scope="row" colspan="3">MD 견적합계</th>
                        <td colspan="2"><span class="warning"><fmt:formatNumber value="${row.SUM_ESM_PRD_ESM_PRICE }" groupingUsed="true" /></span></td>
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
                        <td class="text-left">
                            <a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/product/product.do?prdMstCd=<c:out value="${row.PRD_MST_CD }" />', '');"><c:out value="${row.PRD_MST_NM }" /></a>
                        </td>
                        <td><c:out value="${row.OPT_DTL_NM }" /></td>
                        <td><c:out value="${row.ESM_PRD_CNT }" /></td>
                        <td><fmt:formatNumber value="${row.ESM_PRD_WSH_PRICE }" groupingUsed="true" /></td>
                        <td>-</td>
                    </tr>
                    
                    <c:if test="${sta.last }">
                    </tbody>
                </table><!-- // table-d -->
            </div>
		</div><!-- // estimate-toggler -->          
      		<div class="padder">
	            <div class="estimate-price"><!-- estimate-price -->
	                <ul>
	                    <li>
	                        <div class="tit">상품가격</div>
	                        <div class="price"><fmt:formatNumber value="${SUM_ESM_PRD_WSH_PRICE }" groupingUsed="true" />원</div>
	                    </li>
	                    <li>
	                        <div class="tit">MD견적가</div>
	                        <div class="price"><span class="warning"><fmt:formatNumber value="${SUM_ESM_PRD_ESM_PRICE }" groupingUsed="true" />원</span></div>
	                    </li>
	                </ul>
	                <p class="sale">
	                    <strong><c:out value="${SALE }" /></strong>% 할인
	                </p>
	            </div><!-- // estimate-price -->
	            
				<c:if test="${MEM_USE_BUY_CNT > 0}">
					<p class="warning gray"><!-- 구매결정 -->
		               	견적 상품 및 수량 확인 중입니다.  구매승인 후에 구매 가능합니다.
		            </p>
				</c:if>
				
				<c:if test="${MEM_MD_BUY_CNT > 0 }">
					<p class="warning gray"><!-- 구매승인 -->
	                	요청하신 견적서의 구매승인이 완료되었습니다. 
	            	</p>
	            	<p class="warning gray"><!-- 구매승인 -->
	                	견적 유효기간을 꼭 확인해 주시고, 유효기간 중에 아래 &lsquo;바로구매&rsquo;를선택하여 주문해주세요.
	            	</p>	
				</c:if>
				
				<c:if test="${MEM_USE_BUY_CNT eq 0 && MEM_MD_BUY_CNT eq 0 }">
		           <p class="warning gray"><!-- 견적완료 -->
	                	위 견적서로 구매 원하시는 경우 &lsquo;구매결정&rsquo;을 선택해주세요.<br />
	                	MD의 구매승인 후에 바로구매로 구매가 가능합니다.
	            	</p>	
		            
				</c:if>
				
        	</div>
            
            <c:if test="${MEM_USE_BUY_CNT > 0 }">
	        <div class="section-button"><!-- section-button -->
	            <a href="goChoice('<c:out value="${row.ESM_PRD_PCH_IDX }" />');" class="button warning full"><span>구매결정</span></a>
	        </div><!-- // section-button -->
	        </c:if>
			
			<c:if test="${MEM_MD_BUY_CNT > 0 }">
	        <div class="section-button"><!-- section-button -->
	        	<c:if test="${info.STA eq 'ing' }" ><a href="javascript:goPayment('<c:out value="${info.ESM_MST_IDX}"/>');" class="button warning full estimate" ></c:if>
	        	<c:if test="${info.STA eq 'end'}" ><a href="javascript:alert('바로구매는  견적유효간에만 구매 하실 수 있습니다.');" class="button warning full estimate"></c:if>
	            <span>바로 구매<span class="small">(견적 유효기간  <ui:formatDate value="${ESM_PCH_EPT_ST_DT }" pattern="yyyy.MM.dd"/>~<ui:formatDate value="${ESM_PCH_EPT_ED_DT }" pattern="yyyy.MM.dd"/>)</span></span></a>
	        </div><!-- // section-button -->
	        </c:if>              
                    </c:if>
                    
        	        
     
        
      	<c:set var="listNum" value="${listNum + 1 }" />
		<c:set var="OLD_ESM_PRD_PCH_IDX" value="${row.ESM_PRD_PCH_IDX }" />
		
		</c:forEach>
		
        <div class="comment-write"><!-- comment-write -->
            <label for="commentBox">댓글</label>
            <textarea id="txt_msg" class="textarea" placeholder="200자 이내로 남겨주세요." title="200자 이내로 남겨주세요."></textarea>
            <a href="javascript:;" class="button primary small" id="commBtn"><span>댓글 달기</span></a>
        </div><!-- // comment-write -->

        <div class="table-d table-col comment-list"><!-- comment-list -->
            <table>
            <caption>번호, 내용, 작성자,작성시간으로 구성된 댓글 목록입니다.</caption>
            <colgroup>
                <col style="width: 14%;">
                <col style="width: auto;">
            </colgroup>
            <thead class="blind">
                <tr>
                    <th scope="col"><span>번호</span></th>
                    <th scope="col"><span>내용</span></th>
                </tr>
            </thead>
            <tbody id="commBody">
            <c:set var="replyNum" value="${replyTot }" />
            <c:choose>
            	<c:when test="${empty replyList }">
            	<tr>
                    <td colspan="2">
                        <p class="no-more">댓글이 없습니다.</p>
                    </td>
                </tr>
            	</c:when>
            	<c:otherwise>
            		<c:forEach var="replyRow" items="${replyList }" varStatus="repSta">
                	<tr>
	                    <td><c:out value="${replyNum }" /></td>
	                    <td class="text-left">
                        	<p>
                        		<c:out value="${replyRow.ESM_REP_CTS }" />
                        		<c:if test="${replyRow.NEW_MARK eq 'Y' }" ><span class="new"><em class="blind">최근댓글</em></span></c:if>	
                        	</p>
	                        <p class="mt20">
	                            <span class="blind">작성자</span><c:out value="${replyRow.ESM_REP_REG_ID }" />
	                            <span class="blind">작성시간</span><ui:formatDate value="${replyRow.ESM_REP_REG_DT }" pattern="yyyy.MM.dd"/>
	                        </p>
	                    </td>
                	</tr>
                	<c:set var="replyNum" value="${replyNum - 1}" />
                	</c:forEach>
            	</c:otherwise>
            </c:choose>            
            </tbody>
            </table>
        </div><!-- // comment-list -->
            
        <div class="section-button"><!-- section-button -->
            <a href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain }"/>/mobile/mypage/myEstimate.do" class="button small"><span>목록</span></a>
        </div><!-- // section-button -->
			
	</article>
	<!--// #container E -->

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

$(document).ready(function(){
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
			url		: "/mobile/mypage/myEstimateCommentReqAjax.do",
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
			url		: "/mobile/mypage/myEstimateCommentListAjax.do",
			dataType: "json",
			data	: {	"ESM_MST_IDX" : "<c:out value="${info.ESM_MST_IDX }" />"
						},
			success : function(data) {
				var innerHtml	= "";
				
				if(data.totalCount == 0){
					innerHtml = "<tr><td colspan='2'><p class='no-more'>댓글이 없습니다.</p></td></tr>";
				}else{
					var listNum		= data.totalCount;
					$.each(data.list, function(i,item){
						innerHtml += '<tr>';
						innerHtml += '<td>' + listNum + '</td>';
	                	innerHtml += '<td class="text-left">';
	                    innerHtml += '<p>' + item.ESM_REP_CTS;
	                    if(item.NEW_MARK == 'Y'){
	                    	innerHtml += '<span class="new"><em class="blind">최근댓글</em></span>';	
	                    }
	                    innerHtml += '</p>';
	                    innerHtml += '<p class="mt20"><span class="blind">작성자</span>' + item.ESM_REP_REG_ID;
	                    innerHtml += '<span class="blind">작성시간</span>' + item.EXP_RPL_REG_DT_CHAR +'</p>';
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
				url		: "/mobile/mypage/myEstimateChoiceAjax.do",
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
 	
 	// 견적상품 바로구매
	function goPayment(esmMstIdx){
        
        $('#paymentform').empty();
		
        if(confirm("견적 주문하시겠습니까?")){
        	$.ajax
            ({
                async : false,
                type : "POST",
                data : {"ESM_MST_IDX" : esmMstIdx},
                url : "<c:out value="${serverSslDomain}" />/mobile/mypage/insertEstimateOrderAjax.do",
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
	
});
</script>
</body>
</html>