<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<div id="layer_base_shipping" class="layer type03 is_btn" style="display: block; top: 85px; left: 506px;">
		<div class="layer_header">
			<h2>배송지 등록</h2>
		</div>
		<div class="layer_content">
			<div class="table_wrap">
				<p class="required_txt"><span>필수입력사항</span></p>
				
				<form id="frm" name="frm">
					<input type="hidden" name="pageStatus" value="<c:out value="${commandMap.pageStatus}"/>"/>
					<input type="hidden" name="MEM_DLV_IDX" value="<c:out value="${commandMap.MEM_DLV_IDX}"/>"/>
					
					<table class="tb_row">
						<caption>회원가입 정보입력 : 이름, 생년월일, 성별, 아이디, 비밀번호, 비밀번호 확인, 닉네임, 휴대폰, 이메일, 이벤트 정보 수신, 제휴사 코드 입력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 배송지명
								</th>
								<td>
									<input type="text" id="MEM_DLV_NM" name="MEM_DLV_NM" maxlength="15" placeholder="배송지명 입력" class="w414" value="<c:out value="${row.MEM_DLV_NM }"/>">
									<span class="ml20">
										<input type="checkbox" id="MEM_DLV_BSC_YN" name="MEM_DLV_BSC_YN" value="Y" <c:if test="${row.MEM_DLV_BSC_YN eq 'Y'}">checked="checked"</c:if> >
										<label for="MEM_DLV_BSC_YN" class="mr0"> 
											<span class="icon"></span>기본 배송지로 설정
										</label>
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 받는 사람
								</th>
								<td>
									<input type="text" id="MEM_DLV_RCV_NM" name="MEM_DLV_RCV_NM" maxlength="10" value='<c:out value="${row.MEM_DLV_RCV_NM }" />' placeholder="이름 입력" class="w100p">
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 휴대폰
								</th>
								<td>
									<span class="select">
										<select id="MEM_DLV_HP1" name="MEM_DLV_HP1" class="w186">
											<c:if test="${not empty codes.HP_CODE }">
												<c:forEach var="hpRow" items="${codes.HP_CODE }">
													<option value='<c:out value="${hpRow.CMN_COM_NM }" />' <c:if test="${hpRow.CMN_COM_NM eq row.MEM_DLV_HP1 }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }" /></option>
												</c:forEach>
											</c:if>
										</select>
									</span>
									<span class="hyphen">-</span>
									<input type="text" id="MEM_DLV_HP2" name="MEM_DLV_HP2" maxlength="4" placeholder="번호 입력" class="w186" value="<c:out value='${row.MEM_DLV_HP2 }'/>">
									<span class="hyphen">-</span>
									<input type="text" id="MEM_DLV_HP3" name="MEM_DLV_HP3" maxlength="4" placeholder="번호 입력" class="w186" value="<c:out value="${row.MEM_DLV_HP3 }"/>">
								</td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td>
									<span class="select">
										<select id="MEM_DLV_TEL1" name="MEM_DLV_TEL1" class="w186">
											<c:if test="${not empty codes.TEL_CODE }">
												<c:forEach var="telRow" items="${codes.TEL_CODE }">
													<option value='<c:out value="${telRow.CMN_COM_NM }"/>' <c:if test="${telRow.CMN_COM_NM eq row.MEM_DLV_TEL1}">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
												</c:forEach>
											</c:if>
										</select>
									</span>
									<span class="hyphen">-</span>
									<input type="text" id="MEM_DLV_TEL2" name="MEM_DLV_TEL2" maxlength="4" placeholder="번호 입력" class="w186" value='<c:out value="${row.MEM_DLV_TEL2 }"/>'>
									<span class="hyphen">-</span>
									<input type="text" id="MEM_DLV_TEL3" name="MEM_DLV_TEL3" maxlength="4" placeholder="번호 입력" class="w186" value='<c:out value="${row.MEM_DLV_TEL3 }"></c:out>'>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<span class="required">
										<em class="blind">필수 정보</em>
									</span> 주소
								</th>
								<td>
									<span class="block">
										<input type="text" id="MEM_DLV_ZIP_CDE5" name="MEM_DLV_ZIP_CDE5" maxlength="5" placeholder="우편번호 입력" class="w250" value="<c:out value='${row.MEM_DLV_ZIP_CDE5 }'/>">
										<button id="zipCheck" type="button" class="btn_large type03 ml8">우편번호 찾기</button>
									</span>
									<span class="block">
										<input type="text" id="MEM_DLV_DRO_ADR1" name="MEM_DLV_DRO_ADR1" maxlength="60" placeholder="도로명 주소 입력" class="w100p" value='<c:out value="${row.MEM_DLV_DRO_ADR1 }"/>'>
									</span>
									<span class="block">
										<input type="text" id="MEM_DLV_JBN_ADR1" name="MEM_DLV_JBN_ADR1" maxlength="60" placeholder="지번 입력" class="w100p" value='<c:out value="${row.MEM_DLV_JBN_ADR1 }" />'>
									</span>
									<span class="block">
										<input type="text" id="MEM_DLV_ADR2" name="MEM_DLV_ADR2" maxlength="60" placeholder="이하 입력" class="w100p" value='<c:out value="${row.MEM_DLV_DRO_ADR2 }"/>'>
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
				<button onclick="layerClose()" type="button" class="btn_large gray under_close">취소</button>
				<button onclick="goSubmit()" type="button" class="btn_large purple">확인</button>
			</div>
		</div>
		<a href="javascript:layerClose()" class="btn_layer_close">
			<em class="blind">레이어 닫기</em>
		</a>
	</div>
	
<script>
$(function(){
	$("#myDelivePopup").append("<div class=\"dim\" style=\"width: 100%; height: 100%; display: block;\"></div>");
	
	// 폼체크
    $("#frm").validate({
        rules: {
        	MEM_DLV_NM:{required:true}, // 구분
        	MEM_DLV_RCV_NM:{required:true}, // 받는 사람 이름
        	MEM_DLV_HP1:{required:true,number:true}, // 휴대폰번호1
        	MEM_DLV_HP2:{required:true,number:true}, // 휴대폰번호2
        	MEM_DLV_HP3:{required:true,number:true}, // 휴대폰번호3
            MEM_DLV_ZIP_CDE5:{required:true, number:true, minlength:5, maxlength:5}, // 주소 우편번호
            MEM_DLV_JBN_ADR1:{required:true},	// 지번 주소 앞부분
	        MEM_DLV_DRO_ADR1:{required:true}, // 도로명 주소 앞부분
	        MEM_DLV_ADR2:{required:true} // 상세 주소
        },
        messages :{
        	MEM_DLV_NM : {required:"[배송지명]을 입력해주세요."},
        	MEM_DLV_RCV_NM : {required:"[받으시는 분]을 입력해주세요."},
        	MEM_DLV_HP1: {required:"[휴대폰번호] 첫번째 자리를 선택해주세요."},
        	MEM_DLV_HP2: {required:"[휴대폰번호]두번째 자리를 입력해주세요.", number:"[휴대폰번호]두번째 자리를 숫자로 입력해주세요."},
        	MEM_DLV_HP3: {required:"[휴대폰번호]세번째 자리를 입력해주세요.", number:"[휴대폰번호]세번째 자리를 숫자로 입력해주세요."},
        	MEM_DLV_ZIP_CDE5: {required:"[우편번호 검색]을 해주세요."},
        	MEM_DLV_DRO_ADR1:{required:"[우편번호 검색]을 해주세요."},
        	MEM_DLV_JBN_ADR1:{required:"[우편번호 검색]을 해주세요."},
        	MEM_DLV_ADR2:{required:"[상세 주소]를 입력해주세요."},
        }
        ,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
        ,onkeyup:false
   	    ,onclick:false
   	    ,onfocusout:false
        ,showErrors:function(errorMap, errorList){
    	       if(this.numberOfInvalids()) { 
   	    	   //var caption = $(errorList[0].element).attr('caption') || $(errorList[0].element).attr('id');
   	    	   //alert('[' + caption + '] ' + errorList[0].message);
   	    	   var errorOobjId = $(errorList[0].element).attr('id');
   	    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
   	    	   caption = caption.replace('*','').replace(/\s/gi,'');
   	    	   if(caption != null && caption != "") 
   	    	   {
   	    	       alert('[' + caption + '] ' + errorList[0].message);
   	    	   }
   	    	   else
   	    	   {
   	    	       alert(errorList[0].message);
   	    	   }
   	    	   $(errorList[0].element).focus();
   	       }
   	   }
    });
	
	var submitCnt = 0;
	goSubmit = function (){
    	
    	if(submitCnt == 0)
        {
            var $frm = $("#frm");
            
            if($frm.valid())
            {
                if (confirm( "저장하시겠습니까?"))
                {
                    submitCnt = submitCnt + 1;
                    $("#frm").attr({"action":"<c:out value="${frontDomain}" />/pc/mypage/myDeliveProc.do", "target":"_self", "method":"post"}).submit();
                }
            }
        }
        else
        {
            alert("등록/수정이 진행중입니다.");
            return;
        }
    }
	
	layerClose = function(){
		$("#myDelivePopup").empty();
	}
})
</script>