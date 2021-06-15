<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
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
		<div id="contents"><!-- contents -->
			<div class="container">
				<h2 class="title"><span>포인트추가적립률관리</span></h2>
				<div class="clearfix">
					<div id="main_con" style="float: left; padding: 10px;">
						<div class="contents-inner"><!-- contents-inner -->
							<form id="frm" name="frm">
								<input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="2350">
                                <input type="hidden" id="BND_MST_IDX" name="BND_MST_IDX">
								<input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="">
								<input type="hidden" id="DSP_MST_ENV" name="DSP_MST_ENV" value="P">
								<input type="hidden" id="searchGubun" name="searchGubun" value="">
								<input type="hidden" id="brandPointList" name="brandPointList" />
								<div class="table-a">
								
								
									<table class="table-row table-a">
										<colgroup>
											<col style="width: 20%;">
											<col style="width: auto;">
										</colgroup>
										<tbody id="list">
											<c:forEach var="row" items="${brandList}" varStatus="i">
											<c:if test="${row.BND_MST_BRAND_TYPE eq 'I' }">
											<tr>
												 <th>
												     <span>${row.BND_MST_BRAND_NM}</span>
												     <input type="hidden" name="BND_MST_IDX" value="<c:out value="${row.BND_MST_IDX }"/>"/>
												 </th>
												 <td>
													 <div class="point_inp">
														<p>
														    할인율 : 
														  <input type="text" class="text onlyNumber BND_PIT_MIN_RATE text onlyNumber" name="BND_PIT_MIN_RATE" placeholder="0"> % ~ 
														  <input type="text" class="text onlyNumber BND_PIT_MAX_RATE" name="BND_PIT_MAX_RATE" placeholder="0"> % 이하 
														  <input class="text onlyNumber BND_PIT_PIT" type="text" name="BND_PIT_PIT" placeholder="0"> % 포인트 적립 
														  <a href="#none" class="button primary goCategoryMbAdd">+<span></span></a>
														  <input type="hidden" name="BND_PIT_IDX" value="0"/>
														  <input type="hidden" name="BND_PIT_DEL" value=""/>
														  <input type="hidden" name="BND_MST_BRAND_TYPE" value="I"/>
														  
													    </p>
														
														<c:forEach var="point" items="${brandPointList}" varStatus="i">
															<c:if test="${row.BND_MST_IDX eq point.BND_MST_IDX && point.BND_PIT_PIT eq null}">
																<p>
																    할인율 : 
																  <input type="text" class="text onlyNumber BND_PIT_MIN_RATE" name="BND_PIT_MIN_RATE" placeholder="0" value="<c:out value="${point.BND_PIT_MIN_RATE }"/>" /> % ~ 
																  <input class="text onlyNumber BND_PIT_MAX_RATE" type="text" name="BND_PIT_MAX_RATE" placeholder="0" value="<c:out value="${point.BND_PIT_MAX_RATE }"/>"> % 이하 
																  <input class="text onlyNumber BND_PIT_PIT" type="text" name="BND_PIT_PIT" placeholder="0" value="0"> % 포인트 적립 
																  <a href="#none" class="button goCategoryPcDelete"><span>-</span></a>
		                                                          <input type="hidden" name="BND_PIT_IDX" value="<c:out value="${point.BND_PIT_IDX }"/>"/>
		                                                          <input type="hidden" name="BND_PIT_DEL" value=""/>
		                                                          <input type="hidden" name="BND_MST_BRAND_TYPE" value="<c:out value="${point.BND_MST_BRAND_TYPE }"/>"/>														  
																</p>
															</c:if>
															<c:if test="${row.BND_MST_IDX eq point.BND_MST_IDX && point.BND_PIT_PIT ne null}">
																<p>
																     할인율 : 
																   <input type="text" class="text onlyNumber BND_PIT_MIN_RATE" name="BND_PIT_MIN_RATE" placeholder="0" value="<c:out value="${point.BND_PIT_MIN_RATE }"/>" /> % ~ 
																   <input class="text onlyNumber BND_PIT_MAX_RATE" type="text" name="BND_PIT_MAX_RATE" placeholder="0" value="<c:out value="${point.BND_PIT_MAX_RATE }"/>"> % 이하 
																   <input class="text onlyNumber BND_PIT_PIT" type="text" name="BND_PIT_PIT" placeholder="0" value="<c:out value="${point.BND_PIT_PIT }"/>"> % 포인트 적립 
																   <a href="#none" class="button goCategoryPcDelete"><span>-</span></a>
																   <input type="hidden" name="BND_PIT_IDX" value="<c:out value="${point.BND_PIT_IDX }"/>"/>
		                                                           <input type="hidden" name="BND_PIT_DEL" value=""/>
		                                                           <input type="hidden" name="BND_MST_BRAND_TYPE" value="<c:out value="${point.BND_MST_BRAND_TYPE }"/>"/>															   
																</p>
															</c:if>
														</c:forEach>
													 </div>
												 </td>
											</tr>
										    </c:if>											
											</c:forEach>
											<!--  
											<tr>
												<th><span>타사입점사</span></th>
												<td>
													<div class="point_inp">
														<p>할인율 : <input type="text" class="text" name="" placeholder="0" value=""> % ~ <input class="text" type="text" name="" placeholder="0" value=""> % 이하 <input class="text" type="text" name="" placeholder="0" value=""> % 포인트 적립 <a href="#none" class="button primary goCategoryMbAdd">+<span></span></a></p>
													</div>
												</td>
											</tr>
											-->
										</tbody>

									</table>
									
									
									
									<table class="table-row table-a">
										<colgroup>
											<col style="width: 20%;">
											<col style="width: auto;">
										</colgroup>
										<tbody id="listOut">
											<c:forEach var="row" items="${brandList}" varStatus="i">
											<c:if test="${row.BND_MST_BRAND_TYPE eq 'O' }">
											<tr>
												 <th>
												     <span>${row.BND_MST_BRAND_NM}</span>
												     <input type="hidden" name="BND_MST_IDX" value="<c:out value="${row.BND_MST_IDX }"/>"/>
												 </th>
												 <td>
													 <div class="point_inp">
														<p>
														    할인율 : 
														  <input type="text" class="text onlyNumber BND_PIT_MIN_RATE text onlyNumber" name="BND_PIT_MIN_RATE" placeholder="0"> % ~ 
														  <input type="text" class="text onlyNumber BND_PIT_MAX_RATE" name="BND_PIT_MAX_RATE" placeholder="0"> % 이하 
														  <input class="text onlyNumber BND_PIT_PIT" type="text" name="BND_PIT_PIT" placeholder="0"> % 포인트 적립 
														  <a href="#none" class="button primary goCategoryMbAddOUT">+<span></span></a>
														  <input type="hidden" name="BND_PIT_IDX" value="0"/>
														  <input type="hidden" name="BND_PIT_DEL" value=""/>
														  <input type="hidden" name="BND_MST_BRAND_TYPE" value="O"/>
													    </p>
														
														<c:forEach var="point" items="${brandPointList}" varStatus="i">
															<c:if test="${row.BND_MST_IDX eq point.BND_MST_IDX && point.BND_PIT_PIT eq null}">
																<p>
																    할인율 : 
																  <input type="text" class="text onlyNumber BND_PIT_MIN_RATE" name="BND_PIT_MIN_RATE" placeholder="0" value="<c:out value="${point.BND_PIT_MIN_RATE }"/>" /> % ~ 
																  <input class="text onlyNumber BND_PIT_MAX_RATE" type="text" name="BND_PIT_MAX_RATE" placeholder="0" value="<c:out value="${point.BND_PIT_MAX_RATE }"/>"> % 이하 
																  <input class="text onlyNumber BND_PIT_PIT" type="text" name="BND_PIT_PIT" placeholder="0" value="0"> % 포인트 적립 
																  <a href="#none" class="button goCategoryPcDelete"><span>-</span></a>
		                                                          <input type="hidden" name="BND_PIT_IDX" value="<c:out value="${point.BND_PIT_IDX }"/>"/>
		                                                          <input type="hidden" name="BND_PIT_DEL" value=""/>
		                                                          <input type="hidden" name="BND_MST_BRAND_TYPE" value="<c:out value="${point.BND_MST_BRAND_TYPE }"/>"/>														  
																</p>
															</c:if>
															<c:if test="${row.BND_MST_IDX eq point.BND_MST_IDX && point.BND_PIT_PIT ne null}">
																<p>
																     할인율 : 
																   <input type="text" class="text onlyNumber BND_PIT_MIN_RATE" name="BND_PIT_MIN_RATE" placeholder="0" value="<c:out value="${point.BND_PIT_MIN_RATE }"/>" /> % ~ 
																   <input class="text onlyNumber BND_PIT_MAX_RATE" type="text" name="BND_PIT_MAX_RATE" placeholder="0" value="<c:out value="${point.BND_PIT_MAX_RATE }"/>"> % 이하 
																   <input class="text onlyNumber BND_PIT_PIT" type="text" name="BND_PIT_PIT" placeholder="0" value="<c:out value="${point.BND_PIT_PIT }"/>"> % 포인트 적립 
																   <a href="#none" class="button goCategoryPcDelete"><span>-</span></a>
																   <input type="hidden" name="BND_PIT_IDX" value="<c:out value="${point.BND_PIT_IDX }"/>"/>
		                                                           <input type="hidden" name="BND_PIT_DEL" value=""/>
		                                                           <input type="hidden" name="BND_MST_BRAND_TYPE" value="<c:out value="${point.BND_MST_BRAND_TYPE }"/>"/>															   
																</p>
															</c:if>
														</c:forEach>
													 </div>
												 </td>
											</tr>
										    </c:if>											
											</c:forEach>
										</tbody>

									</table>
									
																		
									
									<div class="section-button"><!-- section-button -->
										<div class="wrap text-center">
											<a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="quickmenu" class="aside right"><!-- quickmenu-->
			<%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
	</div><!-- // quickmenu -->
</div><!-- // container -->
<div id="footer">
	<%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>

	$('.goCategoryMbAdd').on("click",function () {
			$(this).parent().parent().append (
							'<p>할인율 : <input type="text" class="text onlyNumber BND_PIT_MIN_RATE" name="text onlyNumber BND_PIT_MIN_RATE" placeholder="0"> % ~ <input class="text onlyNumber BND_PIT_MAX_RATE" type="text" name="BND_PIT_MAX_RATE" placeholder="0"> % 이하 <input class="BND_PIT_PIT" type="text" name="BND_PIT_PIT" placeholder="0"> % 포인트 적립 <a href="#none" class="button goCategoryPcDelete"><span>-</span></a><input type="hidden" name="BND_PIT_IDX" value="0"/><input type="hidden" name="BND_PIT_DEL" value=""/> <input type="hidden" name="BND_MST_BRAND_TYPE" value="I"/></p>'
			);
			
			  
				  
	});// end append
	

	$('.goCategoryMbAddOUT').on("click",function () {
		$(this).parent().parent().append (
						'<p>할인율 : <input type="text" class="text onlyNumber BND_PIT_MIN_RATE" name="BND_PIT_MIN_RATE" placeholder="0"> % ~ <input class="text onlyNumber BND_PIT_MAX_RATE" type="text" name="BND_PIT_MAX_RATE" placeholder="0"> % 이하 <input class="text onlyNumber BND_PIT_PIT" type="text" name="BND_PIT_PIT" placeholder="0"> % 포인트 적립 <a href="#none" class="button goCategoryPcDelete"><span>-</span></a><input type="hidden" name="BND_PIT_IDX" value="0"/><input type="hidden" name="BND_PIT_DEL" value=""/> <input type="hidden" name="BND_MST_BRAND_TYPE" value="O"/></p>'
		);
		
	});// end append		  
			  
	
	
	
	
	$(document).on("click",".goCategoryPcDelete",function () {
		//삭제 : 삭제 처리 태그를 변경 시키고 화면에서 숨긴다. 
		
			//$(this).parent().remove();
			var thisP = $(this).parent();
			var vBND_PIT_IDX = thisP.find("input[name=BND_PIT_IDX]").val() ;
			
			if ( vBND_PIT_IDX == 0 || vBND_PIT_IDX == '' ) {
				//신규 동적 생성했다가 삭제한 경우 
				thisP.remove();
			}else{
				//기존 값이 있었는데 삭제처리하는 경우 
				thisP.find("input[name=BND_PIT_DEL]").val( 'D' ) ;
				thisP.hide();				
			}
			
	});
	
	$(document).on("click", "#goRegist",function() {
		var validation = true;

		

		//초기화
		$("#brandPointList").val('');
		
		var data =  new Array();
		$("#list tr").each(function(){
			var BND_MST_IDX = $(this).find("input[name=BND_MST_IDX]").val();
			
			
			$(this).find("p").each(function(){
				
				var vBND_PIT_MIN_RATE = $(this).find("input[name=BND_PIT_MIN_RATE]").val();
				var vBND_PIT_MAX_RATE = $(this).find("input[name=BND_PIT_MAX_RATE]").val();
				var vBND_PIT_PIT      = $(this).find("input[name=BND_PIT_PIT]").val();
				var vBND_PIT_DEL      = $(this).find("input[name=BND_PIT_DEL]").val();
				var vBND_PIT_IDX      = $(this).find("input[name=BND_PIT_IDX]").val();	

				
				// 유효성 검사
				if ( ( vBND_PIT_MIN_RATE == '' || vBND_PIT_MAX_RATE == '' || vBND_PIT_PIT == '' ) && 
					  !( vBND_PIT_MIN_RATE == '' && vBND_PIT_MAX_RATE == '' && vBND_PIT_PIT == '' )  ){
					
					console.log (  ' 필수요소중에서 3개중 한개라도 공백인 경우 ' + vBND_PIT_MIN_RATE   );
					
					if (  vBND_PIT_MIN_RATE == ''  ){
						alert("최소 할인율을 입력해주세요.");
						$(this).find("input[name=BND_PIT_MIN_RATE]").focus();
						validation = false;
						return;
					} 
					
					if (  vBND_PIT_MAX_RATE == ''  ){
						alert("최대 할인율을 입력해주세요.");
						$(this).find("input[name=BND_PIT_MAX_RATE]").focus();
						validation = false;						
						return;
					} 	

					if (  vBND_PIT_PIT == ''  ){
						alert("적립률을 입력해주세요.");
						$(this).find("input[name=BND_PIT_PIT]").focus();
						validation = false;						
						return;
					} 						
				
				}

				
				
				
				if(  (vBND_PIT_MIN_RATE != '' && vBND_PIT_MIN_RATE != null && vBND_PIT_MIN_RATE != undefined &&
					  vBND_PIT_MAX_RATE != '' && vBND_PIT_MAX_RATE != null && vBND_PIT_MAX_RATE != undefined &&
					  vBND_PIT_PIT != '' && vBND_PIT_PIT != null && vBND_PIT_PIT != undefined
					 ) || (  vBND_PIT_DEL == 'D')  
				  ){
					
					
					if (  vBND_PIT_MIN_RATE > vBND_PIT_MAX_RATE   ){
						alert("최소할인율이 최대할인율 보다 크게 입력되었습니다.\n올바른 최소할인율을 입력하세요");
						$(this).find("input[name=BND_PIT_MIN_RATE]").focus();
						validation = false;						
						return;
					} 	
					
					
					
					var vBND_PIT_TYPE = '';
					if ( vBND_PIT_DEL == 'D'  ) {
						vBND_PIT_TYPE = 'DEL';
					}else if ( vBND_PIT_IDX == '0' || vBND_PIT_IDX == '' ) {
						vBND_PIT_TYPE = 'NEW';
					}else{
						vBND_PIT_TYPE = 'UPD';						
					}
					
					var vBND_MST_BRAND_TYPE      = $(this).find("input[name=BND_MST_BRAND_TYPE]").val();	
					

					var object = new Object();
					object.BND_PIT_TYPE     = vBND_PIT_TYPE;					
					object.BND_MST_IDX      = BND_MST_IDX;
					object.BND_PIT_IDX      = vBND_PIT_IDX;					
					object.BND_PIT_MIN_RATE = vBND_PIT_MIN_RATE;
					object.BND_PIT_MAX_RATE = vBND_PIT_MAX_RATE;
					object.BND_PIT_PIT      = vBND_PIT_PIT;
					object.BND_MST_BRAND_TYPE  = vBND_MST_BRAND_TYPE;

					data.push(object);					
				}

			}); 
		}); 
		

		$("#listOut tr").each(function(){
			var BND_MST_IDX = $(this).find("input[name=BND_MST_IDX]").val();
			
			
			$(this).find("p").each(function(){
				
				var vBND_PIT_MIN_RATE = $(this).find("input[name=BND_PIT_MIN_RATE]").val();
				var vBND_PIT_MAX_RATE = $(this).find("input[name=BND_PIT_MAX_RATE]").val();
				var vBND_PIT_PIT      = $(this).find("input[name=BND_PIT_PIT]").val();
				var vBND_PIT_DEL      = $(this).find("input[name=BND_PIT_DEL]").val();
				var vBND_PIT_IDX      = $(this).find("input[name=BND_PIT_IDX]").val();	
				
				// 유효성 검사
				if ( ( vBND_PIT_MIN_RATE == '' || vBND_PIT_MAX_RATE == '' || vBND_PIT_PIT == '' ) && 
					  !( vBND_PIT_MIN_RATE == '' && vBND_PIT_MAX_RATE == '' && vBND_PIT_PIT == '' )  ){
					
					console.log (  ' 필수요소중에서 3개중 한개라도 공백인 경우 ' + vBND_PIT_MIN_RATE   );
					
					if (  vBND_PIT_MIN_RATE == ''  ){
						alert("최소 할인율을 입력해주세요.");
						$(this).find("input[name=BND_PIT_MIN_RATE]").focus();
						validation = false;						
						return;
					} 
					
					if (  vBND_PIT_MAX_RATE == ''  ){
						alert("최대 할인율을 입력해주세요.");
						$(this).find("input[name=BND_PIT_MAX_RATE]").focus();
						validation = false;						
						return;
					} 	

					if (  vBND_PIT_PIT == ''  ){
						alert("적립률을 입력해주세요.");
						$(this).find("input[name=BND_PIT_PIT]").focus();
						validation = false;						
						return;
					} 						
				
				}
				
				
				if(  (vBND_PIT_MIN_RATE != '' && vBND_PIT_MIN_RATE != null && vBND_PIT_MIN_RATE != undefined &&
					  vBND_PIT_MAX_RATE != '' && vBND_PIT_MAX_RATE != null && vBND_PIT_MAX_RATE != undefined &&
					  vBND_PIT_PIT != '' && vBND_PIT_PIT != null && vBND_PIT_PIT != undefined
					 ) || (  vBND_PIT_DEL == 'D')  
				  ){
					
					
					if (  vBND_PIT_MIN_RATE > vBND_PIT_MAX_RATE   ){
						alert("최소할인율이 최대할인율 보다 크게 입력되었습니다.\n올바른 최소할인율을 입력하세요");
						$(this).find("input[name=BND_PIT_MIN_RATE]").focus();
						validation = false;						
						return;
					} 						
					
					
					var vBND_PIT_TYPE = '';
					if ( vBND_PIT_DEL == 'D'  ) {
						vBND_PIT_TYPE = 'DEL';
					}else if ( vBND_PIT_IDX == '0' || vBND_PIT_IDX == '' ) {
						vBND_PIT_TYPE = 'NEW';
					}else{
						vBND_PIT_TYPE = 'UPD';						
					}
					
					var vBND_MST_BRAND_TYPE      = $(this).find("input[name=BND_MST_BRAND_TYPE]").val();	
					

					var object = new Object();
					object.BND_PIT_TYPE     = vBND_PIT_TYPE;					
					object.BND_MST_IDX      = BND_MST_IDX;
					object.BND_PIT_IDX      = vBND_PIT_IDX;					
					object.BND_PIT_MIN_RATE = vBND_PIT_MIN_RATE;
					object.BND_PIT_MAX_RATE = vBND_PIT_MAX_RATE;
					object.BND_PIT_PIT      = vBND_PIT_PIT;
					object.BND_MST_BRAND_TYPE  = vBND_MST_BRAND_TYPE;

					data.push(object);					
				}

			}); 
		}); 		
		
		var jsonData = JSON.stringify(data);
		$("#brandPointList").val(jsonData);
		
		
		var url = "<c:out value="${serverDomain}"/>/am/product/brandPointRegist.do";
		if ( validation ) {
			$("#frm").attr({"action" : url, "target" : "_self", "method" : "post"}).submit();			
		}
 
	});
	
	
    var _insertComma = function(num, currency, fixed) {
        num = num + '';
        var number = '';
        if(num != undefined && num != null && num != '') {
            number = parseFloat(num.replace(/,/g, '')) + '';
            
            var reg = /(^[+-]?\d+)(\d{3})/;
            
            while(new RegExp(reg).test(number)){
                number = number.replace(reg, '$1' + ',' + '$2');
            }
            if(fixed) { 
                if(num.indexOf('.') != -1) {
                    number = number + num.substring(num.indexOf('.'), num.length);
                } else {
                    number = number;
                }
            }
            
            if(undefined != currency & '' != currency) {
                number = number + currency;
            }               
        }
        return number;
    };	
	
		
//-->
</script>

</body>
</html>
