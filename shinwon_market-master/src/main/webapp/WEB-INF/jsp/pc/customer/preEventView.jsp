<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-event"><!-- page class : page-event -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>
	<div id="inner"><!-- inner -->
	
		<div class="container breadcrumb-wrap"><!-- breadcrumb -->
		    <div id="breadcrumb" class="wrap">
		        <div class="holder">
		            <span>홈</span>
		            <span class="gt">&gt;</span>
		            <strong class="warning">EVENT</strong>
		        </div>
		    </div>
		</div><!-- // breadcrumb -->

		<div class="container"><!-- container -->
		<div class="wrap"><!-- wrap -->

			<div class="section-title">
			    <h3 class="title"><span>EVENT</span></h3>
			
			    <div class="more">
			        <select class="select">
						<option value="">진행중인 다른 이벤트 선택 </option>
						<c:choose>
							<c:when test="${not empty ingEventList }">
								<c:forEach var="ingEventRow" items="${ingEventList }">
									<option value="<c:out value="${ingEventRow.EVT_MST_IDX }"/>" ><c:out value="${ingEventRow.EVT_MST_TITLE }"/></option>
							 	</c:forEach>
							</c:when>
							<c:otherwise>
								<option value="">진행중인 이벤트가 없습니다.</option>
							</c:otherwise>
						</c:choose>
					</select>
			    </div>
			</div>
	
			<h4 class="title title-event">
				<span>
					[<c:out value="${row.EVT_MST_GUBUN eq 'Y' ? '단독' : '본사' }"/> 이벤트] 
					<c:choose>
						<c:when test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_AUCTION }">
							<ui:formatDate value="${row.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> <c:out value="${row.EVT_MST_AUC_ST_HH }"/> : <c:out value="${row.EVT_MST_AUC_ST_MM }"/> 
							~ 
							<ui:formatDate value="${row.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/> <c:out value="${row.EVT_MST_AUC_ED_HH }"/> : <c:out value="${row.EVT_MST_AUC_ED_MM }"/>
						</c:when>
						<c:otherwise>
							<ui:formatDate value="${row.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${row.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/>
						</c:otherwise>					
					</c:choose>
				</span>
			</h4>
			
			<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_NORMAL }">  <!-- 응모형 -->
				<div class="event-view-body"><!-- event-view-body -->		
					<div class="holder">
                        <img src="<c:out value="${cdnDomain}" />${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>">
                    </div>
                    <div class="section-button"><!-- section button -->
                        <a href="javascript:;" id="goEnter" class="button warning xlarge"><span>신청하기</span></a>
                    </div><!-- // section button -->
            	</div><!-- // event-view-body -->
			</c:if>	<!-- 응모형 -->
			
			<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_REPLY }">  <!-- 덧글형 -->
				<div class="event-view-body"><!-- event-view-body -->
	                <div class="holder">
	                    <img src="<c:out value="${cdnDomain}" />${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>">
	                </div>
                </div><!-- // event-view-body -->

                <p class="info">
                    <span class="primary">상업적 댓글, 미풍양속에 위반되는 댓글, 이벤트 성격에 맞지 않는 댓글은 미통보 삭제될 수 있으니 양해바랍니다.</span>
                </p>

                <div class="bbs-status"><!-- bbs-status -->
                    <div class="page">
                        <strong class="xlarge primary">댓글 : <fmt:formatNumber value="${totalCount }" groupingUsed="true"/>개</strong>
                    </div>
                </div><!-- // bbs-status -->
				
				<form name="replyFrm" id="replyFrm">
					<input type="hidden" name="EVT_MST_IDX" value="${row.EVT_MST_IDX }"/>
					<input type="hidden" name="EVT_REPLY_DISPLAY_YN"/>
					<input type="hidden" name="EVT_REPLY_WIN_YN"/>
					<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
					<double-submit:preventer/>
	                <div class="comment-write"><!-- comment-write -->
						<textarea class="textarea" name="EVT_REPLY_CONTENTS" id="EVT_REPLY_CONTENTS" placeholder="내용은 최대 500byte까지 작성할 수 있습니다." onkeyup="getStrByte(this,'#byte', 500, 3);"></textarea>
	                    <p class="reset mt5">(<span id="byte">0</span>/500 byte)</p>                    
	                    <a href="javascript:;" id="replyRegist" class="button warning xlarge"><span>저장</span></a>
	                </div><!-- // comment-write -->
                </form>

                <div class="comment-list"><!-- comment-list -->
                    <ul class="reset">
                        <c:choose>
                        	<c:when test="${not empty replyList }">
                        		<c:forEach var="replyRow" items="${replyList }" varStatus="i">
	                        		<li>
	                        			<ui:replaceLineBreak content="${replyRow.EVT_REPLY_CONTENTS }"/>
			                            <div class="desc">
			                                <span class="author info">
			                                	<c:out value="${fn:substring(replyRow.EVT_REPLY_REG_ID,0,(fn:length(replyRow.EVT_REPLY_REG_ID)-4))}" />****
			                                </span>
			                                <span class="pipe">|</span>
			                                <span class="date info"><ui:formatDate value="${replyRow.EVT_REPLY_REG_DT }" pattern="yyyy.MM.dd"/></span>
			                            </div>
			                        </li>
                        		</c:forEach>
                        	</c:when>
                        	<c:otherwise>
                        		<li>
                        			댓글이 없습니다.
                        		</li>
                        	</c:otherwise>
                        </c:choose>
                    </ul>
                </div><!-- // comment-list -->

                <div class="section-pagination"><!-- section pagination -->
					<ui:frontpaging paging="${paging }" jsFunction="goPage" />
	            </div><!-- // section pagination -->
			</c:if>	<!-- 덧글형 -->
			
			<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_BOARD }">	<!-- 게시판형 -->
				<div class="event-view-body"><!-- event-view-body -->
	                <div class="holder">
	                    <img src="<c:out value="${cdnDomain}" />${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>">
	                </div>
                </div><!-- // event-view-body -->

                <p class="info">
                    <span class="primary">상업적 게시글, 미풍양속에 위반되는 게시글, 이벤트 성격에 맞지 않는 게시글은 미통보 삭제될 수 있으니 양해바랍니다.</span>
                </p>

                <div class="bbs-status"><!-- bbs-status -->
                    <div class="page">
                        <strong class="xlarge primary">게시글 : <fmt:formatNumber value="${totalCount }" groupingUsed="true"/>개</strong>
                    </div>
                </div><!-- // bbs-status -->
                        
                <form name="boardFrm" id="boardFrm">
                	<input type="hidden" name="EVT_MST_IDX" value="${row.EVT_MST_IDX }"/>
					<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
					<input type="hidden" name="EVT_BOARD_IDX" value=""/>
	                <table class="bbs-list fixed" cellspacing="0"><!-- bbs-list -->
	                <caption></caption>
	                <colgroup>
	                    <col style="width: 70px;" />
	                    <col style="width: auto;" />
	                    <col style="width: 120px;" />
	                    <col style="width: 120px;" />
	                    <col style="width: 100px;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th><span>NO</span></th>
	                        <th><span>제목</span></th>
	                        <th><span>작성자</span></th>
	                        <th><span>등록일</span></th>
	                        <th><span>조회수</span></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <c:choose>
	                    	<c:when test="${not empty boardList }">
	                    		<c:set var="listNum" value="${paging.listNum}" />
		                    	<c:forEach var="boardRow" items="${boardList }" varStatus="i">
		                    		<tr>
				                        <td class="num"><c:out value="${listNum }"/></td>
				                        <td class="subject">
				                        	<a href="javascript:;" data-evt_board_idx="<c:out value="${boardRow.EVT_BOARD_IDX }"/>">
				                        		<c:out value="${boardRow.EVT_BOARD_TITLE }"/>
				                        	</a>
				                        </td>
				                        <td><c:out value="${fn:substring(boardRow.EVT_BOARD_REG_ID,0,(fn:length(boardRow.EVT_BOARD_REG_ID)-4))}" />****</td>
				                        <td class="date"><ui:formatDate value="${boardRow.EVT_BOARD_REG_DT }" pattern="yyyy.MM.dd"/></td>
				                        <td class="hit"><fmt:formatNumber value="${boardRow.EVT_BOARD_READ_CNT}" groupingUsed="true"/></td>
				                    </tr>
				                <c:set var="listNum" value="${listNum-1}" />  
				                </c:forEach>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<tr>
	                    			<td colspan = "5">
	                    				<p class="message no-more">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</p>
	                    			</td>
	                    		</tr>
	                    	</c:otherwise>
	                    </c:choose>
	                </tbody>
	                </table><!-- // table -->
                </form>

                <div class="section-button text-right"><!-- section button -->
                    <a href="javascript:;" id="boardRegist" class="button warning large"><span>등록</span></a>
                </div><!-- // section button -->

                <div class="section-pagination"><!-- section pagination -->
					<ui:frontpaging paging="${paging }" jsFunction="goPage" />
	            </div><!-- // section pagination -->

                <div class="hr hr-a" aria-hidden="true"><!-- hr --></div>
			</c:if>		<!-- 게시판형 -->
			
			<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_AUCTION }">	<!-- 경매형 -->
				<div class="event-view-body"><!-- event-view-body -->
                    <div class="holder">
                        <img src="<c:out value="${cdnDomain}" />${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>">
                    </div>
                </div><!-- // event-view-body -->

                <div class="event-auction"><!-- event-auction -->
                    <div class="price">
                        <div class="holder">
                            <div class="ing">
                                <span class="tit">현재가</span>
                                <span class="auction">
                                	<strong>                                		
                                		<c:if test="${totalCount ne 0 }">
                                			<fmt:formatNumber value="${auctionMap.EVT_AUCTION_PRICE }" groupingUsed="true"/>
                                		</c:if>
                                		<c:if test="${totalCount eq 0}">
                                			0
                                		</c:if>
                                	</strong>원
                                </span>
                            </div>
                            <div class="user">
                        		총 참여자 수 : <fmt:formatNumber value="${totalCount }" groupingUsed="true"/>명
                            </div>
                        </div>
                    </div>
                    <div class="form">
                        <div class="holder">
                            <form name="auctionFrm" id="auctionFrm">
                            <input type="hidden" name="EVT_MST_IDX" value="${row.EVT_MST_IDX }"/>
							<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
							<input type="hidden" name="bestAuctionPrice" value="${auctionMap.EVT_AUCTION_PRICE }"/>
							<input type="hidden" name="EVT_AUCTION_PRICE" value=""/>					
							<double-submit:preventer/>
                            </form>
                            <input type="text" class="text" name="nowAuctionPrice" id="nowAuctionPrice"/>                    
                            <a href="javascript:;" id="goAuction" class="button warning xlarge"><span>입찰하기</span></a>
                            <p class="info">
                                100원단위로 입찰 해주세요.
                            </p>
                        </div>
                    </div>
                </div><!-- // event-auction -->
			</c:if>	<!-- 경매형 -->
			
			<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_SURVEY }">	<!-- 설문형 -->
				<div class="event-view-body"><!-- event-view-body -->
                    <div class="holder">
                        <img src="<c:out value="${cdnDomain}" />${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>">
                    </div>
                </div><!-- // event-view-body -->

                <div class="event-survey"><!-- event-survey -->
                    <ul class="tab">
                        <c:choose>
                        	<c:when test="${not empty surveyList }">
                        		<c:forEach var="surveyRow" items="${surveyList }" varStatus="i">
									<li>
			                            <span class="thumb"><img src="${cdnDomain }${surveyRow.EVT_SURVEY_NM}" style="width:180px;height:180px;"></span>
			                            <a href="javascript:;" class="button warning full" data-cmm_fle_sort="${surveyRow.CMM_FLE_SORT }" data-cmm_fle_idx="${surveyRow.CMM_FLE_IDX }"><span>투표하기</span></a>
		                        	</li>                        		
                        		</c:forEach>
                        	</c:when>
                        	<c:otherwise>
                        	
                        	</c:otherwise>
                        </c:choose>
                    </ul>
                </div><!-- // event-survey -->
				
				<!-- 설문형 Form -->
				<form id="surveyFrm" name="surveyFrm">
					<input type="hidden" name="EVT_MST_IDX" value="${row.EVT_MST_IDX }"/>
					<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
					<input type="hidden" name="EVT_SURVEY_CMM_FLE_IDX" value=""/>	
					<double-submit:preventer/>							
				</form>
			</c:if>	<!-- 설문형 -->
			
			<div class="section-button"><!-- section button -->
			    <a href="javascript:;" id="goList" class="button primary large"><span>이벤트목록</span></a>
			</div><!-- // section button -->
			
			<form id="frm" name="frm">
            	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
            	<input type="hidden" name="searchEvtMstStatus" value="<c:out value="${commandMap.searchEvtMstStatus }"/>" />
            	<input type="hidden" name="searchEvtMstGubun" value="<c:out value="${commandMap.searchEvtMstGubun }"/>"/>
            	<input type="hidden" name="EVT_MST_IDX" value=""/>
            	<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
            </form>
	                
			<div class="padder-bottom" aria-hidden="true"><!-- page bottom padder --></div>

		</div><!-- wrap -->
		</div><!-- // container -->

	</div><!-- // inner -->
<%-- 각 화면 본문 끝 --%>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>