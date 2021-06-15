<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<div id="container">
        <div id="content" class="content">
        
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">기획전</h2>
            </div>
            <div class="exhibition_slider_wrap">
                <div class="exhibition_slider" style="display: none;">
                	<c:if test="${not empty toplist }">
                   		<c:forEach var="topRow" items="${toplist}" varStatus="status">
							<div>
		                       	<a href="${topRow.BNR_MST_URL }" target="_blank">
		                           <img src="<c:out value="${cdnDomain }"/>${topRow.IMG_THUMBNAIL }" alt="${topRow.CMN_FLE_ALT_TXT }">
		                            <dl>
		                                <dt><c:out value="${topRow.BNR_MST_TITLE }" /></dt>
		                            </dl>
		                       	</a>
	                       	</div>
                       	</c:forEach>
                       </c:if>
						<!-- 
						<div>
	                       	<a href="#" target="_blank">
	                           <img src="http://monkey-soft.com:3151/nas/cdn/attach/display/2020/06/19/9e4656f6-6d7c-45d4-90e8-6e061c5c901a.jpg" alt="${topRow.CMN_FLE_ALT_TXT }">
	                            <dl>
	                                <dt><c:out value="TEST" /></dt>
	                            </dl>
	                       	</a>
                       	</div>
                       	-->                       
                   </div> 
             <script>
                 $('.exhibition_slider').slick({
                     centerMode: true,
                     centerPadding: '0px',
                     slidesToShow: 3,
                     dots: true,
                     initialSlide: 1,
                     useTransform: true,
                     infinite: true,
                     autoplay: true,
                     pauseOnDotsHover: true
                 });
                 $('.exhibition_slider .slick-dots').wrap('<div class="slick-dots-wrap"></div>');
                 //if($('.slick-dots > li').length < 3){
                 //	 $('.exhibition_slider').hide();	 
                 //} else {
                 	$('.exhibition_slider').show();	 
                 //}
                 
            </script>
            
            <div class="tabmenuWrap">
                <ul class="tabmenu_list cf">
                    <li id="plnMstStatusIng" class="on">
                    	<a href="#chgPlnMstStatusFn"	onclick="chgPlnMstStatusFn('ing');">진행중</a>
                    </li>
                    <li id="plnMstStatusEnd">
                    	<a href="#chgPlnMstStatusFn" 	onclick="chgPlnMstStatusFn('end');">종료</a>
                    </li>
                </ul>
            </div>
            <div class="sub_content funding funding_end">
                <div class="top_title_select_area clearboth">
                
                    <span class="select">
	                        <select id="select1" title="" onchange="chgSelectFn()">
	                            <option	value="">전체</option>
		                    	<c:forEach var="selOptList" items="${listGnbMenu }">
		                    		<c:if test="${selOptList.PRD_CTG_LEVEL == 1 }">
		                            	<option	value='<c:out value="${selOptList.PRD_CTG_IDX }"></c:out>'><c:out value="${selOptList.PRD_CTG_NM }"></c:out></option>
		                    		</c:if>
           			        	</c:forEach>
	                        </select>
                    </span>
                </div>
                <!-- .exhibition_list_wrap -->
                <div class="exhibition_list_wrap" >
                    <ul class="exhibition_list clearboth" id="ingPlanListContainner">
                    </ul>
                    <ul class="exhibition_list clearboth" id="endPlanListContainner">
                    </ul>
                </div>
                <!-- // .exhibition_list_wrap -->
            </div>
            <!-- ****************************************************************************

            E : 콘텐츠 끝

            ***************************************************************************** -->
        </div>
    </div>
</div>

<form id="linkForm" name="linkForm" method="post" action="">
	<input type="hidden" id="PLN_MST_IDX" name="PLN_MST_IDX" value='' />
	<input type="hidden" id="cPage" name="cPage" value='${commandMap.cPage }' />
	<input type="hidden" id="searchPlnMstStatus" name="searchPlnMstStatus" value='${commandMap.searchPlnMstStatus }' />
	<input type="hidden" id="searchPlnMstCtg" name="searchPlnMstCtg" value='${commandMap.searchPlnMstStatus }' />
</form>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<script type="text/javascript">
	var cPage = 1;
	var queryTotalCount = 18;
	var isLastData = false;
	var searchPlnMstCtg = "";
	var sts;

	// TODO 상세에서 목록으로 돌아올때 체크 구현중
	// var ingCpageValue = Number("${commandMap.cPage}");
	/*var ingCpageValue = 2;
	if (ingCpageValue > 1){
		var ingSts = "${commandMap.searchPlnMstStatus }";
		var planIdx = "${commandMap.PLN_MST_IDX }";
		for(var index = 0 ; index < ingCpageValue ; index++){
			loadPlanListFn(ingSts);
		}
		$("#plan_"+planIdx).focus();
	}*/

	var resetAjaxVar = function(){
		cPage = 1;
		isLastData = false;
		$('#ingPlanListContainner').empty();
		$('#endPlanListContainner').empty();
	};
	
	$(document).ready(function(){
		sts = "ing";
		loadPlanListFn(sts);
	});
	
	
	$(window).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		if(maxHeight <= currentScroll){
			loadPlanListFn(sts);
		}
		
	});

	var isAjaxing = false;

	loadPlanListFn = function(sts){

		if(isAjaxing || isLastData){ return; }
		
		isAjaxing = true;
		
		searchPlnMstCtg = $("#select1 option:selected").val();
		
		$.ajax({
			type	: "POST",
			url		: "/pc/event/planListAjax.do",
			dataType: "json",
			data	: {	"cPage" : cPage,
				 		"pageSize" : queryTotalCount,
						"searchPlnMstStatus" : sts,
						"searchPlnMstCtg" : searchPlnMstCtg
					   },
			success : function(data) {
				
				if(data.list.length < queryTotalCount) isLastData = true;
					
				addPlanList(data.list, sts);
				cPage += data.list.length;
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
			str += "<li id='plan_"+list[idx].PLN_MST_IDX+"'>";
			str += "	<a href='javascript:goPage("+list[idx].PLN_MST_IDX+",\""+list[idx].PLN_MST_TYPE+"\",\"" + sts +"\" )'>";
			str += "		<div class='thum_img'>";
			str += "			<img src='<c:out value="${cdnDomain}"/>"+list[idx].CMM_FLE_ATT_PATH + list[idx].CMM_FLE_SYS_NM +"' alt='" + list[idx].CMN_FLE_ALT_TXT + "'>";
			str += "		</div>";
			str += "		<p class='goods_title'>";
			str += "		" + list[idx].PLN_MST_TITLE;
			str += "		</p>";
			str += "		<em class='period'>";
			str += "		" + getDateView(list[idx].PLN_MST_ST_DT,"-") + " ~ " + getDateView(list[idx].PLN_MST_ED_DT,"-");
			str += "		</em>";
			str += "	</a>";
			str += "</li>";
			appendPlanContainner(sts, str);
		}
			
	}

	//진행중/종료 버튼 클릭시 발생 이벤트
	chgPlnMstStatusFn = function(type){
		resetAjaxVar();
		
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
	
	// 기획전 탭 전환시 컨테이너 영역 랜더링
	appendPlanContainner = function(sts, str){
		$("#"+sts+"PlanListContainner").append(str);
	}
	
	// 기획전 카타고리 검색 이벤트 처리
	chgSelectFn = function(){
		resetAjaxVar();
		loadPlanListFn(sts);
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
		$("#cPage").val(cPage);
		
		if(sts == 'end') {
			alert('종료된 기획전입니다.');
		} else {
			if(type == "A"){
				linkForm.attr("action", "/pc/event/planProductList.do");
			} else if (type == "M"){
				linkForm.attr("action", "/pc/event/planMagazine.do");
			}
		}

		linkForm.submit();
	}
</script>
