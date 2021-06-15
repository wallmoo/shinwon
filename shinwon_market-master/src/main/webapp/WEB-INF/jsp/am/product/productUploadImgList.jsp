<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

            <div class="container">

                <h2 class="title"><span>일괄업로드</span></h2>

                <div class="push-guide instant"><!-- push-guide -->
                    <i class="icon"><!-- icon --></i>
                    <h3 class="title"><span>등록</span></h3>
                </div><!-- // push-guide -->
				
				<form id="frm" name="frm" method="post" enctype="multipart/form-data">
	                <table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%; min-width: 180px;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                        <tr><!-- row -->
	                            <th><span>구분</span></th>
	                            <td>
	                                <input type="radio" name="UPLOAD_GB" id="stateA" class="radio" value="Y"/>
			                        <label for="stateA">상품+이미지</label>
			                        <input type="radio" name="UPLOAD_GB" id="stateB" class="radio" value="N"  checked="checked"/>
			                        <label for="stateB">이미지</label>
	                            </td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>엑셀파일</span></th>
	                            <td>
	                                <input type="file" name="file" id="file" class="file" style="width:500px" />
		                    		<small class="desc">* 업로드 가능 파일 : xls</small>
									<small class="desc">* 한글파일명 불가</small>
									<small class="desc">* 최대업로드 상품수 : 1000개</small>   
	                            </td>
	                        </tr>
	                        <tr><!-- row -->
	                            <th><span>이미지파일</span></th>
	                            <td>
	                                <input type="file" name="file2" id="file2" class="file" style="width:500px" />
		                    		<small class="desc">* 업로드 가능 파일 : zip(상품코드.jpg파일만 포함되어야 함.)</small>
									<small class="desc">* 한글파일명 불가</small>
									<small class="desc">* 최대업로드 용량 : 20MB</small>   
	                            </td>
	                        </tr>
	                    </tbody>
	                </table><!-- // table -->
	            </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                    	<a href="#none" id="goRegist" class="button large"><span>저장</span></a>
                    </div>
                </div><!-- // section-button -->
                
                <div class="push-guide instant"><!-- push-guide -->
                    <i class="icon"><!-- icon --></i>
                    <h3 class="title"><span>등록결과</span></h3>
                </div><!-- // push-guide -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
	                <colgroup>
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
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
		                      	<td colspan=5>${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
		                     </tr>
                         </c:if>     
	                </tbody>
                </table><!-- // table -->

            </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
$(function(){
	$(document).on("click", "#stateA", function () {
		
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/productUploadList.do", "target":"_self", "method":"post"}).submit();
	});
	$(document).on("click", "#stateB", function () {
		
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/productUploadImgList.do", "target":"_self", "method":"post"}).submit();
	});
    
    
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
	        $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/productUploadImgList.do", "target":"_self", "method":"post"}).submit();
	        $("#listGb").val("");
        }
 
    });
    
});
//-->
</script>

</body>
</html>
