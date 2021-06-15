<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
    <a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

    <aside id="navigation"><!-- navigation -->
        <nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
        </nav>
    </aside><!-- // navigation -->

    <div id="body"><!-- body -->

        <section id="contents"><!-- contents -->

            <div id="breadcrumb"><!-- breadcrumb -->
                <a href="#none"><i class="icon-home em"></i> HOME</a>
                &gt;
                <a href="#none">상품관리</a>
                &gt;
                <span>이미지일괄업로드</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">이미지일괄업로드</h3>

                <div class="title-box">
                    <h4 class="title">파일업로드</h4>
                </div>
                
                <form id="frm" name="frm" method="post" enctype="multipart/form-data">
	  					<input type="hidden" id="listGb" name="listGb"  value="" />
	                    <div class="form-group">
<!-- 	                    	<label class="label" for="multiFile"><span>첨부파일</span></label> -->
	                    	<div class="field">	                    		                  	
	                    		<table id="fileView" style="width:50%;">
	                    			<tr>	                    				
	                    				<td id="defaultFile">	                    					
	                    					<input type="file" name="file" id="file" class="file" value="" />	                    						                    					                   					 					               		
	                    				</td>	
	                    				<td>
<!-- 	                    					<input type="button" id="delFileData" value="파일 지우기"/> -->
<h4 id="status">파일을 선택하여 주십시오.</h4>
	                    				</td>
	                    			</tr>	                    													                    				                    				                    		
	                    		</table>		                    			                    			                      		
								<small class="desc">* 업로드 가능 파일 : zip(상품코드.jpg파일만 포함되어야 함.)</small>
								<small class="desc">* 한글파일명 불가</small>
								<small class="desc">* 최대업로드 용량 : 20MB</small>   
							</div>		                    
	                    </div>
	                    
                    </form>
                
                <div class="section-button"><!-- section button -->
                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
                </div>
                <h4 class="title">등록결과</h4>
                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 15%;" />
                            <col style="width: 10%;" />
                            <col style="width: 40%;" />
                            <col style="width: 30%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>파일명</th>
                                <th>상품코드</th>
                                <th>경로</th>
                                <th>등록결과</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty list }">
                   	    	<c:forEach var="row" items="${list }" varStatus="i">
                            	<tr>
			                    	<td><c:out value="${row.seq }"/></td>
			                    	<td><c:out value="${row.filename }"/></td>
		                            <td><c:out value="${row.prdmstcd }"/></td>
		                            <td><c:out value="${row.webpath }"/></td>
		                            <td><c:out value="${row.errorcode}"/></td>
			               		</tr>
                            </c:forEach>
                         </c:if>
                         <c:if test="${empty list}">
	                     <tr>
	                      	<td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
	                     </tr>
                         </c:if>     
                        <EEE/tbody>
                    </table>
                </div><!-- // col list -->
      <footer><!-- footer -->ㄴ
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.form.js"></script>

<script type="text/javascript">
$(document).ready(function () {
    
    
    $(document).on("click", "#goRegist", function () {
    	var obj = $.trim($("#file").val());
    	var pathpoint = obj.lastIndexOf('.');
        var filepoint = obj.substring(pathpoint+1,obj.length);
        var filetype = filepoint.toLowerCase();
         
       
        if (obj == ""){
        	alert("파일을 선택해 주세요.");
        	return false;
        }
       
        if ("zip" != filetype){
        	alert("["+filetype+"] 형식은 업로드 할 수 없습니다.");
        	return false;
        }
        	
       	if (confirm( "저장 하시겠습니까?")) {
       		$("#listGb").val("select");
       		$("#status").text("업로드 중입니다. 잠시만 기다려 주십시오.");
	        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/productImageList.do", "target":"_self", "method":"post"}).submit();
	        $("#listGb").val("");
        }
 
    });
    
});
  
</script>
</body>
</html>