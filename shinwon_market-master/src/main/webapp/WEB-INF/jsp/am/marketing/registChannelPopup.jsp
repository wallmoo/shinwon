<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>대표채널등록</span></h3>
            </div><!-- // push-guide -->
            
            <p> <i class="require"><em>필수입력</em></i>필수입력정보</p>
            
            <form name="frm" id="frm" >
                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
					<colgroup>
						<col style="width: 24%;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th><span>채널구분 <i class="require"><em>필수입력</em></i></span></th>
							<td>
								<select class="select" id="CHN_MST_UP_IDX" name="CHN_MST_UP_IDX" title="포인트 구분">
									<option value="">선택</option>
		 							<option value="1" <ui:select v="1" t="${commandMap.CHN_MST_IDX}" g="selected"/>>제휴채널</option> 
		 						 	<option value="2" <ui:select v="2" t="${commandMap.CHN_MST_IDX}" g="selected"/>>가격비교채널</option>
		 						 	<option value="4" <ui:select v="4" t="${commandMap.CHN_MST_IDX}" g="selected"/>>광고채널</option>
							    </select>
							    <input type="hidden" name="CHN_MST_LEVEL" id="CHN_MST_LEVEL" value="3"/>
							</td>
						</tr>
						<tr><!-- row -->
							<th><span>대표채널명  <i class="require"><em>필수입력</em></i></span></th>
							<td>
								<input type="text" name="CHN_MST_NM" id="CHN_MST_NM" class="text large" maxlength="20"/>
							</td>
						</tr>
						
						<tr>
							<th><span>대표채널코드</span></th>
							<td>
								시스템 자동부여
							</td>
						</tr>
						
					</tbody>
				</table><!-- // table -->
            </form>
            
	        <div class="grid section-button-search"><!-- section button -->
	        	<a href="#none" id="goEdit" class="button small primary"><span>저장</span></a>
			</div>
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>

<script type="text/javascript">
$(document).ready(function () {
    $("#excelForm").validate({
        rules : {
            file:{required:true}
        }
    });
    
    $(document).on("click", "#goEdit", function () {
     
    	if($("#CHN_MST_UP_IDX").val() == "")
    	{
    		alert("[채널구분] 반드시 선택해 주십시오.");
            $("#CHN_MST_UP_IDX").focus();
            return;	
    	}
    	
    	if($("#CHN_MST_NM").val() == "")
    	{
    		alert("[대표채널명] 반드시 선택해 주십시오.");
            $("#CHN_MST_NM").focus();
            return;	
    	}
    	
    	if (confirm("저장 하시겠습니까?")) 
      	{
        	//$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/channelMstRegist.do", "target" : "_self", "method" : "post"}).submit();
        	regAjax($("#CHN_MST_UP_IDX").val(), $("#CHN_MST_NM").val())
        	
        }	
    });
    
    function regAjax( CHN_MST_UP_IDX,CHN_MST_NM  ) {
        $.ajax({
            type : "POST",
            async:true,
            cache: false,
            dataType :"json",
            url : "<c:out value="${serverDomain}"/>/am/marketing/channelMstRegist.do",
            data : {
                'CHN_MST_UP_IDX'       : CHN_MST_UP_IDX,
                'CHN_MST_NM'       : CHN_MST_NM
            },  
            success : fnResult,
            error : function(err){alert("error : " + err.status );}
        });
    }
    
    function fnResult(data) {
    	
    	alert("등록되었습니다.");
    	if(	window.opener.goRefresh() )self.close();
    	
    }
        
});
</script>
</body>
</html>