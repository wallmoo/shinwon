<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>
<body class="page-thema">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
	<!--// #left_mn E -->

	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>웨딩</h2>
            <a href="javascript:void(0)" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div>
		<!--// .section-title E -->
		
		<!-- .wedding_list S -->
		<form id="frm" name="frm" method="get" data-ajax="false">
		<input type="hidden" name="cPage" id="cPage" value="<c:out value="${paging.cPage }" />" />
		<input type="hidden" name="MGZ_MST_IDX" id="MGZ_MST_IDX" />
		<section class="thema_list wedding_list">
			<h2 class="sec_ti">
				<span>Wedding GuideBook</span>
				<strong>웨딩 가이드북</strong>
			</h2>
			
			<!-- .list_type S -->
			<dl class="list_type">
				<dt class="blind">웨딩 리스트 정렬 조건 form</dt>
				<dd class="sel_ch">
					<div class="sel_box" data-role="fieldcontain" >
						<label for="sel_ty1">
							<select id="MGZ_MST_THM_CTG2" name="MGZ_MST_THM_CTG2" onchange="goSel2();">
							<c:forEach var="row" items="${guide2DepList }" varStatus="sta">
								<option value="<c:out value="${row.CMN_COM_IDX }" />" <c:if test="${commandMap.MGZ_MST_THM_CTG2 eq  row.CMN_COM_IDX}">selected</c:if> ><c:out value="${row.CMN_COM_NM }" /></option>
							</c:forEach>								
							</select>
						</label>
						
						<label for="sel_ty2" style="min-width:170px">
							<select id="MGZ_MST_THM_CTG3" name="MGZ_MST_THM_CTG3" onchange="goPage(1);">
								<option value="">전체</option>
								<c:forEach var="row" items="${guide3DepList }" varStatus="sta">
								<c:if test="${row.CMN_COM_UP_IDX eq  commandMap.MGZ_MST_THM_CTG2}">
								<option value="<c:out value="${row.CMN_COM_IDX }" />" <c:if test="${commandMap.MGZ_MST_THM_CTG3 eq  row.CMN_COM_IDX}">selected</c:if> ><c:out value="${row.CMN_COM_NM }" /></option>
								</c:if>
								</c:forEach>
							</select>
						</label>
						
					</div>
				</dd>
				<dd class="btn_ch">
					<fieldset data-role="controlgroup" data-type="horizontal" >
						<input type="radio" name="orderType" id="ra_late" checked="checked" value="date" onchange="goPage(1);">
						<label for="ra_late">최신순</label>
						<input type="radio" name="orderType" id="ra_ask" value="visit" onchange="goPage(1);">
						<label for="ra_ask">조회순</label>
					</fieldset>
				</dd>
			</dl>
			<!--// .list_type E -->
			
			<ul class="list_d _scroll_list_ck">
				<c:forEach items="${list }" var="row" varStatus="sta">
				<c:set var="classNm" value="" />
				<c:set var="cate" value="" />
				<c:choose>
					<c:when test="${row.MGZ_MST_KID eq 'S'}">
						<c:set var="classNm" value="img_st" />
					</c:when>
					<c:when test="${row.MGZ_MST_KID eq 'T'}">
						<c:set var="classNm" value="tx_st" />
					</c:when>
					<c:when test="${row.MGZ_MST_KID eq 'M'}">
						<c:set var="classNm" value="" />
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${row.MGZ_MST_CTG eq '2014' }">
						<c:set var="cate" value="ico_life" />
					</c:when>
					<c:when test="${row.MGZ_MST_CTG eq '2015' }">
						<c:set var="cate" value="ico_purch" />
					</c:when>
					<c:when test="${row.MGZ_MST_CTG eq '2016' }">
						<!-- 상품리뷰  -->
						<c:set var="cate" value="ico_life" />
					</c:when>
					<c:when test="${row.MGZ_MST_CTG eq '2017' }">
						<c:set var="cate" value="ico_prNew" />
					</c:when>
					<c:when test="${row.MGZ_MST_CTG eq '2018' }">
						<!-- Stuff -->
						<c:set var="cate" value="ico_life" />
					</c:when>
					<c:when test="${row.MGZ_MST_CTG eq '2279' }">
						<c:set var="cate" value="ico_thema" />
					</c:when>
				</c:choose>
				<li class="<c:out value="${classNm }" />" >
					<a href="javascript:void(0)" onclick="goDetail('<c:out value="${row.MGZ_MST_IDX }" />'); return false;" class="_pg_link" >
						<i class="<c:out value="${cate }" />"><span><c:out value="${row.MGZ_MST_CTG_NM }" /></span></i>
						<c:if test="${not empty row.CMM_FLE_SAVE_PATH }">
						<img src="<c:out value="${cdnDomain }${row.CMM_FLE_SAVE_PATH  }" />" alt="" />
						</c:if>
						<strong class="tx_ti"><c:out value="${row.MGZ_MST_TITLE }" /></strong>
						<span class="tx_con"><c:out value="${row.MGZ_MST_CPY }" /></span>
					</a>
				</li>
				</c:forEach>
			</ul>
			
		</section>
		</form>
		<!--// .wedding_list E -->
		<script type="text/javascript">
			$.com.win_scrollList = true;//스크롤 할거야~
			function _return_scrollList(_idx, _reNum){
				/*
					_idx = 리스트감싸고있는 객체
					_reNum = 리턴 몇번째넘어왔는지
				*/
				var orderType	= $("input[name=orderType]:checked").val();
				var _list_html 	= "";
				
				//console.log("_reNum::::>" + _reNum);
				
				if(_reNum <= <c:out value="${paging.totalPageCount}" />){
					
					$.ajax({
			        	async 	: false,
			        	type 	: "POST",
			        	data	: {
			        		"MGZ_MST_THM_CTG1" 	: "<c:out value="${commandMap.MGZ_MST_THM_CTG1}" />",
			        		"MGZ_MST_THM_CTG2"	: "<c:out value="${commandMap.MGZ_MST_THM_CTG2}" />",
			        		"MGZ_MST_THM_CTG3"	: "<c:out value="${commandMap.MGZ_MST_THM_CTG3}" />",
			        		"cPage"				: _reNum + 2,
			        		"orderType"			: orderType
			        	},
			        	url		: "<c:out value="${mobileDomain}" />/mobile/themecategory/weddingConListAjax.do",
						success : function(data) {
							
							$.each(data.list, function(i,item){
								var classNm	= "";
								var cate	= "";
															
								if(item.MGZ_MST_KID == 'S'){
									classNm	= "img_st";
								}else if(item.MGZ_MST_KID == 'T'){
									classNm	= "tx_st";
								}else if(item.MGZ_MST_KID == 'M'){
									classNm	= "img_st";
								}
								
								if(item.MGZ_MST_CTG == '2014'){
									cate	= "ico_life";
								}else if (item.MGZ_MST_CTG == '2015'){
									cate	= "ico_purch";
								}else if(item.MGZ_MST_CTG == '2016'){
									// 상품리뷰
									cate	= "ico_life";
								}else if(item.MGZ_MST_CTG == '2017'){
									cate	= "ico_prNew";
								}else if(item.MGZ_MST_CTG == '2018'){
									// Stuff 
									cate	= "ico_life";
								}else if(item.MGZ_MST_CTG == '2279'){
									cate	= "ico_thema";
								}
								
								_list_html += "<li class='"+ classNm +"' >";
								_list_html += "<a href='javascript:void(0)' onclick='goDetail('" + item.MGZ_MST_IDX + "'); return false;' class='_pg_link' >";
								_list_html += "<i class='" + cate + "'><span>" + item.MGZ_MST_CTG_NM + "</span></i>";
								if(item.CMM_FLE_SAVE_PATH != ""){
									_list_html += "<img src='"+ item.CMM_FLE_SAVE_PATH +"' alt='' />";	
								}
								_list_html += "<strong class='tx_ti'>" + item.MGZ_MST_TITLE + "</strong>";
								_list_html += "<span class='tx_con'>" + item.MGZ_MST_CTS + "</span>";
								_list_html += "</a>";
								_list_html += "</li>";
								
			                });
						},
						error 	: function(err) {
							//alert("오류가 발생하였습니다.\n[" + err.status + "]");
							window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
						}
			        });										
					_idx.append(_list_html);
				}else $.com.win_scrollList = false;// 이제 리스트 안뿌릴래~
			}
			
			goPage		= function(page){
				$("#cPage").val(page);
				$("#frm").attr("action", "<c:out value="${mobileDomain}" />/mobile/themecategory/weddingConList.do").submit();
				//location.href = "<c:out value="${mobileDomain}" />/mobile/themecategory/weddingConList.do?MGZ_MST_THM_CTG1=<c:out value="${commandMap.MGZ_MST_THM_CTG1}" />&MGZ_MST_THM_CTG2=<c:out value="${commandMap.MGZ_MST_THM_CTG2}" />&MGZ_MST_THM_CTG3=<c:out value="${commandMap.MGZ_MST_THM_CTG1}" />&cPage=" + page +"&orderType=" + orderType;
			};
			
			goDetail	= function(idx){
				$("#MGZ_MST_IDX").val(idx);
				$("#frm").attr("action", "<c:out value="${mobileDomain}" />/mobile/themecategory/weddingConView.do").submit();
			};
			
			goSel2		= function(){
				$("#MGZ_MST_THM_CTG3").val('');
				goPage(1);
			};
			
			
		</script>
			
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>
