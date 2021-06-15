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
            <h2 class="title"><span>태그 관리</span></h2>

            <input type="hidden" id="test" value='${TAG_LIST}'/>
            <table class="table-row table-a"><!-- table -->
                <colgroup>
                    <col style="width: 15%; min-width: 180px;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th><span>등록태그<i class="require"><em>필수입력</em></i> <br /><span id="tagCount">(<c:out value="${TAG_LIST.size()}"/>)</span></span></th>
                        <td>
                            <ul id="tagData" class="tag_list">
                                <c:if test="${not empty TAG_LIST}">
	                                <c:forEach var="row" items="${TAG_LIST }" varStatus="i">
	                                	<li id="<c:out value="${row.TAG_MST_ID}"/>" data-title="<c:out value="${row.TAG_MST_TITLE }"/>"><c:out value="${row.TAG_MST_TITLE }"/>
	                                    	<button class="btn_del" >X</button>
	                                    </li>
	                                </c:forEach>
                                </c:if>
                            </ul>
                        </td>
                    </tr>
                    <tr><!-- row -->
                        <th><span class="in_block">태그</span>
                        </th>
                        <td>
                            <div class="field">
                                <input type="text" id="tag_text" style="width:600px">
                                <a href="#none" id="goForm" class="button button-b"><span>추가</span></a>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table><!-- // table -->

            <div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                </div>
            </div><!-- // section-button -->

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
<script src="<c:out value="${cdnDomain}" />/pc/js/vendor/jquery.tmpl.min.js"></script>
<script id="tagItemTemplate" type="text/x-jquery-tmpl">
<li id="\${TAG_MST_ID}" data-title="\${TAG_MST_TITLE }">\${TAG_MST_TITLE }
	<button class="btn_del" >X</button>
</li>
</script>
<script>

	var originTagList = JSON.parse($('#test').val());
	
	function tooltipLayer(){
	    $('.tooltip-open').on('click', function(){
	        $(this).addClass('on').next('.tooltip-layer').show().stop().animate({'opacity': '1'}, 200);
	    });
	}
	
    $(document).bind('mouseup touchend', function(e){
        var tooltipLayer = $('.tooltip-layer');
        if (!tooltipLayer.is(e.target) && tooltipLayer.has(e.target).length === 0) tooltipLayer.stop(true, false).animate({'opacity': '0'}, 200);
    });
    
    // 등록
	$(document).on("click", "#goForm", function(){
		addTag();
	});
    
    function splitTagText(inputTag){
    	return inputTag.split(','); 
    }
    
    function addTag(){

		var inputTag = document.getElementById('tag_text').value;
		
		if(inputTag == null || inputTag == ""){
			alert("태그를 입력하세요.");
			return;
		}

		var tagList = splitTagText(inputTag);
		
		for(var index = 0; index < tagList.length; index++){
			addTagItem(tagList[index]);
		}
		
		document.getElementById('tag_text').value = "";
		$("#tagCount").text("("+$("#tagData li").length+")");
    }
    
    function addTagItem(inputTag){
    	
    	inputTag = "#"+inputTag;
    	
    	var equals = false;
    	$.each(originTagList, function(index, item){
    		if(item.TAG_MST_TITLE == inputTag){
    			if("DELETE" == item.TAG_MST_STATUS){
    				item.TAG_MST_STATUS = "USE";
    				var obj = new Object();
    		    	obj["TAG_MST_ID"] = "";
    				obj["TAG_MST_TITLE"] = inputTag;
    				$("#tagItemTemplate").tmpl( obj ).appendTo("#tagData");
    				document.getElementById('tag_text').value = "";
    				$("#tagCount").text("("+$("#tagData li").length+")");
    			}
    			
    			document.getElementById('tag_text').value = "";
    			equals = true;
    			return false;
    		}
    	});
    	
    	if(equals)
		{	
    		return;
		}    		
    	
    	var obj = new Object();
    	obj["TAG_MST_ID"] = "";
		obj["TAG_MST_TITLE"] = inputTag;
		obj["TAG_MST_STATUS"] = "USE";
		originTagList.push(obj);
		$("#tagItemTemplate").tmpl( obj ).appendTo("#tagData");
    }
    
    $(document).on("click", ".btn_del", function(){
    	rowDelete(this);
    });
    // 현재 행 삭제
    function rowDelete(row)
    {	
    	var tagTitle = $(row).parent().data("title");
    	$(row).parent().remove();
    	
    	//status 변경	
		originTagList.forEach(function(item){
			if(tagTitle == item["TAG_MST_TITLE"]){
				item["TAG_MST_STATUS"] = "DELETE";
			}			
		});
		$(row).parent().remove();
		
		$("#tagCount").text("("+$("#tagData li").length+")");
    }
    $(document).keypress(function(e){
    	if(e.keyCode == 13) addTag(); 
    });
    
    // 저장 이벤트
    $(document).on("click", "#goRegist", function () {
    	
		$.ajax({
			type:"post",
			url : "<c:out value="${serverDomain}" />/am/tag/adminTagRegistAjax.do",
			data : {'TAG_TITLE_LIST':JSON.stringify(originTagList)},
			dataType : "json",
			async : false,
			success : function(data){
				//result 0 이상 성공
				alert(data.RESULT_MSG);
				
				if(data.result > 0){
					opener.location.reload();
					self.close();
				}
			},
			error : function(err){
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
			}
		});
    });
    
    
//-->
</script>

</body>
</html>
