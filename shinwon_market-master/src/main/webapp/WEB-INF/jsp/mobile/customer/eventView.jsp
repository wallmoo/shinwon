<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-display blackyak"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>EVENT</span></h3>
		    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<c:if test="${(row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_NORMAL) }">	<!-- 일반형,응모형 -->
				<div class="wrap gutter"><!-- wrap -->
			</c:if>
			<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_REPLY }"> <!-- 댓글형 -->
				<div class="wrap gutter event-reply"><!-- wrap -->
			</c:if>
			<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_BOARD }"> <!-- 게시판형 -->
				<div class="wrap gutter event-board"><!-- wrap -->
			</c:if>
			<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_AUCTION }"> <!-- 경매형 -->
				<div class="wrap gutter event-auction"><!-- wrap -->
			</c:if>
			<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_SURVEY }"> <!-- 설문형 -->
				<div class="wrap gutter event-vote"><!-- wrap -->
			</c:if>
				<div class=" grid section-plan"><!-- section-plan -->
				    <div class="col-1-1 plan-item">
				        <div class="item">
				            <span class="plan-date">
				            	[<c:out value="${row.EVT_MST_GUBUN eq 'Y' ? '단독' : '본사' }"/>] 
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
				            <a href="javascript:;" id="goUrl" class="button small" style="float:right;"><span>이벤트 URL복사하기</span></a>
				            <strong class="plan-title"><c:out value="${row.EVT_MST_TITLE }"/></strong>
				            <p class="img-wrap mt15">
				                <img src="<c:out value="${cdnDomain}${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}"/>" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>">
				            </p>
				        </div>
				    </div>
				</div><!--// section-plan -->
				
				<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_REPLY }">  <!-- 덧글형 -->
	            	<div class="grid section-comment"><!-- section-comment -->
	                    <div class="col-1-2">
	                        <strong class="primary">댓글 작성</strong>
	                    </div>
                        <form name="replyFrm" id="replyFrm">
							<input type="hidden" name="EVT_MST_IDX" value="${row.EVT_MST_IDX }"/>
							<input type="hidden" name="EVT_REPLY_DISPLAY_YN"/>
							<input type="hidden" name="EVT_REPLY_WIN_YN"/>
							<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
							<input type="hidden" name="pPage" value="<c:out value="${commandMap.pPage }"/>"/>
							<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
							<double-submit:preventer/>
	                        <div class="col-1-2 text-right">
	                            <span class="info">
	                            	(<span id="byte">0</span>/500 byte)
	                            </span>
	                        </div>
	                        <div class="col-1-1 clearfix fields">
	                            <textarea class="textarea xlarge" name="EVT_REPLY_CONTENTS" id="EVT_REPLY_CONTENTS" placeholder="${empty sessionUser.MEM_MST_MEM_ID ? '로그인 후 이벤트 참여 가능합니다.' : '내용은 최대 500byte까지 작성할 수 있습니다.' }" onkeyup="getStrByte(this,'#byte', 500, 3);" ></textarea>
	                        </div>
                        </form>
                        <p class="info reset">상업적 댓글, 미풍양속에 위반되는 댓글, 이벤트 성격에 맞지 않는 댓글은 미통보 삭제될 수 있으니 양해바랍니다.</p>
                    </div><!-- // section-comment -->

                    <div class="grid section-button actions"><!-- section-button -->
                        <div class="col-1-1">
                            <a href="javascript:;" id="replyRegist" class="button warning full">
                                <span>저장</span>
                            </a>
                        </div>
                    </div><!-- // section-button -->

                    <div class="section-comment"><!-- section-comment -->
                        <strong class="primary">댓글 : <span><fmt:formatNumber value="${totalCount }" groupingUsed="true"/></span>개</strong>
                        <ul class="list comment-list">
                            <c:choose>
                        		<c:when test="${not empty replyList }">
                        			<c:forEach var="replyRow" items="${replyList }" varStatus="i">
			                            <li>
			                                <p class="comment-wrap">
			                                    <span class="text">
													<ui:replaceLineBreak content="${replyRow.EVT_REPLY_CONTENTS }"/>
												</span>
			                                    <span class="reset comment-info">
			                                        <span class="name">
			                                        	<c:out value="${fn:substring(replyRow.EVT_REPLY_REG_ID,0,(fn:length(replyRow.EVT_REPLY_REG_ID)-4))}" />****
			                                        </span>
			                                        <span class="bar">|</span>
			                                        <span class="date"><ui:formatDate value="${replyRow.EVT_REPLY_REG_DT }" pattern="yyyy.MM.dd"/></span>
			                                    </span>
			                                </p>
			                            </li>
			                		</c:forEach>
			               		</c:when>
			               		<c:otherwise>
			               			<div class="section-message message">
	                            		<p>
	                        			댓글이 없습니다.
	                        			</p>
	                        		</div>
			               		</c:otherwise>
			               	</c:choose>
                        </ul>
                    </div><!-- // section-comment -->

                    <div class="section-pagination"><!-- section pagination -->
						<ui:frontpaging paging="${replyPaging }" jsFunction="goReplyPage" />
		            </div><!-- // section pagination -->
		            
		            <div class="grid section-button actions"><!-- section-button -->
					    <div class="col-1-1">
					        <a href="javascript:;" id="goList" class="button primary full">
					            <span>이벤트 목록</span>
					        </a>
					    </div>
					</div><!-- // section-button -->
	            </c:if>

	            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_BOARD}">	<!-- 게시판형 -->
	            	<form name="boardFrm" id="boardFrm">
	                	<input type="hidden" name="EVT_MST_IDX" value="${row.EVT_MST_IDX }"/>
						<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
						<input type="hidden" name="EVT_BOARD_IDX" value=""/>
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
						<input type="hidden" name="bPage" value="<c:out value="${commandMap.bPage }"/>"/>
		            	<div class="section-comment"><!-- section-comment -->
		                    <strong class="primary">게시글 : <span><fmt:formatNumber value="${totalCount }" groupingUsed="true"/></span>개</strong>
		                    <p class="reset info">상업적 댓글, 미풍양속에 위반되는 게시글, 이벤트 성격에 맞지 않는 게시글은 미통보 삭제될 수 있으니 양해바랍니다.</p>
		                    <ul class="list comment-list mt5">
		                        <c:choose>
	                    			<c:when test="${not empty boardList }">
				                    	<c:forEach var="boardRow" items="${boardList }" varStatus="i">
					                        <li>
					                            <a href="javascript:;" class="grid comment-wrap boardInfo" data-evt_board_idx="<c:out value="${boardRow.EVT_BOARD_IDX }"/>">
					                                <span class="col-1-1 text"><c:out value="${boardRow.EVT_BOARD_TITLE }"/></span>
					                                <span class="col-2-3 comment-info">
					                                    <span class="name">
					                                    	<c:out value="${fn:substring(boardRow.EVT_BOARD_REG_ID,0,(fn:length(boardRow.EVT_BOARD_REG_ID)-4))}" />****
					                                    </span>
					                                    <span class="bar">|</span>
					                                    <span class="date">
					                                    	<ui:formatDate value="${boardRow.EVT_BOARD_REG_DT }" pattern="yyyy.MM.dd"/>
					                                    </span>
					                                </span>
					                                <span class="col-1-3 hits text-right">
				                                    	조회 : <fmt:formatNumber value="${boardRow.EVT_BOARD_READ_CNT}" groupingUsed="true"/>
					                                </span>
					                            </a>
					                        </li>
					                    </c:forEach>
				                	</c:when>
				                	<c:otherwise>
				                		<div class="section-message message">
		                            		<p>
		                        			게시글이 없습니다.
		                        			</p>
		                        		</div>
				                	</c:otherwise>
				                </c:choose>
		                    </ul>
		                </div><!-- // section-comment -->
	                </form>
	
	                <div class="section-pagination"><!-- section pagination -->
						<ui:frontpaging paging="${boardPaging }" jsFunction="goBoardPage" />
	            	</div><!-- // section pagination -->
	
	                <div class="grid section-button actions"><!-- section-button -->
	                    <div class="col-1-2">
	                        <a href="javascript:;" id="goList" class="button primary full">
	                            <span>이벤트 목록</span>
	                        </a>
	                    </div>
	                    <div class="col-1-2">
	                        <a href="javascript:;" id="boardRegist" class="button warning full">
	                            <span>등록</span>
	                        </a>
	                    </div>
	                </div><!-- // section-button -->	
	            </c:if>
	            
	            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_AUCTION }"> <!-- 경매형 -->
	            	<p class="reset">
	                    <strong class="primary">총 참여자 수 : <span><fmt:formatNumber value="${totalCount }" groupingUsed="true"/></span>명</strong>
	                </p>
	                <div class="section-board">
	                    <div class="row grid">
	                        <div class="col-1-2">현재가</div>
	                        <div class="col-1-2 text-right">
	                            <span class="primary">
	                            	<strong class="xxlarge">
	                            		<c:if test="${totalCount ne 0 }">
                                			<fmt:formatNumber value="${auctionMap.EVT_AUCTION_PRICE }" groupingUsed="true"/>
                                		</c:if>
                                		<c:if test="${totalCount eq 0}">
                                			0
                                		</c:if>
	                            	</strong> 원
	                            </span>
	                        </div>
	                        <div class="col-2-3">
	                            <form name="auctionFrm" id="auctionFrm">
		                            <input type="hidden" name="EVT_MST_IDX" value="${row.EVT_MST_IDX }"/>
									<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
									<input type="hidden" name="bestAuctionPrice" value="${auctionMap.EVT_AUCTION_PRICE }"/>
									<input type="hidden" name="EVT_AUCTION_PRICE" value=""/>					
									<double-submit:preventer/>
	                            	<input type="text" class="text xlarge number" name="nowAuctionPrice" id="nowAuctionPrice" placeholder="${empty sessionUser.MEM_MST_MEM_ID ? '로그인 후 이벤트 참여 가능합니다.' : '입찰가를 입력해주세요.' }" maxlength="6"/>
	                            </form>
	                        </div>
	                        <div class="col-1-3 section-button actions mt0 mb0">
	                            <a href="javascript:;" id="goAuction" class="button warning full pt5 pb5 ml5">
	                                <span>입찰하기</span>
	                            </a>
	                        </div>
	                        <p class="col-1-1 reset clearfix info">100원 단위로 입찰해주세요.</p>
	                    </div>
	                </div>
	
	                <div class="grid section-button actions"><!-- section-button -->
	                    <div class="col-1-1">
	                        <a href="javascript:;" id="goList" class="button primary full">
	                            <span>이벤트 목록</span>
	                        </a>
	                    </div>
	                </div><!-- // section-button -->
	            </c:if>
	            
	            <c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_SURVEY }"> <!-- 설문형 -->
	            	<p class="reset">
	                    <strong class="primary">총 참여자 수 : <span><fmt:formatNumber value="${totalCount }" groupingUsed="true"/></span>명</strong>
	                </p>
	                <div class="list-product item-2 image mt10"><!-- list-product -->
	                    <c:choose>
                        	<c:when test="${not empty surveyList }">
                        		<c:forEach var="surveyRow" items="${surveyList }" varStatus="i">
				                    <div class="item-product" data-sale="null"><!-- item -->
				                        <div class="module">
				                            <div class="thumb">
				                                <img src="<c:out value="${cdnDomain }${surveyRow.EVT_SURVEY_NM}"/>" class="thumb144">
				                            </div>
				                        </div>
				                        <div class="section-button text-center">
				                            <a href="javascript:;" class="button" name="choice" data-cmm_fle_sort="${surveyRow.CMM_FLE_SORT }" data-cmm_fle_idx="${surveyRow.CMM_FLE_IDX }"><span>투표하기</span></a>
				                        </div>
				                    </div><!-- // item -->
				               </c:forEach>
				         	</c:when>
				        </c:choose>
	                </div>
	                
	                <!-- 설문형 Form -->
					<form id="surveyFrm" name="surveyFrm">
						<input type="hidden" name="EVT_MST_IDX" value="${row.EVT_MST_IDX }"/>
						<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
						<input type="hidden" name="EVT_SURVEY_CMM_FLE_IDX" value=""/>	
						<double-submit:preventer/>							
					</form>
	
	                <div class="grid section-button actions"><!-- section-button -->
	                    <div class="col-1-1">
	                        <a href="javascript:;" id="goList" class="button primary full">
	                            <span>이벤트 목록</span>
	                        </a>
	                    </div>
	                </div><!-- // section-button -->
	            </c:if>
 
				
				<c:if test="${row.EVT_MST_TYPE eq Code.EVENT_MASTER_TYPE_NORMAL }">  <!-- 응모형 -->
					<div class="grid section-button actions"><!-- section-button -->
	                    <div class="col-1-2">
	                        <a href="javascript:;" id="goList" class="button primary full">
	                            <span>이벤트 목록</span>
	                        </a>
	                    </div>
	                    <div class="col-1-2">
	                        <a href="javascript:;" id="goEnter" class="button warning full">
	                            <span>신청하기</span>
	                        </a>
	                    </div>
	                </div><!-- // section-button -->
	            </c:if>
	            
				<form id="frm" name="frm">
	            	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
	            	<input type="hidden" name="searchEvtMstStatus" value="<c:out value="${commandMap.searchEvtMstStatus }"/>" />
	            	<input type="hidden" name="searchEvtMstGubun" value="<c:out value="${commandMap.searchEvtMstGubun }"/>"/>
	            	<input type="hidden" name="EVT_MST_IDX" value=""/>
	            	<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
            	</form>
            
				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- wrap -->
		</div><!-- // container -->

	</div><!-- // contents -->
	
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
	$(function()
	{
		var EVT_MST_STATUS = "${row.EVT_MST_STATUS}";
		
		//목록
		$(document).on("click","#goList",function()
		{
			$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/eventList.do", "target":"_self", "method":"get"}).submit();
		});
		
		// 이벤트 URL 복사하기
		$("#goUrl").on("click",function(){
			var cUrl = location.href;
			if(navigator.userAgent.indexOf("MSIE") > -1 || navigator.userAgent.indexOf("Trident") > -1) 
			{
				if(confirm("이벤트 URL을 복사하시겠습니까?"))
				{
					window.clipboardData.setData("Text", cUrl);
					alert("클립보드에 복사되었습니다. Ctrl+V로 붙여넣어 사용하시면 됩니다.");				
				}
			} 
			else 
			{
				temp = prompt("브라우저 주소창의 URL을 복사해서 사용해주세요", cUrl);
			}
		});
		
		//응모하기 버튼 클릭
		$(document).on("click","#goEnter",function()
		{
			if(EVT_MST_STATUS == "end")
			{
				alert("이미 종료된 이벤트입니다.");	
				return;
			}
			if("${sessionUser.MEM_MST_MEM_ID}" == "")
			{
				alert("이벤트 참여는 로그인 후 가능합니다.");
				return;
			}
			if(confirm("이벤트에 참여하시겠습니까?"))
			{
				enterEvent();			
			}
		});
		
		//덧글형 이벤트 저장
		$("#replyRegist").on("click",function()
		{
			if(EVT_MST_STATUS == "end")
			{
				alert("이미 종료된 이벤트입니다.");	
				return;
			}
			if("${sessionUser.MEM_MST_MEM_ID}" == "")
			{
				alert("이벤트 참여는 로그인 후 가능합니다.");
				return;
			}
			if($("#EVT_REPLY_CONTENTS").val() == "")
			{
				alert("덧글을 입력해주세요.");
				$("#EVT_REPLY_CONTENTS").focus();
				return;
			}
			if(confirm("이벤트에 참여하시겠습니까?"))
			{
				$("#replyFrm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/replyEventRegist.do","target":"_self","method":"post"}).submit();			
			}
		});
		
		// 덧글형 페이지 이동
	    goReplyPage = function (pPage) 
	    {
	        var $frm = $("#replyFrm");
	        $frm.find("input[name='pPage']").val(pPage);
	        $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/eventView.do", "target":"_self", "method":"get"}).submit();
	    };
	    
	  	//게시판형 이벤트 등록 폼
		$("#boardRegist").on("click",function()
		{
			if(EVT_MST_STATUS == "end")
			{
				alert("이미 종료된 이벤트입니다.");	
				return;
			}
			if("${sessionUser.MEM_MST_MEM_ID}" == "")
			{
				alert("이벤트 참여는 로그인 후 가능합니다.");
				return;
			}
			if(confirm("이벤트에 참여하시겠습니까?"))
			{
				$("#boardFrm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/boardEventForm.do","target":"_self","method":"get"}).submit();		
			}
		});
	  	
		//게시판형 이벤트 상세
		$(".boardInfo").on("click",function()
		{
			$("#boardFrm").find("input[name='EVT_BOARD_IDX']").val($(this).data("evt_board_idx"));
			$("#boardFrm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/boardEventView.do","target":"_self","method":"get"}).submit();
		});
		
		// 게시판형 페이지 이동
	    goBoardPage = function (bPage) 
	    {
	        var $frm = $("#boardFrm");
	        $frm.find("input[name='bPage']").val(bPage);
	        $frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/eventView.do", "target":"_self", "method":"get"}).submit();
	    };
	    
	  	//경매형 이벤트 입찰
		$("#goAuction").on("click",function()
		{
			if(EVT_MST_STATUS == "end")
			{
				alert("이미 종료된 이벤트입니다.");	
				return;
			}
			if("${sessionUser.MEM_MST_MEM_ID}" == "")
			{
				alert("이벤트 참여는 로그인 후 가능합니다.");
				return;
			}
			if($.trim($("#nowAuctionPrice").val()) == "")
			{
				alert("[입찰가]입력하세요.");
				$("#nowAuctionPrice").focus();
				return false;
			}
			
			if(parseInt($.trim($("#nowAuctionPrice").val())) > 0)
			{
				if(parseInt($.trim($("#nowAuctionPrice").val())) % 100 != 0)
				{
					alert("[100원]단위로 입력하셔야합니다.");
					$("#nowAuctionPrice").focus();
					return false;
				}			
			}
			
			if(parseInt($("input[name='bestAuctionPrice']").val()) >= parseInt($.trim($("#nowAuctionPrice").val())))
			{
				alert("현재가보다 높게 입력하셔야합니다.");
				$("#nowAuctionPrice").focus();
				return false;	
			}

			$("input[name='EVT_AUCTION_PRICE']").val($.trim($("#nowAuctionPrice").val()));
			
			if(confirm("이벤트에 참여하시겠습니까?"))
			{
				$("#auctionFrm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/auctionEventRegist.do","target":"_self","method":"post"}).submit();			
			}
		});
	  
		// 설문형 이벤트 투표하기 버튼 클릭
		$("a[name='choice']").on("click",function()
		{
			$("input[name='EVT_SURVEY_CMM_FLE_IDX']").val($(this).data("cmm_fle_idx"));
			
			if(EVT_MST_STATUS == "end")
			{
				alert("이미 종료된 이벤트입니다.");	
				return;
			}
			
			if("${sessionUser.MEM_MST_MEM_ID}" == "")
			{
				alert("이벤트 참여는 로그인 후 가능합니다.");
				return;
			}
			
			if(confirm("이벤트에 참여하시겠습니까?"))
			{
				$("#surveyFrm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/surveyEventRegist.do","target":"_self","method":"post"}).submit();			
			}
		});
		
		//설문형 이벤트 투표하기 mouseover 이벤트
		$("a[name='choice']").on("mouseover",function(){
			$(this).attr("class","button selected");
		});
		
		//설문형 이벤트 투표하기 mouseout 이벤트
		$("a[name='choice']").on("mouseout",function(){
			$(this).attr("class","button");
		});
	});
	
	//이벤트 응모
	function enterEvent(){
		$.ajax
	    ({
	        async : false,
	        type : "POST",
	        data : {"EVT_MST_IDX":"${row.EVT_MST_IDX}", "EVT_MST_TYPE":"${row.EVT_MST_TYPE}"},
	        url : "<c:out value="${mobileDomain}" />/mobile/customer/eventInsertAjax.do",
	        success : function (data) 
	        { 
	        	if(data.status == "success"){
	        		alert("응모되었습니다.");
	        	}else if(data.status == "entered"){
	        		alert("이미 응모하신 이벤트입니다.");        		
	        	}else if(data.status == "error"){
	        		alert("에러가 발생했습니다.");
	        	}else if(data.status == "login"){
	        		if(confirm("이벤트 응모는 로그인한 회원만 하실 수 있습니다.\n로그인 하시겠습니까?")){
	        			var returnUrl = location.pathname + location.search;
	        			location.href = "${mobileSslDomain}/mobile/manager/login.do?url="+returnUrl;
	        		}
	        	}
	        },
	        error : function (err)
	        {
	            alert("오류가 발생하였습니다.\n[" + err.status + "]");
	            window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
	        }
	    });
	}
</script>
</body>
</html>    