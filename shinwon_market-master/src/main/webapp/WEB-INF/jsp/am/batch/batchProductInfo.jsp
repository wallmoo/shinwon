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
                <a href="#none">배치작업관리</a>
                &gt;
                <span>상품마스터</span>
            </div><!-- // breadcrumb -->
            
            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">상품마스터</h3>
                
				<div class="title-box">
					<div class="left">
						<a href="#" id="batchProductInfo" class="button button-b"><span>상품정보 배치작업 실행</span></a>
					</div>
				</div>

                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                        	<col style="width: 5%" />
                            <col style="width: 12%" />
                            <col style="width: 12%" />
                            <col style="width: 10%" />
                            <col style="width: auto;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>실행일시</th>
                                <th>종료일시</th>
                                <th>완료여부</th>
                                <th>시스템메세지</th>
                            </tr>
                        </thead>
                        <tbody class="sort-target">
                        <c:choose>
                        <c:when test="${not empty list }">
                        <c:set var="listNum" value="${paging.listNum}" />
                        <c:forEach var="item" items="${list }" varStatus="status">
                        	<tr>
                        		<td>${listNum }</td>
                            	<td><ui:formatDate value="${item.BCH_MST_ST_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                            	<td><ui:formatDate value="${item.BCH_MST_ED_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                <td>
                                	<c:if test="${item.BCH_MST_STATE eq Code.BATCH_RESULT_START }">실행중</c:if>
                                	<c:if test="${item.BCH_MST_STATE eq Code.BATCH_RESULT_END }">완료</c:if>
                                	<c:if test="${item.BCH_MST_STATE eq Code.BATCH_RESULT_FAIL}">실패</c:if>
                                	(<c:if test="${item.BCH_MST_REQ_ID eq Code.BATCH_USER_SCHEDULED }">자동</c:if>
                                	<c:if test="${item.BCH_MST_REQ_ID ne Code.BATCH_USER_SCHEDULED }">수동</c:if>)
                                </td>
                                <td class="left"><pre>${item.BCH_MST_ERRMSG}</pre></td>
                            </tr>
                        <c:set var="listNum" value="${listNum-1}" />
                        </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5">실행이력이 없습니다.</td>
                            </tr>
                        </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div><!-- // col list -->
                   
                <form id="frm" name="frm">
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
                
					<div class="pagination"><!-- pagination -->
					    <ui:paging paging="${paging }" jsFunction="goPage" />
	                </div><!-- // pagination -->
	
	
					<div class="bbs-status"><!-- bbs status -->
						<div class="page">
							총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
						</div>
						<div class="sort">
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
						</div>
					</div><!-- // bbs status -->
					
                </form>

            </div><!-- // contents-inner -->

        </section><!-- // contents -->

    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script type="text/javascript">
$(document).ready(function () {

	// 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"", "target":"_self", "method":"post"}).submit();
    };
    
	$(document).on("click","#batchProductInfo",function(){
		if( $(this).hasClass('button-b')){
			$(this).removeClass('button-b');
			$(this).addClass('button-a');
			batchProductInfo();
		}else{
			alert('배치가 실행중입니다.');
		}
	});
		
    // 데이터 동기화
    batchProductInfo = function () 
    {
		if (confirm("상품정보 배치작업을 실행하시겠습니까?"))
		{
	        $.ajax({
	            type:"POST",
	            async:true,
	            url:"<c:out value="${serverDomain}"/>/am/batch/batchProductInfoAjax.do",
	            success:function(data)
	            {
	            	alert(data.message);
	                location.reload(true);
	            },
	            error:function(err)
	            {
	                alert("오류가 발생하였습니다.\n[" + err.status + "]");
	                self.reload();
	            }
	        }); 
		}
    };
});
</script>
</body>
</html>