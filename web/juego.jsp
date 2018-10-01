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
        if (session.getAttribute("casillas") != null) {
            celdas = session.getAttribute("casillas").toString();
        } else {
            // redirigir usuario para que ponga el numero de casillas si la sesion no contiene el atributo "casillas"
            response.sendRedirect(baseURL);
        }
    }
    
    int fallos = 0;
    int casillas = 0;
    
    try {
        // convertir seleccion a entero
        casillas = Integer.parseInt(celdas); 
    } catch (Exception e) {
        out.print("error!");
    }
        
    // construir fila de celdas
    Tablero tablero = new Tablero(casillas);
  
    // guardar el numero de casillas en sesion una vez conocido.
    // De esta manera se puede recargar la pagina sin perder las casillas.
    session.setAttribute("casillas", casillas);
    
    if (session.getAttribute("moscaCelda") == null) {
        out.print("<h3>Nuevo Juego</h3>");
        
        // + 1 por que los botones no empiezan en zero.
        int moscaCelda = tablero.situarMosca() + 1;
        
        // situar mosca en sesion en una celda al azar
        session.setAttribute("moscaCelda", moscaCelda);
//        out.print("<p>la mosca esta en la casilla " + moscaCelda + "</p>");
        
        out.print(tablero.mostrar());
    } else {
        boolean ganador = false;
        String boton = request.getParameter("boton");

        if (boton != null) {
            String botonValue = boton.replaceAll("[\\s\\D]+", "");
            
            int manotazo = Integer.parseInt(botonValue.toString()) - 1;
            
            if (tablero.matarMosca(manotazo)) {
                // mostrarle al usuario cuantos manotazos han sido necesarios para matar la mosca
                int manotazos = 1;
                if (session.getAttribute("fallos") != null) {
                    manotazos = Integer.parseInt(session.getAttribute("fallos").toString());
                }
                
                String mensaje = "Has matado la mosca de " + manotazos + " manotazo" + (manotazos > 1 ? "s" : "");                
                out.print("<h3>" + mensaje + "</h3>");
                out.print("<div class=\"mosca\"></div>");
                out.print("<a class='btn btn-primary btn-lg mt-3' href='" + baseURL + "'>Jugar otra vez</a>");

                ganador = true;

                // destroy session
                session.invalidate();
            } else {
                // inicializar fallos
                if (session.getAttribute("fallos") == null) {
                    fallos = 1;
                    session.setAttribute("fallos", 1);
                } else {
                    fallos += (Integer) session.getAttribute("fallos") + 1;
                    session.setAttribute("fallos", fallos);
                }
                
                // mostrar al usuario el numero de veces que ha fallado
                if (fallos > 0) {
                    String mensaje = "Te has equivocado " + fallos + " ve" + (fallos > 1 ? "ces" : "z");
                    out.print("<h3>" + mensaje + "</h3>");
                }
                
                // mostrar al usuario que la mosca se ha movido de casilla
                if (tablero.haRevoloteado()) {
                    out.print("<h3>Has espatado a la mosca al tocar la casilla " + botonValue + "</h3>");
                }
            }
        }
        
        if (!ganador) {
            out.print(tablero.mostrar());
        }
    }
    %>
</div>

<%@ include file="includes/footer.jsp" %>
