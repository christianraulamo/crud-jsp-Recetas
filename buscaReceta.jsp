<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Materialize -->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <title>Gestibank</title>
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3399/recetas","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");

      ResultSet listado = s.executeQuery ("SELECT COUNT(*) FROM recetas WHERE nombre LIKE '%" + request.getParameter("nombre") + "%'");
      listado.next();
      int coincidencias = listado.getInt(1);

      // Si no se encuentra ningúna receta con el nombre especificado,
      // volvemos a la página principal.
      if (coincidencias == 0) {
        out.println("<script>document.location = \"index.jsp\"</script>");
      }

      ResultSet listado2 = s.executeQuery ("SELECT * FROM recetas WHERE nombre LIKE '%" + request.getParameter("nombre") + "%'");

      // Si hay una única receta con el nombre especificado, vamos directamente
      // a la página de detalle.
      if (coincidencias == 1) {
        listado2.next();
        out.println("<script>document.location = \"detalleReceta.jsp?IdRec=" + listado2.getInt("IdRec") + "\"</script>");
      }

      // Si hay varias recetas cuyos nombres coinciden con el patrón buscado,
      // se muestran todos esos nombres para que el usuario elija.
      if (coincidencias > 1) {
        %>
          <div class="container">
            <div class="row"></div>
            <div class="row">
              <div class="col s3 m3 l3">&nbsp;</div>
              <div class="col s6 m6 l6">
                <div class="card grey lighten-5">
                  <h3 class="center">R E C E T A S</h3>
                  <table class="bordered centered responsive-table">
                  <thead><th>Nombre</th><th></th></thead>
                  <%
                  while (listado2.next()) {
                    %>
                    <tr>
                      <td><%=listado2.getString("nombre") %></td>
                      <form method="post" action="detalleReceta.jsp">
                        <input type="hidden" name="IdRec" value="<%=listado2.getString("IdRec") %>">
                        <td>
                        <button class="btn waves-effect waves-light center purple lighten-2" type="submit" name="editar">
                          <i class="fa fa-plus-circle"></i> Detalle
                        </button>
                        </td>
                      </form>
                    </tr>
                    <%
                  } // while
                  %>
                </table>
              </div>
            </div>
            <div class="col s3 m3 l3"></div>
      <%
      } // if

      conexion.close();
    %>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <!-- Materialize -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
  </body>
</html>
