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
            <strong>계열사 및 관계사</strong>
        </div>
    </div><!-- // #visual -->

    <div id="breadcrumb" class="wrap"><!-- #breadcrumb -->
        <div class="holder">
            <a href="<c:out value="${brandDomain}" />/info/main/index.do" class="home ico_home"><span class="ir">홈</span></a>
            <span class="gt">&gt;</span>
            <a href="<c:out value="${brandDomain}" />/info/intro/introCompany.do" class="home"><span>마켓플랜트 소개</span></a>
            <span class="gt">&gt;</span>
            <strong>계열사 및 관계사</strong>
        </div>
    </div><!-- // #breadcrumb -->
 
    <div class="wrap">

        <%@ include file="/WEB-INF/jsp/info/include/leftMenu.jsp" %>

        <div id="contents"><!-- #contents -->

            <div class="tab-a"><!-- tab-a -->
            	<h3 class="title">계열사 및 관계사</h3>
                <ul class="tab">
                    <li id="goFriend1" class="active"><a href="javascript:goFriend1();"><span>계열사</span></a><span class="semantic">현재위치</span></li>
                    <li id="goFriend2" ><a href="javascript:goFriend2();"><span>관계사</span></a></li>
                </ul>
            </div><!-- // tab-a -->
			<div id="friend1">
	           
	            <p class="ti_history">
                <span class="large36">마켓플랜트는....</span>
          	   </p>

	
	            <div class="partner-list"><!-- partner-list -->
	                <ul class="reset">
	                    <li>
	                        <h4 class="reset warning large20">마켓플랜트</h4>
	
	                        <p>
	                            <strong class="large16">마켓플랜트...</strong>
	                        </p>
	
	                        <p>
	                               마켓플랜트...
	                        </p>

                            <p>
                                   마켓플랜트...
                            </p>
	                    </li>
	                </ul>
	            </div><!-- // partner-list -->
            </div>
            <div id="friend2">
            	<p class="ti_history">
					<span class="large36">마켓플랜트는....</span>
	            </p>
		
		        <div class="partner-list"><!-- partner-list -->
	                <ul class="reset">
                        <li>
                            <h4 class="reset warning large20">마켓플랜트</h4>
    
                            <p>
                                <strong class="large16">마켓플랜트...</strong>
                            </p>
    
                            <p>
                                   마켓플랜트...
                            </p>

                            <p>
                                   마켓플랜트...
                            </p>
                        </li>
	                </ul>
	            </div><!-- // partner-list -->
            </div>
            
        </div><!-- // #contents -->

    </div>
</div><!-- // #container -->


<%@ include file="/WEB-INF/jsp/info/include/footer.jsp" %>

<script type="text/javascript">

$("#friend2").hide();

function goFriend1(){
	$("#friend1").show();
	$("#friend2").hide();
	$("#goFriend1").attr("class","active");
	$("#goFriend2").attr("class","");
};
function goFriend2(){
	$("#friend1").hide();
	$("#friend2").show();
	$("#goFriend1").attr("class","");
	$("#goFriend2").attr("class","active");
};

 
 
 

//]]>
</script>
</body>
</html>