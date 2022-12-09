<%@page import="modelo.Marca"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOMarca"%>

<%
DAOMarca daoMarca = new DAOMarca();
List<Marca> listaMarca = daoMarca.consultar();
%>

<table border=1 class="listaCorpo">
    <th>CODMARCA</th>
    <th>NOME</th>
    <%for (Marca marca : listaMarca){%>
    <tr>
        <td><%= marca.getCodMarca()%></td>
        <td><%= marca.getNome()%>
        <td><a href="CadastroMarca.jsp?opcao=alterar&codMarca=<%=marca.getCodMarca()%>&nome=<%=marca.getNome()%>">Alterar</a></td>
        <td><a href="CadastroMarca.jsp?opcao=excluir&codMarca=<%=marca.getCodMarca()%>&nome=<%=marca.getNome()%>">Excluir</a></td>
    </tr>
    <%}%>
</table>