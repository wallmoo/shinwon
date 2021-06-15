<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
        <!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="list_layout_wrap">
                    <div class="slider_wrap funding_slide">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<c:if test="${not empty toplist}">
									<c:forEach var="topRow" items="${toplist}" varStatus="status">
		                          <div class="swiper-slide">
		                          	<a href="#"><img src="/nas/cdn/MW/images/_temp/img_exhibition_visual.jpg" alt=""></a>
		                          	<%-- <img src="${topRow.IMG_THUMBNAIL }" alt="${topRow.CMN_FLE_ALT_TXT }"> --%>
		                          </div>
		                          	</c:forEach>
                        	   </c:if>
	                        </div>
                        <div class="swiper-pagination"></div>
                      </div>
                    </div>
                    <div class="tab_wrap pd_reset">
                        <ul class="tab st2 n2">
                            <li id="plnMstStatusIng" class="on">
                            	<a href="#chgPlnMstStatusFn" onclick="chgPlnMstStatusFn('ing');">진행중</a>
                            </li>
                            <li id="plnMstStatusEnd">
                            	<a href="#chgPlnMstStatusFn"	onclick="chgPlnMstStatusFn('end');">종료</a>
                            </li>
                        </ul>
                        <div class="tab_cont" id="chgPlnMstStatusFn">
                            <div class="tit_wp">
                                <div class="board_right">
                                    <select	id="select1" title="상품정렬" onchange="chgSelectFn()">
                                        <option value="">전체</option>
                                        	<c:forEach var="selOptList" items="${listGnbMenu }">
		                    					<c:if test="${selOptList.PRD_CTG_LEVEL == 1 }">
		                            				<option	value='<c:out value="${selOptList.PRD_CTG_IDX }"></c:out>'><c:out value="${selOptList.PRD_CTG_NM }"></c:out></option>
		                            			</c:if>
		                            		</c:forEach>		
                                    </select>
                                </div>
                            </div>
                            <ul class="goods_list dual" id="ingPlanListContainner">
                            	<c:if test="${not empty list}">
                            		<c:forEach var="listRow" items="list" varStatus="i">
                            	<li>
                                    <a href="#n">
                                        <div class="thum_img">
                                            <img src="/nas/cdn/MW/images/_temp/img_thum_dual.jpg" alt="">
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="tag"><c:out value="${listRow.PLN_MST_TYPE}"/></span>
                                            </div>
                                            <p class="goods_title"><c:out value="${listRow.PLN_MST_IDX}"/><c:out value="${listRow.PLN_MST_TITLE}"/></p>
                                            <div class="goods_cont_wp">
                                                <p class="goods_term">2020.01.01 ~ 2020.01.28</p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                    </div>
                                    </c:forEach>
                                </c:if> 
                               </li>
                            </ul>
                            <ul class="goods_list dual" id="endPlanListContainner">
                            	<!-- <li>
                                    <a href="#n">
                                        <div class="thum_img">
                                            <img src="/nas/cdn/MW/images/_temp/img_thum_dual.jpg" alt="">
                                        </div>
                                        <div class="thum_info_txt">
                                            <div class="sort_tag_area clearboth">
                                                <span class="tag">#종료</span>
                                            </div>
                                            <p class="goods_title">반짝 반짝 Daily 룩☆ 빛나는 여름</p>
                                            <div class="goods_cont_wp">
                                                <p class="goods_term">2020.01.01 ~ 2020.01.28</p>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="btn_goods_area">
                                        <button type="button" class="btn_like" title="좋아요"><span>480</span></button>
                                    </div>
                               </li> -->
                            </ul>
                                
                        </div>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
		<form id="linkForm" name="linkForm" method="post" action="">
			<input type="hidden" id="PLN_MST_IDX" name="PLN_MST_IDX" value='' />
			<input type="hidden" id="cPage" name="cPage" value='${commandMap.cPage }' />
			<input type="hidden" id="searchPlnMstStatus" name="searchPlnMstStatus" value='${commandMap.searchPlnMstStatus }' />
			<input type="hidden" id="searchPlnMstCtg" name="searchPlnMstCtg" value='${commandMap.searchPlnMstStatus }' />
		</form>        
        
        <%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
        
<script>
	var cPage = 1;
	var cPageEng = 0;
	var searchPlnMstCtg = "";
	var tempCpage = 0;
	var sts;
	
	$(document).ready(function(){
		sts = "ing";
		loadPlanListFn(sts);
	});
	
	
     var swiper = new Swiper('.funding_slide .swiper-container', {
       slidesPerView: 1.1,
       spaceBetween: 5,
       initialSlide: 0,
       roundLengths: true,
       pagination: {
         el: '.swiper-pagination',
       }
     });
 
	
	
	//진행중/종료 버튼 클릭시 발생 이벤트
		chgPlnMstStatusFn = function(type){
			sts = type;
			$("#endPlanListContainner").hide();
			$("#ingPlanListContainner").hide();
			if(type == "ing"){
				$("#plnMstStatusIng").addClass("on");
				$("#plnMstStatusEnd").removeClass("on");
				$("#ingPlanListContainner").show();
				
			}else{
				$("#plnMstStatusEnd").addClass("on");
				$("#plnMstStatusIng").removeClass("on");
				$("#endPlanListContainner").show();
			}
			
			loadPlanListFn(type);
		}
	 
	
	
	// 기획전 카타고리 검색 이벤트 처리
	chgSelectFn = function(){
		loadPlanListFn(sts);
	}
	
	$(window).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		if(maxHeight <= currentScroll){
			loadPlanListFn(sts);
		}
		
	});

	var isAjaxing = false;

	loadPlanListFn = function(sts){

		if(isAjaxing){ return; }
		
		isAjaxing = true;
		
		searchPlnMstCtg = $("#select1").val();
		
		$.ajax({
			type	: "POST",
			url		: "/mobile/event/planListAjax.do",
			dataType: "json",
			data	: {	"cPage" : cPage,
						"searchPlnMstStatus" : sts,
						"searchPlnMstCtg" : searchPlnMstCtg
					   },
			success : function(data) {
				addPlanList(data.list, sts);
				cPage++;
				isAjaxing = false;
			}, error : function(err) {
				alert("요청 실패");
				isAjaxing = false;
				
			}
		});
	}
	
	// planList 랜더링
	addPlanList = function (list, sts){
		
		if(list == null){ return; }
		
		for(var idx = 0; idx < list.length; idx++){
			
			var str = "";
			str += "<li>";
			str += "	<a href='javascript:goPage("+list[idx].PLN_MST_IDX+",\""+list[idx].PLN_MST_TYPE+"\",\"" + sts +"\" )'>";
			str += "		<div class=\"thum_img\">";
			//str += "			<img src='"+planList[idx].CMM_FLE_ATT_PATH + planList[idx].CMM_FLE_SYS_NM +"' alt=''>";
			str += "			<img src=\"/nas/cdn/MW/images/_temp/img_thum_dual.jpg\" alt=''>";
			str += "		</div>";
			str += "		<div class=\"thum_info_txt\">";
			str += "			<div class=\"sort_tag_area clearboth\">";
			str += "				<span class=\"tag\">#기획전</span>";
			str += "			</div>";
			str += "			<p class=\"goods_title\">";
			str += "			" + list[idx].PLN_MST_TITLE;
			str += "			</p>";
			str += "			<div class=\"goods_cont_wp\">";
			str += "				<p class=\"goods_term\">";
			str += "				"+ getDateView(list[idx].PLN_MST_ST_DT,"-") + " ~ " + getDateView(list[idx].PLN_MST_ED_DT,"-");
			str += "				</p>";
			str += "			</div>";
			str += "		</div>";
			str += "	</a>";
			str += "	<div class=\"btn_goods_area\">";
			str += "		<button type=\"button\" class=\"btn_like\" title=\"좋아요\"><span>480</span></button>";
			//str += "		<button type=\"button\" onclick=\"likeBtnEvent($(this),'"+list[idx].CNT_PRD_MST_CD+"','TYPE_PRODUCT')\" class=\"btn-like"+(list[idx].MY_LIKE.indexOf("Y") > -1 ? " on" : "")+"\" title=\"\"><span>"+list[idx].LIKE_COUNT+"</span></button>";
			str += "	</div>";
			str += "</li>";
			
			appendPlanContainner(sts, str);
		}
			
	};
	
	
	// 기획전 탭 전환시 컨테이너 영역 랜더링
	appendPlanContainner = function(sts, str){
		$("#"+sts+"PlanListContainner").append(str);
	}
	
	getDateView = function(strDate, str){ 
	    strDate = strDate.replace(/\-/g, ""); 
	    return strDate.substring(0, 4) + str + strDate.substring(4, 6) + str + strDate.substring(6, 8); 
	}
	
	
	// 기획전 상세 페이지 이동
	goPage = function(idx, type, sts){
		var linkForm = $("#linkForm");
		$("#PLN_MST_IDX").val(idx);
		$("#searchPlnMstStatus").val(sts);
		$("#searchPlnMstCtg").val(searchPlnMstCtg);
		$("#cPage").val(tempCpage);
		$("#searchPlanMstType").val(searchPlanMstType);
		
		if(type == "A"){
			linkForm.attr("action", "/mobile/event/planProductList.do");
		} else if (type == "M"){
			linkForm.attr("action", "/mobile/event/planMagazine.do");
		}
	
		linkForm.submit();
	}
		
	
</script>        
      