<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%
        try {
            String usuario = request.getParameter("usuario");
            String clave = request.getParameter("clave");
            out.println(usuario);
            out.println(clave);

            HashMap<String, String> m = new HashMap<String, String>();

            m.put("christian", "cocosamana1 27");
            m.put("jose", "1234");
            m.put("usuario", "usuario");
            
            
            if (m.get(usuario).equals(clave)) {
                response.sendRedirect("listaReceta.jsp?q=cambia");
                
            } else {
                response.sendRedirect("error.jsp?q=cambia");
            }
        } catch (Exception e) {
            response.sendRedirect("error.jsp?q=cambia");
        }
    %>
</body>
</html>
