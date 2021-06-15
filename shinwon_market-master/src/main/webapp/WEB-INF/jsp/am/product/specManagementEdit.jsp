<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="frm" name="frm" method="post" action="">
<input type="hidden" id="SPC_MST_IDX" name="SPC_MST_IDX" value="${categoryProductView.SPC_MST_IDX}" />
<input type="hidden" id="SPC_MST_UP_IDX" name="SPC_MST_UP_IDX" value="${categoryProductView.SPC_MST_UP_IDX}" />
<input type="hidden" id="SPC_MST_TOP_IDX" name="SPC_MST_TOP_IDX" value="${categoryProductView.SPC_MST_TOP_IDX}" />
<input type="hidden" id="SPC_MST_LEVEL" name="SPC_MST_LEVEL" value="${categoryProductView.SPC_MST_LEVEL}" />
<input type="hidden" id="SPC_MST_SORT" name="SPC_MST_SORT" value="${categoryProductView.SPC_MST_SORT}" />
<input type="hidden" id="CHILD_CODENAME" name="CHILD_CODENAME" value="" />
<c:choose>    
<c:when test="${categoryProductView.SPC_MST_IDX > 0 }" >
<input type="hidden" id="SPC_MST_ENV"   name="SPC_MST_ENV"   value="${categoryProductView.SPC_MST_ENV}" />
</c:when>
<c:otherwise>
<input type="hidden" id="SPC_MST_ENV"   name="SPC_MST_ENV"   value="${commandMap.SPC_MST_ENV}" />
</c:otherwise>
</c:choose>

    <h3 class="title"><span>스펙 상세</span></h3>
    
    <!-- 
    <p>
        <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
    </p>    
     -->
     
    <div class="section-form"><!-- section-form-a -->
    
        <table cellspacing="0" class="table-row table-a"><!-- table -->
            <colgroup>
                <col style="width: 15%; min-width: 180px;" />
                <col style="width: auto;" />
            </colgroup>
            <tbody>
                <c:choose>    
                    <c:when test="${categoryProductView.SPC_MST_IDX > 0 }" >
                        <tr>
                            <th><span>스펙ID</span></th>
                            <td>
                                <c:out value="${categoryProductView.SPC_MST_IDX}" />
                            </td>
                        </tr>
                        <tr>
                            <th><span>현재위치</span></th>
                            <td>
                                <c:out value="${categoryProductView.SPC_MST_LVL_NM }"/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>스펙명</span></th>
                            <td>
                                <input type="text" id="SPC_MST_NM" name="SPC_MST_NM" class="text" value="<c:out value="${categoryProductView.SPC_MST_NM }"/>" />
                            </td>
                        </tr>
                        <tr>
                            <th><span>스펙 사용여부</span></th>
                            <td>
                                <label><input type="radio" class="radio" id="SPC_MST_USE_YN1" name="SPC_MST_USE_YN" value="Y" <ui:select v="${categoryProductView.SPC_MST_USE_YN }" t="Y" g="checked"/>/>사용</label>
                                <label><input type="radio" class="radio" id="SPC_MST_USE_YN2" name="SPC_MST_USE_YN" value="N" <ui:select v="${categoryProductView.SPC_MST_USE_YN }" t="N" g="checked"/>/>미사용</label>
                            </td>
                        </tr>
                        <tr>
                            <th><span>하위 스펙 수</span></th>
                            <td>
                                <c:out value="${categoryProductView.CHILD_CNT}" />             
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${categoryProductView.SPC_MST_LEVEL < 4}">
                            <tr>
                                <th><span>하위 스펙 수</span></th>
                                <td>
                                    <c:out value="${fn:length(list)}" />             
                                </td>
                            </tr>
                        </c:if>
                    </c:otherwise>
                </c:choose> 
                <c:if test="${categoryProductView.SPC_MST_LEVEL < 4}">
                    <tr>
                        <th><span>하위 스펙 정렬</span></th>
                        <td>
                            <small>* 하위스펙을 순서를 변경하실 수 있습니다.</small>
                            </br>             
                            <c:choose>
                                <c:when test="${not empty list}">
                                    <ul style="width:300px;">
                                    <c:forEach var="item" items="${list }" varStatus="status">
                                        <li style="padding: 5px 10px;margin-top:2px;">
                                            <a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
                                            <a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
                                            ${item.SPC_MST_NM }<c:if test="${item.SPC_MST_USE_YN ne 'Y' }">[미사용]</c:if>
                                            <input type="hidden" name="SPC_MST_IDXs" value="${item.SPC_MST_IDX }"/>
                                        </li> 
                                    </c:forEach> 
                                    </ul> 
                                </c:when>
                                <c:otherwise>
                                       등록 된 하위 스펙이 없습니다.
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table><!-- // table -->
        
        <c:if test="${categoryProductView.SPC_MST_IDX > 0 }" >
            <div class="section-button"><!-- section-button -->
                <div class="wrap text-right">
                    <a href="javascript:goDel();" class="button"><span>삭제</span></a>
                    <a href="javascript:goProc();" class="button primary"><span>저장</span></a>
                </div>
            </div><!-- // section-button -->
        </c:if>
    
        <c:if test="${categoryProductView.SPC_MST_LEVEL eq 3}">
        <h3 class="title"><span>등록 카테고리 목록</span></h3>
    	
            <table cellspacing="0" class="table-col table-b"><!-- table -->
                <colgroup>
                    <col style="width: 5%;" />
                    <col style="width: 10%;" />
                    <col style="width: auto;" />
                </colgroup>
                <thead>
                    <tr>
                        <th>NO</th>
                        <th>채널</th>
                        <th>카테고리</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
    	            	<c:when test="${not empty specList}">
                        	<c:forEach var="specList" items="${specList }" varStatus="status">
    	                        <tr>
    	                            <td>
    	                                <c:out value="${specList.RNUM}" />
    	                            </td>
    	                            <td><c:out value="${specList.PRD_CTG_ENV eq 'P' ? 'PC':'MOBILE'}" /></td>
    	                            <td><c:out value="${specList.PRD_CTG_LVL_NM}" /></td>
    	                        </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                               <tr>
                                   <td colspan="3" align="center">카테고리 내역이 없습니다.</td>
                               </tr>
                    </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
    	</c:if>
	
    </div>
    
</form>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>

<script type="text/javascript">
$(function() {

    // 스펙 순서 변경 이벤트
    $(document).off("click", ".row-sort");
    $(document).on("click", ".row-sort", function () {
         
        var $this = $(this);  
        var $li = $this.parent();
        
        var type = $this.data("sort_type");
        if(type == "up")
        {
            var $prevLi = $li.prev(); 
            if($prevLi.length > 0)
            {  
                var $liClone = $li.clone();  // 우선 this TR 복사   
                $prevLi.before($liClone);    // prev 상단에 this li를 생성  
                $li.remove();                // 해당 this 삭제
            }  
            else
            { 
                alert("최 상위 순서 입니다.");
                return;
            } 
        }
        else
        {
            var $nextLi = $li.next();
            if($nextLi.length > 0)
            {  
                var $liClone = $li.clone();  // 우선 this TR 복사   
                $nextLi.after($liClone);     // next 하단에 this li를 생성  
                $li.remove();                // 해당 this 삭제
            } 
            else
            {
                alert("최 하위 순서 입니다.");
                return;
            }
        }  
    });
    
    // 스펙 순서 저장 이벤트
    goProc = function(){
		if (confirm( "저장 하시겠습니까?"))
		{
        	$("#frm").attr({"action":"<c:out value="${serverDomain}"/>/am/product/specManagementModify.do", "target":"_self", "method":"post"}).submit();
        }	
    };
     
    // 상품카테고리 삭제 처리
    goDel = function(){
 		if (confirm( "선택한 내용을 삭제 하시겠습니까?"))
 		{
         	$("#frm").attr({"action":"<c:out value="${serverDomain}"/>/am/product/specManagementDelete.do", "target":"_self", "method":"post"}).submit();
        }	
    };  
    
    // 상품카테고리 저장 처리
    goRegist = function(params){
        $("#CHILD_CODENAME").val(params.CHILD_CODENAME);
        $("#SPC_MST_LEVEL").val(params.SPC_MST_LEVEL);
        $("#SPC_MST_IDX").val(params.SPC_MST_IDX);
        $("#SPC_MST_TOP_IDX").val(params.SPC_MST_TOP_IDX);
        $("#SPC_MST_USE_YN").val("Y"); 
         
        $("#frm").attr({"action":"<c:out value="${serverDomain}"/>/am/product/specManagementRegist.do", "target":"_self", "method":"post"}).submit();
     };
});
</script>