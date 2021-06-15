<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-display blackyak"><%-- page class : mypage, 클래스 별로 디자인 패턴 분기에 필요 --%>

<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

<%-- 각 화면 본문 시작 --%>

<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
	<div id="contents"><!-- contents -->

		<div class="section-title"><!-- section-title -->
		    <h3><span>EVENT</span></h3>
		    <a href="javascript:goBack();" class="back"><span class="icon"><em>돌아가기</em></span></a>
		</div><!-- // section-title -->

		<div class="container"><!-- container -->
			<div class="wrap gutter event-board"><!-- wrap -->

				<div class=" grid section-plan"><!-- section-plan -->
				    <div class="col-1-1 plan-item">
				        <div class="item">
				            <span class="plan-date">
				            	[<c:out value="${row.EVT_MST_GUBUN eq 'Y' ? '단독' : '본사' }"/>] <ui:formatDate value="${row.EVT_MST_ST_DT }" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="${row.EVT_MST_ED_DT }" pattern="yyyy.MM.dd"/>
				            </span>
				            <strong class="plan-title">
				            	<c:out value="${row.EVT_MST_TITLE }"/>
				            </strong>
				            <p class="img-wrap mt15">
				                <img src="<c:out value="${cdnDomain}" />${row.CMM_FLE_ATT_PATH}${row.CMM_FLE_SYS_NM}" alt="<c:out value="${row.CMN_FLE_ALT_TXT}"/>">
				            </p>
				        </div>
				    </div>
				</div><!--// section-plan -->

				<div class="section-comment"><!-- section-comment -->
					<p class="reset info">상업적 게시글, 미풍양속에 위반되는 게시글, 이벤트 성격에 맞지 않는 게시글은 미통보 삭제될 수 있으니 양해바랍니다.</p>

					<form name="boardFrm" id="boardFrm" enctype="multipart/form-data">
						<input type="hidden" name="EVT_MST_IDX" value="${row.EVT_MST_IDX }"/>
						<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
						<input type="hidden" name="EVT_BOARD_IDX" value="<c:out value="${boardRow.EVT_BOARD_IDX }"/>"/>
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
						<double-submit:preventer/>
						<div class="grid comment-wrap fields"><!-- comment-wrap -->
						    <p class="reset col-1-3 text"><label for="commentTitle">제목</label></p>
						    <p class="reset col-2-3">
						        <input type="text" class="text xlarge" id="EVT_BOARD_TITLE" name="EVT_BOARD_TITLE" maxlength="50" value="<c:out value="${boardRow.EVT_BOARD_TITLE }"/>"/>
						    </p>
						</div><!-- // comment-wrap -->
						
						<div class="grid comment-content fields"><!-- comment-content -->
						    <p class="col-1-3 txt"><label for="commentContent">내용</label></p>
						    <p class="reset col-2-3">
						        <textarea class="textarea xlarge" id="EVT_BOARD_CONTENTS" name="EVT_BOARD_CONTENTS" maxlength="500">${boardRow.EVT_BOARD_CONTENTS }</textarea>
						    </p>
						</div><!-- // comment-content -->
					</form>
				</div><!-- // section-comment -->

				<ul class="list list-a"><!-- list -->
				    <li>파일 첨부는 PC버전에서만 지원합니다.</li>
				</ul><!-- // list -->

				<div class="grid section-button actions"><!-- section-button -->
				    <div class="col-1-2">
				        <a href="javascript:;" id="goBoardList" class="button primary full">
				            <span>목록</span>
				        </a>
				    </div>
				    <div class="col-1-2">
				        <a href="javascript:;" id="goModify" class="button warning full">
				            <span>등록</span>
				        </a>
				    </div>
				</div><!-- // section-button -->
				
				<form id="frm" name="frm">
	            	<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
	            	<input type="hidden" name="searchEvtMstStatus" value="<c:out value="${commandMap.searchEvtMstStatus }"/>" />
	            	<input type="hidden" name="searchEvtMstGubun" value="<c:out value="${commandMap.searchEvtMstGubun }"/>"/>
	            	<input type="hidden" name="EVT_MST_IDX" value=""/>
	            	<input type="hidden" name="BRAND_CD" value="${commandMap.BRAND_CD }"/>
            	</form>

				<div class="padder-bottom" aria-hidden="true"><!-- padder bottom --></div>

			</div><!-- wrap -->
		</div><!-- // container -->

	</div><!-- // contents -->

	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

	</div><!-- // innerWrap -->

</div><!-- // wrap -->

<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>

<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script src="<c:out value="${cdnDomain}" />/mobile/js/jquery.form.js"></script>
<script type="text/javascript">

	$(function(){
		
		//게시판형 이벤트 상세
		$(document).on("click","#goBoardList",function()
		{
			$("#boardFrm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/boardEventView.do", "target":"_self", "method":"get"}).submit();
		});
		
		//게시판형 이벤트 등록
		$(document).on("click","#goModify",function()
		{
			var $boardFrm = $("#boardFrm");
			if($.trim($("#EVT_BOARD_TITLE").val()) == "")
			{
				alert("[제목]반드시 입력해주세요.");
				$("#EVT_BOARD_TITLE").focus();
				return false;
			}
			
			if($.trim($("#EVT_BOARD_CONTENTS").val()) == "")
			{
				alert("[내용]반드시 입력해주세요.");
				$("#EVT_BOARD_CONTENTS").focus();
				return false;
			}
			
			if (confirm( "수정하시겠습니까?"))
            {
				$("#goBoardList").hide();
				$("#goModify").hide();
				var options = {
	           	    	type:"POST",
	           	   		dataType:"json",       	        
	           	        success: function(data) {
	           	        	if(data.isSuccessYn == "Y")
	           	        	{
	           	        		alert(data.resultMsg);
	           	        		$("#boardFrm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/customer/boardEventView.do", "target":"_self", "method":"get"}).submit();
	           	        	}
	           	        	else
	           	        	{
	           	        		alert(data.resultMsg);	
	           	        		$("#goBoardList").show();
	           					$("#goModify").show();
	           	        	}
	           	         },  
	    		       	 error:function(err)
	    		         {
	    		             alert("오류가 발생하였습니다.\n[" + err.status + "]");
	    		             $("#goBoardList").show();
	           				 $("#goModify").show();
	    		         }
	           	     };
	           	
				$boardFrm.attr("action", "<c:out value="${mobileDomain}"/>/mobile/customer/boardEventUpdate.do");
	           	$boardFrm.ajaxSubmit(options);
            }
		});
		
	});

</script>

</body>
</html>