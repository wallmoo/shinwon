<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-magazine">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
<div class="section-visual"><!-- section-visual -->
        <div class="minW">
            <img src="<c:out value="${cdnDomain}" />/pc/img/custom/magazine_visual.png" alt="스마트라이프를 위한 마켓플랜트의 감성채널 e매거진. for your smart shopping life" />
        </div>
    </div><!-- // section-visual -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<!-- .magazine-nav s -->
		<div class="magazine-nav">
            <h3 class="blind">e매거진</h3>
            <nav class="nav_d">
	            <ul class="minW ct tab-magazine"><!-- tab-magazine -->
	                <li class="nth-child-1 <c:if test="${info.MGZ_MST_CTG eq '2014'}">active</c:if>"><a href="javascript:goMain('2014');"><span>라이프가이드</span></a></li>
	                <li class="nth-child-2 <c:if test="${info.MGZ_MST_CTG eq '2015'}">active</c:if>"><a href="javascript:goMain('2015');"><span>구매가이드</span></a></li>
	                <li class="nth-child-3 <c:if test="${info.MGZ_MST_CTG eq '2016'}">active</c:if>"><a href="javascript:goMain('2016');"><span>상품리뷰</span></a></li>
	                <li class="nth-child-4 <c:if test="${info.MGZ_MST_CTG eq '2017'}">active</c:if>"><a href="javascript:goMain('2017');"><span>상품뉴스</span></a></li>
	<%--                 <li class="nth-child-5 <c:if test="${info.MGZ_MST_CTG eq '2018'}">active</c:if>"><a href="javascript:;"><span>Stuff</span></a></li> --%>
	                <li class="nth-child-5 <c:if test="${info.MGZ_MST_CTG eq '2279'}">active</c:if>"><a href="javascript:goMain('2279');"><span>테마</span></a></li>
	            </ul><!-- // tab-magazine -->
            </nav>
		</div>
		
       	<div class="minW magazine-view"><!-- magazine-view -->

           <div class="head">
               <h4>
                   <span><c:if test="${info.MGZ_MST_CTG ne '2279'}"><c:out value="${info.MGZ_MST_CTG_NM}" /></c:if>
                   <c:if test="${info.MGZ_MST_CTG eq '2279'}">테마 - <c:out value="${info.MGZ_MST_THM_CTG1_NM}" /></c:if>
                   </span>
                   <strong><c:out value="${info.MGZ_MST_TITLE}" /></strong>
               </h4>

               <a href="javascript:void(0);" class="list" id="listLink"><span class="blind">목록</span></a>

               <div class="nav">
                <c:if test="${not empty info.BEF_MGZ_MST_IDX}">
                    <a href="javascript:goBefPage();" class="prev"><span class="blind">이전 게시글</span></a>
                </c:if>
                <c:if test="${not empty info.NEXT_MGZ_MST_IDX}">
                    <a href="javascript:goNextPage();" class="next"><span class="blind">다음 게시글</span></a>
                </c:if>
               </div>
           </div>

			<div class="body"><!-- body -->
				<div class="hd_box">
	                <p class="location">
	                	<c:if test="${info.MGZ_MST_CTG ne '2279'}"><c:out value="${info.MGZ_MST_GBN_NM}" /> > </c:if>
	                	<c:if test="${info.MGZ_MST_CTG eq '2279'}"><c:out value="${info.MGZ_MST_THM_CTG2_NM}" /> > <c:out value="${info.MGZ_MST_THM_CTG3_NM}" /></c:if>
	                </p>
	
	                <p class="ar">
	                    <a href="javascript:goProductKakaoStory();" class="sns kakao"><span class="blind">카카오스토리 공유</span></a>
	                    <a href="javascript:goProductTwitter();" class="sns twitter"><span class="blind">트위터 공유</span></a>
	                    <a href="javascript:goProductFacebook();" class="sns facebook"><span class="blind">페이스북 공유</span></a>
	                    <a href="javascript:insertKeepingContents(<c:out value="${info.MGZ_MST_IDX}" />);" class="btn_st0 btn_white small keeping"><span>키핑</span></a>
	                </p>
				</div>
               	<div class="detail"><!-- detail -->
                   	<p class="desc"><c:out value="${info.MGZ_MST_SRS}" /></p>

                   	<p class="title"><c:out value="${info.MGZ_MST_TITLE}" /></p>
                   	<p>
                   		<c:choose>
                   			<c:when test="${info.MGZ_MST_KID eq 'M' }">
                   				<iframe width="820" height="480" src="https://www.youtube.com/embed/<c:out value="${info.MGZ_MST_CTS}" escapeXml="false"/>?vq=hd1080&amp;showinfo=0&amp;rel=0&amp;modestbranding=1&amp;wmode=opaque" frameborder="0" allowfullscreen=""></iframe>
                   			</c:when>
                   			<c:otherwise>
                   				<c:out value="${info.MGZ_MST_CTS}" escapeXml="false"/>
                   			</c:otherwise>
                   		</c:choose>
                       
                   	</p>
               	</div><!-- // detail -->

               	<h5 class="title-product"><span><em class="blind">관련상품</em></span></h5>

               	<div class="product-list-a"><!-- product-list-a -->
                   	<ul class="ct">
                    
                   	<c:choose>
						<c:when test="${not empty listProduct }">
							<c:set var="listNum" value="1" />
							<c:forEach var="listProduct" items="${listProduct }" varStatus="status">
				
							<li>
								<div class="module">
	                            	<a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD }" />">
	                            	<i class="ico_best0<c:out value="${listNum }"/>"><span class="blind">best 0<c:out value="${listNum }"/></span></i>
									<span class="thumb"><img class="thumb200" src="<c:out value="${cdnDomain}" />/<c:out value="${listProduct.PRD_IMAGE}" />" alt="<c:out value="${listProduct.PRD_IMAGE_ALT}" />" /></span>
									<span class="subject"><c:out value="${listProduct.PRD_MST_NM }"/></span>
	                                </a>
	                                <div class="utill">
										<a href="javascript:goProductView('<c:out value="${listProduct.PRD_MST_CD}" />')" class="view"><span class="blind">상품 크게보기</span></a>
										<a href="javascript:insertCart('<c:out value="${listProduct.PRD_MST_CD}" />','<c:out value="${listProduct.PRD_MST_OPT_EST_CNT}" />');" class="cart"><span class="blind">상품 장바구니에 담기</span></a>
										<a href="<c:out value="${frontDomain}"/>/pc/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD}" />" target="_blank"" class="sns"><span class="blind">상품 공유하기</span></a>
										<a href="javascript:insertKeeping('<c:out value="${listProduct.PRD_MST_CD}" />');" class="wish"><span class="blind">상품 찜하기</span></a>
	                                </div>
	                                <p class="price-before"><strong><fmt:formatNumber value="${listProduct.PRD_MST_ERP_DSP_PRC }" groupingUsed="true" /></strong><span>원</span></p>
									<p class="price-after"><strong><fmt:formatNumber value="${listProduct.PRD_MST_PRICE }" groupingUsed="true" /></strong><span>원</span></p>
									<p class="reviews">
	                                     <span class="blind">상품평균점수 5점 만점 중</span>
	                                     <i class="ico_star2"><i class="star_<c:out value="${listProduct.REP_POINT_GRD }"/>"><span class="ir"><c:out value="${listProduct.REP_POINT }"/>점</span></i></i>
	                                     <span class="blind">상품평 등록</span>
	                                     <span class="number"><c:out value="${listProduct.REP_CNT }"/>개</span>
	                                </p>
	                                <p class="ico_box">
										<ui:replaceLineBreak content="${listProduct.PRD_MST_ICON_LIST }"/>
									</p>
	                             </div>
	                         </li>
                       		<c:set var="listNum" value="${listNum + 1 }" />
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p class="message no-more">
								등록된 관련상품이 없습니다.
							</p>
						</c:otherwise>
					</c:choose>
                   </ul>
               </div><!-- // product-list-a -->

               <div class="qna-search"><!-- qna-search -->
                   <h5>&ldquo;궁금한 내용을 질문해 주세요&rdquo;</h5>
                   <label for="searchQna">
                   	<span class="blind">e매거진 Q&amp;A</span>
                   	<input type="text" id="MGZ_QNA_QST" class="text" <c:if test="${sessionUser.ROLE_USER ne 'user'}">placeholder="로그인 후 질문해 주세요."</c:if> title="로그인 후 질문해 주세요." />
                   	<span class="byte tx_num"></span>
                   </label>
                   <a href="javascript:;" class="btn_st2 btn_white large" id="emagazineQuest"><span>질문하기</span></a>
               </div><!-- // qna-search -->
               
               	<p class="ar mt20">
                   	<a id="MyComment" href="javascript:goMyComment();" class="btn_st0 btn_white small" style="display:none;"><span>MY 댓글보기</span></a>
                   	<a id="AllComment" href="javascript:goAllComment();" class="btn_st0 btn_white small" style="display:none;"><span>전체 댓글보기</span></a>
               	</p>
              
               <table id="emagazineQnaTable" class="bbs-list"><!-- bbs-list -->
               <caption>번호, Q&amp;A, 작성자, 작성일, 답변여부로 구성된 질문과 답변 목록입니다.</caption>
	               <colgroup>
	                   <col style="width: 8%;" />
	                   <col style="width: auto%;" />
	                   <col style="width: 14%;" />
	                   <col style="width: 12%;" />
	                   <col style="width: 10%;" />
	               </colgroup>
	               		<thead>
                   	<tr>
                       <th scope="col">번호</th>
                       <th scope="col">Q&amp;A</th>
                       <th scope="col">작성자</th>
                       <th scope="col">작성일</th>
                       <th scope="col">답변여부</th>
                   </tr>
	               </thead>
	               <tbody id="emagazineQnaList">
	                    
	            	</tbody>
				</table><!-- // bbs-list -->
				<div class="section-pagination" id="ask_pg" style="padding:30px 0;">
					<ui:frontpaging paging="${reqPaging }" jsFunction="goReqPage" />
				</div>
           </div><!-- // holder -->
       </div><!-- // magazine-view -->

		</div><!--// .contents E -->
	</article>
	<input type="hidden" id="NEXT_MGZ_MST_IDX" name="NEXT_MGZ_MST_IDX" value="<c:out value="${info.NEXT_MGZ_MST_IDX}" />"/>
	<input type="hidden" id="BEF_MGZ_MST_IDX" name="BEF_MGZ_MST_IDX" value="<c:out value="${info.BEF_MGZ_MST_IDX}" />"/>
	<input type="hidden" id="CUR_MGZ_MST_IDX" name="CUR_MGZ_MST_IDX" value="<c:out value="${info.MGZ_MST_IDX}" />"/>
	<form id="frm">
		<input type="hidden" id="MGZ_MST_IDX" name="MGZ_MST_IDX" value=""/>
		<input type="hidden" id="MGZ_QNA_REG_ID" name="MGZ_QNA_REG_ID" value="<c:out value="${commandMap.MGZ_QNA_REG_ID}" />"/>
	</form>
	<form id="mainFrm">
		<input type="hidden" id="searchMgzMstCtg" name="searchMgzMstCtg" value="<c:out value="${commandMap.searchMgzMstCtg}" />"/>
		<input type="hidden" id="cPage" name="cPage" value="<c:out value="${commandMap.cPage}" />"/>
	</form>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	 <script type="text/javascript">
	 var MEM_MST_MEM_ID = '<c:out value="${sessionUser.MEM_MST_MEM_ID}" />';
	 var ROLE_USER = '<c:out value="${sessionUser.ROLE_USER}" />';
	 
	 <c:if test="${sessionUser.ROLE_USER eq 'user' &&  iMyReqCnt > 0}">
	 	$("#MyComment").show();
     </c:if>
     
	 $("#AllComment").hide();
	 
    	$(function(){
    		
    	 var stickyMagazine = function() {
	        var $window = $(window),
 		            $html = $('html'),
  		            magazineView = $('.magazine-view'),
  		            magazineTitle = magazineView.find('.detail'),
   		            _offsetTop = magazineView.offset().top,
   		            _subjectTop = magazineTitle.offset().top;

	        $window .on('scroll', function(e) {
		            e.preventDefault();

  		            if ($window.scrollTop() > _offsetTop) {
   		                $html.addClass('sticky');

   		                if ($window.scrollTop() > _subjectTop) {
   		                    magazineView.addClass('in');
   		                }
    		            } else {
    		                $html.removeClass('sticky');
    		                magazineView.removeClass('in');
    		            }
    		        });
    		    };

    		    stickyMagazine();
    		
    		var url = $(location).attr('href');
    
			$(document).on("keyup", "#MGZ_QNA_QST", function(){
				var maximumCount 	= 200;
				var str 			= $("#MGZ_QNA_QST").val();
				var now 			= calculate_msglen(str);
				
				if(ROLE_USER != 'user')
		    	{
		    		var retVal = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
		    		if( retVal == true ){
		    			var url = location.href;
						url = encodeURIComponent(url);
			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
		             
		    		}else{
		    			$("#MGZ_QNA_QST").val("");
		    			return;
		    		}

		    	}
				
				if(now > maximumCount){
					alert("글자 입력수가 초과하였습니다.");
					$("#MGZ_QNA_QST").val(assert_msglen(str, maximumCount));
					now = calculate_msglen($("#MGZ_QNA_QST").val());
				}
				
				$(".tx_num").text(now + '/'+ maximumCount + 'byte');
			});
			
			$(".tx_num").text('0/200byte');
			//$("#MGZ_QNA_QST").trigger("keyup");
				
			$(document).on("click", "#emagazineQuest", function(){
				// 세션 부분 처리 추가
				var MGZ_QNA_QST		= $("#MGZ_QNA_QST").val();
				var MGZ_MST_IDX		= $("#CUR_MGZ_MST_IDX").val();
					
				if(ROLE_USER != 'user')
		    	{
		    		var retVal = confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
		    		if( retVal == true ){
		    			var url = location.href;
						url = encodeURIComponent(url);
			        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
		             
		    		}else{
		    			$("#MGZ_QNA_QST").val("");
		    			return;
		    		}

		    	}
				
				if(calculate_msglen(MGZ_QNA_QST) > 200){
					alert("질문내용은 영문 200글자,한글 100글자까지  입력할수있습니다.");
					$("#MGZ_QNA_QST").focus();
					return;
				}
				
				$.ajax({
					type	: "POST",
					url		: "/pc/contents/emagazineQnaAjax.do",
					dataType: "json",
					data	: {	"MGZ_MST_IDX" : MGZ_MST_IDX
							   ,"MGZ_QNA_QST" 	: MGZ_QNA_QST
							   ,"MGZ_QNA_REG_ID"	: MEM_MST_MEM_ID//추후에 아이디 넣어야 함.
								},
					success : function(data) {
						//alert(data.resultMsg);
						// 값 초기화.
						$("#MGZ_QNA_QST").val('');
						$("#MGZ_QNA_QST").trigger("keyup");
						goReqPage(1);
					}, error : function(err) {
						window.jquery
							|| console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
				
			});
			
			calculate_msglen = function(message) {
				var nbytes = 0;
				
				for (i=0; i<message.length; i++) {
					var ch = message.charAt(i);
					if(escape(ch).length > 4) {
						 nbytes += 2;
					} else if (ch == '\n') {
						 if (message.charAt(i-1) != '\r') {
						 nbytes += 1;
				 		}
				 	} else if (ch == '<' || ch == '>') {
				 		nbytes += 4;
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
						 inc = 2;
					 } else if (ch == '\n') {
					 	if (message.charAt(i-1) != '\r') {
							 inc = 1;
					 	}
					 } else if (ch == '<' || ch == '>') {
					 	inc = 4;
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
		 	
			$(document).on("click", ".qnaDel", function(){
				
				var MGZ_QNA_IDX = $(this).data("mgz_qna_idx");
				
				//alert("MGZ_QNA_IDX : "+MGZ_QNA_IDX);
				if(confirm("삭제하시겠습니까??")){
					$.ajax({
						type	: "POST",
						url		: "/pc/contents/emagazineDelAjax.do",
						dataType: "json",
						data	: {	"MGZ_QNA_IDX": MGZ_QNA_IDX
									,"MGZ_QNA_UPD_ID" : "skarldnd1"//추후에 아이디 넣어야 함.
									},
						success : function(data) {
						//	alert(data.resultMsg);
							goReqPage(1);
						}, error : function(err) {
							window.jquery
								|| console.log('오류가 발생하였습니다: ' + err.status);
						}
					});
				}
			});
			
			goReqPage		= function(page){
//				alert("goReqPage");
				var dataCnt = 0;
				var MGZ_MST_IDX = $("#CUR_MGZ_MST_IDX").val();
				var MGZ_QNA_REG_ID = $("#MGZ_QNA_REG_ID").val();
			 	$.ajax({
					type		: "POST",
					url			: "/pc/contents/emagazineQnaListAjax.do",
					dataType	: "json",
					data		: {	"MGZ_MST_IDX" : MGZ_MST_IDX
									,"MGZ_QNA_REG_ID":MGZ_QNA_REG_ID
									,"cPage": page
									},
					success : function(data) {
						var innerHtml	= '';
						var totalCount = data.totalCount;
						if(data.totalPageCount == 0){
							innerHtml = "";
							
						}else{
							 
							var listNum		= data.listNum;
							$.each(data.resultMap.qnaList, function(i,item){
								dataCnt++;
								var rNum = parseInt(totalCount) + 1 - parseInt(item.RNUM);
								
								var MGZ_QNA_ANR = item.MGZ_QNA_ANR
								if(MGZ_QNA_ANR=="")MGZ_QNA_ANR="빠른 답변 드리도록 하겠습니다. 감사합니다.";
							
								
								innerHtml += '<tr>';
								innerHtml += '<td class="number">'+ rNum+'</td>';
								innerHtml += '<td class="subject">';
								innerHtml += '<span class="icon type q"><span class="blind">질문</span></span>';
								innerHtml += '<a href="javascript:;" class="question">'+item.MGZ_QNA_QST+'</a>';
								//여기도 세션 처리 해야함 로그인한 아이디와 글작성 한 아이디가 동일한 경우에만 노출
								if(MEM_MST_MEM_ID==item.MGZ_QNA_REG_ID)
								{
									innerHtml += ' <a href="javascript:;" class="btn_st0 btn_white xxsmall qnaDel" data-mgz_qna_idx="'+item.MGZ_QNA_IDX+'"><span>삭제</span></a>';
								}
								innerHtml += '</td>';
								innerHtml += '<td class="author">'+item.MGZ_QNA_REG_ID_DSP+'</td>';
								innerHtml += '<td class="date">'+item.MGZ_QNA_REG_DT_DSP+'</td>';
								innerHtml += '<td class="condition">';
// 								if(item.MGZ_QNA_ANR_YN =="Y") innerHtml += '<span class="icon yes"><span class="blind">답변완료</span></span>';
// 								if(item.MGZ_QNA_ANR_YN !="Y") innerHtml += '<span class="icon no"><span class="blind">답변전</span></span>';
								if(item.MGZ_QNA_ANR_YN =="Y") innerHtml += '<span>답변완료</span>';
								if(item.MGZ_QNA_ANR_YN !="Y") innerHtml += '<span>-</span>';
								innerHtml += '</td>';
								innerHtml += '</tr>';
								innerHtml += '<tr class="answer">';
								innerHtml += '<td class="number">&nbsp;</td>';
								innerHtml += '<td colspan="4" class="substance">';
								innerHtml += '<div class="module">';
								innerHtml += '<span class="icon type a"><span class="blind">답변</span></span>';
								innerHtml += MGZ_QNA_ANR;
								innerHtml += '</div>';
								innerHtml += '</td>';
								innerHtml += '</tr>';
							});
							
							$("#emagazineQnaList").html(innerHtml);
							
							com.accordion($('.magazine-view .bbs-list a.question'), 'tr');
							
							
							if(dataCnt == 0)
							{
								$("#emagazineQnaTable").hide();
								$("#ask_pg").hide();
							}
							else
							{
								$("#emagazineQnaTable").show();
								$("#ask_pg").show();
							}
							
					
							if(data.iMyReqCnt > 0){
								if($("#MGZ_QNA_REG_ID").val() == ''){
									$("#MyComment").show();
				                   	$("#AllComment").hide();
								}else{
									$("#MyComment").hide();
				                   	$("#AllComment").show();
								}
							}else{
								$("#MyComment").hide();
			                   	$("#AllComment").hide();
							}
							
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
				            		innerHtml += '<a class="nav first" href="javascript:goReqPage(' + firstPageNo + ');" ><span class="blind">처음 페이지</span></a>';
				            		innerHtml += '<a class="nav prev" href="javascript:goReqPage(' + (firstPageNoOnPageList - 1) + ');" ><span class="blind">이전 페이지</span></a>';
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
				                	innerHtml +='<a href="javascript:void(0)" class="num active" style="margin-left:3px;">' + i + '</a>';
				                }else{
				                	innerHtml +='<a href="javascript:goReqPage(' + i + ')" class="num" style="margin-left:3px;">' + i + '</a>';
				                }
				            }
			            	if(totalPageCount > pagingSize){
				                if(lastPageNoOnPageList < totalPageCount){
				                	innerHtml +='<a class="nav next" href="javascript:goReqPage('+ (lastPageNoOnPageList + 1) + ')"><span class="blind">다음페이지</span></a>';
				                	innerHtml +='<a class="nav last" href="javascript:goReqPage('+ lastPageNo +')" ><span class="blind">끝 페이지</span></a>';
				                }else {
				                	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
				                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
				                }
				            } else {
				            	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
			                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
				            }
				            	
				            $("#ask_pg").html(innerHtml);
				            
						}
						//$("#reqCnt").text(data.totalRecordCount);
						
					}, error : function(err) {
						window.jquery
							|| console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
			}; // goReqPage end
			
			 
			
			$(document).on("click", "#listLink", function(){
				//location.href ="/pc/contents/emagazineMain.do";	
				$("#mainFrm").attr("action", "/pc/contents/emagazineMain.do").submit();
			});
			
			goNextPage		= function(){
				var MGZ_MST_IDX = $("#NEXT_MGZ_MST_IDX").val();
				if(MGZ_MST_IDX != "")
				{
	    			$("#MGZ_MST_IDX").val(MGZ_MST_IDX);
	    			$("#frm").attr("action", "/pc/contents/emagazineView.do").submit();
				}
    		};
    		
    		goBefPage		= function(){
    			var MGZ_MST_IDX = $("#BEF_MGZ_MST_IDX").val();
				if(MGZ_MST_IDX != "")
				{
	    			$("#MGZ_MST_IDX").val(MGZ_MST_IDX);
	    			$("#frm").attr("action", "/pc/contents/emagazineView.do").submit();
				}
    		};
    		
    		insertCart = function(prdMstCd,prdMstOptEstCnt){
    	 		if(prdMstOptEstCnt > 0){
    	 			if(confirm("해당 상품은 필수 옵션이 있습니다\n간편보기에서 필수 옵션 선택 후 장바구니에 담을수 있습니다.\n간편보기로 이동 하시겠습니까?")){
    	 				alert("이동중");
    	 				return;
    	 			}
    	 			return;
    	 		}
    			$.ajax
    	        ({
    	            async : false,
    	            type : "POST",
    	            data : {
    	            			"PRD_MST_CD" : prdMstCd
    	            			,"OPT_DTL_IDXs" : 0
    	            			,"REQUEST_CNT_0" : 1
    	            			,"MEM_CRT_DLV_GBN" : 2096
    	            		},
    	            url : "<c:out value="${frontDomain}" />/pc/cart/insertCartAjax.do",
    	            success : function (data) 
    	            { 
    	            	// 1 : 장바구니 등록 성공
    	            	switch(data.result){
    	            	case 1:
    	            		$("#topCartCnt").html(data.cartCnt);
    	            		if(confirm('해당 상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?')){
    	            			$('#_blank_form').attr({'action':'<c:out value="${serverSslDomain}" />/pc/cart/cartlist.do','method':'get'}).submit();
    	            		}
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
    			
    		};
    		
    		// 관심등록
        	insertKeepingContents = function(MEM_CTS_GBN_IDX){
        		$.ajax({
        			async : false,
        			type : "POST",
        			data : {
        				"MEM_CTS_GBN_IDX" : MEM_CTS_GBN_IDX
        				,"MEM_CTS_GBN" : "M" //기획전:P, 이벤트:E, 매거진:M
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
        	
        	insertKeeping = function(prdMstCd){
        		$.ajax({
        			async : false,
        			type : "POST",
        			data : {
        				"PRD_MST_CD" : prdMstCd
        			},
        			url : "<c:out value="${frontDomain}" />/pc/cart/insertInterestProductAjax.do",
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
        	
        
        	goReqPage(1);
    		
      	});
    	
    	// 관심등록
    	
    
     
    	
	    goLogin		= function(){
	    	var returnUrl = location.pathname + location.search;
			location.href = "${serverSslDomain}/pc/manager/login.do?url="+returnUrl;	
	    };
	    goAllComment		= function(){
	    	$("#AllComment").hide();
	    	$("#MyComment").show();
	    	$("#MGZ_QNA_REG_ID").val("");
	    	goReqPage(1);
	    };
	    goMyComment		= function(){
	    	$("#AllComment").show();
	    	$("#MyComment").hide();
	    	$("#MGZ_QNA_REG_ID").val(MEM_MST_MEM_ID);//login id here
	    	goReqPage(1);
	    };
	    
	    goMain = function(MGZ_MST_CTG){
			//location.href ="/pc/contents/emagazineMain.do";
			$("#searchMgzMstCtg").val(MGZ_MST_CTG);
			$("#cPage").val("1");
			$("#mainFrm").attr("action", "/pc/contents/emagazineMain.do").submit();
		};
		//간편보기
		goProductView = function(prdMstCd){
			if(prdMstCd != ""){
				popup('<c:out value="${frontDomain}"/>/pc/product/productSimpleView.do?prdMstCd='+prdMstCd,"1030","900","no","productViewPopup");
			}else{
				alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
				return;
			}
		};
		
		// sns kakostory
		goProductKakaoStory = function(){
			var paramUrl = "<c:out value="${frontDomain}"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${commandMap.MGZ_MST_IDX }" />&searchMgzMstCtg=<c:out value="${commandMap.searchMgzMstCtg}" />";
			var url = 'https://story.kakao.com/share?url='+encodeURIComponent(paramUrl); 
		    window.open(url,'kakoStory','toolbar=0,status=0,width=1024,height=665'); 
		};
		
		// sns Twitter
		goProductTwitter = function(){
			var paramUrl = "<c:out value="${frontDomain}"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${commandMap.MGZ_MST_IDX }" />&searchMgzMstCtg=<c:out value="${commandMap.searchMgzMstCtg}" />";
			var url = encodeURIComponent(paramUrl);
			var text = encodeURIComponent("<c:out value="${planInfo.PLN_MST_TITLE }"/>");
			window.open("https://twitter.com/share?url="+url+"&text="+text, "twitter", "width=650, height=400");
		};
		
		// sns facebook
		goProductFacebook = function(){ 
		    var paramUrl = "<c:out value="${frontDomain}"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${commandMap.MGZ_MST_IDX }" />&searchMgzMstCtg=<c:out value="${commandMap.searchMgzMstCtg}" />"; 
		    var text = encodeURIComponent("<c:out value="${planInfo.PLN_MST_TITLE }"/>");
		    var url = 'http://www.facebook.com/sharer.php?u='+encodeURIComponent(paramUrl)+'&t='+text;
		    window.open(url,'faceBook','toolbar=0,status=0,width=1024,height=665'); 
		}; 
        
    </script>
</section>
<!--// #wrap E -->
</body>
</html>
				
