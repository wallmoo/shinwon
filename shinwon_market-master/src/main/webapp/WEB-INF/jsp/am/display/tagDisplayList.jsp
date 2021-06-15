<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contents-inner"><!-- contents-inner -->

	<h3 class="title"><span>${tagDisplayCodeList[1].CMN_COM_NM } - ${tagDisplayCodeList[0].CMN_COM_NM }</span></h3>
	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
		<div class="text-left">
			${tagDisplayCodeList[0].CMN_COM_ETC3 }
		</div>
		<span id="_tagInfoText"></span>	
		<div class="text-right">
    		<a href="javascript:goForm();" class="button small primary"><span>TAG 선택</span></a>
    	</div>
	</div><!-- // 목록 상단 버튼 -->
	<form id="frm" name="frm">
		<div class="table-a"><!-- col list -->
            <table class="table-row table-a">
                <colgroup>
                    <col style="width: 10%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                <tr>
                    <th>TAG<span style="color:red;display:inline-block;padding:0;">*</span></th>
                    <td>
                        <div class="tag_cloud_wrap_side">
							<div class="tag_cloud_wrap">
								<ul class="tag_cloud_list">
									<c:forEach items="${list}" var="tag">
										<li class="sel_tag_list txt" >${tag.TAG_MST_TITLE}
											<button type="button" class="btn_del">X</button>
											<input type="hidden" name="TAG_MST_IDs" value="<c:out value="${tag.TAG_MST_ID }"/>" />
										</li>
	                            	</c:forEach>
								</ul>
								
							</div>
						</div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div><!-- // col list -->
        <div class="section-button"><!-- section-button -->
            <div class="wrap text-center">
                <a href="javascript:goRegist();" class="button large primary"><span>저장</span></a>
            </div>
        </div>
       <input type="hidden" name="CMN_COM_IDX" value="<c:out value="${tagDisplayCodeList[0].CMN_COM_IDX }"/>" />
    </form>
</div><!-- // contents-inner -->
<script type="text/javascript">
$(document).ready(function () {
	goForm = function(){
		popup("<c:out value="${serverDomain}" />/am/tag/searchTagGroupPopup.do","900", "500", "yes");
	}
	
	fnResultTag = function(params) {
		$(".tag_cloud_list").children().remove()
		
		for (var i = 0; i < params.length; i++) {
			$(".tag_cloud_list").append('<li class="sel_tag_list txt">' + params[i].value + '<button type="button" class="btn_del">X</button><input type="hidden" name="TAG_MST_IDs" value="'+params[i].TAG_MST_ID+'" /></li>');
		}
	}
	
	var tagCode = $('input[name=CMN_COM_IDX]').val();
	
	goRegist = function(){
		if($("input[name=TAG_MST_IDs]").size()<1){
			alert("선택된 태그가 없습니다.");
			return;
		}
		
		if(tagCode == '3720' || tagCode == '3721' || tagCode == '3722' || tagCode == '3723' || tagCode == '3724'){
			if($('input[name=TAG_MST_IDs]').length < 1){
				alert('최소 1개이상의 태그를 등록하셔야 합니다.');
				return;
			}
		}
		
		if(tagCode == '3725'){
			if($('input[name=TAG_MST_IDs]').length < 3){
				alert('최소 3개이상의 태그를 등록하셔야 합니다.');
				return;
			}
			
			if($('input[name=TAG_MST_IDs]').length > 6){
				alert('최대 6개의 태그 등록이 가능합니다.');
				return;
			}			
		}
		
		if(tagCode == '3726' || tagCode == '3727' || tagCode == '3728' || tagCode == '3729'){
			if($('input[name=TAG_MST_IDs]').length != 15){
				alert('15개의 태그를 등록하셔야 합니다.');
				return;
			}
		}		
		
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/tagDispalyRegist.do", "target":"_self", "method":"post"}).submit();
	}
	
	$(document).on("click", ".btn_del", function() {
		$(this).parent().remove();
	});
	

	if(tagCode == '3720' || tagCode == '3721' || tagCode == '3722' || tagCode == '3723' || tagCode == '3724'){
		$('#_tagInfoText').text('(필수1개, 최대 제한없음)');
	} else if(tagCode == '3725'){
		$('#_tagInfoText').text('(필수3개, 최대6개)');
	} else if(tagCode == '3726' || tagCode == '3727' || tagCode == '3728' || tagCode == '3729'){
		$('#_tagInfoText').text('(필수15개, 최대15개)');
	}
});

</script>