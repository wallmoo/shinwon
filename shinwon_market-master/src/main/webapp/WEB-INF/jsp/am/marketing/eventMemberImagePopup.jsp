<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="popup">

<header><!-- header -->
	<h1 class="title"><c:out value="${info.EVT_MST_NM }" /> - <c:out value="${info.EVT_IMG_REG_NM }" />(<c:out value="${info.EVT_IMG_REG_ID }" />)님 등록 내용</h1>
	<a href="javascript:self.close();" class="close"><i class="icon-remove"></i> <span class="sr-only">닫기</span></a>
</header><!-- // header -->

<div id="container">

	<div id="contents">
		<div class="section-form"><!-- section-form-a -->
			<div class="form-group">
				<label class="label"><span>응모일</span></label>
				<div class="field"> 
					<b><ui:formatDate value="${info.EVT_IMG_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></b>
				</div>
			</div>
			<div class="form-group">
				<label class="label"><span>제목</span></label>
				<div class="field"> 
					<c:out value="${info.EVT_IMG_NM }" />
				</div>
			</div>
			<div class="form-group">
				<label class="label"><span>내용</span></label>
				<div class="field"> 
					<c:out value="${info.EVT_IMG_CTS }" />
				</div>
			</div>
			<div class="form-group">
				<label class="label"><span>첨부파일</span></label>
				<div class="field"> 
					<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
					<img src="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" />
					</c:forEach>
				</div>
			</div>
		</div>
		 
	</div>

</div><!-- // container -->




<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script>
//<![CDATA[
$(document).ready(function () {
	 
    
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});    
});
//]]>
</script>
</body>
</html>
