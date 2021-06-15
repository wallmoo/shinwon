<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/myInquiryTop.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="cp01">
                    <div class="writeWrap fix">
                    
                    <form name="frm" id="frm" enctype="multipart/form-data">
						<input type="hidden" name="MEM_ADV_IDX" id="MEM_ADV_IDX" value="<c:out value="${row.MEM_ADV_IDX }" />" />
						
                        <div class="name"><em class="must">필수</em>상담유형</div>
                        <div class="form">
                        
                            <select title="상담유형 선택" id="MEM_ADV_QST_TYPE" name="MEM_ADV_QST_TYPE">
                                <option value="">선택</option>
                                <c:if test="${not empty inqTypeCodeList }">
									<c:forEach var="inqTypeCodeRow" items="${inqTypeCodeList }" varStatus="i" >
										<option value="<c:out value="${inqTypeCodeRow.CMN_COM_IDX }" />" <ui:select v="${row.MEM_ADV_QST_TYPE }" t="${inqTypeCodeRow.CMN_COM_IDX }" g="selected"/>>
											<c:out value="${inqTypeCodeRow.CMN_COM_NM }"/>
										</option>
									</c:forEach>
								</c:if>
                            </select>
                        </div>
                        <div class="name"><em class="must">필수</em>제목</div>
                        <div class="form">
                            <input type="tel" title="제목 입력" placeholder="제목 입력 " id="MEM_ADV_TITLE" name="MEM_ADV_TITLE" value="<c:out value="${row.MEM_ADV_TITLE }" />">
                        </div>
                        <div class="name"><em class="must">필수</em>내용</div>
                        <div class="form">
                            <textarea class="high" title="내용 입력" id="MEM_ADV_CONTENTS" name="MEM_ADV_CONTENTS" placeholder="내용입력"><c:out value="${row.MEM_ADV_CONTENTS }" /></textarea>
                        </div>
                        <div class="name">이메일</div>
                        <div class="form">
                            <div class="email">
                                <div>
                                	<c:set var="emailary" value="${fn:split(row.MEM_ADV_MAIL,'@') }" />
                                	<input type="text" title="이메일 입력" placeholder="이메일 입력" id="MEM_ADV_MAIL_ID" value="<c:out value="${emailary[0] }" />" maxlength="20" >
                                </div>
                                <div class="at">@</div>
                                <div>
                                	<input type="text" title="이메일 주소 입력" placeholder="직접 입력" id="MEM_ADV_MAIL_DOMAIN" value="<c:out value="${emailary[1] }"/>">
                                </div>
                            </div>
                            <div class="space">
                                <select title="이메일 주소 선택" id="emailDomainSelectbox">
                                    <option value="" selected="selected">직접 입력</option>
                                    <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
                                    	<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
                                    		<option value="<c:out value="${emailRow.CMN_COM_NM }"/>" <ui:select v="${emailary[1]}" t="${emailRow.CMN_COM_NM }" g="selected"/>><c:out value="${emailRow.CMN_COM_NM }"/></option>
                                    	</c:forEach>
                                    </c:if>
                                </select>
                                <input type="hidden" id="MEM_ADV_MAIL" name="MEM_ADV_MAIL" >
                            </div>
                        </div>
                        <div class="name">휴대폰</div>
                        <div class="form">
                            <div class="phone">
                                <div>
                                    <select title="휴대폰 앞번호 선택" id="MEM_ADV_HP1" name="MEM_ADV_HP1">
                                        	<c:if test="${not empty codes.HP_CODE }">
												<c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
													<option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <ui:select v="${row.MEM_ADV_HP1}" t="${hpRow.CMN_COM_NM }" g="selected"/> ><c:out value="${hpRow.CMN_COM_NM }"/></option>
												</c:forEach>
											</c:if>
                                    </select>
                                </div>
                                <div><input type="tel" title="휴대폰 가운데 번호 입력" maxlength="4" id="MEM_ADV_HP2" name="MEM_ADV_HP2" value="<c:out value="${row.MEM_ADV_HP2 }" />"></div>
                                <div class="dash">-</div>
                                <div><input type="tel" title="휴대폰 뒷번호 입력" maxlength="4" id="MEM_ADV_HP3" name="MEM_ADV_HP3" value="<c:out value="${row.MEM_ADV_HP3 }" />"></div>
                            </div>
                        </div>
                        <div class="name">첨부파일</div>
                        <div class="form">
                            <div class="filebox">
                                <input type="text" class="upload-name" placeholder="파일을 추가하세요." name="" value="">
                                <label for="ex_filename" class="btn small">업로드</label>
                                <input type="file" id="ex_filename" class="upload-hidden" name="file">
                            </div>
                            <ul class="file_wrap">
                            	<c:if test="${not empty fileList }">
                            		<c:forEach var="fileRow" items="${fileList}" varStatus="i">
	                                <li>
	                                    <a href="#n" class="name" id="fileIdx_<c:out value='${fileRow.CMM_FLE_IDX }'/>" data-cmm_fle_idx="<c:out value='${fileRow.CMM_FLE_IDX }'/>" data-cmm_fle_save_path="<c:out value='${fileRow.CMM_FLE_SAVE_PATH }'/>">
	                                    	<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>(<c:out value="${fileRow.CMM_FLE_ATT_SIZE }" />MB)</a>
	                                    <a href="#n" class="del">삭제</a>
	                                </li>
                                	</c:forEach>
                                </c:if>
                            </ul>
                            <%-- <ul class="file_wrap">
	                            <c:if test="${not empty fileList }">
                            	<c:forEach var="fileRow" items="${fileList }" varStatus="i">
                                <li id="file_${fileRow.CMM_FLE_IDX }">
                                	<!-- 게시판 첨부파일 view -->
                                    <a href="#n" class="name"  id="fileIdx_<c:out value='${fileRow.CMM_FLE_IDX }'/>" data-cmm_fle_idx="<c:out value='${fileRow.CMM_FLE_IDX }'/>" data-cmm_fle_save_path="<c:out value='${fileRow.CMM_FLE_SAVE_PATH }'/>"><c:out value="${fileRow.CMM_FLE_ORG_NM }"/>(<c:out value="${fileRow.CMM_FLE_ATT_SIZE }" />)</a>
                                    <a href="#n" class="del" onclick="removeFile('${fileRow.CMM_FLE_IDX }')">삭제</a>
                                </li>
                                </c:forEach>
                                </c:if>
                            </ul> --%>
                            
                        </div>
                        </form>
                    </div>

                    <div class="tit_wp">
                        <p class="ct_tit">답변내용</p>
                    </div>
                    <div class="answer_cont_bx">
                        <p>답변 준비중입니다.</p>
                    </div>
                    <ul class="dot_list2">
                        <li>문의하신 내용과 답변내용 확인하실 수 있습니다.</li>
                        <li>질문 내용에 만족하실만한 답변 작성을 위해서 시간 소요가 될 수 있는 점 양해 부탁드립니다.</li>
                        <li>답변 완료된 문의는 수정 하실 수 없습니다.</li>
                    </ul>
                    <div class="btn_area third">
                        <button type="button" class="btn gray" id="goDelete">삭제</button>
                        <button type="button" class="btn black" id="goList">목록</button>
                        <button type="button" class="btn purple" id="goRegist">수정</button>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->


<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>

<script type="text/javascript">
        $(".ootd_list").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true
            }
        });
        
	$(function () {
		
        var $frm = $("#frm");
        
        $frm.validate({
            rules: {
            	MEM_ADV_QST_TYPE:{required:true},
            	MEM_ADV_TITLE:{required:true, maxlength:50},
            	MEM_ADV_CONTENTS:{required:true, maxlength:200},
            	MEM_ADV_MAIL_ID:{emailId:true},
            	MEM_ADV_MAIL_DOMAIN:{emailDomain:true},
            	MEM_ADV_HP2:{number:true, minlength:3 , maxlength:4},
            	MEM_ADV_HP3:{number:true, minlength:4 , maxlength:4}
            },
            messages :{
            	MEM_ADV_QST_TYPE:{required:"[상담유형]은 필수 정보입니다."},
            	MEM_ADV_TITLE: {required:"[제목]은 필수 정보입니다.", maxlength:"[제목]은 최대 50글자압니다."},
            	MEM_ADV_CONTENTS: {required:"[내용]은 필수 정보입니다.", maxlength:"[내용]은 최대 200글자압니다."},
            	MEM_ADV_MAIL_ID : {emailId:"이메일 아이디 형식을 올바르게 입력해 주십시오."},
            	MEM_ADV_MAIL_DOMAIN : {emailDomain:"이메일 도메인 형식을 올바르게 입력해 주십시오."},
            	MEM_ADV_HP2: {minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[휴대폰번호 중간자리]는 최대 4글자입니다."},
            	MEM_ADV_HP2: {minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[휴대폰번호 뒷자리]는 최대 4글자입니다."}
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
        	// 목록 이동
        	$("#goList").on("click", function(){
                $("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myInquiryList.do", "target":"_self", "method":"post"}).submit();
            });
        	
        	//수정하기
        	$("#goRegist").on("click", function(){
        		if($frm.valid()){
					if(confirm("문의내역을 수정 하시겠습니까?")){
	    			$("#MEM_ADV_MAIL").val($("#MEM_ADV_MAIL_ID").val() != "" ? $("#MEM_ADV_MAIL_ID").val() + "@" + $("#MEM_ADV_MAIL_DOMAIN").val() : "");
	    			$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myInquiryModify.do", "target":"_self", "method":"post"}).submit();
				}
	       	}
	    });
        	
        	//삭제하기
        	$("#goDelete").on("click", function () {
				if(confirm("삭제하시겠습니까?")){
					$("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/myInquiryRemove.do", "target":"_self", "method":"post"}).submit();
				}
			});
        	
	});           
        	
		
</script>