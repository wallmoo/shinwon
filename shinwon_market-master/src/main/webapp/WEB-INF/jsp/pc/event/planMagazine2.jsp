<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Map<String, Object>> TAG_LIST = (List<Map<String, Object>>)request.getAttribute("TAG_LIST");
System.out.println(TAG_LIST.toString());

/* List<Map<String, Object>> PRD_MST_NM = (List<Map<String, Object>>)request.getAttribute("PRD_MST_NM");
System.out.println(PRD_MST_NM.toString()); */
%>
	
<title>쑈윈도 | 기획전상세(매거진)</title>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<div id="container">
        <div id="content" class="content">
            <!-- LOCATION -->
            <div class="location">
                <ol class="clearboth">
                    <li><a href="#" class="home">홈</a></li>
                    <li class="active">
                        <a href="#">1Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">1Depth Menu 01</a></li>
                            <li><a href="#">1Depth Menu 02</a></li>
                            <li><a href="#">1Depth Menu 03</a></li>
                            <li><a href="#">1Depth Menu 04</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">2Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">2Depth Menu 01</a></li>
                            <li><a href="#">2Depth Menu 02</a></li>
                            <li><a href="#">2Depth Menu 03</a></li>
                            <li><a href="#">2Depth Menu 04</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">3Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">3Depth Menu 01</a></li>
                            <li><a href="#">3Depth Menu 02</a></li>
                            <li><a href="#">3Depth Menu 03</a></li>
                            <li><a href="#">3Depth Menu 04</a></li>
                        </ul>
                    </li>
                </ol>
            </div>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작
 				
            ***************************************************************************** -->
          <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">기획전</h2>
            </div>
            <!--// Title -->

            <!-- S : .exhi_magazine_wrap 왼쪽영역시작-->
            <div class="exhi_magazine_wrap">
                <!-- S : .exhi_magazine_inner -->
                <div class="exhi_magazine_inner clearboth">
                    <!-- S : .exhi_magazine_img -->
                    <div class="exhi_magazine">
                        <div class="swiper-wrapper">
                        	<c:if test="${not empty detailGroupList }">
	                            <c:forEach var="mgzMtRow" items="${detailGroupList}" varStatus="status">
		                            <div id="mst_<c:out value="${mgzMtRow.PLN_GRP_IDX }" />" class="swiper-slide">
		                            		<img src="/nas/cdn/PW/images/@temp/img_exhibition1.png" alt="">
		                            		<%-- <img src="<c:out value="${mgzMtRow.PLN_GRP_IDX }" /><c:out value="${mgzMtRow.FILE_NM}" /><c:out value="${mgzMtRow.CMM_FLE_ALT_TXT}" />" alt="${mgzMtRow.CMM_FLE_ALT_TXT }"> --%>
		                            			<%-- <c:forTokens var="file" items="${detailGroupList}" delims="." varStatus="status">
												    <c:if test="${status.last}">
												        <c:choose>
												            <c:when test="${file eq 'jpg' || file eq 'gif' || file eq 'png' || file eq 'bmp' }"> 
												            </c:when>
												            영상
												        </c:choose>
												    </c:if>
												</c:forTokens> --%>
		                            </div>
	                            </c:forEach>
                            </c:if>		
                        </div>
                        <div class="swiper-button-left-next"></div>
                        <div class="swiper-button-left-prev"></div>
                    </div>
                    	</div>
                    		</div>
                    
                    
                    <!-- E : .exhi_magazine_img : 왼쪽영역끝-->
                    
                    
                    
                    <!-- S : .exhi_exp_area : 오른쪽시작-->
                    <c:forEach var="mgzRow" items="${detailGroupList}" varStatus="status">
                    
                    <c:set var="PLN_GRP_IDX"  value="${mgzRow.PLN_GRP_IDX }" />
                                        
                    
                    <div id="rightArea_<c:out value="${PLN_GRP_IDX}" />" class="exhi_exp_area"	style="display: none;">
                        <div class="sort_tag_area clearboth">
                            <span class="tag only"><c:out value="${planInfo.TAG_MST_TITLE}" /></span>
                        </div>
                        <h3 class="exhi_tit"><c:out value="${planInfo.PLN_MST_TITLE }" /></h3>

                        <!-- #exhi_ajax_area 슬라이드 데이터영역-->
                        <div id="exhi_ajax_area">
                            <p class="exp">
                        		<c:out value="${mgzRow.PLN_GRP_DESC }" />
                            </p>
                            
                            <div class="tag_zone">
                                <dl class="clearboth">
                                    <dt>Tag</dt>
                                    <dd>
                                        <ul> 
                                        	<li>
                                        		<c:forEach var="tagRow" items="${detailList}" varStatus="status">
	                                        	<c:out value="${tagRow.TAG_MST_TITLE  }" />
	                                        	</c:forEach>
                                        	</li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                            
                            <div class="exhi_scrollbar_con swiper-container">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide">
                                    <div>
                                    	<%-- <c:forEach var="goodsRow" items="${detailList }" varStatus="status"> --%>
                                    	<img src="<c:out value="${goodsRow.IMG_THUMBNAIL  }" /> alt="">
                                    	
                                    	<!-- <img src="/nas/cdn/pc/images/@temp/img_exhi01.png" alt=""> -->
                                    </div>
                                   </div>
                                </div>
                                <div class="swiper-button-next"></div>
                                <div class="swiper-button-prev"></div>
                            </div>
                        </div>
                        <!-- // #exhi_ajax_area -->
						
                    <!-- E : .exhi_exp_area -->
                <!-- E : .exhi_magazine_inner -->
            </div>
            </c:forEach>
            
			
           
            
            <!-- E : .exhi_magazine_wrap -->
            <div class="apply_info w1200">
                <p class="info_tit">유의사항</p>
                <ul class="ul_dot">
                    <li>본 기획전은 쑈윈도 로그인 이후 참여 가능합니다.</li>
                    <li>고객센터 통화가 어려울 때는 1:1 상담 게시판을 이용 부탁드립니다.</li>
                </ul>
            </div>
            <div class="btn_wrap">
                <button class="btn_large">목록</button>
            </div>

        </div>
    </div>
    <!--// Content -->



<script>
	$(function() {
	$("#goBtn").on("click",function(){
	location.href = ""
	});
	
	
	$(function(){
        // $('.exhi_magazine_wrap').slick({
        //     dots : true,
        //     infinite: true,
        //     speed: 500,
        //     cssEase: 'linear',
        //     slidesToShow: 1,
        //     // autoplay: true,
        //     autoplaySpeed: 5000,
        //     adaptiveHeight: true
        // });
	
	
       var swiper_left = new Swiper('.exhi_magazine', {
            // centeredSlides: true,
            slidesPerView: 1, //한번에 보여지는 슬라이드 개수
            navigation: {
                nextEl: '.swiper-button-left-next',
                prevEl: '.swiper-button-left-prev'
            },
            loop: true,
            on : {
            	
            	slideChange: function () {
            		var mtId = '301';
            		$(".exhi_exp_area").hide(); 
            		
            		
            		$("#rightArea_"+ mtId).show();
            		
               	}
            });
            
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