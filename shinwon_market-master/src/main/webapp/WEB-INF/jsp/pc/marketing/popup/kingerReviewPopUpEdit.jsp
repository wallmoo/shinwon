<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
<c:choose>	
	<c:when test="${empty commandMap.MEM_MST_MEM_ID }">
		<script type="text/javascript">
			alert("로그인 후 다시 시도하세요.");
			self.close();
		</script>
	</c:when>
	<c:when test="${info.EXP_ETR_WIN_YN ne 'Y'}">
		<script type="text/javascript">
			alert("마켓플랜트 KINGER가 아니시면 리뷰를 작성하실 수 없습니다.\n다음 체험단에 참여해주세요.")
			self.close();
		</script>
	</c:when>
	<c:when test="${info.EXP_ETR_AGR_YN ne 'Y'}">
		<script type="text/javascript">
			alert("동의서를 확인하지 않으시면 리뷰를 작성하실수 없습니다.\n동의서를 제출해주세요.")
			self.close();
		</script>
	</c:when>
	<c:otherwise>
</head>
<body class="page-popup">

<!-- #wrap S -->
<section id="wrap">	
	<!-- #container S -->
	<article id="container" class="container king_regist_pop">
		<div class="contents"><!-- .contents S -->
			<h1>KINGER 리뷰 등록</h1>
			<dl class="king_regist">
				<dt class="ti">
					<h2><c:out value="${info.EXP_MST_NM }" /></h2>
					<p>본 게시판과 관련이 없거나 광고성, 단순반복성, 저작권침해 등 불건전한 내용을 올리실 경우 <br/>
					통보 없이 임의로 삭제 처리될 수 있습니다.</p>
				</dt>
				<dd class="form">
				<form id="frm" name="frm" enctype="multipart/form-data" method="post">
				<input type="hidden" name="EXP_MST_CD" id="EXP_MST_CD" value="<c:out value="${commandMap.EXP_MST_CD }" />" />
				<input type="hidden" name="EXP_REV_IDX" id="EXP_REV_IDX" value="<c:out value="${commandMap.EXP_REV_IDX }" />" />
				<double-submit:preventer/>
					<table>
						<caption>리뷰등록입력폼| 제목, 서브제목, 내용, 블로그URL, 썸네일 등록 으로 구성된 표</caption>
						<colgroup>
						<col style="width:140px" />
						<col />
						</colgroup>
						<tbody>
							<tr>
								<th><label for="inp_ti"><span>제목</span> <i class="co_red">*</i></label></th>
								<td>
									<div class="inp_box">
										<input type="text" name="EXP_REV_NM" id="EXP_REV_NM" value="<c:out value="${revInfo.EXP_REV_NM }" />" maxlength="50"/>
										<span class="inp_num">(50자)</span>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="inp_sub_ti"><span>서브제목</span> <i class="co_red">*</i></label></th>
								<td>
									<div class="inp_box">
										<input type="text" name="EXP_REV_SUB_NM" id="EXP_REV_SUB_NM" value="<c:out value="${revInfo.EXP_REV_SUB_NM }" />" maxlength="70"/>
										<span class="tx_ex">※ 아래 내용의 요약글을 작성해주세요. 리스트에 노출됩니다.</span>
										<span class="inp_num">(70자)</span>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="txt_con"><span>내용</span> <i class="co_red">*</i></label></th>
								<td>
									<div class="inp_box">
										<textarea name="EXP_REV_CTS" id="EXP_REV_CTS" style="width:90%;"><c:out value="${revInfo.EXP_REV_CTS }" /></textarea>
										<span class="inp_num"></span>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="inp_url"><span>블로그 URL</span> <i class="co_red">*</i></label></th>
								<td>
									<div class="inp_box">
										<input type="text" name="EXP_REV_URL" id="EXP_REV_URL" value="<c:out value="${revInfo.EXP_REV_URL }" />" />
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="inp_img"><span>썸네일 등록</span> <i class="co_red">*</i></label></th>
								<td>
									<c:if test="${not empty revInfo.CMM_FLE_ORG_NM }" >
									<div class="inp_box file_box">
										<span class="tx_file"><c:out value="${revInfo.CMM_FLE_ORG_NM}" /></span>
										<label for="inp_file_del" class="inp_checkbox">
											<input type="checkbox" name="inp_file_del" id="inp_file_del" value="<c:out value="${revInfo.CMM_FLE_IDX }" />" />
											<span>삭제</span>
										</label>
									</div>
									</c:if>
									<div class="inp_box">
										<input type="file" name="multiFile" id="multiFile" disabled="disabled" />
										<p class="tx_ex">
											<span>- 최대 3MB까지 업로드가 가능합니다.</span>
											<span>- 1장의 사진만 업로드해 주세요.</span>
											<span>- jpg, gif, png 파일만 업로드 가능합니다. </span>
										</p>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					</form>
				</dd>
			</dl>
			<div class="btn_box">
				<a href="#none" class="btn_bl" id="regist"><strong>리뷰 수정하기</strong></a>
				<a href="javascript:void(0)" class="btn_bk" id="cancel"><strong>취소</strong></a>
			</div>
			<script type="text/javascript">
				$(document).on("click", "#regist", function(){
					
					try { oEditors1.getById["EXP_REV_CTS"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ } //editor 내용을 PLN_MST_PC_BANNER TEXTAREA의 VALUE 값으로 만든다.
					
					if($("#inp_file_del").is(":checked")){
						if($("#multiFile").val() == ""){
							alert("썸네일을 등록 하세요.");
							return;
						}
					}
					
					if($("#EXP_REV_NM").val() == ""){
						alert("제목을 입력해주세요.");
						$("#EXP_REV_NM").focus();
						return;
					}
					if($("#EXP_REV_SUB_NM").val() == ""){
						alert("서브 제목을 입력하세요.");
						$("#EXP_REV_SUB_NM").focus();
						return;
					}
					if($("#EXP_REV_URL").val() == ""){
						alert("블로그 URL을 입력하세요.");
						$("#EXP_REV_URL").focus();
						return;
					}
					
					if (confirm("저장 하시겠습니까?")) {
						$("#frm").attr("action","<c:out value="${frontDomain}" />/pc/marketing/kingerReviewEditRegist.do").submit();
					}
				});
				
				//파일용량, 확장자 체크
				$('#multiFile').bind('change', function() {
					//alert(this.files[0].size);
					var fileSise1 = this.files[0].size;
					var file1 = $("#multiFile").val();
			   		
			   		var extensionF1 = file1; //파일을 추가한 input 박스의 값
			   		extensionF1 = extensionF1.slice(extensionF1.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
			   		
			   		if(fileSise1 > 3145728){
			   			alert('파일 용량(3MB)만 등록 가능합니다.');
			   			$("#multiFile").val('');
			   			return;
			   		}
			   		
			   		if(extensionF1 != "jpg" && extensionF1 != "png" &&  extensionF1 != "gif"){ //확장자를 확인합니다.
			   			alert('파일(jpg, png, gif)만 등록 가능합니다.');
			   			$("#multiFile").val('');
			   			return;
			   		}       		
				});
				
				$(document).on("click", "#cancel", function(){
					if(confirm("취소하시겠습니까?")){
						self.close();
					}
				});
				
				$(document).on("click", ".inp_checkbox", function(){
					$(this).toggleClass('on');
					if($("#inp_file_del").is(":checked")){
						$("#inp_file_del").prop("checked", false);
						$("#multiFile").prop("disabled", true);
						//$(this).removeClass("on");
					}else{
						$("#inp_file_del").prop("checked", true);
						$("#multiFile").prop("disabled", false);
						//$(this).addClass("on");
					}
					return false;
				});
				
			</script>

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
<ui:editor objId="#EXP_REV_CTS" num="1"/>
</section>
	
	</c:otherwise>	
</c:choose>
<!--// #wrap E -->
</body>
</html>
<script>
$(document).ready(function(){
	com.pop_chk();
});
</script>