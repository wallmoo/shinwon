<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<title>쑈윈도 | 기획전상세(매거진)</title>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	 <!-- Content -->
    <div id="container">
        <div id="content" class="content">
             <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->
            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">기획전</h2>
            </div>
            <!--// Title -->
            <%-- <jsp:useBean id="JsonUtil" class="com.market.util.JsonUtil"/> --%>
			<input type='hidden' id="detailGroupListData" value='${JsonUtil.getJsonArrayFromList(detailGroupList)}'>
			<input type='hidden' id="detailListData" value= '${JsonUtil.getJsonArrayFromList(detailList)}'>
            <!-- S : .exhi_magazine_wrap -->
            <div class="exhi_magazine_wrap">
                <!-- S : .exhi_magazine_inner -->
                <div class="exhi_magazine_inner clearboth">
                    <!-- S : .exhi_magazine_img -->
                    <div class="exhi_magazine">
                        <div class="swiper-wrapper">
                        	<c:forEach var="groupRow" items="${detailGroupList}">
	                        	<div class="swiper-slide">
	                                <a href="#"><img id="<c:out value='${groupRow.PLN_GRP_IDX}'/>" src="<c:out value='${groupRow.FILE_NM}'/>" alt="<c:out value='${groupRow.CMM_FLE_ALT_TXT}'/>"></a>
	                            </div>
                        	</c:forEach>
                            <div class="swiper-slide">
                                <div class="cen_wrap">
                                    <div class="cen_inner">
                                        <div class="movWrap" data-video="TzWIXvPMv0E" style="background-image:url(../../images/@temp/img_mov_03.png);">
                                            <button type="button" class="btn_mov_play">PLAY</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-button-left-next"></div>
                        <div class="swiper-button-left-prev"></div>
                    </div>
                    <!-- E : .exhi_magazine_img -->
                    <!-- S : .exhi_exp_area -->
                    <div class="exhi_exp_area">
                        <div class="sort_tag_area clearboth">
                            <span class="tag only"><c:out value="${planInfo.TAG_MST_TITLE}"/></span>
                        </div>
                        <h3 class="exhi_tit"><c:out value="${planInfo.PLN_MST_TITLE}"/></h3>
                        <!-- #exhi_ajax_area -->
                        <div id="exhi_ajax_area">
                            <p class="exp"><c:out value="${planInfo.PLN_MST_DESC}"/></p>
                            <div class="tag_zone">
                                <dl class="clearboth">
                                    <dt>Tag</dt>
                                    <dd>
                                        <ul id="tagListContainer">
                                        	                                        
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                            <div class="exhi_scrollbar_con swiper-container">
                                <div class="swiper-wrapper" id="productListContainer">                                    
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                            </div>
                        </div>
                        <!-- // #exhi_ajax_area -->
                    </div>
                    <!-- E : .exhi_exp_area -->
                </div>
                <!-- E : .exhi_magazine_inner -->
            </div>
            <!-- E : .exhi_magazine_wrap -->
            <div class="apply_info w1200">
                <p class="info_tit">유의사항</p>
                <ul class="ul_dot">
                    <li>본 기획전은 쑈윈도 로그인 이후 참여 가능합니다.</li>
                    <li>고객센터 통화가 어려울 때는 1:1 상담 게시판을 이용 부탁드립니다.</li>
                </ul>
            </div>
            <div class="btn_wrap">
                <button class="btn_large" id="bkBtn">목록</button>
            </div>

        </div>
    </div>
    <!--// Content -->
    
    <%-- <form id="pageInfoForm" name="pageInfoForm" method="get">
	<input type="hidden" id="cPage" name="cPage" value='<c:out value="${commandMap.cPage }"></c:out>' />
	<input type="hidden" id="searchPlnMstStatus" name="searchPlnMstStatus" value='<c:out value="${commandMap.searchPlnMstStatus }"></c:out>' />
	</form> --%>
    
    <script>
  //기획전 목록 이동
	/* goList = function(){
		$("#pageInfoForm").attr("action","/pc/event/planList.do");
		$("#pageInfoForm").submit();
	} */
  
	$("#bkBtn").on("click",function(){
		location.href = "/pc/event/planList.do"
	});
    
    
    $(function(){
    	var detailList = JSON.parse($("#detailListData").val());
    	var detailGroupList = JSON.parse($("#detailGroupListData").val());
    	
		var changeGroup = function(groupId){
        	var productList = findProductListByGroupId(groupId);
        	var tagList = [];
        	for(var index =0; index < productList.length; index++){
        		if($.inArray(productList[index].TAG_MST_TITLE, tagList) == -1){
        			if(productList[index].TAG_MST_TITLE == undefined || 
        					productList[index].TAG_MST_TITLE == null ||
        					productList[index].TAG_MST_TITLE == ""){ 
        				continue;
        			}
        			tagList.push(productList[index].TAG_MST_TITLE);
        		}
        	}
        	renderProductList(productList);
        	renderTagList(tagList);        	
        }
        var renderTagList = function(tagList){
        	$("#tagListContainer").empty();
        	for(var index=0; index< tagList.length; index++){
        		var tagHtml = "<li>"+tagList[index]+"</li>";
        		$("#tagListContainer").append(tagHtml);
        	}
        }
        var renderProductList = function(productList){
        	$("#productListContainer").empty();
        	for(var index=0; index<productList.length; index++){
        		var productHtml = "<div class=\"swiper-slide\"><img src=\""+productList[index].IMG_THUMBNAIL+"\" alt=\"\"></div>"	
        		$("#productListContainer").append(productHtml);
        	}
        }
        var findProductListByGroupId = function(groupId){
        	return detailList.filter(function(item){return item.PLN_GRP_IDX == groupId; });
        }
        var swiper_left = new Swiper('.exhi_magazine', {
            // centeredSlides: true,
            slidesPerView: 1, //한번에 보여지는 슬라이드 개수
            navigation: {
                nextEl: '.swiper-button-left-next',
                prevEl: '.swiper-button-left-prev'
            },
            loop: true,
            on:{
            	slideChangeTransitionStart:function(silde){
            		changeGroup($(this.slides[this.snapIndex]).find("img").attr('id'));
            	}
           	}
        });

        var swiper = new Swiper('.swiper-container', {
            // centeredSlides: true,
            slidesPerView: 3, //한번에 보여지는 슬라이드 개수
            spaceBetween: 10, //마진값
            initialSlide: 0, //시작위치값
            roundLengths: true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev'
            },
            loop: true
        });
        
        
        
    });
    
</script>
    

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>