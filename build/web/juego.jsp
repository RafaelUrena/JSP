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

    // formacion de casillas elegidas por el usuario
    String celdas = request.getParameter("casillas");
   
    // este numero se pierde cuando el usuario refresca la pagina
    if (celdas == null) {
        // usar el valor de casillas de la sesion si existe
        celdas = session.getAttribute("casillas") + "";

        // redirigir usuario para que ponga el numero de casillas si la sesion no contiene el atributo "casillas"
        if (celdas == null) {
            response.sendRedirect(baseURL);
        }
    }
    
    int fallos = 0;
    
    // convertir seleccion a entero
    int casillas = Integer.parseInt(celdas);
        
    // construir fila de celdas
    Tablero tablero = new Tablero(casillas);
  
    // guardar el numero de casillas en sesion una vez conocido.
    // De esta manera se puede recargar la pagina sin perder las casillas.
    session.setAttribute("casillas", casillas);
    
    if (session.getAttribute("moscaCelda") == null) {
        out.print("<h3>Nuevo Juego</h3>");
        
        // + 1 por que los botones no empiezan en zero.
        int situarMosca = tablero.situarMosca() + 1;
        
        // situar mosca en sesion en una celda al azar
        session.setAttribute("moscaCelda", situarMosca);
        out.print("<p>la mosca esta en la casilla " + situarMosca + "</p>");
        
        out.print(tablero.mostrar());
    } else {
        out.print("<p>la mosca esta en la casilla " + session.getAttribute("moscaCelda") + "</p>");
        
        boolean ganador = false;
        String boton = request.getParameter("boton");

        if (boton != null) {
            String botonValue = boton.replaceAll("[\\s\\D]+", "");
            String botonMosca = session.getAttribute("moscaCelda") + "";
            
            if (botonValue.equals(botonMosca)) {
                int manotazos = (Integer) session.getAttribute("fallos");
                String mensaje = "Has matado la mosca de " + manotazos + " manotazo" + (manotazos > 1 ? "s" : "");
                
                out.print("<h3>" + mensaje + "</h3>");
                out.print("<a class='btn btn-primary btn-lg mt-3' href='" + baseURL + "'>Jugar otra vez</a>");
                
                // destroy session
                session.invalidate();
                
                ganador = true;
                
            } else {
                out.print("<h3>Has fallado</h3>");
                if (session.getAttribute("fallos") == null) {
                    fallos = 1;
                    session.setAttribute("fallos", 1);
                } else {
                    out.print("here...");
                    fallos += (Integer) session.getAttribute("fallos") + 1;
                    session.setAttribute("fallos", fallos);
                }
            }
        }
        
        if (!ganador) {
            out.print(tablero.mostrar());
            
            if (fallos > 0) {
                out.print("<h4>" + fallos + "</h4>");
            }
        }
    }
    %>
    
    <hr>
    
    <h3>Errores</h3>
    <ul class="list-group">
        <li class="list-group-item">la mosca no debe cambiar de celda hasta que se haga clic en casilla adyacente.</li>
    </ul>
</div>

<%@ include file="includes/footer.jsp" %>

<%!
    public String test() {
        return "hello";
    }
%>