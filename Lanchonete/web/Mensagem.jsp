<%@ page contentType="text/html" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
    <head>
        <title>Página Principal</title>



 

        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

        <link href="conf/estilo.css" rel="stylesheet" type="text/css">
    </head>

    <%
                String mensagem =request.getParameter("mensagem");
        %>

    <body bgcolor="#000000">
    



 <form action=""  name="cadastro" method="get">

<table width="1001" border="0" align="center" cellspacing="0" class="tamanhotab">
        <tr bgcolor="#D0D9D0">
          <th width="995" bgcolor="#CCCCCC" scope="col"><p>&nbsp;</p>
            <table width="60%" border="0" align="center" cellpadding="4" cellspacing="0">
              <tr>
                <th bgcolor="#FFFFFF" scope="col"><h2>&nbsp;</h2></th>
                <th align="center" bgcolor="#FFFFFF" scope="col"><h2>&nbsp;</h2></th>
              </tr>
              <tr>
                <th colspan="2" align="left" bgcolor="#FFFFFF" scope="row"><h1><%= mensagem %></h1>
<p>&nbsp;</p></th>
              </tr>
              <tr>
                <th colspan="2" align="left" bgcolor="#FFFFFF" scope="row"><p>&nbsp;</p>
<p>&nbsp;</p></th>
              </tr>
            </table>
          <p>&nbsp;</p></th>
      </tr></table>

</form>
</body>
     
</html>




