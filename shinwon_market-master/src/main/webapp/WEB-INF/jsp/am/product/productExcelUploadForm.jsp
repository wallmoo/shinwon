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
				<a href="#none">상품일괄등록</a>
				&gt;
				<span>상품일괄등록</span>
			</div><!-- // breadcrumb -->

			<div class="contents-inner"><!-- contents-inner -->

				<h3 class="title">상품일괄등록</h3>
				
				<div class="section-form"><!-- section-form-a -->
		            <form name="excelForm" id="excelForm" enctype="multipart/form-data">
			            <div class="form-group">
			                <label class="label"><span>파일</span></label>
			                <div class="field">
			                    <input type="file" name="file" id="file" class="file" />
			                    <br/><strong class="strong">*</strong> xls 확장자 파일만 가능합니다. 
			                    <br/><i class="icon-file"></i>&nbsp;<a href="javascript:;" class="sampleDownload" data-file_name="productExcelSample.xls">샘플파일 다운로드</a>
			                </div>
			            </div>
		            </form>
		        </div><!-- // section-form-a -->
		        
		        <div class="section-button"><!-- section button -->
		            <a href="#none" id="goEdit" class="button button-b"><span>등록</span></a>
		        </div><!-- // section button -->
		        
		        <div id="failedPrdMstCdListDiv">
		        </div>
		        
		        <div id="failedImgListDiv">
		        </div>
		        
		        <div id="errMsgDiv">
		        </div>
		        
		        <h4 class="title">작업내역</h4>
		        
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
                
                <form id="pageFrm" name="pageFrm">
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
		        
		        <c:if test="${not empty commandMap.failedPrdMstCdList }">
			        <div class="section-form"><!-- section-form-a -->
			        	<div class="form-group">
			                <label class="label"><span>존재하지 않는<br/>상품코드</span></label>
			                <div class="field">
			                	${commandMap.failedPrdMstCdList}
			                </div>
			            </div>
			        </div>
		        </c:if>
		        
		        <c:if test="${not empty commandMap.failedImgList }">
			        <div class="section-form"><!-- section-form-a -->
			        	<div class="form-group">
			                <label class="label"><span>잘못된<br/>이미지 경로</span></label>
			                <div class="field">
			                	${commandMap.failedImgList}
			                </div>
			            </div>
			        </div>
		        </c:if>

			</div><!-- // contents-inner -->

		</section><!-- // contents -->

	</div><!-- // body -->
	
	<!-- 파일 다운로드용 폼 -->
    <form name="fileForm" id="fileForm">
         <input type="hidden" name="fileName" value="" />
    </form>

    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->

</div><!-- // container -->


<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.blockUI.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.form.js"></script>


<script type="text/javascript">
$(document).ready(function () {
	
	// 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#pageFrm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"", "target":"_self", "method":"post"}).submit();
    };
    
	var options = {         			        
			beforeSubmit:showRequest,	// pre-submit callback         
			success:showResponse,	// post-submit callback 
			dataType:'json'
		}; 	
	$("#goEdit").click(function(){
		var $frm = $("#excelForm");	
		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/checkBeforeProductExcelUploadAjax.do", "target":"_self", "method":"post"});
		$frm.ajaxSubmit(options);
		return false;
	});
    
    // 파일 다운로드
    $(document).on("click", ".sampleDownload", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='fileName']").val($this.data("file_name"));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/sampleFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
});


function showRequest(formData, jqForm, options){
	var $frm = $("#excelForm");
	// 확장자 체크
	var obj = $.trim($("#file").val());
 
    if (obj == ""){
    	alert("파일을 선택해 주세요.");
    	return false;
    }
    var value = $frm.find("#file").val();
    var ext = value.slice(value.indexOf(".") + 1).toLowerCase();
    if("xls" != ext)
    {
        alert(".xls 파일만 업로드 가능합니다.\n파일확장자를 확인해 주십시오.");
        return false;
    }
    return true;
}

function showResponse(data, statusText, xhr, $form){
	if (statusText == "success"){
		if(data.failedPrdMstCount > 0|| data.failedImgCount > 0){
			alert(data.resultMsg);
			$("#failedPrdMstCdListDiv").html(data.failedPrdMstCdList);
			$("#failedImgListDiv").html(data.failedImgList);
		}else{
			alert("상품코드/이미지 이상 없음. 업로드를 시작합니다.");
			
			var options = {         			        
					beforeSubmit:showRequest2,	// pre-submit callback         
					success:showResponse2,	// post-submit callback 
					dataType:'json'
				}; 	
			
			var $frm = $("#excelForm");	
			$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/productExcelUploadProc.do", "target":"_self", "method":"post"});
			$frm.ajaxSubmit(options);   
		}
	}
}


function showRequest2(formData, jqForm, options){
    return true;
}

function showResponse2(data, statusText, xhr, $form){
	if (statusText == "success"){
		if(data.errMsg != ""){
			$("#errMsgDiv").html("<pre>"+data.errMsg+"</pre>");
		}
		alert(data.message);
	}else{
		alert("오류가 발생했습니다.");
	}
}
</script>


<!-- <script type="text/javascript">
$(document).ready(function () {
    $("#excelForm").validate({
        rules : {
            file:{required:true}
        }
    });
    
    $(document).on("click", "#goEdit", function () {
        var $frm = $("#excelForm");
        if($frm.valid())
        {
            var value = $frm.find("#file").val();
            var ext = value.slice(value.indexOf(".") + 1).toLowerCase();
            if("xls" != ext)
            {
                alert(".xls 파일만 업로드 가능합니다.\n파일확장자를 확인해 주십시오.");
                return;
            }
            else
			{
            	if(confirm("등록하시겠습니까?")){
            		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/checkBeforeProductExcelUploadAjax.do", "target":"_self", "method":"post"});
            		$frm.ajaxForm({
            			beforeSubmit : function (data, frm, opt){
            				//alert("before");
            				return true;
            			},
            			success : function(data){
            				if(data.isSuccessYn == "Y"){
	            				if(data.failedPrdMstCount > 0|| data.failedImgCount > 0){
		            				alert(data.resultMsg);
		            				$("#failedPrdMstCdListDiv").html(data.failedPrdMstCdList);
		            				$("#failedImgListDiv").html(data.failedImgList);
	            				}else{
	            					alert("상품코드/이미지 이상 없음. 업로드를 시작합니다.");
	            					$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/productExcelUploadProc.do", "target":"iframe_test", "method":"post"}).submit();
	            				}
            				}else{
            					alert(data.resultMsg);
            				}
            			}
            			/* error: function(){
            				alert("에러가 발생했습니다!!!!!");
            			} */
            		}).submit();
            		
            		//$frm.attr({"action":"<c:out value="${serverDomain}" />/am/product/productExcelUploadProc.do", "target":"iframe_test", "method":"post"}).submit();
                	/* $.blockUI({ 
                		message: "등록중입니다...",   
                		css: {            		
    	                    border: 'none', 
    	                    padding: '15px', 
    	                    backgroundColor: '#000', 
    	                    '-webkit-border-radius': '10px', 
    	                    '-moz-border-radius': '10px', 
    	                    opacity: .5, 
    	                    color: '#fff' 
                    	} 
                	}); */
            	}
			}	
        }
    });
    
    // 파일 다운로드
    $(document).on("click", ".sampleDownload", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='fileName']").val($this.data("file_name"));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/sampleFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
});
</script> -->
</body>
</html>