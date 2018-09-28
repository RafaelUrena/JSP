<%-- 
    Document   : index
    Created on : 25-sep-2018, 14:01:09
    Author     : rafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>La Mosca</title>
    </head>
    <body>
        <h1>La mosca</h1>
        <div>
            <%
                out.print("<p>valor de casillas en session: " + session.getAttribute("casillas") + "</p>"); 
            %>
            <form name="main-form" action="juego.jsp" method="POST">
                <h3>Tamaño del tablero</h3>
                <p>N&uacute;mero de casillas: <input type="number" name="casillas" value="1" min-value="1"></p>
                <input type="submit" value="Generar"> 
            </form>
        </div>
    </body>
</html>
