<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/business/include/businessSubTop.jsp" %>

<!-- container -->
        <div id="container">
            <div id="content">
            <form id="frm" name="frm" method="post" enctype="multipart/form-data">
            	
            	
                <h2 class="ct_title">입점신청</h2>

                <p class="p_title">입점안내</p>
                <ul class="num_info">
                    <li>
                        <span class="num">1</span>
                        <p class="tit">입점신청서 작성</p>
                        <p class="txt">입점신청서를 작성해 주세요.</p>
                    </li>
                    <li>
                        <span class="num">2</span>
                        <p class="tit">담당자 검토 및 상담 진행</p>
                        <p class="txt">입점업무 담당자가 신청내용을 검토한 후 전화 또는 이메일로 입점상담을 진행합니다.</p>
                    </li>
                    <li>
                        <span class="num">3</span>
                        <p class="tit">거래 조건 협의 및 계약 체결</p>
                        <p class="txt">입점 시 거래 조건을 협의한 후 입점 계약서를 작성합니다.</p>
                    </li>
                </ul>


                <p class="p_title">정보입력</p>
                <div class="tb_write">
                    <div class="t_right"><em class="star">필수</em>필수입력사항</div>
                    <table>
                        <caption>정보입력</caption>
                        <tbody>
                            <tr>
                                <th scope="col"><em class="star">필수</em>업체명</th>
                                <td>
                                    <input type="text" name="VDR_REQ_NM" id="VDR_REQ_NM" title="업체명" maxlength="40" value="">
                                    <br><span id="req_nm_txt_error" class="txt_error" style="display:none;">업체명은 특수문자를 입력하실 수 없습니다.</span>
                                    <input type="hidden" id="validReqName" value="F" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>대표자명 </th>
                                <td>
                                    <input type="text" name="VDR_REQ_CEO_NM" id="VDR_REQ_CEO_NM" title="대표자명" maxlength="15" value="">
                                    <br><span id="ceo_nm_txt_error" class="txt_error" style="display:none;">대표자명은 숫자/특수문자를 입력하실 수 없습니다.</span>
                                    <input type="hidden" id="validCeoName" value="F" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="col" rowspan="2"><em class="star">필수</em>사업자등록번호<br> (사업자등록증)</th>
                                <td>
                                    <div class="biz_num" id="input_onlyNumber" >
                                        <input type="text" class="onlyNumber"  name="VDR_REQ_BUSI1" data-next="VDR_REQ_BUSI2" id="VDR_REQ_BUSI1" title="" maxlength="3">
                                        <span>-</span>
                                        <input type="text" class="onlyNumber" name="VDR_REQ_BUSI2" data-next="VDR_REQ_BUSI3" id="VDR_REQ_BUSI2" title="" maxlength="2" >
                                        <span>-</span>
                                        <input type="text" class="onlyNumber" name="VDR_REQ_BUSI3" id="VDR_REQ_BUSI3" title="" maxlength="5" >
                                    </div>
                                    <div class="space">
                                        <div class="inp_pick">
                                            <input type="checkbox" id="biz_num" name="biz_num">
                                            <label for="biz_num">종사업자번호 입력</label>
                                        </div>
                                        <input type="text" name="VDR_REQ_SUB_BUSI" id="VDR_REQ_SUB_BUSI" class="input_biz_num onlyNumber" title="종사업자번호 입력" maxlength="4" placeholder="입력" value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="inpFile_wrap">
                                        <div class="file_box">
                                            <input type="text" title="파일 찾아보기" class="file_name" id="fileName" readonly="readonly">
                                            
                                            <label for="inpFile" class="button_type">파일첨부</label>
                                            <input type="file" id="inpFile" name="file" class="file_btn" accept=".jpg, .gif, .png, .pdf">
                                        </div>
                                        <button type="button" class="btn black" id="fileDelBtn">파일지우기</button>
                                    </div>
                                    <p class="t_desc">* 업로드 가능 파일 : jpg, gif, png, pdf * 업로드 용량 : 10MB</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>사업장주소</th>
                                <td>
                                    <div class="zipcode">
                                        <input type="text" name="VDR_REQ_POST5" id="VDR_REQ_POST5" maxlength="5" title="우편번호"  readonly="readonly" value="">
                                        <button id="zipCheck" type="button" class="btn black" value="">우편번호 찾기</button>
                                    </div>
                                    <div class="address space">
                                        <input type="text" name="VDR_REQ_DR_ADDR1" id="VDR_REQ_DR_ADDR1" title="상세 주소" maxlength="100" value="" readonly="readonly">
                                        <input type="text" name="VDR_REQ_DR_ADDR2" id="VDR_REQ_DR_ADDR2" title="나머지 주소" placeholder="나머지 주소 입력" maxlength="100" value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">세금계산서 이메일</th>
                                <td>
                                    <div class="email">
                                        <input type="text" name="VDR_REQ_TAX_MAIL_ID" id="VDR_REQ_TAX_MAIL_ID" class="mail1" title="메일 아이디 입력" maxlength="20" value="">
                                        <span>@</span>
                                        <input type="text" name="VDR_REQ_MAIL_DOMAIN" id="VDR_REQ_MAIL_DOMAIN" class="mail1" title="메일 주소 입력"  value="">
                                        <select title="메일 주소 선택" id="emailDomainSelectbox">
                                            <option value="">직접 입력</option>
                                            <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
                                            	<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
								                   	<option value="<c:out value="${emailRow.CMN_COM_NM }"/>" <c:if test="${emailRow.CMN_COM_NM eq mail2}">selected="selected"</c:if>><c:out value="${emailRow.CMN_COM_NM }"/></option>
							                   	</c:forEach>
							     	     	</c:if>
                                        </select>
                                        <input type="hidden" name="VDR_REQ_TAX_MAIL" id="VDR_REQ_TAX_MAIL">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>업태/업종(종목)</th>
                                <td>
                                    <div class="job">
                                        <input type="text" name="VDR_REQ_BUSI_CDT" id="VDR_REQ_BUSI_CDT" title="업태 입력" maxlength="10" placeholder="업태 입력" value="">
                                        <span>/</span>
                                        <input type="text" name="VDR_REQ_BUSI_TYPE" id="VDR_REQ_BUSI_TYPE" title="업종 입력" maxlength="10" placeholder="업종 입력" value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>연락처</th>
                                <td>
                                    <div class="phone">
                                        <select title="연락처 첫번째번호 선택" name="VDR_REQ_REF_TEL1" id="VDR_REQ_REF_TEL1">
                                            <option value="">선택</option>
                                            <option value="010">010</option>
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
                                        <input type="text" name="VDR_REQ_REF_TEL2" id="VDR_REQ_REF_TEL2" class="onlyNumber phone1" title="연락처 두번째번호 입력" maxlength="4" value="">
                                        <span>-</span>
                                        <input type="text" name="VDR_REQ_REF_TEL3" id="VDR_REQ_REF_TEL3" class="onlyNumber phone2" title="연락처 세번째번호 입력" maxlength="4" value="">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">팩스</th>
                                <td>
                                    <div class="phone">
                                        <select title="팩스 첫번째번호 선택" name="VDR_REQ_FAX1" id="VDR_REQ_FAX1">
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
                                        <input type="text" name="VDR_REQ_FAX2" id="VDR_REQ_FAX2" class="phone1 onlyNumber" title="팩스 두번째번호 입력" maxlength="4">
                                        <span>-</span>
                                        <input type="text" name="VDR_REQ_FAX3" id="VDR_REQ_FAX3" class="phone2 onlyNumber" title="팩스 세번째번호 입력" maxlength="4">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">은행명</th>
                                <td>
                                    <select title="은행명 선택" class="w50p" name="VDR_REQ_BANK_CD" id="VDR_REQ_BANK_CD">
                                        <option value="">선택</option>
                                        	<c:if test="${not empty codes.KICC_BANK_CD }">
				                                <c:forEach var="bankRow" items="${codes.KICC_BANK_CD }" varStatus="i">
				                                    <option value="<c:out value="${bankRow.CMN_COM_ETC1 }"/>" 
				                                    		<c:if test="${bankRow.CMN_COM_NM eq memberInfo.MEM_MST_TEL1 }">selected="selected"</c:if>>
				                                    	<c:out value="${bankRow.CMN_COM_NM }"/>
				                                    </option>
				                                </c:forEach>
			                                </c:if>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">계좌번호</th>
                                <td>
                                    <input type="text" name="VDR_REQ_ACT_NO" id="VDR_REQ_ACT_NO" class="onlyNumber" title="계좌번호" placeholder="계좌번호 ’-’ 없이 입력"  maxlength="30" value="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">예금주</th>
                                <td>
                                    <input type="text" name="VDR_REQ_ACT_HDR" id="VDR_REQ_ACT_HDR" title="예금주" placeholder="예금주명 입력" maxlength="10" value="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>쇼핑몰명</th>
                                <td>
                                    <input type="text" name="VDR_REQ_SHP_NM" id="VDR_REQ_SHP_NM" title="쇼핑몰명" placeholder="쇼핑몰명 입력" value="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>사이트url</th>
                                <td>
                                    <input type="text" name="VDR_REQ_URL" id="VDR_REQ_URL" title="사이트url" placeholder="사이트url 입력" value="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>쇼핑몰 분류</th>
                                <td>
                                	<div>
                                    <select title="쇼핑몰 분류 선택" class="w50p" name="VDR_REQ_SHP_GUBUN" id="selectBtn" onchange="selectBtn">
                                        <option value="" selected="selected">선택</option>
                                        <option value="여성의류" >여성의류</option>
                                        <option value="남성의류" >남성의류</option>
                                        <option value="여성주얼리" >여성주얼리</option>
                                        <option value="남성잡화" >남성잡화</option>
                                        <option value="여성슈즈" >여성슈즈</option>
                                        <option value="남성슈즈" >남성슈즈</option>
                                        <option value="생활" >생활</option>
                                        <option value="뷰티" >뷰티</option>
                                        <option value="기타" >기타</option>
                                    </select> 
                                    </div>
                                    <div class="space">
                                        <textarea name="selectText" id="selectText" placeholder="직접 입력" maxlength="1000" ></textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>외부채널</th>
                                <td>
                                    <ul class="pickBox01">
                                        <li><input type="checkbox" id="c01" name="channelList" value="네이버 스마트스토어" required="required" ><label for="c01">네이버 스마트스토어</label></li>
                                        <li><input type="checkbox" id="c02" name="channelList" value="W컨셉" required="required"><label for="c02">W컨셉</label></li>
                                        <li><input type="checkbox" id="c03" name="channelList" value="무신사" required="required"><label for="c03">무신사</label></li>
                                        <li><input type="checkbox" id="c04" name="channelList" value="29CM" required="required"><label for="c04">29CM</label></li>
                                        <li><input type="checkbox" id="c05" name="channelList" value="스타일쉐어" required="required"><label for="c05">스타일쉐어</label></li>
                                        <li><input type="checkbox" id="c06" name="channelList" value="브랜디" required="required"><label for="c06">브랜디</label></li>
                                        <li><input type="checkbox" id="c07" name="channelList" value="지그재그" required="required"><label for="c07">지그재그</label></li>
                                        
                                        <li><input type="checkbox" id="c11" name="channelList" value="우신사" required="required"><label for="c11">우신사</label></li>
                                        <li><input type="checkbox" id="c12" name="channelList" value="하고" required="required"><label for="c12">하고</label></li>
                                        <li><input type="checkbox" id="c13" name="channelList" value="오씨오" required="required"><label for="c13">오씨오</label></li>
                                        <li><input type="checkbox" id="c14" name="channelList" value="EQL" required="required"><label for="c14">EQL</label></li>
                                        <li><input type="checkbox" id="c15" name="channelList" value="종합몰" required="required"><label for="c15">종합몰</label></li>                                        
                                        
                                        <li><input type="checkbox" id="c08" name="channelList" value="블로그" required="required"><label for="c08">블로그</label></li>
                                        <li><input type="checkbox" id="c09" name="channelList" value="인스타그램" required="required"><label for="c09">인스타그램</label></li>
                                        <li><input type="checkbox" id="c10" name="channelList" value="오프라인" required="required"><label for="c10">오프라인</label></li>
                                        <li><input type="checkbox" id="c11" name="channelList" value="기타" required="required" onchange="setDisplay()"><label for="c11">기타</label></li>
                                    </ul>
                                    <div class="space">
                                        <textarea name="pickBoxText" id="pickBoxText"  placeholder="직접 입력" maxlength="1000"></textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>담당자명</th>
                                <td>
                                    <input type="text" name="VDR_REQ_MNG_NM" id="VDR_REQ_MNG_NM" title="담당자명" placeholder="담당자명 입력" value="" maxlength="10">
                                    <br><span id="mng_nm_txt_error" class="txt_error" style="display:none;">담당자명은 숫자/특수문자를 입력하실 수 없습니다.</span>
                                    <input type="hidden" id="validMngName" value="F" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>담당자 연락처</th>
                                <td>
                                    <div class="phone">
                                        <select title="연락처 첫번째번호 선택"  name="VDR_REQ_TEL1" id="VDR_REQ_TEL1">
                                            <option value="">선택</option>
                                            <option value="010">010</option>
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
                                        <input type="text" name="VDR_REQ_TEL2" id="VDR_REQ_TEL2" class="phone1 onlyNumber" title="연락처 두번째번호 입력" value="" maxlength="4">
                                        <span>-</span>
                                        <input type="text" name="VDR_REQ_TEL3" id="VDR_REQ_TEL3" class="phone2 onlyNumber" title="연락처 세번째번호 입력" value="" maxlength="4">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>담당자 휴대폰</th>
                                <td>
                                    <div class="phone">
                                        <select title="휴대폰 첫번째번호 선택" name="VDR_REQ_HP1" id="VDR_REQ_HP1">
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
                                        <span>-</span>
                                        <input type="text" name="VDR_REQ_HP2" id="VDR_REQ_HP2" class="phone1 onlyNumber" title="휴대폰 두번째번호 입력" value="" maxlength="4">
                                        <span>-</span>
                                        <input type="text" name="VDR_REQ_HP3" id="VDR_REQ_HP3" class="phone2 onlyNumber" title="휴대폰 세번째번호 입력" value="" maxlength="4">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col"><em class="star">필수</em>입점경로</th>
                                <td>
                                    <ul class="pickBox01">
                                        <li><input type="radio" id="r01" name="VDR_REQ_PATH" value="SNS 광고" onchange="radioChk()"><label for="r01">SNS 광고</label></li>
                                        <li><input type="radio" id="r02" name="VDR_REQ_PATH" value="지인소개" onchange="radioChk()"><label for="r02">지인소개</label></li>
                                        <li><input type="radio" id="r03" name="VDR_REQ_PATH" value="검색" onchange="radioChk()"><label for="r03">검색</label></li>
                                        <li><input type="radio" id="r04" name="VDR_REQ_PATH" value="기타" onchange="radioChk()"><label for="r04">기타</label></li>
                                    </ul>
                                    <div class="space" >
                                        <textarea name="radioTextBox" id="radioTextBox" placeholder="직접 입력" maxlength="1000"></textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="col">요청사항</th>
                                <td><textarea name="VDR_REQ_CNT " id="VDR_REQ_CNT " title="요청사항" placeholder="요청사항입력" maxlength="1000"></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <div class="terms_area">
                    <div class="terms_title">
                        <div class="inp_pick">
                            <input type="checkbox" id="agree"  name="agree" value="Y">
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
                    <button type="button" class="btn gray" onclick="javascript:goCancel();">취소</button>
                    <button type="button" class="btn ok" onclick="javascript:goRegist();">신청</button>
                </div>

                <div class="notice_bx">
                    <p class="tit">입점신청 유의사항</p>
                    <ul>
                        <li>입점 신청을 완료하시면 입점 담당자가 입점 여부 및 입점절차에 대한 안내를 도와드립니다.</li>
                        <li>입점 신청에 대한 결과는 1주일 내에 연락드리겠습니다.</li>
                    </ul>
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
	    	VDR_REQ_NM	: {required:true, maxlength:30},						 // 업체명
	    	VDR_REQ_CEO_NM	:{required:true, maxlength:15},						 // 담당자명
	    	VDR_REQ_BUSI1 :{required:true, minlength:3 , maxlength:3},			 // 사업자번호
	    	VDR_REQ_BUSI2 :{required:true, minlength:2 , maxlength:2},			 // 사업자번호
	    	VDR_REQ_BUSI3 :{required:true,  minlength:5 , maxlength:5},			 // 사업자번호
	    	VDR_REQ_SUB_BUSI : {required:true, minlength:4,	maxlength:4},		 // 종사업자번호
	        VDR_REQ_POST5:{required:true, number:true}, 						 // 우편번호
	        VDR_REQ_DR_ADDR1:{required:true},   								 // 도로명 본주소
	        VDR_REQ_DR_ADDR2:{required:true},   								 // 도로명 상세주소
	        VDR_REQ_BUSI_CDT :{required:true, maxlength:40},					 // 업태 
	        VDR_REQ_BUSI_TYPE :{required:true, maxlength:40},					 // 업종 
	        VDR_REQ_REF_TEL1:{required:true},										 // 연락처번호 앞자리
	        VDR_REQ_REF_TEL2:{required:true, number:true, minlength:3 , maxlength:4},// 연락처번호 중간자리
	        VDR_REQ_REF_TEL3:{required:true, number:true, minlength:4 , maxlength:4},// 연락처번호 뒷자리
	        VDR_REQ_SHP_NM:{required:true}, 				 					 // 쇼핑몰명
	        VDR_REQ_URL:{required:true}, 				 					 	 // 사이트URL
	        VDR_REQ_SHP_GUBUN:{required:true},				 					 // 쇼핑몰분류
	        channelList:{required:true}, 				 					     // 외부채널
	        VDR_REQ_MNG_NM:{required:true}, 				 					 // 담당자명
	        VDR_REQ_TEL1:{required:true, maxlength:3}, 				 			 // 담당자연락처
	        VDR_REQ_TEL2:{required:true, maxlength:4}, 				 			 // 담당자연락처
	        VDR_REQ_TEL3:{required:true, maxlength:4}, 				 			 // 담당자연락처
	        VDR_REQ_HP1:{required:true, maxlength:3}, 				 			 // 담당자휴대폰
	        VDR_REQ_HP2:{required:true, maxlength:4}, 				 			 // 담당자휴대폰
	        VDR_REQ_HP3:{required:true, maxlength:4}, 				 			 // 담당자휴대폰
	        VDR_REQ_PATH:{required:true}, 				  						 // 입점경로
	        //agree:{required:true}, 				  						 		 // 이용약관
	    },
	    messages :
	    {
	    	
	    	VDR_REQ_NM: {required:"[업체명]은 필수 정보입니다."},
	    	VDR_REQ_CEO_NM: {required:"[대표자명]은 필수 정보입니다."},
	    	VDR_REQ_BUSI1: {required:"[사업자번호]는 필수 정보입니다."	,minlength:"[사업자번호 첫째자리]는 최소 3글자 이상입니다." , maxlength:"[사업자번호 첫째자리]는 최대 3글자입니다."},
	    	VDR_REQ_BUSI2: {required:"[사업자번호]는 필수 정보입니다."	,minlength:"[사업자번호 중간자리]는 최소 2글자 이상입니다." , maxlength:"[사업자번호 중간자리]는 최대 2글자입니다."},
	    	VDR_REQ_BUSI3: {required:"[사업자번호]는 필수 정보입니다."	,minlength:"[사업자번호 셋째]는 최소 5글자 이상입니다." , maxlength:"[사업자번호 셋째자리]는 최대 5글자입니다."},
	    	VDR_REQ_SUB_BUSI : {required:"[종사업자번호를 입력해주세요]" ,minlength:"[종사업자번호 ]는 최소 4글자 이상입니다." , maxlength:"[종사업자번호 ]는 최대 4글자입니다."},
	    	VDR_REQ_POST5: {required:"[우편번호]는 필수 정보입니다."},
	    	VDR_REQ_DR_ADDR1: {required:"[도로명 주소]는 필수 정보입니다."},
	    	VDR_REQ_DR_ADDR2: {required:"[도로명 주소 상세]는 필수 정보입니다."},
	    	VDR_REQ_BUSI_CDT : {required:"[업태]는 필수 정보입니다."},
	    	VDR_REQ_BUSI_TYPE : {required:"[업종]는 필수 정보입니다."},
	    	VDR_REQ_REF_TEL1: {required:"[연락처번호 앞자리]는 필수 정보입니다."},
	    	VDR_REQ_REF_TEL2: {required:"[연락처번호 중간자리]는 필수 정보입니다." ,minlength:"[연락처번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[연락처번호 중간자리]는 최대 4글자입니다."},
	    	VDR_REQ_REF_TEL3: {required:"[연락처번호 뒷자리]는 필수 정보입니다." ,minlength:"[연락처번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[연락처번호 뒷자리]는 최대 4글자입니다."},
	    	VDR_REQ_SHP_NM: {required:"[쇼핑몰명]은 필수 정보입니다."},
	    	VDR_REQ_URL: {required:"[사이트URL]은 필수 정보입니다."},
	    	VDR_REQ_SHP_GUBUN: {required:"[쇼핑몰분류]은 필수 정보입니다."},
	    	channelList: {required:"[외부채널]은 필수 정보입니다."},
	    	VDR_REQ_MNG_NM: {required:"[담당자명]은 필수 정보입니다."},
	    	VDR_REQ_TEL1: {required:"[연락처번호 앞자리]는 필수 정보입니다."},
	    	VDR_REQ_TEL2: {required:"[연락처번호 중간자리]는 필수 정보입니다." ,minlength:"[연락처번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[연락처번호 중간자리]는 최대 4글자입니다."},
	    	VDR_REQ_TEL3: {required:"[연락처번호 뒷자리]는 필수 정보입니다." ,minlength:"[연락처번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[연락처번호 뒷자리]는 최대 4글자입니다."},
	    	VDR_REQ_HP1: {required:"[휴대폰번호 앞자리]는 필수 정보입니다."},
	    	VDR_REQ_HP2: {required:"[휴대폰번호 중간자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 중간자리]는 최소 3글자 이상입니다." , maxlength:"[연락처번호 중간자리]는 최대 4글자입니다."},
	    	VDR_REQ_HP3: {required:"[휴대폰번호 뒷자리]는 필수 정보입니다." ,minlength:"[휴대폰번호 뒷자리]는 최소 4글자 이상입니다." , maxlength:"[연락처번호 뒷자리]는 최대 4글자입니다."},
	    	VDR_REQ_PATH: {required:"[입점경로]는 필수 정보입니다."}
	    	//agree:{required:"[서비스이용약관]을 체크해주세요."}
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
	
	

//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('VDR_REQ_POST5').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('VDR_REQ_DR_ADDR1').value = fullRoadAddr;
            /* document.getElementById('ORD_DLV_JBN_ADR1').value = data.jibunAddress; */
			
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            /*
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                console.log('(예상 도로명 주소 : ' + expRoadAddr + ')')

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = ;
                console.log('(예상 지번 주소 : ' + expJibunAddr + ')')

            } else {
                document.getElementById('guide').innerHTML = '';
            }
            */
        }
    }).open();
}
$(document).on("click","#zipCheck",execDaumPostcode);
</script>
<script>
	//업체명 정규식 체크
	$("#VDR_REQ_NM").on("blur", function () {
		var regType = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|'()'\+]{1,30}$/;
		var reqName = $('#VDR_REQ_NM').val(); 
		if(!regType.test(reqName)){
			$('#VDR_REQ_NM').addClass('error')
			$('#req_nm_txt_error').text("업체명은 특수문자를 입력하실 수 없습니다.")
			$('#req_nm_txt_error').show();
			$("#VDR_REQ_NM").focus()
			return false;
		}else{
			$('#req_nm_txt_error').hide();
		}
	});
	
	//대표자명 정규식 체크
	$("#VDR_REQ_CEO_NM").on("blur", function () {
		var regType = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\+]{1,15}$/;
		var reqName = $('#VDR_REQ_CEO_NM').val();
		if(!regType.test(reqName)){
			$('#VDR_REQ_CEO_NM').addClass('error')
			$('#ceo_nm_txt_error').text("대표자명은 숫자/특수문자를 입력하실 수 없습니다.")
			$('#ceo_nm_txt_error').show();
			$("#VDR_REQ_CEO_NM").focus()
			return false;
		}else{
			$('#ceo_nm_txt_error').hide();
		}
	});
	
	//담당자명 정규식 체크
	$("#VDR_REQ_MNG_NM").on("blur", function () {
		var regType = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\+]{1,15}$/;
		var reqName = $('#VDR_REQ_MNG_NM').val();
		if(!regType.test(reqName)){
			$('#VDR_REQ_MNG_NM').addClass('error')
			$('#mng_nm_txt_error').text("담당자명은 숫자/특수문자를 입력하실 수 없습니다.")
			$('#mng_nm_txt_error').show();
			$("#VDR_REQ_MNG_NM").focus()
			return false;
		}else{
			$('#mng_nm_txt_error').hide();
		}
	});
	
	//이메일정보 정규식 체크
	$("#VDR_REQ_TAX_MAIL_ID").on("blur", function () {
		var regType = /^([0-9a-zA-Z_\.-]+)$/;
			if(!regType.test($("input[id='VDR_REQ_TAX_MAIL_ID']").val())){
				alert("이메일 계정을 확인해주세요.")
				return false;
		}
	});
	
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
	
	
	

	//사이트 url 한글 입력 방지
	$("#VDR_REQ_URL").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
            if(check.test(inputVal)){
             $(this).val("");
            }
        }
    });

	//이메일 도메인 select box 변경 이벤트
	$(document).on("click", "#emailDomainSelectbox", function () 
	{
	    var $domain = $("#VDR_REQ_MAIL_DOMAIN");
	    
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
	
	// 파일업로드
	/* var maxFileSize = 10485760;	
	$("#inpFile").on("change", function(){
		
		var file = this.files[0];
		var size = file.size || file.fileSize;
		if(file == undefined){ return; }
		
		var file1 = file.name.slice(file.name.lastIndexOf(".")+1).toLowerCase();
		var file_extension1 = "jpg,gif,png,pptx,zip";
		
		if(size > maxFileSize || file_extension1.indexOf(file1) == -1 ){
			$(this).val();
			return alert("용량(10MB이하), 형식(JPG, GIF, PNG)을 확인해주세요");
		}
	}); */
	
	//파일업로드 수정
	var maxFileSize = 10485760;
	$("#inpFile").on("change", function(){
		
		 if( !$(this).val() ) return;
         var file = this.files[0];
         var size = file.size || file.fileSize;
         var limit = 10000000;
         var file1 = file.name.slice(file.name.lastIndexOf(".")+1).toLowerCase();
         var file_extension1 = "jpg,gif,png,pdf";
                      
         if( size > limit || file_extension1.indexOf(file1) == -1)
         {
             alert( "용량(10MB이하), 형식(JPG, GIF, PNG, PDF)을 확인해주세요" );
             $(this).val('');
             return;
         }
     $(this).parent().find('input[type=text]').val( $(this).val() );
	});

	
	// 파일 지우기
 	$(document).on("click", "#fileDelBtn", function(){
 		$("#fileName").val('');
 	});
	
	
	//종사업자 번호 이벤트
	$("#VDR_REQ_SUB_BUSI").attr("disabled", true);
    $("#biz_num").on('click',function(){
        var chk = $('input:checkbox[id="biz_num"]').is(":checked");
        if(chk==true){
            $("#VDR_REQ_SUB_BUSI").attr("disabled", false);
            $("#biz_num").removeClass("on");
        }else{
            $("#VDR_REQ_SUB_BUSI").attr("disabled", true);
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
  	//외부채널 체크 이벤트
  	$("#pickBoxText").hide();
  	function setDisplay(){
  	    if($('input:checkbox[id=c11]').is(':checked')){
  	        $('#pickBoxText').show();
  	    }else{
  	        $('#pickBoxText').hide();
  	    }
  	}
  	
  //입점경로 체크 이벤트
  	$("#radioTextBox").hide();
  	function radioChk(){
  	    if($('input:radio[id=r04]').is(':checked')){
  	        $('#radioTextBox').show();
  	    }else{
  	        $('#radioTextBox').hide();
  	    }
  	}
 
	
	
	// 등록 버튼 클릭 이벤트
    goRegist = function () {
		
	 		if($frm.valid()){
                // 이메일 ID + DOMAIN
                $("#VDR_REQ_TAX_MAIL").val($("#VDR_REQ_TAX_MAIL_ID").val() + "@" + $("#VDR_REQ_MAIL_DOMAIN").val());
                
                if($("#inpFile").val() == ''){
                	alert("사업자등록증 필수 첨부 입니다.");
                	$("#inpFile").focus();
                	return;
                }
                
                if($("#c11").is(":checked")){
                	$("#c11").val($("#pickBoxText").val());
                }
                
                if($("#r04").is(":checked")){
                	$("#r04").val($("#radioTextBox").val());
                }
                
                if($("#selectBtn").val() == "기타"){
             	   $("#selectBtn option:selected").val($("#selectText").val());  
                }
                
                if(!$("input[name=agree]").is(':checked')){
                    alert("서비스 이용약관에 동의해주세요.");
                    $("#agree").focus();
                    return;
                }
                
           		if(confirm( "신청 하시겠습니까?")) {
           			
           			
   	            	$frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/business/standingPointApplicationRegist.do", "target":"_self", "method":"post"}).submit();
                }   
	        
	 		}
	};
    
    // 취소 클릭 이벤트
    goCancel = function(){
			location.href = "<c:out value="${frontDomain }"/>/pc/business/businessMain.do";	 			
    };
    
</script>