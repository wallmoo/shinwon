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
	<div class="section-visual"><!-- section-visual -->
        <div class="minW">
            <a href="<c:out value="${serverDomain }" />/pc/contents/emagazineMain.do"><img src="<c:out value="${cdnDomain}" />/pc/img/custom/magazine_visual.png" alt="스마트라이프를 위한 마켓플랜트의 감성채널 e매거진. for your smart shopping life" /></a>
        </div>
    </div><!-- // section-visual -->
	<!-- #container S -->
	<article id="container" class="container">
		<!-- .magazine-nav s -->
		<div class="magazine-nav">
            <h3 class="blind">e매거진</h3>
			<nav class="nav_d">
	            <ul class="minW ct tab-magazine"><!-- tab-magazine -->
	                <li class="nth-child-1 <c:if test="${commandMap.searchMgzMstCtg eq '2014'}">active</c:if>" ><a href="javascript:goTab('2014');"><span>라이프가이드</span></a></li>
	                <li class="nth-child-2 <c:if test="${commandMap.searchMgzMstCtg eq '2015'}">active</c:if>"><a href="javascript:goTab('2015');"><span>구매가이드</span></a></li>
	                <li class="nth-child-3 <c:if test="${commandMap.searchMgzMstCtg eq '2016'}">active</c:if>"><a href="javascript:goTab('2016');"><span>상품리뷰</span></a></li>
	                <li class="nth-child-4 <c:if test="${commandMap.searchMgzMstCtg eq '2017'}">active</c:if>"><a href="javascript:goTab('2017');"><span>상품뉴스</span></a></li>
	<!--                 <li class="nth-child-5"><a href="javascript:goPage('2018');"><span>Stuff</span></a></li> -->
	                <li class="nth-child-5  <c:if test="${commandMap.searchMgzMstCtg eq '2279'}">active</c:if>"><a href="javascript:goTab('2279');"><span>테마</span></a></li>
	            </ul><!-- // tab-magazine -->
			</nav>	            
            
      	
			<c:if test="${empty commandMap.searchMgzMstCtg}">
			<h4 class="minW title-main" id="h4Best"><span class="blind">가장 많이 읽은 기사</span></h4>
			<div class="minW magazine-list best" id="manyList"><!-- magazine-list -->
	            
	        </div>
            </c:if>
		</div>       
		     
		<div class="minW contents"><!-- contents S -->
			<p id="slogan" class=""><!-- magazine-slogan -->
            </p><!-- // magazine-slogan -->
            
            <div class="magazine-status"><!-- magazine-status -->
                <div id="category-view1" class="category-view">
                    <select class="sel_chg" id="searchMgzMstGbn">
                        <option value="" selected="selected">전체</option>
                        <option value="2019">TV/음향기기</option>
                        <option value="2020">냉장고/김치냉장고</option>
                        <option value="2021">세탁기</option>
                        <option value="2022">주방가전/주방소형</option>
                        <option value="2023">생활가전/생활소형</option>
                        <option value="2024">건강가전</option>
                        <option value="2791">계절가전</option>
                        <option value="2792">컴퓨터</option>
                        <option value="2793">디저털/자동차</option>
                        <option value="2794">홈케어 서비스</option>
                    </select>
                </div>
                
                <div id="category-view2" class="category-view">
                    <select class="sel_chg" id="searchMgzMstThmCtg1">
                        <option value="" selected="selected">전체</option>
                        <option value="2251">웨딩</option>
                        <option value="2252">싱글</option>
                        <option value="2253">클린킹</option>
                        <!--  <option value="2254">건강</option>-->
                    </select>
                    <select class="sel_chg" id="searchMgzMstThmCtg2">
                        <option value="" selected="selected">전체</option>
                    </select>
                     <select class="sel_chg" id="searchMgzMstThmCtg3">
                        <option value="" selected="selected">전체</option>
                    </select>
                </div>
                
                <div class="view-type">
                    <ul class="ct">
                        <li id="searchGbN" class="active"><a href="javascript:goPageGb('N');">최신순</a><span class="blind">현재위치</span></li>
                        <li id="searchGbR"><a href="javascript:goPageGb('R');">조회순</a></li>
                    </ul>
                </div>
            </div><!-- // magazine-status -->
		
           	<div class="magazine-list" id="magazineList"><!-- magazine-list -->
           	</div><!-- // magazine-list -->
          

            <div class="section-pagination" id="ask_pg" >
				<ui:frontpaging paging="${reqPaging }" jsFunction="goReqPage" />
			</div>

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	
	<input type="hidden" name="searchGb" id="searchGb" value="N"/>
	<form id="frm" name="frm" >
		<input type="hidden" name="MGZ_MST_IDX" id="MGZ_MST_IDX" value="" />
		<input type="hidden" name="searchMgzMstCtg" id="searchMgzMstCtg" value="<c:out value="${commandMap.searchMgzMstCtg}"/>"/>
		<input type="hidden" name="cPage" id="cPage" value="<c:out value="${commandMap.cPage}"/>"/>
	</form>
	
	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    
    <script type="text/javascript">
    	$(function(){
    		
    		
    		
    		goMany		= function(){
//				alert("goReqPage");
				
				var searchMgzMstCtg = $("#searchMgzMstCtg").val();
				
				var searchGb = $("#searchGb").val();
				
				$.ajax({
					type		: "POST",
					url			: "/pc/contents/emagazineManyAjax.do",
					dataType	: "json",
					data		: {	"searchMgzMstCtg" : searchMgzMstCtg
									},
					success : function(data) {
						var innerHtml	= '<ul class="ct">';
						
						
						var listNum		= data.listNum;
						$.each(data.resultMap.manyList, function(i,item){
							var  MGZ_MST_CPY = item.SUBSTR_MGZ_MST_CPY;
							if(MGZ_MST_CPY==null)MGZ_MST_CPY="";
			                if(item.MGZ_MST_KID=="T")
			                {
			                 	innerHtml += '<li class="view-text"><div class="module">';
			                }else
			                {
			                 	innerHtml += '<li><div class="module">';
			                }
								
							innerHtml +='<span class="category label-'+item.MGZ_MST_CTG_CLR+'">'+item.MGZ_MST_CTG_NM2+"</span>";
							
								
							innerHtml +='<a href="javascript:void(0)" id="emagazineImg" data-mgz_mst_idx="'+item.MGZ_MST_IDX+'" >';
							if(item.MGZ_MST_KID=="M")
			                {
								innerHtml +='<span class="movie"><em class="blind">동영상 게시물</em></span>';
			                }
							if(item.MGZ_MST_KID=="S"||item.MGZ_MST_KID=="M")
			                {
								innerHtml +='<span class="thumb"><img src="<c:out value="${cdnDomain}" />'+item.IMG_PATH_PC+'" alt="'+item.IMG_PATH_PC_ALT+'" /><i class="mask"></i></span>';
			                }
								
								
							innerHtml +='<span class="subject">'+item.MGZ_MST_TITLE+'</span>';
							innerHtml +='<span class="text">'+MGZ_MST_CPY+'</span>';
							innerHtml +='</a></div></li>';
								
						});
						innerHtml += '</ul>';
						$("#manyList").html(innerHtml);
					 	
					}, error : function(err) {
						window.jquery
							|| console.log('오류가 발생하였습니다: ' + err.status);
					}
				});
			}; // goReqPage end
			
			goTab		= function(searchMgzMstCtg){
				$("#searchMgzMstGbn").val('');
				com.sel_chg($("#searchMgzMstGbn"), 'chg');
				goPage(searchMgzMstCtg);
			};
			
			goPage		= function(searchMgzMstCtg){
				
				if(searchMgzMstCtg=="2014")
				{
					$(".nth-child-1").attr('class','nth-child-1 active');
					$(".nth-child-2").attr('class','nth-child-2');
					$(".nth-child-3").attr('class','nth-child-3');
					$(".nth-child-4").attr('class','nth-child-4');
					$(".nth-child-5").attr('class','nth-child-5');
					$(".nth-child-6").attr('class','nth-child-6');
					$("#slogan").attr('class','magazine-slogan life');
					$("#category-view1").show();
					$("#category-view2").hide();
					$("#manyList").hide();
					$("#h4Best").hide();
				}else if(searchMgzMstCtg=="2015")
				{
					$(".nth-child-1").attr('class','nth-child-1');
					$(".nth-child-2").attr('class','nth-child-2 active');
					$(".nth-child-3").attr('class','nth-child-3');
					$(".nth-child-4").attr('class','nth-child-4');
					$(".nth-child-5").attr('class','nth-child-5');
					$(".nth-child-6").attr('class','nth-child-6');
					$("#slogan").attr('class','magazine-slogan order');
					$("#category-view1").show();
					$("#category-view2").hide();
					$("#manyList").hide();
					$("#h4Best").hide();
				}else if(searchMgzMstCtg=="2016")
				{
					$(".nth-child-1").attr('class','nth-child-1');
					$(".nth-child-2").attr('class','nth-child-2');
					$(".nth-child-3").attr('class','nth-child-3 active');
					$(".nth-child-4").attr('class','nth-child-4');
					$(".nth-child-5").attr('class','nth-child-5');
					$(".nth-child-6").attr('class','nth-child-6');
					$("#slogan").attr('class','magazine-slogan review');
					$("#category-view1").show();
					$("#category-view2").hide();
					$("#manyList").hide();
					$("#h4Best").hide();
				}else if(searchMgzMstCtg=="2017")
				{
					$(".nth-child-1").attr('class','nth-child-1');
					$(".nth-child-2").attr('class','nth-child-2');
					$(".nth-child-3").attr('class','nth-child-3');
					$(".nth-child-4").attr('class','nth-child-4 active');
					$(".nth-child-5").attr('class','nth-child-5');
					$(".nth-child-6").attr('class','nth-child-6');
					$("#slogan").attr('class','magazine-slogan news');
					$("#category-view1").show();
					$("#category-view2").hide();
					$("#manyList").hide();
					$("#h4Best").hide();
				}else if(searchMgzMstCtg=="2018")
				{
					$(".nth-child-1").attr('class','nth-child-1');
					$(".nth-child-2").attr('class','nth-child-2');
					$(".nth-child-3").attr('class','nth-child-3');
					$(".nth-child-4").attr('class','nth-child-4');
					$(".nth-child-5").attr('class','nth-child-5 active');
					$(".nth-child-6").attr('class','nth-child-6');
					$("#slogan").attr('class','magazine-slogan stuff');
					$("#category-view1").show();
					$("#category-view2").hide();
					$("#manyList").hide();
					$("#h4Best").hide();
				}else if(searchMgzMstCtg=="2279")
				{
					$(".nth-child-1").attr('class','nth-child-1');
					$(".nth-child-2").attr('class','nth-child-2');
					$(".nth-child-3").attr('class','nth-child-3');
					$(".nth-child-4").attr('class','nth-child-4');
					$(".nth-child-5").attr('class','nth-child-5 active');
					$(".nth-child-6").attr('class','nth-child-6');
					$("#slogan").attr('class','magazine-slogan theme');
					$("#category-view1").hide();
					$("#category-view2").show();
					$("#manyList").hide();
					$("#h4Best").hide();
				}else
				{
					$("#manyList").show();
				}
				
				
				$("#searchMgzMstCtg").val(searchMgzMstCtg);
				goMany();
				goReqPage(1);
				 
			}
			
			goPageGb		= function(searchGb){
				 $("#searchGb").val(searchGb);
				 if(searchGb== "R"){
					$("#searchGbR").attr('class','active');
					$("#searchGbN").attr('class','');
				 }else
				 {
					$("#searchGbR").attr('class','');
					$("#searchGbN").attr('class','active');
				 }
				 
				 goMany();
				 goReqPage(1);
				 
			}
			
			goReqPage		= function(page){
//				alert("goReqPage");
				$("#cPage").val(page);
				var searchMgzMstCtg = $("#searchMgzMstCtg").val();
				var searchGb = $("#searchGb").val();
				var searchMgzMstGbn = $("#searchMgzMstGbn").val();
				var searchMgzMstThmCtg1 = $("#searchMgzMstThmCtg1").val();
				var searchMgzMstThmCtg2 = $("#searchMgzMstThmCtg2").val();
				var searchMgzMstThmCtg3 = $("#searchMgzMstThmCtg3").val();
				
				if(searchMgzMstCtg=="2279")
				{
					searchMgzMstGbn = "";
				}else
				{
					searchMgzMstThmCtg1 = "";
					searchMgzMstThmCtg2 = "";
					searchMgzMstThmCtg3 = "";
				}
				
				$.ajax({
					type		: "POST",
					url			: "/pc/contents/emagazineListAjax.do",
					dataType	: "json",
					data		: {	"searchMgzMstCtg" : searchMgzMstCtg
									,"searchMgzMstGbn" : searchMgzMstGbn
									,"searchGb" : searchGb
									,"searchMgzMstThmCtg1" : searchMgzMstThmCtg1
									,"searchMgzMstThmCtg2" : searchMgzMstThmCtg2
									,"searchMgzMstThmCtg3" : searchMgzMstThmCtg3
							   		,"cPage": page
									},
					success : function(data) {
						var innerHtml	= '<ul class="ct">';
						
						if(data.totalPageCount == 0){
							innerHtml = "";
						}else{
							
							var listNum		= data.listNum;
							$.each(data.resultMap.reqList, function(i,item){
								var  MGZ_MST_CPY = item.SUBSTR_MGZ_MST_CPY;
								if(MGZ_MST_CPY==null)MGZ_MST_CPY="";
			                    if(item.MGZ_MST_KID=="T")
			                    {
			                    	innerHtml += '<li class="view-text"><div class="module">';
			                    }else
			                    {
			                    	innerHtml += '<li><div class="module">';
			                    }
								
								innerHtml +='<span class="category label-'+item.MGZ_MST_CTG_CLR+'">'+item.MGZ_MST_CTG_NM2+"</span>";
																
								innerHtml +='<a href="javascript:void(0)" id="emagazineImg" data-mgz_mst_idx="'+item.MGZ_MST_IDX+'" >';
								if(item.MGZ_MST_KID=="M")
			                    {
									innerHtml +='<span class="movie"><em class="blind">동영상 게시물</em></span>';
			                    }
								if(item.MGZ_MST_KID=="S"||item.MGZ_MST_KID=="M")
			                    {
									innerHtml +='<span class="thumb">';
									innerHtml +='<img src="<c:out value="${cdnDomain}" />'+item.IMG_PATH_PC+'" alt="'+item.IMG_PATH_PC_ALT+'" /><i class="mask"></i>';
									innerHtml +='</span>';
			                    }
								
								
								innerHtml +='<span class="subject">'+item.MGZ_MST_TITLE+'</span>';
								innerHtml +='<span class="text">'+MGZ_MST_CPY+'</span>';
								innerHtml +='</a></div></li>';
								
							});
							innerHtml += '</ul>';
							$("#magazineList").html(innerHtml);
							
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
			
			goMany();
			
			var cPage='<c:out value="${commandMap.cPage}"/>';
			var searchMgzMstCtg='<c:out value="${commandMap.searchMgzMstCtg}"/>';
			
			if(searchMgzMstCtg =="")
			{
				if(cPage=="")cPage=1;
				goReqPage(cPage);
			}else
			{
				goPage(searchMgzMstCtg);	
			}
			
			$("#category-view2").hide();
			
			$(document).on("click", "#searchMgzMstGbn", function(){
    			goReqPage(1);
			});
			
			$(document).on("click", "#searchMgzMstThmCtg1", function (){
			  	var code = $("#searchMgzMstThmCtg1").val();
			   	$("#searchMgzMstThmCtg3").val("");
			   	com.sel_chg($("#searchMgzMstThmCtg3"), 'chg');
			   	getSubCodeList(code,"2");
			   	goReqPage(1);
			});
			    
			$(document).on("click", "#searchMgzMstThmCtg2", function (){
			  	var code = $("#searchMgzMstThmCtg2").val();
			  	getSubCodeList(code,"3");
			  	goReqPage(1);
			});
			$(document).on("click", "#searchMgzMstThmCtg3", function (){
			  	goReqPage(1);
			});
		    
		    getSubCodeList = function(code, gb)
		    {
		    	var html = "";
		    	$.ajax({
		            type	: "POST",
		            url : "<c:out value="${frontDomain}" />/pc/marketing/getSubCodeAjax.do",
		            data	:  { "code":code},
		            dataType : "JSON",
		            async   : false,
		            success	: function(data)
		            {
		            	var selected = "";
		                //$("#searchMgzMstThmCtg"+gb).empty().append("<option value=''>전체</option>");
		                html +="<option value=''>전체</option>";
		                $.each(data.list, function(i,item) 
		                {  
		                	html +="<option value='"+item.CMN_COM_IDX+"'>"+item.CMN_COM_NM+"</option>";
		                });
		                
		                $("#searchMgzMstThmCtg"+gb).html(html);
		                com.sel_chg($("#searchMgzMstThmCtg"+gb), 'chg');
		                

		            },
		            error   : function(xhr,status,error)
		            { 
		                alert("코드 호출 중 에러가 발생하였습니다.");
		                //alert("code:"+xhr.status); 
		            }
		        });
		    };
		    
		    $(document).on("click", "#emagazineImg", function(){
    			$("#MGZ_MST_IDX").val($(this).data("mgz_mst_idx"));
    			$("#frm").attr("action", "/pc/contents/emagazineView.do").submit();
    		});
			
    	});   
    	
    	
    </script>
    
	<!--// #footer E -->
</section>
<!--// #wrap E -->
</body>
</html>