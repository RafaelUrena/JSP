<%-- 
    Document   : juego
    Created on : 25-sep-2018, 19:20:26
    Author     : rafa
--%>

<%@page import="clases.Tablero"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <h3>Encontrar la mosca</h3>
            <form method="POST">
            <%
                String celdas = request.getParameter("casillas");
                
                if (celdas == null) {
                    // usar el valor en la sesion
                    celdas = session.getAttribute("casillas") + "";
                    out.print("celdas: " + celdas);
                } 
                
                int casillas = Integer.parseInt(celdas);
                
                out.print("casillas: " + casillas);
                
                //String casillas = request.getParameter("casillas");
//                try {
                    // genera una excepcion si el valor es nulo (no se hace nada)
//                    int casillas = Integer.parseInt(request.getParameter("casillas"));
             
                    // guardar el numero de casillas en sesion una vez conocido
//                    session.setAttribute("casillas", casillas);
//                    casillas = (int) session.getAttribute("casillas");
//                    out.print("SESSION: " + session.getAttribute("casillas"));
                    
                    // situar la mosca en un boton al azar
                    int botonMosca = (int) (Math.random() * casillas);
                    
                    out.print("<p>Casillas: " + casillas + "</p>");
                    out.print("<p>Mosca: " + botonMosca + "</p>");
                    
                    // generar numero de casillas (botones)
                    for (int i = 0; i < casillas; i++) { 
                %>
                        <input type="submit" name="boton" value="<%= i + 1 %>">
                <%
                    }

                    String boton = request.getParameter("boton");

                    if (boton != null) {
                        out.print("<p>Boton " + boton + " presionado.</p>");
                        out.print("<p>Mosca " + botonMosca);
                        if (boton.equals(botonMosca)) {
                            out.print("<p>Mosca espachurrada</p>");
                        }
                    }
//                    if (request.getParameter("boton") != null) {
//                        out.print("boton 1 clicked");
//                        if ("Boton 1".equals(boton)) {
//                        }
//                    }
//                } catch (NumberFormatException e) {
//                    out.print("Error");
//                }
            %>
            </form>
            <ol>
                <li>Necesita que no cambie le mosca de posicion.</li>
                <li>El boton (String) y botonMosca (int) tienen que ser del mismo tipo.</li>
                <li>Producir errores para evitar que el programa se muera.</li>
            </ol>
        </div>
    </body>
</html>
