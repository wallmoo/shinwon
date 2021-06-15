<%-- <%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%> --%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<link rel="stylesheet" href="/nas/cdn/PW/css/slick.css">
<script src="/nas/cdn/PW/js/slick.js"></script>
<%
/* List<Map<String, Object>> toplist = (List<Map<String, Object>>)request.getAttribute("toplist");
System.out.println("toplist.size() :: " + toplist.size());

for(int i=0 ; i < toplist.size(); i++){
	HashMap planTopMap = (HashMap)toplist.get(i);
	System.out.println("planTopMap to String :: " + planTopMap.toString());
} */
%>


<%-- <%
	
	if(request.getAttribute("toplist") == null){
		
		List<Map<String, Object>> selectPlanList = new ArrayList();
		
		HashMap testMap = new HashMap();
		
		testMap.put("PRD_CTG_IDX", "1");
		testMap.put("PRD_CTG_NM", "삼영스 그랜드 오픈!!");
		testMap.put("CMM_FLE_ATT_PATH", "");
		testMap.put("CMM_FLE_SYS_NM", "");
		testMap.put("CMN_FLE_ALT_TXT", "");
		
		selectPlanList.add(testMap);
						
		request.setAttribute("toplist", selectPlanList);
	}

%> --%>

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
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">기획전</h2>
            </div>
            <div class="exhibition_slider_wrap">
                <div class="exhibition_slider">
                	<c:if test="${not empty toplist }">
                    		<c:forEach var="planRow" items="${toplist}" varStatus="status">
							<div>
                        	<a href="#detailPlanFn" onclick="detailPlanFn('<c:out value="${planRow.PLN_MST_IDX }" />');">
                            <img src="/nas/cdn/pc/images/@temp/img_exhi_03.png" alt="">
                            <%-- <img src="<c:out value="${planRow.CMM_FLE_ATT_PATH }" /><c:out value="${planRow.CMM_FLE_SYS_NM }" />" alt=""> --%>
	                            <dl>
	                                <dt><c:out value="${planRow.PLN_MST_TITLE }" /></dt>
	                                <!-- <dd>~80% OFF</dd> -->
	                            </dl>
                        	</a>
                        	</div>
                        	</c:forEach>
                        </c:if>
                   
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
             $('.exhibition_slider .slick-dots').wrap('<div class="slick-dots-wrap"></div>')
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
                        <select id="select1" title="" onchange="chgSelectFn(this);">
                            <option		value="">전체</option>
                            <option		value="1">여성</option>
                            <option		value="2">남성</option>
                            <option		value="3">유니섹스</option>
                            <option		value="4">라이프</option>
                        </select>
                    </span>
                </div>
                <!-- .exhibition_list_wrap -->
                <div class="exhibition_list_wrap" >
                    <ul class="exhibition_list clearboth" id="planListContainner">
                    </ul>
                </div>
                <!-- // .exhibition_list_wrap -->
            </div>
            <!-- ****************************************************************************

            E : 콘텐츠 끝

            ***************************************************************************** -->
        </div>
    </div>

<form id="planListForm"	name="planListForm" method="post">
	<input type="hidden" id="searchPlnMstStatus" name="searchPlnMstStatus"	value="ing"	/>
</form>
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script type="text/javascript">
	var cPage = 1;
	
	$(document).ready(function(){
		loadPlanListFn();
	});
	
	$(window).scroll(function(){
	 	var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		if(maxHeight == currentScroll){
			loadPlanListFn();
		}
	});	
	
	function loadPlanListFn(){
		$.ajax({
			type	: "POST",
			url		: "/pc/event/planListAjax.do",
			dataType: "json",
			data	: {	"cPage" : cPage, "searchPlnMstStatus": $("#searchPlnMstStatus").val(), "searchPlnMstCtg" : "", "prePlan" : "Y"},
			success : function(data) {
				if(cPage <= data.totalPageCount){
					console.log(data);
					addPlanList(data);
 					cPage++;	
				}
			}, error : function(err) {
				alert("요청 실패");
			}
			
		});
	}
	
	function addPlanList(data){
		var planList = data.list;
		if(planList.length > 0){
			for(var idx =0; idx < planList.length; idx++){
				var str = "";
				
				str += "<li>";
				str += "	<a href='#'>";
				str += "		<div class='thum_img'	>";
				str += "			<img src='"+planList[idx].CMM_FLE_ATT_PATH + planList[idx].CMM_FLE_SYS_NM +"' alt=''>";
				str += "		</div>";
				str += "		<p class='goods_title'>";
				str += "		" + planList[idx].PLN_MST_TITLE;
				str += "		</p>";
				str += "		<em class='period'>";
				str += "		" + planList[idx].PLN_MST_ST_DT + "~" + planList[idx].PLN_MST_ED_DT;
				str += "		</em>";
				str += "	</a>";
				str += "</li>";
            	
				$("#planListContainner").append(str);
			}
		}
	}
	
   /**
   * 진행중/종료 버튼 클릭시 발생 이벤트
   */
	function chgPlnMstStatusFn(type){
	   if(type != $("#searchPlnMstStatus").val()){
		   $("#planListContainner").html("");
			if(type == "ing"){
				$("#plnMstStatusIng").addClass("on");
				$("#plnMstStatusEnd").removeClass("on");
			}else{
				$("#plnMstStatusEnd").addClass("on");
				$("#plnMstStatusIng").removeClass("on");
			}
			
			$("#searchlnMstStatus").val(type);
			cPage = 1;
			loadPlanListFn();
	   } 
		
	}
   
   /**
   * 기획전 클릭시 상세페이지 이동 처리
   */
   function detailPlanFn(idx){
	   location.href= "/pc/event/planProductList.do?PLN_MST_IDX="+idx;
   }
          
	/* $(function(){
	    //스크롤 발생 이벤트 처리
		$(window).scroll(function(){
			var scrollTop = $(window).scrollTop();
			var planListContainnerHeight = planListContainner.height();
			var windowHight = $(window).height();
			
			
			if(scrollTop >= planListContainnerHeight - windowHight){
				
				//alert("스크롤 이벤트 실행");
 				$.ajax({
 				type	: "POST",
 				url		: "/pc/event/eventListAjax.do",
 				dataType: "json",
 				data	: {	"cPage" : cPage, "searchPlnMstStatus": "ing", "searchPlnMstCtg" : ""},
 				success : function(data) {
 					addPlanList(data);
 					cPage++;
 				}, error : function(err) {
 					alert("요청 실패");
 				}
 				});
			}
		});
	    
		//페이지 이동
	    goPage = function (cPage){
	        var $frm = $("#frm");
	        $frm.find("input[name='cPage']").val(cPage);
	        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/event/planList.do", "target":"_self", "method":"get"}).submit();
	    };
	    
	    var planListDataArray = [];
	    addPlanList = function(planList){
	    	for(var index =0; index < planList.list.length; index++){
	    	}
	    }
	    
	    var ingContainner = $("#ingContainner");
	    var planListContainner = $("#planListContainner")
	    addPlanItem = function(planData){
			var planhtml = "<li>"
			planhtml += "<a href='javascript:void(0)' data-pln_mst_idx='"+planData.EVT_MST_IDX+"' id='planLink'>";
			planhtml += "<div class='thum_img'>";
			planhtml += "<img src='"+planData.FILE_NM+"' alt=''>";
			planhtml += "</div>" ;
			planhtml += "<p class='goods_title'>"+planData.EVT_MST_TITLE+"</p>";
			planhtml += "<em class='period'>"+planData.EVT_MST_ED_DT_CHAR.replace(/\./g,"-")+" ~ "+planData.EVT_MST_ED_DT_CHAR.replace(/\./g,"-")+"</em>";
			planhtml += "</a>"; 
			planhtml += "</li>";
			ingContainner.append(planhtml);
	    }
	}); */
	
	    
</script>
