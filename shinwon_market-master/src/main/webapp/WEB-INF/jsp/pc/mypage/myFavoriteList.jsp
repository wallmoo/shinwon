<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp"%>
            <!-- //LOCATION -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">즐겨찾기 관리</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				
				<%-- <%@ include file="/WEB-INF/jsp/pc/mypage/include/ootdTopMemu.jsp"%> --%>
				<!-- //my_modify_top_wrap -->
				

				<div class="cate_search_bx">
					<p class="tit">카테고리 설정</p>
					<span class="select">
						<select id="firstDepthCtg" title="1 DEPTH 카테고리 선택" onchange="selectFirstCtg()">
								<option value = "none" selected>1 DEPTH 카테고리 선택</option>
								<c:forEach var="item" items="${firstDepthCtg}">
								<option value = "${item.PRD_CTG_IDX }">${item.PRD_CTG_NM }</option>
								</c:forEach>
						</select>
					</span>
					<span class="select">
						<select id="secondDepthCtg" title="2 DEPTH 카테고리 선택">
							<option id = "secondDepthCtgOpt" value = "none">2 DEPTH 카테고리 선택</option>
						</select>
					</span>
					<button type="button" class="btn inp_register" onclick="inertCtg()">등록</button>
				</div>
				<input type="hidden" id="MEM_CTG_CNT" name="MEM_CTG_CNT" value="<c:out value="${myFavoritecnt }"/>" >
				
				<div class="category_wp">
					<p class="inf_txt">최대 10개까지 등록이 가능합니다.</p>
					<ul class="category_list">
						<c:choose>
							<c:when test="${not empty myFavorite }">
								<c:forEach var="data" items="${myFavorite }" varStatus="status">						
						<li>
							<span class="cate_img"><img src="/nas/cdn/PW/images/@temp/img_temp_category_thumb_01.jpg" alt=""></span>
							<a href="http://pc.localhost:8080/pc/product/productList.do?idx=<c:out value="${data.PRD_CTG_IDX_L2 }"/>"><span class="cate_txt"><c:out value="${data.CTG }"/></span></a>
							<input type="hidden" id="MEM_CTG_IDX" name="MEM_CTG_IDX" value="<c:out value="${data.MEM_CTG_IDX }"/>" >
							<a href="#" onclick="delCtg(); return false;" class="bn_delete"><em class="blind">삭제</em></a>
						</li>
								</c:forEach>
							</c:when>
						</c:choose>							
						<li class="no_data">
							<div class="box">
								<span class="txt">즐겨찾는 카테고리를 등록해주세요.</span>
							</div>
						</li>
					
					</ul>
				</div><!-- //category_wp -->
			</div>
			<!-- //sub_content -->

		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>

$(function(){
	selectFirstCtg = function (){
        var selectFirstCtg = document.getElementById("firstDepthCtg");
        var selectFirstCtgValue = selectFirstCtg.options[selectFirstCtg.selectedIndex].value;
	    $("#secondDepthCtg").children("option:not(:first)").remove();
        
        $.ajax({ 
            type: "GET", 
			url: "<c:out value="${frontDomain}" />/pc/mypage/myFavoriteListAjax.do",
            dataType: "json",
            data: {"PRD_CTG_IDX" : selectFirstCtgValue},
            success: function(data){
              if( data != "none" ) {
            	    var arr= [data.secondDepthCtg];
                    for(var i=0;i<data.secondDepthCtg.length;i++){
                   	 $("#secondDepthCtgOpt").after("<option value ="+data.secondDepthCtg[i].PRD_CTG_IDX+">"+data.secondDepthCtg[i].PRD_CTG_NM+"</option>");
                    }            	    

            }
            },error: function(error) {
             alert(error);
            }
          }); 
    };
});


$(function(){
	inertCtg = function (){
        var selectFirstCtg = document.getElementById("firstDepthCtg");
        var selectFirstCtgValue = selectFirstCtg.options[selectFirstCtg.selectedIndex].value;

        var selectSecondCtg = document.getElementById("secondDepthCtg");
        var selectSecondCtgValue = selectSecondCtg.options[selectSecondCtg.selectedIndex].value;
        
        if ($("#MEM_CTG_CNT").val()> 10){
        	
        	alert("최대 10개까지 등록이 가능합니다.");
        	return false;
        }
        
        
        
    	$.ajax({
			type: "get",
			url: "<c:out value="${serverDomain}"/>/pc/mypage/myPageInertCtgAjax.do",
			data: {"PRD_CTG_IDX1": selectFirstCtgValue,"PRD_CTG_IDX2": selectSecondCtgValue},
			async: false,
			success: function(data)
			{
				if(data.result == "success" )
				{
					document.location.reload(true);
				}
			},
			error : function (err)
			{
		      	alert("오류가 발생하였습니다.\n[" + err.status + "]");
			}
		});	        
    };
});


$(function(){
	delCtg = function (){
        var selectFirstCtg = document.getElementById("firstDepthCtg");
        var selectFirstCtgValue = selectFirstCtg.options[selectFirstCtg.selectedIndex].value;

        var selectSecondCtg = document.getElementById("secondDepthCtg");
        var selectSecondCtgValue = selectSecondCtg.options[selectSecondCtg.selectedIndex].value;
        $.ajax({
			type: "get",
			url: "<c:out value="${serverDomain}"/>/pc/mypage/myPageDelCtgAjax.do",
			data: {"MEM_CTG_IDX": $("#MEM_CTG_IDX").val()},
			async: false,
			success: function(data)
			{
				if(data.result == "success" )
				{
					document.location.reload(true);
				}
			},
			error : function (err)
			{
		      	alert("오류가 발생하였습니다.\n[" + err.status + "]");
			}
		});	        
    };
});

</script>