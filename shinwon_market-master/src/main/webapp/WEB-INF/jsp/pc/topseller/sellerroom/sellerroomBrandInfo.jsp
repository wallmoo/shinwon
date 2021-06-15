<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<!-- Content -->
    <div id="container">
        <div id="content" class="content">
            
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

		   	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'A' }">
		   	 <%@ include file="/WEB-INF/jsp/pc/topseller/include/sellerroomTabMenu.jsp"%>
			<!-- //Type A start-->
            <div class="sub_content" id="contentTypeA">
                <form id="searchForm" name="searchForm"  >
                    <input type="hidden" name="VDR_MST_IDX" value="<c:out value="${commandMap.VDR_MST_IDX }"/>"/>
                


                <div class="store_info_wp clearboth">
                    <div class="store_search">
                        <div class="search_form">
                            <span class="select w100p">
                                <select  name="searchAreaCode" id="searchAreaCode" title="지역 선택">
									<option value="">전체</option>
										<c:forEach var="row" items="${areaCode }" varStatus="i">
											<option value="<c:out value="${row.CMN_COM_IDX }"/>"<ui:select v="${commandMap.searchAreaCode}" t="${row.CMN_COM_IDX }" g="selected"/>><c:out value="${row.CMN_COM_NM }" /></option>
										</c:forEach>
                                </select>
                            </span>
                            <div class="search clearboth">
                                <input type="text" name="searchName" id="searchName" title="검색어 입력"  value="<c:out value="${commandMap.searchName }"/>">
                                <button class="btn inp_search" id="btn_search">검색</button>
                            </div>
                        </div>
                        <div class="store_list mCustomScrollbar">
                            <ul>
							  <c:forEach var="row" items="${sel_shp_list }" varStatus="i">
                                <li>
                                    <input type="radio" id="store-<c:out value="${row.SEL_SHP_IDX }"/>" name="storeList"  value='<c:out value="${row.SEL_SHP_IDX }"/>' data-shp-name="${row.SEL_SHP_NM }" data-shp-addr1="${row.SEL_SHP_ADDR1}" data-shp-addr2="${row.SEL_SHP_ADDR2 }" data-shp-tel="${row.SEL_SHP_TEL1 }-${row.SEL_SHP_TEL2 }-${row.SEL_SHP_TEL3 }">
                                    <label for="store-<c:out value="${row.SEL_SHP_IDX }"/>"><span class="icon"></span>${row.SEL_SHP_NM }</label>
                                    <span class="time">${row.SHP_ST_HH }:${row.SHP_ST_MM } ~ ${row.SHP_ED_HH }:${row.SHP_ED_MM }</span>
                                </li>
							  </c:forEach>                                                          
                            </ul>
                        </div>
                    </div>
                    <div class="store_detail">
                        <p class="store_name" id="storeName"></p>
                        <p class="store_info">
                            <span id="storeAddr"></span>
                            <span id="storeTel"></span>
                        </p>
                        <div class="store_map" id="mapArea" style="width: 100%; height:500px;">
                            <!-- <img src="/nas/cdn/PW/images/@temp/img_store_map.jpg" alt=""> -->
                        </div>
                    </div>
                </div>
                
                </form>
            </div>
            <!-- //Type A end-->
            </c:if>
            
            <c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
            <!-- //Type B start-->
            <div class="topseller_wrap clearboth" id="contentTypeB">          
                <!-- topseller_left-->
                <div class="topseller_left">
                	<%@ include file="/WEB-INF/jsp/pc/topseller/include/sellerroomTabMenu.jsp"%>
                    <!-- topseller_hd -->
                    <!-- 
                    <div class="topseller_hd">
                        <div class="seller">
                            <span class="sl_img"><img src="../../images/@temp/img_seller.jpg" alt=""></span>
                            <a href="#n" class="sl_name">PAIN OR PLEASURE</a>
                        </div>
                        <div class="sl_activity">
                            <a href="#n" class="like"><span class="blind">좋아요</span>481</a>
                            <a href="#n" class="shop">셀러샵 바로가기</a>
                            <a href="#n" class="share">공유하기</a>
                            <a href="#n" class="instagram">인스타그램 바로가기</a>
                        </div>
                    </div>
                     -->
                    <!--// topseller_hd -->
                    <!-- topseller_nav -->
                    <!-- 
                    <div class="topseller_nav">
                        <ul>
                            <li><a href="#n">HOME</a></li>
                            <li><a href="#n">SHOP</a></li>
                            <li><a href="#n">셀러픽</a></li>
                            <li><a href="#n">LOOKBOOK</a></li>
                            <li><a href="#n">MEDIA</a></li>
                            <li class="active"><a href="#n">매장안내</a></li>
                            <li><a href="#n">Q&A</a></li>
                        </ul>
                    </div>
                    -->
                    <!--// topseller_nav -->
                </div>
                <form id="searchForm" name="searchForm"  >
                    <input type="hidden" name="VDR_MST_IDX" value="<c:out value="${commandMap.VDR_MST_IDX }"/>"/>  
                <!-- //topseller_left-->
                <!-- topseller_right-->
                <div class="topseller_right">
                    <div class="sub_content product">
                        <div class="store_info_wp clearboth">
                            <div class="store_search">
                                <div class="search_form">
                                    <span class="select w100p">
		                                <select  name="searchAreaCode" id="searchAreaCode" title="지역 선택">
											<option value="">전체</option>
											<c:forEach var="row" items="${areaCode }" varStatus="i">
												<option value="<c:out value="${row.CMN_COM_IDX }"/>"<ui:select v="${commandMap.searchAreaCode}" t="${row.CMN_COM_IDX }" g="selected"/>><c:out value="${row.CMN_COM_NM }" /></option>
											</c:forEach>
		                                </select>
		                                <!--                                         
                                        <select title="지역 선택">
                                            <option>서울</option>
                                        </select>
                                         -->
                                    </span>
                                    <div class="search clearboth">
                                        <input type="text" name="searchName" id="searchName" title="검색어 입력" value="<c:out value="${commandMap.searchName }"/>">
                                        <button class="btn inp_search" id="btn_search">검색</button>
                                    </div>
                                </div>
                                <div class="store_list mCustomScrollbar">
                                    <ul>
									    <c:forEach var="row" items="${sel_shp_list }" varStatus="i">
			                                <li>
			                                    <input type="radio" id="store-<c:out value="${row.SEL_SHP_IDX }"/>" name="storeList"  value='<c:out value="${row.SEL_SHP_IDX }"/>' data-shp-name="${row.SEL_SHP_NM }" data-shp-addr1="${row.SEL_SHP_ADDR1}" data-shp-addr2="${row.SEL_SHP_ADDR2 }" data-shp-tel="${row.SEL_SHP_TEL1 }-${row.SEL_SHP_TEL2 }-${row.SEL_SHP_TEL3 }">
			                                    <label for="store-<c:out value="${row.SEL_SHP_IDX }"/>"><span class="icon"></span>${row.SEL_SHP_NM }</label>
			                                    <span class="time">${row.SHP_ST_HH }:${row.SHP_ST_MM } ~ ${row.SHP_ED_HH }:${row.SHP_ED_MM }</span>
			                                </li>
									    </c:forEach>
									    <!--  
                                        <li>
                                            <input type="radio" id="store-1" name="store">
                                            <label for="store-1"><span class="icon"></span>세이브존부천상동(SGF)</label>
                                            <span class="time">10:00 ~ 22:00</span>
                                        </li>
                                        <li>
                                            <input type="radio" id="store-2" name="store">
                                            <label for="store-2"><span class="icon"></span>엔터식스동탄(SGF)</label>
                                            <span class="time">10:00 ~ 22:00</span>
                                        </li>
                                        -->
                                    </ul>
                                </div>
                            </div>
                            <div class="store_detail">
                                <p class="store_name" id="storeName"></p>
                                <p class="store_info">
                                    <span id="storeAddr"></span>
                                    <span id="storeTel"></span>
                                </p>
                                <div class="store_map" id="mapArea" style="width: 100%; height:450px;">                                
                                	<!-- <img src="/nas/cdn/PW/images/@temp/img_store_map.jpg" alt=""> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form>
                <!-- //topseller_right-->
            </div>
			<!-- //Type B end-->
			</c:if>
            
        </div>

    </div>
    <!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfqdKUCNcgufydVZoN3KKu6LpRD6dvcfY&libraries=places"></script>
<script>
$(function(){
	
	// 검색
	search = function()
	{
		var $searchForm = $("#searchForm");
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/pc/topseller/sellerroom/sellerroomBrandInfo.do", "target":"_self", "method":"post"}).submit();
	};
	
	//$('#searchAreaCode').on('change', function(){
	//	search();
	//});

	$('#btn_search').on('click', function(){
		search();
	});
	
	
	$('.mCustomScrollbar').on('change', 'input[name=storeList]', function(){
		shopChecked();
	})
	
	pageInit();
});



function pageInit(){
	$('input[name=storeList]:eq(0)').prop('checked', true);
	shopChecked();
}

function shopChecked(){
	
	$('#mapArea').empty();
	$('#storeName').empty();
	$('#storeAddr').empty();
	$('#storeTel').empty();
	$('#storeName').append($('input[name=storeList]:checked').attr('data-shp-name'));
	$('#storeAddr').append($('input[name=storeList]:checked').attr('data-shp-addr1')+' '+$('input[name=storeList]:checked').attr('data-shp-addr2'));
	$('#storeTel').append('TEL : '+$('input[name=storeList]:checked').attr('data-shp-tel'));

	var geocoder = new google.maps.Geocoder();                
	geocoder.geocode({'address': $('input[name=storeList]:checked').attr('data-shp-addr1')}, function(result, status) {
		if(status == 'OK'){
            console.log('위도(latitude) : ' + result[0].geometry.location.lat()); // 위도
            console.log('경도(longitude) : ' + result[0].geometry.location.lng()); // 경도
            
            var myLatlng = new google.maps.LatLng(result[0].geometry.location.lat(), result[0].geometry.location.lng()); // 좌표값
            var mapOptions = { 
								zoom: 17, // 지도 확대레벨 조정
								center: myLatlng, 
                    			mapTypeId: google.maps.MapTypeId.ROADMAP 
            				} 
            var map = new google.maps.Map(document.getElementById('mapArea'), mapOptions); 
            var marker = new google.maps.Marker({ 
            	position: myLatlng, 
            	map: map, 
            	title: "회사명" // 마커에 마우스를 올렸을때 간략하게 표기될 설명글
            });                        
		} else {
			$('#mapArea').empty();
			$('#storeName').empty();
			$('#storeAddr').empty();
			$('#storeTel').empty();
		}
	});
}
//-->
</script>
