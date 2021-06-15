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

            <div class="container"><!-- container -->

                <h2 class="title"><span>스펙관리</span></h2>

                <h3 class="title"><span>목록</span></h3>
                
                <input type="hidden" name="SPC_MST_ENV" id="SPC_MST_ENV" value="${Code.CATEGORY_TYPE_PC }" />
                <!-- pc/mobile 선택 변경
                <div> 
                    <input type="radio" name="SPC_MST_ENV" id="SPC_MST_ENV_P" onclick="javascript:categoryProductEnv('${Code.CATEGORY_TYPE_PC }');" value="${Code.CATEGORY_TYPE_PC }" /><label for="SPC_MST_ENV_P">pc상품카테고리</label> &nbsp;
                    <input type="radio" name="SPC_MST_ENV" id="SPC_MST_ENV_M" onclick="javascript:categoryProductEnv('${Code.CATEGORY_TYPE_MOBILE }');" value="${Code.CATEGORY_TYPE_MOBILE }" /><label for="SPC_MST_ENV_M">mobile상품카테고리</label>
                </div> -->        
                <div class="clearfix">

                    <!-- https://github.com/jzaefferer/jquery-treeview -->
                    <!-- http://bassistance.de/jquery-plugins/jquery-plugin-treeview/ -->
                    <div style="float: left; width: 20%;">
                        <div style="margin-right: 5px; padding: 10px 20px 10px 10px; border: solid 1px #ccc; min-height: 600px; margin-bottom: 20px;">
                            <a href="javascript:;" id="rootCategory" class="button small primary"><span>스펙관리</span></a>
                            <ul id="browser" class="filetree treeview-famfamfam">
    
                            </ul>
                        </div>
         
                        <p style="float: left;">
                            <a href="javascript:registPopup();" id="categoryAdd" class="button small primary" title="팝업으로 열립니다."><span>하위 스펙추가</span></a>                 
                        </p>  
                    </div>
                
                    <div id="main_con" style="float: right; margin-top: 20px; width: 76%; min-height: 600px;">
                        &nbsp; 
                    </div>   

                </div>  

            </div><!-- // container -->

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

<script src="/am/js/plugins/jquery.cookie.js"></script>
<script src="/am/js/plugins/jquery.treeview.js"></script> <!-- treeview -->
<script src="/am/js/common/jquery.ajax.js"></script>

<script>    
$(function() {
    
    // 구분 pc, mobile
    var SPC_MST_ENV = "<c:out value="${commandMap.SPC_MST_ENV}" />";
    
    if(SPC_MST_ENV == ""){
        PRD_CTG_ENV = "<c:out value="${Code.CATEGORY_TYPE_PC}" />";
    }

    // 스펙 트리 출력
    specTree(SPC_MST_ENV);
    
    // 스펙상세정보 노출 이벤트
    $(document).on("click", ".folder", function(){
        var idx = $(this).data("idx");
        
        // 스펙추가 버튼 상태 변경 이벤트 호출
        setButtonCategoryRegist($(this).data("level"));
        
        $.ajax({
            type : "POST",
            async:true,
            dataType :"html",
            url : '<c:out value="${serverDomain}"/>/am/product/specManagementEdit.do',
            data : {
                   'SPC_MST_IDX' : idx
                   },  
            success : function(data){
                $('#main_con').html(data);  
            }
        });
    });
    
    // 스펙추가 버튼 상태 변경 이벤트, 5레벨은 수정안됨
    setButtonCategoryRegist = function(level){     
        if( level==1 || level==2 || level==3){
            $("#categoryAdd").attr("class","button small primary");
            $("#categoryAdd").attr("href","javascript:registPopup();");
        }
        else{
            $("#categoryAdd").attr("class","button small");
            $("#categoryAdd").attr("href","javascript:alert('3레벨 이상 추가가 불가능합니다.');");
        }
    };
    
    // 스펙 등록 팝업창 호출
    registPopup = function(){
        var $frm = $("#frm");
        var SPC_MST_IDX = $frm.find("input[name='SPC_MST_IDX']").val();
        
        if(SPC_MST_IDX == null || SPC_MST_IDX == undefined){
        	alert("스펙 폴더를 선택해주세요.");
        	$("#browser").focus();
        }else{   
        	popup('',"400","300","no","_registPopup");
            $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/specManagementFormPopup.do", "target":"popup_registPopup", "method":"post"}).submit();
        }
    };
	
    // root스펙관리 생성 버튼 클릭 이벤트
    $(document).on("click", "#rootCategory", function () {
        $.ajax({
            type : "POST",
            async:true,
            dataType :"html",
            url : '<c:out value="${serverDomain}"/>/am/product/specManagementRootEdit.do',
            data : {
                'SPC_MST_IDX'       : -1,
                'SPC_MST_ENV'       : $("#SPC_MST_ENV").val()
            },
            success : function(data){
                $('#main_con').html(data);
            }
        });
    });
}); 

function specTree(SPC_MST_ENV){
    $.postSyncJsonAjax("/am/product/specManagementAjax.do", { SPC_MST_ENV : SPC_MST_ENV }, function(data){
        $("#browser").html(data.categoryList);

        $("#browser").treeview({
            toggle: function(){
                console.log("%s was toggled.", $(this).find(">span").text());
            }
        });
    });
}
</script>

</body>
</html>
