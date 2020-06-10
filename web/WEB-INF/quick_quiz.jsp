<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <script src="js/jquery.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js" ></script>
    </head>
    <body>
        <script>
            function fun(x)
            {
                alert(""+x);
            }
        </script>
        <form>
            choose subject:
            <select name="op" onchange="fun(this.value)">
                <option>none</option>
                <option>html</option>
                <option>css</option>
                <option>javaScript</option>
            </select>
        </form>
    </body>
</html>
