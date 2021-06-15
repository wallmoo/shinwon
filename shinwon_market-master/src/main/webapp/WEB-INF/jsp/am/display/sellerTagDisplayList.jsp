<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contents-inner"><!-- contents-inner -->

	<h3 class="title"><span>${tagDisplayCodeList[1].CMN_COM_NM } - ${tagDisplayCodeList[0].CMN_COM_NM }</span></h3>
	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
		<div class="text-left">
			${tagDisplayCodeList[0].CMN_COM_ETC3 }
		</div>	
		<div class="grid section-button-list">
			<div class="text-left">(태그 최대 20개)</div>
			<div class="text-right">
				<a href="#" class="button small"><span>선택삭제</span></a>
				<a href="javascript:goForm();" class="button small primary"><span>등록</span></a>
			</div>
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
                    <th><label for="">TAG<i class="require"><em>필수입력</em></i></label></th>
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
		
		for (var i = 0; i < params.length; i++) {
			$(".tag_cloud_list").append('<li class="sel_tag_list txt">' + params[i].value + '<button type="button" class="btn_del">X</button><input type="hidden" name="TAG_MST_IDs" value="'+params[i].TAG_MST_ID+'" /></li>');
		}
	}
	
	goRegist = function(){
		if($("input[name=TAG_MST_IDs]").size()<1){
			alert("선택된 태그가 없습니다.");
			return;
		}
		if($("input[name=TAG_MST_IDs]").size() > 20){
			alert("태그는 최대 20개 입력 가능합니다.");
			return;
		}
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/display/sellerTagDispalyRegist.do", "target":"_self", "method":"post"}).submit();
	}
	
	$(document).on("click", ".btn_del", function() {
		$(this).parent().remove();
	});
	
});

</script>