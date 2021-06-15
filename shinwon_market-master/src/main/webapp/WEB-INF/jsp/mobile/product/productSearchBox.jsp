<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- #wrap -->
    <div id="wrap" class="popup full">
        <!-- #header -->
        <header id="header" class="pop">
            <!-- .header_top -->
            <div class="header_top">
                <h1>상세검색</h1>
                <button type="button" class="btn_close">닫기</button>
            </div>
            <!-- // .header_top -->
        </header>
        <!-- // #header -->
        <!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="scroll_area">
                    <div class="cp01">
                        <!-- filter_wp-->
                        <div class="filter_wp">
                            <div class="filter_bx">
                                <a href="#n" class="b_title on">브랜드 (12)</a>
                                <div class="tg_area">
                                    <ul class="checkbox_list scroll cf">
                                    	<c:if test="${not empty brandList}">
	                                        <c:forEach var="brandListRow" items="${brandList }" varStatus="i">
		                                        <li>
		                                        	<input type="checkbox" name="searchBrandList" id="check-${i.index}" value="${brandListRow.BND_MST_IDX }" />
		                                        	<label for="check-${i.index}"><c:out value="${brandListRow.BND_MST_BRAND_NM }"/></label>
		                                        </li>
                                        	</c:forEach>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                            <div class="filter_bx">
                                <a href="#n" class="b_title on">사이즈 (11)</a>
                                <div class="tg_area">
                                    <ul class="checkbox_list cf">
                                    	<c:if test="${not empty sizeList}">
                                    		<c:forEach var="sizeItemRow" items="${sizeList}" varStatus="i">
                                        		<li>
                                        			<input type="checkbox" name="searchSizeItem" id="size-${i.index }" data-value="${izeItemRow.CMN_COM_IDX }">
                                        			<label for="size-${i.index }"><c:out value="${sizeItemRow.CMN_COM_NM }"/></label>
                                        		</li>
                                        	</c:forEach>
                                        </c:if>	
                                    </ul>
                                </div>
                            </div>
                            <div class="filter_bx">
                                <a href="#n" class="b_title on">가격</a>
                                <div class="tg_area">
                                    <ul class="checkbox_list cf">
                                        <li>
                                        	<input type="checkbox" name="searchPriceItem" id="price-1">
                                        	<label for="price-1">0만원 ~ 1만원</label>
                                        </li>
                                        <li>
                                        	<input type="checkbox" name="searchPriceItem" id="price-2">
                                        	<label for="price-2">1만원 ~ 3만원</label>
                                        </li>
                                        <li>
                                        	<input type="checkbox" name="searchPriceItem" id="price-3">
                                        	<label for="price-3">3만원 ~ 5만원</label>
                                        </li>
                                        <li>
                                        	<input type="checkbox" name="searchPriceItem" id="price-4">
                                        	<label for="price-4">5만원 ~ 10만원</label>
                                        </li>
                                        <li>
                                        	<input type="checkbox" name="searchPriceItem" id="price-5">
                                        	<label for="price-5">10만원 ~ 15만원</label>
                                        </li>
                                        <li>
                                        	<input type="checkbox" name="searchPriceItem" id="price-6">
                                        	<label for="price-6">15만원 이상</label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="filter_bx">
                                <a href="#n" class="b_title on">색상</a>
                                <div class="tg_area">
                                	<c:if test="${not empty colorList}">
                                		<c:forEach var="colorItemRow" items="${colorList }" varStatus="i">
		                                    <ul class="color_check_list cf">
		                                        <li>
		                                        	<input type="checkbox" name="searchColorItem" id="color-${i.index}" class="color_check" checked>
		                                        	<label for="color-${i.index}" style="background-color:<c:out value='${colorItemRow.CMN_COM_ETC2 }'/>"><c:out value="${colorItemRow.CMN_COM_NM }"/>색상명칭</label>
		                                        </li>
		                                    </ul>
                                    	</c:forEach>
                                    </c:if>
                                </div>
                            </div>
                            <div class="filter_tag">
                                <ul class="filter_tag_list cf">
                                    <!-- <li>
                                    	<span>나이키</span>
                                    	<button type="button" class="btn_filter_tag_del">삭제</button>
                                    </li> -->
                                </ul>
                            </div>
                        </div>
                        <!-- //filter_wp-->
                    </div>
                </div>
                <div class="btn_area dual fix">
                    <button type="button" class="btn gray" onclick="removeSelectedItemUIAll()">초기화</button>
                    <button type="button" class="btn ok" onclick="keywordSearch()">확인</button>
                </div>
            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
    </div>
    <!-- // #wrap -->

<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
    $(".set_tag").mCustomScrollbar({
        axis:"x",
        advanced:{
            autoExpandHorizontalScroll:true
        }
    });
</script>
