<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	<div id="container">
	    <div id="content" class="content">
			<%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
	        <!-- Title -->
	        <div class="pg_tit_wrap">
	            <h2 class="pg_tit">BRAND</h2>
	        </div>
	        <!--// Title -->
	
	        <div class="sub_content product">
	            <div class="tit-area">
	                <h3 class="tits2">TOP BRAND</h3>
	            </div>
	
	        <!-- 브랜드 메인화면(상단) -->
			<div class="top_brand">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<c:if test="${not empty topBrandList }">
							<c:forEach var="topRow" items="${topBrandList}"	varStatus="status">
								<div class="swiper-slide">
									<div class="img_box">
										<a href="javascript:goPage('${topRow.BND_MST_IDX }')">
											<img src="${cdnDomain }${topRow.IMG_THUMBNAIL}" alt="${topRow.CMN_FLE_ALT_TXT }">
											<div class="img_desc">
												<div class="inner">
													<strong class="tit"><c:out value="${topRow.BND_MST_BRAND_NM }" /></strong>
													<p><c:out value="${topRow.BND_MST_DTL }" /></p>
												</div>
											</div>
										</a>
									</div>
									<strong><c:out value="${topRow.BND_MST_BRAND_NM }" /></strong>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<!-- Add Pagination -->
				<div class="swiper-pagination"></div>
			</div>
			
			<div class="tit-area mt200">
				<h3 class="tits2">SHINWON’S PICK</h3>
			</div>
			<div class="shinwon_pick">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<c:if test="${not empty shinwonPickList }">
							<c:forEach var="pickRow" items="${shinwonPickList}"	varStatus="status">
								<div class="swiper-slide">
									<a href="javascript:goPage('${pickRow.BND_MST_IDX }')">
									 	<img src="${cdnDomain }${pickRow.IMG_THUMBNAIL }" alt="${pickRow.CMN_FLE_ALT_TXT }">
										<strong><c:out value="${pickRow.BND_MST_BRAND_NM }" /></strong>
									</a>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>
			</div>
			<!--//브랜드 메인화면(상단) -->
	
	            <!-- 브랜드 메인화면(하단) 영역 -->
			<div class="tit-area mt200">
				<h3 class="tits2">BRAND LIST</h3>
			</div>
			<div class="detail_search">
				<div class="sch-box show" id="selectBrandContainner">
					<div class="type_item">
						<h3>가나다순</h3>
						<div class="inner">
							<div class="initial_btn">
	                            <button name="typeKor" class="btn_small" value="ㄲ" >ㄲ</button>
                                <button name="typeKor" class="btn_small" value="ㄱ" >ㄱ</button>
                                <button name="typeKor" class="btn_small" value="ㄴ" >ㄴ</button>
                                <button name="typeKor" class="btn_small" value="ㄸ" >ㄸ</button>
                                <button name="typeKor" class="btn_small" value="ㄷ" >ㄷ</button>
                                <button name="typeKor" class="btn_small" value="ㄹ" >ㄹ</button>
                                <button name="typeKor" class="btn_small" value="ㅁ" >ㅁ</button>
                                <button name="typeKor" class="btn_small" value="ㅃ" >ㅃ</button>
                                <button name="typeKor" class="btn_small" value="ㅂ" >ㅂ</button>
                                <button name="typeKor" class="btn_small" value="ㅆ" >ㅆ</button>
                                <button name="typeKor" class="btn_small" value="ㅉ" >ㅉ</button>
                                <button name="typeKor" class="btn_small" value="ㅅ" >ㅅ</button>
                                <button name="typeKor" class="btn_small" value="ㅇ" >ㅇ</button>
                                <button name="typeKor" class="btn_small" value="ㅉ" >ㅉ</button>
                                <button name="typeKor" class="btn_small" value="ㅈ" >ㅈ</button>
                                <button name="typeKor" class="btn_small" value="ㅊ" >ㅊ</button>
                                <button name="typeKor" class="btn_small" value="ㅋ" >ㅋ</button>
                                <button name="typeKor" class="btn_small" value="ㅌ" >ㅌ</button>
                                <button name="typeKor" class="btn_small" value="ㅍ" >ㅍ</button>
                                <button name="typeKor" class="btn_small" value="ㅎ" >ㅎ</button>
                                <button name="typeKor" class="btn_small" value="기타" >기타</button>
                            </div>
						</div>
					</div>
					<div class="type_item">
						<h3>알파벳순</h3>
						<div class="inner">
							<div class="initial_btn">
                                    <button name="typeEng" class="btn_small" value="A">A</button>
                                    <button name="typeEng" class="btn_small" value="B">B</button>
                                    <button name="typeEng" class="btn_small" value="C">C</button>
                                    <button name="typeEng" class="btn_small" value="D">D</button>
                                    <button name="typeEng" class="btn_small" value="E">E</button>
                                    <button name="typeEng" class="btn_small" value="F">F</button>
                                    <button name="typeEng" class="btn_small" value="G">G</button>
                                    <button name="typeEng" class="btn_small" value="H">H</button>
                                    <button name="typeEng" class="btn_small" value="I">I</button>
                                    <button name="typeEng" class="btn_small" value="J">J</button>
                                    <button name="typeEng" class="btn_small" value="K">K</button>
                                    <button name="typeEng" class="btn_small" value="L">L</button>
                                    <button name="typeEng" class="btn_small" value="M">M</button>
                                    <button name="typeEng" class="btn_small" value="N">N</button>
                                    <button name="typeEng" class="btn_small" value="O">O</button>
                                    <button name="typeEng" class="btn_small" value="P">P</button>
                                    <button name="typeEng" class="btn_small" value="Q">Q</button>
                                    <button name="typeEng" class="btn_small" value="R">R</button>
                                    <button name="typeEng" class="btn_small" value="S">S</button>
                                    <button name="typeEng" class="btn_small" value="T">T</button>
                                    <button name="typeEng" class="btn_small" value="U">U</button>
                                    <button name="typeEng" class="btn_small" value="V">V</button>
                                    <button name="typeEng" class="btn_small" value="W">W</button>
                                    <button name="typeEng" class="btn_small" value="X">X</button>
                                    <button name="typeEng" class="btn_small" value="Y">Y</button>
                                    <button name="typeEng" class="btn_small" value="Z">Z</button>
                                    <button name="typeEng" class="btn_small" value="ETC">ETC</button>
                                </div>
						</div>
					</div>
					<div class="type_item">
						<h3 class="category_open">카테고리<button type="button" class="btn_open">카테고리 열림</button></h3>
						<div class="inner">
							<div class="category_item">
								<c:forEach var="listGnbMenu" items="${listGnbMenu}"	varStatus="i">
									<div class="category mCustomScrollbar">
										<p>
											<!--  <input name="searchOneDepth" onchange="searchOneDepth" type="checkbox" id="oneDepthCategroy-${listGnbMenu.PRD_CTG_IDX}">-->
											 <label for="${listGnbMenu.PRD_CTG_IDX}"><span	class="icon"></span><c:out value="${listGnbMenu.PRD_CTG_NM}" /></label>
										</p>
										<ul>
											<c:if test="${not empty listGnbMenu.child }">
												<c:forEach var="secondDepthCategroy" items="${listGnbMenu.child}">
													<li>
														<input name="search_category" type="checkbox" id="${secondDepthCategroy.PRD_CTG_IDX}" value="${secondDepthCategroy.PRD_CTG_IDX}">
														<label for="${secondDepthCategroy.PRD_CTG_IDX}"><span class="icon"></span><c:out value="${secondDepthCategroy.PRD_CTG_NM}" /></label>
													</li>
												</c:forEach>
											</c:if>
										</ul>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="btn_wrap" >
						<button onclick="javascript:removeSelected();" class="btn_large gray">초기화</button>
						<button onclick="searchBrandListAjax()" class="btn_large ok">적용</button>
					</div>
				</div>
			</div>

			<div class="brand_wrap">
                <p class="total" id="allBrandCount">Total BRAND (0)</p>
                <div class="brand_initial" id="brandListContainer">
                </div>
            </div>
            <!--//브랜드 메인화면(하단) 영역 -->
	        </div>
	    </div>
	</div>
	
	<form id="pageForm" name="pageForm" method="get">
	<input type="hidden" id="BND_MST_IDX" name="BND_MST_IDX" value="">	
	</form>
	
	<form id="pageForm2" name="pageForm2" method="post">
	<input type="hidden" id="BND_MST_IDX" name="BND_MST_IDX" value="">
	</form>	

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
<input type='hidden' id="brandList" value='${JsonUtil.getJsonArrayFromList(brandList)}'>


<script>
	$(document).ready(function(){
		
		var brandListOrigin = '';
		if($("#brandList").val().length > 0)
			brandListOrigin = JSON.parse($("#brandList").val());

		var displayBrandListWithGroup = [];
		
		brandBnrSwipe(); //TOP BRAND 스와이프 호출
		pickBnrSwipe(); //SHINWON’S PICK 스와이프 호출
		
		removeSelected = function(){
			$(".btn_small").each(function(){
				$(this).removeClass("on");
			});
			$("input[name='search_category']:checked").each(function(){
				$(this).prop("checked", false);
			});
			searchBrandListAjax();
			//initBrandListWithGroup(brandListOrigin);
		}
		
		getSearchWord = function(name){
			var checkedList = $("button[name="+name+"].on");
			var filterData = [];
			for(var index = 0; index < checkedList.length; index++){
				filterData.push(checkedList[index].value);
			}
			return filterData;
		}
		getSearchCategory = function(){
			var checkedList = $("input[name='search_category']:checked");
			var filterData = [];
			for(var index = 0; index < checkedList.length; index++){
				filterData.push(checkedList[index].value);
			}
			return filterData;
		}

		$(function(){
			/* $(".btn_small").on("click", function(){
				var checkedList = $(".btn_small.on");
				var filterData = [];
				for(var index = 0; index < checkedList.length; index++){
					filterData.push(checkedList[index].value);
				}
				filterWithKor(filterData);
			}); */
		});
		    
		filterWithKor = function(jamo){
			
			if(jamo == null || jamo.length < 1){
				renderBrandList(brandListOrigin);
				return;
			}
			var filterWithKorBrandList = [];
			for(var index = 0; index < jamo.length; index++){
				var findItem = displayBrandListWithGroup.find(function(item){
					return item.groupName === jamo[index];
				});
				if(findItem == null || findItem == undefined){
					continue;
				}
				filterWithKorBrandList = filterWithKorBrandList.concat(findItem.brandList);	
			}
			
			renderBrandList(filterWithKorBrandList);
		}
		
	 	filterWithCategory = function(categorys){
	 		var oneDepthCategroy;
	 	}
	 	
	 	//한글초성그룹
		groupWithKor = function(brandList){
	 	
			var rCho = ["ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"];
			
			var cho, jung, jong;
			var chosungList = [];
			for(var index = 0; index < brandList.length; index++){
				var nTmp = brandList[index].BND_MST_BRAND_NM.charCodeAt(0) - 0xAC00;
				jong = nTmp % 28;
				jung = ( (nTmp-jong ) / 28 ) % 21; // 중성
				cho=( ( (nTmp-jong ) / 28 ) - jung ) / 21; // 종성
				rCho[cho];
				var chosungIndex = chosungList.findIndex(function(item){return item.groupName == rCho[cho];}); 
				if(chosungIndex < 0){
					chosungIndex = chosungList.length;
					var groupItem = {};
					groupItem.groupName = rCho[cho];
					if(groupItem.groupName == undefined){
						continue;
					}
					chosungList.splice(chosungIndex, 0, groupItem);
				}
				
				if(chosungList[chosungIndex].brandList == null || chosungList[chosungIndex].brandList == "undefined"){
					chosungList[chosungIndex].brandList = [];
				}
				chosungList[chosungIndex].brandList.push(brandList[index]);
			}		
			return chosungList;
			
		}
		//영문초성그룹
		groupWithEng = function(brandList){
			var eng = /^[a-zA-Z]*$/; 
			var chosungList = [];
			for(var index = 0; index < brandList.length; index++){
				var firstAlphabet = brandList[index].BND_MST_BRAND_NM.charAt(0);
				if(!eng.test(firstAlphabet)){
					continue;
				}
				var chosungIndex = chosungList.findIndex(function(item){return item.groupName == firstAlphabet;}); 
				if(chosungIndex < 0){
					chosungIndex = chosungList.length;
					var groupItem = {};
					groupItem.groupName = firstAlphabet.toUpperCase();
					chosungList.splice(chosungIndex, 0, groupItem);
				}
				if(chosungList[chosungIndex].brandList == null || chosungList[chosungIndex].brandList == "undefined"){
					chosungList[chosungIndex].brandList = [];
				}
				chosungList[chosungIndex].brandList.push(brandList[index]);
			}
			return chosungList;
		}
		//그룹리스트랜더링
		renderBrandListWithGroop = function(groupList){
			
			var totalBrandCount = 0;
			var html = "";
			for(var index = 0; index < groupList.length; index++){
				var itemhtml = "<div class=\"brand_item\">"	;	
					itemhtml += "<strong>"+groupList[index].groupName+"</strong>";
					itemhtml += "<div class=\"brand_list\">";
					totalBrandCount+=groupList[index].brandList.length;
	        	for(var brandIndex = 0; brandIndex < groupList[index].brandList.length; brandIndex++){
	        		itemhtml += "<ul>";
	        		itemhtml += "	<li><a href=\"javascript:goPage("+groupList[index].brandList[brandIndex].BND_MST_IDX+")\">"+ groupList[index].brandList[brandIndex].BND_MST_BRAND_NM+"<span>("+groupList[index].brandList[brandIndex].BRAND_TOTAL+")</span></a></li>";
	    			itemhtml += "<ul>";
	        	}           
	        	
	        	itemhtml += "</div></div>";
	        	html += itemhtml;
			}
			$("#brandListContainer").html(html);
			$("#allBrandCount").html("Total BRAND ("+totalBrandCount+")");
		}
		
		renderBrandList = function(brandList){
			var groupKorList = groupWithKor(brandList);
			var gruopEngList = groupWithEng(brandList);		
			var displayBrandList = groupKorList.concat(gruopEngList);
			renderBrandListWithGroop(displayBrandList);
	 	}
		
		initBrandListWithGroup = function(brandList){
	
			var groupKorList = groupWithKor(brandList);
			var gruopEngList = groupWithEng(brandList);	
			
			displayBrandListWithGroup = groupKorList.concat(gruopEngList);
			renderBrandListWithGroop(displayBrandListWithGroup);
		}
		
		initBrandListWithGroup(brandListOrigin);
		
		/*  goPage = function(index) {
			var pageForm = $("pageForm");
			pageForm.find("input[name='BND_MST_IDX']").val(index);
			pageForm.attr({"action":"/pc/brand/brandView.do", "target":"_self", "method":"post"}).submit();
		} */
		var reqIng = false;
		searchBrandListAjax = function(){
			
			var arrSEARCH_KOR = getSearchWord("typeKor");
			var arrSEARCH_ENG = getSearchWord("typeEng");
			var arrPRD_CTG_IDX = getSearchCategory();
	
			if(reqIng) {return;}
			reqIng = true;
			$.ajax({
				type	: "POST",
				url		: "/pc/brand/searchBrandListAjax.do",
				dataType: "json",
				data	: {	"arrSEARCH_KOR" : JSON.stringify(arrSEARCH_KOR),
							"arrSEARCH_ENG" : JSON.stringify(arrSEARCH_ENG), 
							"arrPRD_CTG_IDX": JSON.stringify(arrPRD_CTG_IDX)
						  },
				success : function(data) {
					//$('.allBrandCount').html("Total BRAND ("+data.totalCount+")");
					renderBrandList(data.brandCategoryList);
					reqIng = false;
				}, error : function(err) {
					alert("요청 실패");
					reqIng = false;
				}
			});
		}
		
		searchBrandListAjax();
		goPage = function(idx){
			var pageForm = $("#pageForm");
			$("#BND_MST_IDX").val(idx);
			pageForm.attr("action", "/pc/brand/brandView.do?BND_MST_IDX =" + idx);
			pageForm.attr("method", "GET" );
	 		pageForm.submit();
	 		
	 		/*
			var pageForm = $("#pageForm");
			$("#BND_MST_IDX").val(idx);
			pageForm.attr("action", "/pc/brand/brandView.do");
	 		pageForm.submit();
	 		*/
	 		
		}
	})

	
    
</script>
