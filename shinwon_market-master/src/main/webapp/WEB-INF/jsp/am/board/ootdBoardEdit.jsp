<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>

</head>
<body><!-- body class, 중요 -->
<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

        <div class="container">

            <h2 class="title"><span>OOTD 관리</span></h2>

            <h3 class="title"><span>등록정보</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>
            
            <form name="searchForm" id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchMemNm" value="<c:out value="${commandMap.searchMemNm }"/>"/>
                    <input type="hidden" name="searchMemID" value="<c:out value="${commandMap.searchMemID }"/>"/>
                    <input type="hidden" name="searchKeyword" value="<c:out value="${commandMap.searchKeyword }"/>"/>
                    <input type="hidden" name="searchStatus" value="<c:out value="${commandMap.searchStatus }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
            </form>

            <form name="frm" id="frm" enctype="multipart/form-data">
            <div class="section-form"><!-- section-form-a -->
            	<input type="hidden" name="CNT_MST_IDX" id="CNT_MST_IDX" value="<c:out value="${row.CNT_MST_IDX }"/>" />
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 20%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><label class="label"><span>작성자</span></label></th>
                            <td>
                            <a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.CNT_MST_REG_ID }" />');" title="새 창 으로 열립니다.">
                            <c:out value="${row.CNT_MST_REG_ID }(${row.REG_MEM_NM })"/>
                            </a>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>등록일</span></label></th>
                            <td><ui:formatDate value="${row.CNT_MST_REG_DT}" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" name="CNT_MST_TITLE" id="CNT_MST_TITLE" class="text xlarge" value="<c:out value="${row.CNT_MST_TITLE }"/>"/>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>내용<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <textarea name="CNT_MST_DESC" id="CNT_MST_DESC" cols="30" rows="10" class="textarea xlarge">${row.CNT_MST_DESC }</textarea>
                            </td>
                        </tr>
                        <tr><!-- row -->
                            <th><span class="in_block">태그<i class="require"><em>필수입력</em></i></span> <a href="javascript:goTagForm()" class="button button-a small in_block">태그수정</a></th>
                            <td>
                                <ul class="tag_list">
                                    <c:forEach items="${tagList}" var="tag" varStatus="i">
										<li value="${ tag.TAG_MST_ID}"><c:out value="${tag.TAG_MST_TITLE}"/>
											<button type="button" class="btn_del">X</button>
											<input type="hidden" name="TAG_MST_ID" value="${tag.TAG_MST_ID}">
										</li>
									</c:forEach>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>희망태그</span></label></th>
                            <td class="tag_textarea">
                                <textarea name="WSH_TAG_TITLE_LIST" id="WSH_TAG_TITLE_LIST" cols="30" rows="10" class="textarea xlarge"><c:forEach items="${wishTagList}" var="wishTag" varStatus="i">
	                                	<c:if test="${not i.first }">, </c:if>${wishTag.WSH_TAG_TITLE}
		                            </c:forEach>
                                </textarea>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>등록상품 <a href="javascript:openSearchProductPopup();" class="button button-a small" title="새 창 으로 열립니다.">상품수정</a></span></label></th>
                            <td>
                                <table class="core">
                                    <colgroup>
                                        <col style="width: 10%;" />
                                        <col style="width: auto;" />
                                        <col style="width: 10%;" />
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>이미지</th>
                                            <th>상품정보</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody class="applyProductList">
                                    	<c:forEach items="${ootdProductList}" var="prd">
	                                    	<tr value="${prd.CNT_PRD_MST_CD }">
	                                            <td><img src="${cdnDomain}${prd.PRD_IMAGE }" alt="${prd.PRD_IMAGE_ALT }"></td>
	                                            <td class="text-left">${prd.PRD_MST_NM }</td>
	                                            <td><a href="#none" class="button small goProductDelete" data-prd_mst_cd="${prd.CNT_PRD_MST_CD }"><span>삭제</span></a></td>
	                                            <input type="hidden" name="PRD_MST_CD" value="${prd.CNT_PRD_MST_CD}">
	                                        </tr>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>상태</span></label></th>
                            <td>
                                <input type="radio" name="CNT_MST_USE_YN" id="stateA" class="radio" value="Y" checked="checked"/>
                                <label for="stateA">사용</label>
                                <input type="radio" name="CNT_MST_USE_YN" id="stateB" class="radio" value="N" />
                                <label for="stateB">미사용</label>
                            </td>
                        </tr>
                        <c:if test="${not empty row.CNT_MST_UPD_ID }">
                        <tr>
                            <th><label class="label"><span>수정일</span></label></th>
                            <td> 
                            		${row.CNT_MST_UPD_ID }(${row.UPD_MEM_NM }) / <ui:formatDate value="${row.CNT_MST_UPD_DT}" pattern="yyyy.MM.dd HH:mm:ss"/>
                            </td>
                        </tr>
                        </c:if>
                    </tbody>
                </table><!-- // table -->
                <div class="grid section-button-list">
                <h3 class="title"><span>OOTD 사진</span></h3>
                </div>
                <div id="productBox">
                    <div class="optional"><!--  optional -->
                        <ul class="list list-a">
                            <li>OOTD에 등록할 사진을 설정할 수 있습니다.</li>
                            <li>OOTD 사진은 최대 10장까지 등록할 수 있으며, 첫 번째 등록한 사진이 대표 썸네일로 자동 설정됩니다.</li>
                            <li>png, jpg 포멧의 이미지 파일을 최대 10MB까지 등록할 수 있습니다.</li>
                        </ul>
                        <input type="file" id="pc_files">
                        <div class="img_upload">
                        	<c:choose>
								<c:when test="${not empty fileList}">
									<c:forEach var="row" items="${fileList }" varStatus="status">
										<p><img src="${cdnDomain}${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="${row.CMN_FLE_ALT_TXT}" style="border:1px solid #ccc;width:100px;height:100px;"><button class="btn_del" value="${row.CMM_FLE_IDX}">X</button></p>
									</c:forEach>
								</c:when>
							</c:choose>
                        </div>
                    </div>
                 </div><!-- //id="productBox" -->
               </div>
            </form>
            <div class="section-button">
                <div class="wrap text-center">
                    <a href="javascript:;" id="goList" class="button"><span>목록</span></a>
                    <a href="javascript:;" id="goRegist" class="button primary"><span>저장</span></a>
                </div>
            </div>
			<div id="comment-container">
	            <h3 class="title"><span>댓글</span></h3>
	            <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
	                <div class="col-1-2 text-left">
	                    <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                    <span class="pages">
	                        (총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                    </span>
	                </div>
	
	                <div class="col-1-2 text-right">
	                    <a href="#none" id="goUpdate" class="button small primary"><span>미사용처리</span></a>
	                </div>
	            </div><!-- // 목록 상단 버튼 -->
	
	            <table cellspacing="0" class="table-col table-b"><!-- table -->
	                <colgroup>
	                    <col style="width: 8%;" />
	                    <col style="width: auto;" />
	                    <col style="width: 10%;" />
	                    <col style="width: 15%;" />
	                    <col style="width: 10%;" />
	                    <col style="width: 10%;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th><input type="checkbox" class="checkbox checkAll" /></th>
	                        <th>내용</th>
	                        <th>작성자</th>
	                        <th>등록일</th>
	                        <th>상태</th>
	                        <th>답글 작성</th>
	                    </tr>
	                </thead>
	                <tbody >
	                	<c:forEach items="${commentList}" var="comment">
	                	<tr>
							<td><input type="checkbox" class="checkbox checkRow" data-otd_rpl_id="${comment.OTD_RPL_ID }"></td>
						    <td class="text-left txt_line1"><c:if test="${not empty comment.OTD_RPL_REF_ID}">↳ </c:if>${comment.OTD_RPL_CTS}</td>
						    <td>${comment.OTD_RPL_REG_ID}(${comment.MEM_MST_NCK_NM})</td>
						    <td>${comment.OTD_RPL_REG_DT}</td>						    
							<td><c:choose><c:when test="${comment.OTD_RPL_USE_YN eq 'Y'}">사용</c:when><c:otherwise>미사용</c:otherwise></c:choose></td>
							<td>
								<c:choose>
									<c:when test="${comment.OTD_RPL_USE_YN eq 'Y' && empty comment.OTD_RPL_REF_ID}"><a href="#none" class="button small rpl-reg-btn" data-otd_rpl_id="${comment.OTD_RPL_ID }" data-reg_id="${comment.OTD_RPL_REG_ID}" data-reg-nm="${comment.MEM_MST_NCK_NM}"><span>답글작성</span></a></c:when>
									<c:otherwise>-</c:otherwise>
								</c:choose>
							</td>
						</tr>
	                	</c:forEach>
	                </tbody>
	            </table>
	
	            <div class="section-pagination"><!-- section pagination -->
                    <h4 class="sr-only">목록 페이징</h4>
                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                        <ui:paging paging="${paging }" jsFunction="goPage" />
                    </div>
                </div><!-- // section pagination -->
			</div>
           <div class="reply_box cf">
               <textarea class="reply_textarea" class="textarea"></textarea>
               <a href="#none" id="goCommentRegist" class="button"><span>댓글 등록</span></a>
           </div>
            
        </div>
       </div><!-- // contents -->

    </div><!-- // wrapper -->

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${cdnDomain}" />/pc/js/vendor/jquery.tmpl.min.js"></script>
<script id="tagItemTemplate" type="text/x-jquery-tmpl">
<li name="TAG_MST_ID" value="\${TAG_MST_ID}">\${value}
	<button type="button" class="btn_del">X</button>
	<input type="hidden" name="TAG_MST_ID" value="\${TAG_MST_ID}">
</li>
</script>

<script id="prdItemTemplate" type="text/x-jquery-tmpl">
<tr value="\${PRD_MST_CD }">
	<td><img src="\${PRD_IMAGE}" alt=""></td>
	<td class="text-left">\${PRD_MST_NM }</td>
	<td><a href="#none" class="button small goProductDelete" data-prd_mst_cd="\${PRD_MST_CD }"><span>삭제</span></a></td>
	<input type="hidden" name="PRD_MST_CD" value="\${PRD_MST_CD}">
</tr>
</script>

<script id="imgItemTemplate" type="text/x-jquery-tmpl">
<p>
	<img src="\${FILE_NM}" style="border:1px solid #ccc;width:100px;height:100px;">
	<button class="btn_del">X</button>
</p>
</script>



<script>
$(function () {
	$.checkBoxSelect("checkAll", "checkRow");
	
	$(document).on("click", "#goRegist", function(){
		goRegist();
	});	
	// 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/board/ootdBoardList.do", "target":"_self", "method":"post"}).submit(); 
    });
	
	$(document).on("click", ".btn_del", function(){
		if($(this).val() != null || $(this).val().trim().length>0){
			$("#frm").append($('<input>', {type:'hidden', name:'file_del_idx', value:$(this).val()}));
		}
		$(this).parent().remove();
	});
		
	$(document).on("click", ".goProductDelete", function(){	
		$(this).parent().parent().remove();	
	});
	
	$('#pc_files').on('change', function(){
		if(this.files.length > 0) {
			renderImagePreview($(this));
		}
	});
	
	$(document).on("click", "#goUpdate", function(){
		var arrOtdRplId = [];
		$(".checkRow:checked").each(function(){
			arrOtdRplId.push($(this).data("otd_rpl_id"));
		});
		$.ajax({
			type : "POST",
			async:true,
			url : '<c:out value="${serverDomain}"/>/am/board/commentUpdateAjax.do',
			data : {
				   'arrOTD_RPL_ID' : JSON.stringify(arrOtdRplId)
				   },  
			success : function(data){
				goPage($(".sr-only strong").text().trim());
			}
		});
	});
		
	$(document).on("click", "#goCommentRegist", function(){
		if($(".reply_textarea").val().trim().length<1){
			alert("댓글 내용을 입력하세요.");
			$(".reply_textarea").focus();
			return;
		}
		commentRegist($("#CNT_MST_IDX").val(), rplRefId, $(".reply_textarea").val());
		$(".reply_textarea").val("");
	});
	
	var rplRefId = null;
	$(document).on("click", ".rpl-reg-btn", function(){
		rplRefId = $(this).data("otd_rpl_id");
		var text = $(this).data("reg_id") + "(" + $(this).data("reg-nm") + ")";
		$(".reply_textarea").val(text);
	});
	
	var reqCommentList = function(idx, cPage, pageSize){
		$.ajax({
			type : "POST",
			async:true,
			url : '<c:out value="${serverDomain}"/>/am/board/commentListAjax.do',
			data : {
				   'CNT_MST_IDX' : idx,
				   'cPage': cPage,
				   'pageSize':pageSize
				   },  
			success : function(data){
				$("#comment-container").html(data);
			}
		}); 
	}
	
	var renderImagePreview = function($that) {
		var cloneElement = $that.clone();
		var reader = new FileReader();
	    reader.onload = function(e) {
	    	var obj ={"FILE_NM":e.target.result};
	    	$("#imgItemTemplate").tmpl( obj ).appendTo(".img_upload");
	    	cloneElement.attr("id", "");
	    	cloneElement.attr("name","file");
	    	cloneElement.hide();
	    	$("#frm").append(cloneElement);
	    }
	    reader.readAsDataURL(cloneElement.prop('files')[0]); // convert to base64 string
	    
	    $that.val("");
    }
	
	
	var commentRegist = function(idx, refId, contents){
		$.ajax({
			type : "POST",
			async:true,
			url : '<c:out value="${serverDomain}"/>/am/board/commentRegistAjax.do',
			data : {
				   'CNT_MST_IDX' : idx,
				   'OTD_RPL_REF_ID': refId,
				   'OTD_RPL_CTS':contents
				   },  
			success : function(data){
				alert(data.alertMsg);
				if("200"!=data.RESULT_CODE){
					return;
				}
				var cPage = 1; 
				if(rplRefId != null){
					cPage = $(".sr-only strong").text().trim();
				}
				goPage(cPage);
				rplRefId = null;
			}
		}); 
	}
	goRegist = function(){
		
		// 제목 
		if($("#CNT_MST_TITLE").val().trim().length < 1){
			alert("제목을 입력하세요.");
			$("#CNT_MST_TITLE").focus();
			return;
		}
		// 내용
		if($("#CNT_MST_DESC").val().trim().length < 1){
			alert("내용을 입력하세요.");
			$("#CNT_MST_DESC").focus();
			return;
		}
		// 태그
		if($(".tag_list li").size()<1){
			alert("태그를 입력하세요.");
			$(".tag_list").focus();
			return;
		}
		// 등록상품
		if($(".applyProductList tr").size()<1){
			alert("등록상품을 입력하세요.");
			$(".applyProductList").focus();
			return;
		}
		// 사진
		if($(".img_upload p").size()<1){
			alert("사진을 입력하세요.");
			$(".img_upload").focus();
			return;
		}
		
		$frm = $("#frm");
		if(confirm("수정 하시겠습니까?")){
			$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/board/ootdBoardModify.do", "target":"_self", "method":"post"}).submit();
		}
	}
	
	goPage = function (cPage) 
    {	
		reqCommentList($("#CNT_MST_IDX").val(), cPage, $("#pageSize").val());
    }
	
	goTagForm = function(){
		popup("<c:out value="${serverDomain}" />/am/tag/searchTagGroupPopup.do","900", "500", "yes");
	}
	
	fnResultTag = function(params) {
		for(var index = 0; index < params.length; index++){
			$(".tag_list li").filter(function(){
				return $(this).attr("value") == params[index].TAG_MST_ID;
			}).remove();
		}
		
		$("#tagItemTemplate").tmpl( params ).appendTo(".tag_list");
	}
	
	openSearchProductPopup = function (item)
	{	
		popup('',"1100","700","no","_BasicProductPopup");
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "target":"popup_BasicProductPopup", "method":"post"}).submit();
	}
	
	fnResultProduct = function(params){
		var bCheck = true;		
		
		//상품중복체크
        $.each( params, function( index, el ){
            if( !fnDuplicationChk( el.PRD_MST_CD )){
                alert("["+el.PRD_MST_CD+"] 이미 선택된 상품입니다.");
                bCheck = false;
                return false;
            }
        });
		
		if(!bCheck){
			return;
		}
		
		$("#prdItemTemplate").tmpl( params ).appendTo(".applyProductList");
	}
	
	//상품 중복체크
	fnDuplicationChk = function( selectObj )
	{	
		var existsPrd = $(".applyProductList tr").filter(function(){
			return $(this).attr("value") == selectObj;
		});
		if(existsPrd.length>0){
			return false;
		}
		return true;
	}
});


</script>

</body>
</html>
