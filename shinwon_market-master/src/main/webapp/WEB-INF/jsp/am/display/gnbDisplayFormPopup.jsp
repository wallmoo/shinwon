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
            
            <h3 class="title"><span>GNB 추가</span></h3>
            <c:if test="${gnbDisplayView.DSP_GNB_LEVEL ne 3}" >
                <form id="frm" name="frm" method="post" action="">
                    <input type="hidden" id="DSP_GNB_IDX"    name="DSP_GNB_IDX"    value="${gnbDisplayView.DSP_GNB_IDX}" />
                    <input type="hidden" id="DSP_GNB_UP_IDX" name="DSP_GNB_UP_IDX" value="${gnbDisplayView.DSP_GNB_UP_IDX}" />
                    <input type="hidden" id="DSP_GNB_TOP_IDX" name="DSP_GNB_TOP_IDX" value="${gnbDisplayView.DSP_GNB_TOP_IDX}" />
                    <input type="hidden" id="DSP_GNB_LEVEL"  name="DSP_GNB_LEVEL"  value="${gnbDisplayView.DSP_GNB_LEVEL}" />
                    <input type="hidden" id="DSP_GNB_SORT"   name="DSP_GNB_SORT"   value="${gnbDisplayView.DSP_GNB_SORT}" />
                    <input type="hidden" id="DSP_GNB_ENV"   name="DSP_GNB_ENV"   value="${gnbDisplayView.DSP_GNB_ENV}" />

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 95%;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>${gnbDisplayView.DSP_GNB_LVL_NM} >  </td>
                            </tr>
                            <tr>
                                <td><input type="text" id="CHILD_CODENAME" name="CHILD_CODENAME" class="text" placeholder="GNB명을 입력하세요."/></td>
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
    <c:if test="${gnbDisplayView.DSP_GNB_LEVEL eq 3}" >
    alert("하위 GNB는 3레벨 까지만 생성 가능합니다.");
    self.close();
    </c:if>

    //상품GNB 저장 처리
    $(document).on("click", "#goRegist", function(){

    	//GNB명은 2자이상
    	if( $("#CHILD_CODENAME").val().length < 2 ){
    		alert("추가하실 GNB명을 2글자이상 입력하시기 바랍니다.");
    		return;
    	}
    	
        //하위코드 입력시
        if ( confirm( "저장하시겠습니까?" ) ) 
        {            	
        	if( $("#DSP_GNB_TOP_IDX").val() == '-1' )
            {
            	//최상위 GNB가 -1인경우 생성되는 하위GNB의 최상위 GNB는 현재 GNB
                $("#DSP_GNB_TOP_IDX").val($("#DSP_GNB_IDX").val());
            }
            
            var params = {"CHILD_CODENAME":$("#CHILD_CODENAME").val(), 
			            	"DSP_GNB_LEVEL":$("#DSP_GNB_LEVEL").val(), 
			            	"DSP_GNB_IDX":$("#DSP_GNB_IDX").val(), 
			            	"DSP_GNB_TOP_IDX":$("#DSP_GNB_TOP_IDX").val(), 
			            	"DSP_GNB_USE_YN":"Y",
			            	"DSP_GNB_DSP_YN":"Y",
			            	"DSP_GNB_ENV":$("#DSP_GNB_ENV").val()
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
