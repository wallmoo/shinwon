<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<c:choose>
	<c:when test="${empty cartlist[0].ORD_TMP_PRE_CD }">
		<c:choose>
			<c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_GET_IT_NOW_CD}"><%-- 겟잇나우인 경우 --%>
				<div class="order-sheet accordion pickup" data-role="collapsible-set"><!-- pickup -->
		            <div class="section" data-role="collapsible" data-collapsed="false">
		                <h3>
		                    <strong>겟잇나우 픽업정보</strong>
		                    <strong class="warning"><c:out value="${getItNowShopInfo.SHP_MST_NM }"/></strong>
		                    <i><!-- icon --></i>
		                </h3>
		
		                <div class="toggle-box">
		                    <ul class="form-a view">
		                        <li>
		                            <div class="tit">방문매장</div>
		                            <div class="field">
		                                <p>
		                                    <a href="javascript:;"><strong class="primary"><c:out value="${getItNowShopInfo.SHP_MST_NM }"/></strong></a>
		                                </p>
		                                <p class="mt10">
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
			                        	<br/>주말 -
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
		                                </p>
		                                <p class="mt10">
		                                    	연락처 : <c:out value="${getItNowShopInfo.SHP_MST_TEL }"/>
		                                </p>
		                                <p class="mt10">
		                                    <a href="javascript:getItNowShopInfoPopup('${getItNowShopInfo.SHP_MST_IDX }');" class="button small"><span>매장위치확인</span></a>
		                                </p>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">방문예정일</div>
		                            <div class="field">
		                                <strong><ui:formatDate pattern="yyyy.MM.dd" value="${cartlist[0].ORD_TMP_GET_PKU_DT }"/></strong>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">방문예정시간</div>
		                            <div class="field">
		                                <strong><c:out value="${cartlist[0].ORD_TMP_GET_PKU_HH }"/></strong>
		                            </div>
		                        </li>
		                        <li>
		                            <div class="tit">수령정보 선택</div>
		                            <div class="field">
		                            	<input id="ORD_GET_GBN_0" class="radio" type="radio" name="ORD_GET_GBN" value="0" checked="checked" style="display: none;"/><%-- 본인수령 --%>
		                    			<input id="ORD_GET_GBN_1" class="radio" type="radio" name="ORD_GET_GBN" value="1" style="display: none;"/><%-- 타인수령 --%>
		                                <a href="javascript:chageGetGbn('0');" id="ORD_GET_GBN_BTN_0" class="button warning small"><span>본인수령</span></a>
		                                <a href="javascript:chageGetGbn('1');" id="ORD_GET_GBN_BTN_1" class="button small"><span>타인수령</span></a>
		                            </div>
		                        </li>
		                        <li id="trGetGbn_0">
		                            <div class="tit">수령인정보</div>
		                            <div class="field">
		                                	<c:out value="${userInfo.MEM_MST_MEM_NM }"/><br />
		                                	<c:out value="${userInfo.MEM_MST_HP1 }"/>
				                           -
				                           <c:out value="${userInfo.MEM_MST_HP2 }"/>
						                   -
						                   <c:out value="${userInfo.MEM_MST_HP3 }"/>
		                            </div>
		                        </li>
		                        <li class="recipient" id="trGetGbn_1" style="display: none;"> 
		                            <div class="tit"><label for="recipient">수령인정보</label></div>
		                            <div class="field">
		                                <p>
		                                    <label for="ORD_GET_RLT" class="sel_box_st0" title="주문자와의 관계">
		                                        <select id="ORD_GET_RLT" name="ORD_GET_RLT" class="select">
		                                            <option value="">선택</option>
				                                    <c:if test="${not empty getItNowReceiverList }">
					                                    <c:forEach var="row" items="${getItNowReceiverList }">
					                                        <option value="<c:out value="${row.CMN_COM_ETC1 }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
					                                    </c:forEach>
					                                </c:if>
		                                        </select>
		                                    </label>
		                                </p>
		                                <p>
		                                    <input type="text" id="ORD_GET_NM" name="ORD_GET_NM" class="text" maxlength="15" placeholder="인수자명" title="인수자명"/>
		                                </p>
		                                <p class="tel">
		                                    <label for="ORD_GET_TEL1" class="sel_box_st0" title="인수자 휴대폰 번호 앞자리">
		                                        <select id="ORD_GET_TEL1" name="ORD_GET_TEL1" class="select">
		                                            <option value="">선택</option>
		                                            <c:if test="${not empty hpCodeList }">
								                         <c:forEach var="hpRow" items="${hpCodeList }">
								                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
								                         </c:forEach>
								                     </c:if>
		                                        </select>
		                                    </label> -
		                                    <input type="number" class="text number" maxlength="4" id="ORD_GET_TEL2" name="ORD_GET_TEL2" title="인수자 휴대폰 번호 중간자리"> -
		                                    <input type="number" class="text number"  maxlength="4" id="ORD_GET_TEL3" name="ORD_GET_TEL3" title="인수자 휴대폰 번호 끝자리">
		                                </p>
		                            </div>
		                        </li>
		                    </ul>
		
		                    <div class="padder mt20">
		                        <ul class="list primary">
		                            <li>수령인에게 주문정보가 문자로 발송됩니다. (상품 가격은 노출되지 않습니다.)</li>
		                            <li>상품준비 완료 문자를 받으신 후 매장에 방문해 주세요</li>
		                            <li><span class="warning">매장 방문 시 문자메시지와 신분증을 꼭 지참해 주세요.</span></li>
		                        </ul>
		                    </div>
		                </div>      
		            </div>
		        </div><!-- // pickup -->
			</c:when>    
			<c:otherwise>
				<div class="order-sheet accordion ship-address" data-role="collapsible-set"><!-- ship-address -->
				   <div class="section" data-role="collapsible" data-collapsed="false">
				       <h3>
				       	   <c:choose>
				       	   <c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 서비스정보 --%>
				       	   	<strong>서비스정보</strong>
				       	   </c:when>
				       	   <c:otherwise>
				       	   	<strong>배송지정보</strong>
				       	   </c:otherwise>
				       	   </c:choose>
				           
				           <c:if test="${not empty myDlvList }">
				           		<c:if test="${myDlvList[0].MEM_DLV_BSC_YN eq 'Y' }">
				           			<strong class="small"><c:out value="${myDlvList[0].MEM_DLV_DRO_ADR1 }"/>&nbsp;<c:out value="${myDlvList[0].MEM_DLV_DRO_ADR2 }"/></strong>
				           		</c:if>
				           </c:if>
				           
				           <i><!-- icon --></i>
				       </h3>
				
				       <div class="toggle-box">
				           <div class="apply"><!-- apply -->
				           	   <c:if test="${not empty userInfo}"><%-- 회원인 경우에만 show --%>
				           	   <c:choose>
					       	   <c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 서비스정보 --%>
					       	   	<a href="#addressLately" class="button small address-view"><span>최근 서비스 주소</span></a>
					       	   </c:when>
					       	   <c:otherwise>
					       	   	<a href="#addressLately" class="button small address-view"><span>최근 배송지</span></a>
					       	   </c:otherwise>
					       	   </c:choose>
				               
				               <a href="#addressMy" class="button small address-view"><span>나의 주소록</span></a>
				               </c:if>
				               <a href="javascript:;" id="pasteOrderInfo" class="button small"><span>주문자정보와 동일</span></a>
				               <a href="javascript:;" id="resetDlvInfo" class="button small"><span>새로운 주소</span></a>
				           </div><!-- // apply -->
				           
				           <div id="addressLately" class="address-info address-list recent-address-list"><!-- address-info -->
				               <p>
				                   <strong>최근 배송지 중 주문에 사용할 배송지 정보를 선택해 주세요</strong>
				               </p>
				               <p class="desc">
				                   <span class="small">(최대 5개 까지 제공)</span>
				               </p>
				
				               <table>
				               <caption>받으시는 분, 주소/휴대폰/전화번호, 선택으로 구성된 최근 배송지 목록입니다.</caption>
				               <colgroup>
				                   <col style="width: 25%;" />
				                   <col style="width: auto;" />
				                   <col style="width: 10%;" />
				               </colgroup>
				               <thead>
				                   <tr>
				                       <th scope="col">받으시는 분</th>
				                       <th scope="col">주소/휴대폰/전화번호</th>
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
							                       <td class="text-left">
							                           <p><span class="blind">우편번호</span>[<c:out value="${row.ORD_DLV_ZIP_CDE5 }"/>]</p>
							                           <p><span class="blind">도로명 주소</span><c:out value="${row.ORD_DLV_DRO_ADR1 }"/><c:out value="${row.ORD_DLV_DRO_ADR2 }"/></p>
							                           <p><span class="blind">지번 주소</span><c:out value="${row.ORD_DLV_JBN_ADR1 }"/><c:out value="${row.ORD_DLV_JBN_ADR2 }"/></p>
							                           <p>
							                               <span class="blind">휴대폰</span><c:out value="${row.ORD_DLV_HP1 }"/>-<c:out value="${row.ORD_DLV_HP2 }"/>-<c:out value="${row.ORD_DLV_HP3 }"/> / 
							                               <c:if test="${not empty row.ORD_DLV_TEL1 }">
							                               <span class="blind">전화번호</span><c:out value="${row.ORD_DLV_TEL1 }"/>-<c:out value="${row.ORD_DLV_TEL2 }"/>-<c:out value="${row.ORD_DLV_TEL3 }"/>
							                               </c:if>
							                           </p>
							                       </td>
							                       <td>
							                           <input type="radio" id="recentDlvRadio_${i.index }" name="recent_dlv_radio" value="${i.index }" <c:if test="${i.index eq 0}">checked="checked"</c:if> title="<c:out value="${row.ORD_DLV_NM }"/> 배송지" />
							                       </td>
							                   </tr>
			                    			</c:forEach>
			                    		</c:when>
			                    		<c:otherwise>
			                    			<tr>
						                       <td colspan="3">
						                           <p class="no-more">
						                               	최근 배송지가 없습니다.
						                           </p>
						                       </td>
						                   </tr>
			                    		</c:otherwise>
			                    	</c:choose>
				               </tbody>
				               </table>
								
							<c:if test="${not empty recentDlvList}">
				               <div class="action">
				                   <a href="javascript:applyDlv('recent');" class="button primary"><span>선택 주소 사용</span></a>
				               </div>
				            </c:if>
				           </div><!-- // address-info -->
				
				           <div id="addressMy" class="address-info address-list my-address-list"><!-- address-info -->
				               <p>
				                   <strong>배송을 원하는 주소를 선택하시면 주문서에 자동 입력됩니다.<br />
				                   나의 주소록에는 최대 10개 까지 주소 등록이 가능하며, 마이페이지 &gt; 배송지관리에서 등록/수정 가능합니다.</strong>
				               </p>
				
				               <table>
				               <caption>받으시는 분, 주소/휴대폰/전화번호, 선택으로 구성된 최근 배송지 목록입니다.</caption>
				               <colgroup>
				                   <col style="width: 25%;" />
				                   <col style="width: auto;" />
				                   <col style="width: 10%;" />
				               </colgroup>
				               <thead>
				                   <tr>
				                       <th scope="col">받으시는 분</th>
				                       <th scope="col">주소/휴대폰/전화번호</th>
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
							                       <td><c:out value="${row.MEM_DLV_RCV_NM }"/></td>
							                       <td class="text-left">
							                           <p><span class="blind">우편번호</span>[[<c:out value="${row.MEM_DLV_ZIP_CDE5 }"/>]</p>
							                           <p><span class="blind">도로명 주소</span><c:out value="${row.MEM_DLV_DRO_ADR1 }"/><c:out value="${row.MEM_DLV_DRO_ADR2 }"/></p>
							                           <p><span class="blind">지번 주소</span><c:out value="${row.MEM_DLV_JBN_ADR1 }"/><c:out value="${row.MEM_DLV_JBN_ADR2 }"/></p>
							                           <p>
							                               <span class="blind">휴대폰</span><c:out value="${row.MEM_DLV_HP1 }"/>-<c:out value="${row.MEM_DLV_HP2 }"/>-<c:out value="${row.MEM_DLV_HP3 }"/> / 
							                               <span class="blind">전화번호</span>
							                               <c:if test="${not empty row.MEM_DLV_TEL1 }">
							                               		<c:out value="${row.MEM_DLV_TEL1 }"/>-<c:out value="${row.MEM_DLV_TEL2 }"/>-<c:out value="${row.MEM_DLV_TEL3 }"/>
							                               </c:if>
							                           </p>
							                       </td>
							                       <td>
							                           <input type="radio" id="myDlvRadio_${i.index }" name="my_dlv_radio" value="${i.index }" <c:if test="${i.index eq 0}">checked="checked"</c:if> title="<c:out value="${row.MEM_DLV_NM }"/> 배송지" />
							                       </td>
							                   </tr>
			                    			</c:forEach>
			                    		</c:when>
		                    			<c:otherwise>	
		                    				<tr>
						                       <td colspan="3">
						                           <p class="no-more">
						                              	주소록이 없습니다.
						                           </p>
						                       </td>
						                   </tr>
				               			</c:otherwise>
				                    </c:choose>
				                </tbody>
				                </table>
								
								<c:if test="${not empty myDlvList}">
					                <div class="action">
					                    <a href="javascript:applyDlv('my');" class="button primary"><span>선택 주소 사용</span></a>
					                </div>
				                </c:if>
				            </div><!-- // address-info -->
				
				           <div class="address-info address-form in"><!-- address-info -->
				               <ul class="form-a dlvForm">
				                   <li class="name">
				                       <div class="tit">
				                           <label for="ORD_DLV_NM">받으시는 분<span class="essential"><em class="blind">필수입력</em></span></label>
				                       </div>
				                       <div class="field">
				                           <input id="ORD_DLV_NM" name="ORD_DLV_NM" type="text"  title="받으시는 분" class="text" maxlength="15" value=""/>
				                       </div>
				                   </li>
				                   <li class="tel">
				                       <div class="tit">
				                           <label for="ORD_DLV_HP1">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
				                       </div>
				                       <div class="field">
				                           <label for="ORD_DLV_HP1" class="sel_box_st0">
				                               <select id="ORD_DLV_HP1" name="ORD_DLV_HP1" class="select" title="휴대폰 번호 앞자리">
				                                   <option value="">선택</option>
								                    <c:if test="${not empty hpCodeList }">
								                         <c:forEach var="hpRow" items="${hpCodeList }">
								                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
								                         </c:forEach>
								                     </c:if>
				                               </select>
				                           </label>
				                           -
						                   <input type="number" id="ORD_DLV_HP2" name="ORD_DLV_HP2" class="text small number" title="휴대폰 번호 중간자리" maxlength="4" value=""/>
						                   -
						                   <input type="number" id="ORD_DLV_HP3" name="ORD_DLV_HP3" class="text small number" title="휴대폰 번호 뒷자리" maxlength="4" value=""/>
				                       </div>
				                   </li>
				                   <li class="tel">
				                       <div class="tit">
				                           <label for="ORD_DLV_TEL1">전화번호</label>
				                       </div>
				                       <div class="field">
				                           <label for="ORD_DLV_TEL1" class="sel_box_st0">
				                               <select id="ORD_DLV_TEL1" class="select" name="ORD_DLV_TEL1" title="전화 번호 앞자리">
				                                   <option value="">선택</option>
								                    <c:if test="${not empty telCodeList }">
								                         <c:forEach var="telRow" items="${telCodeList }">
								                             <option value="<c:out value="${telRow.CMN_COM_NM }"/>"><c:out value="${telRow.CMN_COM_NM }"/></option>
								                         </c:forEach>
								                     </c:if>
				                               </select>
				                           </label> 
				                           -
						                   <input type="number" id="ORD_DLV_TEL2" name="ORD_DLV_TEL2" class="text small number" title="전화 번호 중간자리" maxlength="4" value=""/>
						                   -
						                   <input type="number" id="ORD_DLV_TEL3" name="ORD_DLV_TEL3" class="text small number" title="전화 번호 뒷자리" maxlength="4" value=""/>
				                       </div>
				                   </li>
				                   <li class="address">
				                       <div class="tit">
				                           <label for="ORD_DLV_ZIP_CDE5">주소<span class="essential"><em class="blind">필수입력</em></span></label>
				                       </div>
				                       <div class="field">
				                           <p class="zip">
				                               <input type="text" id="ORD_DLV_ZIP_CDE5" name="ORD_DLV_ZIP_CDE5" class="text" title="우편번호" maxlength="5" readonly="readonly">
				                               <!-- <a href="javascript:;" class="button small search-zipcode"
				                                data-post1_id="ORD_DLV_ZIP_CDE6_1"
						                    	data-post2_id="ORD_DLV_ZIP_CDE6_2"
						                    	data-addr1_id="ORD_DLV_JBN_ADR1"
						                    	data-addr2_id="ORD_DLV_JBN_ADR2"
						                    	data-new_post_id="ORD_DLV_ZIP_CDE5"
						                    	data-new_addr1_id="ORD_DLV_DRO_ADR1"
						                    	data-new_addr2_id="ORD_DLV_DRO_ADR2"
						                    	data-opener_fn="getAddDlvCharge"
				                               ><span>우편번호 찾기</span></a> -->
				                               <a href="javascript:$.com.util.layPop('open', $('#layZipcode'), true);" id="zipCheck" class="button small"><span>우편번호 찾기</span></a>	
				                           </p>
				                           <p>
				                           		<input type="text" name="ORD_DLV_DRO_ADR1" id="ORD_DLV_DRO_ADR1" class="text" title="도로명 주소" placeholder="도로명 주소" readonly="readonly"/>
				                           </p>
				                           <p>
				                               <input type="text" name="ORD_DLV_JBN_ADR1" id="ORD_DLV_JBN_ADR1" class="text" title="지번 주소" placeholder="지번 주소" readonly="readonly"/>
				                           </p>
				                           <p>
				                           	   <input type="text" name="ORD_DLV_DRO_ADR2" id="ORD_DLV_DRO_ADR2" class="text" title="이하 주소" placeholder="이하 주소" />
				                           </p>
				                       </div>
				                   </li>
				                    <%-- [BEGIN] 우편번호 api 스크립트 --%>
									<%--<%@ include file="/WEB-INF/jsp/mobile/include/zipcode.jsp" %>--%>
									<%-- [END] 우편번호 api 스크립트 --%>
				                   <li class="message">
				                       
				                       	   <c:choose>
								       	   <c:when test="${cartlist[0].ORD_TMP_DLV_GBN eq Code.CART_DLV_GBN_SERVICE_CD }"><%-- 클린킹은 서비스정보 --%>
									       	    <div class="tit">
									       	   	<label for="ORD_DLV_MSG">요청사항</label>
									       	   	</div>
									       	   	
									       	   	<div class="field">
						                           <p>
						                           		<input type="text" class="text" id="ORD_DLV_MSG" name="ORD_DLV_MSG" maxlength="60" placeholder="최대 60자 이내 입력가능"/>
						                           </p>
						                           <p class="desc">
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
									       	   <div class="tit">
									       	   	<label for="ORD_DLV_MSG">배송유의사항</label>
									       	   </div>
								       	   		
								       	   		<div class="field">
						                           <p>
						                           		<label for="dlvMessage" class="sel_box_st0" title="배송 메세지 선택">
								                       	   	<select id="dlvMessage" class="select" title="배송 메세지 선택">
						                                        <option value="">메세지를 선택해주세요.</option>
						                                        <c:if test="${not empty codes.DLV_MESSAGE_CD }">
								                                    <c:forEach var="row" items="${codes.DLV_MESSAGE_CD }">
								                                        <option value="<c:out value="${row.CMN_COM_NM }"/>"><c:out value="${row.CMN_COM_NM }"/></option>
								                                    </c:forEach>
								                                    <option value="0">매세지 직접입력</option>
								                                </c:if>
						                                    </select>
					                                    </label>
					                                    <div style="display:none;">
						                           			<input type="text" class="text" id="ORD_DLV_MSG" name="ORD_DLV_MSG" maxlength="60" placeholder="최대 60자 이내 입력가능"/>
						                           		</div>
						                           </p>
						                           <p class="desc">
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
				                   </li>
				               </ul>
				           </div><!-- // address-info -->
				        </div>      
				    </div>
				</div><!-- // ship-address -->
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise><%-- 재주문인 경우 --%>
	</c:otherwise>
</c:choose>

<script>
$(function(){
	// 우편번호 callback 함수
	zipcodeCallback = function (zip,doroAddr,jibunAddr)
	{
		$('#ORD_DLV_ZIP_CDE5').val(zip);
		$('#ORD_DLV_DRO_ADR1').val(doroAddr);
		$('#ORD_DLV_JBN_ADR1').val(jibunAddr);
		$('#ORD_DLV_DRO_ADR2').val("");
	};
	
	//주문자정보와 동일 체크시
	$(document).on("click","#pasteOrderInfo",function(){
		$("#ORD_DLV_NM").val($("#ORD_MST_ORD_NM").val());
		$("#ORD_DLV_HP1").val($("#ORD_MST_HP1").val()).change();
		$("#ORD_DLV_HP2").val($("#ORD_MST_HP2").val());
		$("#ORD_DLV_HP3").val($("#ORD_MST_HP3").val());
	});
	
	//새로운 주소 체크시
	$(document).on("click","#resetDlvInfo",function(){
		var ordDlvMessage = $("#ORD_DLV_MSG").val();		
		$(".dlvForm").find("input").val("");
		$(".dlvForm").find("select").val("").change();
		$("#ORD_DLV_MSG").val(ordDlvMessage);
		<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_LONG_INS_CD}">
			//추가배송비 계산
			//getAddDlvCharge();
		</c:if>
	});
	
	//배송 메세지 선택시
	$(document).on("change","#dlvMessage",function(){
		var thisValue = $(this).val();		
		if(thisValue === "0"){//직접입력
			$("#ORD_DLV_MSG").parent().parent().show();
			$("#ORD_DLV_MSG").val("");
		}else{
			$("#ORD_DLV_MSG").val(thisValue);
			$("#ORD_DLV_MSG").parent().parent().hide();
		}
	});
	
});

//선택한 배송지 적용
function applyDlv(dlv_type){
	var radio_idx = $("input[name="+ dlv_type +"_dlv_radio]:checked").val();
	
	$("."+ dlv_type +"_dlv_"+radio_idx).each(function(i, item){
		var target_dlv_id = $(this).data("target_dlv_id");
		$("#"+target_dlv_id).val($(this).val()).change();
	});
	
	$("."+dlv_type+"-address-list").removeClass("in");
	
	<c:if test="${cartlist[0].ORD_TMP_DLV_GBN ne Code.CART_DLV_GBN_LONG_INS_CD}">
		//추가배송비 계산
		//getAddDlvCharge();
	</c:if>
}

//수령정보 선택시
function chageGetGbn(idx){
	$("#ORD_GET_GBN_"+idx).prop("checked",true);
	$("#ORD_GET_GBN_BTN_"+idx).siblings().removeClass("warning");
	$("#ORD_GET_GBN_BTN_"+idx).addClass("warning");
	
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
	$("#shopInfo").load("<c:out value="${mobileSslDomain}"/>/mobile/cart/getItNowShopInfoPopup.do?SHP_MST_IDX="+shpMstIdx, function(){
		$.com.util.layPop('open', $('#shopInfo'), true);
	});
}

</script>