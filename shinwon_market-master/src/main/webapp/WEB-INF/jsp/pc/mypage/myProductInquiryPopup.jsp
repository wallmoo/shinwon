<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="layer_modify" class="layer type03 is_btn" style="top: 125px; left: 506px; display: block;">
	<div class="layer_header">
		<h2>상품문의 수정</h2>
	</div>
	<div class="layer_content">
		<div class="table_wrap">
			<p class="required_txt"><span>필수입력사항</span></p>
			<form id="modifyFrm" name="modifyFrm">
			<input type="hidden" id="BRD_INQ_IDX" name="BRD_INQ_IDX" value="<c:out value="${selectMyQnaInfo.BRD_INQ_IDX }" />">
			<table class="tb_row type03">
				<caption>상품문의 수정 : 제목, 내용, 공개여부 입력 표입니다.</caption>
				<colgroup>
					<col style="width:20%">
					<col style="width:auto">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">
							<span class="required">
								<em class="blind">필수 정보</em>
							</span> 제목
						</th>
						<td>
							<input type="text" id="BRD_INQ_TITLE" name="BRD_INQ_TITLE" placeholder="제목 입력" value="<c:out value="${selectMyQnaInfo.BRD_INQ_TITLE}" />" class="w100p">
						</td>
					</tr>
					<tr>
						<th scope="row">
							<span class="required">
								<em class="blind">필수 정보</em>
							</span> 내용
						</th>
						<td>
							<div class="textarea_wrap">
								<textarea class="text_area" id="BRD_INQ_CONTENTS" name="BRD_INQ_CONTENTS" title="내용 입력" placeholder="내용 입력"><c:out value="${selectMyQnaInfo.BRD_INQ_CONTENTS}" /></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">공개여부</th>
						<td>
						<span>
						<c:choose>
							<c:when test = "${selectMyQnaInfo.BRD_INQ_PUB_YN eq 'Y'}">
								<input type="checkbox" id="BRD_INQ_PUB_YN" name="BRD_INQ_PUB_YN">
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="BRD_INQ_PUB_YN" name="BRD_INQ_PUB_YN" checked>
							</c:otherwise>
							</c:choose>
							<label for="BRD_INQ_PUB_YN">
									<span class="icon"></span>비공개
								</label>
							</span> 
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
		<!-- //table_wrap -->
	</div>
	<!-- //layer_content -->

	<div class="layer_footer">
		<div class="btn_wrap">
			<button type="button" onclick="layerClose()" class="btn_large gray under_close">취소</button>
			<button type="button" onclick="checkInqPubYn()" class="btn_large purple">수정</button>
		</div>
	</div>
	<a href="javascript:layerClose()" class="btn_layer_close">레이어 닫기</a>
</div>
<div class="dim" style="width: 1920px; height: 2356px; display: block;"></div>
		
<script>

checkInqPubYn = function(){
	 if($("#BRD_INQ_PUB_YN").prop("checked")){
  		$("#BRD_INQ_PUB_YN").val("N");
  	}else{
  		$("#BRD_INQ_PUB_YN").val("Y");
  	}
	goSubmit();
}

var goSubmit = function(){
		
            var $modifyFrm = $("#modifyFrm");
            var BRD_INQ_TITLE = $("#BRD_INQ_TITLE").val();
            var BRD_INQ_CONTENTS = $("#BRD_INQ_CONTENTS").val();
        
            var BRD_INQ_PUB_YN = $("#BRD_INQ_PUB_YN").val();
            if($modifyFrm.valid())
            {
            	if(BRD_INQ_TITLE == '' || BRD_INQ_TITLE == null){
            		alert("제목을 입력해주세요.");
            	}else if(BRD_INQ_CONTENTS == '' || BRD_INQ_TITLE == null  ){
            		alert("내용을 입력해주세요.");
            	}else{
            		if (confirm( "수정하시겠습니까?"))
                    {
                        $("#modifyFrm").attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myProductInquiryProc.do", "target":"_self", "method":"post"}).submit();
                    }
            	}
            	
            	
            	
            }
        }
	
	layerClose = function(){
		$("#productQnaFormPopup").empty();
	}
</script>