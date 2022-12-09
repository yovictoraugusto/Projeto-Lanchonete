<%@page import="modelo.*"%>
<%@page import="java.util.List"%>

<%
DAOEntrega daoEntrega = new DAOEntrega();
List<Entrega> listaEntrega = daoEntrega.consultar();
%>

<table border="1" class="listaCorpo">
    <thead>
        <tr>
            <th>CÓDIGO ENTREGA</th>
            <th>VALOR</th>
            <th>VENDA</th>
            <th>CLIENTE</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <%for(Entrega entrega:listaEntrega){%>
        <tr>
            <td><%=entrega.getCodEntrega()%></td>
            <td><%=entrega.getValor()%></td>
            <td><%=entrega.getVenda().getCodVenda()%></td>
            <td><%=entrega.getCliente().getNome()%></td>
            <td><a href="CadastroEntrega.jsp?opcao=alterar&codEntrega=<%=entrega.getCodEntrega()%>&valor=<%=entrega.getValor()%>&codigoVenda=<%=entrega.getVenda().getCodVenda()%>&codigoCliente=<%=entrega.getCliente().getCodCliente()%>&mensagem=Altere os dados e clique no botão alterar">Alterar</a></td>
            <td><a href="CadastroEntrega.jsp?opcao=excluir&codEntrega=<%=entrega.getCodEntrega()%>&valor=<%=entrega.getValor()%>&codigoVenda=<%=entrega.getVenda().getCodVenda()%>&codigoCliente=<%=entrega.getCliente().getCodCliente()%>&mensagem=Exclua os dados no botão excluir">Excluir</a></td>

        </tr>
        <%}%>
    </tbody>
</table>