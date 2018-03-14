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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"  crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"  crossorigin="anonymous"></script>

        <title>Recetas</title>
    </head>

    <body>
        <div class="container">
            <br><br>			
            <div class="panel panel-info">
                <div class="panel-heading text-center"><h2>R E C E T A S</h2></div>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/recetas", "root", "");
                    Statement s = conexion.createStatement();

                    ResultSet listado = s.executeQuery("SELECT * FROM recetas INNER JOIN categoria ON recetas.IdCate = categoria.IdCate");

                %>

                <table class="table table-striped">

                    <tr><th>Codigo</th><th>Nombre</th><th>Tiempo de preparación</th><th>Nº porciones</th><th>Categoría</th><th>Receta</th></tr>
                    <form method="get" action="grabaReceta.jsp">
                        <tr><td><input type="text" name="IdRec" size="3"></td>
                            <td><input type="text" name="nombre" size="30"></td>
                            <td><input type="text" name="TiempoPrep" size="15"></td>
                            <td><input type="text" name="NumPorc" size="20"></td>
                            <td><select name="IdCate" multiple="multiple">
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
                                </select></td>
                            <td><input type="text" name="InstruccionRec"/></td>
                            <td><button type="submit" value="Añadir" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-open"></span> Añadir</button></td><td></td></tr>           
                    </form>

                    <%            while (listado.next()) {
                            out.println("<tr><td>");
                            out.println(listado.getString("IdRec") + "</td>");
                            out.println("<td>" + listado.getString("nombre") + "</td>");
                            out.println("<td>" + listado.getString("TiempoPrep") + "</td>");
                            out.println("<td>" + listado.getString("NumPorc") + "</td>");
                            out.println("<td>" + listado.getString("NombreCate") + "</td>");
                    %>
                    <td>
                        <form method="get" action="modificaReceta.jsp">
                            <input type="hidden" name="IdRec" value="<%=listado.getString("IdRec")%>">
                            <input type="hidden" name="nombre" value="<%=listado.getString("nombre")%>">
                            <input type="hidden" name="TiempoPrep" value="<%=listado.getString("TiempoPrep")%>">
                            <input type="hidden" name="NumPorc" value="<%=listado.getString("NumPorc")%>">
                            <input type="hidden" name="IdCate" value="<%=listado.getString("IdCate")%>">
                            <input type="hidden" name="InstruccionRec" value="<%=listado.getString("InstruccionRec")%>">
                            <button type="submit"  class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Modificar</button>
                        </form>

                        <form method="get" action="detalleReceta.jsp">
                            <input type="hidden" name="IdRec" value="<%=listado.getString("IdRec")%>">
                            <input type="hidden" name="nombre" value="<%=listado.getString("nombre")%>">
                            <input type="hidden" name="TiempoPrep" value="<%=listado.getString("TiempoPrep")%>">
                            <input type="hidden" name="NumPorc" value="<%=listado.getString("NumPorc")%>">
                            <input type="hidden" name="IdCate" value="<%=listado.getString("IdCate")%>">
                            <input type="hidden" name="InstruccionRec" value="<%=listado.getString("InstruccionRec")%>">
                            <button type="submit"  class="btn btn-success"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                        </form>
                    </td>
                    <td>
                        <form method="get" action="borraReceta.jsp">
                            <input type="hidden" name="IdRec" value="<%=listado.getString("IdRec")%>"/>
                            <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                        </form>

                    </td></tr>
                    <%
                        } // while

                        conexion.close();
                    %>

                </table>
                <table>
                    <form method="post" action="buscaReceta.jsp">
                        <tr>
                            <th>Nombre de la receta</th>
                            <th>
                                <div class="input-field">
                                    <input type="text" name="nombre" id="buscaNombre">
                                    <label for="buscaNombre"></label>
                                </div>
                            </td>
                            <td>
                                <button class="btn btn-primary" type="submit" name="aceptar">
                                    <i class="glyphicon glyphicon-search"></i> Buscar
                                </button>
                            </td>
                        </tr>
                    </form>
                </table>
            </div>
            <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
            <script src="js/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
    </body>
</html>