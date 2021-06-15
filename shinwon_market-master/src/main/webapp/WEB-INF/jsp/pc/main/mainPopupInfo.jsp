<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-popup">
	<c:if test="${not empty popupInfo }">
		
		<div class="sub_content">
	        <div class="dim"></div>
	
	        <div id="layer_benefit" class="layer notice_popup is_btn">
	        	<c:choose>
	        		<c:when test="${popupInfo.POP_MST_MDE eq 'P' }">
						<a href="<c:out value="${popupInfo.POP_MST_LNK}"/>" target="_self">
		            	<div class="layer_content">
							${popupInfo.POP_MST_CNT}
		            	</div>
		            	</a>
	        		</c:when>
	        		<c:when test="${popupInfo.POP_MST_MDE eq 'N' }">
						<a href="<c:out value="${popupInfo.POP_MST_LNK}"/>" target="_blank">
			            <div class="layer_content">
							${popupInfo.POP_MST_CNT}
			            </div>
		            	</a>
	        		</c:when>
	        		<c:otherwise>
						<div class="layer_content">
							${popupInfo.POP_MST_CNT}
			            </div>
	        		</c:otherwise>
	        	</c:choose>
		        
	            <div class="layer_bottom">
	            	<c:if test="${popupInfo.POP_MST_DAY_YN eq 'Y' }">
	            		<input type="checkbox" id="inp_today_${popupInfo.POP_MST_IDX}" name="inp_today_${popupInfo.POP_MST_IDX}">
	                	<label for="inp_today_${popupInfo.POP_MST_IDX}"><span class="icon"></span>오늘 하루 그만 보기</label>	
	            	</c:if>
	                <a href="#none" class="btn_layer_close" data-type="p" data-id="${popupInfo.POP_MST_IDX}">닫기</a>
	            </div>
	        </div>
	    </div>
		
	</c:if>
</body>
<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<script type="text/javascript" src="/nas/cdn/pc/js/jquery.cookie.js"></script>
<script src="<c:out value="${cdnDomain}" />/pc/js/common.js" charset="utf-8"></script>
<script type=text/javascript>

$(document).ready(function(){
	
	com.pop_chk(true);
	
	$('.btn_layer_close').on('click', function(){
	    var todayDate = new Date();
	    var midnight = new Date(todayDate.getFullYear(), todayDate.getMonth(), todayDate.getDate(), 23, 59, 59);
		var popup_idx = $(this).data("id");
		var type = $(this).data("type");
		var $this = $(this).parent("div").parent("div").parent("div");
		
		if($this.find("input[id^=inp_today_]").is(":checked") == true)
		{
			$.cookie("MainPopup_"+popup_idx , "Y" ,{ path: '/', expires: midnight });	
		}
		self.close();
	});

});

</script>
</html>