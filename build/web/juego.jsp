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
        <%
            session.setAttribute("tamanio", Integer.parseInt(request.getParameter("tam")));
            Tablero ta = new Tablero(Integer.parseInt(String.valueOf(session.getAttribute("tamanio"))));
            session.setAttribute("tablero", ta);

            if (session.getAttribute("tablero") != null) {
                ta.generarTablero();
                for (int i = 0; i < ta.length(); i++) {
        %>
        <form name="formu" method="POST" action="juego.jsp">
            
            <input type="submit" name="boton" value="<%=i%>">
            <%}
            session.setAttribute("manotazo", request.getParameter("boton"));

            out.print(session.getAttribute("manotazo"));
            %>
        </form>
        <%} else if(session.getAttribute("tablero") == null){
                    ta.generarTablero();
                    for (int i = 0; i < ta.length(); i++) {%>
                     <form name="formu" method="POST" action="juego.jsp">
            
            <input type="submit" name="boton" value="<%=i%>">
            <%}
            session.setAttribute("manotazo", request.getParameter("boton"));

            out.print(session.getAttribute("manotazo"));
}%>
    </body>
</html>
