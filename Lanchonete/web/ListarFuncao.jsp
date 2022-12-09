<%@page import="modelo.Funcao"%>
<%@page import="java.util.List"%>
<%@page import="modelo.DAOFuncao"%>

<%
DAOFuncao daoFuncao = new DAOFuncao();
List<Funcao> listaFuncao = daoFuncao.consultar();
%>

<table border=1 class="listaCorpo">
    <th>CODFUNCAO</th>
    <th>NOME</th>
    <%for (Funcao funcao : listaFuncao){%>
    <tr>
        <td><%= funcao.getCodFuncao()%></td>
        <td><%= funcao.getNome()%>
        <td><a href="CadastroFuncao.jsp?opcao=alterar&codFuncao=<%=funcao.getCodFuncao()%>&nome=<%=funcao.getNome()%>">Alterar</a></td>
        <td><a href="CadastroFuncao.jsp?opcao=excluir&codFuncao=<%=funcao.getCodFuncao()%>&nome=<%=funcao.getNome()%>">Excluir</a></td>
    </tr>
    <%}%>
</table>