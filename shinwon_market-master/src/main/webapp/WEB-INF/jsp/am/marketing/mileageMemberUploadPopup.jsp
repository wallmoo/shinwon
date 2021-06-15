<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
    <h1 class="title">파일찾기</h1>
    <a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container"><!-- container -->

    <div id="contents"><!-- contents -->

        <p>업로드할 파일을 등록해 주세요.</p>

        <div class="section-form"><!-- section-form-a -->
            <form name="excelForm" id="excelForm" enctype="multipart/form-data">
                <div class="form-group">
	                <label class="label"><span>파일</span></label>
	                <div class="field">
	                    <input type="file" name="file" id="file" class="file" />
	                </div>
	            </div>
            </form>
        </div><!-- // section-form-a -->
        
        <a href="javascript:;" class="sampleDownload" data-file_name="pointUploadSample.xls">샘플파일 다운로드</a>

        <div class="section-button"><!-- section button -->
            <a href="#none" id="goEdit" class="button button-b"><span>등록</span></a>
        </div><!-- // section button -->
        
		<!-- 파일 다운로드용 폼 -->
	    <form name="fileForm" id="fileForm">
	         <input type="hidden" name="fileName" value="" />
	    </form>        

    </div><!-- // contents -->

</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>

<script type="text/javascript">
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
            	
            	var data = new FormData();
                $.each($('#file')[0].files, function(i, file) {          
                    data.append('file', file);
                });
				$.ajax
                ({
                    async : false,
                    type : "POST",
                    data : data,
                    processData: false,
                    contentType: false,
                    url : "<c:out value="${serverDomain}" />/am/marketing/mileageMemberUploadAjax.do",
                    success : function (data) 
                    { 
                        alert("업로드 되었습니다.");
                        var params = new Array();
                        var obj;
                        if(data.list.length > 0){
                        	
                        	$.each(data.list, function(index,item)
                    		{
                            	var id = item.MEM_MST_MEM_ID;
                            	var erp_id = item.MEM_MST_ERP_ID;
                                var name = item.MEM_MST_MEM_NM;
                                
                                obj = new Object();
                         		obj.MEM_MST_MEM_ID = id;
                         		obj.MEM_MST_ERP_ID = erp_id;
                         		obj.MEM_MST_MEM_NM = name;    
                                 
                         		params.push(obj);
                            });
                        	
                        	if(	window.opener.fnResultMember(params) )    	
                        		self.close();
                        }
                        
                    },
                    error : function (err)
                    {
                        alert("오류가 발생하였습니다.\n[" + err.status + "]");
                    }
                });
            	
            	
                //$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/pointMemberUpload.do", "target":"_self", "method":"post"}).submit();
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
</script>
</body>
</html>