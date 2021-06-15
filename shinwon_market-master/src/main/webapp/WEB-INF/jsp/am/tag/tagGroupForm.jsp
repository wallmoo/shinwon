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

            <h2 class="title"><span>태그그룹 등록</span></h2>

            <form id="frm" name="frm">
            	<input type="hidden" name="searchKeyword" value="${commandMap.searchKeyword}">
            	<input type="hidden" name="searchType" value="${commandMap.searchType}">
            	<input type="hidden" name="searchUseYN" value="${commandMap.searchUseYN}">
            	<input type="hidden" name="paging" value="${paging}">
            	
                <input type="hidden" name="TAG_LIST" id="TAG_LIST" value='${TAG_LIST}'/>
                
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%; min-width: 180px;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr><!-- row -->
                            <th><span>태그 그룹명 <i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="text" id="tag_group_title" class="text" placeholder="태그 그룹명 설명"/>
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span>태그 그룹 설명</span></th>
                            <td>
                                <input type="text" id="tag_group_desc" class="text xlarge" placeholder="태그 그룹 설명 입력"/>
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span>사용설정 <i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="radio" class="radio" name="TAG_GRP_USE_YN" id="state1" value="Y" checked=true />
                                <label for="state1">사용</label>
                                <input type="radio" class="radio" name="TAG_GRP_USE_YN" id="state2" value="N" />
                                <label for="state2">미사용</label>
                            </td>
                        </tr>
                        <tr>
                            <th><span>등록태그<i class="require"><em>필수입력</em></i> <br /><span id="tagCount">(0)</span></span></th>
                            <td>
                                <ul class="tag_list" id="selectedTagListContainer">
                                </ul>
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span>태그선택</span><a href="#none" class="button button-a small chk_reset">초기화</a></th>
                            <td>
                                <div class="field tag_chk_con" id="tagCheckList">
                                    <c:choose>
                                        <c:when test="${not empty TAG_LIST }">
                                            <ul class="form_radio_check_list">
                                            <c:forEach var="row" items="${TAG_LIST }" varStatus="i">
                                                <li>
                                                    <input type="checkbox" name="tag_chk" class = "checkbox tag_id_list" value="${row.TAG_MST_ID}"/>
                                                    <label><c:out value="${row.TAG_MST_TITLE}"/></label>
                                                </li>
                                            </c:forEach>
                                            </ul>
                                        </c:when>
                                    </c:choose>
                                    
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
                <div class="section-button">
                    <div class="wrap text-center">
                        <a href="javascript:;" id="goRegist" class="button primary"><span>저장</span></a>
                        <a href="javascript:;" id="goList" class="button"><span>목록</span></a>
                    </div>
                </div>
            </form>
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
var tagList = JSON.parse($('#TAG_LIST').val());
var selectedTagListContainer = null;
$(document).ready(function () {
	selectedTagListContainer = $('#selectedTagListContainer');
	var addTag = function(id){
		var tag = getTagById(id);
		if(tag == null){return;}
		selectedTagListContainer.append('<li id="selected_tag_item_'+id+'" class="selected_tag_item">'+tag.TAG_MST_TITLE+'<button type="button" class="btn_del">X</button></li>');
		$("#tagCount").text("("+$("#selectedTagListContainer li").length+")");
	}
	var removeTag = function(id){
		selectedTagListContainer.children("#selected_tag_item_"+id).remove();	
		$("#tagCount").text("("+$("#selectedTagListContainer li").length+")");
	}
	var removeTagAll = function(){
		selectedTagListContainer.empty();
		$("input[type=checkbox]").prop("checked",false);
		$("#tagCount").text("("+$("#selectedTagListContainer li").length+")");
	}	
	var getTagById = function(id){
		return tagList.find(function(item){return item.TAG_MST_ID == id;});
	}
	var getCheckBoxTagById = function(id){
		var tag_id_list = $('.tag_id_list');
		
		tag_id_list.each(function(item){
			if(item.val() == id){
				return item;
			}
		});
	}
	$('.tag_id_list').change(function(){
		if($(this).is(":checked")){
			addTag($(this).val());
		}
		else{
			removeTag($(this).val());
		}
	});
	
    // 버튼 클릭시 삭제
    $(document).on("click", ".btn_del", function() {
    	$(this).parents('li').remove();
    	var tagId= $(this).parents('li').attr('id').substring("selected_tag_item_".length);
        $("#tagCheckList input[name=tag_chk]:checked").each(function(){
        	if($(this).val() == tagId){
        		$(this).parent().remove();
        	}	
        });
        $("#tagCount").text("("+$("#selectedTagListContainer li").length+")");
    });

    // 초기화 클릭시 라디오 버튼 체크 전체 해제
    $(".chk_reset").click(function(){    	
        $("input[type=checkbox]").prop("checked",false);
        removeTagAll();
    });
    
    $(document).on("click", "#goList", function(){
    	if (confirm( "목록으로 이동하시겠습니까?")) {
            $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/tag/tagGroupList.do", "target":"_self", "method":"post"}).submit();
        }
    });
    
    // 저장 이벤트
    $(document).on("click", "#goRegist", function () {
    	var selectedTagIdList = new Array();
    	var data =  new Array();
    	
    	$('input:checkbox[name=tag_chk]:checked').each(function() {
    		selectedTagIdList.push($(this).val());
    	});
		
    	selectedTagIdList.forEach(function(item){
    		var obj = new Object();
    		obj["TAG_MST_ID"] = item;
    		
    		data.push(obj);
    	});
    	
    	var tag_group_title = document.getElementById('tag_group_title').value;
    	var tag_group_desc = document.getElementById('tag_group_desc').value;
    	var statusYN = $("input:radio[name=TAG_GRP_USE_YN]:checked").val();
    	
    	if(tag_group_title.length <1){
    		alert("태그 그룹명을 입력해주세요.");
    		$("#tag_group_title").focus();
    		return;
    	}
    	
    	if(selectedTagIdList.length<1){
    		alert("태그를 선택해주세요.");
    		return;
    	}
    	
    	if (!confirm( "저장 하시겠습니까?")) {
            return;
        }
    	
    	var jsonData = JSON.stringify(data);
    	
		$.ajax({
			type:"post",
			url : "<c:out value="${serverDomain}" />/am/tag/tagGroupRegistAjax.do",
			data : {'TAG_GRP_TITLE':tag_group_title, 'TAG_GRP_DES':tag_group_desc, 'TAG_GRP_STATUS':statusYN,'TAG_ID_LIST':jsonData},
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
});
//-->
</script>

</body>
</html>
