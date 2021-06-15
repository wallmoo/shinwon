<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="page-popup">

<div id="popContainer"><!-- popContainer -->

    <h1 class="title">배송지 정보 수정</h1>

    <div id="popWrapper" class="ship-address"><!-- popWrapper -->

		<c:if test="${not empty sessionUser.MEM_MST_MEM_ID }">
			<p class="guide-a">
	            배송지 정보를 수정할 수 있습니다. 원하는 배송지를 선택해주세요.
	        </p>
        
	        <ul id="ul_dlv_btn" class="ct tab-a mt10 not"><!-- tab-a -->
	            <li><a href="javascript:;" class="dlv_btn" data-div_id="div_recent_dlv_list"><span>최근 배송지</span></a></li>
	            <li><a href="javascript:;" class="dlv_btn" data-div_id="div_my_dlv_list"><span>나의 주소록</span></a></li>
	            <li><a href="javascript:;" id="resetDlvInfo" class="small dlv_btn"><span>새로운 주소</span></a></li>
	        </ul><!-- tab-a  -->
		</c:if>

        <div class="field field-address" id="div_recent_dlv_list" style="display: none;"><!-- field -->
	        <p class="guide-b">
	            최근 배송지 중 주문에 사용할 배송지 정보를 선택해 주세요 (최대 5개까지 제공)
	        </p>
	
	        <table class="table-a table-address mt10"><!-- table-a -->
	        <caption>받으시는 분, 주소, 휴대폰/전화번호, 선택으로 구성된 최근 배송지 목록입니다.</caption>
	        <colgroup>
	            <col style="width: 14%;" />
	            <col style="width: auto;" />
	            <col style="width: 20%;" />
	            <col style="width: 10%;" />
	        </colgroup>
	        <thead>
	            <tr>
	                <th scope="col"><span>받으시는 분</span></th>
	                <th scope="col"><span>주소</span></th>
	                <th scope="col"><span>휴대폰/전화번호</span></th>
	                <th scope="col"><span>선택</span></th>
	            </tr>
	        </thead>
	        <tbody>
	        	<c:choose>
					<c:when test="${not empty recentDlvList}">
						<c:forEach var="row" items="${recentDlvList}" varStatus="i" >
							<input type="hidden" data-target_dlv_id="ORD_DLV_NM" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_NM }"/>"/>
							<input type="hidden" data-target_dlv_id="ORD_DLV_ZIP_CDE5" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_ZIP_CDE5 }"/>"/>
							<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_DRO_ADR1 }"/>"/>
							<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_DRO_ADR2 }"/>"/>
							<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_JBN_ADR1 }"/>"/>
							<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_JBN_ADR2 }"/>"/>
							<input type="hidden" data-target_dlv_id="ORD_DLV_HP1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_HP1 }"/>"/>
							<input type="hidden" data-target_dlv_id="ORD_DLV_HP2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_HP2 }"/>"/>
							<input type="hidden" data-target_dlv_id="ORD_DLV_HP3" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_HP3 }"/>"/>
							<input type="hidden" data-target_dlv_id="ORD_DLV_TEL1" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_TEL1 }"/>"/>
							<input type="hidden" data-target_dlv_id="ORD_DLV_TEL2" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_TEL2 }"/>"/>
							<input type="hidden" data-target_dlv_id="ORD_DLV_TEL3" class="recent_dlv_${i.index }" value="<c:out value="${row.ORD_DLV_TEL3 }"/>"/>
							
							<tr>
							    <td><c:out value="${row.ORD_DLV_NM }"/></td>
							    <td class="al">
								<p>[<c:out value="${row.ORD_DLV_ZIP_CDE5 }"/>]</p>
								<p><c:out value="${row.ORD_DLV_DRO_ADR1 }"/><c:out value="${row.ORD_DLV_DRO_ADR2 }"/></p>
								<p><c:out value="${row.ORD_DLV_JBN_ADR1 }"/><c:out value="${row.ORD_DLV_JBN_ADR2 }"/></p>
							    </td>
							    <td>
								<p><c:out value="${row.ORD_DLV_HP1 }"/>-<c:out value="${row.ORD_DLV_HP2 }"/>-<c:out value="${row.ORD_DLV_HP3 }"/></p>
								<c:if test="${not empty row.ORD_DLV_TEL1 }">
								<p><c:out value="${row.ORD_DLV_TEL1 }"/>-<c:out value="${row.ORD_DLV_TEL2 }"/>-<c:out value="${row.ORD_DLV_TEL3 }"/></p>
								</c:if>
							    </td>
							    <td>
								<label for="recentDlvRadio_${i.index }" class="js-radio <c:if test="${i.index eq 0}">on</c:if>">
								    <input type="radio" id="recentDlvRadio_${i.index }" name="recent_dlv_radio" value="${i.index }" <c:if test="${i.index eq 0}">checked="checked"</c:if> title="<c:out value="${row.ORD_DLV_NM }"/> 배송지" />
								</label>
							    </td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
						    <td colspan="4">
							<p class="message no-more">
								최근 배송지가 없습니다.
							</p>
						    </td>
						</tr>
					</c:otherwise>
				</c:choose>
	        </tbody>
	        </table><!-- // table-a -->
	
			<c:if test="${not empty recentDlvList}">
		         <div class="section-button"><!-- section-button -->
		             <a href="javascript:applyDlv('recent');" class="btn_st1 btn_blk large"><span>선택주소 사용</span></a>
		         </div><!-- // section-button -->
	        </c:if>
		</div><!-- field -->

		<div class="field field-address" id="div_my_dlv_list" style="display: none;"><!-- field -->
		
			<p class="guide-b">
			배송을 원하는 주소를 선택하시면 주문서에 자동 입력됩니다.<br />
			나의 주소록에는 최대 10개 까지 주소 등록이 가능하며, 마이페이지 &gt; 배송지관리에서 등록/수정 가능합니다.
			</p>
			
			<table class="table-a table-address mt10"><!-- table-a -->
			<caption>받으시는 분, 주소, 휴대폰, 전화번호, 선택으로 구성된 배송지 목록입니다.</caption>
			<colgroup>
			<col style="width: 18%;" />
			<col style="width: auto;" />
			<col style="width: 20%;" />
			<col style="width: 8%;" />
			</colgroup>
			<thead>
			<tr>
			    <th scope="col">받으시는 분</th>
			    <th scope="col">주소</th>
			    <th scope="col">휴대폰/전화번호</th>
			    <th scope="col">선택</th>
			</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty myDlvList}">
					<c:forEach var="row" items="${myDlvList}" varStatus="i" >
						<input type="hidden" data-target_dlv_id="ORD_DLV_NM" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_RCV_NM }"/>"/>
						<input type="hidden" data-target_dlv_id="ORD_DLV_ZIP_CDE5" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_ZIP_CDE5 }"/>"/>
						<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_DRO_ADR1 }"/>"/>
						<input type="hidden" data-target_dlv_id="ORD_DLV_DRO_ADR2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_DRO_ADR2 }"/>"/>
						<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_JBN_ADR1 }"/>"/>
						<input type="hidden" data-target_dlv_id="ORD_DLV_JBN_ADR2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_JBN_ADR2 }"/>"/>
						<input type="hidden" data-target_dlv_id="ORD_DLV_HP1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_HP1 }"/>"/>
						<input type="hidden" data-target_dlv_id="ORD_DLV_HP2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_HP2 }"/>"/>
						<input type="hidden" data-target_dlv_id="ORD_DLV_HP3" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_HP3 }"/>"/>
						<input type="hidden" data-target_dlv_id="ORD_DLV_TEL1" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_TEL1 }"/>"/>
						<input type="hidden" data-target_dlv_id="ORD_DLV_TEL2" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_TEL2 }"/>"/>
						<input type="hidden" data-target_dlv_id="ORD_DLV_TEL3" class="my_dlv_${i.index }" value="<c:out value="${row.MEM_DLV_TEL3 }"/>"/>
						
						<tr>
						    <td>
						    	<c:if test="${row.MEM_DLV_BSC_YN eq 'Y'}">
                            		<p class="basis">[기본 배송지]</p>
                            	</c:if>
						    	<c:out value="${row.MEM_DLV_RCV_NM }"/>
						    </td>
						    <td class="al">
							<p>[<c:out value="${row.MEM_DLV_NM }"/>]</p>
							<p>[<c:out value="${row.MEM_DLV_ZIP_CDE5 }"/>]</p>
							<p><c:out value="${row.MEM_DLV_DRO_ADR1 }"/><c:out value="${row.MEM_DLV_DRO_ADR2 }"/></p>
							<p><c:out value="${row.MEM_DLV_JBN_ADR1 }"/><c:out value="${row.MEM_DLV_JBN_ADR2 }"/></p>
						    </td>
						    <td>
							<p><c:out value="${row.MEM_DLV_HP1 }"/>-<c:out value="${row.MEM_DLV_HP2 }"/>-<c:out value="${row.MEM_DLV_HP3 }"/></p>
							<c:if test="${not empty row.MEM_DLV_TEL1 }">
							<p><c:out value="${row.MEM_DLV_TEL1 }"/>-<c:out value="${row.MEM_DLV_TEL2 }"/>-<c:out value="${row.MEM_DLV_TEL3 }"/></p>
							</c:if>
						    </td>
						    <td>
							<label for="myDlvRadio_${i.index }" class="js-radio <c:if test="${i.index eq 0}">on</c:if>">
							    <input type="radio" id="myDlvRadio_${i.index }" name="my_dlv_radio" value="${i.index }" <c:if test="${i.index eq 0}">checked="checked"</c:if> title="<c:out value="${row.MEM_DLV_NM }"/> 배송지" />
							</label>
						    </td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
					    <td colspan="4">
						<p class="message no-more">
							나의 주소록이 없습니다.
						</p>
					    </td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
			</table>
			
			<c:if test="${not empty myDlvList}">
			    <div class="section-button"><!-- section-button -->
				<a href="javascript:applyDlv('my');" class="btn_st1 btn_blk large"><span>선택주소 사용</span></a>
			    </div><!-- // section-button -->
			</c:if>
		</div><!-- field -->
        

		<form id="frm" name="frm">
		<input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD }"/>"/>
		
        <table class="table-a table-col mt30"><!-- table-a -->
        <caption>받으시는 분, 휴대폰 번호, 전화번호, 주소, 배송유의사항으로 구성된 배송지 정보 입력 테이블입니다.</caption>
        <colgroup>
            <col style="width: 120px;" />
            <col style="width: auto;" />
        </colgroup>
        <tbody id="tbodyAddr">
            <tr>
                <th scope="row">받으시는 분 <span class="essential"><em class="blind">필수입력</em></span></th>
                <td>
                	<input type="text" id="ORD_DLV_NM" name="ORD_DLV_NM" class="text small" title="받으시는 분" maxlength="20" value="<c:out value="${orderDeliveryInfo.ORD_DLV_NM }"/>"/>
                </td>	
            </tr>
            <tr>
                <th scope="row"><label for="ORD_DLV_HP1">휴대폰 번호 <span class="essential"><em class="blind">필수입력</em></span></label></th>
                <td>
                    <select id="ORD_DLV_HP1" name="ORD_DLV_HP1" class="sel_chg" title="휴대폰 번호 앞자리">
		            		<option value="">선택</option>
		                    <c:if test="${not empty hpCodeList }">
		                         <c:forEach var="hpRow" items="${hpCodeList }">
		                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${hpRow.CMN_COM_NM eq orderDeliveryInfo.ORD_DLV_HP1 }">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }"/></option>
		                         </c:forEach>
		                     </c:if>
		                </select> - 
                   <input type="text" id="ORD_DLV_HP2" name="ORD_DLV_HP2" class="text small" title="휴대폰 번호 중간자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_HP2 }"/>"/>
                   -
                   <input type="text" id="ORD_DLV_HP3" name="ORD_DLV_HP3" class="text small" title="휴대폰 번호 뒷자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_HP3 }"/>"/>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="ORD_DLV_TEL1">전화번호</label></th>
                <td>
                    <select id="ORD_DLV_TEL1" name="ORD_DLV_TEL1" class="sel_chg" title="전화 번호 앞자리">
	                	<option value="">선택</option>
	                    <c:if test="${not empty telCodeList }">
	                         <c:forEach var="telRow" items="${telCodeList }">
	                             <option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${telRow.CMN_COM_NM eq orderDeliveryInfo.ORD_DLV_TEL1 }">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
	                         </c:forEach>
	                     </c:if>
	                </select>
	                   -
	                   <input type="text" id="ORD_DLV_TEL2" name="ORD_DLV_TEL2" class="text small" title="전화 번호 중간자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_TEL2 }"/>"/>
	                   -
	                   <input type="text" id="ORD_DLV_TEL3" name="ORD_DLV_TEL3" class="text small" title="전화 번호 뒷자리" maxlength="4" value="<c:out value="${orderDeliveryInfo.ORD_DLV_TEL3 }"/>"/>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="ORD_DLV_ZIP_CDE5">주소 <span class="essential"><em class="blind">필수입력</em></span></label></th>
                <td>
                    <p>
                        <input id="ORD_DLV_ZIP_CDE5" name="ORD_DLV_ZIP_CDE5" type="text" class="text small" title="(신)우편번호" maxlength="5" value="<c:out value="${orderDeliveryInfo.ORD_DLV_ZIP_CDE5 }"/>"/>
                        <!-- <a href="javascript:;" 
                            	 title="새 창 열림"
		                    	class="btn_st0 btn_white small search-zipcode"
		                    	data-post1_id="ORD_DLV_ZIP_CDE6_1"
		                    	data-post2_id="ORD_DLV_ZIP_CDE6_2"
		                    	data-addr1_id="ORD_DLV_JBN_ADR1"
		                    	data-addr2_id="ORD_DLV_JBN_ADR2"
		                    	data-new_post_id="ORD_DLV_ZIP_CDE5"
		                    	data-new_addr1_id="ORD_DLV_DRO_ADR1"
		                    	data-new_addr2_id="ORD_DLV_DRO_ADR2"
		                    	data-opener_fn="zipcodeCallback"
		                    	><span>우편번호 찾기</span></a> -->
		                    	<a href="javascript:;" id="zipCheck" class="btn_st0 btn_white small"><span>우편번호 찾기</span></a>
                    </p>
                    <p>
                        <input type="text" name="ORD_DLV_DRO_ADR1" id="ORD_DLV_DRO_ADR1" class="text xlarge" title="도로명 주소" placeholder="도로명 주소" readonly="readonly" value="<c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR1 }"/>"/>
                    </p>
                    <p>
                        <input type="text" name="ORD_DLV_JBN_ADR1" id="ORD_DLV_JBN_ADR1" class="text xlarge" title="지번 주소" placeholder="지번 주소" readonly="readonly" value="<c:out value="${orderDeliveryInfo.ORD_DLV_JBN_ADR1 }"/>"/>
                    </p>
                    <p>
                    	<input type="text" name="ORD_DLV_DRO_ADR2" id="ORD_DLV_DRO_ADR2" class="text address" title="이하 주소" placeholder="이하 주소" value="<c:out value="${orderDeliveryInfo.ORD_DLV_DRO_ADR2 }"/>"/>
                    </p>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="ORD_DLV_MSG">배송유의사항</label></th>
                <td>
                	<select id="dlvMessage" class="sel_chg" title="배송 메세지 선택">
                        <option value="">메세지를 선택해주세요.</option>
                        <c:if test="${not empty dlvMsgList }">
	                      <c:forEach var="row" items="${dlvMsgList }">
	                          <option value="<c:out value="${row.CMN_COM_NM }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
	                      </c:forEach>
                      	<option value="0">매세지 직접입력</option>
                  		</c:if>
                    </select>
                    <input type="text" class="text xlarge" id="ORD_DLV_MSG" name="ORD_DLV_MSG" maxlength="60" placeholder="최대 60자 이내 입력가능" value="<c:out value="${orderDeliveryInfo.ORD_DLV_MSG }"/>" <c:if test="${empty orderDeliveryInfo.ORD_DLV_MSG }">style="display:none;"</c:if>/>
                </td>
            </tr>
        </tbody>
        </table><!-- // table-a -->
        </form>

        <div class="section-button"><!-- section-button -->
            <a href="javascript:goSubmit();" class="btn_st1 btn_blk large"><span>확인</span></a>
            <a href="javascript:window.close();" class="btn_st1 btn_white large"><span>취소</span></a>
        </div><!-- // section-button -->

    </div><!-- // popWrapper -->
</div><!-- // popContainer -->

<%-- [BEGIN] 우편번호 api 스크립트 --%>
<%-- <%@ include file="/WEB-INF/jsp/pc/include/zipcode.jsp" %> --%>
<%-- [END] 우편번호 api 스크립트 --%>

<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>

<script type="text/javascript">
$(function(){
	
	// 우편번호 찾기 클릭 이벤트
    $(document).on("click","#zipCheck",function(){
    	window.open("<c:out value="${serverSslDomain}"/>/pc/common/commonZipCodePopup.do","commonCodePopup","width=550,height=650,scrollbars=yes");
    });
	
	// 우편번호 callback 함수
	zipcodeCallback = function (zip,doroAddr,jibunAddr)
	{
		$('#ORD_DLV_ZIP_CDE5').val(zip);
		$('#ORD_DLV_DRO_ADR1').val(doroAddr);
		$('#ORD_DLV_JBN_ADR1').val(jibunAddr);
	};
	
	//배송지 목록
	$('.dlv_btn').on('click', function(e) {
	    e.preventDefault();

	    var $this = $(this),
	    	div_id = $this.data('div_id');
	    
	    if ( $this.parent("li").siblings().hasClass('active') ) {
		    $this.parent("li").addClass('active').siblings().removeClass('active');
		    $("#ul_dlv_btn").removeClass("not");
	    	$('#'+div_id).siblings('.field').hide();
    		$('#'+div_id).show();
    	} else if ( $this.parent("li").hasClass('active') ) {
    	    $this.parent("li").removeClass('active');
    	    $("#ul_dlv_btn").addClass("not");
	    	$('#'+div_id).hide();
    	} else {
    	    $this.parent("li").addClass('active');
    	    $("#ul_dlv_btn").removeClass("not");
    		$('#'+div_id).show();
    	}
	});
	
	//새로운 주소 체크시
	$(document).on("click","#resetDlvInfo",function(){
		var ordDlvMessage = $("#ORD_DLV_MSG").val();		
		$("#tbodyAddr").find("input").val("");
		$("#tbodyAddr").find("select").val("");
		$("#ORD_DLV_MSG").val(ordDlvMessage);
		$(this).addClass("active");
		$(this).siblings().removeClass("active");
		$(".field-address").hide();
		$("#ul_dlv_btn").find("li").removeClass("active").eq(2).addClass("active");
			
		com.sel_chg($("#tbodyAddr").find("select"), 'reset');
	});
	
	 // 폼체크
    $("#frm").validate({
        rules: {
            ORD_DLV_HP1:{required:true},	// 핸드폰번호 앞자리
        	ORD_DLV_HP2:{required:true, number:true, minlength:3 , maxlength:4}, // 핸드폰번호 중간자리
        	ORD_DLV_HP3:{required:true, number:true, minlength:4 , maxlength:4}, // 핸드폰번호 뒷자리
        	ORD_DLV_TEL1:{required:{depends:function(){
                if($("#ORD_DLV_TEL2").val() != "" || $("#ORD_DLV_TEL3").val() != ""){
               	 return true;
                }else{
               	 return false;
                }	 
	        }}},
        	ORD_DLV_TEL2:{required:{depends:function(){
                 if($("#ORD_DLV_TEL1").val() != "" || $("#ORD_DLV_TEL3").val() != ""){
                	 return true;
                 }else{
                	 return false;
                 }	 
 	        }}, number:true, maxlength:4}, 
 	       ORD_DLV_TEL3:{required:{depends:function(){
               if($("#ORD_DLV_TEL1").val() != "" || $("#ORD_DLV_TEL2").val() != ""){
              	 return true;
               }else{
              	 return false;
               }	 
	        }}, number:true, maxlength:4},
        	ORD_DLV_ZIP_CDE5:{required:true, number:true}, // 우편번호
        	ORD_DLV_DRO_ADR1:{required:true}, // 도로명 본주소
        	ORD_DLV_DRO_ADR2:{required:true}, // 도로명 상세주소
        	ORD_DLV_JBN_ADR1:{required:true} // 지번 본주소
        },
        messages :{
            ORD_DLV_HP1: {required:"수령자 휴대폰 번호 첫자리를 입력해주십시오."},
        	ORD_DLV_HP2: {required:"수령자 휴대폰 번호 중간자리를 입력해주십시오." ,minlength:"[수령자 휴대폰 번호 중간자리]최소 3글자 이상입니다." , maxlength:"[수령자 휴대폰 번호 중간자리]최대 4글자입니다."},
        	ORD_DLV_HP3: {required:"수령자 휴대폰 번호 끝자리를 입력해주십시오." ,minlength:"[수령자 휴대폰 번호 끝자리]최소 4글자 이상입니다." , maxlength:"[수령자 휴대폰 번호 끝자리]최대 4글자입니다."},
        	ORD_DLV_TEL1: {required:"수령자 전화 번호 첫자리를 입력해주십시오."},
        	ORD_DLV_TEL2: {required:"수령자 전화 번호 중간자리를 입력해주십시오." , maxlength:"[수령자 전화 번호 중간자리]최대 4글자입니다."},
        	ORD_DLV_TEL3: {required:"수령자 전화 번호 끝자리를 입력해주십시오." , maxlength:"[수령자 전화 번호 끝자리]최대 4글자입니다."},
        	ORD_DLV_ZIP_CDE5: {required:"[우편번호]필수 정보입니다."},
        	ORD_DLV_DRO_ADR1: {required:"[도로명주소]필수 정보입니다."},
        	ORD_DLV_DRO_ADR2: {required:"[도로명 상세주소]필수 정보입니다."},
        	ORD_DLV_JBN_ADR1: {required:"[지번주소]필수 정보입니다."}
        }
      	//,ignore: ":hidden"
        ,onkeyup:false
	    ,onclick:false
	    ,onfocusout:false
        ,showErrors:function(errorMap, errorList){
 	       if(this.numberOfInvalids()) { 
	    	   //var caption = $(errorList[0].element).attr('caption') || $(errorList[0].element).attr('id');
	    	   //alert('[' + caption + '] ' + errorList[0].message);
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
	 
	// 배송지 수정
	goSubmit = function(){
		if($("#frm").valid()){
			if(confirm("배송지 정보를 수정하시겠습니까?")){
				var ORD_MST_CD = "${commandMap.ORD_MST_CD}"; //주문번호
				var ORD_DLV_ZIP_CDE5 = $("#ORD_DLV_ZIP_CDE5").val(); //새로운 우편번호
				
				$.ajax({
					type:"post",
					url : "<c:out value="${serverSslDomain}" />/pc/cart/orderDeliveryModifyProcAjax.do",
					data : $("#frm").serialize(),
					dataType : "json",
					async : false,
					success : function(data){
						//result가 0이상인 경우에만 성공
						if(data.result > 0){
							alert("수정되었습니다.");
							
							var dlv_nm = $("#ORD_DLV_NM").val();
							var hp = $("#ORD_DLV_HP1").val() + "-" + $("#ORD_DLV_HP2").val() + "-" + $("#ORD_DLV_HP3").val();
							var tel = $("#ORD_DLV_TEL1").val() + "-" + $("#ORD_DLV_TEL2").val() + "-" + $("#ORD_DLV_TEL3").val();
							var dro = "["+ ORD_DLV_ZIP_CDE5 + "] "+ $("#ORD_DLV_DRO_ADR1").val() + ", " + $("#ORD_DLV_DRO_ADR2").val();
							var jbn = "["+ ORD_DLV_ZIP_CDE5 + "] "+ $("#ORD_DLV_JBN_ADR1").val() + ", " + $("#ORD_DLV_DRO_ADR2").val();
							var desc = $("#ORD_DLV_MSG").val();
							
							$("#span_dlv_nm").html(dlv_nm);
							$("#span_hp",opener.document).html(hp);
							$("#span_tel",opener.document).html(tel);
							$("#span_dro",opener.document).html(dro);
							$("#span_jbn",opener.document).html(jbn);
							$("#span_desc",opener.document).html(desc);
							
							self.close();
						}else{
							alert(data.resultMsg);
						}
					},
					error : function(err){
						alert("오류가 발생하였습니다.\n[" + err.status + "]");
					}
				});
			}
		}
	};
	
	//배송 메세지 선택시
	$(document).on("click","#dlvMessage",function(){
		var thisValue = $(this).val();		
		if(thisValue === "0"){//직접입력
			$("#ORD_DLV_MSG").show();
			$("#ORD_DLV_MSG").val("");
		}else{
			$("#ORD_DLV_MSG").val(thisValue);
			$("#ORD_DLV_MSG").hide();
		}
		
		com.sel_chg($("#dlvMessage"), 'chg');
	});
});

//선택한 배송지 적용
function applyDlv(dlv_type){
	var radio_idx = $("input[name="+ dlv_type +"_dlv_radio]:checked").val();
	
	$("."+ dlv_type +"_dlv_"+radio_idx).each(function(i, item){
		var target_dlv_id = $(this).data("target_dlv_id");
		$("#"+target_dlv_id).val($(this).val());
		if($("#"+target_dlv_id).is("select")){
			var param = $(this).val() == '' ? 'reset' : 'chg';
			com.sel_chg($("#"+target_dlv_id), param);
		}
	});
	
	$("#div_"+ dlv_type +"_dlv_list").hide();
	$("#ul_dlv_btn").addClass("not");
	$(".dlv_btn").parent("li").removeClass("active");
}
</script>
</body>
</html>