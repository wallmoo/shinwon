<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
 <!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <!-- #snb -->
                <!-- // #snb -->

                <div class="cp01">
                	<form id="dataForm" name="dataForm" method="post">
                    <div class="title_wp mb">
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
                        <textarea title="희망태그 입력" id="wishTagList" name="wishTagList"  placeholder="희망태그 입력 (선택사항)"></textarea>
                    </div>
                    </form>
                    <div class="btn_area dual">
                        <button type="button" class="btn big black">이전</button>
                        <button type="button" class="btn big ok">다음</button>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->


<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script>

	function register(){
		var wishTag = $("#wishTagList").val();
		$('#dataForm').append('<input type="hidden" id="WSH_TAG_TITLE_LIST" name="WSH_TAG_TITLE_LIST" value="'+wishTag+'"/>');
		$("#dataForm").attr({"action":"/mobile/member/joinMemStep6.do", "target":"_self", "method":"post"}).submit();
	}
</script>