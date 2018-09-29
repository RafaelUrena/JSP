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
        String url = request.getRequestURL().toString();
        String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
    %>
    
    <a href="<%= baseURL %>">Inicio</a>
    
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
    int moscaCelda = -1;
    
    // mostar el array con la mosca (debugging only)
    char [] t = tablero.obtenerTablero();
    for (int j = 0; j < t.length; j++) {
        if (t[j] == 'M') {
            // j + 1 por que los botones no empiezan en 0
            moscaCelda = j + 1;
        }
        out.print("[" + t[j] + "]");
    }
    %>
        
    <h4>En cual de estas <%= casillas %> casillas est&aacute; la mosca?<h4>
    <div class="py-4">
        <form method="POST">
            
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

        if (boton != null) {
            String botonValue = boton.replaceAll("[\\s\\D]+", "");
            String botonMosca = moscaCelda + "";
            
            out.print("Has pulsado el boton " + botonValue + " y la mosca esta en el " + botonMosca);
            
            if (botonValue.equals(botonMosca)) {
                out.print("<h3>Has matado la moscarda!</h3>");
            } else {
                out.print("<h3>Has fallado!</h3>");
            }
        }
    %>
    
    <h3>Errores</h3>
    <ul class="list-group">
        <li class="list-group-item">la mosca no debe cambiar de celda hasta que se haga clic en casilla adyacente.</li>
        <li class="list-group-item">Evitar error de excepcion cuando se pasa un numero de celdas vacio.</li>
    </ul>
</div>

<%@ include file="includes/footer.jsp" %>

