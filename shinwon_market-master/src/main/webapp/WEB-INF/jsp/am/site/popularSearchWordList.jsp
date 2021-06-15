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

            <div class="container"><!-- container -->

                <h2 class="title"><span>인기 검색어 관리</span></h2>

                <h3 class="title"><span>
                <c:choose>
                    <c:when test="${not empty list }"> 
                        목록/수정         
                    </c:when>   
                    <c:otherwise>
                        등록
                    </c:otherwise>                                      
                    </c:choose> 
                </span></h3>

                <form id="frm" name="frm">
                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                       <colgroup>
                            <col style="width: 5%;" />
                            <col style="width: 5%;" />
                            <col style="width: auto;" />
                            <!-- <col style="width: 10%;" /> -->
                            <col style="width: 15%;" />
                            <col style="width: 13%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th colspan="2">순서</th>
                                <!-- <th>순서</th> -->  
                                <th>검색어</th>
                                <!-- <th>조회수</th> -->
                                <th>아이콘</th>      
                                <th>사용여부</th>
                            </tr>
                        </thead>
                        <tbody class="sort-target">
                             <c:choose>
                                <c:when test="${not empty list  }">                                              
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                                                                 
                                        <tr>
                                            <td class="wrd-sort">
                                                <a href="#none" class="row-sort" data-sort_type="up">△</a>
                                                <a href="#none" class="row-sort" data-sort_type="down">▽</a>
                                                <input type="hidden" name="PPL_WRD_SORT" value="${row.PPL_WRD_SORT }"/>     
                                                <input type="hidden" name="PPL_WRD_IDX"  value="${row.PPL_WRD_IDX }"/>  
                                                <input type="hidden" name="PPL_WRD_HIT_CNT" value = "${row.PPL_WRD_HIT_CNT }"/> 
                                            </td>
                                            <td class="col-sort" data-ppl_wrd_sort="<c:out value="${row.PPL_WRD_SORT}"/>"><c:out value="${row.PPL_WRD_SORT}"/></td>
                                            <td class="col-text" ><input type="text" class="text xlarge" name="PPL_WRD_TEXT" value="<c:out value="${row.PPL_WRD_TEXT }"/>" maxlength="50"/></td>
                                          <%--   <td><c:out value="${row.PPL_WRD_HIT_CNT }"/> </td> --%>
                                          
                                            <td>
                                                <input type="checkbox" class="col-iconHot" name="PPL_WRD_ICON_HOT_<c:out value="${i.index}"/>" id="PPL_WRD_ICON_HOT_<c:out value="${i.index}"/>" <c:if test="${row.PPL_WRD_ICON_HOT eq 'Y' }">checked="checked"</c:if>/>
                                                <label for="PPL_WRD_ICON_HOT_<c:out value="${i.index}"/>">HOT</label>
                                                <input type="checkbox" class="col-iconNew" name="PPL_WRD_ICON_NEW_<c:out value="${i.index}"/>" id="PPL_WRD_ICON_NEW_<c:out value="${i.index}"/>" <c:if test="${row.PPL_WRD_ICON_NEW eq 'Y' }">checked="checked"</c:if>/>
                                                <label for="PPL_WRD_ICON_NEW_<c:out value="${i.index}"/>">NEW</label>
                                            </td>
                                            <td>
                                                <input type="radio" class="col-useYes" name="PPL_WRD_USE_YN_<c:out value="${i.index}"/>" id="PPL_WRD_USE_Y_<c:out value="${i.index}"/>" value="Y" class="radio" <c:if test="${row.PPL_WRD_USE_YN eq 'Y' }">checked="checked"</c:if>/>
                                                <label for="PPL_WRD_USE_Y_<c:out value="${i.index}"/>">사용</label>
                                                <input type="radio" class="col-useNo" name="PPL_WRD_USE_YN_<c:out value="${i.index}"/>"  id="PPL_WRD_USE_N_<c:out value="${i.index}"/>" value="N" class="radio" <c:if test="${row.PPL_WRD_USE_YN eq 'N' }">checked="checked"</c:if>/>
                                                <label for="PPL_WRD_USE_N_<c:out value="${i.index}"/>">미사용</label>
                                           </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>   
                                <c:otherwise>
                                        <c:forEach var="row" begin="0" end="9" varStatus="i">
                                         <tr>
                                            <td class="wrd-sort">
                                                <a href="#none" class="row-sort" data-sort_type="up">△</a>
                                                <a href="#none" class="row-sort" data-sort_type="down">▽</a>
                                                <input type="hidden" name="PPL_WRD_SORT" value="${i.index+1 }"/>   
    
                                            </td>
                                            <td class="col-sort"><c:out value="${i.index+1}"/></td>
                                            <td class="col-text" ><input type="text" class="text xlarge" name="PPL_WRD_TEXT" maxlength="50" /></td>
                                            <td>
                                                <input type="checkbox" class="col-iconHot" name="PPL_WRD_ICON_HOT_<c:out value="${i.index}"/>" id="PPL_WRD_ICON_HOT_<c:out value="${i.index}"/>"/>
                                                <label for="PPL_WRD_ICON_HOT_<c:out value="${i.index}"/>">HOT</label>
                                                <input type="checkbox" class="col-iconNew" name="PPL_WRD_ICON_NEW_<c:out value="${i.index}"/>" id="PPL_WRD_ICON_NEW_<c:out value="${i.index}"/>"/>
                                                <label for="PPL_WRD_ICON_NEW_<c:out value="${i.index}"/>">NEW</label>
                                            </td>
                                            <td>
                                                <input type="radio" class="col-useYes" name="PPL_WRD_USE_YN_<c:out value="${i.index}"/>" id="PPL_WRD_USE_Y_<c:out value="${i.index}"/>" value="Y" class="radio" checked />
                                                <label for="PPL_WRD_USE_Y_<c:out value="${i.index}"/>">사용</label>
                                                <input type="radio" class="col-useNo" name="PPL_WRD_USE_YN_<c:out value="${i.index}"/>" id="PPL_WRD_USE_N_<c:out value="${i.index}"/>" value="N" class="radio" />
                                                <label for="PPL_WRD_USE_N_<c:out value="${i.index}"/>">미사용</label>
                                           </td>
                                        </tr>                                      
                                    </c:forEach>                                              
                                    
                                </c:otherwise>                                      
                            </c:choose> 
                        </tbody>
                    </table><!-- // table -->

                </form>
                
                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <c:choose>
                            <c:when test="${not empty list }"> 
                                <a href="javascript:;" id="goModify" class="button large primary"><span>저장</span></a>
                            </c:when>   
                            <c:otherwise>
                                <a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
                            </c:otherwise>                                      
                        </c:choose> 
                    </div>
                </div><!-- // section-button -->
                
            </div><!-- // container -->

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

<script>    
$(function(){  
        
	// 등록 이벤트
    $(document).on("click", "#goRegist", function() 
    {
        var popularWordCheckFlag = true;

        $.each($("input[name^='PPL_WRD_TEXT']"),function(index,item)
        {                   
            if($.trim($("input[name^='PPL_WRD_TEXT']").eq(index).val()) == "") 
            {   
                alert("[검색어] 10개모두 반드시 입력해 주십시오.");
                popularWordCheckFlag= false;
                return false;
            }
        });
        
        if(popularWordCheckFlag)
        {
             if (confirm("저장 하시겠습니까?")) 
            {
                $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/site/popularSearchWordRegist.do", "target" : "_self", "method" : "post"}).submit();
            }   
        }
    });
	
    $(document).ready(function() 
    {
        // 수정 이벤트
        $(document).on("click", "#goModify", function() 
        {
            var popularWordCheckFlag = true;
  
            $.each($("input[name^='PPL_WRD_TEXT']"),function(index,item)
            {                   
                if($.trim($("input[name^='PPL_WRD_TEXT']").eq(index).val()) == "") 
                {   
                    alert("[검색어] 10개 모두 반드시 입력해 주십시오.");
                    popularWordCheckFlag= false;
                    return false;
                } 
            });
            
            if(popularWordCheckFlag)
            {
                 if (confirm("수정 하시겠습니까?")) 
                { 
                    $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/site/popularSearchWordModify.do", "target" : "_self", "method" : "post"}).submit();
                }   
            }
        });
    });
    
   //인기 검색어 순서 변경 이벤트
   $(document).on("click", ".row-sort", function () {
        
        var $this = $(this);
        var $tr = $this.parent().parent();
        var type = $this.data("sort_type");
        if(type == "up")  
        {
            var $prevTr = $tr.prev(); 
            if($prevTr.length > 0)
            {  
            	alert($prevTr.length);
                /* ------------------------ 아이콘 체크 박스 부분 시작 -----------------------*/
                // this TR 속성 name을 따로 저장
                var thisColIconHotName = $tr.children().find(".col-iconHot").attr('name');      
                var thisColIconNewName = $tr.children().find(".col-iconNew").attr('name');
                // this의 prev 속성 name을 따로 저장
                var prevColIconHotName = $prevTr.children().find(".col-iconHot").attr('name');  
                var prevColIconNewName = $prevTr.children().find(".col-iconNew").attr('name');
                
                
                /* ------------------------ 사용유무 라디오 박스 부분 시작 -----------------------*/
                // this TR 속성 name을 따로 저장
                var thisUseYesName = $tr.children().find(".col-useYes").attr('name');      
                var thisUseNoName = $tr.children().find(".col-useNo").attr('name');
                // this의 prev 속성 name을 따로 저장
                var prevUseYesName = $prevTr.children().find(".col-useYes").attr('name');  
                var prevUseNoName = $prevTr.children().find(".col-useNo").attr('name');
                  
                var $trClone = $tr.clone();  // 우선 this TR 복사          
                $tr.remove();                // 해당 this 삭제
              
                /* ------------------------ 아이콘 체크 박스 부분 -----------------------*/
                // 현재 TR의 name값을 상단 TR name값으로 변경
                $prevTr.children().find(".col-iconHot").attr('name',thisColIconHotName );
                $prevTr.children().find(".col-iconNew").attr('name',thisColIconNewName ); 
                
                // 상단 TR의 nmae값을 현재 TR name값으로 변경 후 
                $trClone.children().find(".col-iconHot").attr('name',prevColIconHotName );
                $trClone.children().find(".col-iconNew").attr('name',prevColIconNewName ); 
                
                /* ------------------------ 사용유무 라디오 박스 부분 -----------------------*/
                // 현재 TR의 name값을 상단 TR name값으로 변경
                $prevTr.children().find(".col-useYes").attr('name',thisUseYesName );
                $prevTr.children().find(".col-useNo").attr('name',thisUseNoName ); 
                
                // 상단 TR의 nmae값을 현재 TR name값으로 변경 후 
                $trClone.children().find(".col-useYes").attr('name',prevUseYesName );
                $trClone.children().find(".col-useNo").attr('name',prevUseNoName ); 
                
                 // prev 상단에 this TR을 생성  
                $prevTr.before($trClone);  
            }  
            else
            {
                alert("최 상위 순서 입니다.");
                return;
            } 
        }
        else
        {
            var $nextTr = $tr.next();
            if($nextTr.length > 0)
            {  
                
                /* ------------------------ 아이콘 체크 박스 부분 시작 -----------------------*/
                // this TR 속성 name을 따로 저장
                var thisColIconHotName = $tr.children().find(".col-iconHot").attr('name');      
                var thisColIconNewName = $tr.children().find(".col-iconNew").attr('name');
                // this의 prev 속성 name을 따로 저장
                var prevColIconHotName = $nextTr.children().find(".col-iconHot").attr('name');  
                var prevColIconNewName = $nextTr.children().find(".col-iconNew").attr('name');
                
                
                /* ------------------------ 사용유무 라디오 박스 부분 시작 -----------------------*/
                // this TR 속성 name을 따로 저장
                var thisUseYesName = $tr.children().find(".col-useYes").attr('name');      
                var thisUseNoName = $tr.children().find(".col-useNo").attr('name');
                // this의 prev 속성 name을 따로 저장
                var prevUseYesName = $nextTr.children().find(".col-useYes").attr('name');  
                var prevUseNoName = $nextTr.children().find(".col-useNo").attr('name');
                
                var $trClone = $tr.clone();  
                $tr.remove();
                
                /* ------------------------ 아이콘 체크 박스 부분 -----------------------*/
                // 현재 TR의 name값을 상단 TR name값으로 변경
                $nextTr.children().find(".col-iconHot").attr('name',thisColIconHotName );
                $nextTr.children().find(".col-iconNew").attr('name',thisColIconNewName ); 
                
                // 상단 TR의 nmae값을 현재 TR name값으로 변경 후 
                $trClone.children().find(".col-iconHot").attr('name',prevColIconHotName );
                $trClone.children().find(".col-iconNew").attr('name',prevColIconNewName ); 
                
                /* ------------------------ 사용유무 라디오 박스 부분 -----------------------*/
                // 현재 TR의 name값을 상단 TR name값으로 변경
                $nextTr.children().find(".col-useYes").attr('name',thisUseYesName );
                $nextTr.children().find(".col-useNo").attr('name',thisUseNoName ); 
                
                // 상단 TR의 nmae값을 현재 TR name값으로 변경 후 
                $trClone.children().find(".col-useYes").attr('name',prevUseYesName );
                $trClone.children().find(".col-useNo").attr('name',prevUseNoName ); 
                $nextTr.after($trClone); //  2
            }
            else
            {
                alert("최 하위 순서 입니다.");
                return;
            }
        }
               
        $(".sort-target").find("tr").each(function (i) {    // col-text
            $(this).find(".wrd-sort").find("input[name='PPL_WRD_SORT']").val(i+1);
            $(this).find(".col-sort").text(i+1);
        });
    });
	
});
</script>

</body>
</html>
