<%-- 
    Document   : juego
    Created on : 25-sep-2018, 19:20:26
    Author     : rafa
--%>

<%@page import="clases.Tablero"%>

<%@ include file="includes/header.jsp" %>

<div class="container text-center">
    <h1 class="mb-5">Encontrar la Mosca</h1>
    
    <%
        String celdas = request.getParameter("casillas");

        if (celdas == null) {
            // usar el valor de casillas de la sesion si existe
            celdas = session.getAttribute("casillas") + "";
            
            // redirigir usuario para que ponga el numero de casillas si la sesion no contiene el atributo "casillas"
            if (celdas == null) {
                response.sendRedirect("/JSP-master");
            }
        }

        // convertir a entero
        int casillas = Integer.parseInt(celdas);

        // guardar el numero de casillas en sesion una vez conocido
        session.setAttribute("casillas", casillas);
        
        // construir formacion
        Tablero tablero = new Tablero(casillas);
        out.print(tablero.generarTablero());
        
        out.print("Construir formaci&oacute;n con " + casillas + " casillas.");
    %>
    
    <ul class="list-group">
        <li class="list-group-item">Necesita que no cambie le mosca de posicion.</li>
        <li class="list-group-item">El boton (String) y botonMosca (int) tienen que ser del mismo tipo.</li>
        <li class="list-group-item">Producir errores para evitar que el programa se muera.</li>
    </ul>
</div>

<%@ include file="includes/footer.jsp" %>

