<%@page contentType="text/html" pageEncoding="UTF-8" session="false" autoFlush="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" >
<script language="javascript">
function noBack() { 
window.history.forward();
}
</script>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); 
request.getSession().invalidate();
response.sendRedirect("index.jsp");
%>
</body>
</html>