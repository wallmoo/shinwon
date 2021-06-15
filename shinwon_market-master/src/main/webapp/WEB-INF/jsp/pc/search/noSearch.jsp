<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<!-- Content -->
<div id="container">
    <div id="content" class="content">
        <!-- Title -->
        <div class="pg_tit_wrap">
            <h2 class="pg_tit">검색</h2>
            <p class="search_context">'<span id="search_txt_label" class="co_pink">___</span>'에 대한 검색 결과 총 <strong id="search_result_totcnt">0</strong>개</p>
        </div>

		<input id="search_color" type="hidden" value="${commandMap.color}"/>
		<input id="search_cat01" type="hidden" value="${commandMap.cat01}"/>
		<input id="search_cat02" type="hidden" value="${commandMap.cat02}"/>
		<input id="search_height" type="hidden" value="${commandMap.height}"/>
		<input id="search_weight" type="hidden" value="${commandMap.weight}"/>
		<input id="search_gender_woman" type="hidden" value="${commandMap.gender_woman}"/>
		<input id="search_gender_man" type="hidden" value="${commandMap.gender_man}"/>
		<input id="search_search_txt" type="hidden" value="${commandMap.search_txt}"/>
		
		
        <div class="sub_content product">
            <div class="inquiry_date_wrap clearboth">
                <div class="inq_con">
                    <div class="gender_inq">
                        <span class="inline">
                                <input type="checkbox" id="gender_woman" name="genter_select" class="inp_radio" <c:if test="${commandMap.gender_woman eq 'F'}">checked</c:if>>
                                <label for="gender_woman" class="label">
                                    <em><i class="lato bold">여성</i></em>
                                </label>
                            </span>
                            <span class="inline">
                                <input type="checkbox" id="gender_man" name="genter_select" class="inp_radio" <c:if test="${commandMap.gender_man eq 'M'}">checked</c:if>>
                                <label for="gender_man" class="label">
                                    <em><i class="lato bold">남성</i></em>
                                </label>
                            </span>
                    </div>
                    <div class="detail_inq">
                        <span class="inline">
                            <input type="text" id="height" class="inp_txt" title="키 입력" value="${commandMap.height}">
                            <label for="cm_txt">cm</label>
                        </span>
                        <span class="inline">
                            <input type="text" id="weight" class="inp_txt" title="몸무게 입력" value="${commandMap.weight}">
                            <label for="kg_txt">kg</label>
                        </span>
                        <span class="inline">
                            <span class="select gender_select">
                                <select id="cat01">
                                </select>
                            </span>
                        </span>
                        <span class="inline">
                            <span class="select goods_select">
                                <select id="cat02">
                                </select>
                            </span>
                        </span>
                        <span class="inline">
                            <span class="select color_select">
                            
								<div class="fbx">
								
									<a id="color_a" href="#n" class="lk color total" data-id="${commandMap.color}" ${commandMap.color_style}>${commandMap.color_name}</a>
									<ul class="option_list">
										<li><button type="button" class="total" data-value="">전체</button></li>
                                 		
                                 		<c:forEach var="colorItemRow" items="${colorList}" varStatus="i">
                                 			<li><button type="button" data-value="${colorItemRow.CMN_COM_IDX }" style="background: ${colorItemRow.CMN_COM_ETC2 };">${colorItemRow.CMN_COM_NM }</button></li>
                                     	</c:forEach>
                                     	
									</ul>
								</div>
											
                            </span>

                        </span>
                    </div>
                    <div class="search_inq">
                        <span class="inline">
                            <input type="text" id="search_txt" class="inp_txt" title="검색어 입력" value="${commandMap.search_txt}">
                        </span>
                        <button id="search_submit" type="button" class="btn inp_search">
                            <em class="blind">검색하기</em>
                        </button>
                        
                        <input type="checkbox" id="re_serach_chk">
                        <label for="re_serach_chk"><span class="icon"></span>결과내 재검색
                        </label>
                    </div>
                </div>
            </div>
            
            <div class="no_result_con">
                <div class="no_result">
                    <img src="../../images/ico/bg_funding_null.png" alt="">
                    <p class="no_result_txt1">'<strong>검색결과</strong>가 없습니다.'</p>
                    <p class="no_result_txt2">검색어 또는 검색 조건을 다시 설정해 주세요.</p>
                </div>
            </div>
			
			<div class="search_product search_result">
	            <div class="category_tab">
	                <div class="product">
	                    <div class="tit-area">
	                        <h3 class="tits2">#겨울이 오면</h3>
	                    </div>
	                    <div class="txtab_wrap">
	                        <div class="tab_cont">
	                            <!-- .new_goods_wrap -->
	                            <div class="new_goods_wrap mt55">
	                                    <ul class="new_goods_list new_goods_list3 clearboth">
	                                            <li>
	                                                    <span class="flag_video">video</span>
	                                                    <a href="#">
	                                                            <div class="img_thum_wrap">
	                                                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem01.jpg);"></div>
	                                                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem01_over.jpg);"></div>
	                                                                    <ul class="color_list">
	                                                                            <li><span style="background:#273b38;">color 01</span></li>
	                                                                            <li><span style="background:#c7673e;">color 02</span></li>
	                                                                            <li><span style="background:#6686ad;">color 03</span></li>
	                                                                    </ul>
	                                                            </div>
	                                                            <div class="sort_tag_area clearboth">
	                                                                    <span class="sort">SIEG</span>
	                                                                    <span class="tag">#신상품</span>
	                                                            </div>
	                                                            <p class="goods_title">한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !한정판매, 핫 템 !</p>
	                                                            <!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
	                                                            <div class="goods_cost_info">
	                                                                    <span class="dc_before_cost">￦88,000</span>
	                                                                    <strong class="clearboth">
	                                                                            <span class="goods_cost">￦44,000</span>
	                                                                            <em class="dc_percent">50%</em>
	                                                                    </strong>
	                                                            </div>
	                                                            <!-- <div class="per_bar_wrap">
	                                                                    <p class="time">14:21:21 남음 <span>60%</span></p>
	                                                                    <div class="per_bar">
	                                                                            <span style="width:60%;">60%</span>
	                                                                    </div>
	                                                            </div> -->
	                                                    </a>
	                                                    <div class="btn_like_area">
	                                                            <button type="button" class="btn-like on" title="좋아요"><span>480</span></button>
	                                                    </div>
	                                            </li>
	                                            <li>
	                                                    <span class="flag_video">video</span>
	                                                    <a href="#">
	                                                            <div class="img_thum_wrap">
	                                                                    <div class="img_thum_inner" style="background-image:url(../../images/@temp/newitem02.jpg);"></div>
	                                                                    <div class="img_thum_inner" style="background-image:url(../../images/@temp/newitem02_over.jpg);"></div>
	                                                                    <ul class="color_list">
	                                                                            <li><span style="background:#273b38;">color 01</span></li>
	                                                                            <li><span style="background:#c7673e;">color 02</span></li>
	                                                                            <li><span style="background:#6686ad;">color 03</span></li>
	                                                                    </ul>
	                                                            </div>
	                                                            <div class="sort_tag_area clearboth">
	                                                                    <span class="sort">SIEG</span>
	                                                                    <span class="tag">#신상품</span>
	                                                            </div>
	                                                            <p class="goods_title">한정판매, 핫 템 !</p>
	                                                            <!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
	                                                            <div class="goods_cost_info">
	                                                                    <span class="dc_before_cost">￦88,000</span>
	                                                                    <strong class="clearboth">
	                                                                            <span class="goods_cost">￦44,000</span>
	                                                                            <em class="dc_percent">50%</em>
	                                                                    </strong>
	                                                            </div>
	                                                            <!-- <div class="per_bar_wrap">
	                                                                    <p class="time">14:21:21 남음 <span>60%</span></p>
	                                                                    <div class="per_bar">
	                                                                            <span style="width:60%;">60%</span>
	                                                                    </div>
	                                                            </div> -->
	                                                    </a>
	                                                    <div class="btn_like_area">
	                                                            <button type="button" class="btn-like" title="좋아요"><span>480</span></button>
	                                                    </div>
	                                            </li>
	                                            <li>
	                                                    <span class="flag_video">video</span>
	                                                    <a href="#">
	                                                            <div class="img_thum_wrap">
	                                                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem03.jpg);"></div>
	                                                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem03_over.jpg);"></div>
	                                                                    <ul class="color_list">
	                                                                            <li><span style="background:#273b38;">color 01</span></li>
	                                                                            <li><span style="background:#c7673e;">color 02</span></li>
	                                                                            <li><span style="background:#6686ad;">color 03</span></li>
	                                                                    </ul>
	                                                            </div>
	                                                            <div class="sort_tag_area clearboth">
	                                                                    <span class="sort">SIEG</span>
	                                                                    <span class="tag">#신상품</span>
	                                                            </div>
	                                                            <p class="goods_title">한정판매, 핫 템 !</p>
	                                                            <!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
	                                                            <div class="goods_cost_info">
	                                                                    <span class="dc_before_cost">￦88,000</span>
	                                                                    <strong class="clearboth">
	                                                                            <span class="goods_cost">￦44,000</span>
	                                                                            <em class="dc_percent">50%</em>
	                                                                    </strong>
	                                                            </div>
	                                                            <!-- <div class="per_bar_wrap">
	                                                                    <p class="time">14:21:21 남음 <span>60%</span></p>
	                                                                    <div class="per_bar">
	                                                                            <span style="width:60%;">60%</span>
	                                                                    </div>
	                                                            </div> -->
	                                                    </a>
	                                                    <div class="btn_like_area">
	                                                            <button type="button" class="btn-like" title="좋아요"><span>480</span></button>
	                                                    </div>
	                                            </li>
	                                            <li>
	                                                    <span class="flag_video">video</span>
	                                                    <a href="#">
	                                                            <div class="img_thum_wrap">
	                                                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem04.jpg);"></div>
	                                                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem04_over.jpg);"></div>
	                                                                    <ul class="color_list">
	                                                                            <li><span style="background:#273b38;">color 01</span></li>
	                                                                            <li><span style="background:#c7673e;">color 02</span></li>
	                                                                            <li><span style="background:#6686ad;">color 03</span></li>
	                                                                    </ul>
	                                                            </div>
	                                                            <div class="sort_tag_area clearboth">
	                                                                    <span class="sort">SIEG</span>
	                                                                    <span class="tag">#신상품</span>
	                                                            </div>
	                                                            <p class="goods_title">한정판매, 핫 템 !</p>
	                                                            <!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
	                                                            <div class="goods_cost_info">
	                                                                    <span class="dc_before_cost">￦88,000</span>
	                                                                    <strong class="clearboth">
	                                                                            <span class="goods_cost">￦44,000</span>
	                                                                            <em class="dc_percent">50%</em>
	                                                                    </strong>
	                                                            </div>
	                                                            <!-- <div class="per_bar_wrap">
	                                                                    <p class="time">14:21:21 남음 <span>60%</span></p>
	                                                                    <div class="per_bar">
	                                                                            <span style="width:60%;">60%</span>
	                                                                    </div>
	                                                            </div> -->
	                                                    </a>
	                                                    <div class="btn_like_area">
	                                                            <button type="button" class="btn-like on" title="좋아요"><span>480</span></button>
	                                                    </div>
	                                            </li>
	                                            <li>
	                                                    <span class="flag_video">video</span>
	                                                    <a href="#">
	                                                            <div class="img_thum_wrap">
	                                                                    <!-- <span class="flag_video">video</span> -->
	                                                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem05.jpg);"></div>
	                                                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem05_over.jpg);"></div>
	                                                                    <ul class="color_list">
	                                                                            <li><span style="background:#273b38;">color 01</span></li>
	                                                                            <li><span style="background:#c7673e;">color 02</span></li>
	                                                                            <li><span style="background:#6686ad;">color 03</span></li>
	                                                                    </ul>
	                                                            </div>
	                                                            <div class="sort_tag_area clearboth">
	                                                                    <span class="sort">SIEG</span>
	                                                                    <span class="tag">#신상품</span>
	                                                            </div>
	                                                            <p class="goods_title">한정판매, 핫 템 !</p>
	                                                            <!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
	                                                            <div class="goods_cost_info">
	                                                                    <span class="dc_before_cost">￦88,000</span>
	                                                                    <strong class="clearboth">
	                                                                            <span class="goods_cost">￦44,000</span>
	                                                                            <em class="dc_percent">50%</em>
	                                                                    </strong>
	                                                            </div>
	                                                            <!-- <div class="per_bar_wrap">
	                                                                    <p class="time">14:21:21 남음 <span>60%</span></p>
	                                                                    <div class="per_bar">
	                                                                            <span style="width:60%;">60%</span>
	                                                                    </div>
	                                                            </div> -->
	                                                    </a>
	                                                    <div class="btn_like_area">
	                                                            <button type="button" class="btn-like on" title="좋아요"><span>480</span></button>
	                                                    </div>
	                                            </li>
	                                            <li>
	                                                    <span class="flag_video">video</span>
	                                                    <a href="#">
	                                                            <div class="img_thum_wrap">
	                                                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem06.jpg);"></div>
	                                                                    <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/newitem06_over.jpg);"></div>
	                                                                    <ul class="color_list">
	                                                                            <li><span style="background:#273b38;">color 01</span></li>
	                                                                            <li><span style="background:#c7673e;">color 02</span></li>
	                                                                            <li><span style="background:#6686ad;">color 03</span></li>
	                                                                    </ul>
	                                                            </div>
	                                                            <div class="sort_tag_area clearboth">
	                                                                    <span class="sort">SIEG</span>
	                                                                    <span class="tag">#신상품</span>
	                                                            </div>
	                                                            <p class="goods_title">한정판매, 핫 템 !</p>
	                                                            <!-- <p class="goods_context">산뜻한 하루를 만드는 룩!<br>#체크남방 #반바지 #뷔스티에 #원피스</p> -->
	                                                            <div class="goods_cost_info">
	                                                                    <span class="dc_before_cost">￦88,000</span>
	                                                                    <strong class="clearboth">
	                                                                            <span class="goods_cost">￦44,000</span>
	                                                                            <em class="dc_percent">50%</em>
	                                                                    </strong>
	                                                            </div>
	                                                            <!-- <div class="per_bar_wrap">
	                                                                    <p class="time">14:21:21 남음 <span>60%</span></p>
	                                                                    <div class="per_bar">
	                                                                            <span style="width:60%;">60%</span>
	                                                                    </div>
	                                                            </div> -->
	                                                    </a>
	                                                    <div class="btn_like_area">
	                                                            <button type="button" class="btn-like" title="좋아요"><span>480</span></button>
	                                                    </div>
	                                            </li>
	                                    </ul>   
	                            </div>
	                            <!-- // .new_goods_wrap -->
	                        </div>
	                    </div>
	                </div>
	                <div class="keyword">
	                    <div class="tit-area">
	                        <h3 class="tits2">HOT KEYWORD</h3>
	                        <ol>
	                            <li><p class="kbx"><span class="num">1.</span><a href="#">원피스</a></p></li>
	                            <li><p class="kbx"><span class="num">2.</span><a href="#">투피스</a></p></li>
	                            <li><p class="kbx"><span class="num">3.</span><a href="#">가디건</a></p></li>
	                            <li><p class="kbx"><span class="num">4.</span><a href="#">에코백</a></p></li>
	                            <li><p class="kbx"><span class="num">5.</span><a href="#">앤더슨벨</a></p></li>
	                            <li><p class="kbx"><span class="num">6.</span><a href="#">닐파이피</a></p></li>
	                            <li><p class="kbx"><span class="num">7.</span><a href="#">자켓</a></p></li>
	                            <li><p class="kbx"><span class="num">8.</span><a href="#"> 귀걸이</a></p></li>
	                            <li><p class="kbx"><span class="num">9.</span><a href="#">블라우스</a></p></li>
	                            <li><p class="kbx"><span class="num">10.</span><a href="#">프론트로우</a></p></li>
	                        </ol>
	                    </div>
	                </div>
	            </div>
            </div>
            
    </div>
    </div>
</div>


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<!-- 제품 템플릿 -->
<script type="text/template" id="c_product_template"> 
<li>
    <span class="flag_video">video</span>
    <a href="/pc/product/productView.do?PRD_MST_CD=\${PRD_MST_CD}">
        <div class="img_thum_wrap">
            <div class="img_thum_inner crop" style="background-image:url('${cdnDomain }\${PRD_IMAGE}');"></div>
            <div class="img_thum_inner crop" style="background-image:url('${cdnDomain }\${PRD_ROLL_OVER_IMG }');"></div>
            <ul id="product_\${PRD_MST_CD}" class="color_list">
            </ul>
        </div>
        <div class="sort_tag_area clearboth">
            <span class="sort">\${BND_MST_BRAND_NM}</span>
            <span class="tag">\${TAG_MST_TITLE}</span>
        </div>
  
        <p class="goods_title">\${PRD_MST_NM}</p>
        <div class="goods_cost_info">
            <span class="dc_before_cost cur-number-format">\${PRD_MST_PRICE} </span>
            <strong class="clearboth">
                <span class="goods_cost cur-number-format">\${PRD_NOW_DST_PRICE} </span>
                <em class="dc_percent"> \${PRD_DST_PERCENT}% </em>
            </strong>
        </div> 

    </a>
    <div class="etc">
        <a href="javascript:void(0);" class="like \${LIKE_CLS}"
            onclick="likeBtnEvent($(this), '\${PRD_MST_CD}', 'TYPE_PRODUCT')">\${LIKE_COUNTS }</a>
    </div>
</li>
</script>

<!-- 타임특가 템플릿 -->
<script type="text/template" id="c_time_template"> 
<li>
    <span class="flag_video">video</span>
    <a href="#">
        <div class="img_thum_wrap">
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\\${PRD_IMAGE});"></div>
            <div class="img_thum_inner crop" style="background-image:url(${cdnDomain }\\${PRD_ROLL_OVER_IMG });"></div>
            <ul id="time_\${TIM_SAL_IDX}" class="color_list">
            </ul> 
        </div>
        <div class="sort_tag_area clearboth">
            <span class="sort">\${BND_MST_BRAND_NM}</span>
            <span class="tag">\${TAG_MST_TITLE}</span>
        </div>
        <p class="goods_title">\${PRD_MST_NM}</p>
        <div class="goods_cost_info">
            <span class="dc_before_cost cur-number-format">\${PRD_MST_PRICE} </span>
            <strong class="clearboth">
                <span class="goods_cost cur-number-format">\${PRD_NOW_DST_PRICE} </span>
                <em class="dc_percent"> \${PRD_DST_PERCENT}% </em>
            </strong>
        </div> 
        <div class="per_bar_wrap remain_timer" data-starttime="\${TIM_SAL_ST}" data-finishtime="\${TIM_SAL_ED}">
            <p class="time">--:--:-- 남음</p><span class="percent_label">0%</span>
            <div class="per_bar">
                <span style="width:0%;" class="percent_label">0%</span>
            </div>
        </div>
    </a>
</li>
</script>
                                
<!--펀딩 템플릿-->
<script type="text/template" id="c_fund_template">                         
<li>
    <span class="flag_video">video</span>
    <!-- .goods_info_wrap -->
    <div class="goods_info_wrap">
        <a href="#">
            <div class="img_thum_wrap square">
                <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/img_funding.png);"></div>
                <div class="img_thum_inner crop" style="background-image:url(../../images/@temp/img_funding_over.png);"></div>
                <ul class="color_list">
                    <li><span style="background:#273b38;">color 01</span></li>
                    <li><span style="background:#c7673e;">color 02</span></li>
                    <li><span style="background:#6686ad;">color 03</span></li>
                </ul>
            </div>
            <div class="sort_tag_area clearboth">
                <span class="sort">SIEG</span>
                <span class="tag">#린넨수트</span>
            </div>
            <p class="goods_title">크리스마스 인싸템 인간 왕리본</p>
            <p class="goods_context">크리스마스에 리얼 관종으로 인정 각 인싸템<br />#왕리본 #공주룩 #파티룩 #크리스마스</p>
            <div class="goods_cost_info">
                <span class="dc_before_cost">￦88,000</span>
                <strong class="clearboth">
                    <span class="goods_cost">￦44,000</span>
                    <em class="dc_percent">50%</em>
                </strong>
            </div>
            <div class="per_bar_wrap">
                <p class="time">14:21:21 남음 <span>56%</span></p>
                <div class="per_bar">
                    <span style="width:60%;">60%</span>
                </div>
            </div>
        </a>
        <div class="btn_area clearboth">
            <button type="button" class="btn_social_sharing">공유하기</button>
        </div>
    </div>
</li>
</script>

<!-- 기획전 템플릿 -->
<script type="text/template" id="c_plan_template"> 
<div class="item-group">
    <div class="thumb-img">
        <a href="#">
            <img src="${cdnDomain }\${CMM_FLE_SAVE_PATH }" alt="\${CMN_FLE_ALT_TXT }" />
        </a>
    </div>
    <div class="thumb-txt">
        <div class="sort">
            <a href="javascript:void(0);" class="tag">\${TAG_MST_TITLE }</a>
        </div>
        <div class="tit">
            <a href="javascript:void(0);">\${PLN_MST_TITLE }</a>
            <p class="goods_date">\${TARGET_DATE }</p>
        </div>
    </div>
</div>
</script>

<!-- 이벤트 템플릿 -->
<script type="text/template" id="c_event_template">
<div class="item-group">
    <div class="thumb-img">
        <a href="#">
            <img src="${cdnDomain }\${CMM_FLE_SAVE_PATH}" alt="\${CMN_FLE_ALT_TXT}"/>
        </a>
    </div>
    <div class="thumb-txt">
        <div class="sort">
            <a href="#" class="tag">\${TAG_MST_TITLE}</a>
        </div>
        <div class="tit">
            <a href="#">\${EVT_MST_TITLE}</a>
        </div>
    </div>
</div>   
</script>

<!-- 하울영상 템플릿 -->
<script type="text/template" id="c_haul_template"> 
<li>
        <a href="#" class="mov_thum_box">
        	<img src="${cdnDomain }\${PRD_IMAGE}" alt="\${PRD_IMAGE_ALT}">
        </a>
        <div class="sort_tag_area clearboth">
                <span class="sort fl">${BND_MST_BRAND_NM}</span>
                <span class="tag fl">${TAG_MST_TITLE}</span>
        </div>
        <p class="mov_title">\${PRD_MST_NM}</p>
</li>
</script>                 
                                

                            
                                                   
<script>
$(function(){
	
	///////////////////// SEARCH RESULT UI START /////////////////////////
    var renderRemainTimer = function() {
    	$('.remain_timer').each(function(){
    		
    		//new Date("Jan 5, 2021 15:37:25").getTime();
    		var $targetElem = $(this);
    		if($targetElem.attr('data-execute') != 'Y') {
    			
          		$(targetElem).attr('data-execute', 'Y');
        		
        		var startTime = $targetElem.attr('data-starttime');
        		var finishTime = $targetElem.attr('data-finishtime');
        		    		
        		//console.log(startTime + ", " + finishTime);
        		//yyyymmddhhmmss
        		var curFinishDateTime = new Date(finishTime.slice(0, 4), finishTime.slice(4, 6) - 1, finishTime.slice(6, 8),
        				//finishTime.slice(8, 10), finishTime.slice(10, 12), finishTime.slice(12, 14)).getTime();
        				finishTime.slice(8, 10), finishTime.slice(10, 12), '00').getTime();
        		
        		var curStartDateTime = new Date(startTime.slice(0, 4), startTime.slice(4, 6) - 1, startTime.slice(6, 8),
        				//startTime.slice(8, 10), startTime.slice(10, 12), startTime.slice(12, 14)).getTime();
        				startTime.slice(8, 10), startTime.slice(10, 12), '00').getTime();
        		
        		var curDistance = curFinishDateTime - curStartDateTime;
        		
        		var $targetTimeTxt = $('.time', $targetElem);
        		var $targetProgress = $('.per_bar span', $targetElem);
        		var $targetPercent = $('.percent_label', $targetElem);
        		
        	    var x = setInterval(function() {

               	  	// Get today's date and time
               	  	var now = new Date().getTime();

               	  	// Find the distance between now and the count down date
               	  	var distance = curFinishDateTime - now;

               	  	// Time calculations for days, hours, minutes and seconds
               	  	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
               	  	var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
               	 	if(hours < 10) hours = '0' + hours;
               	  	var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
               	 	if(minutes < 10) minutes = '0' + minutes;
               	  	var seconds = Math.floor((distance % (1000 * 60)) / 1000);
               	  	if(seconds < 10) seconds = '0' + seconds;

               	  	// If the count down is finished, write some text
               	  	if (distance < 0) {
               	  		clearInterval(x);
               	 		$targetTimeTxt.text('00:00:00');
               	 		$targetProgress.css('width', '0%');
               	 	$targetPercent.text('0%');
    				} else {
    					$targetTimeTxt.text(hours + ':' + minutes + ':' + seconds);
    					var curPercent = Math.floor(distance / curDistance * 100);
               	 		$targetProgress.css('width', curPercent + '%');
               	 		$targetPercent.text( curPercent + '%');
    				}
               }, 1000);
    			
    		}

    	});
    };
    
    var CURRENT_SEARCH_PARAM = {};
    var CURRENT_OFFSET;
    
    var setOffsetParams = function() {
    	CURRENT_OFFSET = {
			product : 1,
 			time : 1,
 			fund : 1,
 			plan : 1,
 			event : 1,
 			haul : 1
		}
    	
    	$('.search_more').each(function(){
    		$(this).closest('.go_link_area').show();
    	});
    };
    
	var setSearchParams = function(pIsFirst) {
		var isReSearch = $('#re_serach_chk').is(':checked');
		
		var params = {
			re_search : isReSearch ? 'Y' : 'N',
			gender_woman : pIsFirst ? $('#search_gender_woman').val() : ($('#gender_woman').is(':checked') ? 'F' :''),
			gender_man : pIsFirst ? $('#search_gender_man').val() : ($('#gender_man').is(':checked') ? 'M' : ''),
			height : pIsFirst ? $('#search_height').val() : $('#height').val(),
			weight : pIsFirst ? $('#search_weight').val() : $('#weight').val(),
			cat01 : pIsFirst ?  $('#search_cat01').val() : $('#cat01 option:selected').val(),
			cat02 : pIsFirst ?  $('#search_cat02').val() : $('#cat01 option:selected').val(),
			color : pIsFirst ?  $('#search_color').val() : $('#color_a').attr('data-id'),
			search_txt : pIsFirst ? $('#search_search_txt').val() : $('#search_txt').val()
		};
		
		var isReSearch = $('#re_serach_chk').is(':checked');
		if(isReSearch) {
			params['re_gender_woman'] = $('#search_gender_woman').val();
			params['re_gender_man'] = $('#search_gender_man').val();
			params['re_height'] = $('#search_height').val();
			params['re_weight'] = $('#search_weight').val();
			params['re_cat01'] = $('#search_cat01').val();
			params['re_cat02'] = $('#search_cat02').val();
			params['re_color'] = $('#search_color').val();
			params['re_search_txt'] = $('#search_search_txt').val();
		}
		
		$('#search_gender_woman').val(params.gender_woman);
		$('#search_gender_man').val(params.gender_man);
		$('#search_height').val(params.height);
		$('#search_weight').val(params.weight);
		$('#search_cat01').val(params.cat01);
		$('#search_cat02').val(params.cat02);
		$('#search_color').val(params.color);
		$('#search_search_txt').val(params.search_txt);

		CURRENT_SEARCH_PARAM = params;
		
		if(params.search_txt.length > 0) $('#search_txt_label').text(params.search_txt);
		else $('#search_txt_label').text('___');
		
	};

	var renderEmptyUI = function(pDiv) {
		$('#' + pDiv + '_rst_list').empty();
	}
    var renderContentsUI = function(pData) {
    	
    	
    	CURRENT_OFFSET[pData.type] = pData.offset;
    	
    	var templateID = pData.type;
    	var $targetListElem = $('#' + pData.type + '_rst_list');
    	
		$('#c_' + pData.type + '_template').tmpl(pData.list).appendTo($targetListElem);
		
		if(templateID == 'product') {
			var liHTML = '<li><span style="background:{colorvalue};">{colorname}</span></li>';
			
			for(var idx = 0 ; idx < pData.length; idx++) {
				var curDataList = pData[idx];
				var fullHTML = '';
				for(var i = 0; i < curDataList.CNT_PRD_COLOR.length ; i ++) {
					var curColorInfo = curDataList.CNT_PRD_COLOR[i];
					fullHTML += liHTML.replace('{colorvalue}', curColorInfo.CNT_PRD_COLOR)
										.replace('{colorname}', curColorInfo.CMN_COM_NM);
				}
				var curIDX = '';
				if(templateID == 'product' ) curIDX = curDataList.PRD_MST_CD;
				else if(templateID == 'time' ) curIDX = curDataList.TIM_SAL_IDX;
				
				$('#' + templateID + '_' + curIDX).append(fullHTML);				
			}

			if(templateID == 'time')
				renderRemainTimer();
			
		} else if (templateID == 'ootd') {
			var cdnDomain = '<c:out value="${cdnDomain}"/>';
	        var liHTML = '';
	        liHTML += '<li>';
	        liHTML += '    <a href="/pc/product/productView.do?PRD_MST_CD={PRD_MST_CD}" target="_blank">';
	        liHTML += '        <div class="pro"><img src="{image}" alt="{alt}"></div>';
	        liHTML += '        <div class="if">';
	        liHTML += '            <p class="tit">${title}</p>';
	        liHTML += '            <p class="pri_bx">';
	        liHTML += '                <span class="pri cur-number-format">${price}</span>';
	        liHTML += '                <span class="per">${percent} %</span>';
	        liHTML += '            </p>';
	        liHTML += '        </div>';
	        liHTML += '    </a>';
	        liHTML += '</li>';
	        
			for(var idx = 0 ; idx < pData.length; idx++) {
				var curDataList = pData[idx];
				var fullHTML = '';
				for(var i = 0; i < curDataList.DTL_LIST.length ; i ++) {
					var curDtlInfo = curDataList.DTL_LIST[i];
					fullHTML += liHTML.replace('{image}', cdnDomain + '/'+ curDtlInfo.PRD_IMAGE)
										.replace('{title}', curDtlInfo.PRD_MST_NM)
										.replace('{PRD_MST_CD}', curDtlInfo.PRD_MST_CD)
										.replace('{alt}', curDtlInfo.PRD_IMAGE_ALT)
										.replace('{price}', curDtlInfo.PRD_MST_PRICE)
										.replace('{percent}', curDtlInfo.PRD_DST_PERCENT);
				}
				
				$('#' + templateID + '_' + curDataList.CNT_MST_IDX).append(fullHTML);	
			}

		}
		
		if(pData.count == 0) $('a.search_more[data-type="' + pData.type + '"]').hide();
		
		ResetCurrencyNumberFormat();
    }
    
    var funcGetSearchResultList = function(pSearchType){
    	
    	
    	/*
		var selTagList = [];
		$('input:checkbox[name=feeds]').each(function(){
			if(this.checked)
				selTagList.push($(this).attr('data-id'));
		});
		*/

		//CONTENT_LIST_INFO.tag_bnd_id = JSON.stringify(selTagList);
		//console.log(getSearchParams(pSearchType));
		
		CURRENT_SEARCH_PARAM['offset'] = CURRENT_OFFSET[pSearchType];
		CURRENT_SEARCH_PARAM['search_type'] = pSearchType;
		
		var $ordElem = $('select.order_select[data-type="' + pSearchType + '"]');
		
		if($ordElem.length > 0) 
			CURRENT_SEARCH_PARAM['ord_type'] = $('option:selected', $ordElem).val();
		
		
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/search/searchResultListAjax.do",
    		dataType: "json",
    		data	: CURRENT_SEARCH_PARAM,
    		success : function(data) {
    			renderContentsUI(data);
    		}, error : function(err) {
    			alert("요청 실패");
    		}, complete : function() { 
    	    }
    	});
    };
    
    var getNumberFormat = function(pData) {
    	  return pData.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
    var funcGetSearchResultCount = function() {
    	$.ajax({
    		type	: "POST",
    		url		: "/pc/search/searchResultCountAjax.do",
    		dataType: "json",
    		data	: CURRENT_SEARCH_PARAM,
    		success : function(data) {
    			
    			console.log(data);
    			var totCount = 0;
    			for(key in data) {
    				$('#' + key + '_count').text(getNumberFormat(data[key] + ""));
    				totCount += data[key];
    			}
    			
    			$('#search_result_totcnt').text(getNumberFormat(totCount + ""))
    		}, error : function(err) {
    		}, complete : function() { 
    	    }
    	});
    }
    
    var requestAllSearchResult = function(pIsFirst){
    	setOffsetParams();
    	setSearchParams(pIsFirst);
    	
    	renderEmptyUI('product');
    	renderEmptyUI('time');
    	renderEmptyUI('fund');
    	renderEmptyUI('plan');
    	renderEmptyUI('event');
    	renderEmptyUI('haul');
    	
       	funcGetSearchResultList('product');
        funcGetSearchResultList('time');
        funcGetSearchResultList('fund');
        funcGetSearchResultList('plan');
        funcGetSearchResultList('event');
        funcGetSearchResultList('haul');
        
        funcGetSearchResultCount();
    }
    
    setOffsetParams();
    requestAllSearchResult(true);
    
    $('#search_submit').on('click', function() {
    	requestAllSearchResult(false);
    });
    
    $('.search_more').on('click', function(){
    	funcGetSearchResultList($(this).data('type'));
    });
    
    $('.order_select').on('change', function(){
    	var curType = $(this).data('type');
    	funcGetSearchResultList(curType);
    	$('a.search_more[data-type="' + curType + '"]').show();
    });
	///////////////////// SEARCH RESULT UI FINISH /////////////////////////
    
	
	
    ///////////////////// SEARCH OPTION  BINDING START //////////////////////////
    var isFirstLoading = true;
	var getMainCategoryList = function($pTargetElem, upIdx, prevIdx)
	{
		$pTargetElem.empty();
        $.ajax({
            type    : "POST",
            url     : '<c:out value="${serverDomain}"/>/pc/product/subCategoryProductAjax.do',
            data    :  { "PRD_CTG_IDX":upIdx, "PRD_CTG_ENV": '<c:out value="${commandMap.PRD_CTG_ENV}" />'},
            dataType : "JSON",
            async   : false,
            success : function(data)
            {
				$pTargetElem.append("<option value=''>전체</option>");
         
                $.each(data.categoryList, function(i,item) 
                {
                	var curSelected = '';
                	if(item.PRD_CTG_IDX == prevIdx) curSelected = 'selected';
                	
                    $pTargetElem.append("<option value='" + item.PRD_CTG_IDX + "' " + curSelected + ">"+ item.PRD_CTG_NM + "</option>");
                });
              
                if(isFirstLoading && $('#search_cat02').val().length > 0) {
                	isFirstLoading = false;
                	getMainCategoryList($('#cat02'), $('#cat01 option:selected').val(), $('#search_cat02').val());
                } else isFirstLoading = false;
                
                
            },
            error   : function(xhr,status,error)
            { 
                alert("상품 카테고리 호출 중 에러가 발생하였습니다.");
                //alert("code:"+xhr.status); 
            }
        });
	};
	
    getMainCategoryList($('#cat01'), -1, $('#search_cat01').val());
    
    $('#cat01').on('change', function(){
    	getMainCategoryList($('#cat02'), $('#cat01 option:selected').val());
    });
    	
    $('.option_list li button').off('click');
    $(document).on('click', '.option_list li button', function(){
        var _this = $(this);
        if (_this.parents('.option_list').siblings('a').hasClass('color')) {
  
            if(_this.hasClass('total')){
                _this.parents('.option_list').siblings('.lk').addClass('total').removeAttr('style');
            }else{
                _this.parents('.option_list').siblings('.lk').removeClass('total');
            }
            
            _this.parents('.option_list').siblings('.lk').text(_this.text()).attr('data-id', _this.attr('data-value')).attr('style',_this.attr('style'));
            _this.parents('.option_list').fadeOut(300);
        } 
    });
        
	///////////////////// SEARCH OPTION  BINDING FINISH //////////////////////////
    
});
</script>