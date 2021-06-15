<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

    <div class="modal"><!-- modal -->
    
        <div class="modal-wrapper"><!-- modal-wrapper -->
        
            <div class="modal-inner"><!-- modal-inner -->
            
            <h3 class="title"><span>상품 이미지 등록</span></h3>
            
                <form id="frm" name="frm" enctype="multipart/form-data" method="post" action="">
                    <input type="hidden" id="pathType" name="pathType" value="product"/>
					<input type="hidden" id="Allow" name="Allow" value="image"/>
					<input type="hidden" id="callFunction" name="callFunction" value="resultExec"/>
					<input type="hidden" id="callMsg" name="callMsg" value=""/>
					<input type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="<c:out value="${param.PRD_MST_CD}"/>"/>
					<input type="hidden" id="PRD_MST_BRAND_CD" name="PRD_MST_BRAND_CD" value="<c:out value="${commandMap.PRD_MST_BRAND_CD}"/>"/>
					<input type="hidden" id="fileObj" name="fileObj" value="<c:out value="${param.PRD_FILE_NAME}"/>_<c:out value="${param.product_image_env}"/>"/>
					<input type="hidden" id="makeThumbnail" name="makeThumbnail" value="Y"/>

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                        	<col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                            	<th>이미지 선택</th>
                                <td><input type="file" id="upload" name="upload" class="txt" value="" style="width: 230px;"/></td>
                            </tr>
                            <tr>
                            	<th>이미지 설명</th>
                                <td>
                                	<textarea class="textarea" id="alt_text" name="alt_text" style="width:100%; height:50px" maxlength="100"><c:out value="${commandMap.product_image_alt_text}"/></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                    <div class="text-right">
                        <a href="#none" id="fileSubmit" class="button button-b"><span>등록</span></a>
                    </div>
			
                </form>
                
            </div><!-- //modal-inner -->
        
        </div><!-- //modal-wrapper -->
        
    </div><!-- //modal -->

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common/jquery.form.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var options = {         			        
			beforeSubmit:showRequest,	// pre-submit callback         
			success:showResponse,	// post-submit callback 
			dataType:'json'
		}; 	
	$("#fileSubmit").click(function(){
		$("#frm").attr("action", "/am/product/upload/basicProductImageSubmitJson.do");
		$("#frm").ajaxSubmit(options);
		return false;
	});
});

function showRequest(formData, jqForm, options){
	// 확장자 체크
	var obj = $.trim($("#upload").val());
	var pathpoint = obj.lastIndexOf('.');
    var filepoint = obj.substring(pathpoint+1,obj.length);
    var filetype = filepoint.toLowerCase();
    var arrFileExtValidText = $.trim($("#fileExtValidText").val()).split(",");
    var arrFileAllowValidText = $.trim($("#fileAllowValidText").val()).split(",");
 
    if (obj == ""){
    	alert("파일을 선택해 주세요.");
    	return false;
    }
    /* if( $("#alt_text").val().length < 4 ){
    	alert("상품사진에 대한 설명을 입력해 주세요.");
    	return false;
    } */
   
    if (arrFileExtValidText.length > 1){
    	for(var i=0;i<arrFileExtValidText.length;i++){
    		var item = arrFileExtValidText[i].toLowerCase();
    		if (item == filetype){
    			alert("["+filetype+"] 형식은 업로드 할 수 없습니다.");
    			return false;
    		}
    	}
    }
    var allowFlag = "N";
    if (arrFileAllowValidText.length > 1){
    	for(var i=0;i<arrFileAllowValidText.length;i++){
    		var item = arrFileAllowValidText[i].toLowerCase();
    		if (item == filetype){
    			allowFlag = "Y";
    		}
    	}
    }
    if (arrFileAllowValidText.length > 1 && allowFlag == "N"){
    	alert("["+ $.trim($("#fileAllowValidText").val()) +"] 형식의 확장자만 업로드 해주세요.");
    	return false;
    }
    return true;
}
function showResponse(responseText, statusText, xhr, $form){
	
	if (statusText == "success"){
		var callFunction = $.trim($("#callFunction").val());
		var callMsg = $.trim($("#callMsg").val());
		if (callMsg != ""){
			alert(callMsg);
		}
		
		if (callFunction != ""){
			var func = eval("opener."+callFunction);
			callBackFunction(callback, responseText, func);
		}
		self.close();
	}
}
function callback(data, func) {
    func.call(this, data);
} 
function callBackFunction(func) { 
    this.called = 'you';
    if (func.apply == Function.prototype.apply) {
        arguments.shift = Array.prototype.shift;
        arguments.shift().apply(this, arguments);
    } 
} 
</script>
</body>
</html>
