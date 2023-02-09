<%-- 
    Document   : ServiceClient
    Created on : 31 janv. 2023, 21:20:33
    Author     : TERRAQUE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
        <form action="AjoutFacture" method="POST">
            <select name="idclient">
                <option value="">choisir client</option>
                <option value="1">hardi</option>
                 <option value="2">tojo</option>
                  <option value="3">aina</option>
            </select>
            <input type="submit" value="ok">
        </form>
    </body>
</html>
