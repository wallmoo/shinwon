<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

<div id="container">
		<div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">피드 관리</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				
				<%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%>
				
				
				<div class="sch-box">
					<div class="sch-box-inner">
						<p class="sch-title"><strong>현재 노출 중인 #태그</strong><span>선택한 #태그 기준으로 상품 및 컨텐츠를 추천해드립니다.</span></p>
						
						<div class="recom-tag-list">
							<ul id="selected_tag_result" class="result">
								<!-- <li>
									<strong>#오버핏</strong><button type="button" class="btn-del"><span>삭제</span></button>
								</li> -->
							</ul>
						</div>
						<p class="sch-title"><strong>추가 가능한 #태그</strong></p>
						<div class="sch-list mCustomScrollbar" tabindex="0">
							<div class="sch-list-inner">
								<ul>
									<c:forEach var="tags" items="${feedTagList }" varStatus="status">
									<li>
										<input type="checkbox" name="feeds" id="feed-${tags.TAG_MST_ID }" data-id="${tags.TAG_MST_ID }" data-txt="${tags.TAG_MST_TITLE }" />
										<label for="feed-${tags.TAG_MST_ID }"><span class="icon"></span>${tags.TAG_MST_TITLE }</label>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="btn_wrap">
							<button 	id="tag_reset"  class="btn_large gray">초기화</button>
							<button  	id="tag_submit" class="btn_large purple"><span>적용</span></button>
						</div>
					</div>
				</div>

			</div>
			<!-- //sub_content -->



		</div>
	</div>
	
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
	$(function () {
		/////////////////  TAG PROCESS START ////////////////
		var $tagResultElem = $('#selected_tag_result');
		var $repTagResultElem = $('#selected_tag_rep');
		
		var itemHTML = '<li data-id="{id}"><strong>{name}</strong><button type="button" class="btn-del"><span>삭제</span></button><li>';
		
		var repItemHTML = '<span>{name}</span>'
		
			var renderCheckTagUI = function() {
			$tagResultElem.empty();
			$repTagResultElem.empty();
			
			var totCount = 0;
			$('input:checkbox[name=feeds]').each(function(){
				if(this.checked) {
					var $curElem = $(this);
					var curHTML = itemHTML.replace('{name}', $curElem.data('txt')).replace('{id}', $curElem.data('id'))
					$tagResultElem.append(curHTML);
					
					totCount++;
					if(totCount <= 3) {
						var repHTML = repItemHTML.replace('{name}', $curElem.data('txt'));
						$repTagResultElem.append(repHTML);
					}
				}
			})
		}
		//최초 모든 TAG 활성화
		$('input:checkbox[name=feeds]').each(function(){
			$(this).prop('checked', true);
		});
		renderCheckTagUI();
		
		$(document).on('click', '#selected_tag_result .btn-del', function(){
			var $targetElem = $(this).closest('li');
			var dataId = $targetElem.attr('data-id');
			
			$('#feed-' + dataId).prop('checked', false);
			renderCheckTagUI();
		});
		
		$('#tag_reset').on('click', function(){
			$('input:checkbox[name=feeds]').each(function(){
				$(this).prop('checked', false);
			});
			renderCheckTagUI();
			alert("태그를 선택해주세요.")
		});
		
		$('input:checkbox[name=feeds]').on('change', function(){
			renderCheckTagUI();
		});
		
		$('#tag_submit').on('click', function(){
			getSelectedTag();
			register();
		});
		/////////////////  TAG PROCESS FINISH ////////////////
		
		function getSelectedTag(){
			var tagList = [];
			var selectedTagList = $("input:checkbox[name=feeds]:checked");
			if(selectedTagList.length<1){
				alert('1개이상 태그를 선택해 주세요');
				return;
			}
			selectedTagList.each(function(index,item){
				var tagId = $(this).val();
				tagList.push({
					TAG_MST_ID:tagId,
					TAG_BND_STATUS:'USE',
					TAG_BND_REP:'Y',
					TAG_BND_TYPE:'TYPE_MEMBER'
				});
			});
			return JSON.stringify(tagList);
		};
		
		
		
	});
</script>