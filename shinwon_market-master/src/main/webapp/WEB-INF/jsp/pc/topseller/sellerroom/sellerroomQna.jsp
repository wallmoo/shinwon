<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>

	<!-- Content -->
    <div id="container">
        <div id="content" class="content">
			
			<%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

		   	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
         		<div class="topseller_wrap clearboth">
        	</c:if>
        	
			<%@ include file="/WEB-INF/jsp/pc/topseller/include/sellerroomTabMenu.jsp"%>

        	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
         		<div class="topseller_right">
        	</c:if>
        	
            <div class="sub_content">
                <div class="pro_detail_tit_wp mt0">
                    <input type="checkbox" id="check-2">
                    <label for="check-2" class="mr15"><span class="icon"></span>내가 등록한 문의</label>
                    <div class="btn_right">
                        <button class="btn_cont deep_puple inquiry_popup">문의하기</button>
                    </div>
                </div>
                <ul class="qna_replay_acc_list">
                </ul>
                <div class="pagination" id="qna_paging">
                </div>
                
                
                
                
                <!-- *************** QNA POPUP UI ***************** -->
                <div class="dim not bg_layer"></div>
                
				<div id="layer_inquiry" class="layer type03 is_btn">
                    <div class="layer_header">
                        <h2>Q&amp;A</h2>
                    </div>
                    <form id="inquiryForm" name="inquiryForm">
                    <div class="layer_content">
                        <div class="table_wrap">
                        	<input type="hidden" value="" name="BRD_INQ_IDX">
                        	<input type="hidden" value="${commandMap.VDR_MST_IDX }" name="VDR_MST_IDX">
                            <table class="tb_row">
                                <caption>Q&amp;A 수정 : 제목, 내용, 공개여부 입력 표입니다.</caption>
                                <colgroup>
                                    <col style="width:180px">
                                    <col style="width:auto">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">
                                            <span class="required">
                                                <em class="blind">필수 정보</em>
                                            </span> 제목
                                        </th>
                                        <td>
                                        	<input type="text" id="BRD_INQ_TITLE" name="BRD_INQ_TITLE" maxlength="40" placeholder="제목 입력" class="w100p">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <span class="required">
                                                <em class="blind">필수 정보</em>
                                            </span> 내용
                                        </th>
                                        <td>
                                            <textarea id="BRD_INQ_CONTENTS" name="BRD_INQ_CONTENTS" maxlength="1500" cols="30" rows="10"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">공개여부</th>
                                        <td>
                                            <span>
                                                <input type="checkbox" id="BRD_INQ_PUB_YN" name="BRD_INQ_PUB_YN" value="N">
                                                <label for="BRD_INQ_PUB_YN">
                                                    <span class="icon"></span>비공개
                                               	</label>
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </form>
                    <div class="layer_footer">
                        <button class="btn_large gray inquiry_popup_close">취소</button>
                        <button class="btn_large ok" id="write">수정</button>
                    </div>
                    <a href="#none" class="btn_layer_close">레이어 닫기</a>
                </div>
                
            </div>
            
       	<c:if test="${sellerInfo.BND_MST_LAY_TPY eq 'B' }">
				</div>
				<!-- //Right Wrapper -->
        	</div>
        	<!-- //All Wrapper -->
       	</c:if>
        </div>
    </div>
    <!--// Content -->

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script>
$( document ).ready(function() {
	
	/**********************  PAGING PROCESS **********************/
	var pageFirstHTML = '';
	pageFirstHTML += '<span class="img_arrow first page-cls" data-page="{value}">';
	pageFirstHTML += '	<em class="blind">첫 페이지로 이동</em>';
	pageFirstHTML += '</span>';
  	var pagePrevHTML = '';
  	pagePrevHTML += '<span class="img_arrow prev page-cls" data-page="{value}">';
  	pagePrevHTML += '	<em class="blind">이전 페이지로 이동</em>';
  	pagePrevHTML += '</span>';
  	var pageNumHTML = '<a href="javascript:void(0);" class="num  page-cls {on}" data-page="{value}">{value}</a>';
	var pageLastHTML = '';
	pageLastHTML += '<span class="img_arrow next  page-cls" data-page="{value}">';
	pageLastHTML += '	<em class="blind">다음 페이지로 이동</em>';
	pageLastHTML += '</span>';
  	var pageNextHTML = '';
  	pageNextHTML += '<span class="img_arrow last  page-cls" data-page="{value}">';
  	pageNextHTML += '	<em class="blind">마지막 페이지로 이동</em>';
  	pageNextHTML += '</span>';	 
  	
    
	var doPaging = function(current, total){
		var list = [];
		var pageLimit = 10;
		var upperLimit, lowerLimit;
		var currentPage = lowerLimit = upperLimit = Math.min(current, total);

		for (var b = 1; b < pageLimit && b < total;) {
		    if (lowerLimit > 1 ) {
		        lowerLimit--; b++; 
		    }
		    if (b < pageLimit && upperLimit < total) {
		        upperLimit++; b++; 
		    }
		}

		for (var i = lowerLimit; i <= upperLimit; i++) {
			/*
		    if (i == currentPage){
		    	list.push("["+i+"]");
		    }
		    else{
		    	list.push(i);
		    }
			*/
		    list.push(i);
		}
		console.log(list);
		return list;
	}
	
	var renderPagination = function($pageElem, pTotCount, pPage, pCallback) {
		var totalPages = Math.ceil(pTotCount / 5);
		var pagination = doPaging(pPage, totalPages);
		$pageElem.empty();
		
		if(pPage > 1) {
			$pageElem.append( pageFirstHTML.replace(/{value}/ig, 1));
			$pageElem.append( pagePrevHTML.replace(/{value}/ig, pPage - 1));
		}
		
		for(var i = 0 ; i < pagination.length; i ++) {
			$pageElem.append( pageNumHTML.replace(/{value}/ig, pagination[i])
									.replace('{on}', pagination[i] == pPage ? 'on' : '')
							);
		}
		
		if(pPage < totalPages) {
			$pageElem.append( pageLastHTML.replace(/{value}/ig, totalPages));
			$pageElem.append( pageNextHTML.replace(/{value}/ig, pPage + 1));
		}
		
		$('.page-cls', $pageElem).off('click').on('click', function(){
			var curPage = $(this).attr('data-page');
			pCallback(curPage);
		});
	}
	
	/**********************  QnA PROCESS **********************/
	
	var qnaQuestionHTML = '';
	qnaQuestionHTML += '<dl class="q_text clearboth">';
	qnaQuestionHTML += '	<dt>Q</dt>';
	qnaQuestionHTML += '   	<dd>{contents}</dd>';
	qnaQuestionHTML += '</dl>';
  	
  	var qnaModHTML = '';
  	qnaModHTML += '<div class="btn_wrap clearboth">';
  	qnaModHTML += '	<button class="btn_small gray qna-delete" data-id="{id}">삭제</button>';
  	qnaModHTML += ' <button class="btn_small inquiry_popup" data-id="{id}">수정</button>';
  	qnaModHTML += '</div>';
  	
  	var qnaAnswerHTML = '';
  	qnaAnswerHTML += '<dl class="a_text clearboth">';
  	qnaAnswerHTML += '	<dt>A</dt>';
  	qnaAnswerHTML += '  		<dd>{contents}<span class="qna_replay_date">{date}</span></dd>';
  	qnaAnswerHTML += '</dl>';
	
	var qnaItemHTML = '';
	qnaItemHTML += '<li>';
	qnaItemHTML += '    <button type="button" class="clearboth" {disabled}>';
	qnaItemHTML += '		<p class="fl">';
	qnaItemHTML += '        	<span class="qna_replay_stat {ok}">{status}</span>';
	qnaItemHTML += '        	<span class="qna_subject {secret}">{title}</span>';
	qnaItemHTML += '      	</p>';
	qnaItemHTML += '      	<p class="fr">';
	qnaItemHTML += '        	<span class="qna_auth">{user}</span>';
	qnaItemHTML += '        	<span class="qna_w_date">{date}</span>';
	qnaItemHTML += '      	</p>';
	qnaItemHTML += '    </button>';
	qnaItemHTML += '    <div class="qna_repla_detail">';
	qnaItemHTML += '    {question_section}';
	qnaItemHTML += '    {mod_section}';
	qnaItemHTML += '    {answer_section}';
	qnaItemHTML += '    </div>';
	qnaItemHTML += '</li>';
	
	var renderQnAList = function(pPage, pData) {
		
		var $listElem = $('ul.qna_replay_acc_list');
		$listElem.empty();
		
		for(var i = 0 ; i < pData.list.length; i ++) {
			var curData = pData.list[i];
			
			var questionHTML = '';
			var modHTML = '';
			var answerHTML = '';
			var secretHTML = '';
			var disabledHTML = '';
			
			var statusCls = '';
			if(curData.BRD_INQ_REPLY_CD == 'Y') {
				statusCls = 'ok';
				answerHTML = qnaAnswerHTML.replace('{contents}', curData.BRD_INQ_REPLY_CONTENTS).replace('{date}', curData.BRD_INQ_REPLY_DT_2);
			}
			
			questionHTML = qnaQuestionHTML.replace('{contents}', curData.BRD_INQ_CONTENTS);
			
			if(curData.MY_QNA_YN == 'Y' && curData.BRD_INQ_REPLY_CD != 'Y') {
				modHTML = qnaModHTML.replace(/{id}/ig, curData.BRD_INQ_IDX);
			}
			
			if(curData.BRD_INQ_PUB_YN == 'N') {
				secretHTML = 'secret';
			}
			
			if(curData.BRD_INQ_PUB_YN != 'Y' && curData.MY_QNA_YN != 'Y') disabledHTML = 'disabled';
			
	
				
			var curHTML = qnaItemHTML.replace('{status}', curData.BRD_INQ_REPLY_CD_NM)
										.replace('{ok}', statusCls)
										.replace('{title}', curData.BRD_INQ_TITLE)
										.replace('{user}', curData.BRD_INQ_REG_ID)
										.replace('{date}', curData.BRD_INQ_REG_DT_2)
										
										.replace('{question_section}', questionHTML)
										
										.replace('{mod_section}', modHTML)
										.replace('{answer_section}', answerHTML)
										.replace('{disabled}', disabledHTML)
										
										.replace(/{secret}/ig, secretHTML);
			
			
			$listElem.append(curHTML);
		}
		
		
		var $pageElem = $('#qna_paging');
		
		renderPagination($pageElem, pData.totCount, pPage, function(curPage) {
			funcGetQnAList(curPage);
		});
		
	    $('li button', $listElem).on('click', function(){
	        var childDiv = $(this).siblings('.qna_repla_detail');
	        if (childDiv.is(':visible')) {
	            childDiv.slideUp(300);
	        } else {
	            childDiv.slideDown(300);
	        }
	    });

	};
	
	$(document).on('click', 'ul.qna_replay_acc_list .qna-delete', function(){
		var curInqID = $(this).attr('data-id');
		
		if(confirm('삭제하시겠습니까?')){
			$.ajax({
	       		type	: "POST",
	       		url		: "/pc/topseller/sellerroom/sellerroomQnaDeleteAjax.do",
	       		dataType: "json",
	       		async: false,
	       		data	: {brdInqIdx : curInqID},
	       		success : function(data) {
	       			alert('삭제 완료했습니다.')
	       			funcGetQnAList(1);
	       		}, error : function(err) {
	       			console.log(err);
	       		}
	       	});
		}
	});
	
	var funcGetQnAList = function(pPage){
		var dataParam = { VDR_MST_IDX : "<c:out value="${commandMap.VDR_MST_IDX}"/>", offset : pPage, searchQnaMemId : $('#check-2').is(':checked') ? 'Y' : 'N'}
	
       	$.ajax({
       		type	: "POST",
       		url		: "/pc/topseller/sellerroom/sellerroomQnaListAjax.do",
       		dataType: "json",
       		data	: dataParam,
       		success : function(data) {
       			renderQnAList(pPage, data);
       		}, error : function(err) {
       		}
       	});
	};
	
	
	$('#check-2').on('change', function(){
		funcGetQnAList(1);
	});
	
	funcGetQnAList(1);
	
	
	
	/**********************  QnA REGISTER AND MODIFY Process **********************/
	
	$("#inquiryForm").validate({
        rules: 
        {
        	BRD_INQ_TITLE:{required:true, maxlength:40},
			BRD_INQ_CONTENTS:{required:true, maxlength:1500}
        },
        messages :
        {
        	BRD_INQ_TITLE: {required:"[제목]은 필수 정보입니다..", maxlength:"비밀번호는 최대 40글자입니다."},
        	BRD_INQ_CONTENTS: {required:"[내용]은 필수 정보입니다.", maxlength:"비밀번호는 최대 1500글자입니다."}
        }
        ,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
        ,onkeyup:false
	    ,onclick:false
	    ,onfocusout:false
        ,showErrors:function(errorMap, errorList){
 	       if(this.numberOfInvalids()) { 
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
	
	var openInquiryPopup = function(pIsOpen) {
		if(pIsOpen) {
			
			$('#layer_inquiry').css({
			   'top' : '50%',
			   'left' : '50%',
			   'margin' : '-320px 0 0 -455px',
			   'display' : 'block'
			});
			
			//$('#layer_inquiry').show();
			$('.bg_layer').show();
			
		} else {
			$('#layer_inquiry').hide();
			$('.bg_layer').hide();
			$("#inquiryForm")[0].reset();
			$("#BRD_INQ_PUB_YN").attr("checked", false);
		}
	}
	
	var renderInquiryInfo = function(pData) {
		
		$('#BRD_INQ_TITLE').val(pData.BRD_INQ_TITLE);
		$('#BRD_INQ_CONTENTS').val(pData.BRD_INQ_CONTENTS.replace(/\<br\>/ig, '\r\n'));
		if(pData.BRD_INQ_PUB_YN == 'Y') $('#BRD_INQ_PUB_YN').prop('checked', false);
		else  $('#BRD_INQ_PUB_YN').prop('checked', true);
	}
	
	var getInquiryInfo = function(pID){
	   	$.ajax({
    		type	: "POST",
    		url		: "/pc/product/productQnaInfoAjax.do",
    		dataType: "json",
    		data	: {BRD_INQ_IDX: pID},
    		success : function(data) {
    			renderInquiryInfo(data.info);
    		}, error : function(err) {
    		}, complete : function(){
    		}
    	});
	}
	
	$(document).on('click', '.inquiry_popup', function(){
		
		$('#inquiryForm input[name="BRD_INQ_IDX"]').val('');
		
		var curId = $(this).attr('data-id');
		if(curId && curId.length > 0) {
			$('#write').text('수정');
			$('#inquiryForm input[name="BRD_INQ_IDX"]').val(curId);
			openInquiryPopup(true);
			getInquiryInfo(curId);
		}
		else if(GetIsLogin() == false){
			alert('로그인이 필요한 서비스입니다.');
		} else {
			$('#write').text('등록');
			openInquiryPopup(true);	
		}
	});
	
	$('.inquiry_popup_close').on('click', function(){
		openInquiryPopup(false);
	});
	
	
	var isQnaAjax = false;
	$(document).on("click", "#write", function(){
		if(isQnaAjax) return;
		var $inquiryForm = $("#inquiryForm");
		if($inquiryForm.valid()){
			
			if(confirm('저장하시겠습니까?')) {
				var queryString = $inquiryForm.serialize() ;
				isQnaAjax = true;
				console.log(queryString);
		        $.ajax({
		            type : 'post',
		            url : '/pc/topseller/sellerroom/sellerroomQnaRegistAjax.do',
		            data : queryString,
		            //dataType : 'json',
		            error: function(xhr, status, error){
		            	alert('저장에 실패했습니다.');
		            },
		            success : function(json){
		            	if(json.result == 'SUCCESS') {
		            		alert('자장에 성공했습니다.');
			            	openInquiryPopup(false);
			            	funcGetQnAList(1);	
		            	} else {
		            		alert('자장에 실패했습니다.');
		            	}
		            	
		            },
		            complete : function() {
		            	isQnaAjax = false;
		            }
		        });
			}
		}
	});
});

</script>
