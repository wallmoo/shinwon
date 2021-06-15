<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
				<form id="dataForm" name="dataForm" method="post">
				<%-- <input type="hidden" name="double_submit_token" id="double_submit_token" value="${double_submit_token}"/> --%>
			    <c:forEach var="type" items="${commandMap}">
				   <input type="hidden" name="${type.key}" id="${type.key}" value="${type.value}"/>
				</c:forEach>
	            </form>
                <div class="cp01">
                    <div class="title_wp">
                        <p class="ct_title">희망태그</p>
                        <div class="right">
                            <ol class="step_wp">
                                <li><span>1</span><p>약관동의</p></li>
                                <li><span>2</span><p>정보입력</p></li>
                                <li><span>3</span><p>태그선택</p></li>
                                <li class="on" title="현재단계"><span>4</span><p>희망태그</p></li>
                                <li><span>5</span><p>스타일정보</p></li>
                                <li><span>6</span><p>가입완료</p></li>
                            </ol>
                        </div>
                    </div>
                    <div class="info_join_text">
                        <p class="tit">태그로<br>등록하고 싶은 정보를<br>입력해 주세요.</p>
                        <p class="txt">요청하시는 태그가 없으면 Pass!</p>
                    </div>
                    <div class="hope_tag">
                        <textarea title="희망태그 입력" placeholder="희망태그 입력 (선택사항)" id="wishTagList" name="wishTagList" ></textarea>
                    </div>

                    <div class="btn_area dual">
                        <button  class="btn gray" id="bkBtn">이전</button>
                        <button  class="btn ok" id="goBtn">다음</button>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>

<script>
	//희망태그 -> JSON
	/* function registTagTitle(tagObj) {
		var regexp = "/[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\$%&\\\=\(\'\"]/gi";
		var tagObj = tagVal.replace(regexp, "").replace(/ /g, "").split("#");
		var result = JSON.stringify(tagObj);
		if(tagObj.length>1){
			tagObj.splice(0,1);
		}
		return tagObj;
	}; */
	
	$(function () {
		$("#wishTagList").on("blur", function () {
			var regexp = "/[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\$%&\\\=\(\'\"]/gi";
			var tagObj = tagVal.replace(regexp, "").replace(/ /g, "").split("#");
			var result = JSON.stringify(tagObj);
			if(tagObj.length>1){
				tagObj.splice(0,1);
			return ;
			}
		})
	})
	
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
		var wishTag = $("#wishTagList").val();
		
		$('#dataForm').append('<input type="hidden" id="WSH_TAG_TITLE_LIST" name="WSH_TAG_TITLE_LIST" value="'+wishTag+'"/>');
		$("#dataForm").attr({"action":"/mobile/member/joinMemStep6.do", "target":"_self", "method":"post"}).submit();
	};
</script>


