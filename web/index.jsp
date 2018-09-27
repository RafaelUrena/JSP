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
            <form name="main-form" method="POST">
                <h3>Tamaño del tablero</h3>
                <p>N&uacute;mero de casillas: <input type="number" name="casillas" value="1" min-value="1"></p>
                <input type="submit" name="aceptar" value="Aceptar"> 
            </form>
        </div>
        <div>
            <h3>Encontrar la mosca</h3>
            <%
                //String casillas = request.getParameter("casillas");
                try {
                    int casillas = Integer.parseInt(request.getParameter("casillas"));
             
                    session.setAttribute("casillas", casillas);
                    
                    // situar la mosca en un boton
                    int botonMosca = (int) (Math.random() * casillas);
                    
                    out.print("<p>Casillas: " + casillas + "</p>");
                    out.print("<p>Mosca: " + botonMosca + "</p>");
                    
                    for (int i = 0; i < casillas; i++) { 
                %>
                        <input type="submit" name="boton-<%= i %>" value="Boton-<%= i + 1 %>">
                <%
                    }
                } catch (NumberFormatException e) {
                    out.print("Error");
                }
            %>
        </div>
    </body>
</html>
