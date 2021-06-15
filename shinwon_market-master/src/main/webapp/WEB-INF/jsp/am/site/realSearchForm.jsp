<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>
</head>
<body class="basic">

	<div id="skipNavigation">
		<!-- skipNavigation -->
		<a href="#contents" class="sr-only">본문으로 바로가기</a>
	</div>
	<!-- // skipNavigation -->

	<header>
		<!-- header -->
		<%@ include file="/WEB-INF/jsp/am/include/top.jsp"%>
	</header>
	<!-- // header -->

	<div id="container" class="st-container">
		<!-- container -->
		<form id="frmMainLayout" name="frmMainLayout" method="post">
			<input type="hidden" id="selectMenuCode" name="selectMenuCode"
				value="<c:out value="${selectMenuCode }" />" />
		</form>

		<aside id="navigation">
			<!-- navigation -->
			<nav>
				<%@ include file="/WEB-INF/jsp/am/include/left.jsp"%>
			</nav>
		</aside>
		<!-- // navigation -->

		<div id="body">
			<!-- body -->

			<section id="contents">
				<!-- contents -->

				<div id="breadcrumb">
					<!-- breadcrumb -->
					<a href="#none"><i class="icon-home em"></i> HOME</a> &gt; <a
						href="#none">시스템 관리</a> &gt; <span>실시간 검색어 관리</span>
				</div>
				<!-- // breadcrumb -->

				<div class="contents-inner">
					<!-- contents-inner -->

					<h3 class="title">실시간 검색어 관리</h3>

                    <div class="title-box">
	                    <h4 class="title">등록/수정</h4>
	                </div>
	
	                <p>
	                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
	                </p>
                    
				    <form id="frm" name="frm">
				    	<input type="hidden" name="realSearchIdxs[]" value=""/>
				    	<input type="hidden" name="realSearchTxts[]" value=""/>
				    	
				        <div class="section-form"><!-- section-form-a -->
		                    <div class="table-a"><!-- col list -->
			                    <table class="core">
			                        <colgroup>
			                            <col style="width: 5%;" />
			                            <col style="width: 8%;" />
			                            <col style="width: auto;" />
			                        </colgroup>
			                        <thead>
			                            <tr>
			                                <th>NO</th>
			                                <th>순서</th>
			                                <th>검색어</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <c:choose>
			                                <c:when test="${not empty list }">			                                    
			                                    <c:forEach var="list" items="${list }" varStatus="i">
			                                        <tr>
						                                <td><c:out value="${list.RNUM }"/></td>
						                                <td><input type="text" name="REL_SCH_IDX" value="${list.REL_SCH_IDX }" /></td>
					                                	<td><input type="text" name="REL_SCH_TXT" class="text long" value="${list.REL_SCH_TXT }"/></td>
						                            </tr>			                                        
			                                    </c:forEach>
			                                </c:when>	
			                                <c:otherwise>
		                                		<c:forEach var="row" begin="1" end="10" varStatus="i">
			                                        <tr>
						                                <td><c:out value="${i.index}"/></td>
						                                <td><input type="text" name="REL_SCH_IDX"/></td>
					                                	<td><input type="text" name="REL_SCH_TXT" class="text long"  /></td>
						                            </tr>			                                        
		                                    	</c:forEach>
			                                </c:otherwise>		                                
			                            </c:choose>
			                        </tbody>
			                    </table>
			                </div><!-- // col list -->
		
		                </div><!-- // section-form-a -->
	                </form>
	                <div class="section-button"><!-- section button -->
	                    <a href="javascript:;" id="goRegist" class="button button-b"><span>저장</span></a>
	                </div><!-- // section button -->    
				</div>
				<!-- // contents-inner -->
			</section>
			<!-- // contents -->

		</div>
		<!-- // body -->
		<footer>
			<!-- footer -->
			<%@ include file="/WEB-INF/jsp/am/include/footer.jsp"%>
		</footer>
		<!-- // footer -->
	</div>
	<!-- // container -->
	
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>

<script type="text/javascript">
	$(document).ready(function() 
	{
		// 등록 이벤트
	    $(document).on("click", "#goRegist", function() 
	    {
	    	var realSearchCheckFlag = true;
	    	
	    	$.each($("input[name^='REL_SCH_IDX']"),function(index,item)
      		{       		 	
      			if($("input[name^='REL_SCH_IDX']").eq(index).val() == "") 
              	{	
	       			alert("[순서] 반드시 선택해 주십시오.");
// 	       			$("input[name^='REL_SCH_IDX']").eq(index).focus();
	       			realSearchCheckFlag= false;
	       			return false;
              	} 
      		});
	    	
	    	$.each($("input[name^='REL_SCH_TXT']"),function(index,item)
       		{       		 	
       			if($("input[name^='REL_SCH_TXT']").eq(index).val() == "") 
               	{	
 	       			alert("[검색어] 반드시 선택해 주십시오.");
//  	       			$("input[name^='REL_SCH_TXT']").eq(index).focus();
 	       			realSearchCheckFlag= false;
 	       			return false;
               	} 
       		});
	    	
	    	if(realSearchCheckFlag)
	    	{
	    		if (confirm("저장 하시겠습니까?")) 
	      		{
	                $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/site/realSearchRegist.do", "target" : "_self", "method" : "post"}).submit();
	            }	
	    	}
      		     	
	    });
	    
	});

</script>
</body>
</html>