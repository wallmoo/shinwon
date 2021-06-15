<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

</head>
<body class="page-theme">
<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<!--// #header S -->
	
	<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->

			<!-- .sing_d S -->
			<section class="sing_d">
				
				<!-- .search S -->
				<div class="search">
					
					<dl class="minW">
						<dt>
							<h3 class="blind">당신의 화려하고 당당한 싱글라이프!<strong>마켓플랜트 싱글킹</strong>이 도와드립니다.</h3>
						</dt>
						<form method="post" name="sFrm" id="sFrm">
						<input type="hidden" name="startCount"value="0">
						<input type="hidden" name="collection" value="thema">
						<dd>
							<label for="inp_search">
								<input type="text" id="inp_search" name="searchKeyword" placeholder="single plan의 모든 것!  키워드로 검색하세요" value="<c:out value="${commandMap.searchKeyword }" />" />
								<a href="javascript:void(0)" class="ico_search"><span class="blind">검색하기</span></a>
							</label>
						</dd>
						</form>
					</dl>
				</div>
				<!-- .search E -->
				<!-- .search_list S -->
				<div class="search_list">
					<dl class="minW">
						<form method="post" name="frm" id="frm" action="" >
						<input type="hidden" name="cPage" id="cPage" value="" />
						<input type="hidden" name="CMN_COM_IDX" id="CMN_COM_IDX" value= "" />
						<input type="hidden" name="orderType" id="orderType" value="<c:out value="${commandMap.orderType }" />" />
						<input type="hidden" name="MGZ_MST_IDX" id="MGZ_MST_IDX" value="" />
						<dt class="list_type_box">
							<label for="sel_type_01">
								<select id="searchMgzMstThmCtg1" name="searchMgzMstThmCtg1" class="sel_chg" disabled>
									<option value="2252" <c:if test="${commandMap.searchMgzMstThmCtg1 eq '2252'}">selected </c:if> >싱글</option>
								</select>
							</label>
							<label for="sel_type_02">
								<select id="searchMgzMstThmCtg2" name="searchMgzMstThmCtg2" class="sel_chg">
									<option value="">전체</option>
									<c:forEach var="row" items="${guide2DepList }" varStatus="sta">
									<option value="<c:out value="${row.CMN_COM_IDX }" />" <c:if test="${commandMap.searchMgzMstThmCtg2 eq row.CMN_COM_IDX}">selected</c:if> ><c:out value="${row.CMN_COM_NM }" /></option>
								</c:forEach>	
								</select>
							</label>
							<label for="sel_type_03">
								<select id="searchMgzMstThmCtg3" name="searchMgzMstThmCtg3" class="sel_chg">
									<option value="">전체</option>
									<c:forEach var="row" items="${guide3DepList }" varStatus="sta">
										<c:if test="${commandMap.searchMgzMstThmCtg2 eq  row.CMN_COM_UP_IDX}">
										<option value="<c:out value="${row.CMN_COM_IDX }" />" <c:if test="${commandMap.searchMgzMstThmCtg3 eq  row.CMN_COM_IDX}">selected</c:if> ><c:out value="${row.CMN_COM_NM }" /></option>
										</c:if>
									</c:forEach>
								</select>
							</label>
							<div class="btn_list_type">
								<a href="<c:out value="${frontDomain }" />/pc/themecategory/singleMain.do" class="btn_home"><span>싱글홈</span></a>
								<a href="javascript:void(0)" onclick="goOrder('date'); return false;" class="f <c:if test="${commandMap.orderType eq 'date' }" >on</c:if>"><span>최신순</span></a>
								<a href="javascript:void(0)" onclick="goOrder('visit');  return false;" class="l <c:if test="${commandMap.orderType eq 'visit' }" >on</c:if>"><span>조회순</span></a>
							</div>
						</dt>
						</form>
						<dd class="list">
							<ul>
								<c:if test="${empty list }" >
								<li class="no_list">
									<strong>검색결과가 없습니다.</strong>
								</li>
								</c:if>
								<c:if test="${not empty list }" >
								<c:forEach items="${list }" var="row" varStatus="sta">
								<c:set var="classNm" value="" />
								<c:if test="${sta.last || sta.count mod 4 == 0 }">
									<c:set var="classNm" value="l" />
								</c:if>
								<c:if test="${sta.first || sta.count mod 4 == 1 }">
									<c:set var="classNm" value="f" />
								</c:if>
								<li class="<c:out value="${classNm }" />" >
									<a href="javascript:void(0)" onclick="goDetail('<c:out value="${row.MGZ_MST_IDX }" />'); return false;">
										<img src="<c:out value="${cdnDomain}${row.CMM_FLE_SAVE_PATH  }" />" alt="" />
										<strong class="tx_doc"><c:out value="${row.MGZ_MST_TITLE }" /></strong>
										<span><c:out value="${row.MGZ_MST_CPY }"  /></span>
									</a>
								</li>
								</c:forEach>
								</c:if>
							</ul>
						</dd>
						<dd class="section-pagination" style="padding:30px 0;">
							<ui:frontpaging paging="${paging }" jsFunction="goPage" />
						</dd>
					</dl>
				</div>
				<!-- .search_list E -->

			</section>
			<!-- .sing_d E -->
			
		


		</div><!--// .contents E -->
	</article>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	<script type="text/javascript">
	
		$(document).ready(function(){
			<c:if test="${not empty commandMap.searchMgzMstThmCtg2}">
			com.sel_chg($("#searchMgzMstThmCtg2"), 'chg');
			</c:if>
			
			<c:if test="${not empty commandMap.searchMgzMstThmCtg3}">
			com.sel_chg($("#searchMgzMstThmCtg3"), 'chg');
			</c:if>
		});
	
		$(document).on("click", "#searchMgzMstThmCtg1", function (){
		  	var code = $("#searchMgzMstThmCtg1").val();
		   	$("#searchMgzMstThmCtg3").val("");
		    $("#searchMgzMstThmCtg3").html("<option value=''>전체</option>");
		   	com.sel_chg($("#searchMgzMstThmCtg3"), 'chg');
		   	getSubCodeList(code,"2");
		   	goPage(1);
		});
		    
		$(document).on("click", "#searchMgzMstThmCtg2", function (){
		  	var code = $("#searchMgzMstThmCtg2").val();
		  	getSubCodeList(code,"3");
		  	goPage(1);
		});
		
		$(document).on("click", "#searchMgzMstThmCtg3", function (){
		  	goPage(1);
		});
		
		getSubCodeList = function(code, gb){
	    	var html = "";
	    	$.ajax({
	            type	: "POST",
	            url : "<c:out value="${frontDomain}" />/pc/marketing/getSubCodeAjax.do",
	            data	:  { "code":code},
	            dataType : "JSON",
	            async   : false,
	            success	: function(data){
	            	var selected = "";
	                //$("#searchMgzMstThmCtg"+gb).empty().append("<option value=''>전체</option>");
	                html +="<option value=''>전체</option>";
	                $.each(data.list, function(i,item) 
	                {  
	                	html +="<option value='"+item.CMN_COM_IDX+"'>"+item.CMN_COM_NM+"</option>";
	                });
	                
	                $("#searchMgzMstThmCtg"+gb).html(html);
	                com.sel_chg($("#searchMgzMstThmCtg"+gb), 'chg');
	            },error   : function(xhr,status,error){ 
	                alert("코드 호출 중 에러가 발생하였습니다.");
	                //alert("code:"+xhr.status); 
	            }
	        });
	    };
	    
	    goDetail	= function(idx){
	    	$("#MGZ_MST_IDX").val(idx);
			$("#frm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/singleConView.do").submit();
	    };
	    
	    goPage		= function(page){
	    	$("#cPage").val(page);
	    	$("#frm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/singleConList.do").submit();
	    };

	    goOrder		= function(type){
	    	$("#orderType").val(type);
	    	goPage(1);
	    };

	    $(document).on("click", ".ico_search", function(){
	    	if($("#inp_search").val == ""){
	    		alert("검색어를 입력하세요.");
	    		$('#inp_search').focus();
	    		return;
	    	}else{
	    		//goPage(1);
	    		$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/singleSearch.do").submit();
	    	}
	    });
	    
	    goReset		= function(){
	    	$("#inp_search").val('');
	    	goPage(1);
	    };
	    
	</script>
</section>
<!--// #wrap E -->


</body>
</html>
