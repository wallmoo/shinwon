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
	<form method="post" name="sFrm" id="sFrm">
	<input type="hidden" name="cPage" id="cPage" value="<c:out value="${paging.cPage }" />" />
	<input type="hidden" name="MGZ_MST_IDX" id="MGZ_MST_IDX" />
	<input type="hidden" name="orderType" id="orderType" value="" />
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->
			
			<c:if test="${commandMap.searchMgzMstThmCtg1 eq '2251' }">
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
				<!-- .search E -->
				</c:if>
				
				<c:if test="${commandMap.searchMgzMstThmCtg1 eq '2252' }">
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
				<c:if test="${commandMap.searchMgzMstThmCtg1 eq '2253' }">
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
				<!-- .search_list S -->
				<div class="search_list">
					<dl class="minW">
						<c:if test="${not empty commandMap.searchKeyword }">
						<dt>
							<span class="ti">검색결과 <strong><c:out value="${totalCount }" /></strong>건</span>
						</dt>
						</c:if>
						<dt class="list_type_box">
							<c:if test="${empty  commandMap.searchKeyword }">
							<label for="sel_type_01">
								<select id="searchMgzMstThmCtg1" name="searchMgzMstThmCtg1" class="sel_chg">
									<option value="">선택</option>
									<option value="2251" <c:if test="${commandMap.searchMgzMstThmCtg1 eq '2251'}">selected</c:if> >웨딩</option>
									<option value="2252" <c:if test="${commandMap.searchMgzMstThmCtg1 eq '2252'}">selected</c:if> >싱글</option>
									<option value="2253" <c:if test="${commandMap.searchMgzMstThmCtg1 eq '2253'}">selected</c:if> >클린킹</option>
									
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
										<option value="<c:out value="${row.CMN_COM_IDX }" />" <c:if test="${commandMap.searchMgzMstThmCtg3 eq  row.CMN_COM_IDX}">selected</c:if> ><c:out value="${row.CMN_COM_NM }" /></option>
									</c:forEach>
								</select>
							</label>
							</c:if>
							<c:if test="${not empty commandMap.searchKeyword }">
							</c:if>
							<div class="btn_list_type">
								<c:if test="${not empty  commandMap.searchKeyword }">
								<c:if test="${commandMap.searchMgzMstThmCtg1 eq '2251' }">
								<a href="<c:out value="${frontDomain }" />/pc/themecategory/weddingMain.do" class="btn_home"><span>웨딩 홈</span></a>
								</c:if>
								<c:if test="${commandMap.searchMgzMstThmCtg1 eq '2252' }">
								<a href="<c:out value="${frontDomain }" />/pc/themecategory/singleMain.do" class="btn_home"><span>싱글 홈</span></a>
								</c:if>
								<c:if test="${commandMap.searchMgzMstThmCtg1 eq '2253' }">
								<a href="<c:out value="${frontDomain }" />/pc/themecategory/cleanKingMain.do" class="btn_home"><span>클리린킹 홈</span></a>
								</c:if>
								</c:if>
								<c:if test="${empty  commandMap.searchKeyword }">
								<a href="javascript:void(0)" onclick="goOrder('date'); return false;" class="f <c:if test="${commandMap.orderType eq 'date' }" >on</c:if>"><span>최신순</span></a>
								<a href="javascript:void(0)" onclick="goOrder('visit');  return false;" class="l <c:if test="${commandMap.orderType eq 'visit' }" >on</c:if>"><span>조회순</span></a>
								</c:if>
							</div>
						</dt>
						
						<dd class="ct list">
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
										<img src="<c:out value="${cdnDomain }${row.CMM_FLE_SAVE_PATH  }" />" alt="" />
										<strong><c:out value="${row.MGZ_MST_TITLE }" /></strong>
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
			<!-- .wedding_d E -->
			
		


		</div><!--// .contents E -->
	</article>
	</form>
	<!--// #container E -->

	<!-- #footer S -->
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<!--// #footer E -->
	<script type="text/javascript">
		$(document).on("click", "#searchMgzMstThmCtg1", function (){
		  	var code = $("#searchMgzMstThmCtg1").val();
		   	$("#searchMgzMstThmCtg3").val("");
		    $("#searchMgzMstThmCtg3").html("<option value=''>전체</option>");
		   	com.sel_chg($("#searchMgzMstThmCtg3"), 'chg');
		   	getSubCodeList(code,"2");
		});
		    
		$(document).on("click", "#searchMgzMstThmCtg2", function (){
		  	var code = $("#searchMgzMstThmCtg2").val();
		  	getSubCodeList(code,"3");
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
			$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/themeConView.do").submit();
	    };
	</script>
</section>
<!--// #wrap E -->
</body>
</html>

<script>
var sc_to = 0;
$(window).scroll(function(){
	sc_to = $(window).scrollTop(),
	sc_ck = win_h/2,
	sc_ck = sc_ck+sc_to;

});
$(document).ready(function(){
	
	if(ie != 7 && ie != 8){
		weddings.search();
		$(window).resize(weddings.search);
	}
	$('#inp_search').focus();
});

var weddings = (function(){
	return{
		//상단 동영상
		search: function(){
			var _sh = $('.wedding_d .search'),
				_sh_h = _sh.height(),
				css_w = win_w - 710;
			if(win_w > 710) _sh.find('iframe').removeAttr('style').css({height:(_sh_h+css_w), marginTop:-(css_w/2)});
			else _sh.find('iframe').removeAttr('style').css({width:(win_w+Math.abs(css_w)), marginLeft:(css_w/2)});
		}//search: function(){
	}//return{
})();//var guideBooks = (function(){

//이거이거 나중에 이름 바꺼서 하든 해주세요.
//MD 추가혜택 견적상담 받기
function test(){
	var _list_d = $('.pr_list'),
		_label = _list_d.find('label'),
		_re = [];
	
	$.each(_label, function(i){
		var _this = $(this);
		if(_this.hasClass('on')){
			var _idx = _this.parent().index();
			_re.push(_idx);
		}
	});
	//console.log(_re);
}

goPage		= function(page){
	$("#cPage").val(page);
	$("#sFrm").attr("action", "<c:out value="${frontDomain}" />/pc/themecategory/themeConList.do").submit();
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
		goPage(1);
	}
});

</script>