<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contents-inner"><!-- contents-inner -->

	<h3 class="title"><span>${bnrCatList[1].TITLE } - ${bnrCatList[0].TITLE }</span></h3>
	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
		<div class="text-left">
			
			${bnrCatList[0].CMN_COM_ETC3 }
		</div>
		<div class="text-right">
            <a href="javascript:goRemove();" class="button small"><span>선택삭제</span></a>
			<a href="javascript:goForm();" class="button small primary"><span>등록</span></a>
		</div>
	</div><!-- // 목록 상단 버튼 -->
		<table class="table-col table-b">
			<colgroup>
				<col style="width: 7%;" />
				<col style="width: 7%;" />
				<col style="width: auto;" />
				<col style="width: 20%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
				<col style="width: 10%;" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" name="" class="checkAll_P" id=""></th>
					<th>타이틀</th>
					<th>전시기간</th>
					<th>등록일</th>
					<th>진행여부</th>
					<th>사용여부</th>
					<th>보기</th>
				</tr>
			</thead>
			<tbody class="sort-target">
			<c:choose>
			    <c:when test="${not empty list}">
			    	<c:forEach var="row" items="${list }" varStatus="i">
					<tr class="list">
						<td><input type="checkbox" class="checkRow" name="" id="" value="${row.BNR_MST_IDX}"></td>
					    <td>
						    <a href="javascript:goView('<c:out value="${row.BNR_MST_IDX }" />');">
						        <c:if test="${bnrCatList[0].CMN_COM_ETC2 eq 'TOP_SELLER_BANNER' }"> ${row.BND_MST_SEL_NM  }</c:if>
						        <c:if test="${bnrCatList[0].CMN_COM_ETC2 eq 'BRAND_BANNER' }"> ${row.BND_MST_BRAND_NM  }</c:if>
						        <c:if test="${bnrCatList[0].CMN_COM_ETC2 ne 'BRAND_BANNER' && bnrCatList[0].CMN_COM_ETC2 ne 'TOP_SELLER_BANNER'}"> ${row.BNR_MST_TITLE}</c:if>
						    </a>
					    </td>
					    <td>
						    <ui:formatDate value="${row.BNR_MST_ST_DT }" pattern="yyyy.MM.dd"/> <c:out value="${row.BNR_MST_ST_HH }" />:<c:out value="${row.BNR_MST_ST_MM }" /> ~ <br/>
						    <ui:formatDate value="${row.BNR_MST_ED_DT }" pattern="yyyy.MM.dd"/> <c:out value="${row.BNR_MST_ED_HH }" />:<c:out value="${row.BNR_MST_ED_MM }" />
					    </td>
					    
					    <td><ui:formatDate value="${row.BNR_MST_REG_DT }" pattern="yyyy.MM.dd"/></td>
					   
					    <td><c:out value="${row.BNR_PROGRESS }" /></td>
					    <td>
					    	<select class="CMM_MST_LIST select">
								<option value="Y" <c:if test="${row.BNR_MST_USE_YN eq 'Y'}">selected</c:if>>사용</option>
								<option value="N" <c:if test="${row.BNR_MST_USE_YN eq 'N'}">selected</c:if>>미사용</option>
							</select>
						</td>
					    <td>
					    	<c:choose>
					    	<c:when test="${bnrCatList[0].CMN_COM_ETC2 eq 'IMAGE_VIDEO_BANNER' || bnrCatList[0].CMN_COM_ETC2 eq 'VIDEO_BANNER' }">
					    		<a href="<c:out value="${row.BNR_MST_URL}"/>" class="button small" data-width="600" data-height="700" data-scroll="true" target="_blank" title="새 창 으로 열립니다.">
	        						<span>영상보기</span>
	        					</a>
					    	</c:when>
					    	<c:otherwise>
					    		<c:set var="url" value="${row.BND_MST_URL}"/>
					    		<c:if test="${url eq null }"> <c:set var="url" value="${img_domain}${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM }"/></c:if>
					    		
					    		<a href="${url }" class="button small" data-width="600" data-height="700" data-scroll="true" target="_blank" title="새 창 으로 열립니다.">
	        						<span>배너보기</span>
	        					</a>
					    	</c:otherwise>	
					    	</c:choose>
					    	
					    </td>
					</tr>
			    	</c:forEach>
			    </c:when>
			    <c:otherwise>
					<tr>
						<td colspan="8">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
					</tr>
			    </c:otherwise>
			</c:choose>
			</tbody>
		</table>
        <div class="section-button">
            <div class="wrap text-right">
                <a href="javascript:saveStatus()" class="button primary"><span>저장</span></a>
            </div>
        </div>
	
	<form id="frm" name="frm">
	    <input type="hidden" name="BNR_MST_IDX" value="" />
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
		<input type="hidden" name="searchBnrMstTitle" value="<c:out value="${commandMap.searchBnrMstTitle }"/>"/>
		<input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
		<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
		<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
		<input type="hidden" name="searchBnrMstUseYn" value="<c:out value="${commandMap.searchBnrMstUseYn }"/>"/>
        <input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>" />
        <input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="<c:out value="${commandMap.searchGubun }"/>" />
        <input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
        <input type="hidden" id="useListNum" name="useListNum" />
        <input type="hidden" id="unUseListNum" name="unUseListNum" />
        <input type="hidden" id="minListLimit" name="minListLimit" />
        <input type="hidden" id="maxListLimit" name="maxListLimit" />
        <input type="hidden" id="selectedListUseYn" name="selectedListUseYn" />
        <input type="hidden" id="themeBannerList" name="themeBannerList" />
        <input type="hidden" id="TAG_BND_TYPE" name="TAG_BND_TYPE" value="TYPE_TOP_SELLER"/>
        
        
    </form>
</div><!-- // contents-inner -->
<script type="text/javascript">
$(document).ready(function () {

	var word = '<c:out value="${bnrCatList[0].CMN_COM_ETC1}"/>';
	var type = '<c:out value="${bnrCatList[0].CMN_COM_ETC2}"/>'.trim();
	$("#minListLimit").val(word.split(/=|,/)[1]);
	$("#maxListLimit").val(word.split(/=|,/)[3]);
	var useListNum = 0;
	var unUseListNum = 0;
	$(".CMM_MST_LIST option:selected").each(function() {
		if($(this).val()=="Y"){
			useListNum++;
		}else{
			unUseListNum++;
		}	
	});
	$("#useListNum").val(useListNum);
	$("#unUseListNum").val(unUseListNum);
	 // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });
	
    // 검색
    search = function() 
    {
        var $searchForm = $("#searchForm");
        var url = "<c:out value="${serverDomain}" />/am/display/themeBannerList.do";
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        var param = $searchForm.serialize();
        callPageLoad(url, param);
    };
    // 전시배너관리 등록페이지 이동
    goForm = function (){
        var $frm = $("#frm");
        var url;
        if(type == "BRAND_BANNER" ){
        	url = "<c:out value="${serverDomain}"/>/am/display/themeBannerBrandForm.do";
        }else if(type == "IMAGE_VIDEO_BANNER"){
			url = "<c:out value="${serverDomain}"/>/am/display/themeBannerImgVideoForm.do";
		}else if(type == "VIDEO_BANNER"){ 
			url = "<c:out value="${serverDomain}"/>/am/display/themeBannerVideoForm.do";
		}else if(type == "GNB_BANNER"){
			url = "<c:out value="${serverDomain}"/>/am/display/themeBannerGNBForm.do";
		}else if(type == "TOP_SELLER_BANNER"){
        	url = "<c:out value="${serverDomain}"/>/am/display/themeBannerTopSellerForm.do";
        }else if(type == "PRODUCT_DISPLAY_BANNER"){
        	url = "<c:out value="${serverDomain}"/>/am/display/themeBannerProductForm.do";
        }else  if(type == "BASIC_BANNER"){
        	url = "<c:out value="${serverDomain}"/>/am/display/themeBannerForm.do";
        }else{
        	alert("하위목록을 선택해주세요.")
        	return;
        }
        var param = $frm.serialize();
        callPageLoad(url, param);
    };
    
    // 전시배너관리 상세페이지 이동
    goView = function (bnrMstIdx)
    {
        var $frm = $("#frm");
        var url;
        if(type == "BRAND_BANNER" ){
        	url = "<c:out value="${serverDomain}"/>/am/display/themeBannerBrandEdit.do";
        }else if(type == "IMAGE_VIDEO_BANNER"){
			url = "<c:out value="${serverDomain}"/>/am/display/themeBannerImgVideoEdit.do";
		}else if(type == "VIDEO_BANNER"){ 
			url = "<c:out value="${serverDomain}"/>/am/display/themeBannerVideoEdit.do";
		}else if(type == "GNB_BANNER"){
			url = "<c:out value="${serverDomain}"/>/am/display/themeBannerGNBEdit.do";
		}else if(type == "TOP_SELLER_BANNER"){
        	url = "<c:out value="${serverDomain}"/>/am/display/themeBannerTopSellerEdit.do";
        }else if(type == "PRODUCT_DISPLAY_BANNER"){
        	url = "<c:out value="${serverDomain}"/>/am/display/themeBannerProductEdit.do";
        }else  if(type == "BASIC_BANNER"){
        	url = "<c:out value="${serverDomain}"/>/am/display/themeBannerEdit.do";
        }else{
        	alert("하위목록을 선택해주세요.")
        	return;
        }
        $frm.find("input[name='BNR_MST_IDX']").val(bnrMstIdx);
        var param = $frm.serialize();
        callPageLoad(url, param);
    };
    
    // 페이지 로드
    callPageLoad = function (url, param) 
    {
        $("#main_con").empty();
        $("#main_con").load(url, param, function () {
        	/* treePageSetting(); */
        });
    };
    
    goRemove = function(){
    	var $frm = $("#frm");
    	$("#themeBannerList").val(fnSelectedBannerList());
    	if($("#themeBannerList").val() == "[]"){
    		alert("삭제 항목을 선택해주세요.");
    		return;
    	}
    	$("#frm").attr("action","<c:out value="${serverDomain}" />/am/display/themeBannerDelete.do").submit();
    }
    
    fnSelectedBannerList = function(){
		var arrayObj = new Array();
		$(".checkRow:checked").each(function(index,item){
			var obj = new Object();
			obj.BNR_MST_IDX = $(this).val();
			arrayObj.push(obj);
		})
		return JSON.stringify(arrayObj);
	}
    
    saveStatus = function(){
    	var arrayObj = new Array();
    	var count=0;
    	
		$(".checkRow").each(function(index,item){
			var obj = new Object();
			obj.BNR_MST_IDX = $(this).val();
			obj.BNR_MST_USE_YN = $(this).parent().parent().find(".CMM_MST_LIST option:selected").val()
			if($(this).parent().parent().find(".CMM_MST_LIST option:selected").val() == "Y"){
				count++;
			}
			arrayObj.push(obj);
		})
		if(count > Number($("#maxListLimit").val())){
			alert("최대 " + $("#maxListLimit").val() + "개의 배너를 노출 할 수 있습니다. ");
			return;
		}else if(count < Number($("#minListLimit").val())){
			alert($("#minListLimit").val() +"개의 배너를 필수로 등록해야합니다 ");
			return;
		}else{
			$("#themeBannerList").val(JSON.stringify(arrayObj))
	    	$("#frm").attr("action","<c:out value="${serverDomain}" />/am/display/themeBannerChangeStatus.do").submit();
		}
		//return JSON.stringify(arrayObj);
    }
    $(".checkAll_P").on("click",function(){
		if($(this).is(":checked"))
			$(".checkRow").prop("checked",true);
		else
			$(".checkRow").prop("checked",false);
	})
});

</script>