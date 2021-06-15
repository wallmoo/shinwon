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

                <h2 class="title"><span>채널관리</span></h2>

                <h3 class="title"><span>목록</span></h3>
				
                <div class="clearfix">

                    <!-- https://github.com/jzaefferer/jquery-treeview -->
                    <!-- http://bassistance.de/jquery-plugins/jquery-plugin-treeview/ -->

					<input type="hidden" name="PRD_CTG_ENV" id="PRD_CTG_ENV" value="" />
                	<input type="hidden" name="CHN_MST_IDX" id="CHN_MST_IDX" value="" />
                	<div style="float:left; width: 20%;">
	                    <div style="margin-right: 5px; padding: 10px 20px 10px 10px; border: solid 1px #ccc; min-height: 600px; margin-bottom: 20px;">
	                        <ul id="browser" class="filetree treeview-famfamfam">
						
	                        </ul>
	                    </div>
	                    <p>
		                     <a href="javascript:goRegist()" id="goRegist" class="button primary"><span>대표채널등록</span></a>
		                </p>
	                </div>

                    <div id="main_con" style="float: right; margin-top: 20px; width: 76%; min-height: 600px;">
                    	&nbsp; 
                    </div>

                </div>
                
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

<script src="/am/js/plugins/jquery.cookie.js"></script> <!-- treeview -->
<script src="/am/js/plugins/jquery.treeview.js"></script> <!-- treeview -->
<script src="/am/js/common/jquery.ajax.js"></script>
<script>
$(function() {

    // 카테고리 구분 pc, mobile
    var PRD_CTG_ENV = "${commandMap.PRD_CTG_ENV}";
    
    if(PRD_CTG_ENV == ""){
        PRD_CTG_ENV = "<c:out value="${Code.CATEGORY_TYPE_PC}" />";
    }
    
    // 상품 카테고리 조회
    categoryProductList(PRD_CTG_ENV);
    
    $(document).on("click", ".folder", function(){
        var idx = $(this).data("idx");
        $("#CHN_MST_IDX").val(idx);
        var searchGubun = $('input:radio[name=searchGubun]:checked').val();
        $.ajax({
            type : "POST",
            async:true,
            dataType :"html",
            url : '<c:out value="${serverDomain}"/>/am/marketing/channelList.do',
            data : {
                   'CHN_MST_IDX' : idx,
                   'searchGubun' : searchGubun
                   },  
            success : function(data){
                $('#main_con').html(data);  
            }
        });
    });
});

function goListPop(CHN_MST_IDX){
	categoryProductList(CHN_MST_IDX);
	return true;
}

function goRegist(){
	var CHN_MST_IDX = $("#CHN_MST_IDX").val();
	
    popup("<c:out value="${serverDomain}" />/am/marketing/registChannelPopup.do?CHN_MST_IDX="+CHN_MST_IDX, "600", "400", "yes", "registChannelPopup");
    
}
function goRefresh(){
	//authTree("");
	categoryProductList("<c:out value="${Code.CATEGORY_TYPE_PC}" />");
	return true;
}

function categoryProductList(PRD_CTG_ENV){
    $.postSyncJsonAjax("/am/marketing/channelAjax.do", { BANNER_DISPLAY_ENV : PRD_CTG_ENV }, function(data){
        $("#browser").html(data.themeBannerList);
        $("#browser").treeview({
            toggle: function(){
                console.log("%s was toggled.", $(this).find(">span").text());
            }
        });
    });
}
//-->
</script>

</body>
</html>
