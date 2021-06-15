<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

            <div class="container">

                <h2 class="title"><span>이벤트관리</span></h2>

                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/> 
                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>
                
                <form id="frm" name="frm" enctype="multipart/form-data"> 
                    <input type="hidden" name="POP_MST_CHN_GBN" value="P" />
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label class="label"><span>작성자</span></label></th>
                                <td>
                                    <c:out value="${sessionAdmin.ADM_MST_ID }"/>(<c:out value="${sessionAdmin.ADM_MST_NM }"/>)
                                </td>
                            
                            </tr>
                            <tr>
                                <th><label class="label"><span>채널<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="checkbox" class="checkbox" name="EVT_MST_PC_YN" id="EVT_MST_PC_YN" value="Y" checked = "checked" /><label for="EVT_MST_PC_YN" > PC</label>
                                    <input type="checkbox" class="checkbox" name="EVT_MST_MB_YN" id="EVT_MST_MB_YN" value="Y" checked = "checked"/><label for="EVT_MST_MB_YN" > MOBILE</label>
                                </td>
                            </tr>
                             <tr>
                                <th><label class="label"><span>이벤트 대상<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <select id="EVT_MST_MEM_GBN" name="EVT_MST_MEM_GBN" class="select" title="이벤트 대상">
                                        <option value="0">전체</option>
                                        <option value="1">일반회원</option>
                                        <option value="2">간편회원</option>
                                    </select>
                                </td>
                            </tr>
                       
                            <tr>
                                <th><label class="label"><span>기간<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" class="text" id="EVT_MST_ST_DT" name="EVT_MST_ST_DT" readonly="readonly" data-target-end="#EVT_MST_ED_DT"/>
                                    <select id="EVT_MST_ST_HH" name="EVT_MST_ST_HH" class="auctionEventTime">
                                    <option value="">시</option>
                                    <c:forEach begin="0" end="23" step="1" varStatus="i">
                                        <c:set var="hh" value="${i.index}"/>
                                        <c:if test="${i.index < 10}">
                                            <c:set var="hh" value="0${i.index}"/>
                                        </c:if>
                                        <option value="${hh}" <c:if test="${hh eq '00' }">selected</c:if> >${hh}</option>
                                    </c:forEach>
                                    </select>
                                    <select id="EVT_MST_ST_MM" name="EVT_MST_ST_MM" class="auctionEventTime">
                                        <option value="">분</option>
                                        <c:forEach begin="0" end="59" step="1" varStatus="i">
                                            <c:set var="mm" value="${i.index}"/>
                                            <c:if test="${i.index < 10}">
                                                <c:set var="mm" value="0${i.index}"/>
                                            </c:if>
                                            <option value="${mm}" <c:if test="${mm eq '00' }">selected</c:if>>${mm}</option>
                                        </c:forEach>
                                    </select>
                                     ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" class="text" id="EVT_MST_ED_DT" name="EVT_MST_ED_DT"  readonly="readonly" data-target-start="#EVT_MST_ST_DT"/>
                                    <select id="EVT_MST_ED_HH" name="EVT_MST_ED_HH" class="auctionEventTime">
                                        <option value="">시</option>
                                        <c:forEach begin="0" end="23" step="1" varStatus="i">
                                            <c:set var="hh" value="${i.index}"/>
                                            <c:if test="${i.index < 10}">
                                                <c:set var="hh" value="0${i.index}"/>
                                            </c:if>
                                            <option value="${hh}" <c:if test="${hh eq '23' }">selected</c:if> >${hh}</option>
                                        </c:forEach>
                                    </select>
                                    <select id="EVT_MST_ED_MM" name="EVT_MST_ED_MM" class="auctionEventTime">
                                        <option value="">분</option>
                                        <c:forEach begin="0" end="59" step="1" varStatus="i">
                                            <c:set var="mm" value="${i.index}"/>
                                            <c:if test="${i.index < 10}">
                                                <c:set var="mm" value="0${i.index}"/>
                                            </c:if>
                                            <option value="${mm}" <c:if test="${mm eq '59'}">selected</c:if>>${mm}</option>
                                        </c:forEach>
                                    </select>
                                    
                                    <a href="javascript:fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('EVT_MST_ST_DT', 'EVT_MST_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            
                            <tr>
                                <th><label class="label"><span>이벤트명 <i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="text" name="EVT_MST_TITLE" id="EVT_MST_TITLE" class="text long" maxlength="50" style="width:80%;"/>
                                    (<span id="byte_title">0</span>/50 byte)
                                </td>
                            </tr>
                            
                            <tr>
                                <th><label class="label"><span>이벤트형태<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <c:if test="${not empty eventTypeList }">
                                        <c:forEach var="eventTypeRow" items="${eventTypeList }" varStatus="i">
                                            <input id="eventType${i.index}" type="radio" name="EVT_MST_TYPE" class="radio" <c:if test="${commandMap.searchEvtMstType eq eventTypeRow.CMN_COM_IDX}">checked="checked"</c:if> value="<c:out value="${eventTypeRow.CMN_COM_IDX}"/>"/>
                                            <label for="eventType${i.index}"><c:out value="${eventTypeRow.CMN_COM_NM }"/></label>
                                        </c:forEach>
                                    </c:if>
                                    <div class="_areaWinnerDate" style="padding-top: 10px;display: none;">
                                    	<input type="checkbox" name="EVT_MST_WIN_YN" id="stateTopA" value="Y" class="checkbox" />
                                    	<label for="stateTopA">당첨자발표일</label> 
                                    	<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    	<input type="text" name="EVT_MST_WIN_DT" id="EVT_MST_WIN_DT" class="text" readonly="readonly"/>
                                    </div>
                                </td>
                            </tr>
                            
                            <tr class="_areaPredictWiner" style="display: none;">
                                <th><label class="label"><span>예상 당첨자<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="text" name="EVT_MST_PRE_WIN" id="EVT_MST_PRE_WIN" class="number short"/> 명
                                </td>
                            </tr>
                            
                            <tr>
                                <th><label class="label"><span>전시상태<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="radio" name="EVT_MST_USE_YN" id="stateA" class="radio" value="Y"checked="checked"/>
                                    <label for="stateA">전시</label>
                                    <input type="radio" name="EVT_MST_USE_YN" id="stateB" class="radio" value="N"/>
                                    <label for="stateB">미전시</label>
                                </td>
                            </tr>
                            
                            <tr>
                                <th><label class="label"><span>PC 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile1-list">                          
                                    </div>
                                    <input type="file" name="file" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 1MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" maxlength="20" style="width:70%;"/>
                                        (<span id="byte_p1">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>
                            
                            <tr class="_areaPcTopImg">
                                <th><label class="label"><span>PC 상단 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile2-list">                          
                                    </div>
                                    <input type="file" name="PC_TOP_IMG" id="PC_TOP_IMG" class="file pcImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="PC_TOP_IMG_TXT" id="PC_TOP_IMG_TXT" class="text pcImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_p2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>                            
                            
                            <tr class="_areaPcDetailImg">
                                <th><label class="label"><span>PC 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile2-list">                          
                                    </div>
                                    <input type="file" name="file" id="multiFile2" class="file pcImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_P2" id="CMN_FLE_ALT_TXT_P2" class="text pcImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_p2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>
                            
                            <tr class="_areaPcBgImg">
                                <th><label class="label"><span>PC 배경 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile2-list">                          
                                    </div>
                                    <input type="file" name="file" id="multiFile22" class="file pcImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_P3" id="CMN_FLE_ALT_TXT_P3" class="text pcImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_p2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>                            
                            
                            <tr>
                                <th><label class="label"><span>MOBILE 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile3-list">                          
                                    </div>
                                    <input type="file" name="file2" id="multiFile3" class="file mobileImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                     <small class="desc">* 업로드 용량 : 1MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_m1">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>
                            
                            <tr class="_areaMobileTopImg">
                                <th><label class="label"><span>MOBILE 상단 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile2-list">                          
                                    </div>
                                    <input type="file" name="MB_TOP_IMG" id="MB_TOP_IMG" class="file pcImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="MB_TOP_IMG_TXT" id="MB_TOP_IMG_TXT" class="text pcImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_p2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>                            
                            
                            <tr class="_areaMobileDetailImg">
                                <th><label class="label"><span>MOBILE 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile4-list">                          
                                    </div>
                                    <input type="file" name="file2" id="multiFile4" class="file mobileImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M2" id="CMN_FLE_ALT_TXT_M2" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_m2">0</span>/20 byte)
                                    </p>
                                </td>
                            
                            </tr>
                            
                            <tr class="_areaMobileBgImg">
                                <th><label class="label"><span>MOBILE 배경 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile4-list">                          
                                    </div>
                                    <input type="file" name="file2" id="multiFile44" class="file mobileImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M3" id="CMN_FLE_ALT_TXT_M3" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_m2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>

                            <tr class="_areaPcRoulette">
                                <th><label class="label"><span>PC 룰렛판 BG 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile4-list">                          
                                    </div>
                                    <input type="file" name="pcRouletteImgBg" id="pcRouletteImgBg" class="file mobileImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="pcRouletteImgBgText" id="pcRouletteImgBgText" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_m2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>
                            <tr class="_areaPcRoulette">
                                <th><label class="label"><span>PC 룰렛판 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile4-list">                          
                                    </div>
                                    <input type="file" name="pcRoulette`Img" id="pcRouletteImg" class="file mobileImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="pcRouletteImgText" id="pcRouletteImgText" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_m2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>
                            <tr class="_areaPcRoulette">
                                <th><label class="label"><span>PC 룰렛 포인터<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile4-list">                          
                                    </div>
                                    <input type="file" name="pcRouletteImgPointer" id="pcRouletteImgPointer" class="file mobileImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="pcRouletteImgPointerText" id="pcRouletteImgPointerText" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_m2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>
                            <tr class="_areaPcRoulette">
                                <th><label class="label"><span>PC 룰렛 실행 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile4-list">                          
                                    </div>
                                    <input type="file" name="pcRouletteImgExe" id="pcRouletteImgExe" class="file mobileImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="pcRouletteImgExeText" id="pcRouletteImgExeText" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_m2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>
                            
                            <tr class="_areaMobileRoulette">
                                <th><label class="label"><span>mobile 룰렛판 BG 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile4-list">                          
                                    </div>
                                    <input type="file" name="mobileRouletteImgBg" id="mobileRouletteImgBg" class="file mobileImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="mobileRouletteImgBgText" id="mobileRouletteImgBgText" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_m2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>
                            <tr class="_areaMobileRoulette">
                                <th><label class="label"><span>mobile 룰렛판 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile4-list">                          
                                    </div>
                                    <input type="file" name="mobileRouletteImg" id="mobileRouletteImg" class="file mobileImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="mobileRouletteImgText" id="mobileRouletteImgText" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_m2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>
                            <tr class="_areaMobileRoulette">
                                <th><label class="label"><span>mobile 룰렛 포인터<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile4-list">                          
                                    </div>
                                    <input type="file" name="mobileRouletteImgPointer" id="mobileRouletteImgPointer" class="file mobileImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="mobileRouletteImgPointerText" id="mobileRouletteImgPointerText" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_m2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>
                            <tr class="_areaMobileRoulette">
                                <th><label class="label"><span>mobile 룰렛 실행 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile4-list">                          
                                    </div>
                                    <input type="file" name="mobileRouletteImgExe" id="mobileRouletteImgExe" class="file mobileImgFile" data-attach_cnt="1" data-accept="img"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="mobileRouletteImgExeText" id="mobileRouletteImgExeText" class="text mobileImgFile" placeholder="20자 이내로 입력하세요." maxlength="20" style="width:70%;"/>
                                        (<span id="byte_m2">0</span>/20 byte)
                                    </p>
                                </td>
                            </tr>

                            
                            
                            <!--  -->
                            <tr id="svyForm">
                                <th><label class="label"><span>설문<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="hidden" name="MAX_NUM" id="MAX_NUM" value="0"/>
                                    <input type="hidden" name="MAX_NUM_FILE" id="MAX_NUM_FILE" value="1"/>  
                                    
                                    <table class="core" >
                                        <colgroup>
                                            <col style="width: 20%;" />
                                            <col style="width: auto;" />
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <td>유형</td>
                                                <td class="left">
                                                    <input type="radio" name="EVT_MST_SVY_TYPE" id="EVT_MST_SVY_TYPE1" class="radio" value="T" checked="checked"/>
                                                    <label for="EVT_MST_SVY_TYPE1">텍스트</label>
                                                    <input type="radio" name="EVT_MST_SVY_TYPE" id="EVT_MST_SVY_TYPE2" class="radio" value="I" />
                                                    <label for="EVT_MST_SVY_TYPE2">이미지</label>      
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody id="svyList">
                                            <tr>
                                                <td>항목1<input type="hidden" name="EVT_DTL_NO" id="EVT_DTL_NO0" value="1"/></td>
                                                <td class="left">
                                                    <input type="text" name="EVT_DTL_NM" id="EVT_DTL_NM0" class="text EVT_DTL_NM" style="width:50%;"/>
                                                    <a href="javascript:rowAdd()"class="button button-a small"><span>추가</span></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tbody id="svyImgList">
                                            <tr>
                                                <td>항목1<input type="hidden" name="EVT_DTL_NO_F" id="EVT_DTL_NO1" value="1"/></td>
                                                <td class="left" id="defaultFile">                                          
                                                    <span id="defaultSvyFile"><input type="file" name="fileSvy1" id="fileSvy[1]" class="file EVT_DTL_NO_F" value="" style="width:50%;" /></span>                                                                                                                                                                    
                                                    <a id="rowAddFile" href="#none" class="button button-a small"><span>추가</span></a>
                                                    <a id="delSvyFile" href="#none" class="button button-a small"><span>파일지우기</span></a>
                                                </td>
                                            </tr> 
                                        </tbody>
                                    </table>
                                </td>
                            
                            </tr>
                            
                            <tr class="_areaPoint" style="display: none;">
                                <th><label class="label"><span>포인트 설정<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile4-list">                          
                                    </div>
                                    <select id="EVT_MST_PIT_GB" name="EVT_MST_PIT_GB" class="select" title="포인트 설정">
                                        <option value="N">사용안함</option>
                                        <option value="Y">적립</option>
                                        <option value="A">차감</option>
                                    </select>       
                                    <span id="EVT_MST_PIT_S">                           
                                        <input type="text" id="EVT_MST_PIT" name="EVT_MST_PIT" class="text short number PLN_GRP_SORT" maxlength="10" />점
                                    </span>
                                </td>
                            
                            </tr>
                            <!-- 
                            <tr style="display:none;" data-event-type="luckydraw">
                                <th><label class="label"><span>상품수량</span></label></th>
                                <td>
                                     <select id="productCount" name="EVT_PRD_COUNT">
                                        <option value="1"></option>
                                        <option value="2"></option>
                                        <option value="3" selected="selected"></option>
                                     </select>
                                </td>
                            </tr>
                            <tr style="display:none;" data-event-type="luckydraw">
                                <th><label class="label"><span>응모상품 이미지</span></label></th>
                                <td id="fileContainer">
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>ID당 응모 중복여부</span></label></th>
                                <td>
                                     <input type="checkbox" class="checkbox" name="EVT_MST_DUP_ETR" id="EVT_MST_DUP_ETR" value="Y" /><label for="EVT_MST_DUP_ETR" > 중복허용</label>
                                </td>
                            </tr>
                            -->
                        </tbody>
                    </table><!-- // table -->
                    
                    <h3 class="title _areaLucky" style="display: none;"><span>상품</span></h3>
                    <table cellspacing="0" class="table-row table-a _areaLucky" style="display: none;"><!-- table -->
                        <colgroup>
                            <col style="width: 170px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label class="label"><span>상품수량</span></label></th>
                                <td>
                                     <select id="productCount" name="EVT_PRD_COUNT" >
                                        <!--  
                                        <option value="1" <c:if test="${row.EVT_PRD_COUNT eq 1}">selected="selected"</c:if>>1</option>
                                        <option value="2" <c:if test="${row.EVT_PRD_COUNT eq 2}">selected="selected"</c:if>>2</option>
                                        <option value="3" <c:if test="${row.EVT_PRD_COUNT eq 3}">selected="selected"</c:if>>3</option>
                                        -->
                                        <option value="0">상품수량선택</option>
                                        <option value="1">1개</option>
                                        <option value="2">2개</option>
                                        <option value="3">3개</option>
                                     </select>
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>응모상품 이미지</span></label></th>
                                <td id="fileContainer" >
                                    <div class="form-group pcImgDiv" >
                                            <!-- 
                                            <c:forEach items="${prdFileList}" var="prdFileRow" varStatus="i"> 
                                            <c:if test="${prdFileRow.CMM_FLE_TB_TYPE == 'P' && prdFileRow.CMM_FLE_SORT == '1'}">
	                                        	<div id="multiFile5-list">                          
	                                                <c:set var="altTextP1" value="${prdFileRow.CMN_FLE_ALT_TXT }"/>
	                                                <c:set var="altTextP1Idx" value="${prdFileRow.CMM_FLE_IDX}"/>
	                                                
	                                                <i class="icon-file"></i>
	                                                <a href="<c:out value="${cdnDomain}${prdFileRow.CMM_FLE_ATT_PATH}${prdFileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
	                                                    <c:out value="${prdFileRow.CMM_FLE_ORG_NM }"/>
	                                                </a>
	                                                <input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file5" value="<c:out value="${prdFileRow.CMM_FLE_IDX }"/>" />
	                                                <label for="CMM_FLE_IDX">삭제</label>
	                                                <input type="file" name="file5" id="multiFile5" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />                                    
	                                                <p class="img-text">
	                                                    <span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" style="width:70%;"/>
	                                                    (<span id="byte_p1">0</span>/20 byte)
	                                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
	                                                </p>
	                                            </div>
                                            </c:if>
                                            </c:forEach>
                                            -->
                                            <ul id="productImgList">
                                            	<li style="display: none;">
		                                            <input type="file" name="productFile1" id="productFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" /><br>
		                                            <span>대체텍스트</span> <input type="text" name="productFileText1" id="productFileText1" class="text pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" style="width:70%;"/>
													(<span id="byte_p1">0</span>/20 byte)                                            	
                                            	</li>
                                            	<li style="display: none;">
		                                            <input type="file" name="productFile2" id="productFile2" class="file pcImgFile" data-attach_cnt="1" data-accept="img" /><br>
		                                            <span>대체텍스트</span> <input type="text" name="productFileText2" id="productFileText2" class="text pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" style="width:70%;"/>
													(<span id="byte_p1">0</span>/20 byte)                                            	
                                            	</li>
                                            	<li style="display: none;">
		                                            <input type="file" name="productFile3" id="productFile3" class="file pcImgFile" data-attach_cnt="1" data-accept="img" /><br>
		                                            <span>대체텍스트</span> <input type="text" name="productFileText3" id="productFileText3" class="text pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" style="width:70%;"/>
													(<span id="byte_p1">0</span>/20 byte)                                            	
                                            	</li>
                                            </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>ID당 응모 중복여부</span></label></th>
                                <td>
                                     <input type="checkbox" class="checkbox" name="EVT_MST_DUP_ETR" id="EVT_MST_DUP_ETR" value="Y" /><label for="EVT_MST_DUP_ETR" > 중복허용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <h3 class="title _areaRandom" style="display: none;"><span>상품</span></h3>
                    <table cellspacing="0" class="table-row table-a _areaRandom" style="display: none;"><!-- table -->
                        <colgroup>
                            <col style="width: 170px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label class="label"><span>응모상품</span></label></th>
                                <td>
                                    <div class="form-group pcImgDiv"  >
	                                    <ul>
	                                    	<li>
												<a href="javascript:couponAdd();" class="button button-a xsmall"><span>쿠폰추가</span></a>
	                                    	</li>
	                                    </ul>
	                                    <ul id="coupon1List"></ul>	                                    
                                    </div>
                                </td>
                            </tr>                            
                            <tr class="_areaProductProbability">
                                <th><label class="label"><span>당첨확율<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div class="form-group pcImgDiv"  >
	                                    <ul>
	                                    	<li>
			                                    <input type="radio" name="EVT_WIN_PBB" id="EVT_WIN_PBB_A" class="radio" value="A"checked="checked"/>
			                                    <label for="EVT_WIN_PBB_A">상품수 비례</label>
			                                    <input type="radio" name="EVT_WIN_PBB" id="EVT_WIN_PBB_B" class="radio" value="B"/>
			                                    <label for="EVT_WIN_PBB_B">상품별</label>
	                                    	</li>
	                                    </ul>
	                                    <ul id="coupon2List" style="display: none;"></ul>	                                    
                                    </div>                                

                                </td>
                            </tr>                            
                            <tr>
                                <th><label class="label"><span>ID당 응모 중복여부</span></label></th>
                                <td>
                                     <input type="checkbox" class="checkbox" name="EVT_MST_DUP_ETR" id="EVT_MST_DUP_ETR" value="Y" /><label for="EVT_MST_DUP_ETR" > 중복허용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>                    
                    
                    <h3 class="title _areaQuiz" style="display: none;"><span>퀴즈</span></h3>
                    <table cellspacing="0" class="table-row table-a _areaQuiz" style="display: none;"><!-- table -->
                        <colgroup>
                            <col style="width: 170px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label class="label"><span>안내문구<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                	<textarea class="textarea" name="EVT_QUIZ_INFO" id="EVT_QUIZ_INFO" style="height: 100px; width:80%;"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>질문<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
									<input type="text" name="EVT_QUIZ_QUESTION" id="EVT_QUIZ_QUESTION" class="text long" maxlength="50" style="width:80%;"/>
                                    (<span id="byte_title">0</span>/70 byte)
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>정답<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                	<input type="text" name="EVT_QUIZ_ANSWER" id="EVT_QUIZ_ANSWER" class="text long" maxlength="50" style="width:40%;"/>
                                </td>
                            </tr>                            
                            <tr>
                                <th><label class="label"><span>마지막문구<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                	<input type="text" name="EVT_QUIZ_LAST_TEXT" id="EVT_QUIZ_LAST_TEXT" class="text long" maxlength="50" style="width:40%;"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>                    
                    
                    <h3 class="title _areaProductRoulette"><span>상품</span></h3>
                    <table cellspacing="0" class="table-row table-a _areaProductRoulette"><!-- table -->
                        <colgroup>
                            <col style="width: 170px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label class="label"><span>응모상품</span></label></th>
                                <td>
	                                <input type="radio" name="EVT_ROUL_KIND" id="EVT_ROUL_KIND_A" class="radio" value="C"checked="checked"/>
	                                <label for="EVT_ROUL_KIND_A">쿠폰</label>
	                                <input type="radio" name="EVT_ROUL_KIND" id="EVT_ROUL_KIND_B" class="radio" value="P"/>
	                                <label for="EVT_ROUL_KIND_B">E-포인트</label>
	                                <input type="radio" name="EVT_ROUL_KIND" id="EVT_ROUL_KIND_C" class="radio" value="CP"/>
	                                <label for="EVT_ROUL_KIND_C">쿠폰 + E-포인트</label>
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>상품수량</span></label></th>
                                <td>
                                     <select id="productRouletteCount" name="EVT_ROUL_PRD_COUNT" >
                                        <option value="0">상품수량선택</option>
                                        <option value="1">1개</option>
                                        <option value="2">2개</option>
                                        <option value="3">3개</option>
                                        <option value="4">4개</option>
                                        <option value="5">5개</option>
                                        <option value="6">6개</option>
                                        <option value="7">7개</option>
                                        <option value="8">8개</option>
                                     </select>
                                </td>
                            </tr>
                            <tr data-event-type="luckydraw">
                                <th><label class="label"><span>상품등록</span></label></th>
                                <td id="fileContainer" >
                                    <div class="form-group pcImgDiv" >
                                          <ul id="productRouletteList"></ul>
                                    </div>
                                </td>
                            </tr>                            
                            <tr class="_areaProductProbability">
                                <th><label class="label"><span>당첨확율<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div class="form-group pcImgDiv"  >
	                                    <ul>
	                                    	<li>
			                                    <input type="radio" name="EVT_ROULETTE_PBB" id="EVT_ROULETTE_A" class="radio" value="A"checked="checked"/>
			                                    <label for="EVT_ROULETTE_A">상품수 비례</label>
			                                    <input type="radio" name="EVT_ROULETTE_PBB" id="EVT_ROULETTE_B" class="radio" value="B"/>
			                                    <label for="EVT_ROULETTE_B">상품별</label>
	                                    	</li>
	                                    </ul>
	                                    <ul id="coupon3List" style="display: none;"></ul>	                                    
                                    </div>                                

                                </td>
                            </tr>                            
                            <tr>
                                <th><label class="label"><span>ID당 응모 중복여부</span></label></th>
                                <td>
                                     <input type="checkbox" class="checkbox" name="EVT_MST_DUP_ETR" id="EVT_MST_DUP_ETR" value="Y" /><label for="EVT_MST_DUP_ETR" > 중복허용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <h3 class="title _areaAllDay" style="display: none;"><span>상품</span></h3><!-- 출석 -->
                    <table cellspacing="0" class="table-row table-a _areaAllDay" style="display: none;"><!-- table -->
                        <colgroup>
                            <col style="width: 170px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label class="label"><span>응모상품<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
									<ul>
										<li>
											<select name="allDayYear" id="allDayYear">
												<option value="2020">2020</option>
												<option value="2021">2021</option>
												<option value="2022">2022</option>
												<option value="2023">2023</option>
												<option value="2024">2024</option>
												<option value="2025">2025</option>
												<option value="2026">2026</option>
												<option value="2027">2027</option>
												<option value="2028">2028</option>
												<option value="2029">2029</option>
												<option value="2030">2030</option>
											</select>년&nbsp;
											<select name="allDayMonth" id="allDayMonth">
												<option value="0">1</option>
												<option value="1">2</option>
												<option value="2">3</option>
												<option value="3">4</option>
												<option value="4">5</option>
												<option value="5">6</option>
												<option value="6">7</option>
												<option value="7">8</option>
												<option value="8">9</option>
												<option value="9">10</option>
												<option value="10">11</option>
												<option value="11">12</option>
											</select>월
										</li>
									</ul>
									<ul id="allDayList"></ul>
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>한달출석체크 완료상품 <i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
									<input type="text" name="EVT_ALLDAY_COMP_COUPON" id="EVT_ALLDAY_COMP_COUPON" class="text long" maxlength="50" style="width:60%;"/>
									<a href="#" class="button button-a xsmall couponSelect"><span>쿠폰선택</span></a>
                                </td>
                            </tr>                            
                            <tr>
                                <th><label class="label"><span>한달출석체크 완료문구<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                	<input type="text" name="EVT_ALLDAY_COMP_TEXT" id="EVT_ALLDAY_COMP_TEXT" class="text long" maxlength="50" style="width:40%;"/>
                                </td>
                            </tr>                            
                            <tr>
                                <th><label class="label"><span>ID당 응모 중복여부</span></label></th>
                                <td>
                                     <input type="checkbox" class="checkbox" name="EVT_ALLDAY_DUP_ETR" id="EVT_ALLDAY_DUP_ETR" value="Y" /><label for="EVT_ALLDAY_DUP_ETR" > 중복허용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <h3 class="title _areaGroupBuying" style="display: none;"><span>상품</span></h3> <!-- 공동구매 -->
                    <table cellspacing="0" class="table-row table-a _areaGroupBuying" style="display: none;"><!-- table -->
                        <colgroup>
                            <col style="width: 170px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr class="_areaVoteShow" style="display: none;">
                                <th><label class="label"><span>상품 타이틀<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                	<input type="text" name="EVT_VOTE_TITLE" id="EVT_VOTE_TITLE" class="text long" maxlength="50" style="width:60%;"/>
                                </td>
                            </tr>                        
                            <tr>
                                <th><label class="label"><span>상품 안내문구<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                	<input type="text" name="GB_PRD_INFO_TEXT" id="GB_PRD_INFO_TEXT" class="text long" maxlength="50" style="width:60%;"/>
                                </td>
                            </tr>
                            <tr class="_areaVoteHide" style="display: none;">
                                <th><label class="label"><span>기간<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" class="text" id="GB_MST_ST_DT" name="GB_MST_ST_DT" readonly="readonly" data-target-end="#GB_MST_ED_DT"/>
                                     ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" class="text" id="GB_MST_ED_DT" name="GB_MST_ED_DT"  readonly="readonly" data-target-start="#GB_MST_ST_DT"/>
                                    <a href="javascript:fnDateSet('GB_MST_ST_DT', 'GB_MST_ED_DT', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
                                    <a href="javascript:fnDateSet('GB_MST_ST_DT', 'GB_MST_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('GB_MST_ST_DT', 'GB_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('GB_MST_ST_DT', 'GB_MST_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>
                            <tr class="_areaVoteHide" style="display: none;">
                                <th><label class="label"><span>상품명<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                	<input type="text" name="GB_PRD_NAME" id="GB_PRD_NAME" class="text long" maxlength="50" style="width:60%;"/>
                                </td>
                            </tr>                            
                            <tr>
                                <th><label class="label"><span>상품 이미지1<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="file" name="GB_PRD_IMG1" id="GB_PRD_IMG1" class="file"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                </td>
                            </tr>
                            <tr class="_areaVoteHide" style="display: none;">
                                <th><label class="label"><span>상품 이미지2<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="file" name="GB_PRD_IMG2" id="GB_PRD_IMG2" class="file"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                </td>
                            </tr>
                            <tr class="_areaVoteHide" style="display: none;">
                                <th><label class="label"><span>상품 이미지3<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="file" name="GB_PRD_IMG3" id="GB_PRD_IMG3" class="file"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                </td>
                            </tr>
                            <tr class="_areaVoteHide" style="display: none;">
                                <th><label class="label"><span>상품 이미지4<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="file" name="GB_PRD_IMG4" id="GB_PRD_IMG4" class="file"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                </td>
                            </tr>
                            <tr class="_areaVoteHide" style="display: none;">
                                <th><label class="label"><span>상품 이미지5<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="file" name="GB_PRD_IMG5" id="GB_PRD_IMG5" class="file"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>할인혜택</span></label></th>
                                <td>
                                     <ul>
                                     	<li>
		                                     <select id="GB_PRD_SALE_CNT" name="GB_PRD_SALE_CNT" >
		                                        <option value="1">1개</option>
		                                        <option value="2">2개</option>
		                                        <option value="3">3개</option>
		                                     </select>                                     	
                                     	</li>
                                     </ul>
                                     <ul id="productSaleList">
                                     	<li>
	                                        <input type="number" name="GB_PRD_SALE_PP1" id="GB_PRD_SALE_PP1" class="text long" maxlength="50" style="width:10%;"/>명 참여 / 
	                                        <input type="text" name="GB_PRD_SALE_COUPON1" class="text long" maxlength="50" style="width:60%;" data-input-key="1"/>
											<a href="#" class="button button-a xsmall couponSelect" data-input-key="1"><span>쿠폰선택</span></a>
                                     	</li>
                                     	<li style="display: none;">
	                                        <input type="number" name="GB_PRD_SALE_PP2" id="GB_PRD_SALE_PP2" class="text long" maxlength="50" style="width:10%;"/>명 참여 / 
	                                        <input type="text" name="GB_PRD_SALE_COUPON2" class="text long" maxlength="50" style="width:60%;" data-input-key="2"/>
											<a href="#" class="button button-a xsmall couponSelect" data-input-key="1"><span>쿠폰선택</span></a>                                  	
                                     	</li>
	                                    <li style="display: none;">
	                                        <input type="number" name="GB_PRD_SALE_PP3" id="GB_PRD_SALE_PP3" class="text long" maxlength="50" style="width:10%;"/>명 참여 / 
	                                        <input type="text" name="GB_PRD_SALE_COUPON3" class="text long" maxlength="50" style="width:60%;" data-input-key="3"/>
											<a href="#" class="button button-a xsmall couponSelect" data-input-key="1"><span>쿠폰선택</span></a>
                                     	</li>
                                     </ul>                                     

                                </td>
                            </tr>
                            <tr class="_areaVoteHide" style="display: none;">
                                <th><label class="label"><span>공유하기 문구<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                	<input type="text" name="GB_PRD_SHARE_TEXT" id="GB_PRD_SHARE_TEXT" class="text long" maxlength="50" style="width:60%;"/>
                                </td>
                            </tr>
                            <tr class="_areaVoteHide" style="display: none;">
                                <th><label class="label"><span>공동구매 안내이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="file" name="GB_PRD_INFO_IMG" id="GB_PRD_INFO_IMG" class="file"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                </td>
                            </tr>
                            <tr class="_areaVoteShow" style="display: none;">
                                <th><label class="label"><span>이벤트 안내이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="file" name="EVT_VOTE_INFO_IMG" id="EVT_VOTE_INFO_IMG" class="file"/>
                                    <small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
                                    <small class="desc">* 업로드 용량 : 3MB</small>
                                </td>
                            </tr>                            
                        </tbody>
                    </table>
                                        
                    

                    
                    <h3 class="title _areaTag" style="display: none;"><span>태그설정</span></h3>
                    <table cellspacing="0" class="table-row table-a _areaTag" style="display: none;"><!-- table -->
                        <colgroup>
                            <col style="width: 170px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label for="">일반 TAG<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                    <p class="txt_warnning">태그 설정을 위해 '선택' 버튼을 클릭해 주세요.</p>
                                    <div class="tag_cloud_wrap_side">
                                        <div class="tag_cloud_wrap">
                                            <ul class="tag_cloud_list">
                                            </ul>
                                        </div>
                                        <button type="button" class="btn_tag_select">선택</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="">대표 TAG<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                    <select id="representTag" name="TAG_BND_REP_ID" class="select">
                                        <option value="">선택</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <h3 class="title _areaCaution" style="display: none;"><span>유의사항</span></h3>
                    <table cellspacing="0" class="table-row table-a _areaCaution" style="display: none;"><!-- table -->
                        <colgroup>
                            <col style="width: 170px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label for="">PC유의사항 이미지<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                <div id="multiFile6-list">
                                </div>
                                <input type="file" name="file6" id="multiFile6" class="file pcImgFile" data-attach_cnt="1" data-accept=".jpg, .gif, .png" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text"  name="CMN_FLE_ALT_TXT_P3" id="CMN_FLE_ALT_TXT_P3" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트" maxlength="20"/>
                                </p>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="">MOBILE<br/>유의사항 이미지<i class="require"><em>필수입력</em></i></label></th>
                                <td>
                                <div id="multiFile7-list">
                                </div>
                                <input type="file" name="file7" id="multiFile7" class="file mobileImgFile" data-attach_cnt="1" data-accept=".jpg, .gif, .png" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M3" id="CMN_FLE_ALT_TXT_M3" class="text xlarge" placeholder="20자 이내로 입력하세요." maxlength="20"/>
                                </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="#none" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button --> 

            </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<ui:editor objId="#EVT_QUIZ_INFO"/>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<script id="svyTemplate" type="text/x-jquery-tmpl">
<tr id="svyTemplate\${NUM}">
    <td>항목\${NUMA}<input type="hidden" name="EVT_DTL_NO" id="EVT_DTL_NO\${NUM}" value="\${NUMA}"/></td>
    <td class="left">
        <input type="text" name="EVT_DTL_NM" id="EVT_DTL_NM\${NUM}" class="text EVT_DTL_NM" style="width:50%;"/>
        <a href="javascript:rowDelete('\${NUM}')"class="button button-a small"><span>삭제</span></a>
    </td>
</tr>


</script>


<script>
$(function(){
    //초기 당첨자 URL 가림
     
    $("#EVT_MST_POINT_NUM").hide();
    $("#EVT_MST_POINT_TXT").hide();
    $("#svyForm").hide();
    $("#svyImgList").hide();
    
            
    $(document).on("keyup","#EVT_MST_TITLE",function(){
        getStrByte(this,'#byte_title', 50, 2);
    });
    $(document).on("keyup","#CMN_FLE_ALT_TXT_P1",function(){
        getStrByte(this,'#byte_p1', 20, 2);
    });
    $(document).on("keyup","#CMN_FLE_ALT_TXT_P2",function(){
        getStrByte(this,'#byte_p2', 20, 2);
    });
    $(document).on("keyup","#CMN_FLE_ALT_TXT_M1",function(){
        getStrByte(this,'#byte_m1', 20, 2);
    });
    $(document).on("keyup","#CMN_FLE_ALT_TXT_M2",function(){
        getStrByte(this,'#byte_m2', 20, 2);
    });
    
    
    initFn();
    
    /**
    //파일용량, 확장자 체크
    $('#multiFile1').bind('change', function() {
        //alert(this.files[0].size);
        var fileSise1 = this.files[0].size;
        var file1 = $("#multiFile1").val();
        
        var extensionF1 = file1; //파일을 추가한 input 박스의 값
        extensionF1 = extensionF1.slice(extensionF1.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
        
        if(fileSise1 > 1048576){
            alert('파일 용량(1MB)만 등록 가능합니다.');
            $("#multiFile1").val('');
            return;
        }
        
        if(extensionF1 != "jpg" && extensionF1 != "png" &&  extensionF1 != "gif"){ //확장자를 확인합니다.
            alert('파일(jpg, png, gif)만 등록 가능합니다.');
            $("#multiFile1").val('');
            return;
        }               
    });
    
    $('#multiFile2').bind('change', function() {
        //alert(this.files[0].size);
        var fileSise2 = this.files[0].size;
        var file2 = $("#multiFile2").val();
        
        var extensionF2 = file2; //파일을 추가한 input 박스의 값
        extensionF2 = extensionF2.slice(extensionF2.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
        
        if(fileSise2 > 3145728){
            alert('파일 용량(3MB)만 등록 가능합니다.');
            $("#multiFile2").val('');
            return;
        }
        
        if(extensionF2 != "jpg" && extensionF2 != "png" &&  extensionF2 != "gif"){ //확장자를 확인합니다.
            alert('파일(jpg, png, gif)만 등록 가능합니다.');
            $("#multiFile2").val('');
            return;
        }               
    });
    
    $('#multiFile3').bind('change', function() {
        //alert(this.files[0].size);
        var fileSise3 = this.files[0].size;
        var file3 = $("#multiFile3").val();
        
        var extensionF3 = file3; //파일을 추가한 input 박스의 값
        extensionF3 = extensionF3.slice(extensionF3.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
        
        if(fileSise3 > 1048576){
            alert('파일 용량(1MB)만 등록 가능합니다.');
            $("#multiFile3").val('');
            return;
        }
        
        if(extensionF3 != "jpg" && extensionF3 != "png" &&  extensionF3 != "gif"){ //확장자를 확인합니다.
            alert('파일(jpg, png, gif)만 등록 가능합니다.');
            $("#multiFile3").val('');
            return;
        }               
    });
    
    $('#multiFile4').bind('change', function() {
        //alert(this.files[0].size);
        var fileSise4 = this.files[0].size;
        var file4 = $("#multiFile4").val();
        
        var extensionF4 = file4; //파일을 추가한 input 박스의 값
        extensionF4 = extensionF4.slice(extensionF4.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
        
        if(fileSise4 > 3145728){
            alert('파일 용량(3MB)만 등록 가능합니다.');
            $("#multiFile4").val('');
            return;
        }
        
        if(extensionF4 != "jpg" && extensionF4 != "png" &&  extensionF4 != "gif"){ //확장자를 확인합니다.
            alert('파일(jpg, png, gif)만 등록 가능합니다.');
            $("#multiFile4").val('');
            return;
        }               
    });
    */
    
    $('input[name=file], input[name=file2]').on('change', function() {
        var $this = $(this);
    	var fileSise1 = this.files[0].size;
        var file1 = $this.val();
        
        var extensionF1 = file1; //파일을 추가한 input 박스의 값
        extensionF1 = extensionF1.slice(extensionF1.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
        
        if(fileSise1 > 1048576){
            alert('파일 용량(1MB)만 등록 가능합니다!');
            $this.val('');
            return;
        }
        
        if(extensionF1 != "jpg" && extensionF1 != "png" &&  extensionF1 != "gif"){ //확장자를 확인합니다.
            alert('파일(jpg, png, gif)만 등록 가능합니다.');
            $this.val('');
            return;
        }               
    });    
    
    
    $("#EVT_MST_PIT_S").hide();
    $(document).on("click", "#EVT_MST_PIT_GB", function () 
    {
        var gb = $(this).val();
        
        if(gb=="N") 
        {
            $("#EVT_MST_PIT_S").hide();
            $("#EVT_MST_PIT").val('');  
        }
        else
        {
            $("#EVT_MST_PIT_S").show();
        }
    });   
    
    // 이벤트채널 변경시
    $(document).on("click", "#EVT_MST_PC_YN", function () 
    {
        if($(this).is(":checked") == true) 
        {
            $(".pcImgDiv").show();
        }
        else
        {
            $(".pcImgDiv").hide();
        }
    });   
    $(document).on("click", "#EVT_MST_MB_YN", function () 
    {
        if($(this).is(":checked") == true) 
        {
            $(".mobileImgDiv").show();
        }
        else
        {
            $(".mobileImgDiv").hide();
        }
    });
    
  
    $(document).on("click", "#eT1", function () 
    {
        svyHide();
    });
    $(document).on("click", "#eT2", function () 
    {
        svyShow();
    });
    $(document).on("click", "#eT3", function () 
    {
        svyHide();
    });
    $(document).on("click", "#eT4", function () 
    {
        svyHide();
    });

    
    //당첨자 발표일 체크박스
    $(document).on("click","input[name=EVT_MST_WIN_YN]",function()
    {
        if($(this).is(":checked"))
        {
            $("#EVT_MST_WIN_DT").focus();           
        }else
        {
            $("#EVT_MST_WIN_DT").val("");       
        }
    });
    
    //당첨자 발표 캘린더 체크
    $(document).on("click","#EVT_MST_WIN_DT",function()
    {
        $("input[name=EVT_MST_WIN_YN]").prop("checked",true);
    }); 
    
    // 고정 첨부 행 파일 지우기
    $("#delFileData").click(function(e){
        e.preventDefault();
        
        $("#defaultFile").find("input").remove();
        $("#defaultFile").append('<input type="file" name="file3" id="files[0]" class="file" value=""/>');
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventList.do", "target" : "_self", "method" : "post"}).submit();
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
    
        if(($("input:checkbox[id=EVT_MST_PC_YN]").is(":checked") == false) && ($("input:checkbox[id=EVT_MST_MB_YN]").is(":checked") == false))
        {
            alert("[채널] 반드시 선택해 주십시오.");
            return;
        }
        
        if($.trim($("#EVT_MST_ST_DT").val()) == ""){
            alert("이벤트 시작일을 입력해 주십시오.");
            $("#EVT_MST_ST_DT").focus();
            return;
        }
        if($.trim($("#EVT_MST_ST_HH").val()) == ""){
            alert("이벤트 시작 시간을 입력해 주십시오.");
            $("#EVT_MST_ST_HH").focus();
            return;
        }
        if($.trim($("#EVT_MST_ST_MM").val()) == ""){
            alert("이벤트 시작 분을 입력해 주십시오.");
            $("#EVT_MST_ST_MM").focus();
            return;
        }
         
        if($.trim($("#EVT_MST_ED_DT").val()) == ""){
            alert("이벤트 종료일을 입력해 주십시오.");
            $("#EVT_MST_ED_DT").focus();
            return;
        }
        if($.trim($("#EVT_MST_ED_HH").val()) == ""){
            alert("이벤트 종료시간을 입력해 주십시오.");
            $("#EVT_MST_ED_HH").focus();
            return;
        }
        if($.trim($("#EVT_MST_ED_MM").val()) == ""){
            alert("이벤트 종료 분을 입력해 주십시오.");
            $("#EVT_MST_ED_MM").focus();
            return;
        }
        if($.trim($("#EVT_MST_PIT_GB").val()) != "N"){
            if($.trim($("#EVT_MST_PIT").val()) == ""){
                alert("포인트 점수를 입력하세요.");
                $("#EVT_MST_PIT").focus();
                return;
            }
        }
        
        var EVT_MST_ST = $.trim($("#EVT_MST_ST_DT").val())+$.trim($("#EVT_MST_ST_HH").val()) +$.trim($("#EVT_MST_ST_MM").val());
        var EVT_MST_ED = $.trim($("#EVT_MST_ED_DT").val())+$.trim($("#EVT_MST_ED_HH").val()) +$.trim($("#EVT_MST_ED_MM").val());
        
        var today = getToday();
        
        
        if (EVT_MST_ST > EVT_MST_ED)
        {
            alert("이벤트 종료일은 시작일 보다 커야 합니다.");
            $("#EVT_MST_ED_DT").focus();
            return;
        }
         
        if($.trim($("#EVT_MST_ED_DT").val()) < today){
            alert("이벤트 종료일은 현재일자 보다 작을수 없습니다.");
            $("#EVT_MST_ED_DT").focus();
            return;
        }
        var EVT_MST_WIN_DT =$.trim($("#EVT_MST_WIN_DT").val()); 
        if(EVT_MST_WIN_DT !=""){
            if(EVT_MST_ED > EVT_MST_WIN_DT+"000000")
            {
                alert("당첨자 발표일은 종료일 이후여야 합니다.");
                $("#EVT_MST_WIN_DT").focus();
                return;
            }
        }
        
        
        
        if($.trim($("#EVT_MST_TITLE").val()) == ""){
            alert("이벤트명을 입력해 주십시오.");
            $("#EVT_MST_TITLE").focus();
            return;
        }     
        if($.trim($("#EVT_MST_PRE_WIN").val()) == ""){
            alert("예상당첨자를 입력해 주십시오.");
            $("#EVT_MST_PRE_WIN").focus();
            return;
        }     
       
        
            
        //이미지 첨부 체크
        if($("input[name=EVT_MST_PC_YN]:checked").val() == "Y"){//PC
//              var fileLen = $("#multiFile1-list .MultiFile-title").length;
//              var fileLen2 = $("#multiFile2-list .MultiFile-title").length;
                
            var file1 = $("#multiFile1").val();
            var file2 = $("#multiFile2").val();
            
            if(file1 == ""){
                alert("PC 목록 이미지를 등록해 주십시오.");
                return;
            }else if($.trim($("#CMN_FLE_ALT_TXT_P1").val()) == ""){//대체텍스트 체크
                alert("PC 목록 이미지 대체 텍스트를 입력해 주십시오.");
                $("#CMN_FLE_ALT_TXT_P1").focus();
                return;
            }       
            
            if(file2 == ""){
                alert("PC 상세 이미지를 등록해 주십시오.");
                return;
            }else if($.trim($("#CMN_FLE_ALT_TXT_P2").val()) == ""){//대체텍스트 체크
                alert("PC 상세 이미지 대체 텍스트를 입력해 주십시오.");
                $("#CMN_FLE_ALT_TXT_P2").focus();
                return;
            }               
                    
        }
        if($("input[name=EVT_MST_MB_YN]:checked").val() == "Y"){
            var fileLen = $("#multiFile3-list .MultiFile-title").length;
            var fileLen2 = $("#multiFile4-list .MultiFile-title").length;
            
            var file3 = $("#multiFile3").val();
            var file4 = $("#multiFile4").val();
            
            if(file3 == ""){
                alert("MOBILE 목록 이미지를 등록해 주십시오.");
                return;
            }else if($.trim($("#CMN_FLE_ALT_TXT_M1").val()) == ""){//대체텍스트 체크
                alert("MOBILE 목록 이미지 대체 텍스트를 입력해 주십시오.");
                $("#CMN_FLE_ALT_TXT_M1").focus();
                return;
            } 
            if(file4 == ""){
                alert("MOBILE 상세 이미지를 등록해 주십시오.");
                return;
            }else if($.trim($("#CMN_FLE_ALT_TXT_M2").val()) == ""){//대체텍스트 체크
                alert("MOBILE 상세 이미지 대체 텍스트를 입력해 주십시오.");
                $("#CMN_FLE_ALT_TXT_M2").focus();
                return;
            }               
            
        }   
        
        var EVT_MST_TYPE = $("input[name=EVT_MST_TYPE]:checked").val();
        if(EVT_MST_TYPE == "713")
        {
            var gb  =$("input[name=EVT_MST_SVY_TYPE]:checked").val();
            if(gb=="I")
            {
                var fileSvy = $("#fileSvy1").val();
                
                if(fileSvy =="")
                {
                    alert("설문이미지를 입력해 주십시오.");
                    $("#fileSvy1").focus();
                    return;
                }
            }
            else
            {
                if($.trim($("#EVT_DTL_NM0").val()) == ""){
                    alert("설문항목을 입력해 주십시오.");
                    $("#EVT_DTL_NM0").focus();
                    return;
                }
            }
            
        }
        if(EVT_MST_TYPE != "${Code.EVENT_MASTER_TYPE_NORMAL}")
        {
            if($("input[name='EVT_MST_WIN_YN']:checked").val() != "Y")
            {
                alert("당첨자 발표일을 입력해 주십시오.");
                $("input[name='EVT_MST_WIN_YN']").prop("checked", true);
                $("#EVT_MST_WIN_DT").focus();
                return;
            }
        }
     
        if (confirm("저장 하시겠습니까?")) 
        {
            $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/eventRegist.do", "target" : "_self", "method" : "post"}).submit();
        }   
      
    });
    
    $(document).on("click", "input[name=EVT_MST_SVY_TYPE]", function () 
    {
        var gb  =$("input[name=EVT_MST_SVY_TYPE]:checked").val();
                
        if(gb=="T") 
        {
            $("#svyImgList").hide();
            $("#svyList").show();
        }
        else
        {
            $("#svyList").hide();
            $("#svyImgList").show();
        }
    });   
    
    
    // 파일 행 추가 클릭 이벤트
    $("#rowAddFile").click(function(){
        //var fileNum = $("#svyImgList tr").children().length;
        //var html = "";
        //fileNum = fileNum /2 + 1;
        
        var $svyImgList = $("#svyImgList");
        var addLength = 1;
        var arrayObj = new Array();
        var $obj = $(".EVT_DTL_NO_F");
        var len = $obj.length;
        var lenM = parseInt(len);
            
        var fileNum = $("#MAX_NUM_FILE").val();
        if(fileNum == "1")
        {
            $("#MAX_NUM_FILE").val(lenM);
            fileNum = lenM;
        }
        
        fileNum = parseInt(fileNum) + 1;
        
        $("#MAX_NUM_FILE").val(fileNum);
        
        html ='<tr id="fileRow'+fileNum+'"><td>항목'+ fileNum +'<input type="hidden" name="EVT_DTL_NO_F" id="EVT_DTL_NO'+ fileNum +'" value="'+ fileNum +'"/></td>';
        html += '<td class="left"><input type="file" class="file EVT_DTL_NO_F" name="fileSvy'+ fileNum +'" id="fileSvy['+ fileNum +']"  style="width:50%;"/> <a href="javascript:rowDelFile('+ fileNum +')" class="button button-a small"><span>삭제</span></a></td></tr>';
        $("#svyImgList").append(html);
        // 고정 첨부파일 행 파일지우기 비활성화
        $("#delSvyFile").hide();
        
    });
    
    // 고정 첨부 행 파일 지우기
    $("#delSvyFile").click(function(e){
        e.preventDefault();   
        
        //$("#fileSvy[0]").empty();
        $("#defaultSvyFile").empty();
        $("#defaultSvyFile").append('<input type="file" name="fileSvy" id="fileSvy[0]" class="file" value="" style="width:50%;"/>');
        
    });
     
    //delSvyFile
    
    //--- 이하 최유정 ----
    // 이벤트 형태 선택시
    $('input[name=EVT_MST_TYPE]').on('change', function(){
    	var evntKind 	= $('input[name=EVT_MST_TYPE]:checked').val();
    	sessionStorage.setItem('eventType', evntKind);
    	location.reload();
    	//radioChange();
    })
    
    // 상품 수량 선택박스
    $('#productCount').on('change', function(){
    	productCountChange();
    })
    
    $('input[name=EVT_WIN_PBB]').on('change', function(){
    	if($('#EVT_WIN_PBB_B').is(':checked')){
    		$('#coupon2List').show();
    	} else {
    		$('#coupon2List').hide();
    	}
    });
    
    $('input[name=EVT_ROULETTE_PBB]').on('change', function(){
    	if($('#EVT_ROULETTE_B').is(':checked')){
    		$('#coupon3List').show();
    	} else {
    		$('#coupon3List').hide();
    	}
    });    
    
    // 룰렛 응모상품 선택
    $('input[name=EVT_ROUL_KIND]').on('change', function(){
    	console.log('======== : '+$('input[name=EVT_ROUL_KIND]:checked').val())
    	rouletteProductChange();
    });
    
    // 룰렛
    $('#productRouletteCount').on('change', function(){    	
    	rouletteCountChange();
    });
    
	// 출석체크 달력 선택시
	var allDayYearPrev
	var allDayMonthPrev
	$('#allDayYear, #allDayMonth').on('focus', function(){
		allDayYearPrev = $('#allDayYear').val();
		allDayMonthPrev = $('#allDayMonth').val();
	}).on('change', function(){
		if (confirm("년,월을 변경하시면 응모상품이 모두 초기화 됩니다. \n진행하시겠습니까?")) {
        	allDayChange();
        } else {
    		//console.log(allDayYearPrev+'|'+allDayMonthPrev);
        	$('#allDayYear').val(allDayYearPrev);
    		$('#allDayMonth').val(allDayMonthPrev);
        }
	});
	
    // 할인혜택 수량 선택박스
    $('#GB_PRD_SALE_CNT').on('change', function(){
    	productSaleCountChange();
    })	
	
	
});


//================= YouJung start ============================================

function initFn(){
	//$('input[name=EVT_MST_TYPE][value=3173]').prop('checked', true);
	
	var evntType = sessionStorage.getItem('eventType')
	if(evntType == undefined){
		evntType = '3173';
	}
	$('input[name=EVT_MST_TYPE][value='+evntType+']').prop('checked', true);
	
	radioChange();
	
	allDayInit();
	allDayChange();
}

function radioChange(){
    
	var evntKind 	= $('input[name=EVT_MST_TYPE]:checked').val();
	var evntChnlPC 	= $('input[name=EVT_MST_PC_YN]:checked').val();
	var evntChnlMb 	= $('input[name=EVT_MST_MB_YN]:checked').val();
	
	switch (evntKind) {
	    case '3173':							// 이벤트형태 : 안내

	    	$('._areaPredictWiner').hide();		// 예상당첨자
	    	$('._areaWinnerDate').hide();		// 당첨자발표일
	    	
	    	$('._areaPcTopImg').hide();			// PC 상단 이미지
	    	$('._areaPcDetailImg').show();		// PC 상세 이미지
	    	$('._areaPcBgImg').hide();	    	// PC 배경 이미지
	    	$('._areaMobileTopImg').hide();		// MB 상단 이미지
	    	$('._areaMobileDetailImg').show();	// MB 상세 이미지
	    	$('._areaMobileBgImg').hide();	    // MB 배경 이미지	    	
	    	$('._areaPcRoulette').hide();		// PC 룰렛
	    	$('._areaMobileRoulette').hide();	// MB 룰렛

	    	$('._areaLucky').hide();			// 상품탭
	    	$('._areaRandom').hide();			// 랜덤
	    	$('._areaProductRoulette').hide();	// 룰렛
	    	$('._areaAllDay').hide();			// 출석
	    	$('._areaGroupBuying').hide();		// 공동구매
	    	$('._areaQuiz').hide();				// 퀴즈

	    	$('._areaTag').show();				// 태그탭
	    	$('._areaCaution').hide(); 			// 유의사항
	        break;
	    case '3174':							// 이벤트형태 : 럭키드로우
	    	$('._areaPredictWiner').show();		// 예상당첨자
	    	$('._areaWinnerDate').show();		// 당첨자발표일
	    
	    	$('._areaPcTopImg').hide();			// PC 상단 이미지
	    	$('._areaPcDetailImg').hide();		// PC 상세 이미지
	    	$('._areaPcBgImg').show();	    	// PC 배경 이미지
	    	$('._areaMobileTopImg').hide();		// MB 상단 이미지
	    	$('._areaMobileDetailImg').hide();	// MB 상세 이미지
	    	$('._areaMobileBgImg').show();	    // MB 배경 이미지	    	
	    	$('._areaPcRoulette').hide();		// PC 룰렛
	    	$('._areaMobileRoulette').hide();	// MB 룰렛

	    	$('._areaLucky').show();			// 상품탭
	    	$('._areaRandom').hide();			// 랜덤
	    	$('._areaProductRoulette').hide();	// 룰렛
	    	$('._areaQuiz').hide();				// 퀴즈
	    	$('._areaAllDay').hide();			// 출석
	    	$('._areaGroupBuying').hide();		// 공동구매
	    	

	    	$('._areaTag').show();				// 태그탭
	    	$('._areaCaution').show(); 			// 유의사항
	        break;
	    case '3175':							// 이벤트형태 : 랜덤
	    	$('._areaPredictWiner').show();		// 예상당첨자
	    	$('._areaWinnerDate').hide();		// 당첨자발표일
	    	
	    	$('._areaPcTopImg').hide();			// PC 상단 이미지
	    	$('._areaPcDetailImg').show();		// PC 상세 이미지
	    	$('._areaPcBgImg').hide();	    	// PC 배경 이미지
	    	$('._areaMobileTopImg').hide();		// MB 상단 이미지
	    	$('._areaMobileDetailImg').show();	// MB 상세 이미지
	    	$('._areaMobileBgImg').hide();	    // MB 배경 이미지	    	
	    	$('._areaPcRoulette').hide();		// PC 룰렛
	    	$('._areaMobileRoulette').hide();	// MB 룰렛

	    	$('._areaLucky').hide();			// 상품탭
	    	$('._areaRandom').show();			// 랜덤
	    	$('._areaProductRoulette').hide();	// 룰렛
	    	$('._areaQuiz').hide();				// 퀴즈
	    	$('._areaAllDay').hide();			// 출석
	    	$('._areaGroupBuying').hide();		// 공동구매
	    	

	    	$('._areaTag').show();				// 태그탭
	    	$('._areaCaution').show(); 			// 유의사항
	        break;
	    case '3176':							// 이벤트형태 : 룰렛
	    	$('._areaPredictWiner').hide();		// 예상당첨자
	    	$('._areaWinnerDate').hide();		// 당첨자발표일
	    	
	    	$('._areaPcTopImg').hide();			// PC 상단 이미지
	    	$('._areaPcDetailImg').hide();		// PC 상세 이미지
	    	$('._areaPcBgImg').hide();	    	// PC 배경 이미지
	    	$('._areaMobileTopImg').hide();		// MB 상단 이미지
	    	$('._areaMobileDetailImg').hide();	// MB 상세 이미지
	    	$('._areaMobileBgImg').hide();	    // MB 배경 이미지	    	
	    	$('._areaPcRoulette').show();		// PC 룰렛
	    	$('._areaMobileRoulette').show();	// MB 룰렛

	    	$('._areaLucky').hide();			// 상품탭
	    	$('._areaRandom').hide();			// 랜덤
	    	$('._areaProductRoulette').show();	// 룰렛
	    	$('._areaQuiz').hide();				// 퀴즈
	    	$('._areaAllDay').hide();			// 출석
	    	$('._areaGroupBuying').hide();		// 공동구매
	    	

	    	$('._areaTag').show();				// 태그탭
	    	$('._areaCaution').show(); 			// 유의사항
	        break;
	    case '3177':							// 이벤트형태 : 퀴즈
	    	$('._areaPredictWiner').show();		// 예상당첨자
	    	$('._areaWinnerDate').hide();		// 당첨자발표일
	    	
	    	$('._areaPcTopImg').show();			// PC 상단 이미지
	    	$('._areaPcDetailImg').hide();		// PC 상세 이미지
	    	$('._areaPcBgImg').hide();	    	// PC 배경 이미지
	    	$('._areaMobileTopImg').show();		// MB 상단 이미지
	    	$('._areaMobileDetailImg').hide();	// MB 상세 이미지
	    	$('._areaMobileBgImg').hide();	    // MB 배경 이미지	    	
	    	$('._areaPcRoulette').hide();		// PC 룰렛
	    	$('._areaMobileRoulette').hide();	// MB 룰렛

	    	$('._areaLucky').hide();			// 상품탭
	    	$('._areaRandom').hide();			// 랜덤
	    	$('._areaProductRoulette').show();	// 룰렛
	    	$('._areaQuiz').show();				// 퀴즈
	    	$('._areaAllDay').hide();			// 출석
	    	$('._areaGroupBuying').hide();		// 공동구매
	    	

	    	$('._areaTag').show();				// 태그탭
	    	$('._areaCaution').show(); 			// 유의사항
	        break;
	    case '3178':							// 이벤트형태 : 출석체크
	    	$('._areaPredictWiner').hide();		// 예상당첨자
	    	$('._areaWinnerDate').hide();		// 당첨자발표일
	    	
	    	$('._areaPcTopImg').hide();			// PC 상단 이미지
	    	$('._areaPcDetailImg').hide();		// PC 상세 이미지
	    	$('._areaPcBgImg').show();	    	// PC 배경 이미지
	    	$('._areaMobileTopImg').hide();		// MB 상단 이미지
	    	$('._areaMobileDetailImg').hide();	// MB 상세 이미지
	    	$('._areaMobileBgImg').show();	    // MB 배경 이미지	    	
	    	$('._areaPcRoulette').hide();		// PC 룰렛
	    	$('._areaMobileRoulette').hide();	// MB 룰렛

	    	$('._areaLucky').hide();			// 상품탭
	    	$('._areaRandom').hide();			// 랜덤
	    	$('._areaProductRoulette').hide();	// 룰렛
	    	$('._areaQuiz').hide();				// 퀴즈
	    	$('._areaAllDay').show();			// 출석
	    	$('._areaGroupBuying').hide();		// 공동구매

	    	$('._areaTag').show();				// 태그탭
	    	$('._areaCaution').show(); 			// 유의사항
	        break;
	    case '3179':							// 이벤트형태 : 공동구매
	    	$('._areaPredictWiner').hide();		// 예상당첨자
	    	$('._areaWinnerDate').hide();		// 당첨자발표일
	    	
	    	$('._areaPcTopImg').show();			// PC 상단 이미지
	    	$('._areaPcDetailImg').hide();		// PC 상세 이미지
	    	$('._areaPcBgImg').hide();	    	// PC 배경 이미지
	    	$('._areaMobileTopImg').show();		// MB 상단 이미지
	    	$('._areaMobileDetailImg').hide();	// MB 상세 이미지
	    	$('._areaMobileBgImg').hide();	    // MB 배경 이미지	    	
	    	$('._areaPcRoulette').hide();		// PC 룰렛
	    	$('._areaMobileRoulette').hide();	// MB 룰렛

	    	$('._areaLucky').hide();			// 상품탭
	    	$('._areaRandom').hide();			// 랜덤
	    	$('._areaProductRoulette').hide();	// 룰렛
	    	$('._areaQuiz').hide();				// 퀴즈
	    	$('._areaAllDay').hide();			// 출석
	    	$('._areaGroupBuying').show();		// 공동구매
	    	
	    	$('._areaVoteShow').hide();			// 투표
	    	$('._areaVoteHide').show();			// 투표

	    	$('._areaTag').show();				// 태그탭
	    	$('._areaCaution').show(); 			// 유의사항
	        break;
	    case '3180':							// 이벤트형태 : 투표
	    	$('._areaPredictWiner').hide();		// 예상당첨자
	    	$('._areaWinnerDate').hide();		// 당첨자발표일
	    	
	    	$('._areaPcTopImg').show();			// PC 상단 이미지
	    	$('._areaPcDetailImg').hide();		// PC 상세 이미지
	    	$('._areaPcBgImg').hide();	    	// PC 배경 이미지
	    	$('._areaMobileTopImg').show();		// MB 상단 이미지
	    	$('._areaMobileDetailImg').hide();	// MB 상세 이미지
	    	$('._areaMobileBgImg').hide();	    // MB 배경 이미지	    	
	    	$('._areaPcRoulette').hide();		// PC 룰렛
	    	$('._areaMobileRoulette').hide();	// MB 룰렛

	    	$('._areaLucky').hide();			// 상품탭
	    	$('._areaRandom').hide();			// 랜덤
	    	$('._areaProductRoulette').hide();	// 룰렛
	    	$('._areaQuiz').hide();				// 퀴즈
	    	$('._areaAllDay').hide();			// 출석
	    	$('._areaGroupBuying').show();		// 공동구매
	    	
	    	$('._areaVoteShow').show();			// 투표
	    	$('._areaVoteHide').hide();			// 투표
	    	
	    	$('._areaTag').show();				// 태그탭
	    	$('._areaCaution').show(); 			// 유의사항
	        break;        
	    default:
	        // done
	}
}

function productCountChange(){
	var showProduct = Number($('#productCount').val());
	$('#productImgList').find('li').hide();
	for(var i=0; i < showProduct; i++){
		$('#productImgList').find('li:eq('+i+')').show();
	};
}

function productSaleCountChange(){
	var showProduct = Number($('#GB_PRD_SALE_CNT').val());
	$('#productSaleList').find('li').hide();
	for(var i=0; i < showProduct; i++){
		$('#productSaleList').find('li:eq('+i+')').show();
	};
}

function couponAdd(){
    var inputKey = $('input[name=COUPON_NAME1]:last').attr('data-input-key');
    if(inputKey == undefined){
    	inputKey = 0;
    } else {
    	inputKey++;
    }
	var coupon1Html = '';
	coupon1Html += '<li>';
	coupon1Html += '	<input type="text" name="COUPON_NAME1" class="text long" maxlength="50" style="width:60%;" data-input-key="'+inputKey+'"/>';
	coupon1Html += '	<a href="#" class="button button-a xsmall couponSelect" data-input-key="'+inputKey+'"><span>쿠폰선택</span></a>';
	coupon1Html += '	<button type="button" class="btn_row_minus couponDel" data-input-key="'+inputKey+'">-</button>';
	coupon1Html += '</li>';
	$('#coupon1List').append(coupon1Html);
	
	var coupon2Html = '';
	coupon2Html += '<li>';
	coupon2Html += '	<input type="text" name="COUPON_NAME2" class="text long" maxlength="50" style="width:60%;" data-input-key="'+inputKey+'"/>';
	coupon2Html += '	<input type="number" name="COUPON_PERCENT" class="text long" maxlength="50" style="width:10%;" data-input-key="'+inputKey+'"/> %';
	coupon2Html += '</li>';
	$('#coupon2List').append(coupon2Html);
	
	
    $('.couponDel').off().on('click', function(e){
    	e.preventDefault();
    	var inputKey = $(this).attr('data-input-key')
    	//$(this).parent().remove();
    	
    	$('#coupon1List, #coupon2List').find('[data-input-key='+inputKey+']').parent().remove();
    })
    
    $('.couponSelect').off().on('click', function(e){
    	
    	alert('searchCouponPopup 만들어 주세요~~ 임시로 상품선택 팝업 연결함')
    	
    	e.preventDefault();
    	var curId = $(this).attr('data-input-key');
    	popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do?caller="+curId, "900", "500", "yes");
    	
    	// 팝업 닫을때 꼭 호출해야 함수
		//window.opener.fnResultCoupon(params,caller);   	
		//self.close();
    })
}

function fnResultCoupon(params, caller) {
	alert('쿠폰 팝업에서 선택 후 콜백 함수'+caller)
	
	// 아래와 같이 콜백함수 구현해야함
	$('input[name=COUPON_NAME1][data-input-key='+caller+']').val(params)
	$('input[name=COUPON_NAME2][data-input-key='+caller+']').val(params)
}

function rouletteProductChange(){
	if($('#productRouletteList').find('li').length > 0){
        if (confirm("응모 상품을 변경하시면 등록된 상품이 초기화 됩니다.\n 진행하시겠습니까?")) 
        {
            $('#productRouletteCount').val('0');
        	$('#productRouletteList').empty();
        	$('#coupon3List').empty();
        }
	}
}

function rouletteCountChange(){
	if($('#productRouletteList').find('li').length > 0){
	    if (confirm("상품수량을 변경하시면 등록된 상품이 초기화 됩니다.\n 진행하시겠습니까?")){
	    	rouletteReset();
	    }		
	} else {
		rouletteReset();
	}

}

function rouletteReset(){
	$('#productRouletteList').empty();
	$('#coupon3List').empty();
	
	var rouletteVal = $('#productRouletteCount').val();
	//var roulettCount = $('#productRouletteList').find('li').length
	
	var rouletteHtml = '';
	rouletteHtml += '<li>';
	rouletteHtml += '	<select name="COUPON_ROULETTE" data-input-key="" class="KIND_CP" style="display: none;">';
	rouletteHtml += '		<option value="" selected>선택</option>';
	rouletteHtml += '		<option value="C">쿠폰</option>';
	rouletteHtml += '		<option value="P">E-포인트</option>';
	rouletteHtml += '	</select>';
	rouletteHtml += '	<input type="text" name="COUPON_NAME3" class="text long KIND_C" maxlength="50" style="width:60%;" data-input-key="" style="display: none;"/>';
	rouletteHtml += '	<a href="#" class="button button-a xsmall couponSelect KIND_C" data-input-key="" style="display: none;"><span>쿠폰선택</span></a>';
	//rouletteHtml += '	<button type="button" class="btn_row_minus couponDel KIND_C" data-input-key="" style="display: none;">-</button>';
	rouletteHtml += '	<input type="number" name="COUPON_POINT" class="text long KIND_P" maxlength="50" style="width:20%;" data-input-key="" style="display: none;"/><span class="KIND_P" data-input-key="" style="display: none;">E-포인트</span>';
	rouletteHtml += '</li>';
	
	var coupon3Html = '';
	coupon3Html += '<li>';
	coupon3Html += '	<input type="number" name="COUPON_NAME4" class="text long" maxlength="50" style="width:60%;" data-input-key=""/>';
	coupon3Html += '	<input type="number" name="COUPON_PERCENT2" class="text long" maxlength="50" style="width:10%;" data-input-key=""/> %';
	coupon3Html += '</li>';

	for(var i=0; i < rouletteVal; i++){
		$('#productRouletteList').append(rouletteHtml)
		$('#coupon3List').append(coupon3Html);
	}
	
	for(var i=0; i < rouletteVal; i++){
		$('#productRouletteList').find('li:eq('+i+')').find('[data-input-key]').attr('data-input-key', i);
		$('#coupon3List').find('li:eq('+i+')').find('[data-input-key]').attr('data-input-key', i);
	}
	
	var rouletteProductKind = $('input[name=EVT_ROUL_KIND]:checked').val();
	if(rouletteProductKind == 'C'){
		$('#productRouletteList').find('.KIND_C').show();
		$('#productRouletteList').find('.KIND_P').hide();
		$('#productRouletteList').find('.KIND_CP').hide();
	} else if(rouletteProductKind == 'P'){
		$('#productRouletteList').find('.KIND_C').hide();
		$('#productRouletteList').find('.KIND_P').show();
		$('#productRouletteList').find('.KIND_CP').hide();		
	} else if(rouletteProductKind == 'CP'){
		$('#productRouletteList').find('.KIND_C').hide();
		$('#productRouletteList').find('.KIND_P').hide();
		$('#productRouletteList').find('.KIND_CP').show();
	}
	
    $('select[name=COUPON_ROULETTE]').off().on('change', function(){
    	var $this = $(this);
    	var thisKey = $this.attr('data-input-key');
    	
    	console.log('thisKey ==== : '+thisKey)
    	
    	if($this.val() == ''){
    		$('.KIND_C[data-input-key='+thisKey+']',$('#productRouletteList')).hide();
    		$('.KIND_P[data-input-key='+thisKey+']',$('#productRouletteList')).hide();
    	} else if($this.val() == 'C'){
    		$('.KIND_C[data-input-key='+thisKey+']',$('#productRouletteList')).show();
    		$('.KIND_P[data-input-key='+thisKey+']',$('#productRouletteList')).hide();
    	} else if($this.val() == 'P'){
    		$('.KIND_C[data-input-key='+thisKey+']',$('#productRouletteList')).hide();
    		$('.KIND_P[data-input-key='+thisKey+']',$('#productRouletteList')).show();
    	}
    })
    
    $('.couponSelect').off().on('click', function(e){
    	
    	alert('searchCouponPopup 만들어 주세요~~ 임시로 상품선택 팝업 연결함')
    	
    	e.preventDefault();
    	var curId = $(this).attr('data-input-key');
    	popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do?caller="+curId, "900", "500", "yes");
    	
    	// 팝업 닫을때 꼭 호출해야 함수
		//window.opener.fnResultCoupon(params,caller);   	
		//self.close();
    })
    
    $('input[name=COUPON_POINT]').on('keyup', function(){
    	var $this = $(this);
    	var thisKey = $this.attr('data-input-key');
    	
    	$('input[name=COUPON_NAME4][data-input-key='+thisKey+']').val($this.val());
    })
}

function allDayInit(){
	var nowDate 	= new Date();
	var nowYear 	= nowDate.getFullYear();
	var nowMonth 	= nowDate.getMonth();
	
	$('#allDayYear').val(nowYear);
	$('#allDayMonth').val(nowMonth);
}

function allDayChange(){
	$('#allDayList').empty();
	var newDate = new Date(Number($('#allDayYear').val()), Number($('#allDayMonth').val())+1, 0);
	var newDays = newDate.getDate();

	for(var i=0; i<newDays; i++){
		var allDayListHtml = '';
		var days = i+1;
		if(days < 10){
			days = '0'+days
		}
		allDayListHtml += '<li>';
		allDayListHtml += ' '+days+'일 <input type="text" name="EVT_ALLDAY_COUPON" class="text long" maxlength="50" style="width:60%;">';
		allDayListHtml += '<a href="#" class="button button-a xsmall couponSelect"><span>쿠폰선택</span></a> ';
		if(i==0){
			allDayListHtml += '<a href="#" class="button button-a xsmall couponSelect"><span>일괄적용</span></a>';	
		}
		allDayListHtml += '</li>';
		$('#allDayList').append(allDayListHtml);
	}
}

//================= YouJung end ============================================


function svyHide()
{
    $("#svyForm").hide();
    
}
function svyShow()
{
    $("#svyForm").show();
}


function rowAdd()
{
    
    var $svyList = $("#svyList");
    var addLength = 1;
    var arrayObj = new Array();
    var $obj = $(".EVT_DTL_NM");
    var len = $obj.length;
    var lenM = parseInt(len) - 1 ;
        
    var maxnum = $("#MAX_NUM").val();
    if(maxnum == "0")
    {
        $("#MAX_NUM").val(lenM);
        maxnum = lenM;
    }
        
    for(var i = 0 ; i < addLength ; i++)
    {
        var obj = new Object();
        obj.NUM = parseInt(maxnum) + 1 + i;// productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
        obj.NUMA = parseInt(maxnum) + 2 + i;
        $("#MAX_NUM").val(parseInt(maxnum) + 1 + i);
        arrayObj.push(obj);    
    }
    
    $("#svyTemplate").tmpl(arrayObj).appendTo($svyList);
}
function rowDelete(rnum)
{   
//  $("#MAX_NUM").val("0");
//  var maxnum = $("#MAX_NUM").val();
//  if(parseInt(maxnum) > 0)
//  {
//      $("#MAX_NUM").val(parseInt(maxnum) - 1);
//  }

    if($("#MAX_NUM").val() == parseInt(rnum))
    {
        var temp = $("#MAX_NUM").val();
        temp = parseInt(temp) - 1;
        $("#MAX_NUM").val(temp);
    }
    
    $("#svyTemplate"+rnum).remove();
    var $obj = $(".EVT_DTL_NM");
    var len = $obj.length;
    if(len==1)$("#MAX_NUM").val("0");
    
     
}

//현재 행 삭제
function rowDelFile(row)
{
    $("#fileRow"+row).remove();
    
    if($("#MAX_NUM_FILE").val() == row)
    {
        var temp = $("#MAX_NUM_FILE").val();
        temp = parseInt(temp) - 1;
        $("#MAX_NUM_FILE").val(temp);
    }
    
    // 고정 첨부파일 행 파일지우기 활성화
    if($(".EVT_DTL_NO_F").length == 1)
    {
        $("#MAX_NUM_FILE").val("1");
        $("#delSvyFile").show();

    }
}
getToday = function ()
{
    var dateObj = new Date();
    var year = dateObj.getFullYear();
    var month = dateObj.getMonth()+1;
    if(month < 10)month = "0"+month;
    var day = dateObj.getDate();
    if(day < 10)day = "0"+day;
    var today = year +"-"+ month +"-"+ day;
    return today;
};

//태그 선택 버튼 클릭 이벤트
$(document).on("click", ".btn_tag_select",function() {
popup("<c:out value="${serverDomain}" />/am/tag/searchTagGroupPopup.do","900", "500", "yes");
});

//태그 선택 callbackFn
fnResultTag = function(params) {
$(".tag_cloud_list").children().remove()
$("#representTag").find("option").remove();
for (var i = 0; i < params.length; i++) {
    $(".tag_cloud_list").append('<li class="sel_tag_list txt" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'">' + params[i].value + '<button type="button" class="btn_del">X</button><input type="hidden" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'"/></li>').parents('.tag_cloud_wrap_side').siblings('.txt_warnning').hide();
    $("#representTag").append('<option value="' + params[i].TAG_MST_ID + '"name="'+ params[i].TAG_MST_ID +'">'+ params[i].value + '</option>');
}
}

//태그 삭제 이벤트
$(document).on("click", ".btn_del", function() {
  var tagLangth = $('.tag_cloud_list > li').length;
  if (tagLangth <= 1) {
      $('.tag_cloud_wrap_side').siblings('.txt_warnning').show();
      $("#representTag").append('<option value="선택" selected>선택</option>');
  }
  var origin = $(this).parent();
  $('.tag_cloud_list li').each(function(index, item) {
      if ($(this).attr('value') == origin.attr('value')) {
          $(this).remove();
          $("#representTag option:eq(" + index + ")").remove();
          return false;
      }
  })
});
//-->
</script>

</body>
</html>
