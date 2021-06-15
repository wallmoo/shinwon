\<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->
			<form id="dataForm" name="dataForm" method="post">
				<!-- <input type="hidden" name="certType" id="certType" value="<c:out value="${commandMap.certType }"/>"/>
				<input type="hidden" name="MEM_IPN_DI" id="MEM_IPN_DI" value="<c:out value="${commandMap.MEM_IPN_DI }"/>"/>
				<input type="hidden" name="MEM_MST_MEM_NM" id="MEM_MST_MEM_NM" value="<c:out value="${commandMap.MEM_MST_MEM_NM }"/>"/>
				<input type="hidden" name="MEM_IPN_FGN" id="MEM_IPN_FGN" value="<c:out value="${commandMap.MEM_IPN_FGN }"/>"/>
				<input type="hidden" name="MEM_IPN_SEX" id="MEM_IPN_SEX" value="<c:out value="${commandMap.MEM_IPN_SEX }"/>"/>
				<input type="hidden" name="MEM_IPN_BIR_DT" id="MEM_IPN_BIR_DT" value="<c:out value="${commandMap.MEM_IPN_BIR_DT }"/>"/>
				<input type="hidden" name="MEM_IPN_RST" id="MEM_IPN_RST" value="<c:out value="${commandMap.MEM_IPN_RST }"/>"/>
				<input type="hidden" name="MEM_IPN_CRT_DT" id="MEM_IPN_CRT_DT" value="<c:out value="${commandMap.MEM_IPN_CRT_DT }"/>"/>
				<input type="hidden" name="MEM_IPN_BIR_SOLAR" id="MEM_IPN_BIR_SOLAR" value=""/>
				<input type="hidden" name="MEM_SNS_TYPE" id="MEM_SNS_TYPE" value="${commandMap.MEM_SNS_TYPE}" />       
                <input type="hidden" name="MEM_SNS_ID" id="MEM_SNS_ID" value="${commandMap.MEM_SNS_ID}" />       
                <input type="hidden" name="MEM_SNS_NM" id="MEM_SNS_NM" value="${commandMap.MEM_SNS_NM}" />                           
                <input type="hidden" name="MEM_SNS_EMAIL" id="MEM_SNS_EMAIL" value="${commandMap.MEM_SNS_EMAIL}" /> -->
                <input type="hidden" name="double_submit_token" id="double_submit_token" value="${double_submit_token}"/>
			    <c:forEach var="type" items="${commandMap}">
				   <input type="hidden" name="${type.key}" id="${type.key}" value="${type.value}"/>
				</c:forEach>
            </form>
			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">피드설정</h2>
			</div>
			<!--// Title -->
			<%-- <%=request.getAttribute("tagList") %> --%>
			<div class="sub_content">
				<div class="join_step">
					<ol>
						<li><span>STEP 01 <strong>약관동의</strong></span></li>
						<li><span>STEP 02 <strong>정보입력</strong></span></li>
						<li class="on"><span>STEP 03 <strong>피드설정</strong></span></li>
						<li><span>STEP 04 <strong>가입완료</strong></span></li>
					</ol>
				</div>

				<div class="tit-area">
					<h3 class="tits2">태그선택</h3>
					<div class="tooltip-area">
						<button type="button" class="tooltip-open" title="툴팁"><span>?</span></button>
						<!-- TOOLTIP -->
						<div class="tooltip-layer left top">
							<div class="tooltip-con">
								<div class="list">
									<ul>
										<li>설정한 태그 정보를 기준으로 상품정보가 제공되며,  [마이페이지 &gt; 피드관리]에서 변경하실 수 있습니다.</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- //TOOLTIP -->
					</div>
				</div>
				<div class="sch-box">
					<div class="sch-box-inner">
						<!-- 피드를 선택하지 않았을 경우 디폴트 -->
						<div class="txt">
							<p>태그를 선택해 주세요 (필수선택 2개)</p>
						</div>
						<!-- 피드를 선택하였을 경우 -->
						<div class="recom-tag-list">
							<ul id="currentList">
							</ul>
						</div>
						<div class="sch-list mCustomScrollbar" tabindex="0">
							<div class="sch-list-inner">
								<ul id="tagContainer">
									<c:forEach var="item" items="${tagList}" varStatus="i">
										<li><input type="checkbox" id="check-${i.index}" name="checkbox" value="${item.TAG_MST_ID}"/><label for="check-${i.index}" ><span class="icon"></span>${item.TAG_MST_TITLE.substring(1)}</label></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="btn_wrap">
							<button class="btn_large gray" id="resetBtn">초기화</button>
						</div>
					</div>
				</div>

				<div class="tit-area">
					<h3 class="tits2">희망태그입력</h3>
				</div>
				<div class="hope-tag">
					<input type="text" id="wishTagList" name="wishTagList" value="" placeholder="희망태그 입력" title="희망태그" />
					<div class="txt">
						<p>태그로 등록하고 싶은 정보를 입력해 주세요. (#요즘감성, #유행어입력 등)</p>
						<p>희망태그는 피드검색 태그에 포함되지 않으며, 타 회원님들의 요청 빈도를 감안하여 추후 반영될 예정입니다.</p>
					</div>
				</div>

				<div class="tit-area">
					<h3 class="tits2">스타일정보입력</h3>
					<div class="tooltip-area">
						<button type="button" class="tooltip-open" title="툴팁"><span>?</span></button>
						<!-- TOOLTIP -->
						<div class="tooltip-layer left top">
							<div class="tooltip-con">
								<div class="list">
									<ul>
										<li>스타일 정보는 상품 및 콘텐츠 제공을 위한 정보로 활용되며, [마이페이지 &gt; 마이핏관리]에서 변경하실 수 있습니다.</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- //TOOLTIP -->
					</div>
				</div>
				<div class="table_wrap">
					<table class="tb_row">
						<caption>스타일정보입력 : 직업, 키, 몸무게 입력 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">직업</th>
								<td>
									<span class="select">
										<select id="select1" class="w284">
											<option selected="selected">선택</option>
											<option>주부</option>
											<option>자영업</option>
											<option>사무직</option>
											<option>생산/기술직</option>
											<option>판매직</option>
											<option>보험업</option>
											<option>은행/증권업</option>
											<option>전문직</option>
											<option>공무원</option>
											<option>농축산업</option>
											<option>학생</option>
											<option>기타</option>
										</select>
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 키</th>
								<td><input type="number" id="height" name="height" placeholder="키 입력 (cm)" class="w284"></td>
							</tr>
							<tr>
								<th scope="row"><span class="required"><em class="blind">필수 정보</em></span> 몸무게</th>
								<td><input type="number" id="weight" name="weight" placeholder="몸무게 입력 (kg)" class="w284"></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="btn_wrap">
					<button class="btn_large" id="bkBtn">이전</button>
					<button class="btn_large ok" id="goBtn">다음</button>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
	//태그 추가
	$("input[type=checkbox]").each(function(index,item){
		$(item).click(function(){
			var contents = $("label[for='"+item.id+"']").text()
			if(item.checked){
				$("#currentList").append('<li id="' + item.id + '" ><strong>#' + contents+ ' </strong><button type="button" class="btn-del" id="'+ item.id+'"><span>삭제</span></button></li>')
			}
		})
	
	})
	//태그 삭제
	 $(document).on("click", ".btn-del", function() {
	 	$(this).parent().remove();
	 	$("#tagContainer").children().find("input[id='" + this.id + "']").attr('checked', false);
	 	
	 });
	//초기화 버튼
	$("#resetBtn").on("click",function(){
		$(".btn-del").parent().remove();
		$("#tagContainer").children().find("input[type='checkbox']").attr('checked', false);
	})
	
	

	$("#bkBtn").on("click",function(){
		//location.href = "/pc/member/joinMemStep3.do";
		history.back();
	});

	$("#goBtn").on("click",function(){
		//if(!validateTag()) return;
		//if(!validateStyleInfo()) return;
		register();
	});
	
	
</script>
<script>
	function getSelectedTag(){
		var tagList = [];
		var selectedTagList = $("input:checkbox[name=checkbox]:checked");
		
		if(selectedTagList.length<2){
			return;
		}
		else
		{
			$(selectedTagList.each(function (index,item) {
				var tagId = $(this).val();
				tagList.push({
					TAG_MST_ID:tagId,
					TAG_BND_STATUS:'USE',
					TAG_BND_REP:'Y',
					TAG_BND_TYPE:'TYPE_MEMBER'
				});
			}));
			return JSON.stringify(tagList);
		}
	}
	
	
	/* function validateStyleInfo(){
		if($("#weight").val()!="" && $("#height").val()!="") return true;
		else if($("#height").val()=="") $("#height").focus();
		else $("#weight").focus();
		return false;
	} */
	/* function validateTag(){
		if($("input:checkbox[name=checkbox]:checked").length>=2) return true;
		else false;
	} */
	//희망태그 -> JSON
	function registTagTitle(tagVal) {
		var regexp = "/[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\$%&\\\=\(\'\"]/gi";
		var tagObj = tagVal.replace(regexp, "").replace(/ /g, "").split("#");
		var result = JSON.stringify(tagObj);
		if(tagObj.length>1){
			tagObj.splice(0,1);
		}
		return tagObj;
	}
	
	/* $(document).on("click", "#goBtn", function () {
		var $frm = $("#dataForm");
		if($frm.valid()){
			var job = $("#select1 option:selected");
			var height = $("#height");
			var weight = $("#weight");
			
			if($("#select1 option:selected").text() == "선택"){
        		alert("브랜드명 카테고리를 확인해 주십시오.")
        		$("#select1").focus()
        		return;
        	}
			
		}
	}); */
	
	function register(){
		var $frm = $("#dataForm");
		var selectedTagList = $("input:checkbox[name=checkbox]:checked");
		if(selectedTagList.length<2){
			alert('2개이상 태그를 선택해 주세요');
			$('input:checkbox[name=checkbox]').focus();
			return;
		}
		if($("#height").val() == "" ){
    		alert("키(cm)를 입력해주세요.")
    		$("#height").focus()
    		return;
    	}
		if($("#weight").val() == "" ){
    		alert("몸무게(kg)를 입력해주세요.")
    		$("#weight").focus()
    		return;
    	}
		
		var tagList = getSelectedTag();
		var job = $("#select1 option:selected").val();
		var height = $("#height").val();
		var weight = $("#weight").val();
		var wishTag = $("#wishTagList").val();
		$('#dataForm').append('<input type="hidden" id="MEM_MST_STY_JOB" name="MEM_MST_STY_JOB" value="'+job+'"/>');
		$('#dataForm').append('<input type="hidden" id="MEM_MST_STY_HEIGHT" name="MEM_MST_STY_HEIGHT" value="'+height+'"/>');
		$('#dataForm').append('<input type="hidden" id="MEM_MST_STY_WEIGHT" name="MEM_MST_STY_WEIGHT" value="'+weight+'"/>');
		$('#dataForm').append('<input type="hidden" id="TAG_LIST" name="TAG_LIST" value=\''+tagList+'\'/>');
		$('#dataForm').append('<input type="hidden" id="WSH_TAG_TITLE_LIST" name="WSH_TAG_TITLE_LIST" value="'+wishTag+'"/>');
		$("#dataForm").attr({"action":"/pc/member/joinMemberRegist.do", "target":"_self", "method":"post"}).submit();
	}
</script>
