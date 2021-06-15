<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-event">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents minW"><!-- .contents S -->

			<!-- .section S -->
			<section class="event_zone">
				
				<%@ include file="/WEB-INF/jsp/pc/event/eventMenuInclude.jsp" %>
				
				<!-- .ev_con S -->
				<div class="ev_con ev_cons"> <!-- 이벤트: ev_cons / 회원혜택: ev_member / 쿠폰혜택: ev_coupon / 카드혜택: ev_card -->
					<ul class="ev_list">
						<li class="tab_mn">
							<c:choose>
								<c:when test="${info.EVT_ING_YN eq 'ing' }">
									<span id="tx_ex" class="tx_ex">현재 진행중인 모든 이벤트를 한번에 볼 수 있습니다. 다양한 혜택 놓치지 마세요</span>
								</c:when>
								<c:otherwise>
									<span class="tx_ex">종료된 이벤트를  보실 수 있습니다.  응모한 이벤트의 당첨자 발표를 확인해 주세요.</span>	
								</c:otherwise>
							</c:choose>
							<a href="<c:out value="${frontDomain }" />/pc/event/eventList.do?ingPage=1&endPage=1&type=ing" <c:if test="${info.EVT_ING_YN eq 'ing' }">class="on"</c:if> ><span>진행중인 이벤트</span></a>
							<a href="<c:out value="${frontDomain }" />/pc/event/eventList.do?ingPage=1&endPage=1&type=end" <c:if test="${info.EVT_ING_YN eq 'end' }">class="on"</c:if> ><span>종료된 이벤트</span></a>
						</li>
						<!-- .tab_con S -->
						<li class="tab_con">
							
							<!-- .ev_detail S -->
							<div class="ev_detail">
								
								<div class="btn_box">
									<c:if test="${not empty info.EVT_MST_IDX_PREV }"><a href="javascript:void(0)" class="btn_prev f" data-evt_mst_idx="<c:out value="${info.EVT_MST_IDX_PREV }" />" ><span>이전</span></a></c:if>
									<c:if test="${not empty info.EVT_MST_IDX_NEXT }"><a href="javascript:void(0)" class="btn_next" data-evt_mst_idx="<c:out value="${info.EVT_MST_IDX_NEXT }" />" ><span>다음</span></a></c:if>

									<select id="sel_ev_ing" class="sel_chg">
										<option value="">현재 진행중인 이벤트</option>
										<c:forEach var="row" items="${list }">
											<option value="<c:out value="${row.EVT_MST_IDX }" />"> <c:out value="${row.EVT_MST_TITLE }" /></option>
										</c:forEach>
									</select>
								</div>

								<dl	class="ev_info">
									<dt class="ti">
										<span class="tx_ti">이벤트명</span>
										<c:set var="eveType" value="" />
										<c:if test="${info.EVT_MST_TYPE eq '708' }">
											<c:set var="eveType" value="CLICK" />
										</c:if>
										<c:if test="${info.EVT_MST_TYPE eq '710' }">
											<c:set var="eveType" value="TALK" />
										</c:if>
										<c:if test="${info.EVT_MST_TYPE eq '713' }">
											<c:set var="eveType" value="POLL" />
										</c:if>
										<c:if test="${info.EVT_MST_TYPE eq '1842' }">
											<c:set var="eveType" value="PHOTO" />
										</c:if>
										<p>
											<span><em><c:if test="${not empty eveType }">[<c:out value="${eveType }" />] </c:if></em><c:out value="${info.EVT_MST_TITLE }" /></span>
											<c:if test="${info.EVT_ING_YN eq 'ing' }">
												<i class="ico_mk ing"><span>진행중</span></i>	
											</c:if>												
											<c:if test="${info.EVT_ING_YN eq 'end' }">
												<c:choose>
													<c:when test="${info.EVT_WIN_USE_YN  == 0}">
												<i class="ico_mk end"><span>마감</span></i>
													</c:when>
													<c:otherwise>
												<a href="<c:out value="${frontDomain }" />/pc/customer/eventWinView.do?EVT_WIN_IDX=<c:out value="${info.EVT_WIN_IDX }" />"><i class="ico_mk dang"><span>당첨자 확인</span></i></a>
													</c:otherwise>
												</c:choose>												
											</c:if>
										</p>
									</dt>
									<dd class="con">
										<div class="ico_box">
											<a href="javascript:insertKeepingContents(<c:out value="${info.EVT_MST_IDX}" />);" class="btn_st0 btn_white small btn_kip"><em>키핑</em></a>
										</div>
										<c:if test="${not empty info.FILE_NM2 }">
										<img src="<c:out value="${cdnDomain}${info.FILE_NM2 }" />" alt="<c:out value="${info.CMM_FLE_ALT_TXT2 }" />"  />
										</c:if>
									</dd>
								</dl>

								<!-- .reply_inp_box S -->
								<dl class="reply_inp_box">
									<dt>댓글달기 이벤트</dt>
									<dd class="inp_tx">
										<label for="">
											<textarea name="comment" id="comment" placeholder="200자 이내로 남겨주세요."></textarea>
										</label>
										<a href="javascript:void(0)" class="btn_regist"><span>댓글 달기</span></a>
										<p><i class="ico_ex"><span class="ir">!</span></i>로그인 후 댓글 등록 가능합니다.</p>
									</dd>
								</dl>

								<div class="reply_list">
									<strong class="tx_total">총 <em id="commCnt"><c:out value="${iCommCount }" /></em>개의 댓글이 있습니다.</strong>
									<table>
										<caption></caption>
										<colgroup>
											<col style="width:108px" />
											<col />
											<col style="width:105px" />
										</colgroup>
										<tbody id="commTbody">
										<c:choose>
											<c:when test="${not empty commList }">
											<c:set var="commListNum" value="${paging.listNum }" />
											<c:forEach var="commRow" items="${commList }">
												<tr>
													<td class="no"><c:out value="${commListNum }" /></td>
													<td class="ti">
														<a href="javascript:void(0)"><c:if test="${commRow.EVT_RPL_CHN_TYPE eq 'M' }"><i class="ico_mobile"><span class="blind">모바일로 등록된 글</span></i></c:if><c:out value="${commRow.EVT_RPL_CTS }" /><c:if test="${commRow.EVT_RPL_REG_ID eq commandMap.MEM_MST_MEM_ID }"><a href="javascropt:void(0)" class="btn_del" data-evt_rpl_idx="<c:out value="${commRow.EVT_RPL_IDX }" />" data-evt_mst_idx="<c:out value="${commRow.EVT_MST_IDX }" />" ><span class="blind">삭제</span></a></c:if></a>
													</td>
													<td class="tx_idNdate">
														<span><c:out value="${commRow.HID_EVT_RPL_REG_ID }" /></span>
														<span><c:out value="${commRow.EVT_RPL_REG_DT_CHAR }" /></span>
													</td>
												</tr>
												<c:set var="commListNum" value="${commListNum -1}" />
											</c:forEach>	
											</c:when>
										</c:choose>
										</tbody>
									</table>
									<div class="section-pagination" style="padding:30px 0 50px;" id="commPg">
										<ui:frontpaging paging="${paging }" jsFunction="goPage" />
									</div>
								</div>
								<!--// .reply_inp_box E -->
								
								<div class="btn_box end_btn_box" >
									<c:if test="${not empty info.EVT_MST_IDX_PREV }"><a href="javascript:void(0)" class="btn_prev f" data-evt_mst_idx="<c:out value="${info.EVT_MST_IDX_PREV }" />" ><span>이전</span></a></c:if>
									<c:if test="${not empty info.EVT_MST_IDX_NEXT }"><a href="javascript:void(0)" class="btn_next" data-evt_mst_idx="<c:out value="${info.EVT_MST_IDX_NEXT }" />"><span>다음</span></a></c:if>

									<a href="javascript:void(0)" class="btn_list l"><span>목록</span></a>
								</div>

							</div>
							<!--// .ev_detail E -->
							
						</li>
						<!--// .tab_con E -->
					</ul>
					
				</div>
				<!--// .ev_con E -->
			</section>
			<!--// .section E -->
			

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	<form name="frm" id="frm">
	<input type="hidden" name="ingPage" id="ingPage" value="<c:out value="${commandMap.ingPage }" />" />
	<input type="hidden" name="endPage" id="endPage" value="<c:out value="${commandMap.endPage }" />" />
	<input type="hideen" name="type" id="type" value="<c:out value="${commandMap.whereType}" />" />
	<input type="hidden" name="EVT_MST_IDX" id="EVT_MST_IDX" value="" />
	</form>
	<script type="text/javascript">
		$(document).on("click", ".btn_prev", function(){
			var evt_mst_idx			= $(this).data("evt_mst_idx");
			$("#EVT_MST_IDX").val(evt_mst_idx);
			$("#frm").attr("action", "<c:out value="${frontDomain}" />/pc/event/eventView.do").submit();
		});
		
		$(document).on("click", ".btn_next", function(){
			var evt_mst_idx			= $(this).data("evt_mst_idx");
			$("#EVT_MST_IDX").val(evt_mst_idx);
			$("#frm").attr("action", "<c:out value="${frontDomain}" />/pc/event/eventView.do").submit();
		});
		
		$(document).on("click", ".btn_list", function(){
			$("#frm").attr("action", "<c:out value="${frontDomain}" />/pc/event/eventList.do").submit();
		});
		
		$(document).on("click", ".sel_chg", function(){
			var evt_mst_idx 		= $(this).val();
			if(evt_mst_idx != ""){
				$("#EVT_MST_IDX").val(evt_mst_idx);
				$("#frm").attr("action", "/pc/event/eventView.do").submit();
			}
		});
		
		$(document).on("click", ".btn_regist", function(){
			
			var comment		= $("#comment").val();
			var agt			= checkAgt();
			
			if(comment == ""){
				alert("댓글 내용을 입력하세요.");
			}else{
				if(calculate_msglen(comment) > 200){
					//alert("메시지는 영문 200글자,한글 100글자까지  입력할수있습니다.");
					alert("메세지는 200자까지 입력 가능합니다.");
					$("#comment").focus();
					return;
				}else{
					$.ajax({
						async 	: false,
						type	: "POST",
						url		: "/pc/event/eventEntryAjax.do",
						dataType: "json",
						data	: {	"EVT_MST_IDX" : "<c:out value="${info.EVT_MST_IDX}" />"
									, "EVT_RPL_CTS" : comment
									, "EVT_AGT"		: agt
									},
						success : function(data) {
							if(data.loginChk == 'N'){
								if(confirm(data.resultMsg)){
		    						var url = location.href;
		    						url = encodeURIComponent(url);
		    			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
		    					}
							}else{
								alert(data.resultMsg);
								$("#comment").val('');
								goPage(1);
							}
						}, error : function(err) {
							window.jquery
							|| console.log('오류가 발생하였습니다: ' + err.status);
						}
					});
				}
			}
		});
		
		$(document).on("keyup", "#comment", function(){
			
			var maximumCount 	= 200;
			var str 			= $("#comment").val();
			var now 			= calculate_msglen(str);
			
			if(now > maximumCount){
				alert("글자 입력수가 초과하였습니다.");
				$("#comment").val(assert_msglen(str, maximumCount));
				now = calculate_msglen($("#comment").val());
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
	 	
		goPage			= function(cPage){
			$.ajax({
				type	: "POST",
				url		: "/pc/event/eventCommetnListAjax.do",
				dataType: "json",
				data	: {	"EVT_MST_IDX" 		: "<c:out value="${info.EVT_MST_IDX}" />"
							, "cPage"			: cPage
							},
				success : function(data) {
					var innerHtml	= "";
					
					if(data.totalCount == 0){
						innerHtml = "";
						$("#commTbody").html(innerHtml);
					}else{
						var listNum		= data.listNum;
						$.each(data.commList, function(i,item){
							
							innerHtml += '<tr>';
							innerHtml += '<td class="no">'+ listNum +'</td>';
							innerHtml += '<td class="ti">';
							innerHtml += '<a href="javascript:void(0)">';
							if(item.EVT_RPL_CHN_TYPE == 'M'){
								innerHtml += '<i class="ico_mobile"><span class="blind">모바일로 등록된 글</span></i>';
							}
							innerHtml += item.EVT_RPL_CTS;
							if(item.EVT_RPL_REG_ID == '<c:out value="${commandMap.MEM_MST_MEM_ID }" />'){
								innerHtml += '<a href="javascropt:void(0)" class="btn_del" data-evt_rpl_idx="'+ item.EVT_RPL_IDX +'" data-evt_mst_idx="' + item.EVT_MST_IDX + '"><span class="blind">삭제</span></a>';
							}
							innerHtml +='</td>';
							innerHtml +='<td class="tx_idNdate">';
							innerHtml +='<span>' + item.HID_EVT_RPL_REG_ID + '</span>';
							innerHtml +='<span>' + item.EVT_RPL_REG_DT_CHAR + '</span>';
							innerHtml +='</td>';
							innerHtml +='</tr>';
							
							listNum		= listNum - 1;
						});
						
						$("#commTbody").html(innerHtml);
						
						var firstPageNo 				= data.firstPageNo;
			            var firstPageNoOnPageList 		= data.firstPageNoOnPageList;
			            var totalPageCount 				= data.totalPageCount;
			            var lastPageNoOnPageList 		= data.lastPageNoOnPageList;
			            var cPage 						= data.cPage;
			            var lastPageNo 					= data.lastPageNo;
			            var pageSize 					= data.pageSize;
			            var pagingSize 					= data.pagingSize;
			            
			            innerHtml 	= "";
			            
			            if(totalPageCount > pagingSize){
			            	if(firstPageNoOnPageList > pagingSize){
			            		innerHtml += '<a class="nav first" href="javascript:goPage(' + firstPageNo + ');" ><span class="blind">처음 페이지</span></a>';
			            		innerHtml += '<a class="nav prev" href="javascript:goPage(' + (firstPageNoOnPageList - 1) + ');" ><span class="blind">이전 페이지</span></a>';
			            	}else{
			            		innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
			            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
			            	}
			            }else{
			            	innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
		            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
			            }
			            
			            
			            if (lastPageNoOnPageList > totalPageCount){
			                lastPageNoOnPageList = totalPageCount;
			            }
		            	
		            	for(var i=firstPageNoOnPageList; i<= lastPageNoOnPageList; i++){
		            		
			                if(i==cPage){
			                	innerHtml +='<a href="javascript:void(0)" class="num active">' + i + '</a>';
			                }else{
			                	innerHtml +='<a href="javascript:goPage(' + i + ')" class="num">' + i + '</a>';
			                }
			            }
			            	
		            	if(totalPageCount > pagingSize){
			                if(lastPageNoOnPageList < totalPageCount){
			                	innerHtml +='<a class="nav next" href="javascript:goPage('+ (lastPageNoOnPageList + 1) + ')"><span class="blind">다음페이지</span></a>';
			                	innerHtml +='<a class="nav last" href="javascript:goPage('+ lastPageNo +')" ><span class="blind">끝 페이지</span></a>';
			                }else {
			                	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
			                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
			                }
			            } else {
			            	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
		                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
			            }
		            	
		            	$("#commPg").html(innerHtml);
					}
					
					$("#commCnt").text(data.totalCount);
					
				}, error : function(err) {
					window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
				}
			});			// goPage end 
			
		};
		
		insertKeepingContents = function(MEM_CTS_GBN_IDX){
    		$.ajax({
    			async : false,
    			type : "POST",
    			data : {
    				"MEM_CTS_GBN_IDX" : MEM_CTS_GBN_IDX
    				,"MEM_CTS_GBN" : "E" //기획전:P, 이벤트:E, 매거진:M
    			},
    			url : "<c:out value="${frontDomain}" />/pc/contents/insertInterestContentsAjax.do",
    			success : function(data) {
    				var result = data.result;//0:로그인 필요 1:성공 -1:실패
    				if(result == 0){
    					if(confirm(data.resultMsg)){
    						var url = location.href;
    						url = encodeURIComponent(url);
    			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
    					}
    				}else{
    					alert(data.resultMsg);
    				}
    			},
    			error : function(err) {
    				alert("오류가 발생하였습니다.\n[" + err.status + "]");
    				window.jquery
    						|| console
    								.log('오류가 발생하였습니다: ' + err.status);
    			}
    		});
    	};
    	
    	$(document).on("click", ".btn_del", function(){
    		
    		$.evMarThis = $(this);
    		var evt_rpl_idx			= $.evMarThis.data("evt_rpl_idx");
    		var evt_mst_idx			= $.evMarThis.data("evt_mst_idx");
    		
    		if(confirm("응모 취소 시 차감된 크라운은 재적립되지 않습니다. 응모를 취소하시겠습니까?" )){
    			
	    		$.ajax({
	    			async : false,
	    			type : "POST",
	    			data : {
	    				"EVT_RPL_IDX" : evt_rpl_idx
	    				,"EVT_MST_IDX" : evt_mst_idx
	    			},
	    			url : "<c:out value="${frontDomain}" />/pc/event/delEventRpl.do",
	    			success : function(data) {
	    				var result = data.result;//0:로그인 필요 1:성공 -1:실패
	    				if(result == 0){
	    					if(confirm(data.resultMsg)){
	    						var url = location.href;
	    						url = encodeURIComponent(url);
	    			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
	    					}
	    				}else{
	    					alert(data.resultMsg);
	    					if(data.result > 0){
	    						$("#comment").val('');
								goPage(1);
	    					}
	    				}
	    			},
	    			error : function(err) {
	    				alert("오류가 발생하였습니다.\n[" + err.status + "]");
	    				window.jquery
	    						|| console
	    								.log('오류가 발생하였습니다: ' + err.status);
	    			}
	    		});
    		}
    	});
    		
	</script>
</section>
<!--// #wrap E -->
</body>
</html>
