<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">1:1 문의 수정</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
			<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
			
				<div class="con_tit_wrap">
				    <h3 class="con_tit">문의내용</h3>
				</div>
				<div class="table_wrap mb90">
					<!-- <p class="required_txt"><span>필수입력사항</span></p> -->
					<form name="frm" id="frm" enctype="multipart/form-data">
						<input type="hidden" name="MEM_ADV_IDX" id="MEM_ADV_IDX" value="<c:out value="${row.MEM_ADV_IDX }" />" />
						
						<table class="tb_row">
							<caption>1:1 문의 수정 : 상담유형, 제목, 내용, 이메일, 휴대폰, 파일 첨부 입력 표입니다.</caption>
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
												<option value="">선택</option>
												<c:if test="${not empty inqTypeCodeList }">
													<c:forEach var="inqTypeCodeRow" items="${inqTypeCodeList }" varStatus="i" >
														<option value="<c:out value="${inqTypeCodeRow.CMN_COM_IDX }" />" <ui:select v="${row.MEM_ADV_QST_TYPE }" t="${inqTypeCodeRow.CMN_COM_IDX }" g="selected"/>>
															<c:out value="${inqTypeCodeRow.CMN_COM_NM }"/>
														</option>
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
										<input type="text" id="MEM_ADV_TITLE" name="MEM_ADV_TITLE" placeholder="제목 입력" value="<c:out value="${row.MEM_ADV_TITLE }" />" class="w100p" title="제목 입력">
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
											<textarea class="text_area" id="MEM_ADV_CONTENTS" name="MEM_ADV_CONTENTS" placeholder="내용 입력"><c:out value="${row.MEM_ADV_CONTENTS }" /></textarea>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">이메일</th>
									<td>
										<c:set var="emailary" value="${fn:split(row.MEM_ADV_MAIL,'@') }" />
										<input type="text" id="MEM_ADV_MAIL_ID" value="<c:out value="${emailary[0] }" />" maxlength="20" placeholder="메일 계정 입력" class="w284" title="메일 계정 입력">
										<span class="at">@</span>
										<input type="text" id="MEM_ADV_MAIL_DOMAIN" value="<c:out value="${emailary[1] }"/>" placeholder="직접 입력" class="w284" title="직접 입력">
										<span class="select">
											<select id="emailDomainSelectbox" class="w298">
												<option value="" selected="selected">직접 입력</option>
												<c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
													<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
														<option value="<c:out value="${emailRow.CMN_COM_NM }"/>" <ui:select v="${emailary[1]}" t="${emailRow.CMN_COM_NM }" g="selected"/>><c:out value="${emailRow.CMN_COM_NM }"/></option>
													</c:forEach>
												</c:if>
											</select>
											<input type="hidden" id="MEM_ADV_MAIL" name="MEM_ADV_MAIL"/>
										</span>
									</td>
								</tr>
								<tr>
									<th scope="row">휴대폰</th>
									<td>
										<span class="select">
											<select class="w284" id="MEM_ADV_HP1" name="MEM_ADV_HP1" title="휴대폰 번호 앞자리" >
												<c:if test="${not empty codes.HP_CODE }">
													<c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
														<option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <ui:select v="${row.MEM_ADV_HP1}" t="${hpRow.CMN_COM_NM }" g="selected"/> ><c:out value="${hpRow.CMN_COM_NM }"/></option>
													</c:forEach>
												</c:if>
											</select>
										</span>
										<span class="hyphen">-</span>
										<input type="text" id="MEM_ADV_HP2" name="MEM_ADV_HP2" value="<c:out value="${row.MEM_ADV_HP2 }" />" maxlength="4" placeholder="번호 입력" class="w284">
										<span class="hyphen">-</span>
										<input type="text" id="MEM_ADV_HP3" name="MEM_ADV_HP3" value="<c:out value="${row.MEM_ADV_HP3 }" />" maxlength="4" placeholder="번호 입력" class="w284">
									</td>
								</tr>
								<tr>
									<th scope="row">파일첨부</th>
									<td>
										<div class="attachment_wrap">
											<input type="text" name="" value="" class="inp_txt" title="파일 첨부하기">
											<input type="file" id="multiFile1" name="file" class="inp_file">
											<label for="multiFile1" class="btn_attachment">파일 첨부하기</label>
											<span class="txt">
												첨부파일 형식 : <em>JPG, GIF</em>  /  용량 : <em>2MB</em> 이하
											</span>
										</div>
										<div class="attachment_list">
											<ul id="fileView">
												<c:forEach var="fileRow" items="${fileList }" varStatus="i">	
													<li id="file_${fileRow.CMM_FLE_IDX }">
														<a href="#" class="file_name" title="파일 다운로드"><c:out value="${fileRow.CMM_FLE_ORG_NM }"/></a>
														<span class="file_capacity"><c:out value="${fileRow.CMM_FLE_ATT_SIZE }" /></span>
														<button type="button" onclick="removeFile('${fileRow.CMM_FLE_IDX }')" class="btn_attach_delete">
															<em class="blind">첨부 파일 삭제</em>
														</button>
													</li>
												</c:forEach>
											</ul>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!-- //table_wrap -->

				<div class="con_tit_wrap">
				    <h3 class="con_tit">답변내용</h3>
				</div>

				<div class="table_wrap">
					<!-- <p class="required_txt"><span>필수입력사항</span></p> -->
					<table class="tb_row">
						<caption>1:1 문의 수정 : 답변 상태 출력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">답변상태</th>
								<td>
									<div class="txt_read">답변 준비중입니다.</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="attention_list_wrap mt47">
					<ul>
						<li>문의하신 내용과 답변내용 확인하실 수 있습니다.</li>
						<li>질문 내용에 만족하실만한 답변 작성을 위해서 시간 소요가 될 수 있는 점 양해 부탁드립니다.</li>
						<li>답변 완료된 문의는 수정 하실 수 없습니다.</li>
					</ul>
				</div>

				<div class="btn_wrap">
					<button type="button" id="goList" class="btn_large">목록</button>
					<button type="button" id="goRegist" class="btn_large ok">수정</button>
				</div>
			</div>
			<!-- //sub_content -->

		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
$(function(){
	
	var $frm = $("#frm");
	
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
	
	// 목록 이동
	$("#goList").on("click", function(){
        $("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myInquiryList.do", "target":"_self", "method":"post"}).submit();
    });
    
    $("#goRegist").on("click", function(){
    	if($frm.valid()){
			if(confirm("문의내역을 수정 하시겠습니까?")){
	    		$("#MEM_ADV_MAIL").val($("#MEM_ADV_MAIL_ID").val() != "" ? $("#MEM_ADV_MAIL_ID").val() + "@" + $("#MEM_ADV_MAIL_DOMAIN").val() : "");
	    		$frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myInquiryModify.do", "target":"_self", "method":"post"}).submit();
			}
       	}
    });
	
	var maxFileSize = 2097152;
	//파일 등록 사용자 이벤트
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
	
	removeFile = function(idx){
		$("#file_"+idx).remove();
	}
	
	removeFileUi = function(id){
		$("#"+id).remove();
		$("#multiFile1").val("");
	}
	
	$("#emailDomainSelectbox").on("click", function (){
	    var $domain = $("#MEM_ADV_MAIL_DOMAIN");
	
	    if($(this).val() == ""){
	        $domain.prop("readonly", false);
	        $domain.val("");
	    }else{
	        $domain.prop("readonly", true);
	        $domain.val($(this).val());
	        $("#memEmailDomain").html("");
	    }
	});
});
</script>