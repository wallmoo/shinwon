<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

<div id="container">
	<div id="content" class="content">

		<%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
		
		<!-- Title -->
		<div class="pg_tit_wrap">
			<h2 class="pg_tit">OOTD 등록</h2>
		</div>
		<!--// Title -->

		<div class="sub_content">

			<div class="tit-area">
				<h3 class="tits2">
					<span class="required"><em class="blind">필수 정보</em></span> 사진 등록하기
				</h3>
				<div class="tooltip-area">
					<button type="button" class="tooltip-open" title="툴팁">
						<span>?</span>
					</button>
					<!-- TOOLTIP -->
					<div class="tooltip-layer left top">
						<div class="tooltip-con">
							<div class="list">
								<ul>
									<li>OOTD에 등록할 사진을 설정할 수 있습니다.<br>
									<li>OOTD 사진은 최대 10장까지 등록할 수 있으며, 첫 번째 등록한 사진이 대표 썸네일로 자동
										설정됩니다.<br>png, jpg 포멧의 이미지 파일을 최대 10MB까지 등록할 수 있습니다.
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- //TOOLTIP -->
				</div>
			</div>

			<div class="pic_edit">
				<ul class="imgs_wrap">
					<li id="add_img"><a href="#n" id="add_img_button" class="add">등록</a></li>
				</ul>
				<span id="img_limit" class="limit">(0/10)</span>
			</div>

			<div class="tit-area">
				<h3 class="tits2">
					<span class="required"><em class="blind">필수 정보</em></span> 정보 입력
				</h3>
			</div>

			<div class="inf_edit">
				<div class="form">
					<input type="text" id="title" name="title" onkeyup="javascript:titleValidate(this)" value="" placeholder="제목 입력" title="제목 입력" maxlength="50"> 
					<span id="title_limit" class="limit">(0/50)</span>
				</div>
				<div class="form">
					<textarea id="contents" name="contents"	onkeyup="javascript:contentsValidate(this)" placeholder="내용 입력" 	maxlength="200"></textarea>
					<span id="contents_limit" class="limit">(0/200)</span>
				</div>
			</div>

			<div class="tit-area">
				<h3 class="tits2">
					<span class="required"><em class="blind">필수 정보</em></span> 태그 설정
				</h3>
			</div>
			<div class="sch-box">
				<div class="sch-box-inner">
					<div class="recom-tag-list">
						<ul id="selected_tag_containner"></ul>
					</div>
					<div class="sch-list mCustomScrollbar" tabindex="0">
						<div class="sch-list-inner">
							<ul id="tag_containner">
								<c:if test="${not empty TAG_LIST }">
									<c:forEach var="tagRow" items="${TAG_LIST}" varStatus="status">
										<c:set var="tagMstId" value="${tagRow.TAG_MST_ID }"></c:set>
										<li>
											<input class="tag_containner_checkbox" type="checkbox" id='<c:out value="${tagRow.TAG_MST_ID }" />' name="TAG_MST_ID" onchange="onChangeTagEvent(this, '${tagMstId }','${tagRow.TAG_MST_TITLE }')"name="" />
											<label for='<c:out value="${tagRow.TAG_MST_ID }" />'><span
												class="icon"></span><c:out value="${tagRow.TAG_MST_TITLE }"></c:out>
											</label>
										</li>
									</c:forEach>
								</c:if>
							</ul>
						</div>
					</div>
					<div class="btn_wrap mt30">
						<button type="button" id="selected_tag_cantainner_reset_btn" onclick="javascript:removeSelectedTagUIAll()" class="btn_large gray">초기화</button>
					</div>
				</div>
			</div>

			<div class="tit-area">
				<h3 class="tits2">희망태그 설정(선택)</h3>
			</div>
			<div class="hope-tag">
				<input type="text" id="WSH_TAG_TITLE_LIST" placeholder="희망태그 입력" title="희망태그" />
				<div class="txt">
					<p>태그로 등록하고 싶은 정보를 입력해 주세요. (#요즘감성, #유행어입력 등)</p>
					<p>희망태그는 피드검색 태그에 포함되지 않으며, 타 회원님들의 요청 빈도를 감안하여 추후 반영될 예정입니다.</p>
				</div>
			</div>

			<c:if test="${not empty OOTD_PREVILEGE_YN and OOTD_PREVILEGE_YN eq 'Y' }">
			<div class="tit-area">
				<h3 class="tits2">등록 가능한 상품(선택)</h3>
				<div class="tooltip-area">
					<button type="button" class="tooltip-open" title="툴팁">
						<span>?</span>
					</button>
					<!-- TOOLTIP -->
					<div class="tooltip-layer left top">
						<div class="tooltip-con">
							<div class="list">
								<ul>
									<li>등록할 OOTD와 관련 있는 상품을 선택해 주세요.</li>
									<li>OOTD 상품은 회원님이 구매한 상품을 최대 3개까지 등록할 수 있습니다.</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- //TOOLTIP -->
				</div>
			</div>
			
			
			
			<form id="searchForm" name="searchForm">
				<input type="hidden" id="PRD_CTG_IDX" name="PRD_CTG_IDX" />
				
				<div class="table_wrap tb_goods_edit mb40">
					<table class="tb_row">
						<caption>등록 가능한 상품 : 사유, 상세사유 입력 표입니다.</caption>
						<colgroup>
							<col style="width: 120px;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">카테고리</th>
								<td>
									<span class="select">
										<select class="w330" id="searchPrdCtgDepth1" name="searchPrdCtgDepth1">
												<option value="">1차 카테고리 선택</option>
													<c:if test="${not empty listGnbMenu }">
														<c:forEach var="row" items="${listGnbMenu }">
															<c:if test="${row.PRD_CTG_LEVEL eq 1 }">
																<option value='<c:out value="${row.PRD_CTG_IDX }"></c:out>'><c:out value="${row.PRD_CTG_NM }"></c:out></option>
															</c:if>
														</c:forEach>
													</c:if>	
										</select>
									</span>
									<span class="select">
										<select id="searchPrdCtgDepth2" name="searchPrdCtgDepth2" class="w330" title="2차 카테고리 선택" >
											<option value="">2차 카테고리 선택</option>
										</select>
									</span>
									<span class="select">
										<select id="searchPrdCtgDepth3" name="searchPrdCtgDepth3" class="w330" title="3차 카테고리 선택">
											<option value="">3차 카테고리 선택</option>
										</select>
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row">상품명</th>
								<td>
									<input type="text" id="PRD_MST_NM" name="searchPrdMstNm" value="" title="상품명" placeholder="상품명 입력" >
								</td>
							</tr>
								<tr>
								<th scope="row">상품품번</th>
								<td>
									<textarea class="text_area" name="searchPrdMstCd" title="상품품번" placeholder="상품품번 입력"></textarea>
								</td>
							</tr>
	
						</tbody>
					</table>
					<div class="btn_wrap">
						<button type="button" onclick="ootdProductSeachBtn()" class="btn_large gray">검색</button>
					</div>
				</div>
			</form>
			</c:if>

			<div class="goods_edit">
				<ul id="product_container">
					<c:forEach var="productRow" items="${OOTD_PRD_LIST }" varStatus="i">
						<li>
							<div class="goods_img">
								<img src="<c:out value="${cdnDomain}"/><c:out value="${productRow.PRD_IMAGE}"/>" alt="<c:out value="${productRow.PRD_IMAGE_ALT }"/>">
							</div>
							<div class="goods_detail">
								<div class="sort_tag_area clearboth">
									<span class="sort"><c:out value="${productRow.BND_MST_BRAND_NM }"/></span>
									<span class="tag"><c:out value="${productRow.TAG_MST_TITLE }"/></span>
								</div>
								<p class="goods_title">
									<c:out value="${productRow.PRD_MST_NM }"></c:out>
								</p>
							</div>
							<div class="goods_chk">
								<input type="checkbox" value="${productRow.PRD_MST_CD}" id="${productRow.PRD_MST_CD}">
								<label for="${productRow.PRD_MST_CD}"><span class="icon"></span>등록하기</label>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>

			<div class="attention_list_wrap mt95">
				<strong class="tit">유의사항</strong>
				<ul>
					<li>OOTD는 패션 정보를 공유하는 커뮤니티 공간입니다. 적절하지 않은 콘텐츠를 등록하실 경우 서비스
						이용약관에 따라 사전 경고없이 게시물이 삭제될 수 있습니다.</li>
				</ul>
			</div>
			<div class="btn_wrap">
				<button type="button" onclick="javascript:cansleBtnClick()" class="btn_large gray">취소</button>
				<button type="button" id="goRegist" class="btn_large ok">등록</button>
			</div>
		</div>
	</div>
</div>

<form id="ootd_form" method="post" enctype="multipart/form-data">
	<input type="hidden" name="CNT_MST_TITLE" />
	<input type="hidden" name="CNT_MST_DESC" />
	<input type="file" id="OOTD_IMAGE_LIST" name="file" accept=".jpg, .png" style="display: none" />
	<input type="hidden" name="tagData" />
	<input type="hidden" name="WSH_TAG_TITLE_LIST" />
	<input type="hidden" name="PRD_MST_CD" />
	
</form>

<script src="<c:out value="${cdnDomain}" />/pc/js/vendor/jquery.tmpl.min.js"></script>
<script id="productItemTemplate" type="text/x-jquery-tmpl">
<li>
<div class="goods_img">
	<img src="<c:out value="${cdnDomain}"/>\${PRD_IMAGE}" alt="\${PRD_IMAGE_ALT}">
</div>
<div class="goods_detail">
	<div class="sort_tag_area clearboth">
		<span class="sort">\${PRD_MST_BRAND_NM }</span>
		<span class="tag">\${TAG_MST_TITLE }</span>
	</div>
	<p class="goods_title">
		\${PRD_MST_NM }
	</p>
</div>
<div class="goods_chk">
	<input type="checkbox" value="\${PRD_MST_CD}" id="\${PRD_MST_CD}">
	<label for="\${PRD_MST_CD}"><span class="icon"></span>등록하기</label>
</div>
</li>
</script>
<script>
	// 이미지 정보들을 담을 배열
	var selFiles = [];
	
	$(document).ready(function() {
		
	    // 카테고리 설정
		$(document).on("change", "#searchPrdCtgDepth1", function (){
			getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
			getCategoryList("searchPrdCtgDepth3", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
		});
	    
		$(document).on("change", "#searchPrdCtgDepth2", function (){
			getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgEnv option:selected").val());
		});

		uiBind();
		
		$("#goRegist").on("click", function() {
			if (selFiles.length == 0){
 				alert("[사진]은 1개이상 선택 해주세요.");
 				$("#OOTD_IMAGE_LIST").focus();
 				return;
 			}
		
 			if ($.trim($("#title").val()) == ""){
 				alert("[제목]반드시 입력해주세요.");
 				$("#title").focus();
 				return;
 			}

 			if ($.trim($("#contents").val()) == ""){
 				alert("[내용]반드시 입력해주세요.");
 				$("#contents").focus();
 				return;
 			}
			
 			if($('input[name=TAG_MST_ID]:checked').length < 1){
 				alert('태그 설정은 반드시 1개이상 체크 해주세요');
 				$('#tag_containner').focus();
 				return;
 			}
 			
			var tags = splitTags($("#WSH_TAG_TITLE_LIST").val());
			if(!validateTag(tags)){
				$("#WSH_TAG_TITLE_LIST").focus();
				return;
			}
			
			var tagList = [];
			if(tags != null){
				$.each(tags, function(index, item){
					tagList.push("#"+item);
				});	
			}
			var prdMstIdxs = [];
			$("#product_container input:checked").each(function(){
				prdMstIdxs.push($(this).val());
			});
			
			if(prdMstIdxs.length<1){
				alert('1개 이상의 상품을 선택해야합니다.');
				$("#product_container").focus();
				return;
			}
			
			$("input[name=tagData]").val(getSelectedTagIDList()); 
			$("input[name=WSH_TAG_TITLE_LIST]").val(JSON.stringify(tagList));	
			$("input[name=CNT_MST_TITLE]", ootdForm).val($("#title").val());
			$("input[name=CNT_MST_DESC]", ootdForm).val($("#contents").val());
			$("input[name=PRD_MST_CD]", ootdForm).val(JSON.stringify(prdMstIdxs));
			ootdImageList.files = selFiles;
			
 			$(ootdForm).attr({"action":"/pc/ootd/ootdRegist.do", "target":"_self", "method":"post"}).submit();
		});

		$("#add_img_button").on("click", function() {
			var inputMultiFile = $("#OOTD_IMAGE_LIST");
			inputMultiFile.click();
		});

		$('#OOTD_IMAGE_LIST').bind('change',function(event) {

			var fileSise1 = this.files[0].size;
			var file1 = $("#OOTD_IMAGE_LIST").val();

			var extensionF1 = file1;

			//파일을 추가한 input 박스의 값
			extensionF1 = extensionF1.slice(extensionF1.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.

			if (fileSise1 > 10485760) {
				alert('파일 용량(10MB)만 등록 가능합니다.');
				$("#OOTD_IMAGE_LIST").val('');
				return;
			}

			if (extensionF1 != "jpg" && extensionF1 != "png") {
				//확장자를 확인합니다.
				alert('파일(jpg, png)만 등록 가능합니다.');
				$("#OOTD_IMAGE_LIST").val('');
				return;
			}
			
			handleImgFileSelet(event);

		});
	});
	
	getCategoryList = function(obj, upIdx, selectIdx, serverDomain, env){
		
        var title = "1차 카테고리";
        
        if(obj.indexOf("2") > -1)
        {
            title = "2차 카테고리";
        }
        if(obj.indexOf("3") > -1)
        {
            title = "3차 카테고리";
        }
        
        if(env==null || env==' ') env='P';
        
        $.ajax({
            type    : "POST",
            url     : serverDomain + "/pc/product/subCategoryProductAjax.do",
            data    :  { "PRD_CTG_IDX":upIdx, "PRD_CTG_ENV":env},
            dataType : "JSON",
            async   : false,
            success : function(data)
            {
                var selected = "";
                $("#"+obj).empty().append("<option value=''>"+title+"</option>");
                $.each(data.categoryList, function(i,item) 
                {
                    if (item.PRD_CTG_IDX == selectIdx)
                    {
                        selected = "selected";
                    } 
                    else 
                    {
                        selected = "";
                    }
                    $("#"+obj).append("<option value='"+item.PRD_CTG_IDX+"' "+selected+">"+item.PRD_CTG_NM+"</option>");
                });

            },
            error   : function(xhr,status,error)
            { 
                alert("상품 카테고리 호출 중 에러가 발생하였습니다.");
                //alert("code:"+xhr.status); 
            }
        });
    };

	
	//태그 설정 값
	function getSelectedTagData(){
		
		var checkData;
		tagContainnerCheckbox.each(function(){
			if(this.checked){
				checkData += this.value + ",";
			}
		});
		
		return checkData;
	}
	// 이미지 파일 미리보기
	function handleImgFileSelet(e) {

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		var selFileSize;
		
		filesArr.forEach(function(f) {

			selFiles.push(f);
			selFileSize = selFiles.length;
			var reader = new FileReader();
	
			reader.onload = function(e) {
					//imgTag 생성
					var html = "";
					html += "<li id='ootd_image_container_id"+selFileSize+"'><img src='" + e.target.result + "' alt=''><a href='#n' onclick='delImg("+ selFileSize + ")' class='del'>삭제</a></li>";
					$(".imgs_wrap>li").last().before(html);
				}
				reader.readAsDataURL(f);
			});

		imgCountInfo(selFileSize);
	}
	
	// 이미지 파일 삭제
	function delImg(imageId) {
		$("#add_img").show();
		$("#ootd_image_container_id" + imageId).remove();
		selFiles.pop();
		--imageId;
		ootdImageList.val("");
		imgCountInfo(imageId);
	}

	// 이미지 수 현황정보 표시
	function imgCountInfo(size) {

		var imgLimitDlsplayElem = $("#img_limit");
		var hide = false;
		var color = "#666";
		var imgHiddenElem = $("#add_img");

		if (size == 10) {
			color = "#FF0000"
			hide = true;
			imgCountDisplay(imgLimitDlsplayElem, size, 10, color, hide, imgHiddenElem);
		} else {
			imgCountDisplay(imgLimitDlsplayElem, size, 10, color, hide, imgHiddenElem);
		}
	}
	
	function imgCountDisplay(elem, count, maxSize, color, hideYN, imgelem){
		elem.css("color", color);
		elem.text("(" + count + "/" + maxSize + ")");
		if(hideYN){
			imgelem.hide();
		}else{
			imgelem.show();
		}
	}

	
	// UI 바인딩
	var selectedTagContainer;
	var tagContainner;
	var titleLimit;
	var contentsLimit;
	var wishTagForm;
	var whishTagTitle;
	var tagContainnerCheckbox;
	var ootdForm;
	var tagForm;
	var title, contents, ootdImageList, prd1, prd2, prd3;
	var firstLevelCategory;
	var secondLevel1Category;
	var secondLevel2Category;

	function uiBind() {
		selectedTagContainer = $("#selected_tag_containner");
		tagContainner = $("#tag_containner");
		titleLimit = $("#title_limit");
		contentsLimit = $("#contents_limit");
		wishTagForm = $("#wish_tag_form");
		whishTagTitle = $("#wish_tag_title");
		ootdForm = $("#ootd_form");
		tagForm = $("#tag_form");
		title = $("#title");
		contents = $("#contents");
		ootdImageList = $("#OOTD_IMAGE_LIST");
		tagContainnerCheckbox = $("input[name='TAG_MST_ID']");
		firstLevelCategory = $("#first_level_category");
		secondLevel1Category = $("#second_level1_category");
		secondLevel2Category = $("#second_level2_category");
	}
	
	// OOTD 등록 가능한 상품 검색
	function ootdProductSeachBtn() {
		
		var $searchForm = $("#searchForm"); 
		
		// 상품 카테고리 검색 조건
		var searchCategoryIdx = "";
		var tempCategoryIdx = "";
		
		tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth1 option:selected").val();
		if (tempCategoryIdx != ''){
			searchCategoryIdx = tempCategoryIdx;
		}
		
		tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth2 option:selected").val();
		if (tempCategoryIdx != ''){
			searchCategoryIdx = tempCategoryIdx;
		}
		
		tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth3 option:selected").val();
		if (tempCategoryIdx != ''){
            searchCategoryIdx = tempCategoryIdx;
        }
		
		if(searchCategoryIdx.length <= 0) {
			alert('카테고리를 입력하셔야 합니다.');
			return;
		}
		$searchForm.find("#PRD_CTG_IDX").val(searchCategoryIdx);
		
		
		$.ajax({
			async : false,
			type : "post",
			data : $searchForm.serialize(),
			url : "/pc/ootd/ootdSearchProductAjax.do",
			success : function(data) {
				if(data.productList ==  null || data.productList.length <= 0) {
					alert('검색 결과가 없습니다.');
				} else {
					renderProductList(data.productList);
				}
				
			},
			error : function(err) {
				alert('검색을 실패 했습니다.');
			}
		});
	}
	
	function renderProductList(productList){
		
		if(productList == null){ return; }
		$("#product_container").empty();
		$("#productItemTemplate").tmpl( productList ).appendTo("#product_container");
	}
	
	// 태그 인풋 이벤트
	function onChangeTagEvent(elem, id, title) {

		if (elem.checked) {
			addSelectedTagUI(id, title);
		} else {
			removeSelectedTagUI(id);
		}
	}

	// 태그 화면 추가
	function addSelectedTagUI(id, title) {
		var ui = "<li id='selected_tag_item_"+id+"'><strong>"+ title+ "</strong><button type='button' class='btn-del' onclick=javascript:removeSelectedTagUI('"+ id + "')><span>삭제</span></button></li>";
		selectedTagContainer.append(ui);
	}

	function getSelectedTagIDList(){
		
		var selectedTagUIList = selectedTagContainer.children('li');
		var selectedTagIDList = new Array();
		for(var index=0; index< selectedTagUIList.length; index++){
			var id =	selectedTagUIList[index].getAttribute('id').replace("selected_tag_item_", "");
			selectedTagIDList.push(id);
		}
		
		return JSON.stringify(selectedTagIDList);
	}
	
	// 태그 화면 삭제
	function removeSelectedTagUI(id) {
		selectedTagContainer.find("#selected_tag_item_" + id).remove();
		tagContainner.find("#" + id).prop("checked", false);
	}

	// 태그 초기화 버튼
	function removeSelectedTagUIAll() {
		selectedTagContainer.empty();
		tagContainner.children().find("input[type='checkbox']").attr('checked', false);
	}

	function textCountDisplay(ui, currentCount, maxCount) {
		ui.text("(" + currentCount + "/" + maxCount + ")");
	}

	// 제목 입력자수 현황정보
	function titleValidate(elem) {
		textCountDisplay(titleLimit, elem.value.length, 50);
	}

	// 내용 입력자수 현황정보
	function contentsValidate(elem) {
		textCountDisplay(contentsLimit, elem.value.length, 200);
	}
	
	// 취소버튼
	function cansleBtnClick(){
		if(confirm("OOTD 등록을 취소하시겠습니까?")){
			location.href = "/pc/main/index.do";
		}
	}
	
	function splitTags(tagInput){
		if(tagInput == null|| tagInput==""){return null;}
		
		return tagInput.split(/,|#| /).filter(function(item){return item!="";});
	}
	var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	function validateTag(tag){
		if(tag == null || tag == ""){return true;}
		if( special_pattern.test(tag) == true ){
		    return false;
		}
		return true;
	}
</script>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

