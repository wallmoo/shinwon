<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
        <div id="content" class="content">

            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">마이핏관리</h2>
            </div>
            <!--// Title -->

            <div class="sub_content">
            
                <%@ include file="/WEB-INF/jsp/pc/mypage/include/shoppingTopMemu.jsp"%>
                <!-- //my_modify_top_wrap -->
                <div class="myfit_wrap">
                    <div class="tab_wrap">
                        <ul class="tab n7">
                        	<li class="on"><a href="#tab1">ALL</a></li>
                        	<c:set var="cat_id_count" value="1"></c:set>
                        	<c:forEach var="myfitcat" items="${myfitCatList}" varStatus="status">
                        		<c:if test="${myfitcat.CMN_COM_LEVEL eq 2}">
                        			<li><a href="#tab${cat_id_count }">${myfitcat.CMN_COM_NM}</a></li>
                        			<c:set var="cat_id_count" value="${cat_id_count + 1 }"></c:set>
                        		</c:if>
                        	</c:forEach>
                        </ul>
                        <div class="tab_cont" id="tab1">
                            <div class="slider myfit_tab">
	                        	<c:forEach var="myfitcat" items="${myfitCatList}" varStatus="status">
	                        		<c:if test="${myfitcat.CMN_COM_LEVEL eq 3}">
		                                <div>
		                                    <div class="clothes">
		                                        <div class="inner">
		                                            <img src="${cdnDomain}${myfitcat.FIT_THUMB_IMG}" alt="마이핏선택이미지">
		                                            <p>${myfitcat.CMN_COM_NM}</p>
		                                        </div>
		                                    </div>
		                                </div>
	                        		</c:if>
	                        	</c:forEach>
                            </div>
                            <div class="slider myfit_cont">
	                        	<c:forEach var="myfitcat" items="${myfitCatList}" varStatus="status">
	                        		<c:if test="${myfitcat.CMN_COM_LEVEL eq 3}">
	                        		
		                                <div>
		                                    <div class="myfit_edit">
		                                        <div class="inner">
		                                            <div class="icon_guide">
		                                                <img src="${cdnDomain}${myfitcat.FIT_SAMP_IMG}" alt="마이핏가이드이미지">
		                                            </div>
		                                            <div class="input_field">
		                                                <div class="item_wp">
		                                                	<c:set var="val_id_count" value="1"></c:set>
		                                                	<c:forEach var="myfitinfo" items="${myfitInfoList}" varStatus="instatus">
		                                                		<c:if test="${myfitinfo.FIT_CTG_IDX eq myfitcat.CMN_COM_IDX}">
			                                                    <div class="item">
			                                                        <strong>${val_id_count }. ${myfitinfo.FIT_INFO_NM }</strong>
			                                                        <input type="number" placeholder="cm 입력" value="${myfitinfo.MEM_FIT_VAL }" data-midx="${myfitinfo.FIT_MST_IDX }" data-iidx="${myfitinfo.FIT_INFO_IDX }">
			                                                        <span>cm</span>
			                                                    </div>
			                                                    <c:set var="val_id_count" value="${val_id_count + 1 }"></c:set>
		                                                		</c:if>
		                                                	</c:forEach>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <div class="btn_wrap">
			                                            <button class="btn_large gray reset-submit">초기화</button>
			                                            <button class="btn_large ok save-submit">적용</button>
		                                        </div>
		                                    </div>
		                                </div>
	                        		</c:if>
	                        	</c:forEach>
                            </div>
                        </div>

						<c:set var="cat_id_count" value="1"></c:set>
                       	<c:forEach var="myfitcat" items="${myfitCatList}" varStatus="status">
                       		<c:if test="${myfitcat.CMN_COM_LEVEL eq 2}">
	                        <div class="tab_cont" id="tab${cat_id_count}">
	                            <div class="slider myfit_tab">
	                            	<c:forEach var="inmyfitcat" items="${myfitCatList}" varStatus="instatus">
	                            		<c:if test="${inmyfitcat.CMN_COM_LEVEL eq 3 and inmyfitcat.CMN_COM_UP_IDX eq myfitcat.CMN_COM_IDX}">
			                                <div>
			                                    <div class="clothes">
			                                        <div class="inner">
			                                            <img src="${cdnDomain}${inmyfitcat.FIT_THUMB_IMG}" alt="마이핏선택이미지">
			                                            <p>${inmyfitcat.CMN_COM_NM}</p>
			                                        </div>  
			                                    </div>
			                                </div>
	                            		</c:if>
	                            	</c:forEach>
	                            </div>
	                            <div class="slider myfit_cont">
	                            	<c:forEach var="inmyfitcat" items="${myfitCatList}" varStatus="instatus">
	                            		<c:if test="${inmyfitcat.CMN_COM_LEVEL eq 3 and inmyfitcat.CMN_COM_UP_IDX eq myfitcat.CMN_COM_IDX}">
			                                <div>
			                                    <div class="myfit_edit">
			                                        <div class="inner">
			                                            <div class="icon_guide">
			                                            	<img src="${cdnDomain}${inmyfitcat.FIT_SAMP_IMG}" alt="마이핏가이드이미지">
			                                            </div>
			                                            <div class="input_field">
			                                                <div class="item_wp">
			                                                	<c:set var="val_id_count" value="1"></c:set>
			                                                	<c:forEach var="myfitinfo" items="${myfitInfoList}" varStatus="ininstatus">
			                                                		<c:if test="${myfitinfo.FIT_CTG_IDX eq inmyfitcat.CMN_COM_IDX}">
				                                                    <div class="item">
				                                                        <strong>${val_id_count }. ${myfitinfo.FIT_INFO_NM }</strong>
				                                                        <input type="number" placeholder="cm 입력" value="${myfitinfo.MEM_FIT_VAL }" data-midx="${myfitinfo.FIT_MST_IDX }" data-iidx="${myfitinfo.FIT_INFO_IDX }">
				                                                        <span>cm</span>
				                                                    </div>
				                                                    <c:set var="val_id_count" value="${val_id_count + 1 }"></c:set>
			                                                		</c:if>
			                                                	</c:forEach>
			                                                </div>
			                                            </div>
			                                        </div>
			                                        <div class="btn_wrap">
			                                            <button class="btn_large gray reset-submit">초기화</button>
			                                            <button class="btn_large ok save-submit">적용</button>
			                                        </div>
			                                    </div>
			                                </div>
	                            		</c:if>
	                            	</c:forEach>
	                            </div>
	                        </div>
	                        <c:set var="cat_id_count" value="${cat_id_count + 1}"></c:set>
                        	</c:if>
                       	</c:forEach>
                    </div>
                </div>
            </div>
            <!-- //sub_content -->

        </div>
    </div>

<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
$(function(){
    $('.slider.myfit_cont').each(function(key, item) {
        var sliderIdName = 'slider' + key;
        var sliderNavIdName = 'sliderNav' + key;

        this.id = sliderIdName;
        $('.myfit_tab')[key].id = sliderNavIdName;

        var sliderId = '#' + sliderIdName;
        var sliderNavId = '#' + sliderNavIdName;

        $(sliderId).slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: sliderNavId,
            infinite: false
        });

        $(sliderNavId).slick({
            slidesToShow: 5,
            slidesToScroll: 1,
            focusOnSelect: true,
            asNavFor: sliderId,
            infinite: false
        });

        // $(sliderNavId).on('beforeChange', function(event, slick, currentSlide, nextSlide){

        //  var slideImg = $(this).find('.slick-slide').find('img');
        //  var slideAtvImg = $(this).find('.slick-slide').eq(nextSlide).find('img');

        //  slideImg.attr("src", slideImg.attr("src").replace("_on.png", ".png"));
        //  slideAtvImg.attr("src", slideAtvImg.attr("src").replace(".png", "_on.png"));
        // });
    });

    $('.tab>li>a').click(function(){
        $('.slider.myfit_tab').slick("setPosition", 0);
        $('.slider.myfit_cont').slick("setPosition", 0);
    });
    
    $('.reset-submit').on('click', function(){
    	var $wrapper = $(this).closest('.myfit_edit');
    	var inData = [];
    	$('input', $wrapper).each(function(){
    		$(this).val('0');
    	});

    });
    
    $('.save-submit').on('click', function(){
    	var $wrapper = $(this).closest('.myfit_edit');
    	var inData = [];
    	$('input', $wrapper).each(function(){
    		inData.push({
    			MEM_FIT_VAL : $(this).val(),
    			FIT_MST_IDX : $(this).data('midx'),
    			CMN_COM_IDX : $(this).data('iidx')
    		})
    	});
    	if(inData.length <= 0) {
    		alert('적용할 데이터가 없습니다.');
    	} else {
    		var isVal = true;
        	for(var i = 0; i < inData.length; i++) {
        		if(inData[i].MEM_FIT_VAL.length <= 0 || inData[i].MEM_FIT_VAL * 1 < 0) {
        			isVal = false;
        		}
        	}
        	
        	if(isVal == false) {
        		alert('모든 항목에 0 이상의 정보를 입력해 주십시요.');
        		return;
        	} 
        	
        	ShowLoading(true);
        	$.ajax({
        		type	: "POST",
        		url		: "/pc/mypage/myFitListAjax.do",
        		dataType: "json",
        		data	: {myfit_list : JSON.stringify(inData)},
        		success : function(data) {
					alert('저장에 성공했습니다.');
        
        			
        		}, error : function(err) {
        			alert("요청 실패");
        		}, complete : function(){
        			ShowLoading(false);
        		}
        	});
        	
    	}
    });
});
</script>