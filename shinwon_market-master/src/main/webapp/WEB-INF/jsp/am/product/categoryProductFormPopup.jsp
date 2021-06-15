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
            
            <h3 class="title"><span>카테고리 추가</span></h3>
            <c:if test="${categoryProductView.PRD_CTG_LEVEL ne 3}" >
                <form id="frm" name="frm" method="post" action="">
                    <input type="hidden" id="PRD_CTG_IDX"    name="PRD_CTG_IDX"    value="${categoryProductView.PRD_CTG_IDX}" />
                    <input type="hidden" id="PRD_CTG_UP_IDX" name="PRD_CTG_UP_IDX" value="${categoryProductView.PRD_CTG_UP_IDX}" />
                    <input type="hidden" id="PRD_CTG_TOP_IDX" name="PRD_CTG_TOP_IDX" value="${categoryProductView.PRD_CTG_TOP_IDX}" />
                    <input type="hidden" id="PRD_CTG_LEVEL"  name="PRD_CTG_LEVEL"  value="${categoryProductView.PRD_CTG_LEVEL}" />
                    <input type="hidden" id="PRD_CTG_SORT"   name="PRD_CTG_SORT"   value="${categoryProductView.PRD_CTG_SORT}" />
                    <input type="hidden" id="PRD_CTG_ENV"   name="PRD_CTG_ENV"   value="${categoryProductView.PRD_CTG_ENV}" />

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 95%;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>${categoryProductView.PRD_CTG_LVL_NM} >  </td>
                            </tr>
                            <tr>
                                <td><input type="text" id="CHILD_CODENAME" name="CHILD_CODENAME" class="text" placeholder="카테고리명을 입력하세요."/></td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                    <div class="text-right">
                        <a href="javascript:;" id="goRegist" class="button"><span>저장</span></a>
                    </div>
			
                </form>
            </c:if>
            </div><!-- //modal-inner -->
        
        </div><!-- //modal-wrapper -->
        
    </div><!-- //modal -->

<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(function(){
    <c:if test="${categoryProductView.PRD_CTG_LEVEL eq 3}" >
    alert("하위 카테고리는 3레벨 까지만 생성 가능합니다.");
    self.close();
    </c:if>

    //상품카테고리 저장 처리
    $(document).on("click", "#goRegist", function(){

    	//카테고리명은 2자이상
    	if( $("#CHILD_CODENAME").val().length < 2 ){
    		alert("추가하실 카테고리명을 2글자이상 입력하시기 바랍니다.");
    		return;
    	}
    	
        //하위코드 입력시
        if ( confirm( "저장하시겠습니까?" ) ) 
        {            	
        	if( $("#PRD_CTG_TOP_IDX").val() == '-1' )
            {
            	//최상위 카테고리가 -1인경우 생성되는 하위카테고리의 최상위 카테고리는 현재 카테고리
                $("#PRD_CTG_TOP_IDX").val($("#PRD_CTG_IDX").val());
            }
            
            var params = {"CHILD_CODENAME":$("#CHILD_CODENAME").val(), 
			            	"PRD_CTG_LEVEL":$("#PRD_CTG_LEVEL").val(), 
			            	"PRD_CTG_IDX":$("#PRD_CTG_IDX").val(), 
			            	"PRD_CTG_TOP_IDX":$("#PRD_CTG_TOP_IDX").val(), 
			            	"PRD_CTG_USE_YN":"Y",
			            	"PRD_CTG_DSP_YN":"Y",
			            	"PRD_CTG_ENV":$("#PRD_CTG_ENV").val()
			            	};
            window.opener.goRegist(params);
            
            self.close();

        } 
        else 
        {
            return;
        }
    });
});
</script>
</body>
</html>
