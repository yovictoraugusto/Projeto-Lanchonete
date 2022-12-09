<%@page import="modelo.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelo.DAOUsuario"%>
<%@include file="Menu.jsp" %>
<%
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    DAOUsuario login = new DAOUsuario();
    Usuario usuario = new Usuario();
    usuario.setEmail(email);
  
    ResultSet rs = login.getLogin(usuario);
    
    if (!rs.next()) {
        response.sendRedirect("index.jsp?mensagem=Login invalido");
    } else {
        String senhaBD = rs.getString("senha");
        String nomeBD = rs.getString("nome");
        String codigoIDUsuarioBD = rs.getString("idusuario");
        if (!senha.equals(senhaBD)) {
            response.sendRedirect("index.jsp?mensagem=Senha invalida");
        } else {
            session.setAttribute("email", email);
            session.setAttribute("nome", nomeBD);
            session.setAttribute("codigoUsuario", codigoIDUsuarioBD);
        }
    }
   
%>

<html>
    <head>
        <title>Página Principal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
        
    </head>
    <body >
       

        <div class="mensagem">
        <table width="700"  border="0" align="center" cellspacing="0" >
            <tr bgcolor="#ff9900">
                <th width="995" bgcolor="#ff9900" scope="col"><p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>

                    <table border="0" cellpadding="0" cellspacing="0" align="center" width="700" bordercolor="#ff9900">
                        <tr bordercolor="#FFFFFF">

                            <td colspan="2" valign="top" bgcolor="#ff9900">&nbsp;</td>
                        </tr>
                        <tr>

                            <th align="LEFT" width="11%" bordercolor="#FFFFFF">


                                <div align="left"><font face="verdana" size="1"> </font></div>
                            </th>

                            <th align="LEFT" bordercolor="#FFFFFF" width="89%">
                                <p>&nbsp;</p>
                                <p><b><font color="#990000">* </font></b>
                                    Voc&ecirc; esta logado! </p>
                                <p><br>
                                    <font color="#990000"></font><font color="#990000"></font>* Para
                                    sua seguran&ccedil;a, efetue seu logof sempre que voc&ecirc; sair do nosso
                                    site, para isso clique no link localizado na barra logo acima</p>
                                <p>Em caso de d&uacute;vida, entre em contato pelo e-mail: lanchonetetop@gmail.com<br>
                                    <br>
                                </p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p></th>
                        </tr>
                    </table>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
        </table>
        </div>
        <%@include file="footer.jsp" %>
    </body>
 
</html>


