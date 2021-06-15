<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/business/include/businessSubTop.jsp" %>
 <!-- container -->
        <div id="container">
            <div id="content">
            <form id="frm" name="frm" method="post" enctype="multipart/form-data">
                <h2 class="ct_title">입점문의</h2>

                <p class="p_title">정보입력</p>
                <div class="tb_write">
                    <div class="t_right"><em class="star">필수</em>필수입력사항</div>
                    <table>
                        <caption>정보입력</caption>
                        <tbody>
                            <tr>
                                <th scope="col"><em class="star">필수</em>쇼핑몰 분류</th>
                                <td>
                                	<div>
                                    <select title="쇼핑몰 분류 선택" class="w50p" name="VDR_CST_GUBUN" id="selectBtn" onchange="selectBtn">
                                        <option value="" selected="selected">선택</option>
                                        <option value="여성의류" >여성의류</option>
                                        <option value="남성의류" >남성의류</option>
                                        <option value="생활" >생활</option>
                                        <option value="뷰티" >뷰티</option>
                                        <option id="text" value="기타" >기타</option>
                                    </select>
                                    </div>
                                    <div class="space">
                                        <textarea name="selectText" id="selectText" placeholder="직접 입력" ></textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>제목 </th>
                                <td>
                                    <input type="text" title="제목" placeholder="제목 입력" name="VDR_CST_TITLE" id="VDR_CST_TITLE">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>내용</th>
                                <td><textarea title="내용" placeholder="내용 입력" name="VDR_CST_CTS" id="VDR_CST_CTS"></textarea></td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>업체명 </th>
                                <td>
                                    <input type="text"	name="VDR_CST_NM" id="VDR_CST_NM" title="업체명" placeholder="업체명 입력">
                                    <br><span id="req_nm_txt_error" class="txt_error" style="display:none;">업체명은 특수문자를 입력하실 수 없습니다.</span>
                                    <input type="hidden" id="validReqName" value="F" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>사업자등록번호<br> (사업자등록증)</th>
                                <td>
                                    <div class="biz_num">
                                        <input type="text" name="VDR_CST_BUSI1" id="VDR_CST_BUSI1" data-next="VDR_CST_BUSI2" 	title="" class="onlyNumber" maxlength="3">
                                        <span>-</span>
                                        <input type="text" name="VDR_CST_BUSI2" id="VDR_CST_BUSI2" data-next="VDR_CST_BUSI3"	title="" class="onlyNumber" maxlength="2">
                                        <span>-</span>
                                        <input type="text" name="VDR_CST_BUSI3" id="VDR_CST_BUSI3" title="" class="onlyNumber" maxlength="5">
                                    </div>
                                    <div class="space">
                                        <div class="inp_pick">
                                            <input type="checkbox" id="biz_num" name="biz_num">
                                            <label for="biz_num">종사업자번호 입력</label>
                                        </div>
                                        <input type="text" name="VDR_CST_SUB_BUSI"	id="VDR_CST_SUB_BUSI" class="input_biz_num onlyNumber" title="종사업자번호 입력"  placeholder="입력"  maxlength="4" value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>담당자명</th>
                                <td>
                                    <input type="text" title="담당자명" placeholder="담당자명 입력" name="VDR_CST_MNG_NM" id="VDR_CST_MNG_NM">
                                    <br><span id="mng_nm_txt_error" class="txt_error" style="display:none;">담당자명은 숫자/특수문자를 입력하실 수 없습니다.</span>
                                    <input type="hidden" id="validMngName" value="F" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>담당자 휴대폰</th>
                                <td>
                                    <div class="phone">
                                        <select title="휴대폰 첫번째번호 선택" name="VDR_CST_HP1" id="VDR_CST_HP1">
                                            <option value="">선택</option>
                                            	<c:if test="${not empty codes.HP_CODE }">
				                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
				                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" 
				                                        		<c:if test="${hpRow.CMN_COM_NM}">selected="selected"</c:if>>
				                                        	<c:out value="${hpRow.CMN_COM_NM }"/>
				                                        </option>
				                                    </c:forEach>
				                                </c:if>
                                        </select>
                                        <span>-</span>
                                        <input type="text" name="VDR_CST_HP2" id="VDR_CST_HP2" class="phone1 onlyNumber" title="휴대폰 두번째번호 입력" maxlength="4" value="">
                                        <span>-</span>
                                        <input type="text" name="VDR_CST_HP3" id="VDR_CST_HP3" class="phone2 onlyNumber" title="휴대폰 세번째번호 입력" maxlength="4" value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">담당자 유선전화</th>
                                <td>
                                    <div class="phone">
                                        <select title="유선전화 첫번째번호 선택" name="VDR_CST_TEL1" id="VDR_CST_TEL1">
                                            <option value="">선택</option>
	                                            <c:if test="${not empty codes.TEL_CODE }">
	                                            	<c:forEach var="telRow" items="${codes.TEL_CODE }" varStatus="i">
	                                            		<option value="<c:out value="${telRow.CMN_COM_NM }"/>"
	                                            				<c:if test="${telRow.CMN_COM_NM eq memberInfo.MEM_MST_TEL1 }">selected="selected"</c:if>>
	                                            			<c:out value="${telRow.CMN_COM_NM }"/>
	                                            		</option>		
	                                            	</c:forEach>
	                                            </c:if>		
                                        </select>
                                        <span>-</span>
                                        <input type="text" name="VDR_CST_TEL2" id="VDR_CST_TEL2" class="phone1 onlyNumber" title="유선전화 두번째번호 입력" value="" maxlength="4">
                                        <span>-</span>
                                        <input type="text" name="VDR_CST_TEL3" id="VDR_CST_TEL3" class="phone2 onlyNumber" title="유선전화 세번째번호 입력" value="" maxlength="4">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>담당자 이메일</th>
                                <td>
                                    <div class="email">
                                        <input type="text" name="VDR_CST_MAIL_ID" id="VDR_CST_MAIL_ID" class="mail1" title="메일 아이디 입력" placeholder="이메일 입력" maxlength="20">
                                        <span>@</span>
                                        <input type="text" name="VDR_CTS_MAIL_DOMAIN" id="VDR_CTS_MAIL_DOMAIN" class="mail1" title="메일 주소 입력" placeholder="직접 입력">
                                        <select title="메일 주소 선택" id="emailDomainSelectbox">
                                            <option value="">직접 입력</option>
                                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
                                            	<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
								                   	<option value="<c:out value="${emailRow.CMN_COM_NM }"/>" <c:if test="${emailRow.CMN_COM_NM eq mail2}">selected="selected"</c:if>><c:out value="${emailRow.CMN_COM_NM }"/></option>
							                   	</c:forEach>
							     	     	</c:if>
                                        </select>
                                        <input type="hidden" name="VDR_CST_MAIL" id="VDR_CST_MAIL">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>사이트 url</th>
                                <td>
                                    <input type="text" name="VDR_CST_URL" id="VDR_CST_URL" title="사이트 url" placeholder="사이트url 입력">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col" >첨부파일</th>
                                <td>
                                    <!-- <div class="t_filebox">
                                        <a href="javascript:void(0)" class="t_file" id="fileView">첨부파일 </a>
                                        <span class="inp_pick"> <input type="checkbox" name="delete" id="delete1"><label for="delete1">삭제</label></span>
                                    </div> -->
                                    <div class="inpFile_wrap st2" id="fileView" >
                                        <div class="file_box" >
                                            <input type="text" title="파일 찾아보기" class="file_name" id="fileName_0" readonly="readonly" >
                                            <label for="inpFile_0" class="button_type">파일첨부</label>
                                            <input type="file" id="inpFile_0" name="file" class="" accept=".hwp, .doc, .docx, .xls, .xlsx, .pp, .pptx, .jpg, .gif, .png, .pdf" >
                                        </div>
                                        <button type="button" class="btn black add" id="addFile_0" name="addFile">+</button>
                                        <button type="button" class="btn black" id="fileDelBtn">파일지우기</button>
                                    </div>
                                    <p class="t_desc">* 업로드 가능 파일 : hwp, doc/docx, xls/xlsx, ppt/pptx, jpg, gif, png, pdf * 업로드 용량 : 20MB</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <div class="terms_area">
                    <div class="terms_title">
                        <div class="inp_pick">
                            <input type="checkbox" id="agree" name="VDR_CST_AGR_YN" value="Y">
                            <label for="agree">개인정보 수집 및 이용에 대한 동의<em>(필수)</em></label>
                        </div>
                        <a href="#n" class="b_detail on">상세보기</a>
                    </div>
                    <div class="terms_detail" style="display:block;">
                        <div class="t_cont">
                            <p class="tit">제 1장 총칙</p>
                            <p class="tit">제 1조 목적</p>
                            <p class="txt">이 약관은 홈페이지가 인터넷 서비스(이하 "서비스"라 합니다)를
                                제공함에 있어 회사와 회원간의 권리, 의무, 이용조건 및 절차, 기
                                타 필요한 사항을 규정함을 목적으로 합니다. </p>
                            <p class="tit">제 1장 총칙</p>
                            <p class="txt">1. 사이버 지점이란 회사가 재화 또는 용역을 이용자에게 제공하기
                                위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을
                                거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 회사를
                                운영하는 사업자의 의미로도 사용합니다.
                                이용자란 사이버 지점에 접속하여 이 약관에 따라 회사가 제공하
                                는 서비스를 받는 회원 및 비회원을 말합니다.
                                회원이라 함은 회사에 개인정보를 제공하여 회원등록을 한 자로서,
                                회사의 정보 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등
                                정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록
                                설정한 가상의영업장을 말하며, 아울러 회사를 운영하는 사업자
                                의 의미로도 사용합니다. 
                                이용자란 사이버 지점에 접속하여 이 약관에 따라 회사가 제공하
                                는 서비스를 받는 회원 및 비회원을 말합니다.
                                회원이라 함은 회사에 개인정보를 제공하여 회원등록을 한 자로서,
                                회사의 정보 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등
                                정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록
                                설정한 가상의 영업장을 말하며</p>
                        </div>
                    </div>
                </div>

                <div class="btn_area">
                    <button type="button" class="btn gray" onclick="javascript:goCancel()">취소</button>
                    <button type="button" class="btn ok" onclick="javascript:goRegist()">등록</button>
                </div>
			</form>
            </div>
        </div>
        <!-- //container -->


<%@ include file="/WEB-INF/jsp/pc/business/include/businessFooter.jsp" %>
<script src="<c:out value="${serverDomain}" />/nas/cdn/pc/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	
	var $frm = $("#frm");
	
	// 폼체크
	$frm.validate(
	{
	    rules: 
	    {
	    	VDR_CST_GUBUN:{required:true},				 				    	 // 쇼핑몰분류
	    	VDR_CST_TITLE:{required:true}, 				 					     // 제목
	    	VDR_CST_CTS:{required:true}, 				 					     // 내용
	    	VDR_CST_NM:{required:true}, 				 					     // 업체명
	    	VDR_CST_BUSI1 :{required:true, minlength:3 , maxlength:3},			 // 사업자번호
	    	VDR_CST_BUSI2 :{required:true, minlength:2 , maxlength:2},			 // 사업자번호
	    	VDR_CST_BUSI3 :{required:true,	minlength:5 , maxlength:5},			 // 사업자번호
	    	VDR_CST_SUB_BUSI : {required:true, minlength:4,	maxlength:4},		 // 종사업자번호
	    	VDR_CST_MNG_NM	:{required:true },									 // 담당자명
	    	VDR_CST_HP1:{required:true, maxlength:3}, 				 			 // 담당자휴대폰
	    	VDR_CST_HP2:{required:true, maxlength:4}, 				 			 // 담당자휴대폰
	    	VDR_CST_HP3:{required:true, maxlength:4}, 				 			 // 담당자휴대폰
	    	VDR_CST_MAIL:{required:true, emailId:true},							 // 이메일 아이디
	    	VDR_CTS_MAIL_DOMAIN:{required:true, emailDomain:true},				 // 이메일 도메인
	    	VDR_CST_URL:{required:true}, 				 					 	 // 사이트URL
            
	    },
	    messages :
	    {
	    	VDR_CST_GUBUN: {required:"[쇼핑몰분류]은 필수 정보입니다."},
	    	VDR_CST_TITLE: {required:"[제목]은 필수 정보입니다."},
	    	VDR_CST_CTS: {required:"[내용]은 필수 정보입니다."},
	    	VDR_CST_NM:	{required:"[업체명]은 필수 정보입니다."}, 
	    	VDR_CST_BUSI1: {required:"[사업자번호]는 필수 정보입니다."	,minlength:"[사업자번호 첫째자리]는 최소 3글자 이상입니다." , maxlength:"[사업자번호 첫째자리]는 최대 3글자입니다."},
	    	VDR_CST_BUSI2: {required:"[사업자번호]는 필수 정보입니다."	,minlength:"[사업자번호 중간자리]는 최소 2글자 이상입니다." , maxlength:"[사업자번호 중간자리]는 최대 2글자입니다."},
	    	VDR_CST_BUSI3: {required:"[사업자번호]는 필수 정보입니다."	,minlength:"[사업자번호 중간자리]는 최소 5글자 이상입니다." , maxlength:"[사업자번호 중간자리]는 최대 5글자입니다."},
	    	VDR_CST_SUB_BUSI : {required:"[종사업자번호를 입력해주세요]" ,minlength:"[종사업자번호 ]는 최소 4글자 이상입니다." , maxlength:"[종사업자번호 ]는 최대 4글자입니다."},
	    	VDR_CST_MNG_NM: {required:"[담당자명]은 필수 정보입니다."},
	    	VDR_CST_HP1: {required:"[휴대폰번호 앞자리]는 필수 정보입니다."},
	    	VDR_CST_HP2: {required:"[휴대폰번호 중간자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[연락처번호 중간자리]는 최대 4글자입니다."},
	    	VDR_CST_HP3: {required:"[휴대폰번호 뒷자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[연락처번호 뒷자리]는 최대 4글자입니다."},
	    	VDR_CST_MAIL : {required:"[이메일 아이디]는 필수 정보입니다.", emailId:" 형식을 올바르게 입력해 주십시오."},
	    	VDR_CTS_MAIL_DOMAIN : {required:"[이메일 도메인]은 필수 정보입니다.", emailDomain:"도메인 형식을 올바르게 입력해 주십시오."},
	    	VDR_CST_URL: {required:"[사이트URL]은 필수 정보입니다."},
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
	
	//파일업로드 수정
	var maxFileSize = 20000000;
	$("#inpFile_0").on("change", function(){
		
		 if( !$(this).val() ) return;
         var file = this.files[0];
         var size = file.size || file.fileSize;
         var limit = 20000000;
         
         var file1 = file.name.substring(file.name.lastIndexOf("\\") + 1, file.name.length);	 
         var file1 = file.name.slice(file.name.lastIndexOf(".")+1).toLowerCase();
         
         var file_extension1 = "hwp, doc, docx, xls, xlsx, pp, pptx, jpg, gif, png, pdf,zip";
                      
         if( size > limit || file_extension1.indexOf(file1) == -1)
         {
             alert( "용량(20MB이하), 형식(JPG, GIF, PNG)을 확인해주세요" );
             $(this).val('');
             return;
         }
         if(typeof val === file.name){
        	 return val.replace( /C:\\fakepath\\/i, "" );
         }
     $(this).parent().find('input[type=text]').val( $(this).val() );
	});
	
	//파일 업로드
	/* var maxFileSize = 10485760;	
	$("#inpfile_0").on("change", function(){
		
		var file = this.files[0];
		if(file == undefined){ return; }
		
		var file1 = file.name.slice(file.name.lastIndexOf(".")+1).toLowerCase();
		var file_extension1 = "hwp, doc, docx, xls, xlsx, pp, pptx, jpg, gif, png, pdf";
		if(file.size > maxFileSize || file_extension1.indexOf(file1) == -1 ){
			return alert("용량(20MB이하), 형식(hwp, doc, docx, xls, xlsx, pp, pptx, jpg, gif, png, pdf)을 확인해주세요");
		}
	}); */
	
	
	
	/* $("input[name='file']").on("change",function(){
		var fileName = this.files[0].name;
		$("#fileName_0").val(fileName);
		
	}); */
	
	//업체명 정규식 체크
	$("#VDR_CST_NM").on("blur", function () {
		var regType = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\+]{1,30}$/;
		var reqName = $('#VDR_CST_NM').val();
		if(!regType.test(reqName)){
			$('#VDR_CST_NM').addClass('error')
			$('#req_nm_txt_error').text("업체명은 특수문자를 입력하실 수 없습니다.")
			$('#req_nm_txt_error').show();
			$("#VDR_CST_NM").focus()
			return false;
		}else{
			$('#req_nm_txt_error').hide();
		}
	});
	
	//담당자명 정규식 체크
	$("#VDR_CST_MNG_NM").on("blur", function () {
		var regType = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\+]{1,15}$/;
		var reqName = $('#VDR_CST_MNG_NM').val();
		if(!regType.test(reqName)){
			$('#VDR_CST_MNG_NM').addClass('error')
			$('#mng_nm_txt_error').text("담당자명은 숫자/특수문자를 입력하실 수 없습니다.")
			$('#mng_nm_txt_error').show();
			$("#VDR_CST_MNG_NM").focus()
			return false;
		}else{
			$('#mng_nm_txt_error').hide();
		}
	});
	
	
	// 파일행 추가
	$(document).on("click","button[name='addFile']",function(){
		var fileNum = $(".file_box").length;    
		//var count = 0;
		var addStaffText =	'        <div class="inpFile_wrap st2 mt10" id="fileView_'+fileNum+'">'+
            '        <div class="file_box">'+
            '        <input type="text" title="파일 찾아보기" class="file_name" id="fileName'+fileNum+'" readonly="readonly">'+
            '        <label for="inpFile'+fileNum+'" class="button_type">파일첨부</label>'+
            '        <input type="file" id="inpFile'+fileNum+'" name="file" class="file_name" accept=".hwp, .doc, .docx, .xls, .xlsx, .pp, .pptx, .jpg, .gif, .png, .pdf" >'+
            '        </div>'+
            '        <button type="button" class="btn black add" id="rowDelete_'+fileNum+'" name="rowDelete" value="">-</button>'+
            //'   	 <button type="button" class="btn black" id="fileDelBtn">파일지우기</button>'+
            '		 </div>';
          //  count++;
            
            
        var trHtml = $( "div[id='fileView']" );
        
        trHtml.after(addStaffText);
        
    });
	/* <div class="inpFile_wrap st2" id="fileView">
    <div class="file_box">
        <input type="text" title="파일 찾아보기" class="file_name" id="fileName" readonly="readonly">
        <label for="inpFile" class="button_type">파일첨부</label>
        <input type="file" id="inpFile" name="file" class="file_btn" accept=".hwp, .doc, .docx, .xls, .xlsx, .pp, .pptx, .jpg, .gif, .png, .pdf">
    </div>
    <button type="button" class="btn black add" id="addFile" name="addFile">+</button>
    <button type="button" class="btn black" id="fileDelBtn">파일지우기</button>
</div> */
		//파일삭제 버튼
	    $(document).on("click","button[name='rowDelete']",function(){
	        
	        var fileViewId = "fileView_"+this.id.split("_")[1];
	        
	        $("#"+fileViewId).remove();
	    });
	
		
	
	/* // 파일 행 추가 클릭 이벤트
    $("#addFile").click(function(){
    	var fileNum = $("#fileView div").children().length;
    	
    	$("#fileView").append
    	('<div class="file_box">'+'<input type="text" title="파일 찾아보기" class="file_name" id="fileName" readonly="readonly">'+'<label for="inpFile" class="button_type">파일첨부</label>'+'<input type="file" id="inpFile" name="file" class="file_btn" accept=".hwp, .doc, .docx, .xls, .xlsx, .pp, .pptx, .jpg, .gif, .png, .pdf">'+'</div>'
    			+ '<button type="button" class="btn black add" id="rowDelete" name="rowDelete">-</button>'+'<button type="button" class="btn black" id="fileDelBtn">파일지우기</button>'+'</div>');
    	
    	$('#rowDelete').on('click', function () { 
            $(this).prev().remove (); // remove the textbox
            $(this).next ().remove (); // remove the <br>
            $(this).remove (); // remove the button
        });
    }); */
    
  //이메일정보 정규식 체크
	$("#VDR_CST_MAIL_ID").on("blur", function () {
		var regType = /^([0-9a-zA-Z_\.-]+)$/;
			if(!regType.test($("input[id='VDR_CST_MAIL_ID']").val())){
				alert("이메일 계정을 확인해주세요.")
				return false;
		}
	});
    
  //사이트 URL정규식
	/* $("#VDR_CST_URL").on("blur", function () {
		var regType = /^([a-z0-9-]+\.)+[a-z0-9]{2,4}.*$/
			if(!regType.test($("input[id='VDR_CST_URL']").val())){
				alert("사이트 URL을 확인해주세요.")
				return false;
		}
	}); */
	
  //사업자번호 자동커서
	$(function () {
		
		 $(".onlyNumber").keyup (function () {
		        var NumLimit = $(this).attr("maxlength");
		        console.log(NumLimit);
		        if (this.value.length >= NumLimit) {
		            console.log(this.value.length);
		            
		            $("#"+$(this).data("next")).focus();
		            return false;
		        }
		    })
	});
		
	// 파일 지우기
 	$(document).on("click", "#fileDelBtn", function(){
 		$("#fileName_0").val('');
 	});     	
	
 
	        
	//이메일 도메인 select box 변경 이벤트
	$(document).on("click", "#emailDomainSelectbox", function () 
	{
	    var $domain = $("#VDR_CTS_MAIL_DOMAIN");
	    
	    if($(this).val() == "")
	    {
	        $domain.prop("readonly", false);
	        $domain.val("");
	    }
	    else
	    {
	        $domain.prop("readonly", true);
	        $domain.val($(this).val());
	    }
	});
	
	//종사업자 번호 이벤트
	$("#VDR_CST_SUB_BUSI").attr("disabled", true);
    $("#biz_num").on('click',function(){
        var chk = $('input:checkbox[id="biz_num"]').is(":checked");
        if(chk==true){
            $("#VDR_CST_SUB_BUSI").removeAttr('disabled');
            $("#biz_num").removeClass("on");
        }else{
            $("#VDR_CST_SUB_BUSI").attr("disabled", true);
            $("#biz_num").addClass("on");
        }
    });
    
  //쇼핑몰 분류 클릭 이벤트
	$("#selectText").hide();
  	$("#selectBtn").change(function () {
  		var state = $("#selectBtn option:selected").val();
  		if( state == "기타"){
  			$("#selectText").show();
  			
  		}else{
  			$("#selectText").hide();
  		}
	});
	
	
		
	// 등록 버튼 클릭 이벤트
    goRegist = function () {
 		
 		if($frm.valid()){
               // 이메일 ID + DOMAIN
                
	           $("#VDR_CST_MAIL").val($("#VDR_CST_MAIL_ID").val() + "@" + $("#VDR_CTS_MAIL_DOMAIN").val());
    
               if($("#selectBtn").val() == "기타"){
            	   $("#selectBtn option:selected").val($("#selectText").val());  
               }
	 			
               if(!$("input[id=agree]").is(':checked')){
	                alert("개인정보 수집이용에 동의해주세요.");
	                $("#agree").focus();
	                return;
	            }          
          		
          		if(confirm( "등록 하시겠습니까?")) {
          			
  	            	$frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/business/standingPointCounselRegist.do", "target":"_self", "method":"post"}).submit();
               }   
        }
    };
    
    // 취소 클릭 이벤트
    goCancel = function(){
		location.href = "<c:out value="${frontDomain }"/>/pc/business/businessMain.do";	 			
};
    
	
</script>
