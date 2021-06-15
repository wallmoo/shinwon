<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>
<body class="popup">

<header><!-- header -->
    <h1 class="title">재고정보 동기화 로그 팝업</h1>
    <a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

    <div id="contents"><!-- contents -->
        
    </div><!-- // contents -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	setInterval(function(){
   	 $.ajax({
   	    	type: "post",
   			url : "<c:out value="${serverDomain}"/>/am/site/erpStockLogAjax.do",
   			data : null,
   			dataType : "json",
   			async : false,
   			success : function(data){
   				$("#contents").html(data.content);
   			},
   			error : function(request,status,error){console.log(error);}
   	    });
   },2500);
});
</script>
</body>
</html>