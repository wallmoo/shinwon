<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- #skyscraperA -->
<c:if test="${fn:indexOf(requestUrl,'/pc/main/index.do') > -1 || fn:indexOf(requestUrl,'/pc/product/productMain.do') > -1 || fn:indexOf(requestUrl,'/pc/product/productList.do') > -1 || fn:indexOf(requestUrl,'/pc/product/product.do') > -1 }">
	<div id="skyscraperA" class="skyscraper">
	    <ul>
	        <c:if test="${not empty wingA_BannerList }">
		        <li class="item nth-child-1">
		            <ul <c:if test="${wingA_BannerCnt > 1}">class="slider"</c:if>>
		                <c:forEach var="wingA_BannerRow" items="${wingA_BannerList }" varStatus="i">
							<c:choose>
								<c:when test="${wingA_BannerRow.BNR_MST_TGT eq 'D' }">
									<img src="<c:out value="${cdnDomain}" /><c:out value="${wingA_BannerRow.CMM_FLE_ATT_PATH}" /><c:out value="${wingA_BannerRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${wingA_BannerRow.CMN_FLE_ALT_TXT}" />" style="width:80px;height:150px;"/>
								</c:when>
								<c:otherwise>
									<li>
										<a href="<c:out value="${wingA_BannerRow.BNR_MST_URL}" />" target="<c:out value="${wingA_BannerRow.BNR_MST_TGT_TARGET}" />">
											<img src="<c:out value="${cdnDomain}" /><c:out value="${wingA_BannerRow.CMM_FLE_ATT_PATH}" /><c:out value="${wingA_BannerRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${wingA_BannerRow.CMN_FLE_ALT_TXT}" />" style="width:80px;height:150px;"/>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
		                </c:forEach>
		            </ul>
		        </li>
	        </c:if>
	        <c:if test="${not empty wingB_BannerList }">
	        	<c:forEach var="wingB_BannerRow" items="${wingB_BannerList }" varStatus="i">
	        		<li class="item nth-child-${i.count+1 }">
		        		<c:choose>
							<c:when test="${wingB_BannerRow.BNR_MST_TGT eq 'D' }">
								<img src="<c:out value="${cdnDomain}" /><c:out value="${wingB_BannerRow.CMM_FLE_ATT_PATH}" /><c:out value="${wingB_BannerRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${wingB_BannerRow.CMN_FLE_ALT_TXT}" />" style="width:80px;height:150px;"/>
							</c:when>
							<c:otherwise>
								<a href="<c:out value="${wingB_BannerRow.BNR_MST_URL}" />" target="<c:out value="${wingB_BannerRow.BNR_MST_TGT_TARGET}" />">
									<img src="<c:out value="${cdnDomain}" /><c:out value="${wingB_BannerRow.CMM_FLE_ATT_PATH}" /><c:out value="${wingB_BannerRow.CMM_FLE_SYS_NM}" />" alt="<c:out value="${wingB_BannerRow.CMN_FLE_ALT_TXT}" />" style="width:80px;height:150px;"/>
								</a>
							</c:otherwise>
						</c:choose>
					</li>
	        	</c:forEach>
	        </c:if>
	    </ul>
	</div>
</c:if>
<!--// #skyscraperA -->

<!-- #skyscraperB -->
<c:if test="${!(fn:indexOf(requestUrl,'/pc/manager/login.do') > -1 || fn:indexOf(requestUrl,'/pc/cart/cartlist.do') > -1 || fn:indexOf(requestUrl,'/pc/cart/cartpayment.do') > -1 || fn:indexOf(requestUrl,'/pc/marketing/kinger') > -1 || fn:indexOf(requestUrl,'/pc/contents/emagazine') > -1 || fn:indexOf(requestUrl,'/pc/themecategory') > -1)}">
<div id="skyscraperB" class="skyscraper">
    <c:choose>
		<c:when test="${sessionUser.ROLE_USER eq 'user'}">
	    	<a href="javascript:;" class="keeping keeping-toggle"><span class="blind">?????????</span></a>
	    </c:when>
	    <c:otherwise>
	    	<a href="javascript:goKeepLogin();" class="keeping"><span class="blind">?????????</span></a>
	    </c:otherwise>
	</c:choose>
	<script>
    	function goKeepLogin(){
    		var url = location.href;
    		
    		//??????????????? ??????????????? ?????? ??????????????? ??????.
    		if(url.indexOf("cartpayment") > 0){
    			url = "<c:out value="${serverDomain }"/>/pc/cart/cartlist.do";
    		}
    		
    		url = encodeURIComponent(url);
    		
    		window.open("<c:out value="${serverDomain}"/>/pc/manager/loginPopup.do?url=" + url + "&locationProtocol=<c:out value="${locationProtocol}"/>","loginPopup","width=850,height=644,scrollbars=no,target=_blank");
    	}
   	</script>
    <div class="keeping-wrap">
        <div class="holder">
            <span class="title"><strong class="warning"><c:out value="${sessionUser.MEM_MST_MEM_NM }"/></strong> ?????? ????????? </span>

            <ul class="ct tab-a item-4"><!-- tab-a -->
                <li class="active"><a href="#keepingA"><span>????????????</span></a><span class="blind">????????????</span></li>
                <li><a href="#keepingB"><span>???????????????</span></a></li>
                <li><a href="#keepingC"><span>???????????????</span></a></li>
                <li><a href="#keepingD"><span>???????????????</span></a></li>
            </ul><!-- // tab-a -->

            <div id="keepingA" class="toggler in"><!-- toggler -->
            	<c:choose>
            		<c:when test="${not empty keepProductList }">
            			<div class="scroll">
		                    <ul class="item-list">
		                    	<c:forEach var="keepProductRow" items="${keepProductList }" varStatus="i">
            						<li>
            							<c:choose>
		                                	<c:when test="${keepProductRow.PRD_MST_SEL_STATE eq Code.PRODUCT_SELL_STATE_STOP }">
		                                		<a href="javascript:alert('????????? <c:out value="${keepProductRow.PRD_MST_NM_FUL }"/> ?????? ?????? ????????? ???????????? ????????????.')">
		                                	</c:when>
		                                	<c:when test="${keepProductRow.PRD_MST_CNL_PC_YN ne 'Y' }">
		                                		<a href="javascript:alert('????????? ?????? ???????????????.')">
		                                	</c:when>
		                                	<c:otherwise>
		                                		 <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${keepProductRow.PRD_MST_CD}">
		                                	</c:otherwise>
		                                </c:choose>
			                                <span class="thumb">
			                                	<img src="<c:out value="${cdnDomain}" />/<c:out value="${keepProductRow.PRD_IMAGE}" />" alt="<c:out value="${keepProductRow.PRD_IMAGE_ALT }"/>" />
			                                </span>
			                                <span class="subject"><c:out value="${keepProductRow.PRD_MST_NM }"/></span>
			                                <span class="price">
			                                	<strong>
			                                		<fmt:formatNumber value="${keepProductRow.PRD_MST_PRICE }" groupingUsed="true" />
			                                	</strong>???
			                                </span>
			                            </a>
			                        </li>
            					</c:forEach>
		                    </ul><!-- // tab-a -->
		                </div>
            		</c:when>
            		<c:otherwise>
            			<p class="message no-more">
		                    &ldquo;?????? ????????? ????????????.&rdquo; 
		                </p>
            		</c:otherwise>
            	</c:choose>
                <div class="ac">
                    <a href="<c:out value="${frontDomain }"/>/pc/mypage/myKeepProductList.do" class="btn_st0 btn_white small"><span>????????????</span></a>
                </div>
            </div><!-- // toggler -->

            <div id="keepingB" class="toggler"><!-- toggler -->
            	<c:choose>
           			<c:when test="${not empty keepContentsList }">
           				<div class="scroll">
		                    <ul>
		                        <c:forEach var="keepContentsRow" items="${keepContentsList }" varStatus="i">
		                        	<c:choose>
		                        		<c:when test="${keepContentsRow.MGZ_MST_KID eq 'T'}">
		                        			<li class="text">
					                            <a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${keepContentsRow.MGZ_MST_IDX}" />">
					                                <span class="subject"><c:out value="${keepContentsRow.MGZ_MST_TITLE }"/></span>
					                            </a>
					                        </li>
		                        		</c:when>
		                        		<c:otherwise>
		                        			<li>
				                            	<a href="<c:out value="${frontDomain }"/>/pc/contents/emagazineView.do?MGZ_MST_IDX=<c:out value="${keepContentsRow.MGZ_MST_IDX}" />">
					                                <span class="thumb">
					                                	<img src="<c:out value="${cdnDomain }${keepContentsRow.CMM_FLE_ATT_PATH }${keepContentsRow.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${keepContentsRow.CMN_FLE_ALT_TXT }"/>" />
					                                </span>
					                                <span class="subject"><c:out value="${fn:substring(keepContentsRow.MGZ_MST_TITLE,0,30) }"/>..</span>
					                            </a>
					                        </li>
		                        		</c:otherwise>
		                        	</c:choose>
		                        </c:forEach>
		                    </ul><!-- // tab-a -->
		                </div>
           			</c:when>
           			<c:otherwise>
           				<p class="message no-more">
		                    &ldquo;?????? ????????? ????????????.&rdquo; 
		                </p>
           			</c:otherwise>
            	</c:choose>
                <div class="ac">
                    <a href="<c:out value="${frontDomain }"/>/pc/mypage/myKeepContentsList.do" class="btn_st0 btn_white small"><span>????????????</span></a>
                </div>
            </div><!-- // toggler -->

            <div id="keepingC" class="toggler"><!-- toggler -->
                <c:choose>
                	<c:when test="${not empty keepPlanList }">
                		<div class="scroll">
		                    <ul>
		                        <c:forEach var="keepPlanRow" items="${keepPlanList }" varStatus="i">
		                        	<li>
			                            <a href="<c:out value="${frontDomain }"/>/pc/event/planProductList.do?PLN_MST_IDX=<c:out value="${keepPlanRow.PLN_MST_IDX}" />">
			                                <span class="thumb">
			                                	<img src="<c:out value="${cdnDomain }${keepPlanRow.CMM_FLE_ATT_PATH }${keepPlanRow.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${keepPlanRow.CMN_FLE_ALT_TXT }"/>" />
			                                </span>
			                                <span class="subject"><c:out value="${fn:substring(keepPlanRow.PLN_MST_TITLE,0,30) }"/>..</span>
			                            </a>
			                        </li>
		                        </c:forEach>
		                    </ul><!-- // tab-a -->
		                </div>
                	</c:when>
                	<c:otherwise>
                		<p class="message no-more">
		                    &ldquo;?????? ????????? ????????????.&rdquo; 
		                </p>
                	</c:otherwise>
                </c:choose>
                <div class="ac">
                    <a href="<c:out value="${frontDomain }"/>/pc/mypage/myKeepPlanList.do" class="btn_st0 btn_white small"><span>????????????</span></a>
                </div>
            </div><!-- // toggler -->

            <div id="keepingD" class="toggler"><!-- toggler -->
                <c:choose>
                	<c:when test="${not empty keepEventList }">
                		<div class="scroll">
		                    <ul>
		                        <c:forEach var="keepEventRow" items="${keepEventList }" varStatus="i">
		                        	<li>
			                            <a href="<c:out value="${frontDomain }"/>/pc/event/eventView.do?EVT_MST_IDX=<c:out value="${keepEventRow.EVT_MST_IDX}" />">
			                                <span class="thumb">
			                                	<img src="<c:out value="${cdnDomain }${keepEventRow.CMM_FLE_ATT_PATH }${keepEventRow.CMM_FLE_SYS_NM }"/>" alt="<c:out value="${keepEventRow.CMN_FLE_ALT_TXT }"/>" />
			                                </span>
			                                <span class="subject"><c:out value="${fn:substring(keepEventRow.EVT_MST_TITLE,0,30) }"/>..</span>
			                            </a>
			                        </li>
		                        </c:forEach>
		                    </ul><!-- // tab-a -->
		                </div>
                	</c:when>
                	<c:otherwise>
                		<p class="message no-more">
		                    &ldquo;?????? ????????? ????????????.&rdquo; 
		                </p>
                	</c:otherwise>
                </c:choose>
                <div class="ac">
                    <a href="<c:out value="${frontDomain }"/>/pc/mypage/myKeepEventList.do" class="btn_st0 btn_white small"><span>????????????</span></a>
                </div>
            </div><!-- // toggler -->
        </div>
        <a href="javascript:;" class="close"><span class="blind">????????? ??????</span></a>
    </div>

    <div class="history">
        <p class="number">
           	?????? ??? ??????
            <strong class="warning">
            	<c:choose>
            		<c:when test="${not empty recentProductCount }">
						<fmt:formatNumber value="${recentProductCount }" groupingUsed="true"/>
            		</c:when>
            		<c:otherwise>
						0
            		</c:otherwise>
            	</c:choose>
            </strong>
            <span class="blind">???</span>
        </p>
        <div class="item-wrap">
        	<c:choose>
        		<c:when test="${not empty recentProductList }">
            		<ul class="slider">
		                <c:forEach var="recentProductRow" items="${recentProductList }" varStatus="i">
							<li>
			                    <a href="<c:out value="${frontDomain }"/>/pc/product/product.do?prdMstCd=${recentProductRow.PRD_MST_CD}">
			                        <span class="thumb">
			                        	<img src="<c:out value="${cdnDomain }${recentProductRow.PRD_IMAGE }"/>" alt="<c:out value="${recentProductRow.PRD_IMAGE_ALT }"/>" />
			                        </span>
			                        <span class="subject"><c:out value="${recentProductRow.PRD_MST_NM}"/></span>
			                        <span class="price">
			                        	<strong><fmt:formatNumber value="${recentProductRow.PRD_MST_PRICE }" groupingUsed="true"/></strong>???
			                        </span>
			                    </a>
			                </li>		                
		                </c:forEach>
		            </ul>
            	</c:when>
            	<c:otherwise>
            		<p class="message no-more">
		                &ldquo;?????? ???<br />?????????<br />????????????&rdquo; 
		            </p>
            	</c:otherwise>
        	</c:choose>
        </div>
    </div>
    <a href="javascript:;" class="action top"><span class="blind">????????? ???????????? ??????</span></a>
    <a href="javascript:;" class="action down"><span class="blind">????????? ????????? ??????</span></a>
</div>
</c:if>
<!--// #skyscraperB -->

<!-- #laypop S -->
<div id="laypop" class="laypop">
	<!-- [0] ????????? ?????? ?????? ?????? -->
	<ul class="laypop_con msg_pop add_pop">
		<li class="close">
			<a href="javascript:com.laypop('hide', 0)"><span class="blind">????????? ?????? ??????</span></a>
		</li>
		<li class="tx_box">
			???????????? ??????????????? ???????????? <br/>????????? ?????? ????????? ?????????????????????. 

			<div class="sel_box">
				<label for="sel_add_si">
					<select id="sel_add_si" class="sel_chg">
						<option value="">???/??? ??????</option>
						<c:forEach items="${areaList }" var="areaRow">
						<option value="<c:out value="${areaRow.CMN_COM_IDX }" />"><c:out value="${areaRow.CMN_COM_NM }" /></option>
						</c:forEach>
					</select>
				<input type="hidden" id="xtr_weather_code" name="xtr_weather_code" value="<c:out value="${areaResultMap.CTY_WTH_WCD }" />" />
				</label>
				<label for="sel_add_gun">
					<select id="sel_add_gun" class="sel_chg">
						<option value="">???/???/??? ??????</option>
					</select>
				</label>
			</div>
		</li>
		
		<li class="btn_box">
			<a href="javascript:areaSave();" class="btn_st1 btn_red"><span>??????</span></a>
		</li>
	</ul>
	
	<!-- [1] ???????????? ?????? -->
	<ul class="laypop_con msg_pop">
		<li class="close">
			<a href="javascript:com.laypop('hide', 1)"><span class="blind">????????? ?????? ??????</span></a>
		</li>
		<li class="tx_box">
			???????????? ??????????????? ???????????? <br/>????????? ?????? ????????? ?????????????????????. 
		</li>					
		
		<li class="btn_box">
			<a href="javascript:void(0)" class="btn_st1 btn_red"><span>??????</span></a>
			<a href="javascript:void(0)" class="btn_st1 btn_blk555"><span>??????</span></a>
		</li>
	</ul>

	
</div>
<!--// #laypop E -->

<!-- #footer S -->
<footer id="footer" class="footer">
	<div class="policy"><!-- .policy S -->
		<dl class="minW policy_contents">
			<dt class="blind">????????? ?????? ??? ??????</dt>
			<dd class="f"><a href="http://www.epasscni.com" class="tx_foot_01" target="_blank"><strong>????????? ??????</strong></a></dd>
			<dd><a href="<c:out value="${frontDomain }"/>/pc/member/onlineAgreement.do" class="tx_foot_02"><strong>????????????</strong></a></dd>
			<dd><a href="<c:out value="${frontDomain }"/>/pc/member/basicMemInfoPolicy.do" class="tx_foot_03"><strong>????????????????????????</strong></a></dd>
			<dd><a href="<c:out value="${frontDomain }"/>/pc/business/businessMain.do" class="tx_foot_04" target="_blank"><strong>????????????</strong></a></dd>
			<dd><a href="<c:out value="${frontDomain }"/>/pc/product/estimateMain.do" class="tx_foot_06"><strong>????????????</strong></a></dd>
			<dd class="l">
				<select id="sel_familySite" class="sel_familySite">
					<option value="0">FAMILY SITE</option>
					<option value="http://www.epasscni.com">EPASSC&I</option>
					<option value="http://www.naver.com">NAVER</option>
					<option value="http://www.daum.net">DAUM</option>
				</select>
			</dd>
		</dl>
	</div><!--// .policy E -->

	<div class="minW footer_contents"><!-- .footer_contents S -->
		
	</div><!--// .footer_contents E -->
	
</footer>
<!--// #footer E -->

<!-- referrer ??? ????????? ?????? ????????? ????????? blank form -->
<form name="_blank_form" id="_blank_form"></form>

<!-- <script src="http://static.ak.fbcdn.net/connect.php/js/FB.Share" type="text/javascript"></script> -->

<!--
<script>document.write('<script src=".<c:out value="${cdnDomain}" />/pc/js/main.js?timeStamp='+Math.floor(+new Date()/1000)+'" charset="utf-8"><\/script>');</script>
-->
<%-- <script src="<c:out value="${cdnDomain}" />/pc/js/defer.js" charset="utf-8" defer></script> --%>

<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<script>
$.cookie("UID", "${sessionUser.MEM_MST_MEM_ID}", { path: '/', expires: 1 }  );

	$(document).on("click", "#sel_add_si", function(){
		var innerHtml = "";
		//console.log($("#sel_add_si").val() );
		if($("#sel_add_si").val() != ""){
			$.ajax({
	            type	: "POST",
	            url 	: "<c:out value="${frontDomain}" />/pc/themecategory/guide3DepListAjax.do",
	            data	:  { "CMN_COM_UP_IDX"	: $("#sel_add_si").val()},
	            dataType : "JSON",
	            async   : false,
	            success	: function(data){
	            	innerHtml +="<option value=''>???/???/??? ??????</option>";
	                $.each(data.list, function(i,item){  
	                	innerHtml +="<option value='"+item.CMN_COM_IDX+"'>"+item.CMN_COM_NM+"</option>";
	                });
	                
	                $("#sel_add_gun").html(innerHtml);
	                com.sel_chg($("#sel_add_gun"), 'chg');
	            },error   : function(xhr,status,error){ 
	                alert("?????? ?????? ??? ????????? ?????????????????????.");
	                //alert("code:"+xhr.status); 
	            }
	        });
		}else{
			$("#sel_add_gun").html('<option value="">???/???/??? ??????</option>');
			com.sel_chg($("#sel_add_gun"), 'chg');
		}
	});
	
	areaSave			= function(){
		var add_gu	= $("#sel_add_gun").val();
		if(add_gu == ""){
			alert("???/???/?????? ???????????????.");
		}else{
			$.ajax({
	        	type: "POST",
	            async: false,
	            data : {"COM_CMN_IDX": add_gu},
	            url: "/pc/common/commonFrontIpInsertAjax.do",
	            dataType: "json",
	            success: function(json) {
	                if(json){                            	
	                	$('.weather > i').attr('class', 'ico_' + json.info.WTH_MST_ICO_NO);
	                	$('#temperTxt').html(Number(json.info.CTY_WTH_CTM) + "<span>??</span>");
	                	$('#locTxt').text(json.info.TODAY + ' ' + json.info.CTY_GGU_NM);
	                	$('#xtr_weather_code').val(json.info.CTY_WTH_WCD);
	                }
	            },
	            error: function() {
	                alert('ajax error');
	            }
	        });		
		}
		com.laypop('hide', 0);
	};
	
	function setCookie(cName, cValue, cDay){
		var expire = new Date();
		expire.setDate(expire.getDate() + cDay);
        cookies = cName + '=' + escape(cValue) + '; path=/ '; // ?????? ????????? ???????????? escape(cValue)??? ?????????.
        if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
        document.cookie = cookies;
	}
	 
	// ?????? ????????????
	function getCookie(cName) {
		cName = cName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cName);
		var cValue = '';
		
		if(start != -1){
			start += cName.length;
			var end = cookieData.indexOf(';', start);
			if(end == -1)end = cookieData.length;
	            cValue = cookieData.substring(start, end);
		}
		return unescape(cValue);
	}
	
	$(document).on("click", "#areaBtn", function(){
  		$("#weather_pr .btn_close").trigger("click");
  	});  
</script>                




 