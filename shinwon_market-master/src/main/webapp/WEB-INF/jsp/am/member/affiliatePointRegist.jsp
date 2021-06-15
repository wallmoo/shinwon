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

                    <h2 class="title"><span>제휴사E포인트지급관리</span></h2>

                    <h3 class="title" id="pageTitle"><span>등록</span></h3>
                    <p>
                       <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                    </p>
                    <form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
    						<input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
    				</form>
                    <form name="frm" id="frm" enctype="multipart/form-data">
                    <div class="section-form"><!-- section-form-a -->
                        <input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="" />
                        <input type="hidden" id="COC_IDX" class="text large">
    			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
    	                    <colgroup>
    	                        <col style="width: 15%;" />
    	                        <col style="width: auto;" />
    	                    </colgroup>
    	                    <tbody>
    	                    	<tr>
    	                    		<th><label class="label">제휴사<i class="require"><em>필수입력</em></i></label></th>
                                    <td>
    	                    			<input type="text" id="COC_NM" name="COC_NM" class="text large" placeholder="제휴사 선택" readonly>
    									<a href="javascript:window.open('/am/member/affiliateListPopup.do', '_blank', 'width=1000, height=600')" class="button button-c small"><span>제휴사 검색</span></a>
	                    	    	</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label">지급포인트<i class="require"><em>필수입력</em></i></label></th>
    	                    		<td>
                                        <input type="text " class="text large" name="COC_SPC_PRV_PT" id="COC_SPC_PRV_PT" value="" placeholder="숫자입력"> p
    	                    		</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label">스페셜개인코드</label></th>
    	                    		<td>
                                        <div class="grid section-button-list btn_many">
                                            <div class="col-1-2 text-left">
                                                <input type="text" class="text large mt10" id="COC_COUNT" name="COC_COUNT" name="COC_COUNT" readonly="">
                                                <a href="javascript:reqPointRegist()" class="button button-c small"><span>생성</span></a>
                                            </div>
                                            <div class="col-1-2 text-right">
                                                <a id="delButton" class="button button-c"><span>삭제</span></a>
                                            </div>
                                        </div>
                                        
                                        <table cellspacing="0" class="table-col table-b" ><!-- table -->
                    						<colgroup>
                    							<col style="width: 8%;" />
                    							<col style="width: 10%;" />
                    							<col style="width: 10%;" />
                    							<col style="width: 15%;" />
                    							<col style="width: 10%;" />
                    							<col style="width: 15%;" />
                    							<col style="width: 10%;" />
                    						</colgroup>
                    						<thead>
                    							<tr>
                                                    <th><input type="checkbox" class="checkbox checkAll" /></th>
                    								<th>NO</th>
                    								<th>스페셜개인코드</th>
                    								<th>지급포인트</th>
                    							</tr>
                    						</thead>
                    						<tbody id="pointTableContainer">
                    							
                							</tbody>
                    					</table>
    	                    		</td>
    	                        </tr>
                                <tr>
                                    <th><span>사용여부<i class="require"><em>필수입력</em></i></span></th>
    	                            <td>
                                        <ul class="form_radio_check_list">
        									<li>
                                                <input type="radio"	id="stateB" name="COC_USE_YN" class="radio" checked value="Y" />
        									    <label for="stateB">사용</label>
                                            </li>
                                            <li>
            									<input type="radio" id="stateC" name="COC_USE_YN" class="radio"  value="N" />
            									<label for="stateC">미사용</label>
                                            </li>
                                        </ul>
    	                            </td>
    	                        </tr>
    	                    </tbody>
                    	</table><!-- // table -->
                    </div>
                    </form>
                </div>

            </div><!-- // contents -->
            <div class="section-button">
                <div class="wrap text-center">
                    <a href="javascript:;" id="saveButton" class="button primary"><span>저장</span></a>
                </div>
            </div>
        </div><!-- // wrapper -->

        <div id="quickmenu" class="aside right"><!-- quickmenu-->
            <div class="holder"><!-- holder -->

                <div id="quick" class="container">

                    <div class="wrap modules"><!-- modules -->
                        <ul class="core">
                            <li class="d2 active">
                                <a href="javascript:;" class="d2"><span>admin 님</span></a>
                                <div class="d3 show"><!-- d3 -->
                                    <ul class="d3">
                                        <li class="d3">
                                            <a href="/am/manager/logout.do" class="d3"><span>로그아웃</span></a>
                                        </li>
                                    </ul>
                                </div><!-- // d3 -->
                            </li>
                        </ul>
                    </div><!-- // modules -->

                </div>

            </div><!-- // holder --></div><!-- // quickmenu -->

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
<input type="hidden" id="masterDetail" value="<c:out value="${masterDetail}"/>">
<input type="hidden" id="pointList" value="<c:out value="${pointList}"/>">
<input type="hidden" id="COC_SPC_LMT" value="">
<script>
var count = 0;
function clickAllCheckBox(){
	var flag = $(this).is(":checked");
	$('input[type=checkbox]').prop("checked", flag);
}
function callParent(idx){
	$.ajax({
		method:'POST',
		data: {COC_IDX:idx},
        url:'/am/member/affiliatePointDetailAjax.do',
        success:function(data){
        	renderMaster(data.masterDetail);
        	//renderPointList(data.pointList);
        	$('#COC_COUNT').removeAttr('readonly');
            console.log(data);
        }
    });
}
function reqPointRegist(){
	var idx = $('#COC_IDX').val();
	if(!idx){alert('제휴사를 선택해 주십시오.'); return; }
	var count = $('#COC_COUNT').val();
	if(!count){alert('수량을 입력하십시오.'); return; }
	var point = $('#COC_SPC_PRV_PT').val();
	if(!point){alert('포인트를 입력하십시오.'); return;}
	$.ajax({
		method:'POST',
		data: {COC_IDX:idx, COC_COUNT:count, COC_SPC_PRV_PT:point},
        url:'/am/member/affiliatePointRegistAjax.do',
        success:function(data){
        	renderPointList(data.list);
        	console.log(data);
        }
    });
}
function getAllAvailablePointData(activeFlag){
	var list = [];
	var pointList = $('#pointTableContainer').find('tr');
	for(var i=0;i<pointList.length;i++){
		var isActive = $(pointList[i]).find('input[type=checkbox]').is(":checked") || activeFlag;
		if(!isActive){continue;}
		var point = $(pointList[i]).find('input[type=text]');
		if(point.length==0){
			alert('이미 등록된 포인트는 회수 하실 수 없습니다.');
			continue;
		}
		point = point.val();
		
		var code = $(pointList[i]).find('input[type=checkbox]').val();
		var obj = {
				COC_SPC_PRV_CD:code,
				COC_SPC_PRV_PT:point,
		};
		list.push(obj);
	}
	return list;
}
function getAllActivePointData(){
	return getAllAvailablePointData(true);
}
function reqDeletePoint(){
	var list = getAllAvailablePointData();
	submit(list,'/am/member/affiliatePointDelete.do');
}
function reqSavePoint(){
	var list = getAllActivePointData();
	submit(list,'/am/member/affiliatePointModify.do');
}

function submit(dataList,url){
	  var form = document.createElement("form");
    form.setAttribute("method", "POST");  //Post 방식
    form.setAttribute("action", url); //요청 보낼 주소
    for(var i=0;i<dataList.length;i++){
  	  var code = document.createElement("input");
        code.setAttribute("type", "hidden");
        code.setAttribute("name", "COC_SPC_PRV_CD_LIST");
        code.setAttribute("value", dataList[i].COC_SPC_PRV_CD);
        
        var point = document.createElement("input");
        point.setAttribute("type", "hidden");
        point.setAttribute("name", "COC_SPC_PRV_PT_LIST");
        point.setAttribute("value", dataList[i].COC_SPC_PRV_PT);
        
        form.appendChild(code);
        form.appendChild(point);
        
    }
    var idx = document.createElement("input");
    idx.setAttribute("type", "hidden");
    idx.setAttribute("name", "COC_IDX");
    idx.setAttribute("value", $('#COC_IDX').val());
    form.appendChild(idx);
    document.body.appendChild(form);
    form.submit();
}
function renderMaster(masterData){
	$('#COC_IDX').val(masterData.COC_IDX);
	$('#COC_NM').val(masterData.COC_NM);
	$('#COC_SPC_LMT').val(masterData.COC_SPC_LMT);
	$('[name=COC_USE_YN][value='+masterData.COC_USE_YN+']').click();
}
function renderPointList(pointList){
	var container = $('#pointTableContainer');
	container.empty();
	for(var i=0;i<pointList.length;i++){
		//포인트에 p 들어가는거에 대해 
		var html = '<tr>'
	        +'<td><input type="checkbox" class="checkbox" value="'+pointList[i].COC_SPC_PRV_CD+'"></td>'
	        +'<td>'+(i+1)+'</td>'
	        +'<td>'+pointList[i].COC_SPC_PRV_CD+'</td>'
	        +'<td class="text-right"><input type="text" id="'+pointList[i].COC_SPC_PRV_CD+'" value="'+pointList[i].COC_SPC_PRV_PT+'"/></td>';
        html+='</tr>';
        container.append(html);
	}
}
function reqDelete(){
	var targetArray = [];
	var checkedCheckBox = $("input[type=checkbox]:checked");
	for(var i=0;i<checkedCheckBox.length;i++){
		targetArray.push($(checkedCheckBox[i]).val());
	}
}
function openMemberInfo(id){
	window.open('/am/member/infoMemberPopup.do?MEM_MST_MEM_ID='+id, '_blank', 'width=1000, height=600');
}
$(function(){
	$('.checkAll').click(clickAllCheckBox);
	$('#delButton').click(reqDeletePoint);
	$('#saveButton').click(reqSavePoint);
});

//입점업체 callback 함수
callParentEx = function(idx){
	$("#COC_IDX").val(idx);
	
};
//-->
</script>

</body>
</html>
