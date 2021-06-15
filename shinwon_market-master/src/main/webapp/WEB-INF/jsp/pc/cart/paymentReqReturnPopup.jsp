<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
setLGDResult();
function setLGDResult()
{
    try
    {
        var LGD_RESPCODE = "<c:out value="${commandMap.LGD_RESPCODE }"/>";
        var LGD_RESPMSG = "<c:out value="${commandMap.LGD_RESPMSG }"/>";
        var LGD_PAYKEY = "<c:out value="${commandMap.LGD_PAYKEY }"/>";

        parent.payment_return(LGD_RESPCODE, LGD_RESPMSG, LGD_PAYKEY);
    }
    catch(e)
    {
        alert(e.message);
    }
}
</script>
</head>
<body>
</body>
</html>