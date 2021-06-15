<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/myInquiryTop.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="cp01">
                    <div class="writeWrap">
                        <div class="name"><em class="must">필수</em>상담유형</div>
                        <form name="frm" id="frm" enctype="multipart/form-data">
                        	<input type="hidden" id="cPage" name="cPage" value="${commandMap.cPage }">
                        
                        <div class="form">
                            <select id="MEM_ADV_QST_TYPE" name="MEM_ADV_QST_TYPE" title="상담유형 선택">
                                <option value="" selected="selected">상담유형 선택</option>
                                	<c:if test="${not empty inqTypeCodeList }">
										<c:forEach var="inqTypeCodeListRow" items="${inqTypeCodeList }" varStatus="i">
											<option value='<c:out value="${inqTypeCodeListRow.CMN_COM_IDX }" />'><c:out value="${inqTypeCodeListRow.CMN_COM_NM }" /></option>
										</c:forEach>
									</c:if>		
                            </select>
                        </div>
                        <div class="name"><em class="must">필수</em>제목</div>
                        <div class="form">
                            <input type="text" id="MEM_ADV_TITLE" name="MEM_ADV_TITLE"	title="제목" placeholder="제목 입력" maxlength="50">
                        </div>
                        <div class="name"><em class="must">필수</em>내용</div>
                        <div class="form">
                            <textarea class="high"	id="MEM_ADV_CONTENTS" name="MEM_ADV_CONTENTS" title="내용 입력" placeholder="내용 입력" maxlength="400"></textarea>
                        </div>
                        <div class="name">이메일</div>
                        <div class="form">
                            <div class="email">
                                <div><input type="text" id="MEM_ADV_MAIL_ID" name="MEM_ADV_MAIL_ID" title="이메일 입력" placeholder="이메일 입력"></div>
                                <div class="at">@</div>
                                <div><input type="text" id="MEM_ADV_MAIL_DOMAIN" name="MEM_ADV_MAIL_DOMAIN"	title="이메일 주소 입력" placeholder="직접 입력"></div>
                            </div>
                            <div class="space">
                                <select id="emailDomainSelectbox" title="이메일 주소 선택">
                                    <option value="" selected="selected">직접 입력</option>
                                    <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
										<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
		                            		<option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
	                            		</c:forEach>
									</c:if>
                                </select>
                            </div>
                        </div>
                        <div class="name">휴대폰</div>
                        <div class="form">
                            <div class="phone">
                                <div>
                                    <select	id="MEM_ADV_HP1" name="MEM_ADV_HP1" title="휴대폰 앞번호 선택">
                                        <option value="" selected="selected">선택</option>
                                        <c:if test="${not empty codes.HP_CODE }">
		                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
		                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
		                                    </c:forEach>
		                                </c:if>
                                    </select>
                                </div>
                                <div>
                                	<input type="tel" id="MEM_ADV_HP2"	name="MEM_ADV_HP2"	title="휴대폰 가운데 번호 입력" maxlength="4">
                                </div>
                                <div class="dash">-</div>
                                <div>
                                	<input type="tel" id="MEM_ADV_HP3" name="MEM_ADV_HP3"	ititle="휴대폰 뒷번호 입력" maxlength="4">
                                </div>
                            </div>
                        </div>
                        <div class="name">첨부파일</div>
                        <div class="form">
                            <div class="filebox">
                                <input type="text" class="upload-name" placeholder="파일을 추가하세요.">
                                <label for="ex_filename" class="btn small">업로드</label>
                                <input type="file" id="ex_filename" class="upload-hidden" accept=".jpg, .gif">
                            </div>
                            <ul class="file_wrap">
                                <!-- <li>
                                    <a href="#n" class="name" ></a>
                                    <a href="#n" class="del">삭제</a>
                                </li> -->
                            </ul>
                        </div>
                        </form>
                    </div>
                    <div class="btn_area dual">
                        <button type="button" class="btn gray" onclick="goList()">취소</button>
                        <button type="button" class="btn ok" onclick="goRegist()">등록</button>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>   
<script src="<c:out value="${serverDomain}" />/nas/cdn/mobile/js/jquery.validate.js"></script>
<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript">
        /* $(".ootd_list").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true
            }
        }); */
        
     // 이메일 도메인 select box 변경 이벤트
        $("#emailDomainSelectbox").on("click", function (){
            var $domain = $("#MEM_ADV_MAIL_DOMAIN");

            if($(this).val() == "")
            {
                $domain.prop("readonly", false);
                $domain.val("");
            }
            else
            {
                $domain.prop("readonly", true);
                $domain.val($(this).val());
                $("#memEmailDomain").html("");
            }
        });
     
        var $frm = $("#frm");
    	// 폼체크
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
    	
    	//파일사이즈
        var maxFileSize = 2097152;	
    	$("#ex_filename").on("change", function(){
    		
    		var file = this.files[0];
    		if(file == undefined){ return; }
    		
    		var file1 = file.name.slice(file.name.lastIndexOf(".")+1).toLowerCase();
    		var file_extension1 = "jpg,gif";
    		if(file.size > maxFileSize || file_extension1.indexOf(file1) == -1 ){
    			return alert("용량(2MB이하), 형식(JPG, GIF)을 확인해주세요");
    		}
    	});

    	//파일삭제		
   		removeFileUi = function(id){
   			$("#"+id).remove();
   			$("#ex_filename").val("");
   		}
    	
   		goRegist = function(){
   			if($frm.valid()){
   				if(confirm("문의내역을 등록 하시겠습니까?")){
   		    		$("#MEM_ADV_MAIL").val($("#MEM_ADV_MAIL_ID").val() != "" ? $("#MEM_ADV_MAIL_ID").val() + "@" + $("#MEM_ADV_MAIL_DOMAIN").val() : "");
   		       		$frm.attr({"action":"<c:out value="${frontDomain}"/>/mobile/mypage/inquiryRegist.do", "target":"_self", "method":"post"}).submit();
   				}
   	       	}
   		}
   		
   		// 목록 버튼 클릭 이벤트
   	    goList = function () {
   	        $("#frm").attr({"action":"<c:out value="${frontDomain}"/>/mobile/mypage/myInquiryList.do", "target":"_self", "method":"post"}).submit();
   	    };
    	
    </script>