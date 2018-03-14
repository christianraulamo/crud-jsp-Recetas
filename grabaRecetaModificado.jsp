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

        <title>Receta</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/recetas", "root", "");
            Statement s = conexion.createStatement();

            request.setCharacterEncoding("UTF-8");

            String actualizacion = "UPDATE recetas SET "
                    + "nombre='" + request.getParameter("nombre")
                    + "', TiempoPrep=" + Integer.valueOf(request.getParameter("TiempoPrep"))
                    + ", NumPorc=" + Integer.valueOf(request.getParameter("NumPorc"))
                    + ", IdCate=" + Integer.valueOf(request.getParameter("IdCate"))
                    + ", InstruccionRec='" + request.getParameter("InstruccionRec")
                    + "' WHERE IdRec=" + Integer.valueOf(request.getParameter("IdRec"));
            s.execute(actualizacion);
            out.println("Receta actualizado correctamente.");

            conexion.close();
        %>
        <br>
        <a href="index.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Página principal</button>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</body>
</html>