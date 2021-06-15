<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="contents-inner"><!-- contents-inner -->

	<h3 class="title"><span>대표채널상세정보</span></h3>
	
	<table cellspacing="0" class="table-row table-a"><!-- table -->
		<colgroup>
			<col style="width: 20%;" />
			<col style="width: 50%;" />
		</colgroup>
		<tbody>
			<tr>
				<th><label class="label"><span>채널구분</span></label></th>
				<td>
					<c:out value="${row.CHN_MST_UP_IDX_NM }"/>
					<input type="hidden" id="CHN_MST_UP_IDX_NM" name="CHN_MST_UP_IDX_NM" value="<c:out value="${row.CHN_MST_UP_IDX_NM }"/>">
				</td>
			</tr>
			<tr><!-- row -->
				<th><label class="label"><span>대표채널명 <i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<c:out value="${row.CHN_MST_NM }"/>
					<input type="hidden" id="CHN_MST_NM" name="CHN_MST_NM" value="<c:out value="${row.CHN_MST_NM }"/>">
				</td>
			</tr>
			
			<tr>
				<th><label class="label"><span>대표채널코드<i class="require"><em>필수입력</em></i></span></label></th>
				<td>
					<input type="hidden" name="CHN_MST_IDX" id="CHN_MST_IDX" value="<c:out value="${row.CHN_MST_IDX }"/>" />
					<c:out value="${row.CHN_MST_IDX }"/>
				</td>
			</tr>
			
		</tbody>
	</table><!-- // table -->

	<h3 class="title"><span>하위채널정보</span></h3>
	<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
		<div class="text-right">
			<a href="javascript:goRegistDtl();" id="goRegistDtl" class="button small primary"><span>하위채널등록</span></a>
		</div>
	</div><!-- // 목록 상단 버튼 -->
	<table class="table-col table-b">
		<colgroup>
			<col style="width: 15%;" />
			<col style="width: 20%;" />
			<col style="width: 30%;" />
			<col style="width: 15%;" />
			<col style="width: 10%;" />
		</colgroup>
		<thead>
			<tr>
				<th>채널코드</th>
				<th>채널명</th>
				<th>기간</th>
				<th>수수료</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody class="sort-target">
			<c:choose>
		    	<c:when test="${not empty list}">
			    	<c:forEach var="row" items="${list }" varStatus="i">
					<tr>
					    <td>
							<c:out value="${row.CHN_DTL_CD }" />
					    </td>
					    <td class="left">
						    <a href="javascript:goView('<c:out value="${row.CHN_DTL_CD }" />');">
						        <c:out value="${row.CHN_DTL_NM }" />
						    </a>
					    </td>
					    <td>
						    <ui:formatDate value="${row.CHN_DTL_ST_DT }" pattern="yyyy.MM.dd"/> ~ 
						    <ui:formatDate value="${row.CHN_DTL_ED_DT }" pattern="yyyy.MM.dd"/>
					    </td>
					    <td>
							<c:out value="${row.CHN_DTL_FEE }" />
					    </td>
					    <td>
					    	<c:out value="${row.CHN_DTL_USE_YN eq 'Y' ? '사용' : '미사용' }"/>
					    </td>
					</tr>
			    	</c:forEach>
			    </c:when>
			    <c:otherwise>
					<tr>
						<td colspan="5">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
					</tr>
			    </c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<form id="frm" name="frm">
	    <input type="hidden" name="BNR_MST_IDX" value="" />
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/> 
		<input type="hidden" name="searchBnrMstTitle" value="<c:out value="${commandMap.searchBnrMstTitle }"/>"/>
		<input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
		<input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
		<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
		<input type="hidden" name="searchBnrMstUseYn" value="<c:out value="${commandMap.searchBnrMstUseYn }"/>"/>
        <input type="hidden" id="CMN_COM_IDX" name="CMN_COM_IDX" value="<c:out value="${commandMap.CMN_COM_IDX }"/>" />
        <input type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV" value="<c:out value="${commandMap.PRD_CTG_ENV }"/>" />
        <input type="hidden" id="BNR_MST_GBN" name="BNR_MST_GBN" value="<c:out value="${bnrCatList[0].CMN_COM_ETC1 }"/>" />
       
        <input type="hidden" id="searchGubun" name="searchGubun" value="<c:out value="${commandMap.searchGubun }"/>" />
        
    </form>
</div><!-- // contents-inner -->
<script type="text/javascript">
function goRegistDtl(){
	
	var CHN_MST_IDX = $("#CHN_MST_IDX").val();
	popup("<c:out value="${serverDomain}" />/am/marketing/registChannelDtlPopup.do?CHN_MST_IDX="+CHN_MST_IDX, "1000", "750", "yes", "registChannelDtlPopup");
    
}

function goView(CHN_DTL_CD){
	var CHN_MST_IDX = $("#CHN_MST_IDX").val();
    popup("<c:out value="${serverDomain}" />/am/marketing/modifyChannelDtlPopup.do?CHN_DTL_CD="+CHN_DTL_CD+"&CHN_MST_IDX="+CHN_MST_IDX, "1000", "750", "yes", "registChannelDtlPopup");
    
}
 

</script>