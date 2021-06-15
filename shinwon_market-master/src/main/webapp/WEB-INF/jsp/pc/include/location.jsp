<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- LOCATION -->
<!-- <div class="location" style="top: 141px;">
    <ol class="clearboth">
        <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#" class="home">홈</a></li>
        <li class="active">
            <a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">1Depth Menu 01</a>
            <ul class="depth_list">
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">1Depth Menu 01</a></li>
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">1Depth Menu 02</a></li>
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">1Depth Menu 03</a></li>
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">1Depth Menu 04</a></li>
            </ul>
        </li>
        <li>
            <a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">2Depth Menu 01</a>
            <ul class="depth_list">
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">2Depth Menu 01</a></li>
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">2Depth Menu 02</a></li>
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">2Depth Menu 03</a></li>
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">2Depth Menu 04</a></li>
            </ul>
        </li>
        <li>
            <a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">3Depth Menu 01</a>
            <ul class="depth_list">
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">3Depth Menu 01</a></li>
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">3Depth Menu 02</a></li>
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">3Depth Menu 03</a></li>
                <li><a href="http://192.168.0.3//shinwonmall/web/html/payment/SWPWOP07.html#">3Depth Menu 04</a></li>
            </ul>
        </li>
    </ol>
</div> -->
<!-- //LOCATION -->

            <!-- LOCATION -->
<%-- 			<div class="location">
                <ol class="clearboth">
                    <li><a href="#" class="home">홈</a></li>
                    	<c:if test="${not empty listGnbMenu }">
                        	<c:forEach var="firstDepthMenu" items="${listGnbMenu}" varStatus="status">
                        		<c:if test="${status.first }">
			                    <li class="active">
	                    			<a id="selectedLoactionContainner" href="javascript:void(0)"><c:out value="${firstDepthMenu.PRD_CTG_NM }" /></a>
			                        <ul class="depth_list">
                        		</c:if>
	                            	<li><a href="javascript:changeFirstCategory('${firstDepthMenu.PRD_CTG_IDX}')"><c:out value="${firstDepthMenu.PRD_CTG_NM }" /></a></li>
                        		<c:if test="${status.last }">
			                        </ul>
			                    </li>
                        		</c:if>
                        	</c:forEach>
                        </c:if>
                    <li id="secondLocationContainner">
                    </li>
                    <li id="thirdLocationContainner">
                    </li>
                </ol>
            </div> --%>
            <!-- //LOCATION -->
<%-- <jsp:useBean id="JsonUtil" class="com.market.util.JsonUtil"/>
<input type='hidden' id="topListGnbMenu" value='${JsonUtil.getJsonArrayFromList(listGnbMenu)}'>
<script>

	var topListGnbMenu = JSON.parse($("#topListGnbMenu").val());

	changeFirstCategory = function(parentCategoryIdx){
		var categoryData = topListGnbMenu.find(function(item){return parentCategoryIdx == item.PRD_CTG_IDX});
		$("#selectedLoactionContainner").html(categoryData.PRD_CTG_NM);
		renderSecondCategory(categoryData);
	}
	
	renderSecondCategory = function(categoryData){
		var containner = $("#secondLocationContainner");
		var firstCategoryName =categoryData.child.length>0?categoryData.child[0].PRD_CTG_NM: "없음";
		var html = "<a href=\"#\">"+firstCategoryName+"</a>";
		html += "<ul class=\"depth_list\">";
		for(var index = 0; index < categoryData.child.length; index++){
			html += "<li><a href=\"javascript:void(0)\" onclick=\"randerChangeSecondCategory("+categoryData.child[index].PRD_CTG_IDX+")\">"+categoryData.child[index].PRD_CTG_NM+"</a></li>"
		}
		html += "</ul>";
		containner.html(html);
		containner.addClass("active");
		$("#thirdLocationContainner").empty();
	}
	
	randerChangeSecondCategory = function(parentCategoryIdx){
		var categoryData = null;
		for(var index = 0; index < topListGnbMenu.length; index++){
			categoryData = topListGnbMenu[index].child.find(function(item){return item.PRD_CTG_IDX == parentCategoryIdx;});
			if(categoryData != null){break;}
		}
		
		$("#secondLocationContainner > a").html(categoryData.PRD_CTG_NM);
		var containner = $("#thirdLocationContainner");
		var firstCategoryName =categoryData.child.length>0?categoryData.child[0].PRD_CTG_NM: "없음";
		var html = "<a href=\"#\">"+firstCategoryName+"</a>";
		html += "<ul class=\"depth_list\">";
		for(var index = 0; index < categoryData.child.length; index++){
			html += "<li><a href=\"javascript:void(0)\">"+categoryData.child[index].PRD_CTG_NM+"</a></li>"
		}
		html += "</ul>";
		containner.html(html);
		containner.addClass("active");
	}
</script> --%>