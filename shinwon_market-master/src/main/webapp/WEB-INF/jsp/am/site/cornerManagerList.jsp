<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
    <a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

    <aside id="navigation"><!-- navigation -->
        <nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
        </nav>
    </aside><!-- // navigation -->

    <div id="body"><!-- body -->

        <section id="contents"><!-- contents -->

            <div id="breadcrumb"><!-- breadcrumb -->
                <a href="#none"><i class="icon-home em"></i> HOME</a>
                &gt;
                <a href="#none">시스템 관리</a>
                &gt;
                <span>매장 관리</span>
            </div><!-- // breadcrumb -->

            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">매장 관리</h3>

                <div class="title-box">
                    <h4 class="title">검색</h4>

                    <div class="right">
                        <a href="#none" id="search" class="button button-b"><span>검색</span></a>
                        <a href="javascript:searchClear('searchForm');" class="button"><span>초기화</span></a>
                    </div>
                </div>
                
                <div class="section-form"><!-- section-form-a -->
                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="searchYn" value="Y" />
	                    
	                    <div class="form-group">
	                        <label class="label"><span>지역</span></label>
	                        <div class="field">
	                            <select class="select" name="searchAreaCd" id="searchAreaCd">
	                                <option value="">시.도를 선택하세요</option>
									<c:if test="${not empty areaList }">
									    <c:forEach var="row" items="${areaList }" varStatus="i">
	                                        <option value="<c:out value="${row.AREA_CD }"/>" <c:if test="${commandMap.searchAreaCd eq row.AREA_CD }">selected="selected"</c:if>>
									            <c:out value="${row.AREA_NM }"/>
	                                        </option>
									    </c:forEach>
									</c:if>
	                            </select>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>매장운영상태</span></label>
	                        <div class="field">
	                            <select class="select" name="searchTradeStts" id="searchTradeStts">
	                                <option value="">전체</option>
									<c:if test="${not empty statusList }">
									    <c:forEach var="row" items="${statusList }" varStatus="i">
	                                        <option value="<c:out value="${row.TRADE_STTS }"/>" <c:if test="${commandMap.searchTradeStts eq row.TRADE_STTS or (commandMap.searchYn ne 'Y' and row.TRADE_STTS eq '20') }">selected="selected"</c:if>>
									            <c:out value="${row.TRADE_STTS_NM }"/>
	                                        </option>
									    </c:forEach>
									</c:if>
	                            </select>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>매장</span></label>
	                        <div class="field">
	                            <select class="select" name="searchType" id="searchType">
	                                <option value="CORNER_NM" <c:if test="${commandMap.searchType eq 'CORNER_NM'}">selected="selected"</c:if>>매장명</option>
	                                <option value="CORNER_CD" <c:if test="${commandMap.searchType eq 'CORNER_CD'}">selected="selected"</c:if>>매장코드</option>
	                                <option value="CORNER_TEL" <c:if test="${commandMap.searchType eq 'CORNER_TEL' }">selected="selected"</c:if>>전화번호마지막네자리</option>
	                            </select>
	                            <input type="text" class="text" name="searchWord" id="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>유통채널</span></label>
	                        <div class="field">
	                            <input type="radio" id="searchTradeType" name="searchTradeType" class="radio" <c:if test="${empty commandMap.searchTradeType }">checked="checked"</c:if> value=""/>
	                            <label for="searchTradeType">전체</label>
	                            <input type="radio" id="searchTradeType1" name="searchTradeType" class="radio" <c:if test="${commandMap.searchTradeType eq '직영점' }">checked="checked"</c:if> value="직영점"/>
	                            <label for="searchTradeType1">직영점              </label>
	                            <input type="radio" id="searchTradeType2" name="searchTradeType" class="radio" <c:if test="${commandMap.searchTradeType eq '백화점' }">checked="checked"</c:if> value="백화점"/>
	                            <label for="searchTradeType2">백화점             </label>
	                            <input type="radio" id="searchTradeType3" name="searchTradeType" class="radio" <c:if test="${commandMap.searchTradeType eq '대리점' }">checked="checked"</c:if> value="대리점"/>
	                            <label for="searchTradeType3">대리점             </label>
	                        </div>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label class="label"><span>매장등급</span></label>
	                        <div class="field">
	                            <input type="radio" id="searchCornerGrade" name="searchCornerGrade" class="radio" <c:if test="${empty commandMap.searchCornerGrade }">checked="checked"</c:if> value=""/>
	                            <label for="searchCornerGrade">전체</label>
	                            <input type="radio" id="searchCornerGrade1" name="searchCornerGrade" class="radio" <c:if test="${commandMap.searchCornerGrade eq '정상' }">checked="checked"</c:if> value="정상"/>
	                            <label for="searchCornerGrade1">정상              </label>
	                            <input type="radio" id="searchCornerGrade2" name="searchCornerGrade" class="radio" <c:if test="${commandMap.searchCornerGrade eq '상설' }">checked="checked"</c:if> value="상설"/>
	                            <label for="searchCornerGrade2">상설             </label>
	                            <input type="radio" id="searchCornerGrade3" name="searchCornerGrade" class="radio" <c:if test="${commandMap.searchCornerGrade eq '행사' }">checked="checked"</c:if> value="행사"/>
	                            <label for="searchCornerGrade3">행사             </label>
	                        </div>
	                    </div>

	                    <div class="form-group">
	                        <label class="label"><span>배송가능여부</span></label>
	                        <div class="field">
	                            <input type="radio" id="searchMallDeliveryA" name="searchMallDelivery" class="radio" <c:if test="${empty commandMap.searchMallDelivery }">checked="checked"</c:if> value=""/>
	                            <label for="searchMallDeliveryA">전체</label>
	                            <input type="radio" id="searchMallDeliveryY" name="searchMallDelivery" class="radio" <c:if test="${commandMap.searchMallDelivery eq 'Y' }">checked="checked"</c:if> value="Y"/>
	                            <label for="searchMallDeliveryY">배송가능매장</label>
	                            <input type="radio" id="searchMallDeliveryN" name="searchMallDelivery" class="radio" <c:if test="${commandMap.searchMallDelivery eq 'N' }">checked="checked"</c:if> value="N"/>
	                            <label for="searchMallDeliveryN">배송불가능매장</label>
	                        </div>
	                    </div>


	                    <%-- div class="form-group">
	                        <label class="label"><span>매장구분</span></label>
	                        <div class="field">
	                            <input type="radio" id="searchSmartPickupA" name="searchSmartPickup" class="radio" <c:if test="${empty commandMap.searchSmartPickup }">checked="checked"</c:if> value=""/>
	                            <label for="searchSmartPickupA">전체</label>
	                            <input type="radio" id="searchSmartPickupY" name="searchSmartPickup" class="radio" <c:if test="${commandMap.searchSmartPickup eq 'Y' }">checked="checked"</c:if> value="Y"/>
	                            <label for="searchSmartPickupY">스마트픽업매장</label>
	                            <input type="radio" id="searchSmartPickupN" name="searchSmartPickup" class="radio" <c:if test="${commandMap.searchSmartPickup eq 'N' }">checked="checked"</c:if> value="N"/>
	                            <label for="searchSmartPickupN">일반매장</label>
	                        </div>
	                    </div --%>
                    </form>
                </div><!-- // section-form-a -->
            
                <div class="title-box">
                    <h4 class="title">리스트</h4>
                    <div class="right">
                        <a href="#none" id="goModify" class="button button-b"><span>변경내역저장</span></a>
						<a href="javascript:goExcelDown();" class="button button-b"><span>엑셀내려받기</span></a>
                    </div>
                </div>
                
                <form id="frm" name="frm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchAreaCd" value="<c:out value="${commandMap.searchAreaCd }"/>"/>
                    <input type="hidden" name="searchTradeStts" value="<c:out value="${commandMap.searchTradeStts }"/>"/>
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchTradeType" value="<c:out value="${commandMap.searchTradeType }"/>"/>
                    <input type="hidden" name="searchCornerGrade" value="<c:out value="${commandMap.searchCornerGrade }"/>"/>
                    <input type="hidden" name="searchMallDelivery" value="<c:out value="${commandMap.searchMallDelivery }"/>"/>
                    <input type="hidden" name="searchSmartPickup" value="<c:out value="${commandMap.searchSmartPickup }"/>"/>
                    <input type="hidden" name="searchYn" value="<c:out value="${commandMap.searchYn }"/>" />
                    <input type="hidden" name="SmartPickupYs" value=""/>
                    <input type="hidden" name="SmartPickupNs" value=""/>
                    <input type="hidden" name="MallDeliveryYs" value=""/>
                    <input type="hidden" name="MallDeliveryNs" value=""/>
                    <input type="hidden" name="MallDeliveryZk16Ys" value=""/>
                    <input type="hidden" name="MallDeliveryZk16Ns" value=""/>
                    <input type="hidden" name="MallDeliveryZk13Ys" value=""/>
                    <input type="hidden" name="MallDeliveryZk13Ns" value=""/>
                    <input type="hidden" name="MallDeliveryZk14Ys" value=""/>
                    <input type="hidden" name="MallDeliveryZk14Ns" value=""/>
                    <input type="hidden" name="MallDeliveryZk15Ys" value=""/>
                    <input type="hidden" name="MallDeliveryZk15Ns" value=""/>
                    <input type="hidden" name="MallDeliveryZk91Ys" value=""/>
                    <input type="hidden" name="MallDeliveryZk91Ns" value=""/>
                    <input type="hidden" name="MallDeliveryZk92Ys" value=""/>
                    <input type="hidden" name="MallDeliveryZk92Ns" value=""/>
                    <input type="hidden" name="MallDeliveryZk93Ys" value=""/>
                    <input type="hidden" name="MallDeliveryZk93Ns" value=""/>
                    <input type="hidden" name="MallDeliveryZk94Ys" value=""/>
                    <input type="hidden" name="MallDeliveryZk94Ns" value=""/>
                    <input type="hidden" name="MallDeliveryZk95Ys" value=""/>
                    <input type="hidden" name="MallDeliveryZk95Ns" value=""/>
                    <input type="hidden" name="OutletYs" value=""/>
                    <input type="hidden" name="OutletNs" value=""/>
                    <input type="hidden" name="CommissionRateCorners" value=""/>

                <div class="table-a"><!-- col list -->
                    <table class="core">
                        <colgroup>
                            <col style="width:  3%;" />
                            <col style="width:  4%;" />
                            <col style="width:  8%;" />
                            <col style="width:  7%;" />
                            <col style="width:  8%;" />
                            <col style="width: auto;" />
                            <col style="width:  8%;" />
                            <col style="width: 30%;" />
                            <col style="width:  8%;" />
                            <col style="width:  4%;" />
                            <col style="width:  4%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>매장코드</th>
                                <th>매장명</th>
                                <th>유통채널</th>
                                <th>대표전화번호</th>
                                <th>주소</th>
                                <%-- th>배송가능여부</th --%>
                                <th>배송가능여부</th>
                                <th>
                                        배송가능회원<br/>
                                    <input type="checkbox" class="checkZk16All" id="SELECT_ALL" name="SELECT_ALL" value="" />일반
                                    <input type="checkbox" class="checkZk13All" id="SELECT_ALL" name="SELECT_ALL" value="" />자사
                                    <input type="checkbox" class="checkZk14All" id="SELECT_ALL" name="SELECT_ALL" value="" />계열사
                                    <input type="checkbox" class="checkZk15All" id="SELECT_ALL" name="SELECT_ALL" value="" />VIP
                                    <input type="checkbox" class="checkZk91All" id="SELECT_ALL" name="SELECT_ALL" value="" />기획1
                                    <input type="checkbox" class="checkZk92All" id="SELECT_ALL" name="SELECT_ALL" value="" />기획2
                                    <input type="checkbox" class="checkZk93All" id="SELECT_ALL" name="SELECT_ALL" value="" />기획3
                                    <input type="checkbox" class="checkZk94All" id="SELECT_ALL" name="SELECT_ALL" value="" />기획4
                                    <%--<input type="checkbox" class="checkZk95All" id="SELECT_ALL" name="SELECT_ALL" value="" />기획5 --%>
                                </th>
                                <th>상설상품취급</th>
                                <th>운영상태</th>
                                <th>위치좌표</th>
                                <th>수수료율</th>
                            </tr>
                        </thead>
                        <tbody id="tbodyCornerList">
                        <c:choose>
                        <c:when test="${not empty list }">
                        <c:set var="listNum" value="${paging.listNum}" />
                        <c:forEach var="row" items="${list }" varStatus="i">
                            <tr>
                               <td><c:out value="${row.RNUM }"/></td>
                               <td><c:out value="${row.CORNER_CD }"/></td>
                               <td><c:out value="${row.CORNER_NM }"/></td>
                               <td><c:out value="${row.TRADE_TYPE_NM }"/></td>
                               <td><c:out value="${row.PHONE_NO1 }"/></td>
                               <td class="left"><c:out value="${row.ADDR1 }"/></td>
                               <td>
		                           <input type="hidden" id="OLD_MALL_DLV_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_MALL_DLV_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.MALL_DLV_YN }"/>"/>
		                           <input type="radio" id="MALL_DLV_Y_<c:out value="${row.CORNER_CD }"/>" name="MALL_DLV_<c:out value="${row.CORNER_CD }"/>" class="radio mallDlv" <c:if test="${row.MALL_DLV_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="MALL_DLV_Y_<c:out value="${row.CORNER_CD }"/>">가능</label>
		                           <input type="radio" id="MALL_DLV_N_<c:out value="${row.CORNER_CD }"/>" name="MALL_DLV_<c:out value="${row.CORNER_CD }"/>" class="radio mallDlv" <c:if test="${row.MALL_DLV_YN ne 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="MALL_DLV_N_<c:out value="${row.CORNER_CD }"/>">불가능</label>
                               </td>
                               <td>
		                           <input type="hidden" id="OLD_MALL_DLV_ZK16_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_MALL_DLV_ZK16_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.MALL_DLV_ZK16_YN }"/>"/>
		                           <input type="checkbox" id="MALL_DLV_ZK16_YN_<c:out value="${row.CORNER_CD }"/>" name="MALL_DLV_ZK16_YN_<c:out value="${row.CORNER_CD }"/>" class="checkbox checkZk16Row" <c:if test="${row.MALL_DLV_ZK16_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="MALL_DLV_ZK16_YN_<c:out value="${row.CORNER_CD }"/>">일반</label>

		                           <input type="hidden" id="OLD_MALL_DLV_ZK13_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_MALL_DLV_ZK13_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.MALL_DLV_ZK13_YN }"/>"/>
		                           <input type="checkbox" id="MALL_DLV_ZK13_YN_<c:out value="${row.CORNER_CD }"/>" name="MALL_DLV_ZK13_YN_<c:out value="${row.CORNER_CD }"/>" class="checkbox checkZk13Row" <c:if test="${row.MALL_DLV_ZK13_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="MALL_DLV_ZK13_YN_<c:out value="${row.CORNER_CD }"/>">자사</label>

		                           <input type="hidden" id="OLD_MALL_DLV_ZK14_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_MALL_DLV_ZK14_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.MALL_DLV_ZK14_YN }"/>"/>
		                           <input type="checkbox" id="MALL_DLV_ZK14_YN_<c:out value="${row.CORNER_CD }"/>" name="MALL_DLV_ZK14_YN_<c:out value="${row.CORNER_CD }"/>" class="checkbox checkZk14Row" <c:if test="${row.MALL_DLV_ZK14_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="MALL_DLV_ZK14_YN_<c:out value="${row.CORNER_CD }"/>">계열사</label>

		                           <input type="hidden" id="OLD_MALL_DLV_ZK15_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_MALL_DLV_ZK15_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.MALL_DLV_ZK15_YN }"/>"/>
		                           <input type="checkbox" id="MALL_DLV_ZK15_YN_<c:out value="${row.CORNER_CD }"/>" name="MALL_DLV_ZK15_YN_<c:out value="${row.CORNER_CD }"/>" class="checkbox checkZk15Row" <c:if test="${row.MALL_DLV_ZK15_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="MALL_DLV_ZK15_YN_<c:out value="${row.CORNER_CD }"/>">VIP</label>

		                           <input type="hidden" id="OLD_MALL_DLV_ZK91_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_MALL_DLV_ZK91_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.MALL_DLV_ZK91_YN }"/>"/>
		                           <input type="checkbox" id="MALL_DLV_ZK91_YN_<c:out value="${row.CORNER_CD }"/>" name="MALL_DLV_ZK91_YN_<c:out value="${row.CORNER_CD }"/>" class="checkbox checkZk91Row" <c:if test="${row.MALL_DLV_ZK91_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="MALL_DLV_ZK91_YN_<c:out value="${row.CORNER_CD }"/>">기획1</label>

		                           <input type="hidden" id="OLD_MALL_DLV_ZK92_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_MALL_DLV_ZK92_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.MALL_DLV_ZK92_YN }"/>"/>
		                           <input type="checkbox" id="MALL_DLV_ZK92_YN_<c:out value="${row.CORNER_CD }"/>" name="MALL_DLV_ZK92_YN_<c:out value="${row.CORNER_CD }"/>" class="checkbox checkZk92Row" <c:if test="${row.MALL_DLV_ZK92_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="MALL_DLV_ZK92_YN_<c:out value="${row.CORNER_CD }"/>">기획2</label>

		                           <input type="hidden" id="OLD_MALL_DLV_ZK93_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_MALL_DLV_ZK93_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.MALL_DLV_ZK93_YN }"/>"/>
		                           <input type="checkbox" id="MALL_DLV_ZK93_YN_<c:out value="${row.CORNER_CD }"/>" name="MALL_DLV_ZK93_YN_<c:out value="${row.CORNER_CD }"/>" class="checkbox checkZk93Row" <c:if test="${row.MALL_DLV_ZK93_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="MALL_DLV_ZK93_YN_<c:out value="${row.CORNER_CD }"/>">기획3</label>

		                           <input type="hidden" id="OLD_MALL_DLV_ZK94_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_MALL_DLV_ZK94_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.MALL_DLV_ZK94_YN }"/>"/>
		                           <input type="checkbox" id="MALL_DLV_ZK94_YN_<c:out value="${row.CORNER_CD }"/>" name="MALL_DLV_ZK94_YN_<c:out value="${row.CORNER_CD }"/>" class="checkbox checkZk94Row" <c:if test="${row.MALL_DLV_ZK94_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="MALL_DLV_ZK94_YN_<c:out value="${row.CORNER_CD }"/>">기획4</label>

		                           <%--
		                           <input type="hidden" id="OLD_MALL_DLV_ZK95_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_MALL_DLV_ZK95_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.MALL_DLV_ZK95_YN }"/>"/>
		                           <input type="checkbox" id="MALL_DLV_ZK95_YN_<c:out value="${row.CORNER_CD }"/>" name="MALL_DLV_ZK95_YN_<c:out value="${row.CORNER_CD }"/>" class="checkbox checkZk95Row" <c:if test="${row.MALL_DLV_ZK95_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="MALL_DLV_ZK95_YN_<c:out value="${row.CORNER_CD }"/>">기획5</label>
		                            --%>
                               </td>
                               <td>
		                           <input type="hidden" id="TG_BRAND_<c:out value="${row.CORNER_CD }"/>" name="TG_BRAND_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.TG_BRAND }"/>"/>
		                           <input type="hidden" id="TRADE_TYPE_<c:out value="${row.CORNER_CD }"/>" name="TRADE_TYPE_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.TRADE_TYPE }"/>"/>
		                           <input type="hidden" id="OLD_OUTLET_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_OUTLET_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.OUTLET_YN }"/>"/>
		                           <input type="radio" id="OUTLET_Y_<c:out value="${row.CORNER_CD }"/>" name="OUTLET_<c:out value="${row.CORNER_CD }"/>" class="radio" <c:if test="${row.OUTLET_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="OUTLET_Y_<c:out value="${row.CORNER_CD }"/>">취급</label>
		                           <input type="radio" id="OUTLET_N_<c:out value="${row.CORNER_CD }"/>" name="OUTLET_<c:out value="${row.CORNER_CD }"/>" class="radio" <c:if test="${row.OUTLET_YN ne 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="OUTLET_N_<c:out value="${row.CORNER_CD }"/>">미취급</label>
		                       </td>
                               <%-- td>
		                           <input type="hidden" id="OLD_SMART_PICKUP_YN_<c:out value="${row.CORNER_CD }"/>" name="OLD_SMART_PICKUP_YN_<c:out value="${row.CORNER_CD }"/>" value="<c:out value="${row.SMART_PICKUP_YN }"/>"/>
		                           <input type="radio" id="SMART_PICKUP_Y_<c:out value="${row.CORNER_CD }"/>" name="SMART_PICKUP_<c:out value="${row.CORNER_CD }"/>" class="radio" <c:if test="${row.SMART_PICKUP_YN eq 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="SMART_PICKUP_Y_<c:out value="${row.CORNER_CD }"/>">스마트픽업</label>
		                           <input type="radio" id="SMART_PICKUP_N_<c:out value="${row.CORNER_CD }"/>" name="SMART_PICKUP_<c:out value="${row.CORNER_CD }"/>" class="radio" <c:if test="${row.SMART_PICKUP_YN ne 'Y' }">checked="checked"</c:if> value="<c:out value="${row.CORNER_CD }"/>"/>
		                           <label for="SMART_PICKUP_N_<c:out value="${row.CORNER_CD }"/>">일반매장</label>
                               </td --%>
                               <td><c:out value="${row.TRADE_STTS_NM }"/></td>
                               <td><c:out value="${row.LOCATION_YN }"/></td>
                               <td>
                               		<input type="hidden" id="CORNER_COMMISSION_RATE_<c:out value="${row.CORNER_CD }"/>" name="CORNER_COMMISSION_RATE_<c:out value="${row.CORNER_CD }"/>" value="${row.CORNER_CD }"/>
                               		<input type="hidden" id="OLD_COMMISSION_RATE_<c:out value="${row.CORNER_CD }"/>" name="OLD_COMMISSION_RATE_<c:out value="${row.CORNER_CD }"/>" value="${row.COMMISSION_RATE}"/>
                               		<input type="text" class="short text" maxlength="6" id="COMMISSION_RATE_<c:out value="${row.CORNER_CD }"/>" name="COMMISSION_RATE_<c:out value="${row.CORNER_CD }"/>" value="${row.COMMISSION_RATE}"/>
                               	</td>
                           </tr>
                        <c:set var="listNum" value="${listNum+1}" />
                        </c:forEach>
                        </c:when>
                        <c:otherwise>
						<c:if test="${commandMap.searchYn eq 'Y'}">
						    <tr>
								<td colspan="12">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
							</tr>
						</c:if>
						<c:if test="${commandMap.searchYn ne 'Y'}">
							<tr>
								<td colspan="12">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
							</tr>
						</c:if>
                        </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div><!-- // col list -->

                <div class="pagination"><!-- pagination -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div><!-- // pagination -->

	                <div class="bbs-status"><!-- bbs status -->
	                    <div class="sort">
	                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                    </div>
	                </div>
                </form>
				<div class="page">
                                    총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page
				</div>

            </div><!-- // contents-inner -->
            
            <div id="fileTest">
            
            </div>

        </section><!-- // contents -->

    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    
    //배송가능회원 체크박스 전체 선택
    $.checkBoxSelect("checkZk16All", "checkZk16Row");
    $.checkBoxSelect("checkZk13All", "checkZk13Row");
    $.checkBoxSelect("checkZk14All", "checkZk14Row");
    $.checkBoxSelect("checkZk15All", "checkZk15Row");

    $.checkBoxSelect("checkZk91All", "checkZk91Row");
    $.checkBoxSelect("checkZk92All", "checkZk92Row");
    $.checkBoxSelect("checkZk93All", "checkZk93Row");
    $.checkBoxSelect("checkZk94All", "checkZk94Row");
    $.checkBoxSelect("checkZk95All", "checkZk95Row");

    // 배송가능여부 변경시
	$(document).on("change",".mallDlv", function(){
		//배송가능일 경우 
		if ($("#MALL_DLV_Y_"+$(this).val()).is(":checked"))
		{
			// 직영점은 전체회원 배송가능
			if ($("#TRADE_TYPE_"+$(this).val()).val() == "0307" || $("#TRADE_TYPE_"+$(this).val()).val() == "0308")
			{
				$("#MALL_DLV_ZK16_YN_"+$(this).val()).prop("checked",true);
				$("#MALL_DLV_ZK13_YN_"+$(this).val()).prop("checked",true);
				$("#MALL_DLV_ZK14_YN_"+$(this).val()).prop("checked",true);
				$("#MALL_DLV_ZK15_YN_"+$(this).val()).prop("checked",true);
			}
			// 직영점이 아니면 일반회원만 배송가능
			else
			{
				$("#MALL_DLV_ZK16_YN_"+$(this).val()).prop("checked",true);
				$("#MALL_DLV_ZK13_YN_"+$(this).val()).prop("checked",false);
				$("#MALL_DLV_ZK14_YN_"+$(this).val()).prop("checked",false);
				$("#MALL_DLV_ZK15_YN_"+$(this).val()).prop("checked",false);
			}
			
			// 프로스펙스 상설매장은 상설취급으로 자동 셋팅
			if ($("#TG_BRAND_"+$(this).val()).val() == "P")
			{
				if ($("#TRADE_TYPE_"+$(this).val()).val() == "0302" || $("#TRADE_TYPE_"+$(this).val()).val() == "0308")
				{
					$("#OUTLET_Y_"+$(this).val()).prop("checked",true);
				}
				else
				{
					$("#OUTLET_N_"+$(this).val()).prop("checked",true);
				}
			}
			else
			{
				$("#OUTLET_Y_"+$(this).val()).prop("checked",true);
			}
		}
	});

		// 매장구분 저장 버튼 클릭 이벤트
    $(document).on("click", "#goModify", function () 
    {
    	// 스마트핍업 매장
    	SmartPickup_Y = "";
    	//  일반매장
    	SmartPickup_N = "";
    	/*
    	$.each($.find("#tbodyCornerList input[id^='SMART_PICKUP_Y_']:checked"), function(index,checkObj){
    		if ($("#OLD_SMART_PICKUP_YN_"+checkObj.value).val() != "Y")
    		{
        		SmartPickup_Y += checkObj.value + "|";
    		}
    	});
    	$.each($.find("#tbodyCornerList input[id^='SMART_PICKUP_N_']:checked"), function(index,checkObj){
    		if ($("#OLD_SMART_PICKUP_YN_"+checkObj.value).val() == "Y")
    		{
        		SmartPickup_N += checkObj.value + "|";
    		}
    	});
    	*/
    	// 몰배송 가능 매장
    	MallDelivery_Y = "";
    	// 몰배송 불가능 매장
    	MallDelivery_N = "";
    	$.each($.find("#tbodyCornerList input[id^='MALL_DLV_Y_']:checked"), function(index,checkObj){
    		if ($("#OLD_MALL_DLV_YN_"+checkObj.value).val() != "Y")
    		{
        		MallDelivery_Y += checkObj.value + "|";
    		}
    	});
    	$.each($.find("#tbodyCornerList input[id^='MALL_DLV_N_']:checked"), function(index,checkObj){
    		if ($("#OLD_MALL_DLV_YN_"+checkObj.value).val() == "Y")
    		{
        		MallDelivery_N += checkObj.value + "|";
    		}
    	});
    	// 일반회원 배송 가능/불가능 매장
    	MallDeliveryZk16_Y = "";
    	MallDeliveryZk16_N = "";
    	$.each($.find("#tbodyCornerList input:checkbox[id^='MALL_DLV_ZK16_YN_']"), function(){
    		if ($(this).is(":checked"))
    		{
        		if ($("#OLD_MALL_DLV_ZK16_YN_"+$(this).val()).val() != "Y")
        		{
            		MallDeliveryZk16_Y += $(this).val() + "|";
        		}
    		}
    		else
   			{
        		if ($("#OLD_MALL_DLV_ZK16_YN_"+$(this).val()).val() == "Y")
        		{
            		MallDeliveryZk16_N += $(this).val() + "|";
        		}
   			}
    	});
    	// 자사회원 배송 가능/불가능 매장
    	MallDeliveryZk13_Y = "";
    	MallDeliveryZk13_N = "";
    	$.each($.find("#tbodyCornerList input:checkbox[id^='MALL_DLV_ZK13_YN_']"), function(){
    		if ($(this).is(":checked"))
    		{
        		if ($("#OLD_MALL_DLV_ZK13_YN_"+$(this).val()).val() != "Y")
        		{
            		MallDeliveryZk13_Y += $(this).val() + "|";
        		}
    		}
    		else
   			{
        		if ($("#OLD_MALL_DLV_ZK13_YN_"+$(this).val()).val() == "Y")
        		{
            		MallDeliveryZk13_N += $(this).val() + "|";
        		}
   			}
    	});
    	// 계열사회원 배송 가능/불가능 매장
    	MallDeliveryZk14_Y = "";
    	MallDeliveryZk14_N = "";
    	$.each($.find("#tbodyCornerList input:checkbox[id^='MALL_DLV_ZK14_YN_']"), function(){
    		if ($(this).is(":checked"))
    		{
        		if ($("#OLD_MALL_DLV_ZK14_YN_"+$(this).val()).val() != "Y")
        		{
            		MallDeliveryZk14_Y += $(this).val() + "|";
        		}
    		}
    		else
   			{
        		if ($("#OLD_MALL_DLV_ZK14_YN_"+$(this).val()).val() == "Y")
        		{
            		MallDeliveryZk14_N += $(this).val() + "|";
        		}
   			}
    	});
    	// VIP회원 배송 가능/불가능 매장
    	MallDeliveryZk15_Y = "";
    	MallDeliveryZk15_N = "";
    	$.each($.find("#tbodyCornerList input:checkbox[id^='MALL_DLV_ZK15_YN_']"), function(){
    		if ($(this).is(":checked"))
    		{
        		if ($("#OLD_MALL_DLV_ZK15_YN_"+$(this).val()).val() != "Y")
        		{
            		MallDeliveryZk15_Y += $(this).val() + "|";
        		}
    		}
    		else
   			{
        		if ($("#OLD_MALL_DLV_ZK15_YN_"+$(this).val()).val() == "Y")
        		{
            		MallDeliveryZk15_N += $(this).val() + "|";
        		}
   			}
    	});
    	// 기획1회원 배송 가능/불가능 매장
    	MallDeliveryZk91_Y = "";
    	MallDeliveryZk91_N = "";
    	$.each($.find("#tbodyCornerList input:checkbox[id^='MALL_DLV_ZK91_YN_']"), function(){
    		if ($(this).is(":checked"))
    		{
        		if ($("#OLD_MALL_DLV_ZK91_YN_"+$(this).val()).val() != "Y")
        		{
            		MallDeliveryZk91_Y += $(this).val() + "|";
        		}
    		}
    		else
   			{
        		if ($("#OLD_MALL_DLV_ZK91_YN_"+$(this).val()).val() == "Y")
        		{
            		MallDeliveryZk91_N += $(this).val() + "|";
        		}
   			}
    	});
    	// 기획2회원 배송 가능/불가능 매장
    	MallDeliveryZk92_Y = "";
    	MallDeliveryZk92_N = "";
    	$.each($.find("#tbodyCornerList input:checkbox[id^='MALL_DLV_ZK92_YN_']"), function(){
    		if ($(this).is(":checked"))
    		{
        		if ($("#OLD_MALL_DLV_ZK92_YN_"+$(this).val()).val() != "Y")
        		{
            		MallDeliveryZk92_Y += $(this).val() + "|";
        		}
    		}
    		else
   			{
        		if ($("#OLD_MALL_DLV_ZK92_YN_"+$(this).val()).val() == "Y")
        		{
            		MallDeliveryZk92_N += $(this).val() + "|";
        		}
   			}
    	});
    	// 기획3회원 배송 가능/불가능 매장
    	MallDeliveryZk93_Y = "";
    	MallDeliveryZk93_N = "";
    	$.each($.find("#tbodyCornerList input:checkbox[id^='MALL_DLV_ZK93_YN_']"), function(){
    		if ($(this).is(":checked"))
    		{
        		if ($("#OLD_MALL_DLV_ZK93_YN_"+$(this).val()).val() != "Y")
        		{
            		MallDeliveryZk93_Y += $(this).val() + "|";
        		}
    		}
    		else
   			{
        		if ($("#OLD_MALL_DLV_ZK93_YN_"+$(this).val()).val() == "Y")
        		{
            		MallDeliveryZk93_N += $(this).val() + "|";
        		}
   			}
    	});
    	// 기획4회원 배송 가능/불가능 매장
    	MallDeliveryZk94_Y = "";
    	MallDeliveryZk94_N = "";
    	$.each($.find("#tbodyCornerList input:checkbox[id^='MALL_DLV_ZK94_YN_']"), function(){
    		if ($(this).is(":checked"))
    		{
        		if ($("#OLD_MALL_DLV_ZK94_YN_"+$(this).val()).val() != "Y")
        		{
            		MallDeliveryZk94_Y += $(this).val() + "|";
        		}
    		}
    		else
   			{
        		if ($("#OLD_MALL_DLV_ZK94_YN_"+$(this).val()).val() == "Y")
        		{
            		MallDeliveryZk94_N += $(this).val() + "|";
        		}
   			}
    	});
    	// 기획5회원 배송 가능/불가능 매장
    	MallDeliveryZk95_Y = "";
    	MallDeliveryZk95_N = "";
    	/*
    	$.each($.find("#tbodyCornerList input:checkbox[id^='MALL_DLV_ZK95_YN_']"), function(){
    		if ($(this).is(":checked"))
    		{
        		if ($("#OLD_MALL_DLV_ZK95_YN_"+$(this).val()).val() != "Y")
        		{
            		MallDeliveryZk95_Y += $(this).val() + "|";
        		}
    		}
    		else
   			{
        		if ($("#OLD_MALL_DLV_ZK95_YN_"+$(this).val()).val() == "Y")
        		{
            		MallDeliveryZk95_N += $(this).val() + "|";
        		}
   			}
    	});
    	*/
    	// 상설상품 취급 매장
    	Outlet_Y = "";
    	$.each($.find("#tbodyCornerList input[id^='OUTLET_Y_']:checked"), function(index,checkObj){
    		if ($("#OLD_OUTLET_YN_"+checkObj.value).val() != "Y")
    		{
        		Outlet_Y += checkObj.value + "|";
    		}
    	});
    	// 상설상품 미취급 매장
    	Outlet_N = "";
    	$.each($.find("#tbodyCornerList input[id^='OUTLET_N_']:checked"), function(index,checkObj){
    		if ($("#OLD_OUTLET_YN_"+checkObj.value).val() == "Y")
    		{
        		Outlet_N += checkObj.value + "|";
    		}
    	});
    	
    	//수수료율 수정
    	var commissionFlag = true;
    	var commissionRateCorner = "";
    	$.each($.find("#tbodyCornerList input[id^='COMMISSION_RATE_']"), function(){
    		var newCommissionRate = $.trim($(this).val());
    		
    		var commissionCheck = /^\d+(?:[.]?[\d]?[\d]?[\d]?[\d])?$/;
    		
    		if( !commissionCheck.test(newCommissionRate) ){
				alert("수수료율 형식이 맞지 않습니다.");
				$(this).focus();
				commissionFlag = false;
				return false;
			}
    		
    		if(parseInt(newCommissionRate) > 100){
    			alert("수수료율은 100을 넘을 수 없습니다.");
    			$(this).focus();
    			commissionFlag = false;
    			return false;
    		}
    		
       		if ($("#OLD_"+$(this).prop("id")).val() != newCommissionRate)
       		{
       			commissionRateCorner += $("#CORNER_"+$(this).prop("id")).val() + "|";
       		}
    	});
    	
    	if(!commissionFlag){
    		return;
    	}
    	
    	if (SmartPickup_Y == "" && SmartPickup_N == "" 
    			&& MallDelivery_Y == "" && MallDelivery_N == ""
       			&& MallDeliveryZk16_Y == "" && MallDeliveryZk16_N == ""
       			&& MallDeliveryZk13_Y == "" && MallDeliveryZk13_N == ""
       			&& MallDeliveryZk14_Y == "" && MallDeliveryZk14_N == ""
       			&& MallDeliveryZk15_Y == "" && MallDeliveryZk15_N == ""
           		&& MallDeliveryZk91_Y == "" && MallDeliveryZk91_N == ""
               	&& MallDeliveryZk92_Y == "" && MallDeliveryZk92_N == ""
                && MallDeliveryZk93_Y == "" && MallDeliveryZk93_N == ""
                && MallDeliveryZk94_Y == "" && MallDeliveryZk94_N == ""
                && MallDeliveryZk95_Y == "" && MallDeliveryZk95_N == ""
          		&& Outlet_Y == "" && Outlet_N == ""
          		&& commissionRateCorner == "")
    	{
    		alert("저장할 내역이 없습니다.");
    	}
    	else
    	{
        	if (confirm("저장하시겠습니까?"))
        	{
            	$("#frm").find("input[name='SmartPickupYs']").val(SmartPickup_Y);
            	$("#frm").find("input[name='SmartPickupNs']").val(SmartPickup_N);
            	$("#frm").find("input[name='MallDeliveryYs']").val(MallDelivery_Y);
            	$("#frm").find("input[name='MallDeliveryNs']").val(MallDelivery_N);
            	$("#frm").find("input[name='MallDeliveryZk16Ys']").val(MallDeliveryZk16_Y);
            	$("#frm").find("input[name='MallDeliveryZk16Ns']").val(MallDeliveryZk16_N);
            	$("#frm").find("input[name='MallDeliveryZk13Ys']").val(MallDeliveryZk13_Y);
            	$("#frm").find("input[name='MallDeliveryZk13Ns']").val(MallDeliveryZk13_N);
            	$("#frm").find("input[name='MallDeliveryZk14Ys']").val(MallDeliveryZk14_Y);
            	$("#frm").find("input[name='MallDeliveryZk14Ns']").val(MallDeliveryZk14_N);
            	$("#frm").find("input[name='MallDeliveryZk15Ys']").val(MallDeliveryZk15_Y);
            	$("#frm").find("input[name='MallDeliveryZk15Ns']").val(MallDeliveryZk15_N);
            	$("#frm").find("input[name='MallDeliveryZk91Ys']").val(MallDeliveryZk91_Y);
            	$("#frm").find("input[name='MallDeliveryZk91Ns']").val(MallDeliveryZk91_N);
            	$("#frm").find("input[name='MallDeliveryZk92Ys']").val(MallDeliveryZk92_Y);
            	$("#frm").find("input[name='MallDeliveryZk92Ns']").val(MallDeliveryZk92_N);
            	$("#frm").find("input[name='MallDeliveryZk93Ys']").val(MallDeliveryZk93_Y);
            	$("#frm").find("input[name='MallDeliveryZk93Ns']").val(MallDeliveryZk93_N);
            	$("#frm").find("input[name='MallDeliveryZk94Ys']").val(MallDeliveryZk94_Y);
            	$("#frm").find("input[name='MallDeliveryZk94Ns']").val(MallDeliveryZk94_N);
            	$("#frm").find("input[name='MallDeliveryZk95Ys']").val(MallDeliveryZk95_Y);
            	$("#frm").find("input[name='MallDeliveryZk95Ns']").val(MallDeliveryZk95_N);
            	$("#frm").find("input[name='OutletYs']").val(Outlet_Y);
            	$("#frm").find("input[name='OutletNs']").val(Outlet_N);
            	$("#frm").find("input[name='CommissionRateCorners']").val(commissionRateCorner);
            	
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/cornerManagerModify.do", "target":"_self", "method":"post"}).submit();
        	}
    	}

    });
    
    // 검색 엔터 이벤트 
    $(document).on("keydown", "#searchWord", function (e) {
        if(e.keyCode == 13){
            $("#search").trigger("click");
            return false;
        }
    });
    
    // 검색 버튼 클릭 이벤트
    $(document).on("click", "#search", function () {
        var $searchForm = $("#searchForm"); 
        
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/cornerManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/cornerManagerList.do", "target":"_self", "method":"post"}).submit();
    };

    // 엑셀다운
    goExcelDown = function () 
    {
        var $frm = $("#frm");
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/site/cornerManagerListExcel.do", "target":"_self", "method":"post"}).submit();
    };
});
</script>
</body>
</html>