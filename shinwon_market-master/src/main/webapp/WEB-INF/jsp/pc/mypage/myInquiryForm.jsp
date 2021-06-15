<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">1:1 문의 작성</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">

				<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->

				<div class="table_wrap">
					<p class="required_txt"><span>필수입력사항</span></p>
					<form name="frm" id="frm" enctype="multipart/form-data">
						<table class="tb_row">
							<caption>1:1 문의 작성 : 상담유형, 제목, 내용, 이메일, 휴대폰, 파일첨부 입력 표입니다.</caption>
							<colgroup>
								<col style="width:20%">
								<col style="width:auto">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">
										<span class="required">
											<em class="blind">필수 정보</em>
										</span> 상담유형
									</th>
									<td>
										<span class="select">
											<select id="MEM_ADV_QST_TYPE" name="MEM_ADV_QST_TYPE" class="w284">
												<!-- TODO 상품유형 수정 -->
												<option value="" selected="selected">선택</option>
												<c:if test="${not empty inqTypeCodeList }">
													<c:forEach var="inqTypeCodeListRow" items="${inqTypeCodeList }" varStatus="i">
														<option value='<c:out value="${inqTypeCodeListRow.CMN_COM_IDX }" />'><c:out value="${inqTypeCodeListRow.CMN_COM_NM }" /></option>
													</c:forEach>
												</c:if>
											</select>
										</span>
									</td>
								</tr>
								<tr>
									<th scope="row">
										<span class="required">
											<em class="blind">필수 정보</em>
										</span> 제목
									</th>
									<td>
										<input type="text" id="MEM_ADV_TITLE" name="MEM_ADV_TITLE" maxlength="50" placeholder="제목 입력" class="w100p" title="제목 입력">
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
											<textarea id="MEM_ADV_CONTENTS" name="MEM_ADV_CONTENTS" maxlength="200" class="text_area" placeholder="내용 입력"></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td>
										<input type="text" id="MEM_ADV_MAIL_ID" name="MEM_ADV_MAIL_ID" placeholder="메일 계정 입력" class="w284" title="메일 계정 입력">
										<span class="at">@</span>
										<input type="text" id="MEM_ADV_MAIL_DOMAIN" name="MEM_ADV_MAIL_DOMAIN" placeholder="직접 입력" class="w284" title="직접 입력">
										<span class="select">
											<select id="emailDomainSelectbox" class="w298">
												<option value="" selected="selected">직접 입력</option>
												<c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
													<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
					                            		<option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
				                            		</c:forEach>
												</c:if>
											</select>
										</span>
										<input type="hidden" id="MEM_ADV_MAIL" name="MEM_ADV_MAIL"/>
									</td>
								</tr>
								<tr>
									<th scope="row">휴대폰</th>
									<td>
										<span class="select">
											<select name="MEM_ADV_HP1" id="MEM_ADV_HP1" class="w284">
												<option value="" selected="selected">선택</option>
												<c:if test="${not empty codes.HP_CODE }">
				                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
				                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
				                                    </c:forEach>
				                                </c:if>
											</select>
										</span>
										<span class="hyphen">-</span>
										<input type="text" name="MEM_ADV_HP2" id="MEM_ADV_HP2" maxlength="4" placeholder="번호 입력" class="w284">
										<span class="hyphen">-</span>
										<input type="text" name="MEM_ADV_HP3" id="MEM_ADV_HP3" maxlength="4" placeholder="번호 입력" class="w284">
									</td>
								</tr>
								<tr>
									<th scope="row">파일첨부</th>
									<td>
										<div class="attachment_wrap">
											<!-- <input type="text" name="" value="" class="inp_txt" title="파일 첨부하기"> -->
											<input type="file" id="multiFile1" name="file" class="inp_file" accept=".jpg, .gif">
											<label for="multiFile1" class="btn_attachment">파일 첨부하기</label>
											<span class="txt">
												첨부파일 형식 : <em>JPG, GIF</em>  /  용량 : <em>2MB</em> 이하
											</span>
										</div>
										<div class="attachment_list">
											<ul id="fileView">
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!-- //table_wrap -->

				<div class="btn_wrap">
					<button type="button" onclick="goList()" class="btn_large">취소</button>
					<button type="button" onclick="goRegist()" class="btn_large ok">등록</button>
				</div>


			</div>
			<!-- //sub_content -->

		</div>
	</div>

<form id="cansleForm" name="cansleForm">
	<input type="hidden" id="cPage" name="cPage" value="${commandMap.cPage }">
</form>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
$(function(){
	
	// 이메일 도메인 select box 변경 이벤트
    $("#emailDomainSelectbox").on("click", function (){
        var $domain = $("#MEM_ADV_MAIL_DOMAIN");

        if($(this).val() == "")
        {
            $domain.prop("readonly", false);
            $domain.val("");
        }
        else
        {
            $domain.prop("readonly", true);
            $domain.val($(this).val());
            $("#memEmailDomain").html("");
        }
    });
	
	var $frm = $("#frm");
	// 폼체크
    $frm.validate({
        rules: {
        	MEM_ADV_QST_TYPE:{required:true},
        	MEM_ADV_TITLE:{required:true, maxlength:50},
        	MEM_ADV_CONTENTS:{required:true, maxlength:200},
        	MEM_ADV_MAIL_ID:{emailId:true},
        	MEM_ADV_MAIL_DOMAIN:{emailDomain:true},
        	MEM_ADV_HP2:{number:true, minlength:3 , maxlength:4},
        	MEM_ADV_HP3:{number:true, minlength:4 , maxlength:4}
        },
        messages :{
        	MEM_ADV_QST_TYPE:{required:"[상담유형]은 필수 정보입니다."},
        	MEM_ADV_TITLE: {required:"[제목]은 필수 정보입니다.", maxlength:"[제목]은 최대 50글자압니다."},
        	MEM_ADV_CONTENTS: {required:"[내용]은 필수 정보입니다.", maxlength:"[내용]은 최대 200글자압니다."},
        	MEM_ADV_MAIL_ID : {emailId:"이메일 아이디 형식을 올바르게 입력해 주십시오."},
        	MEM_ADV_MAIL_DOMAIN : {emailDomain:"이메일 도메인 형식을 올바르게 입력해 주십시오."},
        	MEM_ADV_HP2: {minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[휴대폰번호 중간자리]는 최대 4글자입니다."},
        	MEM_ADV_HP2: {minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[휴대폰번호 뒷자리]는 최대 4글자입니다."}
        }
        ,onkeyup:false
	    ,onclick:false
	    ,onfocusout:false
        ,showErrors:function(errorMap, errorList){
 	       if(this.numberOfInvalids()) { 
	    	   alert(errorList[0].message);
	    	   $(errorList[0].element).focus();
	       }
	   }
    });
	
	var maxFileSize = 2097152;	
	$("#multiFile1").on("change", function(){
		
		var file = this.files[0];
		if(file == undefined){ return; }
		
		var file1 = file.name.slice(file.name.lastIndexOf(".")+1).toLowerCase();
		var file_extension1 = "jpg,gif";
		if(file.size > maxFileSize || file_extension1.indexOf(file1) == -1 ){
			return alert("용량(2MB이하), 형식(JPG, GIF)을 확인해주세요");
		}
		
		
		$("#fileView").empty();
		var index = $("#fileView li").length;
		
		html = "";
		html += "<li id=\"file_"+index+"\">"; 
		html += "<a href=\"javascript:void(0);\" class=\"file_name\" title=\"파일 다운로드\">"+file.name+"</a>";
		html += "<span class=\"file_capacity\">"+returnFileSize(file.size)+"</span>";
		html += "<button onclick=\"removeFileUi('file_"+index+"')\" type=\"button\" class=\"btn_attach_delete\">";
		html += "<em class=\"blind\">첨부 파일 삭제</em>";
		html += "</button>";
		html += "</li>";
		$("#fileView").append(html);
		
	});
	
	returnFileSize = function(number){
		if(number < 1024) {
			return number + 'bytes';
		} else if(number >= 1024 && number < 1048576) {
			return (number/1024).toFixed(1) + 'KB';
		} else if(number >= 1048576) {
			return (number/1048576).toFixed(1) + 'MB';
		}
	}
	
	removeFileUi = function(id){
		$("#"+id).remove();
		$("#multiFile1").val("");
	}
	
	goRegist = function(){
		if($frm.valid()){
			if(confirm("문의내역을 등록 하시겠습니까?")){
	    		$("#MEM_ADV_MAIL").val($("#MEM_ADV_MAIL_ID").val() != "" ? $("#MEM_ADV_MAIL_ID").val() + "@" + $("#MEM_ADV_MAIL_DOMAIN").val() : "");
	       		$frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/inquiryRegist.do", "target":"_self", "method":"post"}).submit();
			}
       	}
	}
	
	// 목록 버튼 클릭 이벤트
    goList = function () {
        $("#cansleForm").attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myInquiryList.do", "target":"_self", "method":"post"}).submit();
    }
	
});
</script>