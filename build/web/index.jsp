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
        <title>Mosca</title>
    </head>
    <body>
        <h1>La mosca</h1>
        <div class="tamanio" style="border: 3px black dotted; width: 20%;">
        <form name="formu" method="POST" action="juego.jsp">
            <label>Tamaño del tablero</label>
            <p>Ponga el tamaño: <input type="number" name="tam" value=""></p>
            <input type="submit" name="aceptar" value="Aceptar"> 
        </form>
        </div>
    </body>
</html>
