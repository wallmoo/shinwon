<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
</head>
<script>
    var hostName = location.hostname; 
    
    if(hostName.indexOf("pc.") > -1){
        location.href = "/pc/main/index.do";
    }else if(hostName.indexOf("mobile.") > -1){
        location.href = "/mobile/main/index.do";
    }else{
    	location.href = "/pc/main/index.do";
    }
</script>
<body>
</body>
</html>