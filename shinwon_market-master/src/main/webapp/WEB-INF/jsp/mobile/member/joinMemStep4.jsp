<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <!-- #snb -->
                <!-- // #snb -->
				<form id="dataForm" 	name="dataForm" 	method="post">
				<input type="hidden" name="double_submit_token" id="double_submit_token" value="${double_submit_token}"/>
				<%-- <input type="hidden" name="TAG_LIST"	id="TAG_LIST" 	value="${tagList }"/> --%>
				<c:forEach var="type" items="${commandMap}">
				   <input type="hidden" name="${type.key}" id="${type.key}" value="${type.value}"/>
				</c:forEach>
				</form>
                <div class="cp01">
                    <div class="title_wp mb">
                        <p class="ct_title">태그선택</p>
                        <div class="right">
                            <ol class="step_wp">
                                <li><span>1</span><p>약관동의</p></li>
                                <li><span>2</span><p>정보입력</p></li>
                                <li class="on" title="현재단계"><span>3</span><p>태그선택</p></li>
                                <li><span>4</span><p>희망태그</p></li>
                                <li><span>5</span><p>스타일정보</p></li>
                                <li><span>6</span><p>가입완료</p></li>
                            </ol>
                        </div>
                    </div>
                    <div class="info_join_text">
                        <p class="tit">어떤 스타일을<br>좋아하세요?</p>
                        <p class="txt">선택하시는 태그의 상품을 보여드리며, 마이페이지에서 변경하실 수 있습니다. (필수선택 2개)</p>
                    </div>
                    <div class="gray_box st2 mg_reset">
                        <div class="set_tag list" >
                        	<ul id="selected_tag_result" class="result">
                            <!-- <span class="tag" >
                            	<em>span</em><a href="#n" class="del">삭제</a>
                            </span> -->
                            </ul>
                        </div>
                        <div class="btn_reset">
                            <button type="button" class="b_reset" id="resetBtn">초기화</button>
                        </div>
                        <ul class="tag_select mCustomScrollbar" tabindex="0" id="tagContainer">
                        	<c:forEach var="tags" items="${tagList}" varStatus="status">
	                            <li>
	                            	<input type="checkbox" name="feeds" id="feed-${tags.TAG_MST_ID }" data-id="${tags.TAG_MST_ID }" data-txt="${tags.TAG_MST_TITLE }" value="${tags.TAG_MST_ID}"/>
	                            	<label for="feed-${tags.TAG_MST_ID }">${tags.TAG_MST_TITLE }</label>
	                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                    

                    <div class="btn_area dual">
                        <button  class="btn gray" id="bkBtn">이전</button>
                        <button  class="btn ok"   id="goBtn">다음</button>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>

<script>
	//태그선택 유효성 체크
	function getSelectedTag(){
		var tagList = [];
		var selectedTagList = $("input:checkbox[name=feeds]:checked");
		if(selectedTagList.length<2){
			return;
		}else{
			
		$(selectedTagList.each(function(index,item){
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

</script>

<script>

	$(function () {
		var $tagResultElem = $('#selected_tag_result');
		var $repTagResultElem = $('#selected_tag_rep');
		
		var itemHTML = '<span class="tag" data-id="{id}"><em>{name}</em><a href="#n" class="del" data-id="{id}">삭제</a></span>';
		
		//var repItemHTML = '<span>{name}</span>'
		
			var renderCheckTagUI = function() {
			$tagResultElem.empty();
			$repTagResultElem.empty();
			
			var totCount = 0;
			$('input:checkbox[name=feeds]').each(function(){
				if(this.checked) {
					var $curElem = $(this);
					var curHTML = itemHTML.replace('{name}', $curElem.data('txt')).replace('{id}', $curElem.data('id'))
					$tagResultElem.append(curHTML);
					
					/* totCount++;
					if(totCount <= 2) {
						var repHTML = repItemHTML.replace('{name}', $curElem.data('txt'));
						$repTagResultElem.append(repHTML);
					} */
				}
			})
		}
		//최초 모든 TAG 활성화
		/* $('input:checkbox[name=feeds]').each(function(){
			$(this).prop('checked', true);
		});
		renderCheckTagUI(); */
		
		$(document).on('click', '#selected_tag_result .del', function(){
			var $targetElem = $(this).closest('span');
			var dataId = $targetElem.attr('data-id');
			
			$('#feed-' + dataId).prop('checked', false);
			renderCheckTagUI();
		});
		
		/* $('#tag_reset').on('click', function(){
			$('input:checkbox[name=feeds]').each(function(){
				$(this).prop('checked', false);
			});
			renderCheckTagUI();
			alert("태그를 선택해주세요.")
		}); */
		
		$('input:checkbox[name=feeds]').on('change', function(){
			renderCheckTagUI();
		});
		
		
		
		//태그 추가
		/* $("input[type=checkbox]").each(function (index, item) {
			
			$(item).click(function () {
			var contents = $("label[for='"+item.id+"']").text();
			if(item.checked){
				$("#currentList").append('<span class="tag" '+ item.id +' ><em>'+ contents +'</em><a href="#n" class="del" id="'+ item.id +'">삭제</a></span>')
				}
			})
		});
		 */
		
		
		//태그삭제
		/* $(document).on("click", ".del", function() {
			$(this).parent().remove();
			$("#tagContainer").children().find("input[id='" + this.id + "']").attr('checked', false)
			
		}); */
		
		
		//초기화 버튼
		$("#resetBtn").on("click",function(){
			$(".del").parent().remove();
			$("#tagContainer").children().find("input[type='checkbox']").attr('checked', false);
		});
		
		
		//이전으로
		$("#bkBtn").on("click",function(){
			//location.href = "/pc/member/joinMemStep3.do";
			history.back();
		});
		
		$("#goBtn").on("click",function(){
			//if(!validateTag()) return;
			//if(!validateStyleInfo()) return;
			register();
		});
		
		function register(){
			var $frm = $("#dataForm");
			var selected_tag_result = $("input:checkbox[name=feeds]:checked");
			if(selected_tag_result.length<2){
				alert('2개이상 태그를 선택해 주세요');
				//$('input:checkbox[name=checkbox]').focus();
				return;
			}
			
			var tagList = getSelectedTag();
			$('#dataForm').append('<input type="hidden" id="TAG_LIST" name="TAG_LIST" value=\''+tagList+'\'/>');
			$("#dataForm").attr({"action":"/mobile/member/joinMemStep5.do", "target":"_self", "method":"post"}).submit();
		}
		
	});
	
	
</script>				
