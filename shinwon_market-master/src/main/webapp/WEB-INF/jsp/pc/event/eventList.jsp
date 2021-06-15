<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

<title>Insert title here</title>

<!-- Content -->
    <div id="container">
        <div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">이벤트</h2>
            </div>
            <!--// Title -->

            <!-- .sub_content -->
            <div class="sub_content product">

                <!-- .event_quick_wrap -->
                <div class="event_quick_wrap">
                    <!-- .event_quick_list -->
                    <ul class="event_quick_list clearboth">

                   		<c:forEach var="BannerRow" items="${BannerList}" varStatus="status">
	                        <li>
	                            <a href="#" class="event_quick_box">
	                                <img src="${cdnDomain }${BannerRow.FILE_NM }" alt="${BannerRow.CMN_FLE_ALT_TXT }">
	                            </a>
	                        </li>
                       	</c:forEach>

                    </ul>
                    <!-- // .event_quick_list -->
                </div>
                <!-- // .event_quick_wrap -->

                <!-- .tabmenuWrap -->
                <div class="tabmenuWrap">
                    <ul class="tabmenu_list cf">
                        <li id="eveMstStatusIng" class="on">
                        	<a href="javascript:void(0);" onclick="eveMstStatusFn('ing')">진행중</a>
                        </li>
                        <li id="eveMstStatusEnd">
                        	<a href="javascript:void(0);" onclick="eveMstStatusFn('end')">종료</a>
                        </li>
                        <li id="eveMstStatusWinner">
                        	<a href="javascript:void(0);" onclick="eveMstStatusFn('win')">당첨자발표</a>
                        </li>
                    </ul>
                </div>
                <!-- // .tabmenuWrap -->

                <!-- .event_list_wrap -->
                <div class="event_list_wrap">
  
                   <ul class="event_list clearboth" id="ingEveListContainner">	
                    </ul>
                    
                    <ul class="event_list clearboth" id="endEveListContainner">
                    </ul>
                    <ul class="event_list clearboth" id="winEveListContainner">
                    </ul>
                    
                    <!-- // .event_list -->
                </div>
                <!-- // .event_list_wrap -->

            </div>
            <!-- // .sub_content -->

        </div>
    </div>
    <!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script>

var cPage = 1;
var queryTotalCount = 18;
var isLastData = false;
var tapStatus = '';

var resetAjaxVar = function(){
	cPage = 1;
	isLastData = false;
	$('.event_list_wrap ul').empty();
};

eveMstStatusFn = function(type){
	if(tapStatus != type) {
		$('.event_list_wrap ul').hide();
		$('.tabmenu_list li').removeClass('on');
		if(type == "ing"){
			$("#eveMstStatusIng").addClass("on");
			$("#ingEveListContainner").show();
			
		}else if (type == "end"){
			$("#eveMstStatusEnd").addClass("on");
			$("#endEveListContainner").show();
		} else if (type == "win") {
			$("#eveMstStatusWinner").addClass("on");
			$("#winEveListContainner").show();
		}
		
		tapStatus = type;
		resetAjaxVar();
		eventListAjax();
	}
}

$(document).ready(function(){
	eveMstStatusFn('ing');
	
	$(window).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		if(maxHeight <= currentScroll){
			eventListAjax();
		}
	});
	
});
	



	
var isAjaxing = false;
eventListAjax = function(){
	if(isAjaxing || isLastData){ return; }
	isAjaxing = true;
	
	$.ajax({
		type	: "POST",
		url		: "/pc/event/eventListAjax.do",
		dataType: "json",
		data	: {	"cPage" : cPage,
					"pageSize" : queryTotalCount,
					"whereType" : tapStatus
				   },
		success : function(data) {
			if(data.list.length < queryTotalCount) isLastData = true;
			
			renderEventList(data.list);
			cPage += data.list.length;
			isAjaxing = false;
		}, error : function(err) {
			alert("요청 실패");
			isAjaxing = false;
		}
	});
}

appendEventContainner = function(sts, html){
	$("#"+sts+"EveListContainner").append(html);
}

renderEventList = function (list){
		
	if(list == null){ return; }
	
	for(var idx = 0; idx < list.length; idx++){
		var html = "";
		html += "<li>";
		if(tapStatus == 'end')
			html += "	<a href=\"javascript:void(0);\" class=\"end-cls\">";
		else
			html += "	<a href=\"/pc/event/eventView.do?EVT_MST_IDX=" + list[idx].EVT_MST_IDX + "\">";
			
		html += "		<div class=\"thum_area\">";
		html += "			<img src=\"<c:out value="${cdnDomain}"/>"+list[idx].FILE_NM +"\" alt=\"이미지\">";
		html += "		</div>";
		html += "			<div class=\"sort_tag_area clearboth\">";
		html += "				<p class='goods_title'>";
		html += "					<span class=\"tag\">" + (list[idx].TAG_MST_TITLE == undefined ? '' : list[idx].TAG_MST_TITLE) + "</span>";
		html += "			</div>";
		html += "		<p class=\"event_title\">" + list[idx].EVT_MST_TITLE  + "</p>";
		html += "	</a>";
		html += "</li>";
	
		appendEventContainner(tapStatus, html);
	}
			
}

$(document).on('click', '.end-cls', function(){
	alert('종료된 이벤트 입니다.');
});
	
</script>