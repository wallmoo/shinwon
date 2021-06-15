<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/business/include/business_head.jsp" %>


<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_top.jsp" %>

		
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<form id="frm" name="frm" method="post" enctype="multipart/form-data">
        <double-submit:preventer/>		
		<article id="container" class="container">
			<div class="contents"><!-- .contents S -->
				
				<!-- .sub_lay S -->
				<section class="sub_lay">
					<div class="sub_head">
						<h2 class="minW">입점 상담신청</h2>
					</div>
					
					<dl class="minW counsel_ask">
						<dt>
							<strong>입점 상담신청</strong>
							<span class="tx_ex"><i class="co_red">*</i> 표시된 항목은 필수 입력 사항입니다.</span>
						</dt>
						<dd id="dd_inpForm" class="dd_inpForm">
							<table>
								<caption>입점 상담신청에 대표상품군, 담당자명, 연락처, 휴대폰번호, 팩스번호, 담당자 이메일, 입점신청요약, 입점신청내용, 판매희망채널, 현대 유통방법, 홈페이지, 비고, 관련서류로 구성된 표</caption>
								<colgroup>
									<col style="width:140px" />
									<col style="width:339px" />
									<col style="width:140px" />
									<col style="width:339px" />
								</colgroup>
								<tbody>
									<tr>
										<th>대표상품군 <i class="co_red">*</i></th>
										<td colspan="3" class="td_represent">
											<div class="inp_box">
												<label for="searchPrdCtgDepth1" class="f">
													<select id="searchPrdCtgDepth1" name="searchPrdCtgDepth1" class="sel_chg" title="대카테고리">
														<option value="">전체</option>
													</select>
												</label>
												<label for="searchPrdCtgDepth2" class="l">
													<select id="searchPrdCtgDepth2" name="searchPrdCtgDepth2" class="sel_chg" title="중카테고리">
														<option value="">전체</option>
													</select>
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>담당자명 <i class="co_red">*</i></th>
										<td class="td_personName">
											<div class="inp_box">
												<label for="VDR_CST_MNG_NM">
													<input type="text" name="VDR_CST_MNG_NM" id="VDR_CST_MNG_NM" maxlength="30" />
												</label>
											</div>
										</td>
										<th>전화 <i class="co_red">*</i></th>
										<td class="td_tel">
											<div class="inp_box">
												<label for="VDR_CST_TEL1" class="">
													<select class="sel_chg" id="VDR_CST_TEL1" name="VDR_CST_TEL1" title="전화번호 앞자리">
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
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_CST_TEL2">
													<input type="text" class="text small number" name="VDR_CST_TEL2" id="VDR_CST_TEL2" maxlength="4" title="전화번호 중간자리" />
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_CST_TEL3">
													<input type="text" class="text small number" name="VDR_CST_TEL3" id="VDR_CST_TEL3" maxlength="4" title="전화번호 끝자리" />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>휴대폰번호 <i class="co_red">*</i></th>
										<td class="td_phone">
											<div class="inp_box">
												<label for="VDR_CST_HP1" class="">
													<select class="sel_chg" id="VDR_CST_HP1" name="VDR_CST_HP1" title="휴대폰 번호 앞자리">
						                                <option value="">선택</option>
						                                <c:if test="${not empty codes.HP_CODE }">
						                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
						                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" 
						                                        		<c:if test="${hpRow.CMN_COM_NM eq memberInfo.MEM_MST_HP1 }">selected="selected"</c:if>>
						                                        	<c:out value="${hpRow.CMN_COM_NM }"/>
						                                        </option>
						                                    </c:forEach>
						                                </c:if>
						                            </select>													
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_CST_HP2">
													<input type="text" class="text small number" id="VDR_CST_HP2" name="VDR_CST_HP2" maxlength="4" title="휴대폰 번호 중간자리" />
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_CST_HP3">
													<input type="text" class="text small number" id="VDR_CST_HP3" name="VDR_CST_HP3" maxlength="4" title="휴대폰 번호 끝자리" />
												</label>
											</div>
										</td>
										<th>팩스번호</th>
										<td class="td_fax">
											<div class="inp_box">
												<label for="VDR_CST_FAX1" class="">
													<select class="sel_chg" id="VDR_CST_FAX1" name="VDR_CST_FAX1" title="팩스 앞자리">
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
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_CST_FAX2">
													<input type="text" class="text small number" name="VDR_CST_FAX2" id="VDR_CST_FAX2" maxlength="4" title="팩스 중간자리" />
												</label>
												<span class="ico_tx">-</span>
												<label for="VDR_CST_FAX3">
													<input type="text" class="text small number" name="VDR_CST_FAX3" id="VDR_CST_FAX3" maxlength="4" title="팩스 끝자리" />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>담당자 이메일 <i class="co_red">*</i></th>
										<td colspan="3" class="td_email">
											<div class="inp_box">
												<label for="VDR_CST_MAIL_ID" class="blind">email 아이디</label>
												<input type="text" name="VDR_CST_MAIL_ID" id="VDR_CST_MAIL_ID" maxlength="20" />
												<span class="ico_tx">@</span>
												<label for="VDR_CST_MAIL_DOMAIN" class="blind">email 도메인</label>
												<input type="text" name="VDR_CST_MAIL_DOMAIN" id="VDR_CST_MAIL_DOMAIN" maxlength="30" />
												<input type="hidden" id="VDR_CST_MAIL" name="VDR_CST_MAIL" />
												<label for="emailDomainSelectbox" class="sel_box">
													<select id="emailDomainSelectbox" class="sel_chg">
														<option value="">직접입력</option>
							                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
								                            <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
								                            	<option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
							                            	</c:forEach>
							                            </c:if>
													</select>													
												</label>
											</div>
										</td>
									</tr>
									
									<tr>
										<th>입점신청요약 <i class="co_red">*</i></th>
										<td colspan="3" class="td_askTx">
											<div class="f inp_box">
												<label for="">
													<input type="text" name="VDR_CST_SUM" id="VDR_CST_SUM" maxlength="20"/>
												</label>
												<span class="tx_ex">※20자 이내로 작성해주세요</span>
											</div>
										</td>
									</tr>
									<tr>
										<th>입점신청내용 <i class="co_red">*</i></th>
										<td colspan="3" class="td_askTx2">
											<div class="f inp_box">
												<textarea id="VDR_CST_CTS" name="VDR_CST_CTS" maxlength="1000" placeholder="입점신청내용입니다."></textarea>
											</div>
											<p class="tx_ex">※최대 1000자 이내로 작성해주세요</p>
										</td>
									</tr>								
									<tr>
										<th>판매희망채널 <i class="co_red">*</i></th>
										<td colspan="3" id="td_channel" class="td_channel">
											<div class="inp_box">
											
											<c:if test="${not empty codes.HOPESALE_TYPE }">	
											<c:forEach var="row" items="${codes.HOPESALE_TYPE }" varStatus="i">
	                                      		<label for="VDR_CST_ON_OFF_${i.index }" class="<c:if test="${i.count eq 1 }">on</c:if>">
	                                            <input type="radio" name="VDR_CST_ON_OFF" id="VDR_CST_ON_OFF_${i.index }" value="${row.CMN_COM_IDX }" <c:if test="${i.count eq 1 }">checked="checked"</c:if> />
	                                            <span>${row.CMN_COM_NM}</span>
	                                           	</label>
	                                      	</c:forEach>	
	                                      	</c:if>		
											</div>
										</td>
									</tr>
									<tr>
										<th>현재 유통방법 <i class="co_red">*</i></th>
										<td colspan="3" id="td_distri" class="td_distri">
											<div class="inp_box">
												<table>
													<caption>현재 유통방법에 체크항목 표</caption>
													<colgruop>
													<col />
													<col />
													<col />
													<col />
													<col />
													</colgruop>
													<tbody>
													
													<c:forEach var="row" items="${codes.NOWDISTRIBUTION_TYPE }" varStatus="i">
														<c:if test="${i.count eq 1 or i.count eq 6 }"></tr></c:if>
														<td>
				                                   			<label for="VDR_CST_DTB_${i.index }" class="checkbox">
				                                            <input type="checkbox" name="VDR_CST_DTB" id="VDR_CST_DTB_${i.index }" value="${row.CMN_COM_IDX }" class="chk" />
				                                            <span>${row.CMN_COM_NM}</span>
				                                        	</label>
			                                        	</td>
			                                        	<c:if test="${i.count eq 5 or i.count eq 10 }"></tr></c:if>
			                                      	</c:forEach>
			                                      	<input type="hidden" name="RESULT_VDR_CST_DTB" id="RESULT_VDR_CST_DTB" value="" />
			                                      	
													</tbody>
												</table>
												
											</div>
										</td>
									</tr>
									<tr>
										<th>홈페이지</th>
										<td colspan="3" class="td_homepg">
											<div class="inp_box">
												<label for=""> 
													<span>http://</span>
													<input type="text" name="VDR_CST_URL" id="VDR_CST_URL" maxlength="100"  />
												</label>
											</div>
										</td>
									</tr>
									<tr>
										<th>비고</th>
										<td colspan="3" class="td_msg">
											<div class="inp_box">
												<textarea id="VDR_CST_ETC" name="VDR_CST_ETC" maxlength="100"></textarea>
											</div>
										</td>
									</tr>
									<tr>
										<th>관련서류</th>
										<td colspan="3" id="td_file" class="td_file">
											<div class="f inp_box">
												<label for="upload1"> 
													<span>상품제안서 : </span>
													<input type="text" name="file1" />
	
													<input type="file" name="file" id="file1" class="file" />
													<a href="javascript:void(0)" class="btn_gre"><span>찾아보기</span></a>
												</label>
												<a href="javascript:void(0)" class="btn_gre2" data-file_no="1"><span>파일지우기</span></a>
												<p class="tx_ex">※10MB이하(zip, ppt/pptx, hwp, doc/docx, pdf)</p>
											</div>
											
											<div class="inp_box">
												<label for="upload2"> 
													<span>회사소개서 : </span>
													<input type="text" name="file2"  />
	
													<input type="file" name="file" id="file2" class="file" />
													<a href="javascript:void(0)" class="btn_gre"><span>찾아보기</span></a>
												</label>
												<a href="javascript:void(0)" class="btn_gre2" data-file_no="2"><span>파일지우기</span></a>
												<p class="tx_ex">※10MB이하(zip, ppt/pptx, hwp, doc/docx, pdf)</p>
											</div>
	
											<div class="l inp_box">
												<label for="inp_file_2"> 
													<span>제품인증서(해당상품만) : </span>
													<input type="text" name="file3" />
	
													<input type="file" name="file" id="file3" class="file" />
													<a href="javascript:void(0)" class="btn_gre"><span>찾아보기</span></a>
												</label>
												<a href="javascript:void(0)" class="btn_gre2" data-file_no="3"><span>파일지우기</span></a>
												<p class="tx_ex">※10MB이하(zip, pdf, jpg)</p>
											</div>
											
										</td>										
									</tr>
								</tbody>
							</table>						
						</dd>
						<dd class="dd_btn">
							<a href="javascript:goRegist();" class="btn_red"><span>확인</span></a>
							<a href="javascript:goCancel();" class="btn_gre"><span>취소</span></a>
						</dd>
					</dl>
				</section>
				<!--// .sub_lay E -->
	
			</div> <!--// .contents E -->
		</article>
		</form>
		
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/business/include/business_footer.jsp" %>
		
	</section>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>

	$(function(){
		
		// 대표상품군 SelectBox
		getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${frontDomain}"/>", "P");
		
		$(document).on("click", "#searchPrdCtgDepth1", function () 
	    {
	        getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${frontDomain}"/>", "P");
	    });
		
		$(document).on("change", "input[type=file]", function(){
			var _this = $(this);
			_this.prev('input[type="text"]').val(_this.val());
		});
		
		//관련서류
		$(document).on("click", ".btn_gre2", function(){
			var file_no = $(this).data("file_no");
			//$(this).prev().find('input').val('');
			$(this).prev().find('input').remove();
			
			var htmlStr = "<input type=\"text\" name=\"file"+ file_no +"\" /><input type=\"file\" name=\"file\" id=\"file"+ file_no +"\" class=\"file\" /> ";
			
			$(this).prev().find("a").before(htmlStr);
		});
		
		//관련서류
		/* var _td_file = $('#td_file');

		$('#td_file').find('input[type="file"]').on('change', function(){
			var _this = $(this);
			_this.prev('input[type="text"]').val(_this.val());
		});
		$('#td_file').find('.btn_gre2').on('click', function(){
			var file_no = $(this).data("file_no");
			//$(this).prev().find('input').val('');
			$(this).prev().find('input').remove();
			
			var htmlStr = "<input type=\"text\" name=\"file"+ file_no +"\" /><input type=\"file\" name=\"file\" id=\"file"+ file_no +"\" class=\"file\" /> ";
			
			$(this).prev().find("a").before(htmlStr);
		}); */		
		
		//판매희망채널
		var _td_channel = $('#td_channel');
		 
		_td_channel.find('label').on('click', function(){
			var _this = $(this);

			_this.addClass('on').find('input[type="radio"]').prop('checked', true);
			_this.siblings().removeClass('on').find('input[type="radio"]').prop('checked', false);
			return false;
		});	
		
		//현재 유통방법
		var _td_distri = $('#td_distri');
		
		_td_distri.find('label').on('click', function(){
			var _this = $(this),
				_inp_chk = _this.find('input[type="checkbox"]');

			if(_this.hasClass('on')){
				_this.removeClass('on');
				_inp_chk.prop('checked', false);
			}else{
				_this.addClass('on');
				_inp_chk.prop('checked', true);
			}
			return false;
		});		
		
		
		fileDel = function(str){
			if(str == "upload1"){
				$("#upload1").val("");
			}else if(str == "upload2"){
				$("#upload1").val("");				
			}else if(str == "upload3"){
				$("#upload3").val("");				
			}
		};
		
		var $frm = $("#frm");
		
		// 폼체크
	    $frm.validate(
	    {
	        rules: 
	        {
	       		searchPrdCtgDepth1 : {required:true},								 // 대표상품군 1 Depth
	       		searchPrdCtgDepth2 : {required:true},								 // 대표상품군 2 Depth
	       		VDR_CST_MNG_NM : {required:true, maxlength:30},						 // 담당자명
	            VDR_CST_TEL1:{required:true},										 // 연락처번호 앞자리
	            VDR_CST_TEL2:{required:true, number:true, minlength:3 , maxlength:4},// 연락처번호 중간자리
	            VDR_CST_TEL3:{required:true, number:true, minlength:4 , maxlength:4},// 연락처번호 뒷자리
	            VDR_CST_HP1:{required:true},										 // 핸드폰번호 앞자리
	            VDR_CST_HP2:{required:true, number:true, minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
	            VDR_CST_HP3:{required:true, number:true, minlength:4 , maxlength:4}, // 핸드폰번호 뒷자리
	            VDR_CST_FAX2:{number:true, minlength:3 , maxlength:4}, 				 // 팩스번호 중간자리
	            VDR_CST_FAX3:{number:true, minlength:4 , maxlength:4}, 				 // 팩스번호 뒷자리	            
	            VDR_CST_MAIL_ID:{required:true, emailId:true},						 // 이메일 아이디
	            VDR_CST_MAIL_DOMAIN:{required:true, emailDomain:true},				 // 이메일 도메인	   	
	            VDR_CST_SUM :{required:true, maxlength:20},							 // 입점신청요약 
	            VDR_CST_CTS :{required:true, maxlength:2000},						 // 입점신청내용 
	            VDR_CST_URL :{maxlength:100},										 // 홈페이지
	            VDR_CST_ETC :{maxlength:100}										 // 비고
	            
	        },
	        messages :
	        {
	        	searchPrdCtgDepth1: {required:"[대표상품군] 1Depth는 필수 정보입니다."},
	        	searchPrdCtgDepth2: {required:"[대표상품군] 2Depth는 필수 정보입니다."},
	        	VDR_CST_MNG_NM: {required:"[담당자명]은 필수 정보입니다."},
	        	VDR_CST_TEL1: {required:"[연락처번호 앞자리]는 필수 정보입니다."},
	        	VDR_CST_TEL2: {required:"[연락처번호 중간자리]는 필수 정보입니다." ,minlength:"[연락처번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[연락처번호 중간자리]는 최대 4글자입니다."},
	        	VDR_CST_TEL3: {required:"[연락처번호 뒷자리]는 필수 정보입니다." ,minlength:"[연락처번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[연락처번호 뒷자리]는 최대 4글자입니다."},	        	
	        	VDR_CST_HP1: {required:"[휴대폰번호 앞자리]는 필수 정보입니다."},
	        	VDR_CST_HP2: {required:"[휴대폰번호 중간자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[휴대폰번호 중간자리]는 최대 4글자입니다."},
	        	VDR_CST_HP3: {required:"[휴대폰번호 뒷자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[휴대폰번호 뒷자리]는 최대 4글자입니다."},
	        	VDR_CST_MAIL_ID : {required:"[이메일 아이디]는 필수 정보입니다.", emailId:"아이디 형식을 올바르게 입력해 주십시오."},
	        	VDR_CST_MAIL_DOMAIN : {required:"[이메일 도메인]은 필수 정보입니다.", emailDomain:"도메인 형식을 올바르게 입력해 주십시오."},	  	        	
	        	VDR_CST_SUM : {required:"[입점신청요약]은 필수 정보입니다."},  	        	
	        	VDR_CST_CTS : {required:"[입점신청내용]은 필수 정보입니다."}  	        	
	        }
	        //,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
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
		
 		// 이메일 도메인 select box 변경 이벤트
	    $(document).on("click", "#emailDomainSelectbox", function () 
	    {
	        var $domain = $("#VDR_CST_MAIL_DOMAIN");
	        
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
 		
 		
		// 파일용량, 확장자 체크
		/* $('.file').bind('change', function() {
			var fileSize1 = this.files[0].size;
			var file1 = this.files[0].name;
	   		
	   		var extensionF1 = file1; //파일을 추가한 input 박스의 값
	   		extensionF1 = extensionF1.slice(extensionF1.lastIndexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	   		var thisObject = this.id;
	   		
	   		//console.log("extensionF1 >>>" , extensionF1);
	   		
	   		// 파일용량 체크
	   		if(fileSize1 > 5120000){
	   			alert('파일 용량(5MB)만 등록 가능합니다.');
	   			$("#"+thisObject).val('');
	   			return;
	   		}

	   		var file_extension1 = "zip,ppt,pptx,hwp,doc,docx,pdf";	   		
	   		var file_extension2 = "zip,pdf,jpg";	   		
	   		
	   		// 확장자 검사
	   		if(thisObject == "file1" || thisObject == "file2"){
	   			if(file_extension1.indexOf(extensionF1) <= 0){
	   				alert('파일(' + file_extension1 + ')만 등록 가능합니다.');
	   				//$(this).prev().find('input').val('');
	   				//$("#"+thisObject).val('');
	   				$('input[name='+thisObject +']').val('');
	   				return;
	   			}
	   		}else{
	   			if(file_extension2.indexOf(extensionF1) <= 0){
	   				alert('파일(' + file_extension2 + ')만 등록 가능합니다.');
	   				//$("#"+thisObject).val('');
	   				$('input[name='+thisObject +']').val('');	   				
	   				return;
	   			}	   			
	   		}
	   		
		}); */ 		
		
 		
	 	// 등록 버튼 클릭 이벤트
	    goRegist = function () {
	 		
	 		if($frm.valid()){
	 			
	 			if($("input:radio[name='VDR_CST_ON_OFF']:checked").length <= 0){
		 			alert("판매희망채널을 한개이상 선택하세요.");
		 			$("input:radio[name='VDR_CST_ON_OFF']").eq(0).focus();
		 			return;
		 		}	 			
	 			
	 			if($("input:checkbox[name='VDR_CST_DTB']:checked").length <= 0){
		 			alert("현재 유통방법을 한개이상 선택하세요.");
		 			$("input:checkbox[name='VDR_CST_DTB']").eq(0).focus();
		 			return;
		 		}	 			
	 			
	 			var rVdrCstDtb = '';
	 			
	       		$('input[name=VDR_CST_DTB]:checked').each(function(){
	       			if(rVdrCstDtb != '') rVdrCstDtb += '|';
	       			rVdrCstDtb += $(this).val();
	       		});	 			
	       		
	       		$('input[name=RESULT_VDR_CST_DTB]').val(rVdrCstDtb);	    
	       		
                // 이메일 ID + DOMAIN
                $("#VDR_CST_MAIL").val($("#VDR_CST_MAIL_ID").val() + "@" + $("#VDR_CST_MAIL_DOMAIN").val());
           		
           		if(confirm( "저장 하시겠습니까?")) {
   	                $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/business/standingPointCounselRegist.do", "target":"_self", "method":"post"}).submit();
                }   
	        }
	    };
	    
	    // 취소 클릭 이벤트
	    goCancel = function(){
 			location.href = "<c:out value="${frontDomain }"/>/pc/business/businessMain.do";	 			
	    };
	    
	});
</script>
</body>
</html>