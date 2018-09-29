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
    // formacion de casillas elegidas por el usuario
    String celdas = request.getParameter("casillas");

    // este numero se pierde cuando el usuario refresca la pagina
    if (celdas == null) {
        // usar el valor de casillas de la sesion si existe
        celdas = session.getAttribute("casillas") + "";

        // redirigir usuario para que ponga el numero de casillas si la sesion no contiene el atributo "casillas"
        if (celdas == null) {
            response.sendRedirect("/JSP-master");
        }
    }

    // convertir seleccion a entero
    int casillas = Integer.parseInt(celdas);

    // guardar el numero de casillas en sesion una vez conocido.
    // De esta manera se puede recargar la pagina sin perder las casillas.
    session.setAttribute("casillas", casillas);

    // construir formacion
    Tablero tablero = new Tablero(casillas);
    
    // mostar el array con la mosca (debugging only)
    char [] t = tablero.obtenerTablero();
    for (int j = 0; j < t.length; j++) {
        out.print("[" + t[j] + "]");
    }
    %>
        
    <h4>En cual de estas <%= casillas %> casillas est&aacute; la mosca?<h4>
    <div class="py-4">
        <form>
            
    <%  
        for (int i = 0; i < tablero.obtenerTablero().length; i++) {
    %>
            <input type="submit" name="boton" class="casilla btn btn-lg btn-primary mb-1" value="Celda <%= i + 1 %>">
    <%
        }
    %>
        </form>
    </div>
        
    <%
        String boton = request.getParameter("boton");
        out.print("boton " + boton);    
    %>
        
    <ul class="list-group">
        <li class="list-group-item">Necesita que no cambie le mosca de posicion.</li>
        <li class="list-group-item">El boton (String) y botonMosca (int) tienen que ser del mismo tipo.</li>
        <li class="list-group-item">Producir errores para evitar que el programa se muera.</li>
    </ul>
</div>

<%@ include file="includes/footer.jsp" %>

