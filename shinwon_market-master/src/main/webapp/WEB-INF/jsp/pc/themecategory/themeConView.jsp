<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>
<body class="page-theme">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<form method="post" name="sfrm" id="sfrm">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${paging.cPage }" />" />
	<input type="hidden" name="MGZ_MST_IDX" id="MGZ_MST_IDX" value="<c:out value="${info.MGZ_MST_IDX }" />"/>
	<input type="hidden" name="orderType" id="orderType" value="<c:out value="${info.orderType }" />" />
	<input type="hidden" name="searchMgzMstThmCtg1" id="searchMgzMstThmCtg1" value="<c:out value="${info.MGZ_MST_THM_CTG1 }" />" />
	<input type="hidden" name="searchMgzMstThmCtg2" id="searchMgzMstThmCtg2" value="<c:out value="${info.MGZ_MST_THM_CTG2 }" />" />
	<input type="hidden" name="searchMgzMstThmCtg3" id="searchMgzMstThmCtg3" value="<c:out value="${info.MGZ_MST_THM_CTG3 }" />" />
	 
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->
			
			<c:if test="${info.MGZ_MST_THM_CTG1 eq '2251' }">
			<!-- .wedding_d S -->
			<section class="wedding_d">
				
				<!-- .search S -->
				<div class="search">
					<dl>
						<dt>
							<div class="blind">
								<strong>Your Sweet Wedding</strong>
								<h2>결혼하세요?</h2>
								<h3>시간은 없고, 뭘 구입해야 할지 고민중이시라면<br/>마켓플랜트 웨딩킹에서 척척 해결하세요~</h3>
							</div>
						</dt>
						<dd>
							<label for="inp_search">
								<input type="text" id="inp_search" name="searchKeyword" placeholder="Wedding plan의 모든 것! 키워드로 검색하세요" value="<c:out value="${commandMap.searchKeyword }" />" />
								<a href="javascript:void(0)" class="ico_search"><span class="blind">검색하기</span></a>
							</label>
						</dd>
					</dl>
					<i class="msk_gr"></i>
					<iframe src="https://player.vimeo.com/video/149854253?autoplay=1&loop=1&title=0&byline=0&portrait=0" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
				</div>
				<!--// .search E -->
			</c:if>
			<c:if test="${info.MGZ_MST_THM_CTG1 eq '2252' }">
			<section class="sing_d">
				<!-- .search S -->
				<div class="search">
					<dl class="minW">
						<dt class="blind">
							<h3>당신의 화려하고 당당한 싱글라이프!<strong>마켓플랜트 싱글킹</strong>이 도와드립니다.</h3>
						</dt>
						<dd>
							<label for="inp_search">
								<input type="text" id="inp_search" placeholder="single plan의 모든 것!  키워드로 검색하세요" value="<c:out value="${commandMap.searchKeyword }" />" />
								<a href="javascript:void(0)" class="ico_search"><span class="blind">검색하기</span></a>
							</label>
						</dd>
					</dl>
				</div>
				<!-- .search E -->
			</c:if>
			<c:if test="${info.MGZ_MST_THM_CTG1 eq '2253' }">
			<section class="clean_d">				
				<!-- .search S -->
				<div class="search">
					<dl class="minW">
						<dt>
							<h2><img src="<c:out value="${cdnDomain}" />/pc/img/cleanking/ti_title.png" alt="홈케어서비스 마켓플랜트 cleanKING(클린킹)" /></h2>
							<h3>
								홈클리닝의 모든 것!  프리미엄 홈 클리닝 서비스 open!<br/>
								미세먼지, 찌든 곰팡이, 배관악취 등 가족 건강의 위험요소들   <br/>
								마켓플랜트 클린킹에서 척척 해결하세요~
							</h3>
						</dt>
						
						<dd>
							<img src="<c:out value="${cdnDomain}" />/pc/img/cleanking/img_person.png" alt="" class="img_person" />
							<label for="inp_search">
								<input type="text" id="inp_search" name="searchKeyword" placeholder="home cleaning의 모든 것!  키워드로 검색하세요" />
								<a href="javascript:void(0)" class="ico_search"><span class="blind">검색하기</span></a>
							</label>
						</dd>
						
					</dl>
				</div>
				<!-- .search E -->
				</c:if>					
				<!-- .theme_vw S -->
				<div class="theme_vw">
					<!-- magazine-view S -->
					<div class="minW magazine-view">

						<div class="head">
							<h5>
								<strong>테마가이드</strong>
								<span><c:out value="${info.MGZ_MST_THM_CTG1_NM}" /></span>
							</h5>

							<p class="ar">
								<a href="javascript:;" class="sns kakao"><span class="blind">카카오스토리 공유</span></a>
								<a href="javascript:;" class="sns twitter"><span class="blind">트위터 공유</span></a>
								<a href="javascript:;" class="sns facebook"><span class="blind">페이스북 공유</span></a>
								<a href="javascript:;" class="sns pinterest"><span class="blind">pinterest 공유</span></a>

								<a href="javascript:insertKeepingContents(<c:out value="${info.MGZ_MST_IDX}" />);" class="btn_st0 btn_white small keeping"><span>키핑</span></a>
								<a href="javascript:;" class="btn_st0 btn_white small keeping" id="listLink"><span>목록</span></a>
							</p>
							
						</div>

						<div class="body"><!-- body -->

							<div class="detail"><!-- detail -->
								<p class="desc"><c:out value="${info.MGZ_MST_SRS }" /></p>

								<p class="title"><c:out value="${info.MGZ_MST_TITLE }" /></p>
								<p>
								<c:if test="${not empty info.CMM_FLE_SAVE_PATH }">
								<img src="<c:out value="${cdnDomain }${info.CMM_FLE_SAVE_PATH }" />" alt="" />
								<c:out value="${info.MGZ_MST_CTS }" escapeXml="false" />
								</p>
								</c:if>
							</div><!-- // detail -->

							<h5 class="title-product"><span><em class="blind">관련상품</em></span></h5>

							<div class="product-list-a"><!-- product-list-a -->
								<ul class="ct">
									<c:choose>
										<c:when test="${not empty list }">
											<c:set var="listNum" value="1" />
											<c:forEach var="listProduct" items="${list }" varStatus="status">
												
					                            <li>
					                                <div class="module">
					                                    <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD }" />" >
					                                        <i class="ico_best0<c:out value="${listNum }"/>"><span class="blind">best 0<c:out value="${listNum }"/></span></i>
															<span class="thumb"><img class="thumb200" src="<c:out value="${cdnDomain}" />/<c:out value="${listProduct.PRD_IMAGE}" />" alt="<c:out value="${listProduct.PRD_IMAGE_ALT}" />" /></span>
															<span class="subject"><c:out value="${listProduct.PRD_MST_NM }"/></span>
					                                    </a>
					                                    <div class="utill">
					                                        <a href="javascript:void(0)" class="view"><span class="blind">상품 크게보기</span></a>
															<a href="javascript:insertCart('<c:out value="${listProduct.PRD_MST_CD}" />','<c:out value="${listProduct.PRD_MST_OPT_EST_CNT}" />');" class="cart"><span class="blind">상품 장바구니에 담기</span></a>
															<a href="<c:out value="${frontDomain}" />/pc/product/product.do?prdMstCd=<c:out value="${listProduct.PRD_MST_CD}" />" target="_blank"" class="sns"><span class="blind">상품 공유하기</span></a>
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
											등록된 관련상품이 없습니다.
										</c:otherwise>
									</c:choose>
								</ul>
							</div><!-- // product-list-a -->

							 <div class="qna-search"><!-- qna-search -->
		                        <h5>&ldquo;궁금한 내용을 질문해 주세요&rdquo;</h5>
		                        <label for="searchQna"><span class="blind">e매거진 Q&amp;A</span></label>
		                        <input type="text" id="MGZ_QNA_QST" class="text" placebody="로그인 후 질문해 주세요." title="로그인 후 질문해 주세요." />
		                        <span class="byte tx_num"></span>
		                        <a href="javascript:;" class="btn_st2 btn_white large" id="emagazineQuest"><span>질문하기</span></a>
		                    </div><!-- // qna-search --

							<table class="bbs-list mt20"><!-- bbs-list -->
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
				</div>
				<!--// .theme_vw E -->
				
				
			</section>
			<!-- .wedding_d E -->
			
		


		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	<input type="hidden" id="NEXT_MGZ_MST_IDX" name="NEXT_MGZ_MST_IDX" value="<c:out value="${info.NEXT_MGZ_MST_IDX}" />"/>
	<input type="hidden" id="BEF_MGZ_MST_IDX" name="BEF_MGZ_MST_IDX" value="<c:out value="${info.BEF_MGZ_MST_IDX}" />"/>
	<input type="hidden" id="CUR_MGZ_MST_IDX" name="CUR_MGZ_MST_IDX" value="<c:out value="${info.MGZ_MST_IDX}" />"/>
	
	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	<script type="text/javascript">
	$(function(){
		var url = $(location).attr('href');
	    
		$(document).on("keyup", "#MGZ_QNA_QST", function(){
			var maximumCount 	= 200;
			var str 			= $("#MGZ_QNA_QST").val();
			var now 			= calculate_msglen(str);
			
			if(now > maximumCount){
				alert("글자 입력수가 초과하였습니다.");
				$("#MGZ_QNA_QST").val(assert_msglen(str, maximumCount));
				now = calculate_msglen($("#MGZ_QNA_QST").val());
			}
			
			$(".tx_num").text(now + '/'+ maximumCount + 'byte');
		});
		
		$(".tx_num").text('0/200byte');
		
		$(document).on("click", "#emagazineQuest", function(){
			// 세션 부분 처리 추가
			var MGZ_QNA_QST		= $("#MGZ_QNA_QST").val();
			var MGZ_MST_IDX		= $("#CUR_MGZ_MST_IDX").val();
				
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
						   ,"MGZ_QNA_REG_ID"	: "sosoworld9"//추후에 아이디 넣어야 함.
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
			//if(confirm("삭제하시겠습니까??")){
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
			//}
		});
		
		goReqPage		= function(page){
//			alert("goReqPage");
			var dataCnt = 0;
			var MGZ_MST_IDX = $("#CUR_MGZ_MST_IDX").val();
		 	$.ajax({
				type		: "POST",
				url			: "/pc/contents/emagazineQnaListAjax.do",
				dataType	: "json",
				data		: {	"MGZ_MST_IDX" : MGZ_MST_IDX
								,"cPage": page
								},
				success : function(data) {
					var innerHtml	= '<ul class="ct">';
					if(data.totalPageCount == 0){
						innerHtml = "";
						
					}else{
						 
						var listNum		= data.listNum;
						$.each(data.resultMap.qnaList, function(i,item){
							dataCnt++;
							innerHtml += '<tr>';
							innerHtml += '<td class="number">'+item.RNUM+'</td>';
							innerHtml += '<td class="subject">';
							innerHtml += '<span class="icon type q"><span class="blind">질문</span></span>';
							innerHtml += '<a href="javascript:;" class="question">'+item.MGZ_QNA_QST+'</a>';
							//여기도 세션 처리 해야함 로그인한 아이디와 글작성 한 아이디가 동일한 경우에만 노출
							innerHtml += '<a href="javascript:;" class="btn_st0 btn_white xxsmall qnaDel" data-mgz_qna_idx="'+item.MGZ_QNA_IDX+'"><span>삭제</span></a>';
							innerHtml += '</td>';
							innerHtml += '<td class="author">'+item.MGZ_QNA_REG_ID_DSP+'</td>';
							innerHtml += '<td class="date">'+item.MGZ_QNA_REG_DT_DSP+'</td>';
							innerHtml += '<td class="condition">';
							if(item.MGZ_QNA_ANR_YN =="Y") innerHtml += '<span class="icon yes"><span class="blind">답변완료</span></span>';
							if(item.MGZ_QNA_ANR_YN !="Y") innerHtml += '<span class="icon no"><span class="blind">답변전</span></span>';
							innerHtml += '</td>';
							innerHtml += '</tr>';
							innerHtml += '<tr class="answer">';
							innerHtml += '<td class="number">&nbsp;</td>';
							innerHtml += '<td colspan="4" class="substance">';
							innerHtml += '<div class="module">';
							innerHtml += '<span class="icon type a"><span class="blind">답변</span></span>';
							innerHtml += item.MGZ_QNA_ANR;
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
			$("#sfrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/themeConList.do").submit();
		});
		
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
    	
    	
		// 관심등록
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
	</script>
</section>
<!--// #wrap E -->
</body>
</html>
