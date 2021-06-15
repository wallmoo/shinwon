<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-main">

<div id="skipToContent"><a href="#content"><span>본문으로 건너뛰기</span></a></div>

<h1 class="sr-only">MarketPlant</h1>

<div id="container"><!-- container -->

    <div id="header">
    	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
    </div><!-- // header -->

    <div id="wrapper"><!-- wrapper -->

        <div id="innerWrapper"><!-- innerWrapper -->
        
        	<div id="breadcrumb" class="breadcrumb"><!-- breadcrumb -->
                <div class="inner">
                    <a class="home" href="#!"><span>HOME</span></a>
                    <i><em>&gt;</em></i>
                    <a href="#!"><span>기획전</span></a>
                    <i><em>&gt;</em></i>
                    <strong>숄더백</strong>
                </div>
            </div><!-- // breadcrumb -->

            <div id="content"><!-- content -->

                <h2 class="sr-only">{{ 본문 영역 }}</h2>

                <div id="inner"><!-- inner -->
				
					CONTENTS
				
                </div><!-- // inner -->

            </div><!-- // content -->

            <div id="skyscraper">
            	<%@ include file="/WEB-INF/jsp/pc/include/skyscraper.jsp" %>
            </div><!-- // skyscraper -->
            
        </div><!-- // innerWrapper -->

    </div><!-- // wrapper -->

    <div id="footer">
    	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
    </div><!-- // footer -->

</div>

<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>

<script>

//independent script
(function(BASE){
	
    'use strict';
    var $document = $(document);
    $document.ready(function(){
    });
    
})(BASEkit || window);

$(function(){
	
});

</script>
</body>
</html>