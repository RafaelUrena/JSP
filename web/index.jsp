<%-- 
    Document   : index
    Created on : 25-sep-2018, 14:01:09
    Author     : rafa
--%>

<%@ include file="includes/header.jsp" %>

<div class="container text-center">
    <h1 class="mb-5">La Moscarda</h1>
    <form method="POST" action="juego.jsp">
        <div class="form-row justify-content-center">
            <div class="card col-md-4 p-4">
                <h3>Formaci&oacute;n</h3>
                <input id="casillas" type="number" name="casillas" min="3" max="100" class="form-control" placeholder="N&uacute;mero de Casillas">
                <button class="btn btn-primary btn-block mt-2" type="submit">Crear</button>
            </div>
        </div>
    </form>
</div>

<%@ include file="includes/footer.jsp" %>