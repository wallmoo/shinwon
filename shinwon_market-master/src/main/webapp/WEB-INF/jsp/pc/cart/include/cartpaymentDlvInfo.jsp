<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:choose>
	<c:when test="${empty cartlist[0].ORD_TMP_PRE_CD }">
		<c:choose>
			<c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD}"><%-- 겟잇나우인 경우 --%>
				<h3 class="title">
		            	겟잇나우 픽업정보
		            <span class="desc">
		                <span class="essential"><em class="blind">필수입력 표시는</em></span>
		                필수항목
		            </span>
		        </h3>
		
		        <div class="pick-info"><!-- pickup-info -->
		            <table class="table-c table-col">
		            <caption>방문매장, 방문예정일, 방문예정시간, 수령정보, 수령인 정보, 주의사항으로 구성된 겟잇나우 픽업정보 테이블입니다.</caption>
		            <colgroup>
		                <col style="width: 120px;" />
		                <col style="width: auto;" />
		                <col style="width: 120px;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr>
		                    <th scope="row">방문매장</th>
		                    <td colspan="3">
		                        	<c:out value="${getItNowShopInfo.SHP_MST_NM }"/>  
		                        <span class="desc dotum">
		                        	영업시간 :
		                        	평일 -
		                        	<c:choose>
		                        		<c:when test="${getItNowShopInfo.SHP_MST_WEK_DAY_GBN eq 'H'}">
		                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ST_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ST_MM }"/>
		                        			~
		                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ED_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_ED_MM }"/>
		                        		</c:when>
		                        		<c:otherwise>
		                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_DAY_TXT }"/>
		                        		</c:otherwise>
		                        	</c:choose>
		                        	주말 -
		                        	<c:choose>
		                        		<c:when test="${getItNowShopInfo.SHP_MST_WEK_END_GBN eq 'H'}">
		                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ST_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ST_MM }"/>
		                        			~
		                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ED_HH }"/>:<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_ED_MM }"/>
		                        		</c:when>
		                        		<c:otherwise>
		                        			<c:out value="${getItNowShopInfo.SHP_MST_WEK_END_TXT }"/>
		                        		</c:otherwise>
		                        	</c:choose>
		                        	 / 
		                        	 연락처 : 
		                        	 <c:out value="${getItNowShopInfo.SHP_MST_TEL }"/>
		                        </span>
		                        <a href="javascript:getItNowShopInfoPopup('${getItNowShopInfo.SHP_MST_IDX }');" class="btn_st0 btn_blk777 small"><span>매장위치 확인</span></a>
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row">방문예정일</th>
		                    <td><ui:formatDate pattern="yyyy.MM.dd" value="${cartlist[0].ORD_TMP_GET_PKU_DT }"/></td>
		                    <th scope="row">방문예정시간</th>
		                    <td><c:out value="${cartlist[0].ORD_TMP_GET_PKU_HH }"/></td>
		                </tr>
		                <tr>
		                    <th scope="row">수령정보 선택</th>
		                    <td colspan="3">
		                    	<input id="ORD_GET_GBN_0" class="radio" type="radio" name="ORD_GET_GBN" value="0" checked="checked" style="display: none;"/><%-- 본인수령 --%>
		                    	<input id="ORD_GET_GBN_1" class="radio" type="radio" name="ORD_GET_GBN" value="1" style="display: none;"/><%-- 타인수령 --%>
		                        <a href="javascript:chageGetGbn('0');" id="ORD_GET_GBN_BTN_0" class="btn_st0 btn_rd small"><span>본인수령</span></a>
		                        <a href="javascript:chageGetGbn('1');" id="ORD_GET_GBN_BTN_1" class="btn_st0 btn_blk777 small"><span>타인수령</span></a>
		                    </td>
		                </tr>
		                <tr id="trGetGbn_0">
		                    <th scope="row">수령인 정보</th>
		                    <td colspan="3">
		                        	<c:out value="${userInfo.MEM_MST_MEM_NM }"/> 
		                        	/ 
		                     	   <c:out value="${userInfo.MEM_MST_HP1 }"/>
		                           -
		                           <c:out value="${userInfo.MEM_MST_HP2 }"/>
				                   -
				                   <c:out value="${userInfo.MEM_MST_HP3 }"/>
				                   / 
				                   <c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[0] }"/>@<c:out value="${fn:split(userInfo.MEM_MST_MAIL,'@')[1] }"/>
		                    </td>
		                </tr>
		                <tr id="trGetGbn_1" style="display: none;">
		                    <th scope="row">수령인 정보</th>
		                    <td colspan="3">
		                        <ul class="pick-detail">
		                            <li>
		                                <label for="ORD_GET_NM">인수자명</label>
		                                <input type="text" id="ORD_GET_NM" name="ORD_GET_NM" class="text" maxlength="15"/>
		                            </li>
		                            <li>
		                                <label for="ORD_GET_TEL1">휴대폰번호</label>
		                                <select id="ORD_GET_TEL1" name="ORD_GET_TEL1"  title="휴대폰 번호 앞자리">
		                                    <option value="">선택</option>
						                    <c:if test="${not empty hpCodeList }">
						                         <c:forEach var="hpRow" items="${hpCodeList }">
						                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
						                         </c:forEach>
						                     </c:if>
		                                </select> - 
		                                <input type="text" class="text small number" maxlength="4" id="ORD_GET_TEL2" name="ORD_GET_TEL2" title="휴대폰 번호 중간자리" /> -
		                                <input type="text" class="text small number" maxlength="4" id="ORD_GET_TEL3" name="ORD_GET_TEL3" title="휴대폰 번호 끝자리" />
		                            </li>
		                            <li>
		                                <label for="ORD_GET_RLT">주문자와의 관계</label>
		                                <select id="ORD_GET_RLT" name="ORD_GET_RLT"  title="주문자와의 관계">
		                                    <option value="">선택</option>
		                                    <c:if test="${not empty getItNowReceiverList }">
			                                    <c:forEach var="row" items="${getItNowReceiverList }">
			                                        <option value="<c:out value="${row.CMN_COM_ETC1 }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
			                                    </c:forEach>
			                                </c:if>
		                                </select>
		                            </li>
		                        </ul>
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row">주의사항</th>
		                    <td colspan="3">
		                        <ul class="list list-a">
		                            <li>수령인에게 주문정보가 문자로 발송됩니다. (상품 가격은 노출되지 않습니다.)</li>
		                            <li>상품준비 완료 문자를 받으신 후 매장에 방문해 주세요.</li>
		                            <li><span class="warning">매장 방문 시 문자메시지와 신분증을 꼭 지참해 주세요.</span></li>
		                        </ul>
		                    </td>
		                </tr>
		            </tbody>
		            </table>
		        </div><!-- pickup-info -->
			</c:when>
			<c:otherwise>
				<h3 class="title">
					<c:choose>
		       	   <c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 서비스정보 --%>
		       	   	<strong>서비스정보</strong>
		       	   </c:when>
		       	   <c:otherwise>
		       	   	<strong>배송정보</strong>
		       	   </c:otherwise>
		       	   </c:choose>
				    
				    <span class="desc">
				        <span class="essential"><em class="blind">필수입력 표시는</em></span>
				        필수항목
				    </span>
				</h3>
				
				<div class="ship-info"><!-- ship-info -->
				    <div class="article-list"><!-- article-list -->
				        <ul>
				            <li class="article selection">
				                <div class="module dlvFormDiv">
				                    <h4 class="col tit">
				                       <c:choose>
							       	   <c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 서비스정보 --%>
							       	   	<span>서비스지 선택</span>
							       	   </c:when>
							       	   <c:otherwise>
							       	   	<span>배송지 선택</span>
							       	   </c:otherwise>
							       	   </c:choose>
				                    </h4>
				                    <div class="col apply">
				                    <c:if test="${not empty userInfo}"><%-- 회원인 경우에만 show --%>
				                    	<c:choose>
							       	   <c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 서비스정보 --%>
							       	   	<a href="javascript:;" class="btn_st0 btn_white small address-view dlv_btn" data-div_id="div_recent_dlv_list"><span>최근 서비스 주소</span></a>
							       	   </c:when>
							       	   <c:otherwise>
							       	   	<a href="javascript:;" class="btn_st0 btn_white small address-view dlv_btn" data-div_id="div_recent_dlv_list"><span>최근 배송지</span></a>
							       	   </c:otherwise>
							       	   </c:choose>
				                        
				                        <a href="javascript:;" class="btn_st0 btn_white small address-view dlv_btn" data-div_id="div_my_dlv_list"><span>나의 주소록</span></a>
				                    </c:if>    
				                        <a href="javascript:;" id="pasteOrderInfo" class="btn_st0 btn_white small dlv_btn"><span>주문자 정보와 동일</span></a>
				                        <a href="javascript:;" id="resetDlvInfo" class="btn_st0 btn_white small dlv_btn"><span>새로운 주소</span></a>
				                    </div>
				                </div>
				                
				                <div class="field field-address" id="div_recent_dlv_list" style="display: none;"><!-- field -->
				                    <p class="dotum">
				                        최근 배송지 중 주문에 사용할 배송지 정보를 선택해 주세요 (최대 5개까지 제공) 
				                    </p>
				                    
				                    <table class="table-b">
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
				                    </table>
				
									<c:if test="${not empty recentDlvList}">
					                    <div class="section-button"><!-- section-button -->
					                        <a href="javascript:applyDlv('recent');" class="btn_st0 btn_white"><span>선택주소 사용</span></a>
					                    </div><!-- // section-button -->
				                    </c:if>
				                </div><!-- field -->
				                
				                <div class="field field-address" id="div_my_dlv_list" style="display: none;"><!-- field -->
				
				                    <p class="dotum">
				                        배송을 원하는 주소를 선택하시면 주문서에 자동 입력됩니다.<br />
				                        나의 주소록에는 최대 10개 까지 주소 등록이 가능하며, 마이페이지 &gt; 배송지관리에서 등록/수정 가능합니다.
				                    </p>
				
				
				                    <table class="table-b">
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
							                            	<p><c:out value="${row.MEM_DLV_RCV_NM }"/></p>
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
				
									
					                    <div class="section-button"><!-- section-button -->
					                    	<a href="javascript:addNewDlv();" class="btn_st0 btn_blk777"><span>추가배송지 등록</span></a>
					                    	<c:if test="${not empty myDlvList}">
					                        	<a href="javascript:applyDlv('my');" class="btn_st0 btn_white"><span>선택주소 사용</span></a>
					                        </c:if>
					                    </div><!-- // section-button -->
				                </div><!-- field -->
				                
				            </li>
				            
				            <li class="article">
				                <div class="module dlvFormDiv">
				                    <h4 class="col tit"><label for="ORD_DLV_NM"><span>받으시는 분<span class="essential"><em class="blind">필수입력</em></span></span></label></h4>
				                    <div class="col apply">
				                    	<input id="ORD_DLV_NM" name="ORD_DLV_NM" type="text"  title="받으시는 분" class="text" maxlength="15" value=""/>
				                    </div>
				                </div>
				            </li>
				            <li class="article">
				                <div class="module dlvFormDiv">
				                    <h4 class="col tit"><label for="ORD_DLV_HP1"><span>휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></span></label></h4>
				                    <div class="col apply">
				                    	<select id="ORD_DLV_HP1" name="ORD_DLV_HP1"  title="휴대폰 번호 앞자리">
						            		<option value="">선택</option>
						                    <c:if test="${not empty hpCodeList }">
						                         <c:forEach var="hpRow" items="${hpCodeList }">
						                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
						                         </c:forEach>
						                     </c:if>
						                </select>
						                   -
						                   <input type="text" id="ORD_DLV_HP2" name="ORD_DLV_HP2" class="text small" title="휴대폰 번호 중간자리" maxlength="4" value=""/>
						                   -
						                   <input type="text" id="ORD_DLV_HP3" name="ORD_DLV_HP3" class="text small" title="휴대폰 번호 뒷자리" maxlength="4" value=""/>
				                    </div>
				                </div>
				            </li>
				            <li class="article">
				                <div class="module dlvFormDiv">
				                    <h4 class="col tit"><label for="ORD_DLV_TEL1"><span>전화번호</span></label></h4>
				                    <div class="col apply">
				                    	<select id="ORD_DLV_TEL1" name="ORD_DLV_TEL1"  title="전화 번호 앞자리">
						                	<option value="">선택</option>
						                    <c:if test="${not empty telCodeList }">
						                         <c:forEach var="telRow" items="${telCodeList }">
						                             <option value="<c:out value="${telRow.CMN_COM_NM }"/>"><c:out value="${telRow.CMN_COM_NM }"/></option>
						                         </c:forEach>
						                     </c:if>
						                </select>
						                   -
						                   <input type="text" id="ORD_DLV_TEL2" name="ORD_DLV_TEL2" class="text small" title="전화 번호 중간자리" maxlength="4" value=""/>
						                   -
						                   <input type="text" id="ORD_DLV_TEL3" name="ORD_DLV_TEL3" class="text small" title="전화 번호 뒷자리" maxlength="4" value=""/>
				                    </div>
				                </div>
				            </li>
				            <li class="article">
				                <div class="module dlvFormDiv">
				                    <h4 class="col tit"><label for="ORD_DLV_ZIP_CDE5"><span>주소<span class="essential"><em class="blind">필수입력</em></span></span></label></h4>
				                    <div class="col apply address-form">
				                        <p>
				                        	<input id="ORD_DLV_ZIP_CDE5" name="ORD_DLV_ZIP_CDE5" type="text" class="text small" title="(신)우편번호" maxlength="5" value=""/>
				                            <!-- <a href="javascript:;" 
				                            	 title="새 창 열림"
						                    	class="btn_st0 btn_blk777 small search-zipcode"
						                    	data-post1_id="ORD_DLV_ZIP_CDE6_1"
						                    	data-post2_id="ORD_DLV_ZIP_CDE6_2"
						                    	data-addr1_id="ORD_DLV_JBN_ADR1"
						                    	data-addr2_id="ORD_DLV_JBN_ADR2"
						                    	data-new_post_id="ORD_DLV_ZIP_CDE5"
						                    	data-new_addr1_id="ORD_DLV_DRO_ADR1"
						                    	data-new_addr2_id="ORD_DLV_DRO_ADR2"
						                    	data-opener_fn="getAddDlvCharge"
						                    	><span>우편번호 찾기</span></a> -->
						                    <a href="javascript:execDaumPostcode();" id="zipCheck" class="btn_st0 btn_blk777 small"><span>우편번호 찾기</span></a>	
				                        </p>
				                        
				                        <p>
				                            <input type="text" name="ORD_DLV_DRO_ADR1" id="ORD_DLV_DRO_ADR1" class="text xlarge" title="도로명 주소" placeholder="도로명 주소" />
				                        </p>
				                        <p>
				                            <input type="text" name="ORD_DLV_JBN_ADR1" id="ORD_DLV_JBN_ADR1" class="text xlarge" title="지번 주소" placeholder="지번 주소" />
				                        </p>
				                        <p>
				                        	<input type="text" name="ORD_DLV_DRO_ADR2" id="ORD_DLV_DRO_ADR2" class="text address" title="이하 주소" placeholder="이하 주소" />
				                        </p>
				                    </div>
				                </div>
				            </li>
				            <li class="article massage">
				                <div class="module dlvFormDiv">
				                	<c:choose>
						       	   <c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 서비스정보 --%>
						       	   	<h4 class="col tit"><label for="ORD_DLV_MSG"><span>요청사항</span></label></h4>
						       	   	
						       	   	<div class="col apply">
	                                    <p>
	                                    	<input type="text" class="text xlarge" id="ORD_DLV_MSG" name="ORD_DLV_MSG" maxlength="60" placeholder="최대 60자 이내 입력가능" title="배송 유의사항 직접입력"/>
				                        </p>
				                        <p class="dotum desc">
				                        	<c:choose>
									       	   <c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 서비스정보 --%>
									       	   	서비스 방문할 클린킹맨에게 요청할 내용을 기재해 주세요.
									       	   </c:when>
									       	   <c:otherwise>
									       	   	택배기사님께 전달하는 메시지는 배송상황 및 요청내용에 따라 반영되지 않을 수 있습니다. 
									       	   </c:otherwise>
									       	   </c:choose>
				                        </p>
				                    </div>
				                    
						       	   </c:when>
						       	   <c:otherwise>
						       	   	<h4 class="col tit"><label for="ORD_DLV_MSG"><span>배송유의사항</span></label></h4>
						       	   	
						       	   	<div class="col apply">
				                    	<select id="dlvMessage" name="dlvMessage"  title="배송 메세지 선택">
	                                        <option value="">메세지를 선택해주세요.</option>
	                                        <c:if test="${not empty codes.DLV_MESSAGE_CD }">
			                                    <c:forEach var="row" items="${codes.DLV_MESSAGE_CD }">
			                                        <option value="<c:out value="${row.CMN_COM_NM }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
			                                    </c:forEach>
			                                    <option value="0">매세지 직접입력</option>
			                                </c:if>
	                                    </select>
	                                    <p>
	                                    	<input type="text" class="text xlarge" id="ORD_DLV_MSG" name="ORD_DLV_MSG" maxlength="60" placeholder="최대 60자 이내 입력가능" title="배송 유의사항 직접입력" style="display:none;"/>
				                        </p>
				                        <p class="dotum desc">
				                        	<c:choose>
									       	   <c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 서비스정보 --%>
									       	   	서비스 방문할 클린킹맨에게 요청할 내용을 기재해 주세요.
									       	   </c:when>
									       	   <c:otherwise>
									       	   	택배기사님께 전달하는 메시지는 배송상황 및 요청내용에 따라 반영되지 않을 수 있습니다. 
									       	   </c:otherwise>
									       	   </c:choose>
				                        </p>
				                    </div>
				                    
						       	   </c:otherwise>
						       	   </c:choose>
				                </div>
				            </li>
				        </ul>
				    </div><!-- // article-list -->
				</div><!-- ship-info -->
				
				<%-- [BEGIN] 우편번호 api 스크립트 --%>
				<%-- <%@ include file="/WEB-INF/jsp/pc/include/zipcode.jsp" %> --%>
				<%-- [END] 우편번호 api 스크립트 --%>
			</c:otherwise>
		</c:choose>
	</c:when>
	
	<c:otherwise><%-- 재주문인 경우 --%>
	
		<h3 class="title">
		    배송정보
		    <span class="desc">
		        <span class="essential"><em class="blind">필수입력 표시는</em></span>
		        필수항목
		    </span>
		</h3>
		
		<div class="ship-info"><!-- ship-info -->
		    <div class="article-list"><!-- article-list -->
		        <ul>
		            <li class="article">
		                <div class="module dlvFormDiv">
		                    <h4 class="col tit"><label for="ORD_DLV_NM"><span>받으시는 분<span class="essential"><em class="blind">필수입력</em></span></span></label></h4>
		                    <div class="col apply">
		                    	<c:out value="${preOrderDlvInfo.ORD_DLV_NM }"/>
		                    </div>
		                </div>
		            </li>
		            <li class="article">
		                <div class="module dlvFormDiv">
		                    <h4 class="col tit"><label for="ORD_DLV_HP1"><span>휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></span></label></h4>
		                    <div class="col apply">
		                    	<c:out value="${preOrderDlvInfo.ORD_DLV_HP1 }"/>
		                    	-
		                    	<c:out value="${preOrderDlvInfo.ORD_DLV_HP2 }"/>
		                    	-
		                    	<c:out value="${preOrderDlvInfo.ORD_DLV_HP3 }"/>
		                    </div>
		                </div>
		            </li>
		            <li class="article">
		                <div class="module dlvFormDiv">
		                    <h4 class="col tit"><label for="ORD_DLV_TEL1"><span>전화번호</span></label></h4>
		                    <div class="col apply">
		                    	<c:out value="${preOrderDlvInfo.ORD_DLV_TEL1 }"/>
		                    	-
		                    	<c:out value="${preOrderDlvInfo.ORD_DLV_TEL2 }"/>
		                    	-
		                    	<c:out value="${preOrderDlvInfo.ORD_DLV_TEL3 }"/>
		                    </div>
		                </div>
		            </li>
		            <li class="article">
		                <div class="module dlvFormDiv">
		                    <h4 class="col tit"><label for="ORD_DLV_ZIP_CDE5"><span>주소<span class="essential"><em class="blind">필수입력</em></span></span></label></h4>
		                    <div class="col apply address-form">
		                        <p>
		                        	<input id="ORD_DLV_ZIP_CDE5" name="ORD_DLV_ZIP_CDE5" type="hidden" class="text small" title="(신)우편번호" maxlength="5" value="<c:out value="${preOrderDlvInfo.ORD_DLV_ZIP_CDE5 }"/>"/>
		                        </p>
		                        
		                        <p>
		                        	<c:out value="${preOrderDlvInfo.ORD_DLV_DRO_ADR1 }"/> <c:out value="${preOrderDlvInfo.ORD_DLV_DRO_ADR2 }"/>
		                        </p>
		                        <p>
		                        	<c:out value="${preOrderDlvInfo.ORD_DLV_JBN_ADR1 }"/> <c:out value="${preOrderDlvInfo.ORD_DLV_DRO_ADR2 }"/>
		                        </p>
		                    </div>
		                </div>
		            </li>
		            <li class="article">
		                <div class="module dlvFormDiv">
		                    <h4 class="col tit"><label for="ORD_DLV_MSG"><span>배송유의사항</span></label></h4>
		                    <div class="col apply">
		                    	<c:out value="${preOrderDlvInfo.ORD_DLV_MSG }"/>
		                    </div>
		                </div>
		            </li>
		        </ul>
		    </div><!-- // article-list -->
		</div><!-- ship-info -->
		
	</c:otherwise>
</c:choose>

<%-- 다음 우편번호 시작 --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
                document.getElementById('ORD_DLV_ZIP_CDE5').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('ORD_DLV_DRO_ADR1').value = fullRoadAddr;
                document.getElementById('ORD_DLV_JBN_ADR1').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<%-- 다음 우편번호 끝 --%>

<script>
$(function(){
	/*
	// 우편번호 찾기 클릭 이벤트
    $(document).on("click","#zipCheck",function(){
    	window.open("<c:out value="${serverDomain}"/>/pc/common/commonZipCodePopup.do","commonCodePopup","width=550,height=650,scrollbars=yes");
    });
	
 	// 우편번호 callback 함수
	zipcodeCallback = function (zip,doroAddr,jibunAddr)
	{
		$('#ORD_DLV_ZIP_CDE5').val(zip);
		$('#ORD_DLV_DRO_ADR1').val(doroAddr);
		$('#ORD_DLV_JBN_ADR1').val(jibunAddr);
		$('#ORD_DLV_DRO_ADR2').val("");
		//추가배송비 계산
		//getAddDlvCharge();
	};
	*/
	
	//배송지 목록
	$('.ship-info .address-view').on('click', function(e) {
	    e.preventDefault();

	    var $this = $(this),
	    	div_id = $this.data('div_id');
	    
	    if ( $this.siblings().hasClass('active') ) {
		    $this.addClass('active').siblings().removeClass('active');
	    	$('#'+div_id).siblings('.field').hide();
    		$('#'+div_id).show();
    	} else if ( $this.hasClass('active') ) {
    	    $this.removeClass('active');
	    	$('#'+div_id).slideUp('400');
    	} else {
    	    $this.addClass('active');
    		$('#'+div_id).slideDown('400');
    	}
	});
	
	//주문자정보와 동일 체크시
	$(document).on("click","#pasteOrderInfo",function(){
		$("#ORD_DLV_NM").val($("#ORD_MST_ORD_NM").val());
		$("#ORD_DLV_HP1").val($("#ORD_MST_HP1").val());
		$("#ORD_DLV_HP2").val($("#ORD_MST_HP2").val());
		$("#ORD_DLV_HP3").val($("#ORD_MST_HP3").val());
		
		if($("#ORD_MST_HP1").val() == ""){
			com.sel_chg($("#ORD_DLV_HP1"), 'reset');
		}else{
			com.sel_chg($("#ORD_DLV_HP1"), 'chg');
		}
		
		$(this).addClass("active");
		$(this).siblings().removeClass("active");
		$(".field-address").slideUp('400');
	});
	
	//새로운 주소 체크시
	$(document).on("click","#resetDlvInfo",function(){
		var ordDlvMessage = $("#ORD_DLV_MSG").val();		
		$(".dlvFormDiv").find("input").val("");
		$(".dlvFormDiv").find("select").val("");
		$("#ORD_DLV_MSG").val(ordDlvMessage);
		$(this).addClass("active");
		$(this).siblings().removeClass("active");
		$(".field-address").slideUp('400');
			
		com.sel_chg($(".dlvFormDiv").find("select"), 'reset');
		
		<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_LONG_INS_CD}">
			//추가배송비 계산
			//getAddDlvCharge();
		</c:if>
	});
	
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
		
		//com.sel_chg($("#dlvMessage"), 'chg');
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
	
	$("#div_"+ dlv_type +"_dlv_list").slideToggle('400');
	$(".dlv_btn").removeClass("active");
	
	<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_LONG_INS_CD}">
		//추가배송비 계산
		//getAddDlvCharge();
	</c:if>
}

//수령정보 선택시
function chageGetGbn(idx){
	$("#ORD_GET_GBN_"+idx).prop("checked",true);
	$("#ORD_GET_GBN_"+idx).trigger("change");
	$("#ORD_GET_GBN_BTN_"+idx).siblings().removeClass("btn_rd");
	$("#ORD_GET_GBN_BTN_"+idx).siblings().addClass("btn_blk777");
	$("#ORD_GET_GBN_BTN_"+idx).removeClass("btn_blk777");
	$("#ORD_GET_GBN_BTN_"+idx).addClass("btn_rd");
	
	if(idx == '0'){
		$("#trGetGbn_0").show();
		$("#trGetGbn_1").hide();
	}else{
		$("#trGetGbn_0").hide();
		$("#trGetGbn_1").show();
	}
}

// 매장위치확인 팝업
function getItNowShopInfoPopup(shpMstIdx){
	window.open("<c:out value="${serverSslDomain}"/>/pc/cart/getItNowShopInfoPopup.do?SHP_MST_IDX="+shpMstIdx,"getItNowShopInfoPopup", 'toolbar=0,scroll=1,menubar=0,status=0,resizable=0,width=500,height=550,scrollbars=yes');
}

// 추가배송지 등록
function addNewDlv(){
	window.open("<c:out value="${serverSslDomain}"/>/pc/mypage/myDeliveList.do","_blank");
}

</script>