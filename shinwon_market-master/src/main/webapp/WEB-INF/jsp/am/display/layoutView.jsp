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

            <h2 class="title"><span>전시레이아웃관리</span></h2>

            <h3 class="title"><span>목록</span></h3>

            <input type="hidden" name="PRD_CTG_ENV" id="PRD_CTG_ENV" value="P" />
            <br/>
            <div class="clearfix">

                <!-- https://github.com/jzaefferer/jquery-treeview -->
                <!-- http://bassistance.de/jquery-plugins/jquery-plugin-treeview/ -->

            <div style="float: left; margin-right: 5px; padding: 10px 20px 10px 10px; border: solid 1px #ccc;">
                <ul id="browser" class="filetree treeview-famfamfam treeview">
                    <li class="closed collapsable">
                        <div class="hitarea closed-hitarea collapsable-hitarea"></div>
                        <span class="folder">STORE</span>
                    </li>
                </ul>
            </div>

            <div id="main_con" style="float: left; padding: 10px;"><div class="contents-inner"><!-- contents-inner -->

                <h3 class="title"><span>STORE</span></h3>
                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="text-left">*상단 배너는 고정이며, 사용여부 및 순서 변경 불가합니다.</div>
                    <div class="text-right">
                        <a href="javascript:;" class="button small primary" id="goRegist"><span>저장</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->
                
                	<table class="table-col table-b">
	                    <colgroup>
	                        <col style="width: 7%;">
	                        <col style="width: auto;">
	                        <col style="width: 20%;">
	                        <col style="width: 10%;">
	                    </colgroup>
	                    <thead>
	                        <tr>
	                            <th>NO</th>
	                            <th>영역명</th>
	                            <th>사용여부</th>
	                            <th>전시순서</th>
	                        </tr>
	                    </thead>
	                    <tbody class="sort-target">
		                    <c:forEach var="menu" items="${list }" varStatus="i" >
						        <tr>
			                        <td>${menu.RNUM} <input type="hidden"  name="STR_LAY_IDX" VALUE='${menu.STR_LAY_IDX }'> </td>
			                        <td class="str_lay_nm">${menu.STR_LAY_NM}</td>
			                        <td>
			                            <input type="radio" class="radio" value="Y" name="${menu.STR_LAY_IDX }" <ui:select v="${menu.STR_LAY_USE_YN }" t="Y" g="checked"/>><label>사용</label>
			                            <input type="radio" class="radio" value="N" name="${menu.STR_LAY_IDX }" <ui:select v="${menu.STR_LAY_USE_YN }" t="N" g="checked"/>><label>미사용</label>
			                        </td>
			                        <td>
			                            <a href="#none" class="row-sort" data-sort_type="up">△ </a>
			                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
			                        </td>
			                    </tr>
						    </c:forEach>
	                    </tbody>
                	</table>
                <form id="frm">
                	<input type="hidden" id="menuList" name="menuList">
                </form>
                </div><!-- // contents-inner -->
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
<script>
$(function(){

	$(document).on("click", "#goRegist", function(){
		var menuList = [];
		
		var sort = 1;
		$(".sort-target tr").each(function(index, item){
			 
			var menu = {
				STR_LAY_IDX :  $("input[name='STR_LAY_IDX']", $(this)).val() ,
				STR_LAY_NM : $(".str_lay_nm", $(this)).text(),
				STR_LAY_SRT : sort++,
				STR_LAY_USE_YN : $("input[type='radio']:checked", $(this)).val()
			};
			menuList.push(menu);
		});
		$("#menuList").val(JSON.stringify(menuList));
		
		var $frm = $("#frm");
		if(confirm("저장 하시겠습니까?"))
       	{
       		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/display/layoutModify.do", "target":"_self", "method":"post"}).submit();
       	}
	});
	
	// 공통코드 순서 변경 이벤트
  	$(document).off("click", ".row-sort");
    $(document).on("click", ".row-sort", function () {
        
        var $this = $(this);
        var $tr = $this.parent().parent();
        var type = $this.data("sort_type");
        
        if(type == "up")
        {
            var $prevTr = $tr.prev(); 
            if($prevTr.length > 0)
            {
                var $trClone = $tr.clone();
                $prevTr.before($trClone);
                $tr.remove();    
            }
            else
            {
                alert("최 상위 순서 입니다.");
                return;
            } 
        }
        else
        {
            var $nextTr = $tr.next();
            if($nextTr.length > 0)
            {
                var $trClone = $tr.clone();
                $tr.next().after($trClone);
                $tr.remove();
            }
            else
            {
                alert("최 하위 순서 입니다.");
                return;
            }
        }
    });
    
});
//-->
</script>

</body>
</html>
