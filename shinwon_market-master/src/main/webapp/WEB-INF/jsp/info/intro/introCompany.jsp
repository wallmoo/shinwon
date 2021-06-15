<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/include/head.jsp" %>
</head>
<body class="page-about">
<div id="skipNavigation"><!-- #skipNavigation -->
    <a href="#contents">컨텐츠 바로가기</a>
</div><!-- #skipNavigation -->
 
<%@ include file="/WEB-INF/jsp/info/include/top.jsp" %>

<div id="container"><!-- #container -->
    
    <h2 class="semantic">컨텐츠 영역</h2>

    <div id="visual"><!-- #visual -->
        <div class="wrap">
            <strong>회사소개</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">  
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/intro/introCompany.do" class="home"><span>마켓플랜트 소개</span></a>
            <span class="gt">&gt;</span>
            <strong>브랜드 스토리</strong>
        </div>
    </div><!-- // #breadcrumb -->

    <div class="wrap">
  
        <div id="contents"><!-- #contents -->

            <div class="tab-a"><!-- tab-a -->
            	<h3 id="tabTitle" class="title">브랜드 스토리</h3>
                <ul class="tab">
                    <li id="goIntro" class="active"><a href="javascript:goIntro();"><span>브랜드 스토리</span></a><span class="semantic">현재위치</span></li>
                    <li id="goHis" class=""><a href="javascript:goHis();"><span>연혁</span></a></li>
                </ul>
            </div><!-- // tab-a -->
			<div id="intro">
	            <div class="about-a"><!-- about-a -->
	                <p class="mt0">
	                    <strong><span>마켓플랜트</span></strong>
	                </p>
	
	                <p>
	                    <strong class="large16"></strong>
	                </p>
	
	                <p>
						마켓플랜트 브랜드 스토리
	                </p>
	            </div><!-- // about-a -->
	           
			</div>
			<div id="history">
				<p class="ti_history">
	                마켓플랜트는 고객을 가장 소중히 생각하는 기업입니다.
	            </p>
	
	            <div class="tab-b item-2"><!-- tab-b -->
	                <ul class="tab">
	                    <li id="goHis1" class="active"><a href="javascript:goHis1();"><span>2011년 ~ 현재</span></a><span class="semantic">현재위치</span></li>
	                    <li id="goHis2" class=""><a href="javascript:goHis2();"><span>2005년 ~ 2010년</span></a></li>
	                </ul>
	            </div><!-- // tab-b -->
	
	            <div id="history1" class="history-list"><!-- history-list -->
	                <div class="section section-2016">
	                    <h4 class="reset"><span class="warning">2016</span><span class="semantic">년</span><i class="icon"><!-- icon --></i></h4>
	                    <ul class="reset">
	                        <li>
	                            <strong>02<span class="semantic">월</span></strong>
                                    마켓플랜트
	                        </li>
	                        <li>
	                            <strong>01<span class="semantic">월</span></strong>
                                    마켓플랜트
	                        </li>
	                    </ul>
	                </div>
	                <div class="section section-2015">
	                	<h4 class="reset"><span class="warning">2015</span><span class="semantic">년</span><i class="icon"><!-- icon --></i></h4>
	                    <ul class="reset">
                            <li>
                                <strong>02<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
                            <li>
                                <strong>01<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
	                    </ul>
	                </div>
	                <div class="section section-2014">
	                    <h4 class="reset"><span class="warning">2014</span><span class="semantic">년</span><i class="icon"><!-- icon --></i></h4>
	                    <ul class="reset">
                            <li>
                                <strong>02<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
                            <li>
                                <strong>01<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
	                    </ul>
	                </div>
	                <div class="section section-2013">
	                    <h4 class="reset"><span class="warning">2013</span><span class="semantic">년</span><i class="icon"><!-- icon --></i></h4>
	                    <ul class="reset">
                            <li>
                                <strong>02<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
                            <li>
                                <strong>01<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
	                    </ul>
	                </div>
	                <div class="section section-2012">
	                    <h4 class="reset"><span class="warning">2012</span><span class="semantic">년</span><i class="icon"><!-- icon --></i></h4>
	                    <ul class="reset">
                            <li>
                                <strong>02<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
                            <li>
                                <strong>01<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
	                    </ul>
	                </div>
	                <div class="section section-2011">
	                    <h4 class="reset"><span class="warning">2011</span><span class="semantic">년</span><i class="icon"><!-- icon --></i></h4>
	                    <ul class="reset">
                            <li>
                                <strong>02<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
                            <li>
                                <strong>01<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
	                    </ul>
	                </div>
	            </div><!-- // history-list -->
	            
	            <div id="history2">
		            <div class="history-list old_history"><!-- history-list -->
		                <div class="section section-2009">
	                    <h4 class="reset"><span class="warning">2009</span><span class="semantic">년</span><i class="icon"><!-- icon --></i></h4>
	                    <ul class="reset">
                            <li>
                                <strong>02<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
                            <li>
                                <strong>01<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
	                    </ul>
	                </div>
	                <div class="section section-2008">
	                    <h4 class="reset"><span class="warning">2008</span><span class="semantic">년</span><i class="icon"><!-- icon --></i></h4>
	                    <ul class="reset">
                            <li>
                                <strong>02<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
                            <li>
                                <strong>01<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
	                    </ul>
	                </div>
	                <div class="section section-2007">
	                    <h4 class="reset"><span class="warning">2007</span><span class="semantic">년</span><i class="icon"><!-- icon --></i></h4>
	                    <ul class="reset">
                            <li>
                                <strong>02<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
                            <li>
                                <strong>01<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
	                    </ul>
	                </div>
	                <div class="section section-2006">
	                    <h4 class="reset"><span class="warning">2006</span><span class="semantic">년</span><i class="icon"><!-- icon --></i></h4>
	                    <ul class="reset">
                            <li>
                                <strong>02<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
                            <li>
                                <strong>01<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
	                    </ul>
	                </div>
	                <div class="section section-2005">
	                    <h4 class="reset"><span class="warning">2005</span><span class="semantic">년</span><i class="icon"><!-- icon --></i></h4>
	                    <ul class="reset">
                            <li>
                                <strong>02<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
                            <li>
                                <strong>01<span class="semantic">월</span></strong>
                                    마켓플랜트
                            </li>
	                    </ul>
	                </div>
	            </div>
			</div>
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->


<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>

<script type="text/javascript">

$("#history").hide();
$("#history2").hide();
function goIntro(){
	$("#intro").show();
	$("#history").hide();
	$("#goIntro").attr("class","active");
	$("#goHis").attr("class","");
	$("#tabTitle").text("브랜드");
	
	//$("#frm").submit();
};
function goHis(){
	$("#history").show();
	$("#intro").hide();
	$("#goIntro").attr("class","");
	$("#goHis").attr("class","active");
	$("#tabTitle").text("연혁");
	//$("#frm").submit();
};

function goHis1(){
	$("#history1").show();
	$("#history2").hide();
	$("#goHis1").attr("class","active");
	$("#goHis2").attr("class","");
	//$("#frm").submit();
};
 
function goHis2(){
	$("#history1").hide();
	$("#history2").show();
	$("#goHis1").attr("class","");
	$("#goHis2").attr("class","active");
	//$("#frm").submit();
};
 
 

//]]>
</script>
</body>
</html>