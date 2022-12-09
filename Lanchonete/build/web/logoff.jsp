<HTML>
<HEAD>
</HEAD>
 <%
  session.invalidate();
  response.sendRedirect("index.jsp?mensagem=logoff efetuado com sucesso!");
%>
</HTML>