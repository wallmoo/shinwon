<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/business/include/business_head.jsp" %>


<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_top.jsp" %>

		
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<article id="container" class="container">
			<div class="contents"><!-- .contents S -->
				
				
				<!-- .sub_lay S -->
				<section class="sub_lay">
					<div class="sub_head">
						<h2 class="minW">입점 상담신청</h2>
					</div>
					
					<dl class="minW counsel_ask">
						<dt><strong>입점 상담신청 조회</strong></dt>
						<dd class="dd_list">
							<ol class="ct">
								
	                	<c:choose>
	                		<c:when test="${not empty list }">
	                			<c:set var="listNum" value="${paging.listNum}" />
								<c:forEach var="list" items="${list }" varStatus="i">	                			
								<li class="<c:if test="${i.count eq 1 or i.count eq 5 or i.count eq 9 or i.count eq 13 }">f</c:if> <c:if test="${i.count eq 4 or i.count eq 8 or i.count eq 12 or i.count eq 16 }">l</c:if>">
									<span class="tx_num">No.<c:out value="${listNum}" /></span>
									<c:choose>
										<c:when test="${list.VDR_CST_GBN_NM eq '접수중'}"><i class="ico_ing"><strong>접수중</strong></i></c:when>
										<c:when test="${list.VDR_CST_GBN_NM eq '검토중'}"><i class="ico_under"><strong>검토중</strong></i></c:when>
										<c:when test="${list.VDR_CST_GBN_NM eq '상담중'}"><i class="ico_consul"><strong>상담중</strong></i></c:when>
										<c:when test="${list.VDR_CST_GBN_NM eq '계약불가'}"><i class="ico_notCon"><strong>계약불가</strong></i></c:when>
										<c:when test="${list.VDR_CST_GBN_NM eq '계약보류'}"><i class="ico_defer"><strong>계약보류</strong></i></c:when>
										<c:when test="${list.VDR_CST_GBN_NM eq '계약승인'}"><i class="ico_contr"><strong>계약승인</strong></i></c:when>
										<c:otherwise><i class="ico_contr"><strong>???</strong></i></c:otherwise>
									</c:choose>
									<p>
										<strong class="tx_depth"><c:out value="${list.PRD_CTG_UP_NM}" /> &gt; <c:out value="${list.PRD_CTG_NM}" /></strong>
										<a href="<c:out value="${frontDomain }"/>/pc/business/standingPointCounselView.do?VDR_CST_IDX=<c:out value="${list.VDR_CST_IDX }" />"><c:out value="${list.VDR_CST_SUM}" /></a>											
										<span class="tx_date"><c:out value="${list.VDR_CST_REG_DT}" /></span>
									</p>
								</li>
								<c:set var="listNum" value="${listNum - 1 }" />
								</c:forEach>	                		
	                		</c:when>
	                		<c:otherwise>
	                			<li class="no_list"><span>등록된 정보가 없습니다.</span></li>
	                		</c:otherwise>
	                	</c:choose>					
	                		
							</ol>
						</dd>

					</dl>
						<form id="pageFrm" name="pageFrm">
		            	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
			                <div class="section-pagination"><!-- section pagination -->
			                    <ui:frontpaging paging="${paging }" jsFunction="goPage" />
			                </div><!-- // section pagination -->
		                </form>
				</section>
				<!--// .sub_lay E -->
	
			</div><!--// .contents E -->
		</article>
		</form>		
		
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_footer.jsp" %>
		
	</section>
	
<script>

	$(function(){
		
	    // 페이지 이동
	    goPage = function (cPage) 
	    {
	        var $pageFrm = $("#pageFrm");
	        $pageFrm.find("input[name='cPage']").val(cPage);
	        $pageFrm.attr({"action":"<c:out value="${frontDomain}"/>/pc/business/standingPointCounselList.do", "target":"_self", "method":"post"}).submit();
	    };		
	    
	});
</script>
</body>
</html>