<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"  crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"  crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <title>Recetas</title>
    </head>

    <body>

        <div class="container">
            <br><br>			
            <div class="panel panel-info">
                <div class="panel-heading text-center"><h2>Recetas</h2><br><h2>Identifiquese, porfavor</h2></div>
                <table class="table table-striped">
                    <form action="Validacion.jsp" method="get" accept-charset="utf-8" id="formulario" class="form-signin">
                        
                        <tr>
                            <th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th><th></th>
                            <th><input type="text" name="usuario" placeholder="Usuario" required autofocus value="">
                            <input type="password" name="clave" value=""  placeholder="Contraseña" required>
                           <input  class="btn btn-primary" type="submit" name="button" value="Acceder"></th></tr>
                    </form>
                </table>
                </body>

                </html>
