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
            
            
            		<table class="table-row table-a">
						<colgroup>
							<col style="width:100%;">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<div class="ui_img_view_wrap type_a" <c:if test="${BND_MST_LAY_TPY ne 'A'}" > style="display:none;"</c:if>>
										<ul class="ui_img_view_list">
											<li><img src="/am/img/admin/A_PC.png" alt="A타입 PC 셀러룸 이미지"></li>
											<li><img src="/am/img/admin/A_MO.png" alt="A타입 MOBILE 셀러룸 이미지"></li>
										</ul>
									</div>
									<div class="ui_img_view_wrap type_b" <c:if test="${BND_MST_LAY_TPY ne 'B'}" > style="display:none;"</c:if>>
										<ul class="ui_img_view_list">
											<li><img src="/am/img/admin/B_PC.png" alt="B타입 PC 셀러룸 이미지"></li>
											<li><img src="/am/img/admin/B_MO.png" alt="B타입 MOBILE 셀러룸 이미지"></li>
										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					
            </div><!-- //modal-inner -->
        
        </div><!-- //modal-wrapper -->
        
    </div><!-- //modal -->

<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(function(){
});
</script>
</body>
</html>
