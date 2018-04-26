<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" crossorigin="anonymous"></script>

        <title>Receta</title>
    </head>
    <body>
        <% request.setCharacterEncoding("UTF-8");%>
        <div class="container">
            <br><br>
            <div class="panel panel-info">
                <div class="panel-heading text-center">Modificación de receta</div>
                <form method="get" action="grabaRecetaModificado.jsp">
                    <div class="form-group" style="display: none;">
                        <label>&nbsp;&nbsp;Codigo:&nbsp;</label><input type="text" size="20" name="IdRec" value="<%= request.getParameter("IdRec")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Nombre:&nbsp;</label><input type="text" size="20" name="nombre" value="<%= request.getParameter("nombre")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Tiempo de preparación (en min):&nbsp;</label><input type="text" size="10" name="TiempoPrep" value="<%= request.getParameter("TiempoPrep")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Nº de porciones:&nbsp;</label><input type="text" size="5" name="NumPorc" value="<%= request.getParameter("NumPorc")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Categoría:&nbsp;</label><select name="IdCate" multiple="multiple">
                                    <option value="1">Carne</option>
                                    <option value="2">Pescado</option>
                                    <option value="3">Salsas</option>
                                    <option value="4">Vegetales</option>
                                    <option value="5">Aperitivos</option>
                                    <option value="6">Aves</option>
                                    <option value="7">Arroz</option>
                                    <option value="8">Legumbres</option>
                                    <option value="9">Postres</option>
                                    <option value="10">Sopa</option>
                                    <option value="11">Pasta</option>
                                </select>
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Elaboración:&nbsp;</label><input type="text" size="100" name="InstruccionRec" value="<%= request.getParameter("InstruccionRec")%>">
                    </div>
                    <div class="form-group">
                        <label>&nbsp;&nbsp;Ingredientes:&nbsp;</label><input type="text" size="100" name="Ingredientes" value="<%= request.getParameter("Ingredientes")%>">
                    </div>
                    <hr>
                    &nbsp;&nbsp;<a href="listaReceta.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
                    <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
                </form>

            </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
