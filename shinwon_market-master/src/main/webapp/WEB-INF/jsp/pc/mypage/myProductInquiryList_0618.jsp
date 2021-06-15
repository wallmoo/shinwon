<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
	
	<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
			<%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>            
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">상품문의</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
				<!-- //my_modify_top_wrap -->
				
					<form id="frm" name="frm">
						<input type="hidden" name="tabId" value="<c:out value="${commandMap.tabId }"/>"/>
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
						
						<div class="tab_wrap fix">
						    <ul class="tab n2">
						        <li id="myProductInquiryIncompleteList">
						        	<a href="#myProductInquiryIncompleteList" onclick="moveTab('myProductInquiryIncompleteList')">답변대기</a>
					        	</li>
						        <li id="myProductInquiryCompleteList">
						        	<a href="#myProductInquiryCompleteList" onclick="moveTab('myProductInquiryCompleteList')">답변완료</a>
					        	</li>
						    </ul>
						    <div class="tab_cont" id="tab1">
						    	<h4 class="blind">답변대기</h4>
						    	<div class="inquiry_date_wrap clearboth">
						    		<div class="month_inq">
						    			<strong class="tit">기간별 조회</strong>
						    			<span class="month_box clearboth">
						    				<span class="inline">
						    					<input type="radio" id="month1" name="month" value="1" class="inp_radio" checked="checked">
						    					<label for="month1" class="label">
													<em><i class="lato bold">1</i>개월</em>
						    					</label>
						    				</span>
											<span class="inline">
						    					<input type="radio" id="month3" name="month" value="3" class="inp_radio">
						    					<label for="month3" class="label">
						    						<em><i class="lato bold">3</i>개월</em>
						    					</label>
						    				</span>
						    				<span class="inline">
						    					<input type="radio" id="month6" name="month" value="6" class="inp_radio">
						    					<label for="month6" class="label">
						    						<em><i class="lato bold">6</i>개월</em>
						    					</label>
						    				</span>
						    				<span class="inline">
						    					<input type="radio" id="month12" name="month" value="12" class="inp_radio">
						    					<label for="month12" class="label">
						    						<em><i class="lato bold">12</i>개월</em>
						    					</label>
						    				</span>
						    			</span>
						    		</div>
						    		<div class="day_inq">
						    			<strong class="tit">일자별 조회</strong>
						    			<span class="day_box">
						    				<span class="inline">
						    					<input type="text" id="beginning" class="inp_txt" title="조회 시작일 입력">
						    				</span>
						    				<span class="hyphen"> ~ </span>
						    				<span class="inline">
							    				<input type="text" id="finish" class="inp_txt" title="조회 종료일 입력">
							    			</span>
						    				<button type="button" class="btn inp_search">
						    					<em class="blind">검색하기</em>
						    				</button>
						    			</span>
						    		</div>
						    	</div>
						    	<!-- //inquiry_date_wrap -->
		
						    	<script>
									$(function(){
										$.fn.datePic();
									});
								</script>
		
								<div class="table_wrap mb95">
									<table class="tb_col">
										<caption>상품문의 : 작성일, 상품정보, 제목, 공개여부 출력 표입니다.</caption>
										<colgroup>
											<col style="width:12%;">
											<col>
											<col style="width:38%;">
											<col style="width:12%;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">작성일</th>
												<th scope="col">상품정보</th>
												<th scope="col">제목</th>
												<th scope="col">공개여부</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${not empty list }">
													<c:forEach var="row" items="${list }" varStatus="i">
														<tr>
															<td><ui:formatDate value="${row.BRD_INQ_REG_DT }" pattern="yyyy-MM-dd"/></td>
															<td class="left">
																<div class="product_info clearboth">
																	<div class="img">
																		<a href="#" class="product_thumb">
																			<img src="<c:out value="${fromtDomain }" /><c:out value="${row.PRD_IMG }" />" alt="제품 이미지">
																		</a>
																	</div>
																	<div class="txt">
																		<!-- TODO 브랜드 네임 정보 필요 -->
																		<span class="brand">[신원] VIKI</span>
																		<a href="#" class="item_name"><c:out value="${row.PRD_MST_NM }" />(<c:out value="${row.BRD_PRD_MST_CD }" />)</a>
																		<!-- <span class="item_info">색상: 블랙 / 사이즈: 85 / 1개</span> -->
																	</div>
																</div>
															</td>
															<td class="left">
																<button type="button" class="btn_view_title"><c:out value="${row.BRD_INQ_TITLE }" /></button>
															</td>
															<!-- TODO 공개 / 비공개 여부 바인딩 -->
															<td class="col_gray">비공개</td>
														</tr>
														<tr class="tr_answer">
															<td colspan="4">
																<div class="tr_answer_wrap">
																	<strong class="question"><ui:replaceLineBreak content="${row.BRD_INQ_CONTENTS}"/></strong>
																	<c:if test="${commandMap.BRD_INQ_RET_YN eq 'N' }">
																		<div class="btn_box">
																			<button type="button" onclick="goEdit('<c:out value="${row.BRD_INQ_IDX }" />','<c:out value="${row.BRD_PRD_MST_CD }" />')" class="btn_modify">수정</button>
																			<!-- <button type="button" date-id="layer_modify" date-type="layer" class="btn_modify">수정</button> -->
																			<button type="button" onclick="goDelete('<c:out value="${row.BRD_INQ_IDX }" />')" class="btn_delete">삭제</button>
																		</div>
																	</c:if>
																	<c:if test="${commandMap.BRD_INQ_RET_YN eq 'Y' }">
																		<div class="answer"><ui:replaceLineBreak content="${row.BRD_INQ_REPLY_CONTENTS}"/></div>
																	</c:if>
																</div>
															</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr class="no_data">
														<td colspan="4">
															<div class="box">
																<span class="txt">등록된 문의가 없습니다.</span>
															</div>
														</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
		
								<div class="pagination">
									<ui:frontpaging paging="${paging }" jsFunction="goPage" />
								</div>
								<!-- //pagination -->
		
						    </div>
						</div>
					</form>
				<!-- //tab_wrap -->

			</div>
			<!-- //sub_content -->

		</div>
	</div>
	
<div id="productQnaFormPopup">
</div>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
$(function(){
	setActiveUI();
	
	var $modifyFrm = $("#modifyFrm");
	$modifyFrm.validate({
        rules: {
        	BRD_INQ_TITLE:{required:true, maxlength:50},
        	BRD_INQ_CONTENTS:{required:true, maxlength:2000},
        },
        messages :{
        	BRD_INQ_TITLE:{required:"[제목]은 필수 정보입니다.", maxlength:"[제목]은 최대 50글자입니다."},
        	BRD_INQ_CONTENTS: {required:"[내용]은 필수 정보입니다.", maxlength:"[내용]은 최대 2000글자압니다."},
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
	
	goPage = function (cPage){
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${frontDomain}"/>/pc/mypage/myProductInquiryList.do", "target":"_self", "method":"post"}).submit();
    };
    
    goEdit = function(brdInqIdx,prdMstCd){
    	$("#productQnaFormPopup").load("<c:out value="${frontDomain}"/>/pc/product/productQnaFormPopup.do", {"BRD_INQ_IDX": brdInqIdx, "PRD_MST_CD": prdMstCd});
    	layerPopupShow();
    };
    
    moveTab = function (tabId){
		
    	
    	var $frm = $("#frm");
    		$frm.find("input[name='cPage']").val(1);
    		$frm.find("input[name='tabId']").val(tabId);
    		
    	var actionUrl = "";
    	
    	if(tabId == "myProductInquiryIncompleteList"){
    		actionUrl ="<c:out value="${frontDomain}"/>/pc/mypage/myProductInquiryIncompleteList.do";
    	}else if(tabId == "myProductInquiryCompleteList"){
    		actionUrl ="<c:out value="${frontDomain}"/>/pc/mypage/myProductInquiryCompleteList.do";
    	}else{
    		alert("올바르지 않은 접근입니다.");
    		return false;
    	}
	        
	    $frm.attr({"action":actionUrl, "target":"_self", "method":"post"}).submit();
	        
    };
    
    goDelete = function(brdInqIdx){
    	if(brdInqIdx != ""){
    		if(confirm("문의사항을 삭제 하시겠습니까?")){
	    		$.ajax({
		            async : false,
		            type : "POST",
		            data : {"brdInqIdx": brdInqIdx},
		            url : "",
		            //url : "<c:out value="${frontDomain}" />/pc/product/productQnaDeleteAjax.do",
		            success : function (data) { 
		            	if(data.resultYn == "Y")
		    			{
							alert("삭제되었습니다.");
							location.reload();
		    			}else{
		    				alert("삭제 중 오류가 발생하였습니다.\n다시 시도해주세요.");
		    			}
		            },
		            error : function (err){
		                alert("오류가 발생하였습니다.\n[" + err.status + "]");
		                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
		            }
				});
    		}
    	}else{
    		alert("필수값이 없습니다.\n다시 확인해주세요");
    		return;
    	}
    };
    
    goModify = function(){
    	if($modifyFrm.valid()){
    		$modifyFrm.attr({"action":"<c:out value="${frontDomain}" />/pc/product/productQnaRegist.do", "target":"_self", "method":"post"}).submit();
    	}
    }
    
});

	setActiveUI = function(){
		var id = location.href;
		
		if(id.indexOf("myProductInquiryIncompleteList") > -1){
			$("#myProductInquiryIncompleteList").addClass("on");
		}else if(id.indexOf("myProductInquiryCompleteList") > -1){
			$("#myProductInquiryCompleteList").addClass("on");
		}
	}
	
	// TODO layerPopup css 수정 필요
	layerPopupShow = function(){
		
		var height = ($(window).height() / 2) - ($("#layer_modify").height() / 2);
		
		$("#layer_modify").css({
            'top': height,
            'left': ($(window).width() - $("#layer_modify").width()) / 2,
            'display': 'block'
        });
		
	}
	
</script>