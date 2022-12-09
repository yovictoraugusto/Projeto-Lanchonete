<%@page import="modelo.Unidade"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOUnidade"%>

<%
DAOUnidade daoUnidade = new DAOUnidade();
List<Unidade> listaUnidade = daoUnidade.consultar();
%>

<table border=1 class="listaCorpo">
    <th>CODUNIDADE</th>
    <th>NOME</th>
    <%for (Unidade unidade : listaUnidade){%>
    <tr>
        <td><%= unidade.getCodUnidade()%></td>
        <td><%= unidade.getNome()%>
        <td><a href="CadastroUnidade.jsp?opcao=alterar&codUnidade=<%=unidade.getCodUnidade()%>&nome=<%=unidade.getNome()%>">Alterar</a></td>
        <td><a href="CadastroUnidade.jsp?opcao=excluir&codUnidade=<%=unidade.getCodUnidade()%>&nome=<%=unidade.getNome()%>">Excluir</a></td>
    </tr>
    <%}%>
</table>