<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>title</title></head>
<body>
<script type="text/javascript">
    alert("<c:out value="${exception.message}"/>");
    history.go(-1);
</script>
</body>
</html>
