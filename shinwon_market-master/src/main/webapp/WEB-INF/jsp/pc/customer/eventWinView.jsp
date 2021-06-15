<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>

<body class="page-customer"><!-- page class : page-helpdesk -->

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
<!-- #container S -->
    <article id="container" class="container">
        <div class="minW contents"><!-- contents S -->

            <dl class="loc">
                <dt class="blind">현제 카테고리 경로</dt>
                <dd class="f"><a href="javascript:void(0)" class="ico_home"><span class="ir">홈</span></a></dd>
                <dd><a href="javascript:void(0)"><span>고객센터</span></a></dd>
                <dd class="l"><a href="javascript:void(0)"><span>당첨자발표</span></a></dd>
            </dl>

            <%@ include file="/WEB-INF/jsp/pc/include/customer/aside.jsp" %>

            <div id="body"><!-- #body -->

                <h3 class="title">당첨자 발표</h3> 
                            
                <table class="bbs-view"><!-- bbs-view -->
                <caption>제목, 등록일, 조회수로 구성된 당첨자 발표 게시글 상세테이블 입니다.</caption>
                <colgroup>
                    <col style="width: 120px;" />
                    <col style="width: auto;" />
                    <col style="width: 120px;" />
                    <col style="width: auto;" />
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span>제목</span></th>
                        <td colspan="3">
                            <c:out value="${row.EVT_WIN_NM }" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>등록일</span></th>
                        <td>
                           <ui:formatDate value="${row.EVT_WIN_REG_DT }" pattern="yyyy-MM-dd"/> 
                        </td>
                        <th scope="row"><span>조회수</span></th>
                        <td>
                           <fmt:formatNumber value="${row.EVT_WIN_CNT}" groupingUsed="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <div class="holder">

                                <div class="winner-wrap"><!-- winner-wrap -->
                                    <div class="title">
                                        <c:out value="${row.EVT_MST_TITLE }" />
                                    </div>
                                    <div class="object">
                                        <img src="<c:out value="${cdnDomain }"/>/pc/img/custom/winner_obj.png" alt=" 당첨을 축하드립니다! Congratulation!" />
                                    </div>
                                    <div class="copy">
                                        <p class="main">
											<c:out value="${row.EVT_WIN_MAN_CPY }" escapeXml="false" />                                            	
                                        </p>
                                        <p class="sub">
                                            <c:out value="${row.EVT_WIN_SUB_CPY }" escapeXml="false" />
                                        </p>
                                        <p class="notice">
                                            <c:out value="${row.EVT_WIN_ATN }" escapeXml="false" />
                                        </p>
                                    </div>
                                    <div class="inner">
                                        <div class="check-form">
                                            <p class="message notice-c">휴대폰번호 뒷자리를 검색해보세요.</p>
                                            <div>
                                                <input type="text" class="text" name="winSearchKey" id="winSearchKey" maxlength="4" />
                                                <a href="javascript:;" class="btn_st0 btn_blk777" id="winSearchBtn"><span>검색</span></a>
                                            </div>
                                        </div>
										<c:choose>
											<c:when test="${not empty winList }">
												<c:set var="ORG_WIN_INF_NM" value="" />
												<c:forEach items="${winList}" var="row" varStatus="sta">
													
														<c:if test="${row.WIN_INF_NM ne ORG_WIN_INF_NM}">
															<c:if test="${!sta.first }">
																	</ul>
							                                            </div>
							                                        </div><!-- // winner-list -->
															</c:if>
															<div class="winner-list"><!-- winner-list -->
					                                            <h4><c:out value="${row.WIN_INF_NM }" /></h4>
					                                            <div class="list">
					                                            	<ul>
														</c:if>
																		<li><c:out value="${row.WIN_INF_MEM_NM }" />(<c:out value="${row.WIN_INF_MEM_HP3 }" />)</li>
															<c:if test="${sta.last }">
																	</ul>
							                                            </div>
							                                        </div><!-- // winner-list -->
															</c:if>
														<c:set var="ORG_WIN_INF_NM" value="${row.WIN_INF_NM }" />
													
		                                        </c:forEach>
											</c:when>
										</c:choose>

                                    </div>
                                </div><!-- // winner-wrap -->   

                            </div>
                        </td>
                    </tr>
                </tbody>
                </table><!-- // bbs-view -->

                <div class="section-button ar"><!-- section-button -->
                    <a href="javascript:;" class="btn_st1 btn_blk777" id="goList"><span>목록</span></a>
                </div><!-- // section-button -->

            </div><!-- // #body -->

		</div><!--// .contents E -->
	</article>
	<!--// #container E -->
	
	
	<form id="frm" name="frm">
		<input type="hidden" name="EVT_WIN_IDX" value="" />
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
	</form>   
	
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	<script type="text/javascript">
		$(function(){
			//목록
			$(document).on("click","#goList",function(){
				$("#frm").attr({"action":"<c:out value="${frontDomain}"/>/pc/customer/eventWinList.do", "target":"_self", "method":"get"}).submit();
			});
		
			$(document).on("click", "#winSearchBtn", function(){
				if($("#winSearchKey").val() == ""){
					alert("휴대폰 뒷자리를 입력하세요");
					return;
				}else{
					searchWin();
				}
			});
			

			$(document).on("keyup", "#winSearchKey", function(key){
				if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
		            searchWin();
		        }else{
		        	$(this).val( $(this).val().replace(/[^0-9]/gi,"") );
		        }
			});
			
			searchWin 	= function(){
		        //검색 찾는 로직 구현
		        $.ajax({
		        	async 	: false,
		        	type 	: "POST",
		        	data	: {
		        		"EVT_MST_IDX" 	: "<c:out value="${commandMap.EVT_MST_IDX}" />",
		        		"SEARCHKEY"		:  $("#winSearchKey").val()
		        	},
		        	url		: "<c:out value="${frontDomain}" />/pc/customer/eventWinSearchAjax.do",
					success : function(data) {
						alert(data.strResultMsg);
					},
					error 	: function(err) {
						//alert("오류가 발생하였습니다.\n[" + err.status + "]");
						window.jquery
								|| console
										.log('오류가 발생하였습니다: ' + err.status);
					}
		        });
		    };
		});
	</script>

</html>