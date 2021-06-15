<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="page-popup"><!-- page-list -->
 
<div id="skipNavigation">
    <a href="#contents">컨텐츠 바로가기</a>
</div>

<div id="popContainer"><!-- popContainer -->

    <h3 class="title">
        <span>${popup.POP_MST_TITLE}</span>
        <!--
        <small>측정 방법에 따라 약간의 오차가 있을 수 있습니다.</small>
        -->
        <a href="javascript:closeWin();" class="close"><span class="icon"><em>창 닫기</em></span></a>
    </h3>

    <div id="popWrapper"><!-- popWrapper -->
       <div class="clearfix size-info"><!-- size-info -->
		  ${popup.POP_MST_CONTENTS}
       </div><!-- // size-info -->
   	   <div class="frame frame-a"><!-- frame -->
			<c:if test="${popup.POP_MST_DAY_YN eq 'Y' }" >		
				<label><input type="checkbox" id="daycheck" name="daycheck" /> 오늘 하루 보이지 않음</label>
			</c:if>	
       </div><!-- // frame -->
   	   
    </div><!-- // popWrapper -->
</div><!-- // popContainer -->
<script type="text/javascript">
//<![CDATA[
           
var todayDate = new Date();
var today = ""+(todayDate.getMonth()+1)+todayDate.getDate();

function closeWin() {
	
	if ( $("#daycheck").length > 0 ) {
		if ( $('#daycheck').is(":checked") == true) {
			$.cookie("POPUP_${popup.POP_MST_IDX}${popup.POP_MST_UPD_DT}_"+today, "Y", { path: '/', expires: 1 }  );
		}
	}
	self.close();
}
//]]>
</script>
<script src="<c:out value="${cdnDomain}" />/pc/js/google.analytics.js"></script></body>
</html>