<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-thema page-magazine">
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2><c:out value="${ctgNm}" /></h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
            
        </div>
		<!--// .section-title E -->
        
        <div class="section-visual"><!-- section-visual -->
            <h3><img src="<c:out value="${cdnDomain}" />/mobile/img/custom/magazine_title.png" alt="e매거진 똑똑한 생활습관, 프라이스킹 쇼핑백서" /></h3>
        </div><!--// section-visual -->
        
		<section class="thema_list clean_list"><!-- thema_list -->
		<c:choose>
		<c:when test="${commandMap.MGZ_MST_CTG eq '2014'}">
            <p class="slogan">
                <strong>최신 트랜드의 쇼핑 꿀팁을 만날 수 있는 라이프 가이드</strong>
            </p>
        </c:when>
        <c:when test="${commandMap.MGZ_MST_CTG eq '2015'}">
            <p class="slogan">
                <strong>무엇을 살지 고민하는 당신에게 드리는 다이렉트 구매가이드</strong>
            </p>
        </c:when>
        <c:when test="${commandMap.MGZ_MST_CTG eq '2016'}">
            <p class="slogan">
                <strong>미리 구매한 쇼핑 고수님들께 생생하게 듣는 상품 리뷰</strong>
            </p>
        </c:when>
        <c:when test="${commandMap.MGZ_MST_CTG eq '2017'}">
            <p class="slogan">
                <strong>남녀노소 누구나 궁금해 하는 깨알 같은 상품 뉴스</strong>
            </p>
        </c:when>
        <c:when test="${commandMap.MGZ_MST_CTG eq '2018'}">
            <p class="slogan">
                <strong>당신이 얼리어답터 or 하이앤드 트랜드 세터라면 Stuff</strong>
            </p>
        </c:when>
        <c:when test="${commandMap.MGZ_MST_CTG eq '2279'}">
            <p class="slogan">
                <strong>웨딩, 싱글, 클린킹, 건강. 모든 내용이 <br />&ldquo;여기에 多 있다&rdquo;</strong>
            </p>
        </c:when>
        </c:choose>

			<!-- .list_type S -->
			<dl class="list_type">
				<dt class="blind">e매거진 리스트 정렬 조건</dt>
				<dd class="sel_ch">
					<div class="sel_box" data-role="fieldcontain">
					<c:if test="${commandMap.MGZ_MST_CTG ne '2279'}">
						<label for="searchMgzMstGbn">
							<select id="searchMgzMstGbn">
								<option value="" <c:if test="${empty commandMap.MGZ_MST_GBN}">selected="selected"</c:if>>전체</option>
		                        <option value="2019" <c:if test="${commandMap.MGZ_MST_GBN eq '2019'}">selected="selected"</c:if>>TV/음향기기</option>
		                        <option value="2020" <c:if test="${commandMap.MGZ_MST_GBN eq '2020'}">selected="selected"</c:if>>냉장고/김치냉장고</option>
		                        <option value="2021" <c:if test="${commandMap.MGZ_MST_GBN eq '2021'}">selected="selected"</c:if>>세탁기</option>
		                        <option value="2022" <c:if test="${commandMap.MGZ_MST_GBN eq '2022'}">selected="selected"</c:if>>주방가전/주방소형</option>
		                        <option value="2023" <c:if test="${commandMap.MGZ_MST_GBN eq '2023'}">selected="selected"</c:if>>생활가전/생활소형</option>
		                        <option value="2024" <c:if test="${commandMap.MGZ_MST_GBN eq '2024'}">selected="selected"</c:if>>건강가전</option>
		                        <option value="2791" <c:if test="${commandMap.MGZ_MST_GBN eq '2791'}">selected="selected"</c:if>>계절가전</option>
		                        <option value="2792" <c:if test="${commandMap.MGZ_MST_GBN eq '2792'}">selected="selected"</c:if>>컴퓨터</option>
		                        <option value="2793" <c:if test="${commandMap.MGZ_MST_GBN eq '2793'}">selected="selected"</c:if>>디저털/자동차</option>
		                        <option value="2794" <c:if test="${commandMap.MGZ_MST_GBN eq '2794'}">selected="selected"</c:if>>홈케어 서비스</option>
		                    </select>
						</label>
					</c:if>
					<c:if test="${commandMap.MGZ_MST_CTG eq '2279'}">
						<label for="searchMgzMstThmCtg1">
							<select id="searchMgzMstThmCtg1">
								<option value="" <c:if test="${empty commandMap.MGZ_MST_THM_CTG1}">selected="selected"</c:if>>전체</option>
		                        <option value="2251" <c:if test="${commandMap.MGZ_MST_THM_CTG1 eq '2251'}">selected="selected"</c:if>>웨딩</option>
		                        <option value="2252" <c:if test="${commandMap.MGZ_MST_THM_CTG1 eq '2252'}">selected="selected"</c:if>>싱글</option>
		                        <option value="2253" <c:if test="${commandMap.MGZ_MST_THM_CTG1 eq '2253'}">selected="selected"</c:if>>클린킹</option>
		                        <!--  option value="2254" <c:if test="${commandMap.MGZ_MST_THM_CTG1 eq '2254'}">selected="selected"</c:if>>건강</option>-->
							</select>
						</label>
                        
                        <label for="searchMgzMstThmCtg2">
                            <select id="searchMgzMstThmCtg2">
                                <option value="" selected="selected">전체</option>
                            </select>
                        </label>
                        
                        <label for="searchMgzMstThmCtg3">
                            <select id="searchMgzMstThmCtg3">
                                <option value="" selected="selected">전체</option>
                            </select>
                        </label>
					</c:if>
					</div>
				</dd>
				<dd class="btn_ch">
					<fieldset data-role="controlgroup" data-type="horizontal" >
						
						<input type="radio" class="searchGbRadio" name="searchGbRadio" id="ra_late" value="N" <c:if test="${commandMap.searchGb eq 'N'}"> checked="checked"</c:if>/>
						<label for="ra_late">최신순</label>
						<input type="radio" class="searchGbRadio" name="searchGbRadio" id="ra_ask" value="R" <c:if test="${commandMap.searchGb eq 'R'}"> checked="checked"</c:if>/>
						<label for="ra_ask">조회순</label>
					</fieldset>
				</dd>
			</dl>
			<!--// .list_type E -->
			
			<ul class="list_d _scroll_list_ck" id="emagazineList">
				<c:forEach var="row" items="${list }" varStatus="i">
					<c:choose>
						<c:when test="${row.MGZ_MST_KID ne 'T'}">
				        	<li class="img_st">
				        </c:when>
				        <c:when test="${row.MGZ_MST_KID eq 'T'}">
				        	<li class="tx_st">
				        </c:when>
				    </c:choose>
		            <a class="_pg_link" href="javascript:callJavascriptNextPage('<c:out value="${mobileDomain}" />/mobile/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${row.MGZ_MST_IDX}" />', '');">
		            <c:choose>
						<c:when test="${row.MGZ_MST_CTG eq '2014'}">
				             <i class="ico_life"><span>라이프가이드</span></i>
				        </c:when>
				        <c:when test="${row.MGZ_MST_CTG eq '2015'}">
				             <i class="ico_purch"><span>구매가이드</span></i>
				        </c:when>
				        <c:when test="${row.MGZ_MST_CTG eq '2016'}">
				        <i class="ico_review"><span>상품리뷰</span></i>
				        </c:when>
				        <c:when test="${row.MGZ_MST_CTG eq '2017'}">
				            <i class="ico_prNew"><span>상품뉴스</span></i>
				        </c:when>
				        <c:when test="${row.MGZ_MST_CTG eq '2279'}">
				             <i class="ico_thema"><span>테마</span></i>
				        </c:when>
				    </c:choose>     
		            <c:if test="${row.MGZ_MST_KID eq 'M'}">
				    	<span class="movie"><em class="blind">동영상 게시물</em></span>
				    </c:if>
				    	<c:if test="${not empty row.IMG_PATH_MB  and row.MGZ_MST_KID ne 'T' }">
	                        <img src="<c:out value="${cdnDomain}" /><c:out value="${row.IMG_PATH_MB}" />" alt="" />
						</c:if>	                        
	                        <strong class="tx_ti"><c:out value="${row.MGZ_MST_TITLE}" /></strong>
	                        <span class="tx_con"><c:out value="${row.MGZ_MST_CPY}" /></span>
	                        
	                    </a>
	                </li>
                </c:forEach>
			</ul>
		</section><!-- // thema_list -->
		<form id="frm">
			<input type="hidden" id="MGZ_MST_CTG" name="MGZ_MST_CTG" value="<c:out value="${commandMap.MGZ_MST_CTG}" />"/>
			<input type="hidden" id="MGZ_MST_GBN" name="MGZ_MST_GBN" value="<c:out value="${commandMap.MGZ_MST_GBN}" />"/>
			<input type="hidden" id="MGZ_MST_THM_CTG1" name="MGZ_MST_THM_CTG1" value="<c:out value="${commandMap.MGZ_MST_THM_CTG1}" />"/>
			<input type="hidden" id="MGZ_MST_THM_CTG2" name="MGZ_MST_THM_CTG2" value="<c:out value="${commandMap.MGZ_MST_THM_CTG2}" />"/>
			<input type="hidden" id="MGZ_MST_THM_CTG3" name="MGZ_MST_THM_CTG3" value="<c:out value="${commandMap.MGZ_MST_THM_CTG3}" />"/>
			<input type="hidden" id="searchGb" name="searchGb" value="<c:out value="${commandMap.searchGb}" />"/>
		</form>
		<input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}" />"/>	
	</article>
	<!--// #container E -->


		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script src="<c:out value="${mobileDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
 
$.com.win_scrollList = true;//스크롤 할거야~
function _return_scrollList(_idx, _reNum){
	 
	/*
		_idx = 리스트감싸고있는 객체
		_reNum = 리턴 몇번째넘어왔는지
		*/
	//console.log("_reNum : "+_reNum);
	var page = _reNum + 2;
	var totalCount = $("#totalCount").val();
	
	var MGZ_MST_GBN = $("#MGZ_MST_GBN").val();
	var MGZ_MST_CTG = $("#MGZ_MST_CTG").val();
	var MGZ_MST_THM_CTG1 = $("#MGZ_MST_THM_CTG1").val();
	var MGZ_MST_THM_CTG2 = $("#MGZ_MST_THM_CTG2").val();
	var MGZ_MST_THM_CTG3 = $("#MGZ_MST_THM_CTG3").val();
	var searchGb = $("#searchGb").val();
	
	var cdnDomain = '<c:out value="${cdnDomain}" />';
	if(parseInt(totalCount) >= (parseInt(page)-1) * 10)
	{	
		$.ajax({
			type		: "POST",
			url			: "/mobile/contents/emagazineListAjax.do",
			dataType	: "json",
			async       : false,
			data		: {	"MGZ_MST_GBN": MGZ_MST_GBN, 
							"MGZ_MST_CTG": MGZ_MST_CTG, 
							"MGZ_MST_THM_CTG1": MGZ_MST_THM_CTG1,
							"MGZ_MST_THM_CTG2": MGZ_MST_THM_CTG2,
							"MGZ_MST_THM_CTG3": MGZ_MST_THM_CTG3,
							"searchGb": searchGb,
							"cPage": page
							},
			success : function(data) {
				var innerHtml	= '';
				
				if(data.totalPageCount == 0){
					innerHtml = "";
				}else{
					var listNum		= data.listNum;
					$.each(data.resultMap.list, function(i,item){
 
						var MGZ_MST_CPY = item.MGZ_MST_CPY;
						
						if(MGZ_MST_CPY==null)MGZ_MST_CPY ="";
						
						if(item.MGZ_MST_KID != 'T')	innerHtml +='<li class="img_st">';
						else innerHtml +='<li class="tx_st">';
						 
						//innerHtml += '<a href="javascript:void(0)">';
						innerHtml += '<a class="_pg_link" href="javascript:callJavascriptNextPage(\'<c:out value="${mobileDomain}" />/mobile/contents/emagazineView.do?MGZ_MST_IDX='+ item.MGZ_MST_IDX +'\', \'\');">';
						if(item.MGZ_MST_CTG == '2014')	innerHtml +='<i class="ico_life"><span>라이프가이드</span></i>';
						else if(item.MGZ_MST_CTG == '2015')	innerHtml +='<i class="ico_purch"><span>구매가이드</span></i>';
						else if(item.MGZ_MST_CTG == '2016')	innerHtml +='<i class="ico_review"><span>상품리뷰</span></i>';
						else if(item.MGZ_MST_CTG == '2017')	innerHtml +='<i class="ico_prNew"><span>상품뉴스</span></i>';
						else if(item.MGZ_MST_CTG == '2279')	innerHtml +='<i class="ico_thema"><span>테마</span></i>';
						
						if(item.MGZ_MST_KID == 'M')	innerHtml +='<span class="movie"><em class="blind">동영상 게시물</em></span>';
						 
						innerHtml += '<img src="'+cdnDomain+item.IMG_PATH_MB+'" alt="" />';
						innerHtml += '<strong class="tx_ti">'+item.MGZ_MST_TITLE+'</strong>';
						innerHtml += '<span class="tx_con">'+MGZ_MST_CPY+'</span>';
						innerHtml += '</a></li>';
						
					});
					//_idx.append(innerHtml).collapsibleset('refresh');
					_idx.append(innerHtml);
					//$("#emagazineList").html(innerHtml).collapsibleset('refresh');
					
			 		
				}
					
			}
			 
		});
	}else
	{
		$.com.win_scrollList = false;//스크롤 할거야~
	}
	
		
}
function goDtl(BRD_NTS_IDX){
	var $frm = $("#frm");
	$("#BRD_NTS_IDX").val(BRD_NTS_IDX);
	//$("#frm").attr("action", "/mobile/customer/faqBoardList.do").submit();
	$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/customer/noticeBoardView.do", "target":"_self", "method":"post"}).submit();
	//$("#frm").submit();
};

function goSearch(){
	var $frm = $("#searchFrm");
	var searchWord = $("#faqSearch").val();
	$("#searchWord").val(searchWord);
	//$("#frm").attr("action", "/mobile/customer/faqBoardList.do").submit();
	$frm.attr({"action":"<c:out value="${mobileDomain}" />/mobile/customer/faqSearchList.do", "target":"_self", "method":"post" }).submit();
	//$("#frm").submit();
};


getSubCodeList = function(code, gb)
{
	var html = "";
	
	$.ajax({
        type	: "POST",
        url : "<c:out value="${mobileDomain}" />/mobile/contents/getSubCodeAjax.do",
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
            //com.sel_chg($("#searchMgzMstThmCtg"+gb), 'chg');
            

        },
        error   : function(xhr,status,error)
        { 
            alert("코드 호출 중 에러가 발생하였습니다.");
            //alert("code:"+xhr.status); 
        }
    });
};

$(document).on("change", "#searchMgzMstThmCtg1", function (){
  	var code = $("#searchMgzMstThmCtg1").val();
  	$("#MGZ_MST_THM_CTG1").val(code);
   	getSubCodeList(code,"2");
   	$("#searchMgzMstThmCtg2").val("").change();
   	$("#searchMgzMstThmCtg3").val("").change();
   	goPage(1);
});
    
$(document).on("change", "#searchMgzMstThmCtg2", function (){
  	var code = $("#searchMgzMstThmCtg2").val();
  	$("#MGZ_MST_THM_CTG2").val(code);
  	getSubCodeList(code,"3");
  	goPage(1);
});
$(document).on("change", "#searchMgzMstThmCtg3", function (){
	var code = $("#searchMgzMstThmCtg3").val();
  	$("#MGZ_MST_THM_CTG3").val(code);
  	goPage(1);
});

$(document).on("change", "#searchMgzMstGbn", function (){
	var code = $("#searchMgzMstGbn").val();
  	$("#MGZ_MST_GBN").val(code);
  	goPage(1);
});

$(document).on("change", ".searchGbRadio", function (){
	var code = jQuery('[name=searchGbRadio]:checked').val();
	$("#searchGb").val(code);
  	goPage(1);
});



function goPage(page){
	 
	//var page = 1;
	var MGZ_MST_GBN = $("#MGZ_MST_GBN").val();
	var MGZ_MST_CTG = $("#MGZ_MST_CTG").val();
	var MGZ_MST_THM_CTG1 = $("#MGZ_MST_THM_CTG1").val();
	var MGZ_MST_THM_CTG2 = $("#MGZ_MST_THM_CTG2").val();
	var MGZ_MST_THM_CTG3 = $("#MGZ_MST_THM_CTG3").val();
	var searchGb = $("#searchGb").val();
	
	var cdnDomain = '<c:out value="${cdnDomain}" />';
	
		$.ajax({
			type		: "POST",
			url			: "/mobile/contents/emagazineListAjax.do",
			dataType	: "json",
			async       : false,
			data		: {	"MGZ_MST_GBN": MGZ_MST_GBN,
							"MGZ_MST_CTG": MGZ_MST_CTG,
							"MGZ_MST_THM_CTG1": MGZ_MST_THM_CTG1,
							"MGZ_MST_THM_CTG2": MGZ_MST_THM_CTG2,
							"MGZ_MST_THM_CTG3": MGZ_MST_THM_CTG3,
							"searchGb": searchGb,
							"cPage": page
							},
			success : function(data) {
				var innerHtml	= '';
				
				if(data.totalPageCount == 0){
					innerHtml = "";
				}else{
					var listNum		= data.listNum;
					$.each(data.resultMap.list, function(i,item){
						var MGZ_MST_CPY = item.MGZ_MST_CPY;
						
						if(MGZ_MST_CPY==null)MGZ_MST_CPY ="";
						
						if(item.MGZ_MST_KID != 'T')	innerHtml +='<li class="img_st">';
						else innerHtml +='<li class="tx_st">';
						 
						innerHtml += '<a class="_pg_link" href="javascript:callJavascriptNextPage(\'<c:out value="${mobileDomain}" />/mobile/contents/emagazineView.do?MGZ_MST_IDX='+ item.MGZ_MST_IDX +'\', \'\');">';
						
						if(item.MGZ_MST_CTG == '2014')	innerHtml +='<i class="ico_life"><span>라이프가이드</span></i>';
						else if(item.MGZ_MST_CTG == '2015')	innerHtml +='<i class="ico_purch"><span>구매가이드</span></i>';
						else if(item.MGZ_MST_CTG == '2016')	innerHtml +='<i class="ico_review"><span>상품리뷰</span></i>';
						else if(item.MGZ_MST_CTG == '2017')	innerHtml +='<i class="ico_prNew"><span>상품뉴스</span></i>';
						else if(item.MGZ_MST_CTG == '2279')	innerHtml +='<i class="ico_thema"><span>테마</span></i>';
						
						if(item.MGZ_MST_KID == 'M')	innerHtml +='<span class="movie"><em class="blind">동영상 게시물</em></span>';
						 
						innerHtml += '<img src="'+cdnDomain+item.IMG_PATH_MB+'" alt="" />';
						innerHtml += '<strong class="tx_ti">'+item.MGZ_MST_TITLE+'</strong>';
						innerHtml += '<span class="tx_con">'+MGZ_MST_CPY+'</span>';
						innerHtml += '</a></li>';
						 
						
					});
					
					$("#emagazineList").html(innerHtml).data('returnNum',0);
					$.com.win_scrollList = true;
					//console.log('-------------------------------------- ');
			 		
				}
					
			}
			 
		});
	}
	
		

 
//]]>
</script>
</body>
</html>